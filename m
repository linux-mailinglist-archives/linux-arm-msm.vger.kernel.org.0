Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E82D5675F61
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 Jan 2023 22:01:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230003AbjATVB5 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 20 Jan 2023 16:01:57 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55702 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230042AbjATVBs (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 20 Jan 2023 16:01:48 -0500
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com [IPv6:2a00:1450:4864:20::632])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1582EDF948
        for <linux-arm-msm@vger.kernel.org>; Fri, 20 Jan 2023 13:01:33 -0800 (PST)
Received: by mail-ej1-x632.google.com with SMTP id bk15so16945822ejb.9
        for <linux-arm-msm@vger.kernel.org>; Fri, 20 Jan 2023 13:01:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kC6nlRLXpiMSXPquJRZdMcIDZWTTdhGu8SW/fzka2cA=;
        b=GZVHFP1REjMaN5lojRSILSBMt1q6iSK8zwe3yIxe0NSo1uZJbZPhML/NO9VEjBwRaT
         5k2+WhA+LwDMJcDxGulYlE5Os8nHtqkT54EPRZaduT8P74v7GfhKW7VrisTFPEh3jD4c
         WbBem2QNshnG14RdogSkCC6Kj/TRClgO5tPycn3aat6HiCPIFdg5wUh13k51576zsIKz
         Lh883YnxDojxT8CgxeFJDc7rNc9gdSRvuvpug9ATOP3prBpNs5BMri7yqIukOitezp8n
         GkQj/N1QhnUQ/y+Lg4YsEo1uPW+HmTVvWyMmCI4zZ0u9dOx5NKoz7zBgcekPvFg9BNrk
         1uTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kC6nlRLXpiMSXPquJRZdMcIDZWTTdhGu8SW/fzka2cA=;
        b=gYBv1gtF4DLr0X57mAD2Lc1spdnLy2x58+b61VMoAVvNqVuA8XflIrlkOVY44o8Cyn
         Pm+0pp8p7KyG1a+IcIoy4PY6M9j+u0cmEx43sbyncx5noKTnLenMEALbIDsH1mL3WFbr
         dnuxns2vAccNgjmsDL3Udph05ScPYP291/7rH4wHC4IoThPMxrQbNtG+q1/wT7XSS8cd
         Nco+wu6YQVGKk7ZLLwGvDPyCYwWNREiMDSgMCwrEdm4om3L3Ydriacn46joOvPf7rFpg
         NzGNOpj7k99jaLvMyr/few0oFz4+LQR6TLBrsBIPNyKpTvPbjfasd5kveVq0qqyuVqCv
         vMsg==
X-Gm-Message-State: AFqh2kpFuHmqXOGuQCuVnf87ErF7li1mrtaCNONpxQwNG39OIpwtL0Nu
        zIg2VFzZDrFmIUzNEkwRQpkBtL5mqgSnBW3v
X-Google-Smtp-Source: AMrXdXvh8zy8Egrn8GT8PYXEo5TDYrAauJfohfTZoaHfR7FKzujlU4IhQyL4qcRUS4Kib92MglSWNw==
X-Received: by 2002:a17:907:c498:b0:862:1709:a06f with SMTP id tp24-20020a170907c49800b008621709a06fmr14367372ejc.37.1674248491724;
        Fri, 20 Jan 2023 13:01:31 -0800 (PST)
Received: from localhost.localdomain (abyk37.neoplus.adsl.tpnet.pl. [83.9.30.37])
        by smtp.gmail.com with ESMTPSA id g22-20020a170906595600b0087221268e49sm6581229ejr.186.2023.01.20.13.01.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Jan 2023 13:01:31 -0800 (PST)
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
To:     linux-arm-msm@vger.kernel.org, andersson@kernel.org,
        agross@kernel.org, krzysztof.kozlowski@linaro.org
Cc:     marijn.suijten@somainline.org,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Clark <robdclark@gmail.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Sean Paul <sean@poorly.run>, David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Douglas Anderson <dianders@chromium.org>,
        Loic Poulain <loic.poulain@linaro.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Rajeev Nandan <quic_rajeevny@quicinc.com>,
        Stephen Boyd <swboyd@chromium.org>,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Robert Foss <rfoss@kernel.org>, devicetree@vger.kernel.org
Subject: [PATCH 8/8] arm64: dts: qcom: sm8350: Hook up DSI1 to MDP
Date:   Fri, 20 Jan 2023 22:01:00 +0100
Message-Id: <20230120210101.2146852-8-konrad.dybcio@linaro.org>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230120210101.2146852-1-konrad.dybcio@linaro.org>
References: <20230120210101.2146852-1-konrad.dybcio@linaro.org>
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

Somehow DSI1 was not hooked up to MDP resulting in it not working.
Fix it.

Fixes: d4a4410583ed ("arm64: dts: qcom: sm8350: Add display system nodes")
Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm8350.dtsi | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8350.dtsi b/arch/arm64/boot/dts/qcom/sm8350.dtsi
index 0f9427f3319f..2531a9a80194 100644
--- a/arch/arm64/boot/dts/qcom/sm8350.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8350.dtsi
@@ -2955,6 +2955,13 @@ dpu_intf1_out: endpoint {
 							remote-endpoint = <&mdss_dsi0_in>;
 						};
 					};
+
+					port@1 {
+						reg = <1>;
+						dpu_intf2_out: endpoint {
+							remote-endpoint = <&mdss_dsi1_in>;
+						};
+					};
 				};
 			};
 
@@ -3123,6 +3130,7 @@ ports {
 					port@0 {
 						reg = <0>;
 						mdss_dsi1_in: endpoint {
+							remote-endpoint = <&dpu_intf2_out>;
 						};
 					};
 
-- 
2.39.1

