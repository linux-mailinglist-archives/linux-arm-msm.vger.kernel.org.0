Return-Path: <linux-arm-msm+bounces-2119-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3886C7FA498
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Nov 2023 16:29:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E8FAE28107A
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Nov 2023 15:29:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DAA0A328D0;
	Mon, 27 Nov 2023 15:29:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="UKonYcAR"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com [IPv6:2a00:1450:4864:20::12e])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3AD06137
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Nov 2023 07:29:13 -0800 (PST)
Received: by mail-lf1-x12e.google.com with SMTP id 2adb3069b0e04-507c5249d55so6617090e87.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 27 Nov 2023 07:29:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1701098951; x=1701703751; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3WME6ubitd3vxaAOMdHVezdwhed8qbighnDEBO169Ec=;
        b=UKonYcARxR2F+oVvEtIZffRRe3YUImWLduFZvNkzJxKbi4hJfZa9bu411c5qWtcmko
         22xkUEofvENTiEvu7JUT0ZcgBGZ6wDCWgAhw+N9VDkHUyWR+rAuK0rlNiYTF+RHLY5Z+
         D2LKUNClcPN30hH82qlHHr0EmGXhFl6sViSnQtt6JfvN95A268ur8+AysSUfa7uVsC1I
         HHH7e0h4OMAd+VzCIqh/1F5lmA6xXs+TlQB0GeDMGtjDyyk9CfvHIiBvooUBnd1OqHQj
         fbGrtTRQFsfp8PTt0LpS/dgrhrNQ59PY8mRyTY+r/XmlZru6e/nBDe4Wu4MkmnthA8Ed
         r+VA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701098951; x=1701703751;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3WME6ubitd3vxaAOMdHVezdwhed8qbighnDEBO169Ec=;
        b=bT4f5eaSa6w2Qaqkj74JGrxKHR6VPqy/AlRNeJXBgfvVAHoFDhryFbcR1KUkdmk5nv
         MPhOAMFkZ62ZLyRuvpDEid93nkgB8jcXKcAOVwa2XWsiOk/xvwUHGrKh0pc81DfRyoAP
         2Nfyn3qqJaXW1gr0KQ10z32oHuoZ9o9DezAvkAVA9CU6xjVC8skV7ud3NvpgTavXv3yq
         0cS+gJJxgGk4FDVxr2OQZC6tps5uBBzsSXCHKG6Owi6UFMuBjMn5DbQB4kSrRuGxtVr8
         MNtcawzsIaYUfQNbr4N72MILSXYHGr5hERCCd3Z6OkMP1dDgFeWaDZTqAUuOGewjmYvm
         YOfA==
X-Gm-Message-State: AOJu0YxINjGOfbP/wSnm6pgk+NnSOqDzzvHyA6et4VGSuRedjj7BE0tH
	15JsnafDTbmVIuxOIyQlCZtYfw==
X-Google-Smtp-Source: AGHT+IH9PASqf8+9MS/t3uEvXsv+5J3bCkLHJgeNIv00zKAMBrW7rkqqrSRlRaaexUly2vTsBuJ+TA==
X-Received: by 2002:a19:ac48:0:b0:50a:6fc5:e95c with SMTP id r8-20020a19ac48000000b0050a6fc5e95cmr7956561lfc.60.1701098951013;
        Mon, 27 Nov 2023 07:29:11 -0800 (PST)
Received: from [10.167.154.1] (178235187180.dynamic-4-waw-k-2-3-0.vectranet.pl. [178.235.187.180])
        by smtp.gmail.com with ESMTPSA id e7-20020a056402104700b00542db304680sm5321002edu.63.2023.11.27.07.29.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Nov 2023 07:29:10 -0800 (PST)
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Date: Mon, 27 Nov 2023 16:28:46 +0100
Subject: [PATCH v2 06/12] arm64: dts: qcom: sc7180: Add the missing MDSS
 icc path
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20231125-topic-rb1_feat-v2-6-979b28f35e4a@linaro.org>
References: <20231125-topic-rb1_feat-v2-0-979b28f35e4a@linaro.org>
In-Reply-To: <20231125-topic-rb1_feat-v2-0-979b28f35e4a@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, Loic Poulain <loic.poulain@linaro.org>, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 Georgi Djakov <djakov@kernel.org>, Will Deacon <will@kernel.org>, 
 Robin Murphy <robin.murphy@arm.com>, Joerg Roedel <joro@8bytes.org>, 
 Krishna Manikandan <quic_mkrishn@quicinc.com>, 
 Robert Marko <robimarko@gmail.com>, Das Srinagesh <quic_gurus@quicinc.com>, 
 cros-qcom-dts-watchers@chromium.org
Cc: Marijn Suijten <marijn.suijten@somainline.org>, 
 Rob Herring <robh@kernel.org>, linux-arm-msm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-pm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 iommu@lists.linux.dev, Konrad Dybcio <konrad.dybcio@linaro.org>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1701098925; l=1145;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=QxbVxThi6gj4JqQP8V9LpJsjR/myuVOnIJbwHX7amYU=;
 b=fS2uPRd3j9acJg11U61tq9XVN8ayomlEw9d5ATm43L3nTtaAyensMfnnnvE/jpMI6SBpUTurk
 TEzmocPClnSCqU9FEoaODlLAlpLeRUPaiJm5qFPFJKjE9fYnQKYi6tN
X-Developer-Key: i=konrad.dybcio@linaro.org; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=

MDSS, aside from the MDP-MEM path, also requires the CPU-DISP_CFG one.
Failing to provide it may result in register accesses failing and that's
never good.

Add the missing path.

Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 arch/arm64/boot/dts/qcom/sc7180.dtsi | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sc7180.dtsi b/arch/arm64/boot/dts/qcom/sc7180.dtsi
index 11f353d416b4..9664e42faeb1 100644
--- a/arch/arm64/boot/dts/qcom/sc7180.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc7180.dtsi
@@ -3100,8 +3100,12 @@ mdss: display-subsystem@ae00000 {
 			interrupt-controller;
 			#interrupt-cells = <1>;
 
-			interconnects = <&mmss_noc MASTER_MDP0 0 &mc_virt SLAVE_EBI1 0>;
-			interconnect-names = "mdp0-mem";
+			interconnects = <&mmss_noc MASTER_MDP0 QCOM_ICC_TAG_ALWAYS
+					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
+					<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
+					 &config_noc SLAVE_DISPLAY_CFG QCOM_ICC_TAG_ALWAYS>;
+			interconnect-names = "mdp0-mem",
+					     "cpu-cfg";
 
 			iommus = <&apps_smmu 0x800 0x2>;
 

-- 
2.43.0


