Return-Path: <linux-arm-msm+bounces-21132-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 016588D4F58
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 May 2024 17:44:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 81A31B27E05
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 May 2024 15:44:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1618818628E;
	Thu, 30 May 2024 15:43:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="srWMMuT5"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D8C3183974
	for <linux-arm-msm@vger.kernel.org>; Thu, 30 May 2024 15:43:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717083836; cv=none; b=d1u01G+M5E8lQ60Ic/vqs4Wbt/vQ16bQ9TYbAfcMaL4qzMqgPlKydw2+TVZhZv0NsLyIOrQGgSCQF/TuBUpC+XvCB66Hy7yoqIShwexAYZGEzCEMV9Vw9YZ3cqEvOsYhu7QxDFA+53GPaOI1bSqe8tnqfCPpNlu/6P82sQ1zG9s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717083836; c=relaxed/simple;
	bh=GyiMM+dAIAnQ+06S/bZkT8QMDDiz6YgGkXyHGZZYv8A=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=dLK1eCFk3snfN+TtZ8sdy7ezgiaNiolqS+cTQRoU+mSwSYRdYFDqJtFSuZ+n03mAanjDqtyYlNSA8pj7UT8PT3AN/5AGClSb1kq2VKz43rhlM41fIltCsyOK/cQac08asj2eFMAqfh6abhgJz6FUGD+3Nc5ZhsrbeltOtxN0xks=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=srWMMuT5; arc=none smtp.client-ip=209.85.208.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-57a033c2ec2so1093648a12.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 30 May 2024 08:43:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1717083833; x=1717688633; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=o/EitmxAsyzTzEzD4CEr43TovKYsnsXlvhYZYAkIRko=;
        b=srWMMuT5t+6jNO0SbYW4vFZDjWmOAHF824qY4lbfdYg8fkkCDJzgekcGuF9GDgO+5O
         4KzotA/IWeFSrlOhD+Vl5h/p6pFc9MHHqPw4ffNdKaWayyudUnk7fZG6Qdr2n4okMLWw
         2qRIsavFRUv7JDiKhFVdKlh9If8758NAtn+dWLjC8pMKPxBA8cQZiyoV+YR+Ss6QOWvS
         EcSnDtdxHZsCJnOn746YLmOi7mpQrzFTrgWsgpOV9/n7HgEIvPlzJn6o1dlBVblnzh/E
         r2LMEgmfk89ggcXLVaK3J25B42HABmxi918TgHGPKkfyb0j5AqN2u07li3iTAD+YOTVd
         W/Iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717083833; x=1717688633;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=o/EitmxAsyzTzEzD4CEr43TovKYsnsXlvhYZYAkIRko=;
        b=WXB27QqvAguXtUyz8o1BqavcQHlBicuprtxhXEjAbSD0vaZHH+jt8n1bd4mE031Or7
         ymePrD7s6aVpf6oKwaoOIdOfYT5oKv+66xEG9fcrPTryB8+rRNTSEloU8P+hDhhsgUj5
         3yhiCkA11lEOoqVeWGsDMMUXlVaW+a3RfEVE5sKnGu9Osr/wi77dCnu4PNfkOQwWVuu8
         62rS3ncXI5XD4cc9DARwi/VMGnV3GIn71LSMp9/8GYpsPAlZEkgBOftbMMaKij6Kenci
         oUNvLsbdh6JsDVlDu1cSFcPZUDEH3XSHYdmAbBGYZfsMbsOs/xY9PSqXfV8Jqg86cllr
         wiyQ==
X-Gm-Message-State: AOJu0Yxgc6NayfJRNVQ7N1zaOoKOngixFaQHv3zzmawSurboOfOR/r46
	J9zmKgmWbYsmWLzo3gaxog3Y/IsdxDrTuyH3UtQvlDOr4caBxh6MMO4vK/hq+yc=
X-Google-Smtp-Source: AGHT+IFcgDEc2SQAN6dKOstr+NgbiOD1TO3PqsGm+H1JUaIEdhg8fPRbH1J6Ksgrt+PPLpOGCC7kmg==
X-Received: by 2002:a50:ba8e:0:b0:572:3bcc:8370 with SMTP id 4fb4d7f45d1cf-57a17716475mr1588856a12.0.1717083832574;
        Thu, 30 May 2024 08:43:52 -0700 (PDT)
Received: from [127.0.1.1] ([188.27.161.69])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-579deb8f406sm4879700a12.34.2024.05.30.08.43.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 May 2024 08:43:52 -0700 (PDT)
From: Abel Vesa <abel.vesa@linaro.org>
Date: Thu, 30 May 2024 18:43:40 +0300
Subject: [PATCH 2/3] arm64: dts: qcom: x1e80100-qcp: Fix the PHY regulator
 for PCIe 6a
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240530-x1e80100-dts-pcie6a-v1-2-ee17a9939ba5@linaro.org>
References: <20240530-x1e80100-dts-pcie6a-v1-0-ee17a9939ba5@linaro.org>
In-Reply-To: <20240530-x1e80100-dts-pcie6a-v1-0-ee17a9939ba5@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Sibi Sankar <quic_sibis@quicinc.com>, 
 Rajendra Nayak <quic_rjendra@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Abel Vesa <abel.vesa@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=752; i=abel.vesa@linaro.org;
 h=from:subject:message-id; bh=GyiMM+dAIAnQ+06S/bZkT8QMDDiz6YgGkXyHGZZYv8A=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBmWJ6yezLieSjidJtP53yUudxkcU/pV1tOfM8Vq
 Q7XzPe2oCaJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCZliesgAKCRAbX0TJAJUV
 VgkOD/9Y38gXEr/nOrKtw+zdUYCLp3JxBDf1xit1O0CwUggv4D+B+33J1yckVoatDoNEuTJptMA
 eqpkTmk/m1SDPQRn/VGVAxr5xDF3NCz1+GwLrpE83+oYOybhHDwZQjsu7hoOAX9g09Wl0mQ8qpR
 zbmM/aw7r0+2ni0pgkzjP1XiogF30hJVROzNyDHDjt/1O4G3xxs+56vklgQF1f2c8aRQleczRnd
 XLBPRFbMTSJXXmqGKJzOi9P7fvtYWC24AKQeTF5WcGzWH0mGghcYnkfHSY9cijJ/bLfp8WooHKm
 n0fIBB4Tv/s9zvm6mg7kcxRwX1b123XUdSQcZYfZZLTn/s/pCYwyw/E7NHe1EZb11EqoYrbjdyr
 MsJQqHyUr0WzVFM0/gIG0D58+mB58bxFdo4FNZ/4jr57a0U118E9XmXUdWvp9FrDTFbfCRubeO/
 4DJmEjTL5E3IJmnbb855O8g+8LKE3g2B1cgosxvfLjh3GCGUbchdaad+7aeR8FegLbZmOWFEP9f
 D/dzG3n5t64VbCJ5OczzGmEmBRDC6uxV8D21+fsdokQSfC9yvcJAwSDwZoHk/SEvrL9ria+mynd
 HQOFQDmsB4hAYnqDuSK0bbPNN2SozUm/AXrD0mJhMrjKRmm3/JA8sM4rDi9OmPaLeayd0LKvbzg
 3Q3z6GKbfZex7Mg==
X-Developer-Key: i=abel.vesa@linaro.org; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE

The actual PHY regulator is L1d instead of L3j, so fix it accordingly.

Fixes: f9a9c11471da ("arm64: dts: qcom: x1e80100-qcp: Enable more support")
Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
---
 arch/arm64/boot/dts/qcom/x1e80100-qcp.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/x1e80100-qcp.dts b/arch/arm64/boot/dts/qcom/x1e80100-qcp.dts
index 3de7565dda19..e1b19177523f 100644
--- a/arch/arm64/boot/dts/qcom/x1e80100-qcp.dts
+++ b/arch/arm64/boot/dts/qcom/x1e80100-qcp.dts
@@ -470,7 +470,7 @@ &pcie6a {
 };
 
 &pcie6a_phy {
-	vdda-phy-supply = <&vreg_l3j_0p8>;
+	vdda-phy-supply = <&vreg_l1d_0p8>;
 	vdda-pll-supply = <&vreg_l2j_1p2>;
 
 	status = "okay";

-- 
2.34.1


