Return-Path: <linux-arm-msm+bounces-47791-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id AD751A32CC3
	for <lists+linux-arm-msm@lfdr.de>; Wed, 12 Feb 2025 18:04:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7E88818891D8
	for <lists+linux-arm-msm@lfdr.de>; Wed, 12 Feb 2025 17:04:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 389B92580FC;
	Wed, 12 Feb 2025 17:04:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="UgwFRpdV"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24FAB230D0E
	for <linux-arm-msm@vger.kernel.org>; Wed, 12 Feb 2025 17:04:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739379857; cv=none; b=OBOALmx3/+I6ig0bKauxmOAeRRl3aJeXK2ODqAKazLaenIJkrxTQsAMpArZKSKljCC2/4pbWqFplb722mDZTwBdESLbhpWaE43am0dOlcMF+wKSJ6y0AaROI8VKhTNse27ftNk/gPm6F++tK5V1bvz9XuBMxU/376yRCD9wyPUE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739379857; c=relaxed/simple;
	bh=dZLTyL5Jo0WkWOgkozlRifcSGo0Fs8OvFcrqWNfJV38=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=O6stlwk97hmXN6ws6MPpLI8LIEBZ71jbCxUBYcJWaZ/V5N2AakbrtQjacy2sTLlHXkDykM6DmYyTQcEYm+7rX3AxdBTrnMd++vkNrQfyhK8nQFccfjGOKdJSlZwW07evLTmwvgVzaLXMHWO8xar4MsWgWNqFf3VNCXyRntoVPec=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=UgwFRpdV; arc=none smtp.client-ip=209.85.208.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-5de74599749so5879729a12.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 12 Feb 2025 09:04:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739379853; x=1739984653; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/ETufHHcSLBOiDs8I75mjKcj7p1SMnmX1pv07/8BkWg=;
        b=UgwFRpdVKXzwykkCaLhWewusSn8fdYBELWyhwcRhDY5nIn9PvPSlK/zhOqRo4oU9iR
         iyPqEQLgttcojQbcAjWRDFgfaBh9+R954FNkfK3mNzSOcQDs0MzHctj9jq6990hEb1mB
         cq6xOF9W9kKdXk5wHPQaz+Guizt937aG4m7fx21/4jS+Vg30tYm+wTYSzhPFhXo56Hsp
         nt5hJQdjFAGjMo8EziIzgni4dDaox/5yM+xMnRWVp95QNRgws/7P/XjeI8qvDFDI0vzU
         DyYQJhC2QVnBXcQ3DUtX0mcPEtqYyB8t2Hi8niMfoo4SKDOeJhLPO8SMvGHxPPZjX4TY
         HDdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739379853; x=1739984653;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/ETufHHcSLBOiDs8I75mjKcj7p1SMnmX1pv07/8BkWg=;
        b=nd+XMY0u0UMFCkEJhg2TQilUztfuBtzkomDLRorto4sbAHFJR1E2gcHGftTmLJju2p
         ifcy125eq+IFgzWrKfMNHiQt47yvBVbG0PHryA+7i/q3Iv1HWkORvCpqAy0Qxy42NnvC
         fT+JEuEcSJOsRocwrVp0F7v055GrnVcRjtBnuenLqnlkWyDOlSQWqNX6AEGde+WxofGg
         6FoM8ftgGH2DgSVzUvJfuHzehYJCRIvQPnkptbOe/RIYhATFaK4FVG9jKSPOr20uScC9
         /pHtg7JvuU4QPp9InR2/V8rGF6khK2F5C48nT02iw44KYg6YeAU2Xzq/AAmDviAhM6xT
         2mTA==
X-Forwarded-Encrypted: i=1; AJvYcCX4smnnFtXMKj6BLv8Rf/XSwm/Xc37VDwOXHqaaMHV6krAUYwp9ct0nrAnRnCKcwVG8ZnWuLXjZytW5d3eO@vger.kernel.org
X-Gm-Message-State: AOJu0Ywsw6qml0m12+ZL5BXfWdipnNIBCBUgk+YYlXmZedMGGO6zleIf
	uwq7YxqcWe8RKQQ4qeepLmcEuYLBxmJX1N4mHQqff/MwPp8cnGJobNOVB0wwfjHOmXK9sh8ZisF
	U
X-Gm-Gg: ASbGncu0r5zqiUwrO9OKcmPDuKaOI2OvptCvrRzKAvlEJ+H7tsrBLNqNS99xppINkVp
	nCYgzp18TNM6k0m23vPH8HJ049bC5u8aF2OmbOB2bcRSXHTp7gV/cf5FLrh9/rd1vLtlszSYHQ9
	NKBOv2EB5YpxBcWfrSiQO5k1JgwlFwZ4uL9PTDMFVwKfGoJdoLc5Ay2m2GQqDQaZdIKRJib3igX
	LP1lRQlaJ+uTukIrMPzyMv86NEbjPumQcFwu13PeVicL4BirL6ttZS6eRcNkGeV0X5dnt89a7Dl
	irMWdo75GY7n0qdwQleacDqWQ5fi
X-Google-Smtp-Source: AGHT+IFgv3L3zsor+TgyfP78cIeIu8na03bo/tdai+ppenHCk0PSZruKWml8PrAfOHPg+AysJiSwag==
X-Received: by 2002:a05:6402:2089:b0:5dc:88fe:dcd1 with SMTP id 4fb4d7f45d1cf-5deadd7fdbbmr3639946a12.12.1739379853331;
        Wed, 12 Feb 2025 09:04:13 -0800 (PST)
Received: from [127.0.0.2] ([2a02:2454:ff21:ef41:52e8:f77:3aca:520e])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5deb9f6e46bsm819230a12.71.2025.02.12.09.04.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Feb 2025 09:04:12 -0800 (PST)
From: Stephan Gerhold <stephan.gerhold@linaro.org>
Date: Wed, 12 Feb 2025 18:03:47 +0100
Subject: [PATCH 1/8] arm64: dts: qcom: sm8350: Reenable crypto & cryptobam
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250212-bam-dma-fixes-v1-1-f560889e65d8@linaro.org>
References: <20250212-bam-dma-fixes-v1-0-f560889e65d8@linaro.org>
In-Reply-To: <20250212-bam-dma-fixes-v1-0-f560889e65d8@linaro.org>
To: Vinod Koul <vkoul@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Andy Gross <agross@kernel.org>, 
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Yuvaraj Ranganathan <quic_yrangana@quicinc.com>, 
 Anusha Rao <quic_anusha@quicinc.com>, 
 Md Sadre Alam <quic_mdalam@quicinc.com>, linux-arm-msm@vger.kernel.org, 
 dmaengine@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.14.2

From: Luca Weiss <luca.weiss@fairphone.com>

When num-channels and qcom,num-ees is not provided in devicetree, the
driver will try to read these values from the registers during probe but
this fails if the interconnect is not on and then crashes the system.

So we can provide these properties in devicetree (queried after patching
BAM driver to enable the necessary interconnect) so we can probe
cryptobam without reading registers and then also use the QCE as
expected.

Fixes: 4d29db204361 ("arm64: dts: qcom: sm8350: fix BAM DMA crash and reboot")
Fixes: f1040a7fe8f0 ("arm64: dts: qcom: sm8350: Add Crypto Engine support")
Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
Signed-off-by: Stephan Gerhold <stephan.gerhold@linaro.org>
---
Luca sent this patch before, but it was never applied:
https://lore.kernel.org/linux-arm-msm/20240108-sm8350-qce-v1-1-b7d586ff38af@fairphone.com/
---
 arch/arm64/boot/dts/qcom/sm8350.dtsi | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8350.dtsi b/arch/arm64/boot/dts/qcom/sm8350.dtsi
index 69da30f35baaab67e51afcbca3486fb89c14f281..5f93cae01b060cf99c0de56f603e860aeebc5f67 100644
--- a/arch/arm64/boot/dts/qcom/sm8350.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8350.dtsi
@@ -1806,11 +1806,11 @@ cryptobam: dma-controller@1dc4000 {
 			interrupts = <GIC_SPI 272 IRQ_TYPE_LEVEL_HIGH>;
 			#dma-cells = <1>;
 			qcom,ee = <0>;
+			qcom,num-ees = <4>;
+			num-channels = <16>;
 			qcom,controlled-remotely;
 			iommus = <&apps_smmu 0x594 0x0011>,
 				 <&apps_smmu 0x596 0x0011>;
-			/* FIXME: Probing BAM DMA causes some abort and system hang */
-			status = "fail";
 		};
 
 		crypto: crypto@1dfa000 {
@@ -1822,8 +1822,6 @@ crypto: crypto@1dfa000 {
 				 <&apps_smmu 0x596 0x0011>;
 			interconnects = <&aggre2_noc MASTER_CRYPTO 0 &mc_virt SLAVE_EBI1 0>;
 			interconnect-names = "memory";
-			/* FIXME: dependency BAM DMA is disabled */
-			status = "disabled";
 		};
 
 		ipa: ipa@1e40000 {

-- 
2.47.2


