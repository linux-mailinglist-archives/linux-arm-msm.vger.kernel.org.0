Return-Path: <linux-arm-msm+bounces-80793-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E6785C40C7F
	for <lists+linux-arm-msm@lfdr.de>; Fri, 07 Nov 2025 17:10:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 225915674EA
	for <lists+linux-arm-msm@lfdr.de>; Fri,  7 Nov 2025 16:09:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B8953330B21;
	Fri,  7 Nov 2025 16:08:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="mLw/fGot"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8D3532721B
	for <linux-arm-msm@vger.kernel.org>; Fri,  7 Nov 2025 16:08:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762531737; cv=none; b=AwhIhEB+k1f2nXNyo4r+syJl7bgwJpS65YYC9zuUN4xuWdbTCpdPQsTJTkGXKpZfgPLQuCIwQcYd5ohD4psJi0giPUaqehhZRRvIJh1mKPhW3/2w2e9r0bG0jXef65CM6j9HVvQMv6gQEcwP/uqRhBz50kRGl9eiuFhijGk3UFA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762531737; c=relaxed/simple;
	bh=FrKylvjtIbykfg6BNRKjScYknFwVxGFQEfuD+JLYCCg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=MnSZ6LdspiGA7V3FbCoE1dT+/06tu8AYE1osDQ1M2ZANlRbl3pCndpi9cuxKW3/n1ODn3zzxCpZ+f7yW7yrJvvEU9MWuXKQITrAV/7sx35Mx3srCDXJczXT0HV5jDuiXB8aMT2kBfG26bs/OyNyM8noNbGwWF1Gid/nFFfaDL5w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=mLw/fGot; arc=none smtp.client-ip=209.85.208.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-640c1fda178so1641050a12.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 07 Nov 2025 08:08:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1762531731; x=1763136531; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=M6OFyEM0mwtoBUd6fjbO6FrIz0k/kDLhqnCZDGR6L50=;
        b=mLw/fGotcCQwPOCJGVL+xuq/OAELVkU5YcmAVQmghR2VUtWG9qU9Yesn2UaapGPOUA
         ZstY427FF26r8ErT5jQkcVUAcug9cXJZXM339I6ruD3as7frY7Mv/i/bH9Plmvr50xul
         SQgDvIaaVS0s6LGS/uLY5r/mQBis2Qn0EmCgoNa7tW3enNqyS8opyuIPgfqkEQ739lpO
         tN1YbKYDu0Bx8yPcybmN7ufzJPkz0GpWrSV4B7aLaJTE+QLC3GUkKSenLtxVlgz4IIax
         IUfjKNz905l525j50YXexlLsIe7TSMunug6FVkBUuAxjWjXQSGt1iZl79gWudU6hws+6
         FY3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762531731; x=1763136531;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=M6OFyEM0mwtoBUd6fjbO6FrIz0k/kDLhqnCZDGR6L50=;
        b=H7ztbQTBpD8GzK7TXSNTagD5Knzf0TRJOYxC8JzoIteYswnHQxysgxNbmxjTKwbyj1
         rGc/OxYWHqfQUU/D1YwjmVwNg6SLl/xSircXYUGujjT48qC0qU+8mSAb0lSLQTIgPn3g
         e4MoPbA/Xkz0WyibH6OJN4JhU9vVZNr+pReLrOgo+MggMr01p5qbdIzu+lfTsBdyeP5S
         U1FbMGP8M5EQmuVSsmeymyKKYjppW6OmGBUuELNLJ4rRTQRQRkAQM6+4MO9TF+CbmDeQ
         1a/rDtTwPM+kh2DbAB9CuNKW9mvr4ReO7k52rH2SeqOw6f8q+NNSfdhScOp5wyvtSelK
         4hKg==
X-Forwarded-Encrypted: i=1; AJvYcCWgPZOsV5rtc2Y1Rz8iCPnYcHx0/775BDNYFQ7kMcUjvLy1fRdJ4WSlpPwaD99eJal28vWelgxs72hbjuPC@vger.kernel.org
X-Gm-Message-State: AOJu0YyBR4RJE9od2wxii/OCq0tnNMk6xL7CCwI8tP0qc7aQV3VfiMzW
	2hh8uO98K86NDjTrzczrW1O6xlhe3vco+/Tftqk/jiaGQpkjV1eXNI1VtvKIllhgy41ymTgoABA
	PnvXCOmk=
X-Gm-Gg: ASbGncvdNbrNlYOuu0ZxC4cJ8zefkOuUWcJALSFRHum5HS3bDI9LW9DDov3LDZKPO4s
	FgtoohoC9n8MOLX9g52JFFTJZwEErfjPr5lv0tFYJaIxk8rxp885WptWpLhCaARsfdR5EnwWKpU
	fYxRxq35dl2llWtYv5p5SzDKHKb3dpV8pdMNO/wmlRC3XwJvlVsESynrNj0pQOU94vl7BzUrZXv
	YmL24Nn05uKH25FOYAR5fiSrpLRSVICMOg47XKiYminRCvx5Y3MRvPEp1lLY3Hkz0gnQ67/meVR
	OYuNNqecPrg02+GK7gv+r6kd+BZGTE7fmazzrYyP4iPxBY3PB4eZ36MhsemUuHUOEyLKi/X9IzL
	r9lkEwctkvufisaGUQ+mSKtvmJe3vhfjiXjoYNPFC8eXYbaXIg9kjUkTkVJCyuQ39yM5FjEt2x6
	kyhbHoSWZ/JprieC4FpubDTy3ZP2rI0tDWwFHyn6yA2jTAnGX02CMfb2U=
X-Google-Smtp-Source: AGHT+IFc5yHu64pZOVzhmSiW9o358Hhl91qRFBo7frY9TOt1voWJpvXX8q8w1oYhoIzDVymNV/t2pA==
X-Received: by 2002:a05:6402:3513:b0:640:e791:df67 with SMTP id 4fb4d7f45d1cf-6413ef03618mr3463236a12.10.1762531731544;
        Fri, 07 Nov 2025 08:08:51 -0800 (PST)
Received: from [172.16.220.100] (144-178-202-139.static.ef-service.nl. [144.178.202.139])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6411f713959sm4444376a12.5.2025.11.07.08.08.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Nov 2025 08:08:51 -0800 (PST)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Fri, 07 Nov 2025 17:08:48 +0100
Subject: [PATCH 2/5] interconnect: qcom: icc-rpmh: Get parent's regmap for
 nested NoCs
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251107-sm6350-icc-qos-v1-2-8275e5fc3f61@fairphone.com>
References: <20251107-sm6350-icc-qos-v1-0-8275e5fc3f61@fairphone.com>
In-Reply-To: <20251107-sm6350-icc-qos-v1-0-8275e5fc3f61@fairphone.com>
To: Georgi Djakov <djakov@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1762531729; l=1554;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=FrKylvjtIbykfg6BNRKjScYknFwVxGFQEfuD+JLYCCg=;
 b=nTRGQyYmySEkpmasdBUmEaPB51ISRGLTYkLSIUcHDR8tbweZYP3kljRlJhHKqSeem9gQeqLRC
 DHVQ5/NTu3BDPGZMEfeU2PpcIDxP74CA8UJEXfBUhruv7IqiClWTtIv
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=

Since commit 57eb14779dfd ("interconnect: qcom: icc-rpmh: Support child
NoC device probe") the icc-rpmh driver supports initializing child NoCs,
but those child NoCs also need to be able to get the parent's regmap in
order to enable QoS.

Change the driver to support that and support programming QoS register.

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 drivers/interconnect/qcom/icc-rpmh.c | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/drivers/interconnect/qcom/icc-rpmh.c b/drivers/interconnect/qcom/icc-rpmh.c
index f90c29111f48..2103185a44a5 100644
--- a/drivers/interconnect/qcom/icc-rpmh.c
+++ b/drivers/interconnect/qcom/icc-rpmh.c
@@ -308,7 +308,16 @@ int qcom_icc_rpmh_probe(struct platform_device *pdev)
 		struct resource *res;
 		void __iomem *base;
 
-		base = devm_platform_get_and_ioremap_resource(pdev, 0, &res);
+		res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
+		if (!res) {
+			/* Try parent's regmap */
+			qp->regmap = dev_get_regmap(dev->parent, NULL);
+			if (qp->regmap)
+				goto regmap_done;
+			goto skip_qos_config;
+		}
+
+		base = devm_ioremap_resource(dev, res);
 		if (IS_ERR(base))
 			goto skip_qos_config;
 
@@ -318,6 +327,7 @@ int qcom_icc_rpmh_probe(struct platform_device *pdev)
 			goto skip_qos_config;
 		}
 
+regmap_done:
 		qp->num_clks = devm_clk_bulk_get_all(qp->dev, &qp->clks);
 		if (qp->num_clks == -EPROBE_DEFER)
 			return dev_err_probe(dev, qp->num_clks, "Failed to get QoS clocks\n");

-- 
2.51.2


