Return-Path: <linux-arm-msm+bounces-12048-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F28A85D8C2
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 Feb 2024 14:05:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C48721F2440B
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 Feb 2024 13:05:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 406C06A32A;
	Wed, 21 Feb 2024 13:04:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="h44mdi4X"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 703A669D2B
	for <linux-arm-msm@vger.kernel.org>; Wed, 21 Feb 2024 13:04:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708520685; cv=none; b=kUHZ7d+hVIL6uM5zaKAFdJXbxAgjSP6ZjuhhPMQEJea5IqcXc72u6gTkFDfT+44AbLwr0W68T6hRKtAQ1vW4eMDCxArlgYvhXRD/WLlcAnr4MrY+Fr7u6Ep0wddwE01YdQsHW1yOLOS6A4FTCrqOhDe4xaK6NuFHNtBxM6oSlCk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708520685; c=relaxed/simple;
	bh=TCLTQOaE9W3yz6211b4jg2MbG6D93HJgYpElaCnIFns=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=WpUGyRPwrg8tdFGVZN9NOWlrtrvIPysAXBdp2r2oblCSo6pesa+sShdc8djST47DHh+L+t5di8LAWLvGaK5u9BS69pSEi2thV5vaakRriK7ScZFSrOdcaWrF3TlrLijGoKh9Js7/nijoce0ua+SeA4oU+lqLs5NFXUfAnCm9qzY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=h44mdi4X; arc=none smtp.client-ip=209.85.208.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-563f675be29so6376191a12.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 21 Feb 2024 05:04:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1708520682; x=1709125482; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WxgDZls4oUJUrfVi7cjKLWFxpNjiKDYYhQmE5hDFALM=;
        b=h44mdi4XsbKa7YqAdVZbKHY66yJ7lzSxQqYjIzSSWj9rWd4HHvcLcS1hT8jJaXZI4x
         +WDvlVwJNeRTXBYz7wvEok5GwWDoAuznhxBIRWd69Q8TFGiD7+Pz7aAaTH6JFIEzJrL/
         oKFTs/5PIUZ69fhMe5RMSfrJ+XuLxX4w/Y28gAH6MwFGji/ZdfXxt+x8q/m5WcWHSkwg
         UQ8ST30gnRwLfaclJt6kys5s/BLczqsGCno51rWgrrkvOUUhlwiUTcJ4O6QJT8KO0WF6
         +g0qiU3euwq5p3bIU2wGfdMBsUVZq8/40H5EDxrDueQM8CIlIPHvrAzdyMFZ+FC6mgax
         xQ+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708520682; x=1709125482;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WxgDZls4oUJUrfVi7cjKLWFxpNjiKDYYhQmE5hDFALM=;
        b=WAGa4RVGbspyA4IKRU+7HaV0Gv+nLkU1XHmGt8VGd3CK+jme9N1C0I3g7eXHiVhQec
         vQGAKOp3XreSmFVvW/oFF14sadIldnj2z8GrrvjmG2U0uQ4SQB623HmN5YErVxOwg4A0
         jRG8xWsfiZhHdSNNz9YcIIVtE0B1Tmj906bAtZVPc3gHXjrPt7MdT7aNOYu2D2JxTSFt
         Hx7M6auiV14D9YCl0gAEjV85qWtbeQ6GpLZUn0Bisw4pGleJFSzXHcCrWl4EViPtBgXB
         f8C45vFlgLoBgIKfZrPTReMDlFvftWR0V+k4KcwbJw5TDFoFPOKkO/d5ex2xWbjRLGcW
         AN8Q==
X-Gm-Message-State: AOJu0Yxn475iuSY3tf3cknrero9ohLtevyc9wzKmI0rX0nTHJAe1nUrp
	iCflEcZ5Nt8Rw6Lgm6SXLIVCbafxjyhaANa+5abuwl7+L2fMvJovHS7XSFucZbg=
X-Google-Smtp-Source: AGHT+IEAEPWJ1mFf71gKzasgIivGVKz42nRKGPTpX0UseeihBEBXEU+IR2sAhnd+n52/Hnqa/Hb/7Q==
X-Received: by 2002:aa7:d996:0:b0:565:10cd:835 with SMTP id u22-20020aa7d996000000b0056510cd0835mr565438eds.28.1708520681789;
        Wed, 21 Feb 2024 05:04:41 -0800 (PST)
Received: from [127.0.1.1] ([188.24.162.93])
        by smtp.gmail.com with ESMTPSA id a20-20020a50ff14000000b0056459eafc0asm1356178edu.17.2024.02.21.05.04.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Feb 2024 05:04:41 -0800 (PST)
From: Abel Vesa <abel.vesa@linaro.org>
Date: Wed, 21 Feb 2024 15:04:26 +0200
Subject: [PATCH v2 2/2] arm64: dts: qcom: sm8650: Fix SPMI channels size
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240221-dts-qcom-sm8550-fix-spmi-chnls-size-v2-2-72b5efd9dc4f@linaro.org>
References: <20240221-dts-qcom-sm8550-fix-spmi-chnls-size-v2-0-72b5efd9dc4f@linaro.org>
In-Reply-To: <20240221-dts-qcom-sm8550-fix-spmi-chnls-size-v2-0-72b5efd9dc4f@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Abel Vesa <abel.vesa@linaro.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1266; i=abel.vesa@linaro.org;
 h=from:subject:message-id; bh=TCLTQOaE9W3yz6211b4jg2MbG6D93HJgYpElaCnIFns=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBl1fTlmlDBAoOi4a1wTc8T3FnmjKuvTzlq2nrYy
 rhqMq1fj6uJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCZdX05QAKCRAbX0TJAJUV
 VpA0D/4l0Oe/tUNbtyU8rcwKmCq+ssGWNqDLo7ea9NnG8LdMDxyxaMmMs7lxyyAAx0r+YjOV5Vr
 xfERDmmzlZ3yHQo7of2nckeL0HG77oSyd1uRCuED8BVFBZyzZB833mIcqCLvU2Q1ugX1kXLznmf
 4Yj0l8zl+zucNarlSaG1JsXslH/O1K15L/aLHWUE12NFo316/hwUWPZ2SHk8LucDiFsbqvgbQCI
 Z/xyNMvtVGtCmhm+Fi+1J5Kg3Zdn7SB86ksTLFLo67uoVzYFA8HYgAy3+X0MEdPYzgUb8Fi6ZM2
 IamM7HKvMurdE84T6NOI3ry3Gkn/XMnTflObdemMqlXubJHMpt/sji+Gs5Eh0HADpOvrSenmErv
 p4z10ipZsRDl3pi/BQzwUEquXkvLrY7f0RE2EmTmZyBReT9aloro6bLZkVUb19XBIjh4/N+q5HO
 0s/VAkSL5FNsEyutDm0LQRO0h/Gdk1XXBa/GAKF/CACXiTdSMurZC+Yb8U2s0wtp7nXFYUbTpxD
 QSXt6q2Ox1HuIxoOFvDKuem0r+yoCXuLMDnQf+HlJYWhHFhv1eIwO8gfA2lKTFgTjLWdZ2J7+RK
 Ei13iXAVlr/FMxZXoRS6JMsaW7X2i0aGwuqxIg5Xy8rY6gBSqvnpxkJpHqqpLqruEC92wlOh/eU
 5+m7R6llTySyc2Q==
X-Developer-Key: i=abel.vesa@linaro.org; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE

The actual size of the channels registers region is 4MB, according to the
documentation. This issue was not caught until now because the driver was
supposed to allow same regions being mapped multiple times for supporting
multiple buses. Thie driver is using platform_get_resource_byname() and
devm_ioremap() towards that purpose, which intentionally avoids
devm_request_mem_region() altogether.

Fixes: 10e024671295 ("arm64: dts: qcom: sm8650: add interconnect dependent device nodes")
Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm8650.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8650.dtsi b/arch/arm64/boot/dts/qcom/sm8650.dtsi
index d488b3b3265e..260eda81b743 100644
--- a/arch/arm64/boot/dts/qcom/sm8650.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8650.dtsi
@@ -3747,7 +3747,7 @@ sram@c3f0000 {
 		spmi_bus: spmi@c400000 {
 			compatible = "qcom,spmi-pmic-arb";
 			reg = <0 0x0c400000 0 0x3000>,
-			      <0 0x0c500000 0 0x4000000>,
+			      <0 0x0c500000 0 0x400000>,
 			      <0 0x0c440000 0 0x80000>,
 			      <0 0x0c4c0000 0 0x20000>,
 			      <0 0x0c42d000 0 0x4000>;

-- 
2.34.1


