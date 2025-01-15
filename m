Return-Path: <linux-arm-msm+bounces-45137-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BFFA0A12556
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Jan 2025 14:48:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 737437A5255
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Jan 2025 13:45:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E9096244F93;
	Wed, 15 Jan 2025 13:44:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="hScIhbNa"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37CCA241A1A
	for <linux-arm-msm@vger.kernel.org>; Wed, 15 Jan 2025 13:44:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736948649; cv=none; b=kvsNiElrivXr0W00TefYxls5LjypKjgzI8DFUe+xXVUaV1raXT2OlglvmHmjD5rrCAvkVIBD7FDxhMPbsUQU5b0wPvuE/2vwE8HjvnGBOLl+PRyDNf1XyceS3jwguew3edSWYnuU2Bad+d30QY8SwOb+WSbA5KLoK/7teoBd42Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736948649; c=relaxed/simple;
	bh=8UuCn+tG6hW9MwAi3YwmmG+cNK670avytcDu93e2NB0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ZKOChfd7yU4rcrvBZj9Xnui7cpW+O5RR6tmxxhsvtfN5jDqMmEuzt8wLzj5h0bCf/uG+5EFN95mk297NGT7zwRZmWOhtbVcOJUB6brnULH6WtlVWY8IbIXOBJf2+t45stFOhdDo80hTIX7RSXZCsfiY2ddsda0+6b0bPSXPerHY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=hScIhbNa; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-385ddcfc97bso5568807f8f.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 15 Jan 2025 05:44:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1736948644; x=1737553444; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pWOZNGhKFmG91IWJZrSl1HFGG1nyNQH9tCRWals82VA=;
        b=hScIhbNaDMg9SLhdEKIai+jw6k90lCJlnMblqJvcuEnKfP3SlmctkA/uGAsFxrH9JO
         GG45+ZvsYRgCCRpCAlzfrNCTHF+vEXPTwygp6OUW8siOeJkex0YxZvBgCFsGPLEXPQDD
         O/zguV7tPW+iz1GC40X0RETDnjEbI/uXkkw8ZR1Udkt9LopPcp87wAYfEQkmBdcETYJ/
         CvopVNPRRQCk6fXA00lJFOT8H89k0R9SfHlMR4MtMAhoBjXz+s5w/diyLbkrkd+SSgvi
         Rdw16dVtd81J3Y51ndcb/MNnLh0iO78xtQklQ/nDBKeUcCSINl93tKCORW89qeMv2Gz5
         DJ7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736948644; x=1737553444;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pWOZNGhKFmG91IWJZrSl1HFGG1nyNQH9tCRWals82VA=;
        b=b7evC13yZtY+Zuy2i0lgnzrogbYRfyRTsZCsx6kFeGH/il3Xz+3+fl2jB2xvEQft/S
         JLO30/P9eC1ykvhP81RXbXt5efpXkQJhTqLxGbx0y3tyuO2SghVnQjemek6pSnIsLVgE
         3x9YpeCB4PLFn8X5QI3/6t7ugfgOqUzB3nC8WCIUxjCI7WBC0Tbnld/RjdaSm/vLHPuJ
         Hu71g0QTDyvZVrpp2sTCM7Iu2AFybH7CfqllgJ85b3Rl2B1XDrUN9JQMTdbES7sgrTUu
         7m2EqQXE3exqJ6pzZAKhOxLesdUibFoJbh9jmUK83nFu+CiGhlgUv9mIECxKnap5K9P4
         yo8w==
X-Gm-Message-State: AOJu0YxmgbnqxZqmTXsfnMZ3u6pa6+7lKaKEoVeT1Kg9LzFNXNshjQqM
	VNZgIi76ZH+U9ovM+9ocwn0PeSpDkgeMQ0/Sx5yxU8KKhQbZPDNvCgqP2WgsbHE=
X-Gm-Gg: ASbGnct5ra3zs5+gEH6cPtKfBg+ZP6FIfMY9d9YsJfnfUfdXSbWtRYdSm3wU90VuOQH
	lCapIh9IRgPxhvBCICVxmUf2vDampB3jZBJ0JIgWnnBvWwULeJiO/IKPqIq10wCKSmr7w+0fx9m
	ZSNVJL6V/u5J8Y2cZGgX0rpcgQIHRM6PX/vn0Nl6tBW4Y/2FO6Y7WRBUgfy1ox2j1gtks4Ph6eY
	dfnQaaPlnY4+XG8MmFnCFMnjKB75Q+SCXAhKVZrGuGeISfzUsrxD3FcTJdJ3FOqAN9DVbBigazY
	4A==
X-Google-Smtp-Source: AGHT+IHStNt2w2bFRjjzdLtb4JcxNddxLVusSci+LoTdfamwSlC7DwiMfeXfMJiS59LDSM7rKNPw5A==
X-Received: by 2002:a05:6000:186b:b0:386:1cd3:8a08 with SMTP id ffacd0b85a97d-38a872d0006mr25094949f8f.5.1736948644419;
        Wed, 15 Jan 2025 05:44:04 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-437c7540ae7sm23454655e9.33.2025.01.15.05.44.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jan 2025 05:44:04 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Wed, 15 Jan 2025 14:43:57 +0100
Subject: [PATCH 05/10] arm64: dts: qcom: sm8650: use ICC tag for IPA
 interconnect phandles
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250115-topic-sm8x50-upstream-dt-icc-update-v1-5-eaa8b10e2af7@linaro.org>
References: <20250115-topic-sm8x50-upstream-dt-icc-update-v1-0-eaa8b10e2af7@linaro.org>
In-Reply-To: <20250115-topic-sm8x50-upstream-dt-icc-update-v1-0-eaa8b10e2af7@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1106;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=8UuCn+tG6hW9MwAi3YwmmG+cNK670avytcDu93e2NB0=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBnh7uc65VQykfbVdMFFuxNGuQZqA7zsDQDVqL0+g/e
 pBmnhtqJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCZ4e7nAAKCRB33NvayMhJ0RJND/
 oDusCp4GFp7/L/ElF+nuCmFQ+Ia5EzJ6b0We7fUYES+DBDXoW/fU9QZk7+zk3KV+9Yhkw4EWwY1nnz
 SHF7wgtKEs0lC2T/VH8q2RLyLq0d12GvqXl3TwoYhhpBSi4Nm7+E5XU4NwFnaViQI/pdQ63RH9Ejk/
 e3/MQvAWXasLN7fB7aWMQ1hThQdr0Q25k7NDCuhA5mLnnN5gijSnlfT83AzcHzM3IZb5fxXEsWh2w3
 /J48BxteFWkhCcWXMb+dcr3rIU3vwlgjC+fwAx98BlsA11gSW19DhcSxgmTTGdYrPumb2RXk2/C+mO
 tpFntszqrIaJR9ptvHBDP0iE3AIy5estYuONLS2wSZaY73KAFIHv014cBs2C5ED70QoyQgoUzzQiwz
 Tde2aC1JOI4yJWOthSS37NFHxdraXu3dYDmb5swXJ7AZCTtSNofvnQvEKW5+It+NqkMMBogynN+sBw
 UB4UxCvTXFtZf+iE5Ic5ILI5pMQpk9MXrDqJV/pnq69tmI3WQ/WHX/NviD/8OiIcTkV+d6COUSa3t4
 hktXACes89oq73QWuprDTSoR1IRxSS9533ovmmA+5RWWjb+rBJLn1p47kqo/leCf6y2Sn4Yr8xV1eY
 C1hAAU6TQz8IfrabVDDtVdHYQ6Pp+UxmuU20MjRDIQUcZqjYanevLJe+DBvg==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE

Use the proper QCOM_ICC_TAG_ define instead of passing 0 in the IPA
interconnect paths phandle third argument

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm8650.dtsi | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8650.dtsi b/arch/arm64/boot/dts/qcom/sm8650.dtsi
index 86684cb9a9325618ddb74458621cf4bbdc1cc0d1..0658982a748ef4d9df0fe12ecc68c4c23e3c2566 100644
--- a/arch/arm64/boot/dts/qcom/sm8650.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8650.dtsi
@@ -2889,8 +2889,10 @@ ipa: ipa@3f40000 {
 			clocks = <&rpmhcc RPMH_IPA_CLK>;
 			clock-names = "core";
 
-			interconnects = <&aggre2_noc MASTER_IPA 0 &mc_virt SLAVE_EBI1 0>,
-					<&gem_noc MASTER_APPSS_PROC 0 &config_noc SLAVE_IPA_CFG 0>;
+			interconnects = <&aggre2_noc MASTER_IPA QCOM_ICC_TAG_ALWAYS
+					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
+					<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
+					 &config_noc SLAVE_IPA_CFG QCOM_ICC_TAG_ALWAYS>;
 			interconnect-names = "memory",
 					     "config";
 

-- 
2.34.1


