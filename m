Return-Path: <linux-arm-msm+bounces-81186-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 40813C4C258
	for <lists+linux-arm-msm@lfdr.de>; Tue, 11 Nov 2025 08:41:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 5F8E54EAAB0
	for <lists+linux-arm-msm@lfdr.de>; Tue, 11 Nov 2025 07:41:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 43459346FA6;
	Tue, 11 Nov 2025 07:40:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Xqrpsne3"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 781812459EA
	for <linux-arm-msm@vger.kernel.org>; Tue, 11 Nov 2025 07:40:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762846849; cv=none; b=oJ4MWi4IOvJe3gPLXPwClKC6fCm5fjggBfbir8UePjmYK45Zge8VnfiFtFmlwwuUC3UK1R/STxZhyWelyI+v0gyBGrGN+dfKdBI0DrwHuRA5ZSWjl1fp41AQbre/yy/eUOv1Y/55UbgZnsQIzuAlfNbH8qef6V+aKB5itNG6PfQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762846849; c=relaxed/simple;
	bh=vt5NHVnht8v2mUBmVUTpZqxcWS/8kJHE6fmOXoSoYWU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=m9Dq7zpNqrjifV7rQF5ta12V5jkndVUbWRPbgmeigyo2/r2R2qEuZKAjk4/fbBonLTOjB+n5Hcie/jNJ8ZK2R7ZJz54wNdxhN+aQu5Pg4m+BuI1puG9qpHaP82kTA4TWpDZSf+tshBs57UeJdO0LO1cpby7VOJRQn80oZFZcM0I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Xqrpsne3; arc=none smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-b731b176b5eso152830566b.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 10 Nov 2025 23:40:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762846846; x=1763451646; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZlTAr+aT3mLU4VN9pcftUMf9u286amuQEK0riAkNRPc=;
        b=Xqrpsne3WjPgAP0yNhTNU2JWRnbOQRT/tII1AWCiuAf536ubBufD8+78UXCwEOs1HQ
         a67pBJHzl90ezAtFns5bwIL06YM3MGbmTlfpYLHNHKFzLcLFRSNaKbGFqqJztsNurqtb
         +wBv1zw1tuAYyeyt4U3ChnGrskRvYeJteRU10RuickENsX5Ry0psClH50M+b0cMltlRt
         X7tMeBdgRI1hLM/FAPfwUt0vfLeqH+0JDjH71HSM9dEpDwFhc8VnjGE5MP/NCj3iDpMJ
         mF2dPKnuAqVjYEJx3Ggsol3srszYIIlt1efLU7nRmFVF/7+BX8DuWYKNTRXM/7eu7OBJ
         e1mA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762846846; x=1763451646;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ZlTAr+aT3mLU4VN9pcftUMf9u286amuQEK0riAkNRPc=;
        b=fykDmhaF4beoEU5oSTL6cKSIeSFp+fTRsX7hfanCcmZ6PzwtYjy3wbawaEVbffnqQg
         /YG5tRKXsC8v8EyJOLXoFp63V7Yzl2v+Bh8Yp7MHb8a59eHvhhFpTlHMDJbDDoQMMWkl
         ZB2cNFg4ELvwyZMGBpQG/ewzNbls/z5tsyGXmgdzXQqqpHLLNBFlDZgdT4zKjinhtGPj
         99WTziZf2p5sPNrTaGkjQYIs6SMKkV16nSCQwoi/TsZPdcsybUTFp0TtipVuifQnJXLo
         P4883GA4pNKwn+IXvhOzovfWzwSqsxlGHgEVVAm9a35KW+BUqpr4w79nXP0K+hOo2r5c
         3MgA==
X-Gm-Message-State: AOJu0YxrzLSIHjYfzbWwrHVo/ey+0R92iDHhpVvrID3jmBpq9cbW317E
	/djcLBuHQE04coqmEhUmkFpmDKoHamOzNpTFWpkNK61OzNvc1n0cImCM
X-Gm-Gg: ASbGncvoEvPp4gC/0HLCo71qN3OYnK12KrA+jNZ02xt+lO/I3Dk9RmN3DI56izOCkhF
	rtGgC28TqdeQ17qRF2L7hPtkwUdNXf8mwt2wfAwc56Djlnf/5wRi2KPlnhxjbtbu7MDMeRMCfFp
	cwzNqUMBZS8bdNLDLqzr2k6Z4Y+X9us9aLeyATqLCSOVYbL1lNcWCWjdAJgPxwI9qMrOxGhkbgQ
	Br5raw1PI5fEiLK01hOTBSQh2whA1bS82WHR5nfF6ThD2KDwWcSOqZnErMkkCI4gehMeOCSjPMI
	3xTUeTwiqgHARFY+RiQNW7Bfdk72TkqHS3D6TcWKsD7lm3VRg2pMYz9GGddtMiYeA1OTnWRJKhT
	oBsyD5rf0hhQUAMZEM6/g9eYJK9Crbn1uIg7Y5ICTVjrGZ7ucx4tsuEaFL7nIzKlIrhl3eDPr1R
	mYDbcgBqaG4n7FxaWKxm46xK13+Cc46vY5x/625Gzg
X-Google-Smtp-Source: AGHT+IGKw2Q7knvFI/OPLLlTNLlix55yqvLJqQhw8v2QA57wRzzccgdjnLa1Vv1MTuTYyv3LJGFQYw==
X-Received: by 2002:a17:906:8419:b0:b73:1756:3718 with SMTP id a640c23a62f3a-b73175641a8mr281298966b.4.1762846845654;
        Mon, 10 Nov 2025 23:40:45 -0800 (PST)
Received: from [192.168.0.253] (5D59A51C.catv.pool.telekom.hu. [93.89.165.28])
        by smtp.googlemail.com with ESMTPSA id 4fb4d7f45d1cf-6411f713a68sm13060667a12.2.2025.11.10.23.40.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Nov 2025 23:40:45 -0800 (PST)
From: Gabor Juhos <j4g8y7@gmail.com>
Date: Tue, 11 Nov 2025 08:40:11 +0100
Subject: [PATCH 2/2] soc: qcom: mdt_loader: rename 'firmware' parameter of
 qcom_mdt_load()
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251111-mdt-loader-cleanup-v1-2-71afee094dce@gmail.com>
References: <20251111-mdt-loader-cleanup-v1-0-71afee094dce@gmail.com>
In-Reply-To: <20251111-mdt-loader-cleanup-v1-0-71afee094dce@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Gabor Juhos <j4g8y7@gmail.com>
X-Mailer: b4 0.14.2

In the 'mdt_loader.h' header, both the prototype and the inline
version of the qcom_mdt_load() function uses 'fw_name' as name for
the firmware name parameter. Additionally, the other qcom_mdt_*
functions are using that as well.

For consistency, rename the 'firmware' parameter in the implementation
of the qcom_mdt_load() to 'fw_name' and update the function accordingly.

No functional changes.

Signed-off-by: Gabor Juhos <j4g8y7@gmail.com>
---
 drivers/soc/qcom/mdt_loader.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/soc/qcom/mdt_loader.c b/drivers/soc/qcom/mdt_loader.c
index a68a22d174200f5f3bfced6678e5bffa0016ca14..c239107cb93017eca6f6b00876e2c10706a3e50d 100644
--- a/drivers/soc/qcom/mdt_loader.c
+++ b/drivers/soc/qcom/mdt_loader.c
@@ -453,7 +453,7 @@ EXPORT_SYMBOL_GPL(qcom_mdt_load_no_init);
  * qcom_mdt_load() - load the firmware which header is loaded as fw
  * @dev:	device handle to associate resources with
  * @fw:		firmware object for the mdt file
- * @firmware:	name of the firmware, for construction of segment file names
+ * @fw_name:	name of the firmware, for construction of segment file names
  * @pas_id:	PAS identifier
  * @mem_region:	allocated memory region to load firmware into
  * @mem_phys:	physical address of allocated memory region
@@ -463,17 +463,17 @@ EXPORT_SYMBOL_GPL(qcom_mdt_load_no_init);
  * Returns 0 on success, negative errno otherwise.
  */
 int qcom_mdt_load(struct device *dev, const struct firmware *fw,
-		  const char *firmware, int pas_id, void *mem_region,
+		  const char *fw_name, int pas_id, void *mem_region,
 		  phys_addr_t mem_phys, size_t mem_size,
 		  phys_addr_t *reloc_base)
 {
 	int ret;
 
-	ret = qcom_mdt_pas_init(dev, fw, firmware, pas_id, mem_phys, NULL);
+	ret = qcom_mdt_pas_init(dev, fw, fw_name, pas_id, mem_phys, NULL);
 	if (ret)
 		return ret;
 
-	return qcom_mdt_load_no_init(dev, fw, firmware, mem_region, mem_phys,
+	return qcom_mdt_load_no_init(dev, fw, fw_name, mem_region, mem_phys,
 				     mem_size, reloc_base);
 }
 EXPORT_SYMBOL_GPL(qcom_mdt_load);

-- 
2.51.1


