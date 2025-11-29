Return-Path: <linux-arm-msm+bounces-83875-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E7A2C94038
	for <lists+linux-arm-msm@lfdr.de>; Sat, 29 Nov 2025 15:51:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 474E03A64A1
	for <lists+linux-arm-msm@lfdr.de>; Sat, 29 Nov 2025 14:51:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6382E30FF23;
	Sat, 29 Nov 2025 14:51:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="OTp0JeTY"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 287BE3101BC
	for <linux-arm-msm@vger.kernel.org>; Sat, 29 Nov 2025 14:51:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764427873; cv=none; b=lSLSkyYsxTQdr3Y7YlBdeor/cHhKwvg82QLNiuXE4Vdp/HC/axbuelhaeHWNMr9OdWeA8qp7dqVZB+YLbbMn0alo9gXNHzDqqlv7C+lW77MwDduTGmr0u56zuCHINb1Jz8OeU4qjasFdDrx1RG84VEDelyNf78OfYZ5CQJPSUnY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764427873; c=relaxed/simple;
	bh=liK4LfPiU0pY5XDiNJ+cSHVdLUrTAgHETaseY8tBJKk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=o/Oq83qhm+tvNtHgnmM8y9v2j07qlkJ/Vj857llFoY3xijX8/zrM838eZ5jDHyp0rzxcOgpXM/7l/2Jyq34rc6Ch0rYm84qY92nV6n5/DKnOcHMrTuc2KFC47OpXQoXtUeK66SiJ/Y7nDdjbngHFewAA9l2LmwYhWI47TS53YjE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=OTp0JeTY; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-42b566859ecso2592937f8f.2
        for <linux-arm-msm@vger.kernel.org>; Sat, 29 Nov 2025 06:51:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1764427869; x=1765032669; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=zkWGeeB7i8StC9hMxWOTKSpu55uDyb2ej0mWJX0OlQI=;
        b=OTp0JeTYcnM7wS0ZfC8saS190+0Jynbzk/rWFOrtBoOOPzuz+1fWIxOYfNiJ0j5Eaa
         Uq803kVZMCFUQ3w9P7SP1ApyyU2KvyYJz80Tc+cz24w9bHkOBTz4OPcqSrK6JLIV60CX
         ljOLeKI7CTotbb/ZqjowVUvhsm+uRPTUO9aRJTmDzEumR4UgxzRiHmCxZTjb+wGJ+Evc
         BXxDdCcfYgn5Y5+BNF5HM6dP5cLq7HJOwq9bbf6gDstWuetBMYUJmCd4hs5SWijY31Hl
         39R67hIoGMPlOORmo9SCEaBCCjEnNvnNLYMIxxOYBcjFRlkDakuwWVyNMUlAoCt7IgKT
         9vyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764427869; x=1765032669;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zkWGeeB7i8StC9hMxWOTKSpu55uDyb2ej0mWJX0OlQI=;
        b=gha1BqTUKfJAeCz2Y9nRHTAkTShqwtxiXfpLQlZiIcQlFWujQ5V/Xi6hY2mzTs2Qr2
         Qe7lhkj+uAN8UXNBx6ATmK2Ju52Tsow1G38pnPbHYyJOq2PaPU9EcDzuj7odUnwduyIp
         jqedL4nxqXN+Ha7jgDq2pK4hPixfRrcNvrCEsJfTxDDMeYge7w49iuTD6A43kAnbSeJU
         GbTpWcWGJ506rtSxw2uAj/aAsTnqov4zI8dAmbAhvGmjU9shXGYknYGch5odFCbYfIZf
         VfWCxK8cp6OO+hUigN8DtEctmCpNdQKXjjYu5oHSG4nq7Xx772ziRKyj4PLfOOxChZMW
         iTmQ==
X-Forwarded-Encrypted: i=1; AJvYcCXRydDFbkInsF2FZoVHzutYARFg3/vmUWIOh2N23x3fVg62rpMTjNnqswvgsQCK6R9OcbmuWTgUmeA2pLCM@vger.kernel.org
X-Gm-Message-State: AOJu0YxsszysEgV5pq0bFQDQh9lwyuDSd23nJt7vjIqe7Mgu/taP371A
	dMnmovTM6rU5k6EZaI25XijchEW4hDzlYmD7XLJpjGU6+QGaTXRHARhwIeI+jb9ZxZlWkXEUOtP
	lVrCP
X-Gm-Gg: ASbGncvL+aVwdAy0AbVhIFbFQsBVrZf6hNeumioVaLJBGXXIK75I3sEinO22lbNLlN+
	d2cFILIZcjYZTZ7GsEz8UWb6DHjwSLJNp48N6sRjSz9BDRLHGDr5e97RtJ50dGc0PRAPng6Kx/h
	s7mHuBmCv22AS24C2UMygGo2zxkLG5s7h67OI+yNP/S9P25cr6klgWO8rszv7w6nIYWDsT4io0g
	cMRkqKunYN+QEJ5oGHv3p0DrgVvRTaIf5P+yWPvcnopeLOWZgxGOJ6W3C3IQEXbYPd/8jkpyezZ
	NkXmjtwekBhSN6A1kYqn3VFx/naLvbGlZTOQIhbhjSX4PSRkSma/HRzxGfGj4JvRD09haTs4H0/
	W75tobgD6sCRJQJPMfV8vSFO2IEMcFZH2ys17r/aMIxSyiE1k8uykTUia+nUGlNnaSBMWQHku3i
	hQ6gpELmFKntgvSaWK
X-Google-Smtp-Source: AGHT+IHtQkQGQCuMCo6bY3Ja5uUySeD4yPVpGdxPG7jpQTsa5cwSzFut7/w/KfuwVM8RFg93hJTJ6A==
X-Received: by 2002:a05:6000:3106:b0:429:cda2:9ffe with SMTP id ffacd0b85a97d-42e0f1fb97amr21174292f8f.7.1764427869395;
        Sat, 29 Nov 2025 06:51:09 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-42e1ca1a38bsm16309890f8f.24.2025.11.29.06.51.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 29 Nov 2025 06:51:08 -0800 (PST)
Date: Sat, 29 Nov 2025 17:51:05 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Rob Herring <robh@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 3/4] remoteproc: qcom: q6v5: Fix NULL vs IS_ERR() bug in
 q6v5_alloc_memory_region()
Message-ID: <674b32a78563282adeaf3cdf941314a0b8181026.1764427595.git.dan.carpenter@linaro.org>
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
error pointers.  Update the checking to match.

Fixes: c70b9d5fdcd7 ("remoteproc: qcom: Use of_reserved_mem_region_* functions for "memory-region"")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/remoteproc/qcom_q6v5_wcss.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/remoteproc/qcom_q6v5_wcss.c b/drivers/remoteproc/qcom_q6v5_wcss.c
index ca748e3bcc7f..d96af0e0f665 100644
--- a/drivers/remoteproc/qcom_q6v5_wcss.c
+++ b/drivers/remoteproc/qcom_q6v5_wcss.c
@@ -887,9 +887,9 @@ static int q6v5_alloc_memory_region(struct q6v5_wcss *wcss)
 	wcss->mem_reloc = res.start;
 	wcss->mem_size = resource_size(&res);
 	wcss->mem_region = devm_ioremap_resource_wc(dev, &res);
-	if (!wcss->mem_region) {
+	if (IS_ERR(wcss->mem_region)) {
 		dev_err(dev, "unable to map memory region: %pR\n", &res);
-		return -EBUSY;
+		return PTR_ERR(wcss->mem_region);
 	}
 
 	return 0;
-- 
2.51.0


