Return-Path: <linux-arm-msm+bounces-4238-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id EF50680CFEF
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 Dec 2023 16:45:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9A7971F21932
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 Dec 2023 15:45:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 906764BAA3;
	Mon, 11 Dec 2023 15:44:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="BxufRkNt"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com [IPv6:2a00:1450:4864:20::12d])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 831A4A1
	for <linux-arm-msm@vger.kernel.org>; Mon, 11 Dec 2023 07:44:54 -0800 (PST)
Received: by mail-lf1-x12d.google.com with SMTP id 2adb3069b0e04-50dfac6c0beso1643922e87.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 11 Dec 2023 07:44:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1702309493; x=1702914293; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4rRpPZt2SIJA5F3cMHV1T35kXBcvXzQb5IQ83qE8OmA=;
        b=BxufRkNt5iWw7YXltiIpONzGsgwFUiKcyCxfso5xS7d5/HyeEFBF1WOroUO+OQPMUB
         NDio7cqpSx10FXjSG7A5bVMExjjGZxGFRLLNj03Tlyp1/ZDX5qwLLdjvnlfXNmkP/wM/
         2bPXssjdM5RZLz+1eoccDxH2saeiuxn1nHCQPjRahEsi2s23WL4j5A+zPxi2HFs3dQ1W
         IUTylrLQM/j8VC+JMt1laafNPquh+pqKxYzrDti12hyHzG3foS3i2V20go0xlRY/JCjn
         Mr/VHNNZfEKajawiXVEB05K7JX2ULbamjPa9fTFb2cqSVS6O3OIGQQ+VsUloD0l5c7rq
         LdWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702309493; x=1702914293;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4rRpPZt2SIJA5F3cMHV1T35kXBcvXzQb5IQ83qE8OmA=;
        b=DEhPI4XT7wepG2JmAODcA9yeXNtrBuuwMJPSFlbkd7XDZwFM8klTP4Lfb8p0gvfz2o
         x4PTylemeYFEDf6IPMx8ttgId6ZJ5X+topyYjzcy2B0RgXL6rL0brqhIxfZ4bkFDm/a5
         c5NAEcLIzx1Hv8LJkEbOHQ0p/MCpKBS74oz0WSMprTJeSS9x4qMX/ekOlQlYD+49Hvpt
         HPq/vtjxlPizqV0092jz7XdOFoYKBuLxFzsQAeLg+PFNa43Jusd4QYDeaYXNSuPcaGVh
         9uHrThqL7gwJZAmYWSCX2le1Ir1MyzQLM4Xi48zioNV8G5zwkbC9ZGCkd8GsrVb9eVgR
         2ZlA==
X-Gm-Message-State: AOJu0YzerH5ptII9gfXwrduFIAJ0OcZ3OvlwzpMa80PmlCHKLocenCg+
	+UFjUpzL78xQXtZpT1dvJ5M23A==
X-Google-Smtp-Source: AGHT+IFUQ7tenzLmGboSIZEJbzghc3TiEVAs0ezbRXq678xu7S9Thy7y/lL/0Q2no+4vGl12ga2xGA==
X-Received: by 2002:a05:6512:3d22:b0:50b:c4f1:9058 with SMTP id d34-20020a0565123d2200b0050bc4f19058mr2981841lfv.12.1702309492912;
        Mon, 11 Dec 2023 07:44:52 -0800 (PST)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id c5-20020ac244a5000000b0050aa6e2ae87sm1109646lfm.2.2023.12.11.07.44.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Dec 2023 07:44:52 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>,
	Sean Paul <sean@poorly.run>,
	Abhinav Kumar <quic_abhinavk@quicinc.com>,
	Marijn Suijten <marijn.suijten@somainline.org>
Cc: Stephen Boyd <swboyd@chromium.org>,
	David Airlie <airlied@gmail.com>,
	Daniel Vetter <daniel@ffwll.ch>,
	Bjorn Andersson <andersson@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	freedreno@lists.freedesktop.org
Subject: [PATCH v2 7/8] arm64: dts: qcom: sm8150: add USB-C ports to the OTG USB host
Date: Mon, 11 Dec 2023 18:44:44 +0300
Message-Id: <20231211154445.3666732-8-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231211154445.3666732-1-dmitry.baryshkov@linaro.org>
References: <20231211154445.3666732-1-dmitry.baryshkov@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Expand first USB host controller device node with the OF ports required
to support USB-C / DisplayPort switching.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm8150.dtsi | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8150.dtsi b/arch/arm64/boot/dts/qcom/sm8150.dtsi
index 77d32f4fe7da..168d49b01807 100644
--- a/arch/arm64/boot/dts/qcom/sm8150.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8150.dtsi
@@ -3608,6 +3608,25 @@ usb_1_dwc3: usb@a600000 {
 				snps,dis_enblslpm_quirk;
 				phys = <&usb_1_hsphy>, <&usb_1_qmpphy QMP_USB43DP_USB3_PHY>;
 				phy-names = "usb2-phy", "usb3-phy";
+
+				ports {
+					#address-cells = <1>;
+					#size-cells = <0>;
+
+					port@0 {
+						reg = <0>;
+
+						usb_1_dwc3_hs: endpoint {
+						};
+					};
+
+					port@1 {
+						reg = <1>;
+
+						usb_1_dwc3_ss: endpoint {
+						};
+					};
+				};
 			};
 		};
 
-- 
2.39.2


