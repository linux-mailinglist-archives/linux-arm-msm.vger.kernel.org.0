Return-Path: <linux-arm-msm+bounces-83873-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 30443C94027
	for <lists+linux-arm-msm@lfdr.de>; Sat, 29 Nov 2025 15:51:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 7272C345AD5
	for <lists+linux-arm-msm@lfdr.de>; Sat, 29 Nov 2025 14:51:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6239930F94B;
	Sat, 29 Nov 2025 14:51:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="W/Qx3XDM"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8835E30F934
	for <linux-arm-msm@vger.kernel.org>; Sat, 29 Nov 2025 14:50:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764427860; cv=none; b=HcO0u5+o12Ss2x+r8vBUwz3Bu/otUMm14eXKALf2ypevIh92xNKCzF+t+R+2A8aDtZLlboQxZl7JNatnx4gILcn4/AN6rlfwDBg0nEFC/+fjxWRWB6YPzCeCbHSCspqEQuzi2dApehfsJMlbelnxi70jZ+PBMNjC7NjGCZO/aBU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764427860; c=relaxed/simple;
	bh=kJAVYd2/PPlXFLOf6bOfuTDn5AtW65rQSCFJWrlTfDE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=s02lvMrq+o5dvmIMaiSSidR0AjRSBoQ6w+RblH6CR9uOyXvQ/XT5KXbeJU41+MLBlvnQ0JmjseOrZfGb28709Xa/at8qSt9IOOl8jRPQONzz3teba9MfyXuA3Dr6uriDl9kiLDX+XLOdjTyaXdJV2GvcPjlKVmoXr+EHAiUzMms=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=W/Qx3XDM; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-42e2d02a3c9so85673f8f.3
        for <linux-arm-msm@vger.kernel.org>; Sat, 29 Nov 2025 06:50:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1764427857; x=1765032657; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=5roHuQegQf4KvGy0xBz6y0ubzRCDlqFmvzi3L2AWogw=;
        b=W/Qx3XDMWS1ds9QdnTvdp2EazQKt2QvWbGq+Oz5cZIPAnny/0obCp/TMzLTcx7G/Dl
         1/DyEOg8aKg1/+cwX7yUJg90U7s0QCM3ggawgrJyeRqT8snKDOHGJadgjo/RcC8L6Mj0
         4RuJyXgRVSei3CyAYLngQzTfQHJeBCZinYKHoSU9M5WF2XO+/Sco7oZ+aWRxh/d392Ug
         MUmmJnfY+A+vVz/CflTebjGmsYZZgB29EOgtChAB2fNYQqjVfWAvOSPfts78IFu6cBIE
         tcDtgrxVxBjc8D1ELRBZBg1eY5TbTKA7JbxXPAmgdo/BJ4DZ1y/LisyCd5KVMZWm06o8
         mmfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764427857; x=1765032657;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5roHuQegQf4KvGy0xBz6y0ubzRCDlqFmvzi3L2AWogw=;
        b=KxxFhwaNhUmmcMsL4aCggs6n8TOKe/+U2uaTu/VzJBZaz5XcQcVxduRAgyVcjGnzPC
         txs3Lb+5xcS0gMXv+0nHo/vdWGnnl7PrIpWAPi+g4mQlg01B00TNNopeXyDk507gwfOZ
         2fhbItO5Qqt+OFN5WwkQf5KMU5Lnm6OtgNnAVCzQqfEUaqLRo5N8J1PWYmiEzLLetn4c
         BZVncyVV0g7KZVZvWNt5kxjlY8+TZCajYh9nXsb6N6Bqa7Ma/ulRU4RU6dOq+XQp4UTg
         Y22RGr0rA49sYa5QUVYCyTAIXGvKiL5kBw65UgH/Zmyqvxhum/CkK5aDR4gTURbpzO7R
         /0Zw==
X-Forwarded-Encrypted: i=1; AJvYcCWABcHay24Ub1ln7cOLB6BOVVuNVwksM9WLGaSnL5f9v4/xdEA5wJbcAMJGi7+MZftyv/ehQQMHo8TUX4Pq@vger.kernel.org
X-Gm-Message-State: AOJu0YxMGNDz6h2qHq10D830fUAponrAhJPwpzf5E9XywT5YAOJwYFIs
	VgOP4WTW0yXU5RipI8dPCXfsSppTuH6hPvMVcPCLTAps6mMsDYo2Uno/C/ZF1wypCC96a53UnC/
	6EFdL
X-Gm-Gg: ASbGncvsD/p7lmZEz9xsfVKGkZpq/LHFwsRXfykEuE3+9yy8R9bqN9fRsjApzgU5HUZ
	xTjmFOLdUleJebT5TyddV8zbvmtt5AX9ReaDKRpYRmxpMy6yPZAiQ7vvGkQGvev3phKv6EbNAV8
	uinbnh6DuBwjjkdpPeE+locnucR03dngaZ/KCncFiy60l0w6+kecTs7Rfs2ytly5x+KztlmJbX3
	i6pi4D9So9XYz6AuBVMKIUmu8yrjnOqBpbLvJ/nu8pAL2DHj+zIF7DOGwtsrxSUjMoocuIvnsBP
	in6BMtGOSeO8zpTPnwdUCtJmDZsa29s5ml5K31Sf8gGLoT0MULJdxTOKTxqC6uubsEEeGVPXLte
	p62YhSuq0r964HcjzLGGldppHEa8kDa7GwW0MmCFgBDTIO5AtWNK/4GwNmESdzODsf9X8Th3NfY
	03JO0iEP9q8ktVzciExre6RNxltKM=
X-Google-Smtp-Source: AGHT+IF17rmdp5RFNg6kmMqYr9tYvGHfwa2QHnZkDzl2I/vBSSLY/k6vA/+nMv85qGYklo9B258YMw==
X-Received: by 2002:a05:6000:61e:b0:429:d6dc:ae30 with SMTP id ffacd0b85a97d-42cc1d19914mr34066767f8f.46.1764427856782;
        Sat, 29 Nov 2025 06:50:56 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-42e1c5c3016sm15993129f8f.1.2025.11.29.06.50.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 29 Nov 2025 06:50:56 -0800 (PST)
Date: Sat, 29 Nov 2025 17:50:53 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Rob Herring <robh@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/4] remoteproc: qcom_q6v5_adsp: Fix a NULL vs IS_ERR() check
 in adsp_alloc_memory_region()
Message-ID: <6d6b1b0fb6a61b5155a640507217fd7e658858cf.1764427595.git.dan.carpenter@linaro.org>
References: <cover.1764427595.git.dan.carpenter@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1764427595.git.dan.carpenter@linaro.org>

The devm_ioremap_resource_wc() function never returns NULL, it returns
error pointers.  Update the check to match.

Fixes: c70b9d5fdcd7 ("remoteproc: qcom: Use of_reserved_mem_region_* functions for "memory-region"")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/remoteproc/qcom_q6v5_adsp.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/remoteproc/qcom_q6v5_adsp.c b/drivers/remoteproc/qcom_q6v5_adsp.c
index d3933a66ed3d..b5c8d6d38c9c 100644
--- a/drivers/remoteproc/qcom_q6v5_adsp.c
+++ b/drivers/remoteproc/qcom_q6v5_adsp.c
@@ -637,9 +637,10 @@ static int adsp_alloc_memory_region(struct qcom_adsp *adsp)
 	adsp->mem_phys = adsp->mem_reloc = res.start;
 	adsp->mem_size = resource_size(&res);
 	adsp->mem_region = devm_ioremap_resource_wc(adsp->dev, &res);
-	if (!adsp->mem_region) {
+	if (IS_ERR(adsp->mem_region)) {
 		dev_err(adsp->dev, "unable to map memory region: %pR\n", &res);
-		return -EBUSY;
+		return PTR_ERR(adsp->mem_region);
+
 	}
 
 	return 0;
-- 
2.51.0


