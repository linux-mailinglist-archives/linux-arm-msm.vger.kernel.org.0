Return-Path: <linux-arm-msm+bounces-83876-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 806D6C9404D
	for <lists+linux-arm-msm@lfdr.de>; Sat, 29 Nov 2025 15:52:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id DD4A334774C
	for <lists+linux-arm-msm@lfdr.de>; Sat, 29 Nov 2025 14:51:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8102E310635;
	Sat, 29 Nov 2025 14:51:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="e6QWul9e"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE0D031062D
	for <linux-arm-msm@vger.kernel.org>; Sat, 29 Nov 2025 14:51:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764427877; cv=none; b=IHNbyVgT+/F/FV+MJUZjmPAGL2EuxYGgQm7J0QmpW3uElnCIJ+ys1QHSostKqQb6i1vpGsEaorksuXV+xyIhPGm5d4RUw352BPKPVyhTE1+9NeEvhO5Om7gge/3GgGxmMOAsIwMtdYpKQUUOnibMnm7YmBnnVL7Ra+DRVdub+3g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764427877; c=relaxed/simple;
	bh=k0aIXU/reI+53H81Ixsu15XtjHUspATirIgbwnqrpAg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CxFYYBFl8W8QD43yMHiqjQbTEgfPiYDkFUoj0U3yRujw9XRwy3bm22HEamiaUmfHBQvf54brEQlQs8ji1YTPmytIluoJolxPAf5169SxNjLXeCQZdRysga34gZ8D7Wu79NHSvmOcPqVmIXjQ28GVacwmdCgHW6sss7uR/0RYrg0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=e6QWul9e; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-42b3d4d9ca6so2432961f8f.2
        for <linux-arm-msm@vger.kernel.org>; Sat, 29 Nov 2025 06:51:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1764427874; x=1765032674; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=OKiAwlo9LZ0Y6EQWk7tLBh+YOq0wAbCqmwXrVpwlBTk=;
        b=e6QWul9eVkXu3AldsfdZpnEwyPb4cCSw2rh1580xlqie+o9vGgPGCc0I5vv7GD/9fQ
         8l9D+fkMPTSZyBWQbrkpOOgHNIDevAhPplyFMUdwlZDrV7X3uzLEWGeUwK6uIykF3c+D
         VETW/vlda54+UFPfP1otbmf0VPW5bRimmi1zPMHJK20YwE+HlLRVmj8ocU++4LyIgdq3
         ieEYIcto4zyTjqYdMMpNZ/+pguK5M0ByvAbSW1ZkVF007/U4mv0xvXjaGd37I9pGNktf
         LJDkYywSW89izgkZtrHr4PVrsR3QTptLRviMTJvYGlx1uV+zfgWqSL5SomRuTpgIYggA
         ScvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764427874; x=1765032674;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OKiAwlo9LZ0Y6EQWk7tLBh+YOq0wAbCqmwXrVpwlBTk=;
        b=Tp8cpSoBVEdkUBAbLNHRzPUe/hrqkP/I8YNc3Osjf7vxoG+Vc+bXwkGpKZU6hIZQFJ
         voLjD8PbdDzg6nQRt0/fyq4DnXJqhu1WP+2C/+AlhvoNy61zNPEZvI6gn+hnjmoj9m6h
         F2ceG/UmwQbrmUQOGL++jMdpV03JjIpk+Z+1N3YEXjALklONlyVHKktHt4S/RO1mF8RQ
         g88LcUxw+FPqHDDHEXkx5RlEcb1XvSrtSjQJNouH0vXI4qO7eUI2wcm0Ak/tvEu55JeM
         u477FCRBReNTccIQkhHuLz03G79Pzh5aiPKn/eFFvALdrXKN/AUre72teIM6mnGhe6u3
         I4NA==
X-Forwarded-Encrypted: i=1; AJvYcCWHP4sWBdHU+/GIAJWJdqTYZ+Lp722P+eZArDvC4YQAWrHV3EzScvrEfLH7DETzhZrS9nuenYm8VlYpcUVn@vger.kernel.org
X-Gm-Message-State: AOJu0YwOzkN90n26DC0MjdwrK7LreRoNR2DxlLkLezycHgKON5olehz1
	xfhyo+yUH72+YZTJD5rqfZd8qYgv+gR7CXKp3DpHgLVYi2936MVzJ6ccsrcXjJOEZquhPuxzTFk
	Kdkes
X-Gm-Gg: ASbGncvi0fwu8L8ZpRka7XOiKEDjH/4EN6HWLuawa//ZvWEWKUD/I66XDnUmuaM65Xr
	QAvU7fDk1MUNCX8eIV0oKflcoeaVKuwI1ynYMhjfvCBnMAmUgZoTpdodHZBXXoV7csvemoeHCcH
	GhaVMsd0347umoAKKgjBDpguocPOaW47gd4uHirV5XhLxoR6Bqme2VGlwlbmZbC82Ks223lRgcj
	OukA8k7ck+84SwVQzC4f/viuDU7ALdP3qnANsoFdaVsYqf8ufYKjKFeyk3Cc6KbowGEohn10g6r
	AMHZLiBlXZq0aO8WTPy9G+lXVfd/rMx6Wk3nogUpfCfwGNwvBxkzQMBmk7WcJ7Bj12PoUmcKqUW
	7+FzAWLMVO9jCZQIhrLwT0wx2RyZy0tMbdHPI7JoUPGwwUVE0V7LIqLZ9sxj4QEPcR7z8kEhD2L
	+kGbKgHS15ubk4Bjvxxa1Adx69M1Y=
X-Google-Smtp-Source: AGHT+IGI6zgN1d5AOjsGAZRHPGRNf4EQ0mzqlTC7dJh5tDbKD0iL7abVcYqrVgB4mGVfZwt9HhaLKw==
X-Received: by 2002:a05:6000:2387:b0:429:dc9a:ed35 with SMTP id ffacd0b85a97d-42cc1d3479cmr34440564f8f.43.1764427873971;
        Sat, 29 Nov 2025 06:51:13 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-42e1ca1a303sm16609079f8f.27.2025.11.29.06.51.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 29 Nov 2025 06:51:13 -0800 (PST)
Date: Sat, 29 Nov 2025 17:51:10 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Rob Herring <robh@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 4/4] remoteproc: qcom_wcnss: Fix NULL vs IS_ERR() bug in
 wcnss_alloc_memory_region()
Message-ID: <09a43da41ee277a80a3265348831e747f7b62620.1764427595.git.dan.carpenter@linaro.org>
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
 drivers/remoteproc/qcom_wcnss.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/remoteproc/qcom_wcnss.c b/drivers/remoteproc/qcom_wcnss.c
index 14005fb049a2..ee18bf2e8054 100644
--- a/drivers/remoteproc/qcom_wcnss.c
+++ b/drivers/remoteproc/qcom_wcnss.c
@@ -538,9 +538,9 @@ static int wcnss_alloc_memory_region(struct qcom_wcnss *wcnss)
 	wcnss->mem_phys = wcnss->mem_reloc = res.start;
 	wcnss->mem_size = resource_size(&res);
 	wcnss->mem_region = devm_ioremap_resource_wc(wcnss->dev, &res);
-	if (!wcnss->mem_region) {
+	if (IS_ERR(wcnss->mem_region)) {
 		dev_err(wcnss->dev, "unable to map memory region: %pR\n", &res);
-		return -EBUSY;
+		return PTR_ERR(wcnss->mem_region);
 	}
 
 	return 0;
-- 
2.51.0


