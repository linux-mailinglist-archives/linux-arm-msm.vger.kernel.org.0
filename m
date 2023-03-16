Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0F9076BC9FF
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 Mar 2023 09:52:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230133AbjCPIws (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 16 Mar 2023 04:52:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45826 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231245AbjCPIw1 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 16 Mar 2023 04:52:27 -0400
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com [IPv6:2a00:1450:4864:20::131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B5E87B6D23
        for <linux-arm-msm@vger.kernel.org>; Thu, 16 Mar 2023 01:51:27 -0700 (PDT)
Received: by mail-lf1-x131.google.com with SMTP id t11so1384453lfr.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 16 Mar 2023 01:51:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678956682;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Vhpul7Rh3cRj+K0GuudZQvoFoP/xfXO3CkdZI/yylms=;
        b=WGZZcM6WcKH5wJ1+O0BxrYdydlbnmi9n3vrDnUzyoEKCuj1f5n+zMKOcvadpSek/hA
         vGL63abAMSP5iVzvDL26UfoC6spiGrsmj4uybj2x0vMaUWZ/I+xvRhYjlShoy/fzsEPr
         ExY5DeTOQUtgCCQieW7i3WDOwt3BDmtkbhEew5FUNqd6JHTRKaBuxqVXBqHRshHtnPFE
         LWIRg42QHEd8i3PwNRacAkcOWKDzWiYTPUXm1Mf+12UOmEcrUcdvU92UbyAKvwvRSsld
         PEbfiR7VVopFzPxwdkxlCg0xm/gyQbUKM+5wUfTZOPqv9U/uvWt0I6AWAcDlv/PlftJ/
         ABlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678956682;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Vhpul7Rh3cRj+K0GuudZQvoFoP/xfXO3CkdZI/yylms=;
        b=4VNTgpsQUeyXl7nZYCXzEq9gY6UjRW7ju0dtIYBvPPJh8m4MjSBlfUXYvj1GUQoZte
         6Is6py4luIOz3kEGq84jfEsbEHUSMeiAOtXCWHaJm8chz3bCOl2Cp7o5OIdzlNp2awY5
         AikNig0XySQbFFXl0zEQgczfJf/jRkr/WRZkdXgxF1yN1XdtTT0byiUuZ3hXD0WBtoDg
         Ro+lk0jH6+4E96V30cVxwGy4kSQtUMP2SNY6LLe4uh+2uX+bNe4Wl6KYX4U2YG6+7F+u
         JSiym/TT/IQda6GAEa310g35kmClXNin6T+P8SqHv3R5S6GmCJWJFHUJmJV6CYC+k/37
         ixxg==
X-Gm-Message-State: AO0yUKXNs2/V7NnuoZISe+DiQydoLF4ilkHDR/aqp0xTRnj7+K0xMHAK
        w/xidatqAgUjgajIZ3XiEvcBqw==
X-Google-Smtp-Source: AK7set87BbSQ9sVx5mok5TOPRcaSbaLWFERH8AcVnQ7sqzqEPcroAy6dGZYHYxN2VaputEjUtWwJAg==
X-Received: by 2002:a05:6512:2804:b0:4d8:86c1:4771 with SMTP id cf4-20020a056512280400b004d886c14771mr2570389lfb.6.1678956681755;
        Thu, 16 Mar 2023 01:51:21 -0700 (PDT)
Received: from [192.168.1.101] (abyj16.neoplus.adsl.tpnet.pl. [83.9.29.16])
        by smtp.gmail.com with ESMTPSA id o11-20020a2e730b000000b002991baef49bsm251566ljc.12.2023.03.16.01.51.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Mar 2023 01:51:21 -0700 (PDT)
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
Date:   Thu, 16 Mar 2023 09:51:13 +0100
Subject: [PATCH v5 07/10] drm/msm/dsi: Remove custom DSI config handling
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230307-topic-dsi_qcm-v5-7-9d4235b77f4f@linaro.org>
References: <20230307-topic-dsi_qcm-v5-0-9d4235b77f4f@linaro.org>
In-Reply-To: <20230307-topic-dsi_qcm-v5-0-9d4235b77f4f@linaro.org>
To:     Rob Clark <robdclark@gmail.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Sean Paul <sean@poorly.run>, David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Krishna Manikandan <quic_mkrishn@quicinc.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>
Cc:     Rob Herring <robh@kernel.org>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>
X-Mailer: b4 0.12.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1678956668; l=1730;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=F4fPirOHyMQPj35ost0pdi8esBWoDrjWNUljpExX+4U=;
 b=FL/r6rvLYNSYDNfxE3wvGBoxEwQ/m3wkv470pmFuq27VtanvQIIOf7xBKwiqIZyhM9Ok3ofPqSOM
 qwkknPNnDy8cfZ9kpkusgCrzafDZeyJpNEQ/i7+w1iFvb6rc6Td0
X-Developer-Key: i=konrad.dybcio@linaro.org; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=
X-Spam-Status: No, score=-0.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_SORBS_HTTP,RCVD_IN_SORBS_SOCKS,SPF_HELO_NONE,SPF_PASS
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Now that the only user is handled by common code, remove the option to
specify custom handlers through match data.

This is effectively a revert of commit:
5ae15e76271 ("drm/msm/dsi: Allow to specify dsi config as pdata")

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Reviewed-by: Marijn Suijten <marijn.suijten@somainline.org>
Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 drivers/gpu/drm/msm/dsi/dsi.c      | 4 ++--
 drivers/gpu/drm/msm/dsi/dsi_host.c | 4 ----
 2 files changed, 2 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/msm/dsi/dsi.c b/drivers/gpu/drm/msm/dsi/dsi.c
index f761973e4cba..baab79ab6e74 100644
--- a/drivers/gpu/drm/msm/dsi/dsi.c
+++ b/drivers/gpu/drm/msm/dsi/dsi.c
@@ -172,10 +172,10 @@ static int dsi_dev_remove(struct platform_device *pdev)
 }
 
 static const struct of_device_id dt_match[] = {
-	{ .compatible = "qcom,mdss-dsi-ctrl", .data = NULL /* autodetect cfg */ },
+	{ .compatible = "qcom,mdss-dsi-ctrl" },
 
 	/* Deprecated, don't use */
-	{ .compatible = "qcom,dsi-ctrl-6g-qcm2290", .data = NULL },
+	{ .compatible = "qcom,dsi-ctrl-6g-qcm2290" },
 	{}
 };
 
diff --git a/drivers/gpu/drm/msm/dsi/dsi_host.c b/drivers/gpu/drm/msm/dsi/dsi_host.c
index 9cfb9e91bfea..961689a255c4 100644
--- a/drivers/gpu/drm/msm/dsi/dsi_host.c
+++ b/drivers/gpu/drm/msm/dsi/dsi_host.c
@@ -214,10 +214,6 @@ static const struct msm_dsi_cfg_handler *dsi_get_config(
 	int ret;
 	u32 major = 0, minor = 0;
 
-	cfg_hnd = device_get_match_data(dev);
-	if (cfg_hnd)
-		return cfg_hnd;
-
 	ahb_clk = msm_clk_get(msm_host->pdev, "iface");
 	if (IS_ERR(ahb_clk)) {
 		pr_err("%s: cannot get interface clock\n", __func__);

-- 
2.39.2

