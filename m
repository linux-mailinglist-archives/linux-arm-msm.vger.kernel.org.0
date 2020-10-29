Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2A29229EAEE
	for <lists+linux-arm-msm@lfdr.de>; Thu, 29 Oct 2020 12:46:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725379AbgJ2LqP (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 29 Oct 2020 07:46:15 -0400
Received: from mail-02.mail-europe.com ([51.89.119.103]:40696 "EHLO
        mail-02.mail-europe.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725300AbgJ2LqO (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 29 Oct 2020 07:46:14 -0400
Date:   Thu, 29 Oct 2020 11:46:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
        s=protonmail; t=1603971969;
        bh=alx00HFOahz26wEg9HUXveVnPCsuP2rcMdupvsuByN4=;
        h=Date:To:From:Reply-To:Subject:From;
        b=xoOyS1VHc1b1nTAe+clCqTCruCpb4TpN/IEnRRwqyZHFgJfygnaz/HArb54nw+oLw
         ZCX6YWeJ9bBSW2gExKGMxPLtWw/6r1umKVm469wS0USAiGU8BY3DU59qxbWC5qO/ES
         NdRSJiywYmX4KC04UvR6fN292mKX0ZdaAFRxS9go=
To:     "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>,
        "linux-scsi@vger.kernel.org" <linux-scsi@vger.kernel.org>
From:   Yassine Oudjana <y.oudjana@protonmail.com>
Reply-To: Yassine Oudjana <y.oudjana@protonmail.com>
Subject: ufs: Unrecoverable UFSHCD_UIC_DL_TCx_REPLAY_ERROR after some write operations
Message-ID: <Ax8WZP5mKeS4D-elLrXw3AUz9iT7Dgfh-VVWbSOiypPXlS9KRr6GFXhrlf2v6QrhWeFtheX0gYhM-zGawalUidf1noc1gE-TvinLrKryibc=@protonmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-1.2 required=10.0 tests=ALL_TRUSTED,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM shortcircuit=no
        autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on
        mailout.protonmail.ch
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

I'm trying to get the mainline kernel working on a Xiaomi Mi Note 2 with MS=
M8996Pro and
Samsung KLUCG4J1CB-B0B1, but I'm getting UFSHCD_UIC_DL_TCx_REPLAY_ERROR aft=
er some write operations.

I'm not certain what kind of write is causing it, but it never happens when=
 root is set to be
mounted read-only, so I don't think it's reading that causes it. However, I=
 was able to write dmesg
without any errors by using an initramfs hook, except that is before I get =
the error.

As soon as it happens, it never recovers from it. It tries to reset, but it=
 just gets the error
again after resetting.

UFS reset isn't defined currently in the msm8996 device tree, so I defined =
it:

--- a/arch/arm64/boot/dts/qcom/msm8996.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8996.dtsi
@@ -1100,6 +1100,8 @@ ufshc: ufshc@624000 {

                        lanes-per-direction =3D <1>;
                        #reset-cells =3D <1>;
+                       resets =3D <&gcc GCC_UFS_BCR>;
+                       reset-names =3D "rst";
                        status =3D "disabled";

                        ufs_variant {

When I did that, PHY poweron started to fail (qcom_qmp_phy_power_on in the =
PHY driver was
timing out). I looked into the downstream kernel for this device, and found=
 out that it calibrates
the PHY while the reset is asserted. So I did this and was able to "fix"(?)=
 it:

--- a/drivers/scsi/ufs/ufs-qcom.c
+++ b/drivers/scsi/ufs/ufs-qcom.c
@@ -292,11 +294,9 @@ static int ufs_qcom_power_up_sequence(struct ufs_hba *=
hba)
        bool is_rate_B =3D (UFS_QCOM_LIMIT_HS_RATE =3D=3D PA_HS_MODE_B)
                                                        ? true : false;

-       /* Reset UFS Host Controller and PHY */
-       ret =3D ufs_qcom_host_reset(hba);
-       if (ret)
-               dev_warn(hba->dev, "%s: host reset returned %d\n",
-                                 __func__, ret);
+       ufs_qcom_assert_reset(hba);
+       /* provide 1ms delay to let the reset pulse propagate. */
+       usleep_range(1000, 1100);

        if (is_rate_B)
                phy_set_mode(phy, PHY_MODE_UFS_HS_B);
@@ -309,11 +309,19 @@ static int ufs_qcom_power_up_sequence(struct ufs_hba =
*hba)
                goto out;
        }

+       ufs_qcom_deassert_reset(hba);
+       /*
+        * after reset deassertion, phy will need all ref clocks,
+        * voltage, current to settle down before starting serdes.
+        */
+       usleep_range(1000, 1100);
+
        /* power on phy - start serdes and phy's power and clocks */
        ret =3D phy_power_on(phy);

Note that using reset_control_de/assert(host->core_reset) instead of ufs_qc=
om_de/assert_reset(hba)
didn't work. I thought it was only about the order of operations (PHY calib=
ration before deasserting
the reset), but it seems like there's more to it.

Now phy poweron succeeds again, but it still isn't able to recover from
UFSHCD_UIC_DL_TCx_REPLAY_ERROR when it happens.

I also found some differences in the PHY calibration tables in the downstre=
am kernel, so I changed
them here:

--- a/drivers/phy/qualcomm/phy-qcom-qmp.c
+++ b/drivers/phy/qualcomm/phy-qcom-qmp.c
@@ -461,22 +461,22 @@ static const struct qmp_phy_init_tbl msm8998_pcie_pcs=
_tbl[] =3D {
 static const struct qmp_phy_init_tbl msm8996_ufs_serdes_tbl[] =3D {
        QMP_PHY_INIT_CFG(QPHY_POWER_DOWN_CONTROL, 0x01),
        QMP_PHY_INIT_CFG(QSERDES_COM_CMN_CONFIG, 0x0e),
-       QMP_PHY_INIT_CFG(QSERDES_COM_SYSCLK_EN_SEL, 0xd7),
+       QMP_PHY_INIT_CFG(QSERDES_COM_SYSCLK_EN_SEL, 0x14),
        QMP_PHY_INIT_CFG(QSERDES_COM_CLK_SELECT, 0x30),
-       QMP_PHY_INIT_CFG(QSERDES_COM_SYS_CLK_CTRL, 0x06),
+       QMP_PHY_INIT_CFG(QSERDES_COM_SYS_CLK_CTRL, 0x02),
        QMP_PHY_INIT_CFG(QSERDES_COM_BIAS_EN_CLKBUFLR_EN, 0x08),
        QMP_PHY_INIT_CFG(QSERDES_COM_BG_TIMER, 0x0a),
-       QMP_PHY_INIT_CFG(QSERDES_COM_HSCLK_SEL, 0x05),
+       QMP_PHY_INIT_CFG(QSERDES_COM_HSCLK_SEL, 0x00),
        QMP_PHY_INIT_CFG(QSERDES_COM_CORECLK_DIV, 0x0a),
        QMP_PHY_INIT_CFG(QSERDES_COM_CORECLK_DIV_MODE1, 0x0a),
        QMP_PHY_INIT_CFG(QSERDES_COM_LOCK_CMP_EN, 0x01),
-       QMP_PHY_INIT_CFG(QSERDES_COM_VCO_TUNE_CTRL, 0x10),
+       QMP_PHY_INIT_CFG(QSERDES_COM_VCO_TUNE_CTRL, 0x00),
        QMP_PHY_INIT_CFG(QSERDES_COM_RESETSM_CNTRL, 0x20),
        QMP_PHY_INIT_CFG(QSERDES_COM_CORE_CLK_EN, 0x00),
        QMP_PHY_INIT_CFG(QSERDES_COM_LOCK_CMP_CFG, 0x00),
        QMP_PHY_INIT_CFG(QSERDES_COM_VCO_TUNE_TIMER1, 0xff),
        QMP_PHY_INIT_CFG(QSERDES_COM_VCO_TUNE_TIMER2, 0x3f),
-       QMP_PHY_INIT_CFG(QSERDES_COM_VCO_TUNE_MAP, 0x54),
+       QMP_PHY_INIT_CFG(QSERDES_COM_VCO_TUNE_MAP, 0x44),
        QMP_PHY_INIT_CFG(QSERDES_COM_SVS_MODE_CLK_SEL, 0x05),
        QMP_PHY_INIT_CFG(QSERDES_COM_DEC_START_MODE0, 0x82),
        QMP_PHY_INIT_CFG(QSERDES_COM_DIV_FRAC_START1_MODE0, 0x00),
@@ -510,21 +510,40 @@ static const struct qmp_phy_init_tbl msm8996_ufs_serd=
es_tbl[] =3D {

 static const struct qmp_phy_init_tbl msm8996_ufs_tx_tbl[] =3D {
        QMP_PHY_INIT_CFG(QSERDES_TX_HIGHZ_TRANSCEIVEREN_BIAS_DRVR_EN, 0x45)=
,
-       QMP_PHY_INIT_CFG(QSERDES_TX_LANE_MODE, 0x02),
+       QMP_PHY_INIT_CFG(QSERDES_TX_LANE_MODE, 0x06),
 };

 static const struct qmp_phy_init_tbl msm8996_ufs_rx_tbl[] =3D {
        QMP_PHY_INIT_CFG(QSERDES_RX_SIGDET_LVL, 0x24),
-       QMP_PHY_INIT_CFG(QSERDES_RX_SIGDET_CNTRL, 0x02),
-       QMP_PHY_INIT_CFG(QSERDES_RX_RX_INTERFACE_MODE, 0x00),
-       QMP_PHY_INIT_CFG(QSERDES_RX_SIGDET_DEGLITCH_CNTRL, 0x18),
-       QMP_PHY_INIT_CFG(QSERDES_RX_UCDR_FASTLOCK_FO_GAIN, 0x0B),
+       QMP_PHY_INIT_CFG(QSERDES_RX_SIGDET_CNTRL, 0x0f),
+       QMP_PHY_INIT_CFG(QSERDES_RX_RX_INTERFACE_MODE, 0x40),
+       QMP_PHY_INIT_CFG(QSERDES_RX_SIGDET_DEGLITCH_CNTRL, 0x1e),
+       QMP_PHY_INIT_CFG(QSERDES_RX_UCDR_FASTLOCK_FO_GAIN, 0x0b),
        QMP_PHY_INIT_CFG(QSERDES_RX_RX_TERM_BW, 0x5b),
        QMP_PHY_INIT_CFG(QSERDES_RX_RX_EQ_GAIN1_LSB, 0xff),
        QMP_PHY_INIT_CFG(QSERDES_RX_RX_EQ_GAIN1_MSB, 0x3f),
        QMP_PHY_INIT_CFG(QSERDES_RX_RX_EQ_GAIN2_LSB, 0xff),
-       QMP_PHY_INIT_CFG(QSERDES_RX_RX_EQ_GAIN2_MSB, 0x0f),
-       QMP_PHY_INIT_CFG(QSERDES_RX_RX_EQU_ADAPTOR_CNTRL2, 0x0E),
+       QMP_PHY_INIT_CFG(QSERDES_RX_RX_EQ_GAIN2_MSB, 0x3f),
+       QMP_PHY_INIT_CFG(QSERDES_RX_RX_EQU_ADAPTOR_CNTRL2, 0x0d),
};

That didn't change anything either.

I noticed that in downstream there are 3 slightly different calibration tab=
les for host versions
2.0.0, 2.1.0, and 2.2.0 which this device has.
Also, I noticed that QSERDES_COM_VCO_TUNE_MAP differs between rate A and B,=
 where it's set to 0x14
for rate A, and to 0x54 for rate B. This was done on mainline too until the=
 14nm-specific QMP PHY
driver and others were combined into one driver (phy-qcom-qmp.c), and after=
 then only the rate B
value 0x54 is used always.
Those aren't necessarily related to this issue, but I thought I'd mention t=
hem since I noticed them
on my way.

What else could be causing this?

Using the mainline tree at 4525c8781ec0701ce824e8bd379ae1b129e26568
