Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EC3013E1A46
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Aug 2021 19:20:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239104AbhHERUi (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 5 Aug 2021 13:20:38 -0400
Received: from mail-0201.mail-europe.com ([51.77.79.158]:53776 "EHLO
        mail-0201.mail-europe.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230107AbhHERUi (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 5 Aug 2021 13:20:38 -0400
Date:   Thu, 05 Aug 2021 17:19:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
        s=protonmail; t=1628183990;
        bh=Q0e3u15i1PAFg63iMP+b35YREVf5I1jWy7jkFOGimb8=;
        h=Date:To:From:Cc:Reply-To:Subject:From;
        b=ru/jpoHZaF0+zqT+SS4ttIG34OcfeGCHPEWs0dKerxQXDLOfUuaI2hp0WozBGeJKv
         dNzBf9gsqozxYPNyykBCvGQ3xPNikduz2Tcj2NY7X/6eiat+/pXlVpdkUSHnL9IFmd
         wyrbLFJ0ejNonKCSS5y0XE/A6i7/iKV3KstOVdMY=
To:     bjorn.andersson@linaro.org, sboyd@kernel.org
From:   Sireesh Kodali <sireeshkodali@protonmail.com>
Cc:     agross@kernel.org, mturquette@baylibre.com, robh+dt@kernel.org,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        phone-devel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht,
        Vladimir Lypak <junak.pub@gmail.com>,
        Adam Skladowski <a_skl39@protonmail.com>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Sireesh Kodali <sireeshkodali@protonmail.com>
Reply-To: Sireesh Kodali <sireeshkodali@protonmail.com>
Subject: [PATCH 2/2] clk: qcom: rpmcc: Add support for MSM8953 RPM clocks.
Message-ID: <QZ0fkozlubDdc7CvqjZPhAviFmjJ28ht7Y4PT3rYM@cp4-web-038.plabs.ch>
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

From: Vladimir Lypak <junak.pub@gmail.com>

Add definitions for RPM clocks used on MSM8953 platform.

Signed-off-by: Vladimir Lypak <junak.pub@gmail.com>
Signed-off-by: Adam Skladowski <a_skl39@protonmail.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@somainline.org>
Signed-off-by: Sireesh Kodali <sireeshkodali@protonmail.com>
---
 drivers/clk/qcom/clk-smd-rpm.c | 37 ++++++++++++++++++++++++++++++++++
 1 file changed, 37 insertions(+)

diff --git a/drivers/clk/qcom/clk-smd-rpm.c b/drivers/clk/qcom/clk-smd-rpm.=
c
index 800b2fef1887..e99131016911 100644
--- a/drivers/clk/qcom/clk-smd-rpm.c
+++ b/drivers/clk/qcom/clk-smd-rpm.c
@@ -913,10 +913,47 @@ static const struct rpm_smd_clk_desc rpm_clk_sdm660 =
=3D {
 =09.num_clks =3D ARRAY_SIZE(sdm660_clks),
 };
=20
+static struct clk_smd_rpm *msm8953_clks[] =3D {
+=09[RPM_SMD_XO_CLK_SRC]=09=09=3D &sdm660_bi_tcxo,
+=09[RPM_SMD_XO_A_CLK_SRC]=09=09=3D &sdm660_bi_tcxo_a,
+=09[RPM_SMD_PCNOC_CLK]=09=09=3D &msm8916_pcnoc_clk,
+=09[RPM_SMD_PCNOC_A_CLK]=09=09=3D &msm8916_pcnoc_a_clk,
+=09[RPM_SMD_SNOC_CLK]=09=09=3D &msm8916_snoc_clk,
+=09[RPM_SMD_SNOC_A_CLK]=09=09=3D &msm8916_snoc_a_clk,
+=09[RPM_SMD_BIMC_CLK]=09=09=3D &msm8916_bimc_clk,
+=09[RPM_SMD_BIMC_A_CLK]=09=09=3D &msm8916_bimc_a_clk,
+=09[RPM_SMD_IPA_CLK]=09=09=3D &msm8976_ipa_clk,
+=09[RPM_SMD_IPA_A_CLK]=09=09=3D &msm8976_ipa_a_clk,
+=09[RPM_SMD_SYSMMNOC_CLK]=09=09=3D &msm8936_sysmmnoc_clk,
+=09[RPM_SMD_SYSMMNOC_A_CLK]=09=3D &msm8936_sysmmnoc_a_clk,
+=09[RPM_SMD_QDSS_CLK]=09=09=3D &msm8916_qdss_clk,
+=09[RPM_SMD_QDSS_A_CLK]=09=09=3D &msm8916_qdss_a_clk,
+=09[RPM_SMD_BB_CLK1]=09=09=3D &msm8916_bb_clk1,
+=09[RPM_SMD_BB_CLK1_A]=09=09=3D &msm8916_bb_clk1_a,
+=09[RPM_SMD_BB_CLK2]=09=09=3D &msm8916_bb_clk2,
+=09[RPM_SMD_BB_CLK2_A]=09=09=3D &msm8916_bb_clk2_a,
+=09[RPM_SMD_RF_CLK2]=09=09=3D &msm8916_rf_clk2,
+=09[RPM_SMD_RF_CLK2_A]=09=09=3D &msm8916_rf_clk2_a,
+=09[RPM_SMD_RF_CLK3]=09=09=3D &msm8992_ln_bb_clk,
+=09[RPM_SMD_RF_CLK3_A]=09=09=3D &msm8992_ln_bb_a_clk,
+=09[RPM_SMD_DIV_CLK2]=09=09=3D &msm8974_div_clk2,
+=09[RPM_SMD_DIV_A_CLK2]=09=09=3D &msm8974_div_a_clk2,
+=09[RPM_SMD_BB_CLK1_PIN]=09=09=3D &msm8916_bb_clk1_pin,
+=09[RPM_SMD_BB_CLK1_A_PIN]=09=09=3D &msm8916_bb_clk1_a_pin,
+=09[RPM_SMD_BB_CLK2_PIN]=09=09=3D &msm8916_bb_clk2_pin,
+=09[RPM_SMD_BB_CLK2_A_PIN]=09=09=3D &msm8916_bb_clk2_a_pin,
+};
+
+static const struct rpm_smd_clk_desc rpm_clk_msm8953 =3D {
+=09.clks =3D msm8953_clks,
+=09.num_clks =3D ARRAY_SIZE(msm8953_clks),
+};
+
 static const struct of_device_id rpm_smd_clk_match_table[] =3D {
 =09{ .compatible =3D "qcom,rpmcc-msm8226", .data =3D &rpm_clk_msm8974 },
 =09{ .compatible =3D "qcom,rpmcc-msm8916", .data =3D &rpm_clk_msm8916 },
 =09{ .compatible =3D "qcom,rpmcc-msm8936", .data =3D &rpm_clk_msm8936 },
+=09{ .compatible =3D "qcom,rpmcc-msm8953", .data =3D &rpm_clk_msm8953 },
 =09{ .compatible =3D "qcom,rpmcc-msm8974", .data =3D &rpm_clk_msm8974 },
 =09{ .compatible =3D "qcom,rpmcc-msm8976", .data =3D &rpm_clk_msm8976 },
 =09{ .compatible =3D "qcom,rpmcc-msm8992", .data =3D &rpm_clk_msm8992 },
--=20
2.32.0


