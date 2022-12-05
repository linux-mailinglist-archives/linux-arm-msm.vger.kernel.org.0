Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A3B9D64377E
	for <lists+linux-arm-msm@lfdr.de>; Mon,  5 Dec 2022 22:56:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232118AbiLEV4T (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 5 Dec 2022 16:56:19 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58218 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232054AbiLEV4C (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 5 Dec 2022 16:56:02 -0500
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com [IPv6:2a00:1450:4864:20::12e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0E089252B9
        for <linux-arm-msm@vger.kernel.org>; Mon,  5 Dec 2022 13:55:12 -0800 (PST)
Received: by mail-lf1-x12e.google.com with SMTP id j4so20770141lfk.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 05 Dec 2022 13:55:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:references
         :in-reply-to:user-agent:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=DuCbaziL7ipwUokx8SdKjEyNaVxjpbuSpAIzdJTw5Wk=;
        b=EZ61WOgtuGU6gpRgHDm040OTpm25fx5anWD3iDhaj+TRuQ001odDN0NCUeucYe76Xj
         +b/A9zh1Huo/QYb31nV5z6jqM4/fCI5ogg6FqktDWGelOhwshhTjJX5MEpLSbiR2Lg/c
         cf9BT0rV/DXZ3Q7QXsXSy9dHVSMGL3dikVd4zzqdZLDAehjWIJS2TQYcAUp/jj2f2tuP
         /BSqWRnm0cLU3zwTmfoER6jGI/mHwJ0raqJO+iVIlxy4AcqNUUgaqMSdGp0xPzZ0GqyR
         We1DJY5Z0Q3EpwNdr3MrBNezKl2QT+yvoxa04W/YukmUMYYSUcgMttoAygjD77wRvVw/
         r36Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:references
         :in-reply-to:user-agent:subject:cc:to:from:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=DuCbaziL7ipwUokx8SdKjEyNaVxjpbuSpAIzdJTw5Wk=;
        b=eAf6fNs67fYCUUvcAnjdzLOH1xp0AAfkSkvQpcvTDfW2MU437t+4RETXhns1DMVV8w
         JLoxNaCMlQU2iSpUGkOhL15sCDX/3UJfc0xf75BnU4BMilCXkiZeQ3N3EkWA/RXJJC0D
         0GQoHGQjmyoFCBIiBU79BTvZDA8I75AYdug5ubwHbriGqLJha3e+8Zc4RLATnVpRYPTt
         qTh8NzT1SpWWj1Fde68RdE4QyNZRapePu9OYLsn4ODm5CyF7OJwArgVrT/8luujv+ZE6
         TESwX06TZ62aGoVEShpKW1SDGQrQ227LgfkkJR7Zmtc6CSWrcHDUGu9VnGPf0YVHoRdB
         Wn7w==
X-Gm-Message-State: ANoB5pkvf/Cw3BiNMArqx+j36CF7rh+mDtDhsxBbsIYPc9xbkLeGm17a
        RS+HipjqvZw1lbs0fcqRvuRCPX2spBAD7BuA
X-Google-Smtp-Source: AA0mqf7a37W99NFxiADuO6IZRRPlkwNIPPcpXqSVr1sY3PdBNkFTIOLCTFco6NqHvbVAN4USu4AVKA==
X-Received: by 2002:a19:ca02:0:b0:4a4:434e:1e07 with SMTP id a2-20020a19ca02000000b004a4434e1e07mr26910750lfg.172.1670277311132;
        Mon, 05 Dec 2022 13:55:11 -0800 (PST)
Received: from [127.0.0.1] ([94.25.229.129])
        by smtp.gmail.com with ESMTPSA id k9-20020a05651239c900b00498fc3d4cfdsm2246171lfu.189.2022.12.05.13.55.10
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 05 Dec 2022 13:55:10 -0800 (PST)
Date:   Tue, 06 Dec 2022 00:55:06 +0300
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        martin.petersen@oracle.com, jejb@linux.ibm.com,
        andersson@kernel.org, vkoul@kernel.org
CC:     quic_cang@quicinc.com, quic_asutoshd@quicinc.com,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-phy@lists.infradead.org, linux-scsi@vger.kernel.org,
        ahalaney@redhat.com, abel.vesa@linaro.org, alim.akhtar@samsung.com,
        avri.altman@wdc.com, bvanassche@acm.org
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH_v4_09/23=5D_phy=3A_qcom-qmp-ufs=3A?= =?US-ASCII?Q?_Avoid_setting_HS_G3_specific_registers?=
User-Agent: K-9 Mail for Android
In-Reply-To: <20221201174328.870152-10-manivannan.sadhasivam@linaro.org>
References: <20221201174328.870152-1-manivannan.sadhasivam@linaro.org> <20221201174328.870152-10-manivannan.sadhasivam@linaro.org>
Message-ID: <29FC6095-645C-46B1-BFD1-0CB9F05214FD@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 1 December 2022 20:43:14 GMT+03:00, Manivannan Sadhasivam <manivannan=
=2Esadhasivam@linaro=2Eorg> wrote:
>SM8350 default init sequence sets some PCS registers to HS G3, thereby
>disabling HS G4 mode=2E This has the effect on MPHY capability negotiatio=
n
>between the host and the device during link startup and causes the
>PA_MAXHSGEAR to G3 irrespective of device max gear=2E
>
>Due to that, the agreed gear speed determined by the UFS core will become
>G3 only and the platform won't run at G4=2E
>
>So, let's remove setting these registers for SM8350 as like other G4
>compatible platforms=2E One downside of this is that, when the board desi=
gn
>uses non-G4 compatible device, then MPHY will continue to run in the

QMP PHY?

>default mode (G4) even if UFSHCD runs in G3=2E But this is the case for
>other platforms as well=2E

Should this be fixed by adding a separate set of tables used to setup g3?


>
>Signed-off-by: Manivannan Sadhasivam <manivannan=2Esadhasivam@linaro=2Eor=
g>
>---
> drivers/phy/qualcomm/phy-qcom-qmp-ufs=2Ec | 7 -------
> 1 file changed, 7 deletions(-)
>
>diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-ufs=2Ec b/drivers/phy/qual=
comm/phy-qcom-qmp-ufs=2Ec
>index d5324c4e8513=2E=2E6c7c6a06fe3b 100644
>--- a/drivers/phy/qualcomm/phy-qcom-qmp-ufs=2Ec
>+++ b/drivers/phy/qualcomm/phy-qcom-qmp-ufs=2Ec
>@@ -567,13 +567,6 @@ static const struct qmp_phy_init_tbl sm8350_ufsphy_p=
cs[] =3D {
> 	QMP_PHY_INIT_CFG(QPHY_V5_PCS_UFS_TX_MID_TERM_CTRL1, 0x43),
> 	QMP_PHY_INIT_CFG(QPHY_V5_PCS_UFS_DEBUG_BUS_CLKSEL, 0x1f),
> 	QMP_PHY_INIT_CFG(QPHY_V5_PCS_UFS_RX_MIN_HIBERN8_TIME, 0xff),
>-	QMP_PHY_INIT_CFG(QPHY_V5_PCS_UFS_PLL_CNTL, 0x03),
>-	QMP_PHY_INIT_CFG(QPHY_V5_PCS_UFS_TIMER_20US_CORECLK_STEPS_MSB, 0x16),
>-	QMP_PHY_INIT_CFG(QPHY_V5_PCS_UFS_TIMER_20US_CORECLK_STEPS_LSB, 0xd8),
>-	QMP_PHY_INIT_CFG(QPHY_V5_PCS_UFS_TX_PWM_GEAR_BAND, 0xaa),
>-	QMP_PHY_INIT_CFG(QPHY_V5_PCS_UFS_TX_HS_GEAR_BAND, 0x06),
>-	QMP_PHY_INIT_CFG(QPHY_V5_PCS_UFS_TX_HSGEAR_CAPABILITY, 0x03),
>-	QMP_PHY_INIT_CFG(QPHY_V5_PCS_UFS_RX_HSGEAR_CAPABILITY, 0x03),
> 	QMP_PHY_INIT_CFG(QPHY_V5_PCS_UFS_RX_SIGDET_CTRL1, 0x0e),
> 	QMP_PHY_INIT_CFG(QPHY_V5_PCS_UFS_MULTI_LANE_CTRL1, 0x02),
> };

--=20
With best wishes
Dmitry
