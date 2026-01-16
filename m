Return-Path: <linux-arm-msm+bounces-89400-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A6C69D31AEC
	for <lists+linux-arm-msm@lfdr.de>; Fri, 16 Jan 2026 14:18:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id D90FA30731C7
	for <lists+linux-arm-msm@lfdr.de>; Fri, 16 Jan 2026 13:17:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7FA5C26E6E8;
	Fri, 16 Jan 2026 13:17:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="PSk9iGsS"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 647B92580CF
	for <linux-arm-msm@vger.kernel.org>; Fri, 16 Jan 2026 13:17:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768569451; cv=none; b=tL4ErcXm3T0pr2ZptGrgCOIntzxKxUtlUCw/T7Sb7dWcVOEEnhaj/ZbqL7PtrU/qcUqQUMukx7B9uKU8thDrLPj/fr36Kqd3MZckKYPh0Y+GmxwNQLfTO90irT2JIG9bcro0TIeHjxiDFt7/Odd+Cg5RyubzyuF24cZwNWCrz8w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768569451; c=relaxed/simple;
	bh=FtewN/DrAXamJnpTOxO78vEZuuizOqYgKqBWZjIni9M=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=JP+RbJq3pYN0TX8btgwTxpuRaGJDN4KQLBKkibGaflZggu+fY/HSblkONe76rCUl7xnprWYFji65mylYajSa7Hc2tNvrtMuraG0Tmjaf1H1eHyLrkVeTb0SaDJBkzUa1luGqJp82rFPq6GIkxBTneD72GEeV/ukCkSPPa/OeQ9U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=PSk9iGsS; arc=none smtp.client-ip=209.85.208.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-653781de668so3056592a12.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 16 Jan 2026 05:17:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1768569447; x=1769174247; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rhlx5emzP9b47xqsIY5Q/RFPv9dsLYm4piEORREEnEQ=;
        b=PSk9iGsSsoRYyIcH214x8CNhaxDDF5n7uNI8Oofzbnq6Z1cm56lwWaqKq0LRZ+TaUn
         NjSZlk8VKEbSgnurKKOJ+pb8V5teIucsK2skJUvWfRCpNp3eKvNFd0ZvFkzG1cLW/BqE
         NN/Zd6YjKNieePi11OSu4JsAVk0pLFBrC9EAcHDRELw7QkyuAgnJ0W79mCy+aEbCRGRt
         Aotej9GVWxJ3pbE+19Yd5HaiXZmKDlGlzWpNfQjwsEKlNffPZhhIJINh3ZzheMz9DjI1
         G0A8k4gGUL+V77jBdrN5SBTh7uL+FP3DVLNY9I0qyPQkyl4GEoTKTvWqUg1pIUL4fTCf
         gFvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768569447; x=1769174247;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=rhlx5emzP9b47xqsIY5Q/RFPv9dsLYm4piEORREEnEQ=;
        b=nSYjdl30EumgdqOLKPEAdRgkuXCkGCQHlREQa6LVYb5hEJv/NViyiF9rIn75L35MzV
         SdOoVl6zPEIcZ+n2PEfpXeXn8tTjxjVhTVbfgBmwUWAMBGpu0ziJA/NK4EMWmxM/wlyr
         FUtf/jeQAqiX0SP7a/w2bY+kJem4nhaLoCk7hliHAl7iCQhTQZhcFpC1NWNZup1qUoNe
         +b0DPi6nB6ES9tc4NYsn5SP4a+XZ6Lh25WX8CrGNrDA5n98uRbmY0HB1qM2UQ7epSgwq
         /zpskxgTEtz3wtNHYE7TWUENKHMjhNfDdqlJg1aCk/GINFITXtk+j394eERrinYHWF0b
         duzw==
X-Forwarded-Encrypted: i=1; AJvYcCWjXHzSUE+7a2hWdt/+f4ZpG7lplCVgDBjuNK3AqokxzWWFG1JTIahZ9Gdzm9nDVrBD5dzMNkUC4PG2P6b2@vger.kernel.org
X-Gm-Message-State: AOJu0YyWi9I/zsfYDf6Z/3IVxZivl/mr9MzmHXqx7QmpDOHe1g0kmgLk
	bgPvVKW8R1dudxtu/94vvOrcqOK2+YGiUXWcdvZT+n9uGq7BL2pcRkJriY0sq9l5YhQ=
X-Gm-Gg: AY/fxX5vlWB+IfK39KT7tAKS3+IeEUXn+8JpL+mcaVeJaBD11IvYAIyPY6DM7t4qbcY
	E75D97wM0HiqXnqW9ZndZqTkJamyNU2fsFv76sjcaFK51h7shVo7iNdrfElEPbb/ratB1kyEdCL
	IiAR6X4t5gu4VTk4oecMVs6BXWBlsp5UM2p/opVMXymQcmFUArDTquWGBQ6jWeMuegpvyp5FCOA
	toxMW/4Y9nnKwd2TZ+N/JfzB9ZEjleuljZIIwgI8y3aRvNgy6Lx2ZdzjZnOxv5A/i93X0zE1yUj
	Mlia7JM8fx3Ds50Af0YiCpG7sPwVdNYKb/e3JXe8ihh75I/ex/vmH0YwZg1YsM9c2lVWZP2wolx
	ADlVK+fG+1K99ecSwKvBd5ARBU1pPUzc0IIPdtu8GD7X4Ds9rQq4A0WEGVAckQpG3xVJ5aS+D2Q
	bvMLiRo7EVAtnUudBDBjFa7FO5O4JdNufzeou9/LJ9xUTAOwIrUQ9pZH4Z10HIe2Y/CpUm8DZsM
	GE=
X-Received: by 2002:a17:907:702:b0:b87:2cf8:f7b2 with SMTP id a640c23a62f3a-b879324c7c0mr293012266b.56.1768569446608;
        Fri, 16 Jan 2026 05:17:26 -0800 (PST)
Received: from [172.16.240.99] (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8795a350dbsm235507366b.69.2026.01.16.05.17.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Jan 2026 05:17:26 -0800 (PST)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Fri, 16 Jan 2026 14:17:22 +0100
Subject: [PATCH 3/5] clk: qcom: gdsc: Support enabling interconnect path
 for power domain
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260116-milos-camcc-icc-v1-3-400b7fcd156a@fairphone.com>
References: <20260116-milos-camcc-icc-v1-0-400b7fcd156a@fairphone.com>
In-Reply-To: <20260116-milos-camcc-icc-v1-0-400b7fcd156a@fairphone.com>
To: Georgi Djakov <djakov@kernel.org>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1768569443; l=2630;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=FtewN/DrAXamJnpTOxO78vEZuuizOqYgKqBWZjIni9M=;
 b=x4GXwqWuo6jrdq33GBtT6tJ+qKr74k1xcIHAngz8zsb5pzHU3zqpcBtB/3sXgYHAwKBDQUV4/
 MCX7Lg5LzliARKzTzK8Eg1nE2qFKjmTiYZqAzcdsWWTMObC+Om+nhzP
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=

On newer SoCs like Milos the CAMSS_TOP_GDSC power domains requires the
enablement of the multimedia NoC, otherwise the GDSC will be stuck on
'off'.

Add support for getting an interconnect path as specified in the SoC
clock driver, and enabling/disabling that interconnect path when the
GDSC is being enabled/disabled.

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
icc_enable()/icc_disable() seems like a nice API but doesn't work
without setting the bandwidth first, so it's not very useful for this
driver, at least I couldn't figure out how to use it correctly.
---
 drivers/clk/qcom/gdsc.c | 19 +++++++++++++++++++
 drivers/clk/qcom/gdsc.h |  5 +++++
 2 files changed, 24 insertions(+)

diff --git a/drivers/clk/qcom/gdsc.c b/drivers/clk/qcom/gdsc.c
index 7deabf8400cf..ff1acaa3e008 100644
--- a/drivers/clk/qcom/gdsc.c
+++ b/drivers/clk/qcom/gdsc.c
@@ -7,6 +7,7 @@
 #include <linux/delay.h>
 #include <linux/err.h>
 #include <linux/export.h>
+#include <linux/interconnect.h>
 #include <linux/jiffies.h>
 #include <linux/kernel.h>
 #include <linux/ktime.h>
@@ -261,6 +262,8 @@ static int gdsc_enable(struct generic_pm_domain *domain)
 	struct gdsc *sc = domain_to_gdsc(domain);
 	int ret;
 
+	icc_set_bw(sc->icc_path, 1, 1);
+
 	if (sc->pwrsts == PWRSTS_ON)
 		return gdsc_deassert_reset(sc);
 
@@ -360,6 +363,8 @@ static int gdsc_disable(struct generic_pm_domain *domain)
 	if (sc->flags & CLAMP_IO)
 		gdsc_assert_clamp_io(sc);
 
+	icc_set_bw(sc->icc_path, 0, 0);
+
 	return 0;
 }
 
@@ -574,6 +579,20 @@ int gdsc_register(struct gdsc_desc *desc,
 	if (!data->domains)
 		return -ENOMEM;
 
+	for (i = 0; i < num; i++) {
+		if (!scs[i] || !scs[i]->needs_icc)
+			continue;
+
+		scs[i]->icc_path = devm_of_icc_get_by_index(dev, scs[i]->icc_path_index);
+		if (IS_ERR(scs[i]->icc_path)) {
+			ret = PTR_ERR(scs[i]->icc_path);
+			if (ret != -ENODEV)
+				return ret;
+
+			scs[i]->icc_path = NULL;
+		}
+	}
+
 	for (i = 0; i < num; i++) {
 		if (!scs[i] || !scs[i]->supply)
 			continue;
diff --git a/drivers/clk/qcom/gdsc.h b/drivers/clk/qcom/gdsc.h
index dd843e86c05b..92ff6bcce7b1 100644
--- a/drivers/clk/qcom/gdsc.h
+++ b/drivers/clk/qcom/gdsc.h
@@ -9,6 +9,7 @@
 #include <linux/err.h>
 #include <linux/pm_domain.h>
 
+struct icc_path;
 struct regmap;
 struct regulator;
 struct reset_controller_dev;
@@ -74,6 +75,10 @@ struct gdsc {
 
 	const char 			*supply;
 	struct regulator		*rsupply;
+
+	bool				needs_icc;
+	unsigned int			icc_path_index;
+	struct icc_path			*icc_path;
 };
 
 struct gdsc_desc {

-- 
2.52.0


