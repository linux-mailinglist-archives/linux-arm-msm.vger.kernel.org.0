Return-Path: <linux-arm-msm+bounces-36053-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 140349B1B51
	for <lists+linux-arm-msm@lfdr.de>; Sun, 27 Oct 2024 00:42:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 7DDA3B21622
	for <lists+linux-arm-msm@lfdr.de>; Sat, 26 Oct 2024 22:42:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 138781D54C2;
	Sat, 26 Oct 2024 22:42:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Z+M5bUWW"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5FC11D7E26
	for <linux-arm-msm@vger.kernel.org>; Sat, 26 Oct 2024 22:42:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729982563; cv=none; b=gJ85WfG7/1KMD/iJBQQC0fKXmc8Z/3+UxWNnuU2KO0yLK404ewy4o1NhZwXklRll9TfKASC18eAqPyewJJjGPi/y6qQiAlVq9FjlY9sA7apPChJAnvWwxhmha/wOsWDf3/5O7EcP7zWcu7KrZOJ9aMMjpwxGrDaaAkIzGwG+TRI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729982563; c=relaxed/simple;
	bh=2ZgMrlkYpiDDrXAgozydYWw7D6SRYzHUM29VfbLRxDY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=I8mhmep6NPlZzZu0NGRf/qP8w0KKsTDVnfkOdwk/eY5TOYhZ3OsYZS4YNd9UK97QBeEAY9UrTzFsrx6F9nOo95AqFmuTZzjPvSFGXByihV8+D7V8PbzF9VzW7Ea1InIAFw2XDYl9dJxH0ajaKQjtWxtNneNqz5t1b86NQFsg+VA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Z+M5bUWW; arc=none smtp.client-ip=209.85.167.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-53b13ea6b78so5030671e87.2
        for <linux-arm-msm@vger.kernel.org>; Sat, 26 Oct 2024 15:42:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1729982559; x=1730587359; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XdlGUNfHa8IyN+iOnLwL2IFApp8c7i9bn9RNNG57Qvg=;
        b=Z+M5bUWWqS7i/P476pQOdra3FMSjFSZzxLP/0pj6ApZ4ePebz0fNyGVcSEgTB1y7+A
         4PKhsAoKnBjpTMa6Uri/dVy/Av9bVCEX2pu9Y9Muuq9uyvzrGrl4p7SVybMHXRAl0Z+k
         PPAppF2jlnolULD4qKMR4ONXK92i0DwjL2s2i9Q3AxMH7EBH1FkhJIiamIAhHn72dznk
         jco5AEuYd08hNnwXukDx+b+dlZAMtyIgSVozEVNXpwg9y+pP6fs82TEIdxdzKY7iUep3
         dMbCZdWFx0aUW8cIXwEw49LB7eLT2/L2fCVvLVpknb8hPkqO5Vw4gqxRSbzL7RHhihbf
         5g+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729982559; x=1730587359;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XdlGUNfHa8IyN+iOnLwL2IFApp8c7i9bn9RNNG57Qvg=;
        b=PfOoOlS53MXAbyHd9ifpsQbvdICgVHELdSrjZKX11in5xKzw8Igcen3/4+/3/12yfV
         NhoIbYbZtrjQ86O9/peLwEgwiHE3jevHhdA6pakD3zJw4KLi97UyJwUqIP6A4D5w2WOQ
         eTOwfMrJj4767AHmbRN8+SQU6Rvts8bIfKjQpe7pMrxWQ7N52ci+Ma8qdt4JqJ21DHyl
         AkSPbK0cw06cKZ52S0TpQkr4fbT1CgD9k6uNYNLlHZ9G1Y5FBqjmedv6bSkYnCDBXCul
         fYtsRmXPXPOu0h4LBxz1BFxNV6TSjHis9KMOcPCnQCR69vlel3qcVpo0WEC/evX1EyYa
         35ew==
X-Gm-Message-State: AOJu0YzmWHhZ3bFHVGJ5vqw9/DczdOLruMv0DgchMHvUjChWjIxTZ9Yo
	lEeKtDO8/Xc2OXg0PThz4r1f9XIYkJv0j5IYst9Lhk/d39Rbn2pkxpI5K1Hc8Yk=
X-Google-Smtp-Source: AGHT+IFfnu3oqJBcD+Y/PvxVjFG7fBkb1LOXV7EnrW7e9BO8EcLAEcAPbtJc+F5pO0UHvGfD04B9sw==
X-Received: by 2002:a05:6512:3c97:b0:536:741a:6bc5 with SMTP id 2adb3069b0e04-53b348ba0d5mr2481610e87.12.1729982558964;
        Sat, 26 Oct 2024 15:42:38 -0700 (PDT)
Received: from [127.0.1.1] (2001-14ba-a0c3-3a00-70b-e6fc-b322-6a1b.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:70b:e6fc:b322:6a1b])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53b2e10a6a1sm610517e87.47.2024.10.26.15.42.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Oct 2024 15:42:38 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sun, 27 Oct 2024 01:42:33 +0300
Subject: [PATCH v2 1/2] nvmem: qfprom: Ensure access to qfprom is word
 aligned
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241027-sar2130p-nvmem-v2-1-743c1271bf2d@linaro.org>
References: <20241027-sar2130p-nvmem-v2-0-743c1271bf2d@linaro.org>
In-Reply-To: <20241027-sar2130p-nvmem-v2-0-743c1271bf2d@linaro.org>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Naman Jain <quic_namajain@quicinc.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1689;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=D7o6WbYbkVAW9OT4oiPZ8s1uCTCR6XpU8Gj0V5vCEww=;
 b=owEBbQKS/ZANAwAKARTbcu2+gGW4AcsmYgBnHXBcX8Ev71iAN5wcdwtrAgo+x+jN4fThZehuJ
 pYkJWpx7N2JAjMEAAEKAB0WIQRdB85SOKWMgfgVe+4U23LtvoBluAUCZx1wXAAKCRAU23LtvoBl
 uJ9GD/0YucfFg8dDv7xZj/DhFzCiGUtapFGXeo7V/LSG4wCaKoflvfa8OKezLDTYkT7MBHVgsNS
 TlFEDLavkyg7xlGfKU3530Ce2O5w6zwWufbpmJopyR3yuTQAmhbCFl71tJIG0a61CjES2Nyhy27
 aKBsxgr5cYygwj1LCkLLMvLju1clL8Fnf+f27Abhq1B1XYcwjpoqw8axRgIJTsUlVda1RG0dITS
 NlO5zh6DQwdAKnDTWRKp4vCYjdt81dz24KgvQrsRfAdwxjP9B7qgko125oKQoz4UnlhZDtaZqQb
 WA6v6fT7x3uuWoXbybCcddVWrgfyW9kH5VY1S8biD23VDSGzig7s8QMk8cf971fmAxjHd8ubu8P
 SxmyNjkZwqMrIN83kWqLk85ZHYLhyYotqH/qks66EpDImXDn1Z821IqlYv998ucZwrLDttdw84D
 imYii/d0+Kl90BsrkS1AP9MgLB85cJ+/vX6U7PHWKf6dAx1vRUV3FW1GFFxPq9KgJ+LV77TqCRQ
 t1FwDuNbg6DmMDcEAV7xnOHGFjvOcByQ0ekXLz3cgQ14yg1sTq2gaOe8PSNL7OhZV3Vy1z4QGLj
 ZwVOfYwgO0SqQjKHHi5Lg4YHqqXs358X7JJ+N/xpy43cEr13UI7b/zd8ZXjR495SUAFxB340z74
 wJjrLXf3yM6G26g==
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

From: Naman Jain <quic_namajain@quicinc.com>

Add logic for alignment of address for reading in qfprom driver to avoid
NOC error issues due to unaligned access. The problem manifests on the
SAR2130P platform, but in msm-5.x kernels the fix is applied
uncoditionally. Follow this approach and uncoditionally perform aligned
reads.

Fixes: 4ab11996b489 ("nvmem: qfprom: Add Qualcomm QFPROM support.")
Signed-off-by: Naman Jain <quic_namajain@quicinc.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/nvmem/qfprom.c | 19 ++++++++++++++++---
 1 file changed, 16 insertions(+), 3 deletions(-)

diff --git a/drivers/nvmem/qfprom.c b/drivers/nvmem/qfprom.c
index 116a39e804c70b4a0374f8ea3ac6ba1dd612109d..cad319e7bfcf34c9b9ab15eb331efda822699cce 100644
--- a/drivers/nvmem/qfprom.c
+++ b/drivers/nvmem/qfprom.c
@@ -322,15 +322,28 @@ static int qfprom_reg_read(void *context,
 {
 	struct qfprom_priv *priv = context;
 	u8 *val = _val;
-	int i = 0, words = bytes;
+	int buf_start, buf_end, index, i = 0;
 	void __iomem *base = priv->qfpcorrected;
+	char *buffer = NULL;
+	u32 read_val;
 
 	if (read_raw_data && priv->qfpraw)
 		base = priv->qfpraw;
+	buf_start = ALIGN_DOWN(reg, 4);
+	buf_end = ALIGN(reg + bytes, 4);
+	buffer = kzalloc(buf_end - buf_start, GFP_KERNEL);
+	if (!buffer) {
+		pr_err("memory allocation failed in %s\n", __func__);
+		return -ENOMEM;
+	}
 
-	while (words--)
-		*val++ = readb(base + reg + i++);
+	for (index = buf_start; index < buf_end; index += 4, i += 4) {
+		read_val = readl_relaxed(base + index);
+		memcpy(buffer + i, &read_val, 4);
+	}
 
+	memcpy(val, buffer + reg % 4, bytes);
+	kfree(buffer);
 	return 0;
 }
 

-- 
2.39.5


