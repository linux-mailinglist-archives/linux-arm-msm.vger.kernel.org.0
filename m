Return-Path: <linux-arm-msm+bounces-51517-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 33400A621D9
	for <lists+linux-arm-msm@lfdr.de>; Sat, 15 Mar 2025 00:36:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0623019C6107
	for <lists+linux-arm-msm@lfdr.de>; Fri, 14 Mar 2025 23:36:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 375851F5413;
	Fri, 14 Mar 2025 23:36:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Q11i4A+n"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 535FF1F2C5F
	for <linux-arm-msm@vger.kernel.org>; Fri, 14 Mar 2025 23:36:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741995363; cv=none; b=KxqunnBeWOtiq+ZHh+sYV8L9URu2j1mEtC1RO92VNhjdaE2ixdFGL4oEoZ1kSmeEO5rzsfVOEshK+8vgviVMmePHtG+lo4uNqcPxwVmrXkJaSynL9HUTk57gRFkz9QyvAuWbRlXegPYER7GnWqWQK+/SsZH2owPrUHX5qzMwseI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741995363; c=relaxed/simple;
	bh=zqZuL7y2zz8Z5aLjOZmpn3nFoIVpo+K0JqZU4el81sg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=DpkUwEOdegj9aVhuUGXHIc1TFsOfMmR+q3a/9fzGEinyrwB4olqFDHJwL2xO0s08p4g+4CKr6rYMil4ONRfY9n7Of0SeLy9ouJUfNusn5a/8iQDl1EkKJqzXBynEuC//r+X2GlWfmonGlBYYKJ/PzdjVrPl6j2vGHUZqCMrbuPg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Q11i4A+n; arc=none smtp.client-ip=209.85.218.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-ac2af2f15d1so379494566b.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 14 Mar 2025 16:36:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741995359; x=1742600159; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zh5mSsP+CPUK/p+5IIg657ozBms22Tvquc5MSQ7N3gU=;
        b=Q11i4A+nxwterXfB7UPlGFlQt3nIEYbrTCIDAtAyDeF3XV6rNaTU+dgQZIA2aTjyg6
         8a4n68rRwuZIiu3qwutz0XFw6v4WiNoQZXAnUJfybmkLG4mU6xmBQnoPOYjIkMnt66bn
         eNVXkx+CHp+YpwLWamUXQ+2+87BeGGkSyyquzHwvGeHPESeHJsYXmeWKjmZ9Y+spZe9L
         5Irf4Efsy73KsmRdirJ68HGwZ6NQQhbAvfbllMDMl0RQopgKSV1X8Z5XzW/hNRHzGAOZ
         SYrlzTBoQKFEDTHxz0iXIzjl1fRE92To1GGotX2obKWY1XYZPKJ+zS16cbFGcX4PchQP
         dfkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741995359; x=1742600159;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zh5mSsP+CPUK/p+5IIg657ozBms22Tvquc5MSQ7N3gU=;
        b=fpkz5D9mAA0PC6LDtUc0io9uknLy1/jtro7k8Hm4fXbn+jXCxbw6i0fFlxmdiYQMuF
         14tuP8QTnvOLOgSFoCm156iqv3nunoNRKsD7M7Os//sHB6S8ZZONSOcQiWqePetx3avQ
         aFbAK7BDEdkNwlX7lR3/4Bw+RVU46kHvYQc0aSvgazy8TuGoIzWLoixODdxepttMDuXq
         prCEN8vV0bsARsF2UhsdmxW0QpaZTvk8sMSdBxM3vNlmyr1msz51z8S6aG5rOC6iRwI2
         fetGVvb6me43i7FsR8CPOh55Pc4l91LisSqH2QRzqDmgIlay3Ml0YkLi1q/nBPmPL3Cg
         DV5A==
X-Forwarded-Encrypted: i=1; AJvYcCUreRauE23OLz+meIBYNEVT3e/hCn+LsC6Li1vBp0qITvQ3hPAEuN4nv6VOWQxcPO8pcJwgPAUARZJI2DVm@vger.kernel.org
X-Gm-Message-State: AOJu0YxO94vOTv8Qdz1UBhDXzFwsyhaaZcpKHmjm7tQPiJEGg97hDRDo
	Gl9ReRvgl/SrQsDyAgayu+Spo5IiaujhhGg49JH/ScGMKfmV7HqUHsJy0PuDiyQ=
X-Gm-Gg: ASbGncsy6DQBflcNvKo5g+KAJyNi9LmqkZXReaEfcfQ0iislaA6n0znll+fWN5jmQo4
	zeOvyZ/XOp1f6Mb60jYeHyiwCrmVoOX3CROmfS1HgNMq8bw1VHRSeYxSDv4ALei2DlizGAkrrBN
	PjjZoLJRQx115oTbZWqq7WGylriC0xwDFfqSevRLQ6XXfTkTQsEuXHX5qhpO33TG0GsXgbHTQJB
	oY0jBqlXb5xAHKtPpXRaX4aPLP4Kbz1dYeAKKnEKErLYD6Dt67DDqQXI0+nH7jmIvG4u/wEexYi
	7eFSg4DKxPP9i5aDA9BEj2PkUiqMmFc1437TqJlsl3b64YGlqfiHesf0wk3Y7IJDAWaUPC1AcwG
	CtMtVUw9o9Ydu/S7201ZAcD4vcQbsCVrZwOvt0kERYJ8zp8Ne7OT1SL6eZ2BWf5popZcS
X-Google-Smtp-Source: AGHT+IG6nhastrg8lGmw+aj1tV6koccwxzYEiAixZksntYlUmcCP3TXBqPSKmVTdhJD6wI4rRFOwkQ==
X-Received: by 2002:a17:907:72cd:b0:ac2:6837:6248 with SMTP id a640c23a62f3a-ac3301e8dacmr338954166b.30.1741995359435;
        Fri, 14 Mar 2025 16:35:59 -0700 (PDT)
Received: from [192.168.178.107] (2001-1c06-2302-5600-7555-cca3-bbc4-648b.cable.dynamic.v6.ziggo.nl. [2001:1c06:2302:5600:7555:cca3:bbc4:648b])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac3146aeadbsm284246966b.29.2025.03.14.16.35.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Mar 2025 16:35:59 -0700 (PDT)
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Date: Fri, 14 Mar 2025 23:35:55 +0000
Subject: [PATCH v2 2/7] media: qcom: camss: Use the CSIPHY id property to
 find clock names
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250314-b4-media-comitters-next-25-03-13-x1e80100-camss-driver-v2-2-d163d66fcc0d@linaro.org>
References: <20250314-b4-media-comitters-next-25-03-13-x1e80100-camss-driver-v2-0-d163d66fcc0d@linaro.org>
In-Reply-To: <20250314-b4-media-comitters-next-25-03-13-x1e80100-camss-driver-v2-0-d163d66fcc0d@linaro.org>
To: Robert Foss <rfoss@kernel.org>, Todor Tomov <todor.too@gmail.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
X-Mailer: b4 0.14.2

Use the CSIPHY id property to find clock names instead of relying on
generating the clock names based on the control-loop index.

x1e80100 has CSIPHY0, CSIPHY1, CSIPHY2 and CSIPHY4 so simple index naming
won't work whereas and 'id' property allows any ordering and any stepping
between the CSIPHY names.

Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 drivers/media/platform/qcom/camss/camss-csiphy.c | 28 +++++++++++-------------
 1 file changed, 13 insertions(+), 15 deletions(-)

diff --git a/drivers/media/platform/qcom/camss/camss-csiphy.c b/drivers/media/platform/qcom/camss/camss-csiphy.c
index c053616558a73c4a285a576c671aca47d05290f8..c622efcc92ff3781d7fc3ace0253c2d64c91e847 100644
--- a/drivers/media/platform/qcom/camss/camss-csiphy.c
+++ b/drivers/media/platform/qcom/camss/camss-csiphy.c
@@ -586,7 +586,7 @@ int msm_csiphy_subdev_init(struct camss *camss,
 {
 	struct device *dev = camss->dev;
 	struct platform_device *pdev = to_platform_device(dev);
-	int i, j, k;
+	int i, j;
 	int ret;
 
 	csiphy->camss = camss;
@@ -680,23 +680,21 @@ int msm_csiphy_subdev_init(struct camss *camss,
 		for (j = 0; j < clock->nfreqs; j++)
 			clock->freq[j] = res->clock_rate[i][j];
 
-		for (k = 0; k < camss->res->csiphy_num; k++) {
-			csiphy->rate_set[i] = csiphy_match_clock_name(clock->name,
-								      "csiphy%d_timer", k);
-			if (csiphy->rate_set[i])
-				break;
-
-			if (camss->res->version == CAMSS_660) {
-				csiphy->rate_set[i] = csiphy_match_clock_name(clock->name,
-									      "csi%d_phy", k);
-				if (csiphy->rate_set[i])
-					break;
-			}
+		csiphy->rate_set[i] = csiphy_match_clock_name(clock->name,
+							      "csiphy%d_timer",
+							      csiphy->id);
+		if (csiphy->rate_set[i])
+			continue;
 
-			csiphy->rate_set[i] = csiphy_match_clock_name(clock->name, "csiphy%d", k);
+		if (camss->res->version == CAMSS_660) {
+			csiphy->rate_set[i] = csiphy_match_clock_name(clock->name,
+								      "csi%d_phy",
+								       csiphy->id);
 			if (csiphy->rate_set[i])
-				break;
+				continue;
 		}
+
+		csiphy->rate_set[i] = csiphy_match_clock_name(clock->name, "csiphy%d", csiphy->id);
 	}
 
 	/* CSIPHY supplies */

-- 
2.48.1


