Return-Path: <linux-arm-msm+bounces-1134-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 78A257F12E7
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Nov 2023 13:13:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A92441C2185E
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Nov 2023 12:13:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CAB301945D;
	Mon, 20 Nov 2023 12:13:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="BR/P1bMi"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com [IPv6:2a00:1450:4864:20::531])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 16A2AD8
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Nov 2023 04:13:10 -0800 (PST)
Received: by mail-ed1-x531.google.com with SMTP id 4fb4d7f45d1cf-53e08e439c7so6196632a12.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 20 Nov 2023 04:13:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1700482388; x=1701087188; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=y4obJbFuX32a51CPgRwasEGqIWFeGs2SFetYjrfd9IY=;
        b=BR/P1bMiVUDoKw1BoecSGM4mIDLORYLlo7RbXSocFuXCQ1vmatjqkTtF6tc2iReXpT
         r5nkkdBIF3RwqdtcP1BGb4TlVMTgbdZT7mW/ttw47RtlAXI8lREjm7SYfWPPFCJPLbY0
         Hr5oiNlsR0aUcsWjfVE/ZjtOCHXkjef3gTGHf7wRF34m+pBtC+g2SVtAreugOqaoMIJq
         nRExJfiPRZUp5I3GjbyxlWV5MXaTPTklBRuRUCTFxKqGFkjStPTqgj2Kluq0pW80hK0b
         XHGCpzLqmv9OiIESmafW96cu8K3LWoLmDX7a48l9a1m00MEhNUAaoAwZ+gRcF8sls/x4
         xalg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700482388; x=1701087188;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=y4obJbFuX32a51CPgRwasEGqIWFeGs2SFetYjrfd9IY=;
        b=Fuky/m5rFnrr8jrV3k+pgf3Hflezo8JKhMHizYMlS6gXGZ1tqZ7bsrQh5Gr4WdBDJ3
         Rg4+e9f1q4AXlnx/OW83vHbKtN8/B+lI98ca8UmdClKb8XRF04sIy9p+Mn8OTYLI0mHo
         4tV5s4UMERhPlGhgbXksnpiswUWt93wqIvLqA6eQ2DvZr+Sxci0CkMXzU7hTSFAPpumy
         FZ/XXn9HmbdU7fMrvb8B3jZ1fwm0UZGePTiQISHFv/wTJMcj/owt1Len04XUO1bs9My8
         Q6VD35hX2b7hSMdx095Q+aCZ6ypu9mwDf5ZNRcMnrNE2eTz4dKWZK56ltG9V+5dSqAHc
         934Q==
X-Gm-Message-State: AOJu0YwFgZYkE8P+zY/FrUj6Pud/biqpA8HWn46sse+FaT5d51YVrCOW
	Q4Bi755IYSHKPZGdRbfD0X6pDQ==
X-Google-Smtp-Source: AGHT+IHvqKMeMD59wsOARYBHIOOtmh9DOb0vYqoILiQ4tuG247ufeLMp7wMGy+ZaKH140knr325lBg==
X-Received: by 2002:a50:d7d4:0:b0:53f:2128:ff4f with SMTP id m20-20020a50d7d4000000b0053f2128ff4fmr4619581edj.17.1700482388356;
        Mon, 20 Nov 2023 04:13:08 -0800 (PST)
Received: from [10.167.154.1] (178235187204.dynamic-4-waw-k-2-3-0.vectranet.pl. [178.235.187.204])
        by smtp.gmail.com with ESMTPSA id i22-20020aa7c716000000b00548ac80f90csm1324584edq.40.2023.11.20.04.13.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Nov 2023 04:13:08 -0800 (PST)
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Date: Mon, 20 Nov 2023 13:12:52 +0100
Subject: [PATCH v2 1/4] arm64: dts: qcom: sc7280: Add ZAP shader support
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230926-topic-a643-v2-1-06fa3d899c0a@linaro.org>
References: <20230926-topic-a643-v2-0-06fa3d899c0a@linaro.org>
In-Reply-To: <20230926-topic-a643-v2-0-06fa3d899c0a@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 cros-qcom-dts-watchers@chromium.org, Andy Gross <agross@kernel.org>, 
 Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, Stephen Boyd <swboyd@chromium.org>, 
 Akhil P Oommen <quic_akhilpo@quicinc.com>
Cc: Marijn Suijten <marijn.suijten@somainline.org>, 
 Luca Weiss <luca.weiss@fairphone.com>, Rob Clark <robdclark@chromium.org>, 
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, Konrad Dybcio <konrad.dybcio@linaro.org>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1700482383; l=1670;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=FO3D/4Lb+LmHq1IGkCnu/dhJPyd8/ht4WBGb18ODAj4=;
 b=GDIoeoFFvlB60e66DCtoCtdYcFDJbtJgGMbZGN5KrIZ1iWjzao4lxLmmp21pEUKM97CcEFTle
 lF26xtdb/VUC4IGtZsC0gvQrUiKc+np3MWMmV6N9bzHMdNmiX96otsu
X-Developer-Key: i=konrad.dybcio@linaro.org; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=

Non-Chrome SC7280-family platforms ship a ZAP shader with the Adreno GPU.
Describe that and make sure it doesn't interfere with Chrome devices.

Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 arch/arm64/boot/dts/qcom/sc7280-chrome-common.dtsi | 2 ++
 arch/arm64/boot/dts/qcom/sc7280.dtsi               | 9 +++++++++
 2 files changed, 11 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sc7280-chrome-common.dtsi b/arch/arm64/boot/dts/qcom/sc7280-chrome-common.dtsi
index 5d462ae14ba1..88fc67c3646e 100644
--- a/arch/arm64/boot/dts/qcom/sc7280-chrome-common.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc7280-chrome-common.dtsi
@@ -17,6 +17,8 @@
  * required by the setup for Chrome boards.
  */
 
+/delete-node/ &gpu_zap_mem;
+/delete-node/ &gpu_zap_shader;
 /delete-node/ &hyp_mem;
 /delete-node/ &xbl_mem;
 /delete-node/ &reserved_xbl_uefi_log;
diff --git a/arch/arm64/boot/dts/qcom/sc7280.dtsi b/arch/arm64/boot/dts/qcom/sc7280.dtsi
index 04bf85b0399a..58563f8fdc16 100644
--- a/arch/arm64/boot/dts/qcom/sc7280.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc7280.dtsi
@@ -152,6 +152,11 @@ ipa_fw_mem: memory@8b700000 {
 			no-map;
 		};
 
+		gpu_zap_mem: zap@8b71a000 {
+			reg = <0 0x8b71a000 0 0x2000>;
+			no-map;
+		};
+
 		rmtfs_mem: memory@9c900000 {
 			compatible = "qcom,rmtfs-mem";
 			reg = <0x0 0x9c900000 0x0 0x280000>;
@@ -2613,6 +2618,10 @@ gpu: gpu@3d00000 {
 			nvmem-cells = <&gpu_speed_bin>;
 			nvmem-cell-names = "speed_bin";
 
+			gpu_zap_shader: zap-shader {
+				memory-region = <&gpu_zap_mem>;
+			};
+
 			gpu_opp_table: opp-table {
 				compatible = "operating-points-v2";
 

-- 
2.42.1


