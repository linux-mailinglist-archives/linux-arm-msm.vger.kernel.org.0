Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0344D6CF65D
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Mar 2023 00:25:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229570AbjC2WZI (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 29 Mar 2023 18:25:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45720 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230246AbjC2WZH (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 29 Mar 2023 18:25:07 -0400
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com [IPv6:2a00:1450:4864:20::12f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 48A361FFB
        for <linux-arm-msm@vger.kernel.org>; Wed, 29 Mar 2023 15:25:05 -0700 (PDT)
Received: by mail-lf1-x12f.google.com with SMTP id y15so22132523lfa.7
        for <linux-arm-msm@vger.kernel.org>; Wed, 29 Mar 2023 15:25:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1680128703;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QEueJb8wxFS51D5H+YQGZcmoJREAPX/3P/EgTv1KRmQ=;
        b=lRUgCTj8FbwxUykPzPj+tXrYXzquUMA2SE3l2V7o5HuwDGblXGkm5u3lUL3x/myZo8
         GSEGBQAQ+ti9lfTG9xS3ZbCuS7pIgHc9qpQ+c7c35los6UTyTjRQE4WrUaNhEBVxQJqb
         tnq5+OBi2/9rJ4P/COOh2QjYcTX3fq0W2OIFW/fgIUTSh9M7djIZXioLdhD7WKOxHdPp
         V4hxBsrHLOTINBXq6err0YTWXfThPMLIZrrYekvrBQ/o0BJrDPf5rPku8cboAJr+vWBV
         c8AX5APP22S5qZ/3G/y2i7ecgg+hzcAJhbTxQ9+6rp0ibWKYX11Vzhyuhm3weNzRw14k
         jUdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680128703;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QEueJb8wxFS51D5H+YQGZcmoJREAPX/3P/EgTv1KRmQ=;
        b=NWyIUbtxCCzobx2mAPoKHqxOElad1L2yT+D2CE5xTEN7SegV6r0Rh48eLIWMXz1viQ
         uwew1UtnUe/5qvTejNmFLnsEPyFybhlpcvp8TWVf8eY83z1jjIeSZb9FoAqSUM7tKyMG
         D1n6tPzQcs9gUxjQFqMM8RI2gryq76OZ9vk2OhEUjyZMUemYWFp6k5Yost53ekaKJkcg
         MlgGlG0dAC7+7HtE3rHTv8ypxtHF2uliHMVIxw0LHNYezQ2+zW0fPf90oaWolb0U+Gcw
         B7TIBWERaNiZKxgkzhkLnyq7TlOh1u4AqpVMwP8k/XVOhZvmprHG20P8p1eOAAOsCizc
         oKNQ==
X-Gm-Message-State: AAQBX9fvx/drMDxshN0vp8ohmrZ06GlFH5o+7ln+3FBahPwxBRfy+VyG
        +leLVxxGT4mP0lC7OEGK9wQiTQ==
X-Google-Smtp-Source: AKy350auET5GfqVeLoBe8QXogMU0qUTo2PHB76nYRpaWXwMAGBCpKiFuj5I23ncL6OK5zEWUTpjDSA==
X-Received: by 2002:ac2:4c26:0:b0:4e9:a16f:a176 with SMTP id u6-20020ac24c26000000b004e9a16fa176mr6731039lfq.36.1680128703439;
        Wed, 29 Mar 2023 15:25:03 -0700 (PDT)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
        by smtp.gmail.com with ESMTPSA id y26-20020ac255ba000000b004e9b307d2c8sm4724226lfg.238.2023.03.29.15.25.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Mar 2023 15:25:03 -0700 (PDT)
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
        freedreno@lists.freedesktop.org
Subject: [RFC PATCH 3/3] arm64: dts: qcom: specify power domains for the GPU
Date:   Thu, 30 Mar 2023 01:25:00 +0300
Message-Id: <20230329222500.1131836-4-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230329222500.1131836-1-dmitry.baryshkov@linaro.org>
References: <20230329222500.1131836-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The GPU on msm8996 is powered on by several power domains. Add
configuration for the GFX CPR and MX domains.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm64/boot/dts/qcom/msm8996.dtsi | 14 +++++++++++++-
 1 file changed, 13 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/msm8996.dtsi b/arch/arm64/boot/dts/qcom/msm8996.dtsi
index 905678e7175d..ff4fb30f9075 100644
--- a/arch/arm64/boot/dts/qcom/msm8996.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8996.dtsi
@@ -521,6 +521,10 @@ rpmpd_opp5: opp5 {
 					rpmpd_opp6: opp6 {
 						opp-level = <6>;
 					};
+
+					rpmpd_opp7: opp7 {
+						opp-level = <7>;
+					};
 				};
 			};
 		};
@@ -1228,7 +1232,8 @@ gpu: gpu@b00000 {
 			interconnects = <&bimc MASTER_GRAPHICS_3D &bimc SLAVE_EBI_CH0>;
 			interconnect-names = "gfx-mem";
 
-			power-domains = <&mmcc GPU_GX_GDSC>;
+			power-domains = <&mmcc GPU_GX_GDSC>, <&rpmpd MSM8996_VDDMX>;
+			power-domain-names = "gx", "mx";
 			iommus = <&adreno_smmu 0>;
 
 			nvmem-cells = <&speedbin_efuse>;
@@ -1251,30 +1256,37 @@ gpu_opp_table: opp-table {
 				opp-624000000 {
 					opp-hz = /bits/ 64 <624000000>;
 					opp-supported-hw = <0x09>;
+					required-opps = <&rpmpd_opp7>;
 				};
 				opp-560000000 {
 					opp-hz = /bits/ 64 <560000000>;
 					opp-supported-hw = <0x0d>;
+					required-opps = <&rpmpd_opp7>;
 				};
 				opp-510000000 {
 					opp-hz = /bits/ 64 <510000000>;
 					opp-supported-hw = <0xff>;
+					required-opps = <&rpmpd_opp5>;
 				};
 				opp-401800000 {
 					opp-hz = /bits/ 64 <401800000>;
 					opp-supported-hw = <0xff>;
+					required-opps = <&rpmpd_opp5>;
 				};
 				opp-315000000 {
 					opp-hz = /bits/ 64 <315000000>;
 					opp-supported-hw = <0xff>;
+					required-opps = <&rpmpd_opp4>;
 				};
 				opp-214000000 {
 					opp-hz = /bits/ 64 <214000000>;
 					opp-supported-hw = <0xff>;
+					required-opps = <&rpmpd_opp4>;
 				};
 				opp-133000000 {
 					opp-hz = /bits/ 64 <133000000>;
 					opp-supported-hw = <0xff>;
+					required-opps = <&rpmpd_opp4>;
 				};
 			};
 
-- 
2.39.2

