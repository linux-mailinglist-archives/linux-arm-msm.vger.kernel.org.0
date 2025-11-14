Return-Path: <linux-arm-msm+bounces-81818-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id D0655C5C517
	for <lists+linux-arm-msm@lfdr.de>; Fri, 14 Nov 2025 10:39:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id EE32A35C435
	for <lists+linux-arm-msm@lfdr.de>; Fri, 14 Nov 2025 09:31:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A12AB3090F1;
	Fri, 14 Nov 2025 09:31:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="SvnjwB+r"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 911D3306B30
	for <linux-arm-msm@vger.kernel.org>; Fri, 14 Nov 2025 09:31:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763112679; cv=none; b=qU5E0bLDc7Aq9WsHTdzOVVu4EheJdHn37Ne8IVzOrmlhqb8Sr80O4VictvIcrV7KIVVe14ariEt70xCiiIW0HroRFKbq42LjMm0ZJJ+81rtfxgygVGRHiFOW95o98v6hl98X6zMlMKeAInWCgShrvzui2Ar1YKO6FTqiijwhoUk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763112679; c=relaxed/simple;
	bh=EXmlrAx8G+qEQXvn4Hjc2SxpukaT9VckUvipBtJ1isk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=JANrVKKli1Ktc9Yy749NjTFiUe2WFSoVnEV/cswFDey8db0rrIWB2AjB13rMyAFc+ngcZcHgFaNwQWEZ6nGwlfKlp4C5n4Z0Xg/5umvuQOEAU0sInd0dqpCO/QGaRdWiBVQblxv7pEobNYuVrypiumUjGfQQJQ0etMLIr7OjTUA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=SvnjwB+r; arc=none smtp.client-ip=209.85.218.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-b713c7096f9so218030866b.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 14 Nov 2025 01:31:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1763112675; x=1763717475; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bjagkFHTl3ZcyROBN79dvzdfXtI/biV++zkJ6Wi3X80=;
        b=SvnjwB+rXaGh+yKxRpV4Mq1iY2MfxvdkgTRY7HMO4N2sMRGSjMIizbgVW5FG66svhc
         +bNZU6S5TJZgeAS8tXsAC5KwFpPjDUP+vtIebpHUU56LSDWkTOToxpkK+x4+jNo/vFHs
         lMdatv88qutTVM+Em51R+agNv4mjk5nUPKOXPhNAU/OKU/iZ3ztidejN2Ugig53q/6pn
         9GpUlyJnrIW5pH+DiIWhLBFe7TS8kNhrHTl+Xa/1jA0CZFqpa+88L3GCir8K2dZtUkru
         jwT7pdS2h8f0qPLj7TeqFopF0l+SIaOmfdKn4NN7OgPsuXwkfQwUfLwgvdm+cWx/3030
         SQdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763112675; x=1763717475;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=bjagkFHTl3ZcyROBN79dvzdfXtI/biV++zkJ6Wi3X80=;
        b=CJhQE3uKV3Bvlu7DQ2aC97Y8ZiReTzyP9J8o0Ua/+uok88FbZlUcwRBBdow5DrVsz8
         s45eBSZJ17oqd//10AKXtRDvVDwpFBSf7uSCQv5Uvn+0RCCrJKMujz4gcmV67xd131me
         8pfbPH1ntGJ0pN7FTLLzjTfCs8RG5uOhUyS4BfLqQLN+qZ9bELqowstuUqb8V1mhx7Mf
         9dO+k0dfW1MZQDhbWlmxbnP6H7Yvf6AgRSdgybDRA0XPeNqfYFV7dtLB4UF5nJLyBQKT
         77BF4YxL8C5ZsV10L699q9jtkI9M8CNVX6IhKelLCVUgBX5pQPOzrM4NqOF22vuC+F75
         pB7A==
X-Forwarded-Encrypted: i=1; AJvYcCU8wwo1x6ZK5Fo3uDVP//sza4JWqlJ2ZflriRCty5FWV3iFrjMJ2HtM2bn0R8Zv9fB9FlHRp5i+PpAKgxsI@vger.kernel.org
X-Gm-Message-State: AOJu0YzCfBk341jNvZfiJs5ssZOCYST5B3/vISXCAGi6Nnm9pn3zKSpv
	QbKg2GsdR5uIj0wPuvRHTg12xIOkN1S8HrBQmPezkYg2HrLQ2PbmKpiJHsMn14ZaiVzU2/6W0vw
	lNuJxJbs=
X-Gm-Gg: ASbGncsywBytpCS7GMm+03UD1jr1u8+DmRxEOpI+lbzAZosGTwdO2hfghM2U8WxYK2h
	RkNe6KqvALwmkaB/IlGDwr5LU1GGWdh/laaTeHqioUCBPEPdiUOJEi5VmLSAJG38x7iL7G7pETm
	MPZrygGZxQKagYFtgOATlke7EmmSmUwDYax9PybZ+EdVsDI2+OyCaA2FBikZI4v2vqfQqrbi+Og
	P8g0FdNs65ozY/8ZMRfLibZIlv3PutvuJGgojZ7Ex2+vzrN8AfCJUr00vRLuZOTXkGtSa6Ngmgj
	JXCU/Ce9RBME3UQ9GaDxMkcFPHhsY0lOAXdX6GHL8gPPQtv1qR5eklmMSd6mR1JjDOMoJ4DDlWQ
	fqgVVSv+8GMVPHJ+W8B1gqBXcea7sFMWTRZhdepYdbsUkDi9d7zktTupOftRU4gHRerE5DbBV3A
	M+ZNbbMYiHReMteSze7qQcpDLMOjAZjn4V3Ph8L1QFAKkvjfXBIkb3R5nUCbswbUTONan/Zo/U+
	Aw+oyCiNXOsxEJI6T4jLBE=
X-Google-Smtp-Source: AGHT+IF93Hcmy+2QpI1Usg+qVaNay64indlpTI/ams9EhdWoqHHpowSpmlonp+hK3sYc2L//Ct4xhQ==
X-Received: by 2002:a17:906:c10b:b0:b3b:5fe6:577a with SMTP id a640c23a62f3a-b73677ece6fmr210520666b.8.1763112675373;
        Fri, 14 Nov 2025 01:31:15 -0800 (PST)
Received: from [192.168.101.179] (2001-1c04-0509-ec01-156d-fa6e-7f19-0b67.cable.dynamic.v6.ziggo.nl. [2001:1c04:509:ec01:156d:fa6e:7f19:b67])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b734fd80841sm352104366b.41.2025.11.14.01.31.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Nov 2025 01:31:14 -0800 (PST)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Fri, 14 Nov 2025 10:31:10 +0100
Subject: [PATCH v2 2/5] interconnect: qcom: icc-rpmh: Get parent's regmap
 for nested NoCs
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251114-sm6350-icc-qos-v2-2-6af348cb9c69@fairphone.com>
References: <20251114-sm6350-icc-qos-v2-0-6af348cb9c69@fairphone.com>
In-Reply-To: <20251114-sm6350-icc-qos-v2-0-6af348cb9c69@fairphone.com>
To: Georgi Djakov <djakov@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1763112672; l=1698;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=EXmlrAx8G+qEQXvn4Hjc2SxpukaT9VckUvipBtJ1isk=;
 b=Yz/vL8tGTL2oSQMgT7z1ixGoz4iaaPuz42Yx+czSB0njpQPU2HdbrCP2DQwyMtej+3iMSF5Ge
 J7XNWTAR7w2D7rA4AS/afTP/WyeDvLj4F4qaBNh9dKkKfnpqudsWjw9
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=

Since commit 57eb14779dfd ("interconnect: qcom: icc-rpmh: Support child
NoC device probe") the icc-rpmh driver supports initializing child NoCs,
but those child NoCs also need to be able to get the parent's regmap in
order to enable QoS.

Change the driver to support that and support programming QoS register.

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 drivers/interconnect/qcom/icc-rpmh.c | 19 ++++++++++++-------
 1 file changed, 12 insertions(+), 7 deletions(-)

diff --git a/drivers/interconnect/qcom/icc-rpmh.c b/drivers/interconnect/qcom/icc-rpmh.c
index f90c29111f48..3b445acefece 100644
--- a/drivers/interconnect/qcom/icc-rpmh.c
+++ b/drivers/interconnect/qcom/icc-rpmh.c
@@ -308,14 +308,19 @@ int qcom_icc_rpmh_probe(struct platform_device *pdev)
 		struct resource *res;
 		void __iomem *base;
 
-		base = devm_platform_get_and_ioremap_resource(pdev, 0, &res);
-		if (IS_ERR(base))
-			goto skip_qos_config;
+		/* Try parent's regmap first */
+		qp->regmap = dev_get_regmap(dev->parent, NULL);
+		if (!qp->regmap) {
+			base = devm_platform_get_and_ioremap_resource(pdev, 0, &res);
+			if (IS_ERR(base))
+				goto skip_qos_config;
 
-		qp->regmap = devm_regmap_init_mmio(dev, base, desc->config);
-		if (IS_ERR(qp->regmap)) {
-			dev_info(dev, "Skipping QoS, regmap failed; %ld\n", PTR_ERR(qp->regmap));
-			goto skip_qos_config;
+			qp->regmap = devm_regmap_init_mmio(dev, base, desc->config);
+			if (IS_ERR(qp->regmap)) {
+				dev_info(dev, "Skipping QoS, regmap failed; %ld\n",
+					 PTR_ERR(qp->regmap));
+				goto skip_qos_config;
+			}
 		}
 
 		qp->num_clks = devm_clk_bulk_get_all(qp->dev, &qp->clks);

-- 
2.51.2


