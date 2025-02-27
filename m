Return-Path: <linux-arm-msm+bounces-49652-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 78976A4787C
	for <lists+linux-arm-msm@lfdr.de>; Thu, 27 Feb 2025 10:00:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 42D4B3AC001
	for <lists+linux-arm-msm@lfdr.de>; Thu, 27 Feb 2025 09:00:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 578E6227E83;
	Thu, 27 Feb 2025 09:00:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="axOqtAox"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86D8C226533
	for <linux-arm-msm@vger.kernel.org>; Thu, 27 Feb 2025 09:00:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740646842; cv=none; b=oABUSlgANwYpJYCB4BT6GXdS48L2hMTZ0aaIuEYpgKBEuQUYkcXfP9AAwpcLyXkOgBdq9Mm6CFLSTO90Z8KqGFEqvqJEq+S83mdbZrPQMnxkMyxtzpv0yKr8OfkRSMHSOx4D9PlyMgNtMIpTkan2ZDQrK6ZBuvUKvczIG5HxZsw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740646842; c=relaxed/simple;
	bh=zf0BdcrWUQTsblD3UNg7CMK8tsQqiShZ5OFDx/EYh4A=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=muWsJdZ/UJwIxLyXpubbVgSsKA7J5LkbAbU0M8c3mqWbCCio52JW4qbrm44rPQTcKed9zmC/ylMcONDowDCjXlEToyJdfZ8/POMwFXLJAYCNne1Rbyt0KdZ3Xu0eED7P3VJWSpiPAp8EE9T94qNBnx6jCeDe8VSZdfdwNdsv6bI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=axOqtAox; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-388cae9eb9fso319561f8f.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 27 Feb 2025 01:00:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1740646839; x=1741251639; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iTcrxZnZfY0JtC/+wEyCPrdpn4JNY9r8KO29AbqP3yA=;
        b=axOqtAoxlO0uY82AZe5J/nMKYmCGMr5CSMOVF5Pamv8XlsPAZpBDZ9WGAdfBim507X
         +W87N3BjY6OKjvMTTatt2wH62zDaYdHY536U0VvD5GAUOlUCmA7ay7vFdmLoagZtddoV
         eR/jhxo3+alPkiADEHSwBfpT5aBygK03BhlFJANY1YRKmzez+7pGLDjgkcN+rTtkKPdc
         cn3xI1++rGDgbxkUv16SQHnMdc91wdbFR9PnLjVbTPbL0XxZH4a8n6imN9IWXeVa9VQf
         M5/GuZciqTEmi28Q5JLIWJcdpQ2lW6a6s3/dR5YymmaexEjl7AcZTRHJbSnFv89EIJnr
         e16Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740646839; x=1741251639;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iTcrxZnZfY0JtC/+wEyCPrdpn4JNY9r8KO29AbqP3yA=;
        b=s61w5+unWodIH8/fV5ma+piMnaRa24SVVB4nCoNdjZKgsAgqtgolL5dQlsWW8Iqqn/
         Xa0raRJ4dicciClXUJ2O03lsgBxguC5UD9V5w7HDX1YIT1nhIG6Zk29Bfbh3bBxVSXxX
         xcnF/Il4HHWQxD+Pl8QoAHfjbJJLz6UkrDW1jpy1tazCIAJsh1yMDAjk1IR5BYYkGZby
         C+FdhcEWPM8O6+6L3oVjNoUwhcn15o0G9Bsxpr0P1lua5UeBuDG99Uk5aL7JvHZcSSg0
         p+bwgyhOkZ5xw+UzWKmQ5xS8qkZkhQ0HyKc8NBbKNYJobjwUy4k2UK0WK10BZ/HBtijJ
         WLug==
X-Forwarded-Encrypted: i=1; AJvYcCUTupAjahEcdGH0lseuYn1ikIZBZLYNRrl3ZY/lc14OdzZKj3LllrgSbPsk22LnzmJgKE2jb+7Oga2aCtpu@vger.kernel.org
X-Gm-Message-State: AOJu0Ywk0WBAS/AdL0+gg/2I60H0Umd5rCgRofqMFO9FKxQ05zgmBPG+
	OpOtyKXbh8ompeeilS6zzxDnt6d/Nlbdi4ub4jkN/pWQ0XLIaMUkpCL2Het7epE=
X-Gm-Gg: ASbGnctzFeH3azw1o4uunBsbmriMxqF4EO0OPNPPDYHCjF+OcylCKBkeVWr5ZTw2W7x
	TG0C4zXMqhvwgp92bS+hVqjgI/6Jyh4PN+mTkCeGK1df3TlaJF5NE+VSsjVogiTlO3RL6B3V8Sb
	Rgqw2fuhOmEDhDtg7I12lAnKA8Em7xRBbat4Nol6XBiNAd7USFOfW8E3Wz+q6W8SXSVV64Te0Fk
	LcfpnX80cJACe3aCEhdrXqrYH4r5qPN+coucyEFU+lLx93dE21OmDkj31pzkw0bs/O85mKcoITM
	1UipzearX8tYYZ9S/hEGbiqgPbPBI6VM9EZu0cHVwHftLYw=
X-Google-Smtp-Source: AGHT+IEgXVye/9iAKrvLmx6IwZS0jmCsA4XQJH7j0LDSs5jOyJSk4ONyKoDhOudeR9kueTuEG8W7+A==
X-Received: by 2002:a5d:6d87:0:b0:38d:d8c0:1f8c with SMTP id ffacd0b85a97d-390cc632334mr11137093f8f.38.1740646838623;
        Thu, 27 Feb 2025 01:00:38 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43aba57145esm47170715e9.30.2025.02.27.01.00.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Feb 2025 01:00:38 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Thu, 27 Feb 2025 10:00:33 +0100
Subject: [PATCH v5 2/2] arm64: dts: qcom: sm8650: add missing cpu-cfg
 interconnect path in the mdss node
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250227-topic-sm8x50-mdss-interconnect-bindings-fix-v5-2-bf6233c6ebe5@linaro.org>
References: <20250227-topic-sm8x50-mdss-interconnect-bindings-fix-v5-0-bf6233c6ebe5@linaro.org>
In-Reply-To: <20250227-topic-sm8x50-mdss-interconnect-bindings-fix-v5-0-bf6233c6ebe5@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1418;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=zf0BdcrWUQTsblD3UNg7CMK8tsQqiShZ5OFDx/EYh4A=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBnwCm0TvwGSigrzsV8qHo3pN8sPrgp2GIZEUlPoGRS
 P54XtISJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCZ8AptAAKCRB33NvayMhJ0bdFEA
 Cu7iigdJILPvzwcZc07qNcWEjJceXH4E33+sjEGS6qUf6nss6avkNC6S5PrReEn5C9w1XXFO9FHPgV
 NNXXptTEJIL29efC3g279B91vIcUb/YruhQyjWx94F8I+aMyOknrpilLt8GKYxBGrMm2TsesVH9nDX
 ikBT2OpIJVDHVGiVtytz+mmtqXQxvPSO7kXvXh7RIrAieej1aqAbNZ230BJ4LqFS0wjwelCQOp6CmX
 MBOcoZn300n33OfObYCWHPY1eTmExdmSww9a3tBhdgIKtzqWCBWkWMOCbpBtf9LXIK0FYY/QHMrq9X
 oEMJcZLlox9FdWWKIxsqLTGtCisyjepjDrd3PiYkxCJtsGWQPkGMgBYB8omOTVQiNtnLW/s2wzvq1g
 jXdER/IeYGa8Ix2Vo+66gxZp3mj25TzHNrX86CSYTyB0sUuXBHPFkF8S13M38/GhsfSK9tacYoxB7S
 J3Yc9+dKf0shnT1bRyNTHhSZoi3+9frCequ3Z9DLL1DuKVqPhQ73yfuKuYg8xqODnhuC0cwVAw2YLi
 s9SryddTd0VtqpyeV9+Q5zYTIirp3xNLFCpfjLY0awF+GkaxAIc8N/XJnYGLYgM7/o7yyMmxsQ+0SW
 3koYEUcaj9rRxioAZjQ5Y0Rle2IBKlENOjMpSSSdBTyioDIrZPyi43Cw3l9g==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE

The bindings requires the mdp0-mem and the cpu-cfg interconnect path,
add the missing cpu-cfg path to fix the dtbs check error and also to ensure
that MDSS has enough bandwidth to let HLOS write config registers.

Fixes: 9fa33cbca3d2 ("arm64: dts: qcom: sm8650: correct MDSS interconnects")
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm8650.dtsi | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8650.dtsi b/arch/arm64/boot/dts/qcom/sm8650.dtsi
index de960bcaf3ccf6e2be47bf63a02effbfb75241bf..719ad437756a499cee4170abccc83f2047f0f747 100644
--- a/arch/arm64/boot/dts/qcom/sm8650.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8650.dtsi
@@ -4930,8 +4930,11 @@ mdss: display-subsystem@ae00000 {
 			resets = <&dispcc DISP_CC_MDSS_CORE_BCR>;
 
 			interconnects = <&mmss_noc MASTER_MDP QCOM_ICC_TAG_ALWAYS
-					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
-			interconnect-names = "mdp0-mem";
+					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
+					<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
+					 &config_noc SLAVE_DISPLAY_CFG QCOM_ICC_TAG_ACTIVE_ONLY>;
+			interconnect-names = "mdp0-mem",
+					     "cpu-cfg";
 
 			power-domains = <&dispcc MDSS_GDSC>;
 

-- 
2.34.1


