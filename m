Return-Path: <linux-arm-msm+bounces-9175-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1418A843747
	for <lists+linux-arm-msm@lfdr.de>; Wed, 31 Jan 2024 08:11:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BAF4A28A2B6
	for <lists+linux-arm-msm@lfdr.de>; Wed, 31 Jan 2024 07:11:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4589142060;
	Wed, 31 Jan 2024 07:09:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Ie9O1BMH"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF40463504
	for <linux-arm-msm@vger.kernel.org>; Wed, 31 Jan 2024 07:09:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706684946; cv=none; b=t4OsMCK6a2eQoa2urOZPhiPVdgq41GGDxFH3Yx6K333DcPkYCvQGMPRcBp99CJ3h7JPXgghj2xhgjXXjrWbFLslezqQLTlF+ObTnphnOia4ybztRLTVwQE8W5kSrZDx6KK/oi8l96VjtySqv9n9izL3Zd7dfJu8AI0RqWJqea3M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706684946; c=relaxed/simple;
	bh=ROl06bKVN5C5JMVM/k0aozEkWtTHx+mchi2GT8R0eL0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ujQpMs3TOsIr5nBuOZxXMpf0By6jUXltLddBM9KsGbwlCr8CXzJGDdP8Xkr6I8g+pQFa4lCacfz6g7nn/j5daJ+jnX5/vcha5klfF4ggLuvlp5Q3xIROIBs/2kRvqOBM3PqwfbVKhKG5gqWYErqvQxUWOCquIohD5cvJIIIQuks=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Ie9O1BMH; arc=none smtp.client-ip=209.85.210.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-6de287449f1so1863413b3a.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 30 Jan 2024 23:09:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1706684944; x=1707289744; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=P9oRSAu04dlCPd12GT5wZXY8U+i0UJEJNPn5iJdXIgA=;
        b=Ie9O1BMHkoW9pJr2jmDLcbg/LaPtxc6M5VRjZ5AK6NxQu3Hq1ZJ6toTs7hghp5Nc+K
         BG8s0qqShF0rQgxzOBWTq/XKlGbzPkzEwkcYrdy+FHTDNoNsjy2slGQjxYCb3JXtyxPh
         A4abz+333oWLI/Sd5g4JkasQAvodpIA0K3666aaZncdqii3gANvujl6Y0fycLPsH+/f6
         3MQD9CGbbCGO2juDzfPMRRvj6/4pfuD3iTuhV8qM7stwWC96SOj4a9xIjOSaTFTKm42D
         dGaXWtb0EB/jEZa/US9ZBaV14argjzLSqmFJlhffUTp2+ykxLV3oXz5+QlOzJeWueqtr
         SrLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706684944; x=1707289744;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=P9oRSAu04dlCPd12GT5wZXY8U+i0UJEJNPn5iJdXIgA=;
        b=vUBbF7ygViqpUHod64n3+d8RrB2sjzXXxckIYtigF9X0wvNR7A5DW3X5r0TXPsXe1j
         U+Uxw0L/bb3b7xnL5g8iQxkpItVvUWpmaDj6kWnSaBjie46ezm80IOgmSpf17lPKC8NY
         G30999AwEOgDt7bkr6oStdGK8Asvcu1lLsDhJjG1cjhsTxP76op3K3Xfu3fJ5N9mo4/c
         2URbf1sh1AqUNU/4b1yZ2SVzlzPZiofgoq7dvWJiJnRVguUO5M8scc3O5US3nWC27ha3
         zmzUJcp8W8A5tDkg2tmX29KQ3Gnrj7BsCPxZE7RERFC5z4CgeTuNQyJSGMOyrvKCM2YM
         htKg==
X-Gm-Message-State: AOJu0YwnZpj6V0w/Yjc+ZCg9Y2nD0AYbg4hzxWTpRr7MMO3xGoUkRQWq
	dwjRu0Thvo1IfQY4O747rimzPUeIf5cBnpci5S/di5tfVOaIs2rwSsvfa3p4cg==
X-Google-Smtp-Source: AGHT+IHZyBeQI6x6hJT6GYjp+TEq7RFTYqHZ3UOz5mdIL2YfygnxhP80fmM1OmJz57MlcaGiJbIX8w==
X-Received: by 2002:a05:6a00:938b:b0:6dd:db87:6356 with SMTP id ka11-20020a056a00938b00b006dddb876356mr1201124pfb.7.1706684943548;
        Tue, 30 Jan 2024 23:09:03 -0800 (PST)
Received: from [127.0.1.1] ([103.28.246.26])
        by smtp.gmail.com with ESMTPSA id lp17-20020a056a003d5100b006ddd182bf1csm9087956pfb.46.2024.01.30.23.08.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jan 2024 23:09:03 -0800 (PST)
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Date: Wed, 31 Jan 2024 12:37:34 +0530
Subject: [PATCH v3 11/17] arm64: dts: qcom: sm8150: Fix UFS PHY clocks
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240131-ufs-phy-clock-v3-11-58a49d2f4605@linaro.org>
References: <20240131-ufs-phy-clock-v3-0-58a49d2f4605@linaro.org>
In-Reply-To: <20240131-ufs-phy-clock-v3-0-58a49d2f4605@linaro.org>
To: Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, Vinod Koul <vkoul@kernel.org>, 
 Kishon Vijay Abraham I <kishon@kernel.org>, 
 Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-clk@vger.kernel.org, quic_cang@quicinc.com, 
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=openpgp-sha256; l=1280;
 i=manivannan.sadhasivam@linaro.org; h=from:subject:message-id;
 bh=ROl06bKVN5C5JMVM/k0aozEkWtTHx+mchi2GT8R0eL0=;
 b=owEBbQGS/pANAwAKAVWfEeb+kc71AcsmYgBlufG9iupD1/Y4aBPSYlnuMUF3Udkm8VJwVjvGz
 uoQhWBDgyWJATMEAAEKAB0WIQRnpUMqgUjL2KRYJ5dVnxHm/pHO9QUCZbnxvQAKCRBVnxHm/pHO
 9YyOB/47DylBxJWasrkUuurfb0gcQALAFgW3b7qLrDKrxTl/uNX6iZj7wgH2YdtS3/PK96mUaXK
 wB7CxJOcNjN/25xYGPRnyCTK/qkRl7jwXKD1YuMsE0HQaWYjQSTehD6GZwk9OpoGc89D30CmNjY
 2krUhFisIhqOYNl+MMZYPcJ48WnsA3uJFiYfjCVE4CKhdcfGrsFEgz2MZf1BpKWi8gNXQdRHYES
 O88WjY1ujPXxjyUL9/GZRdqqbpucDSRDJsqtU/pwFgR6pvICvAmRqz4mMFY+L808ETRMIthPUpD
 hbkKONYrb2Wkwd+OH5Ih/Lonh4C+dr7mr2PvDZLPL5AgXY1J
X-Developer-Key: i=manivannan.sadhasivam@linaro.org; a=openpgp;
 fpr=C668AEC3C3188E4C611465E7488550E901166008

QMP PHY used in SM8150 requires 3 clocks:

* ref - 19.2MHz reference clock from RPMh
* ref_aux - Auxiliary reference clock from GCC
* qref - QREF clock from GCC

While at it, let's move 'clocks' property before 'clock-names' to match
the style used commonly.

Fixes: 3834a2e92229 ("arm64: dts: qcom: sm8150: Add ufs nodes")
Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>
Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm8150.dtsi | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8150.dtsi b/arch/arm64/boot/dts/qcom/sm8150.dtsi
index ad1af87991ff..eb1acea2631b 100644
--- a/arch/arm64/boot/dts/qcom/sm8150.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8150.dtsi
@@ -2095,10 +2095,12 @@ ufs_mem_phy: phy@1d87000 {
 			compatible = "qcom,sm8150-qmp-ufs-phy";
 			reg = <0 0x01d87000 0 0x1000>;
 
+			clocks = <&rpmhcc RPMH_CXO_CLK>,
+				 <&gcc GCC_UFS_PHY_PHY_AUX_CLK>,
+				 <&gcc GCC_UFS_MEM_CLKREF_CLK>;
 			clock-names = "ref",
-				      "ref_aux";
-			clocks = <&gcc GCC_UFS_MEM_CLKREF_CLK>,
-				 <&gcc GCC_UFS_PHY_PHY_AUX_CLK>;
+				      "ref_aux",
+				      "qref";
 
 			power-domains = <&gcc UFS_PHY_GDSC>;
 

-- 
2.25.1


