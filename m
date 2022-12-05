Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6CC41643782
	for <lists+linux-arm-msm@lfdr.de>; Mon,  5 Dec 2022 22:56:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231978AbiLEV4k (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 5 Dec 2022 16:56:40 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57632 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232851AbiLEV4P (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 5 Dec 2022 16:56:15 -0500
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com [IPv6:2a00:1450:4864:20::12f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4C77D112F
        for <linux-arm-msm@vger.kernel.org>; Mon,  5 Dec 2022 13:55:54 -0800 (PST)
Received: by mail-lf1-x12f.google.com with SMTP id j4so20772548lfk.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 05 Dec 2022 13:55:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:references
         :in-reply-to:user-agent:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=oKO88ao55DxeeXnBljoXeld0kkAkjM3hR01wftgKVTw=;
        b=LGmal3EdUpWrC1R3nF6mkwM7Df/F/iOHovzKOGvspnP8S0/6optExX0dgJx1r0NI8P
         JnTquIdtNcngTOk2jvqi46vEF4u9YUwXWEdKPdzsT9gLjw19VUW/lkeCp5/nWKT9nK18
         B6lujK1mJ5qNwhpP+k8U0kvHvPJfnE4pCmzVmYkeIcaOYh/bNZyHCrR4dtGi779nu336
         cUzJ5DL/0R7IBNZDm5UHVQlzQ625m15k7CGHGnx1sFsRaY73R7LHWJCn9wt+0OT877qY
         pXmaHqAEod8VB7YF2WRTYwAoTPTWSa7pVaKNdrpVBbFeO3agAHKqBCjLDYZT4RAgSUVE
         3BQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:references
         :in-reply-to:user-agent:subject:cc:to:from:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=oKO88ao55DxeeXnBljoXeld0kkAkjM3hR01wftgKVTw=;
        b=C5S55XhwFBU4hjIAMxMCxqd9rESE20/RFeBCoMTzfFAubkYur0zr9f480YRM3mtgyD
         dICWe3Uxsuc55bgb4pu/aJMriFgtkEC3zOSZ/35YJh+Xnr+Sun/9BLU6JgjSAiPQOZyF
         4d79jLe6aGHwTvx94lMBSn3zU/G8JxHbI7+2iLI2c2Sr7sx7ZjGBZsv8oYeaD9f1ZBck
         jpmTygLkaJbMQjg1xQyt97gsG/EzXuqg2/bi4oy6JEbeW5S+0qDYv1yM8jrgs+6HvtcF
         aunmk1bE/1p22FpeC8xt9CWV8dkZEKrvQB+kk0CdF1Pq3F65zFW4IzVvpsEhwoazl3t+
         Txig==
X-Gm-Message-State: ANoB5pmCBHegdjHZZE/lBhsm2uHv1ZGuPucWeKuiyRIrbmV/1y1QT7pB
        0mtu9wpb3QDkKR35S5v5CfvKpA==
X-Google-Smtp-Source: AA0mqf5SswWygv24y9yRXfk5wHX/CIUMUkg6260+JfxCoIclzTWfee5uW70fP+owZxwIDKvbFGsPdg==
X-Received: by 2002:a19:760b:0:b0:4b5:67d8:e3c2 with SMTP id c11-20020a19760b000000b004b567d8e3c2mr3416705lff.166.1670277352663;
        Mon, 05 Dec 2022 13:55:52 -0800 (PST)
Received: from [127.0.0.1] ([94.25.229.129])
        by smtp.gmail.com with ESMTPSA id w9-20020a05651c118900b00279d206a43bsm1250265ljo.34.2022.12.05.13.55.52
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 05 Dec 2022 13:55:52 -0800 (PST)
Date:   Tue, 06 Dec 2022 00:55:48 +0300
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        martin.petersen@oracle.com, jejb@linux.ibm.com,
        andersson@kernel.org, vkoul@kernel.org
CC:     quic_cang@quicinc.com, quic_asutoshd@quicinc.com,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-phy@lists.infradead.org, linux-scsi@vger.kernel.org,
        ahalaney@redhat.com, abel.vesa@linaro.org, alim.akhtar@samsung.com,
        avri.altman@wdc.com, bvanassche@acm.org
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH_v4_11/23=5D_phy=3A_qcom-qmp-ufs?= =?US-ASCII?Q?=3A_Add_HS_G4_mode_support_to_SM8450_SoC?=
User-Agent: K-9 Mail for Android
In-Reply-To: <20221201174328.870152-12-manivannan.sadhasivam@linaro.org>
References: <20221201174328.870152-1-manivannan.sadhasivam@linaro.org> <20221201174328.870152-12-manivannan.sadhasivam@linaro.org>
Message-ID: <977DEE2E-FCD8-44AD-BB52-49EDF586B796@linaro.org>
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



On 1 December 2022 20:43:16 GMT+03:00, Manivannan Sadhasivam <manivannan=
=2Esadhasivam@linaro=2Eorg> wrote:
>UFS PHY in SM8450 SoC is capable of operating at HS G4 mode and the init
>sequence is compatible with SM8350=2E Hence, add the tbls_hs_g4 instance
>reusing the G4 init sequence of SM8350=2E

Reviewed-by: Dmitry Baryshkov <dmitry=2Ebaryshkov@linaro=2Eorg>

>
>Signed-off-by: Manivannan Sadhasivam <manivannan=2Esadhasivam@linaro=2Eor=
g>
>---
> drivers/phy/qualcomm/phy-qcom-qmp-ufs=2Ec | 8 ++++++++
> 1 file changed, 8 insertions(+)
>
>diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-ufs=2Ec b/drivers/phy/qual=
comm/phy-qcom-qmp-ufs=2Ec
>index 75e55c4181c9=2E=2E96e03d4249da 100644
>--- a/drivers/phy/qualcomm/phy-qcom-qmp-ufs=2Ec
>+++ b/drivers/phy/qualcomm/phy-qcom-qmp-ufs=2Ec
>@@ -935,6 +935,14 @@ static const struct qmp_phy_cfg sm8450_ufsphy_cfg =
=3D {
> 		=2Eserdes		=3D sm8350_ufsphy_hs_b_serdes,
> 		=2Eserdes_num	=3D ARRAY_SIZE(sm8350_ufsphy_hs_b_serdes),
> 	},
>+	=2Etbls_hs_g4 =3D {
>+		=2Etx		=3D sm8350_ufsphy_g4_tx,
>+		=2Etx_num		=3D ARRAY_SIZE(sm8350_ufsphy_g4_tx),
>+		=2Erx		=3D sm8350_ufsphy_g4_rx,
>+		=2Erx_num		=3D ARRAY_SIZE(sm8350_ufsphy_g4_rx),
>+		=2Epcs		=3D sm8350_ufsphy_g4_pcs,
>+		=2Epcs_num	=3D ARRAY_SIZE(sm8350_ufsphy_g4_pcs),
>+	},
> 	=2Eclk_list		=3D sm8450_ufs_phy_clk_l,
> 	=2Enum_clks		=3D ARRAY_SIZE(sm8450_ufs_phy_clk_l),
> 	=2Evreg_list		=3D qmp_phy_vreg_l,

--=20
With best wishes
Dmitry
