Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E76FC6638D7
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Jan 2023 06:54:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229659AbjAJFyk (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 10 Jan 2023 00:54:40 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57596 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229812AbjAJFyi (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 10 Jan 2023 00:54:38 -0500
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com [IPv6:2a00:1450:4864:20::136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7D6C626F7
        for <linux-arm-msm@vger.kernel.org>; Mon,  9 Jan 2023 21:54:37 -0800 (PST)
Received: by mail-lf1-x136.google.com with SMTP id bp15so16630997lfb.13
        for <linux-arm-msm@vger.kernel.org>; Mon, 09 Jan 2023 21:54:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Od8NVQ7rke1dy63OziSV7bOj514f4mT68wZay8pjM14=;
        b=m9+Jas64suajSpQIRMpvHPgkRtW3P40QRWR282M9A9M4wfKPwWPJ8ps3lPb2JoQGS6
         URMcpxEUG2Kqi4AuWvyOabzm5Ul5bLxH1gIzoAkhZFi2KTEmlX4ZKnf5qVCYyEIvyCqe
         N5zxAv/9J/WXJg24kYZ5EsNJAbhrszKuNaHhiuuP5x92bgcPQWfY5Did38KOPuw9Wf/s
         odLQAzv0x+6FmJCujeYKr025VwYN+fhiA1c2ZIQfVvr3kglplY9kHv53wvUuJ2fKJ0/3
         5xsppfp0PQ8PFn3Z/9KtWb6ElP+GuGDV9f4ThF1yG95owl8nx0YalAeCH2+MFTpgIVlU
         ospQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Od8NVQ7rke1dy63OziSV7bOj514f4mT68wZay8pjM14=;
        b=cssrukaZTMMhuXx8gcHwjAJ6oqCFXSvvV4VTDaUJkoWHQf2JSo4eykFlhWRGT21pj0
         VxG5x17U101dU4Ed/+hEOkpfqsbc/AY02VWqMsRjYc+4Bb8MP06NFWy4EWrl4YmyN3Ay
         96Bn6/pu1epwKibhhAyVSfKI5Rc2TTO4dahMXd39z3CXEh0RsbeIv6FXEBvk2bZN17Lj
         3lXVupdLfaZ+za+EmgGPLJr3UqVfgmf4Z5Dl9gWcT+cerp7o7IzQki7eIs9V7XVeLHA0
         9xOwm/VjTtCy8oxd4/1sThF+pTkfMoz1BzSsHlbqSbzbu3cVmsQpuo9Sw7iEhy+wcCde
         Wocw==
X-Gm-Message-State: AFqh2kq1arWw4f7T623AdDGpfHKLfNgSZWKtgbExDItM/9n+9bvz0gKp
        7yhBv6VPmwdKiwcUiqC+TBJUlw==
X-Google-Smtp-Source: AMrXdXtx4QrfwKdfzPS+27ZFVMOsjqDyn1MfQ+bdDV1TXDnoK7sgDn2jLTxkjowQdtjCufmdFwngNQ==
X-Received: by 2002:a05:6512:3b07:b0:4ab:f3f1:8299 with SMTP id f7-20020a0565123b0700b004abf3f18299mr20609955lfv.6.1673330075781;
        Mon, 09 Jan 2023 21:54:35 -0800 (PST)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
        by smtp.gmail.com with ESMTPSA id h37-20020a0565123ca500b004b52aea5ff8sm1987227lfv.30.2023.01.09.21.54.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Jan 2023 21:54:35 -0800 (PST)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org,
        "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>
Subject: [PATCH 2/3] arm64: dts: qcom: sm8150: Add compat qcom,sm8150-dsi-ctrl
Date:   Tue, 10 Jan 2023 07:54:32 +0200
Message-Id: <20230110055433.734188-2-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230110055433.734188-1-dmitry.baryshkov@linaro.org>
References: <20230110055433.734188-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add silicon specific compatible qcom,sm8150-dsi-ctrl to the
mdss-dsi-ctrl block. This allows us to differentiate the specific bindings
for sm8150 against the yaml documentation.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm8150.dtsi | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8150.dtsi b/arch/arm64/boot/dts/qcom/sm8150.dtsi
index 99750987c9d6..2c59ebe3320d 100644
--- a/arch/arm64/boot/dts/qcom/sm8150.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8150.dtsi
@@ -3690,7 +3690,7 @@ opp-460000000 {
 			};
 
 			mdss_dsi0: dsi@ae94000 {
-				compatible = "qcom,mdss-dsi-ctrl";
+				compatible = "qcom,sm8150-dsi-ctrl", "qcom,mdss-dsi-ctrl";
 				reg = <0 0x0ae94000 0 0x400>;
 				reg-names = "dsi_ctrl";
 
@@ -3783,7 +3783,7 @@ mdss_dsi0_phy: phy@ae94400 {
 			};
 
 			mdss_dsi1: dsi@ae96000 {
-				compatible = "qcom,mdss-dsi-ctrl";
+				compatible = "qcom,sm8150-dsi-ctrl", "qcom,mdss-dsi-ctrl";
 				reg = <0 0x0ae96000 0 0x400>;
 				reg-names = "dsi_ctrl";
 
-- 
2.39.0

