Return-Path: <linux-arm-msm+bounces-89098-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 43421D225A4
	for <lists+linux-arm-msm@lfdr.de>; Thu, 15 Jan 2026 05:10:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 7C628301075C
	for <lists+linux-arm-msm@lfdr.de>; Thu, 15 Jan 2026 04:10:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D6F0F26B2CE;
	Thu, 15 Jan 2026 04:10:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="wDjuo5Tg"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8785C12FF69
	for <linux-arm-msm@vger.kernel.org>; Thu, 15 Jan 2026 04:10:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768450205; cv=none; b=QwXRbtVLkF3+9lTP0a4Hgnn9ews8gIymVv2Y2QWh0CABrdQaLiLR0nmUvsdKsw0E+Ph7pXXUqCHP2yUdy+l84serNLu9S71UbPOyo2NhwkJm3o5S+9YIOeCw1lJSM4BO0aadasGM8lphpNQGJIOEQFGc8UjI7aDhQ0OVg19Dn/g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768450205; c=relaxed/simple;
	bh=W3YTlyIyTEmUUWUK+ddJl6j1aIj4PqfVfc+lQKZOQC0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gDckvAsl6RHypMgEdS9rsSJxR1le8c7WE4g3+eFDBAWHJy288SeDk69ILPidpinzwDopXwGTJpgd/yyc+HnFqmPUSikH+iwgzabByPaSk0ZcJIvBTEyMLE3Hl3NVLm91pet4u/Hh1cJhI2lu4FIceQcTCtqskCkiRaxt8wC5OP8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=wDjuo5Tg; arc=none smtp.client-ip=209.85.210.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-81db1530173so206139b3a.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 14 Jan 2026 20:10:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1768450204; x=1769055004; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=A5gl3gMVAyOtPUMAz83ngr2tNJpXwKQ2fr+w2KMc5JI=;
        b=wDjuo5TgZWqgeTRb9man7RJKywKBhefT4zNJHXEWAZLV6Ny0G37Ao8a8iacViTWEFu
         RBvlws+vnZR2o0r5v9jCR+2z5/9wqGpWAuTSEmMPldkzvPLmJYEnp7FB6hXtMMqnOntq
         tfB1b70BugX4x5fGW/8Xf/JPnnbU/Tx9lApCabxMAtoK7fAmPcRAAdU/+/TwSmOsEk66
         /bXOBNNAbYuYojCXeZiE/qAFZy9mAQxcvcMMwJozPMbUoOk9frzlEDGxihvLnRlSqRFe
         4ybYuZatPVE14H8B7ns89sStupodf8oZJHQyXj4fDQbzHtsGD1Mcg7LOoHloWT8ZNnuS
         YVEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768450204; x=1769055004;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=A5gl3gMVAyOtPUMAz83ngr2tNJpXwKQ2fr+w2KMc5JI=;
        b=Wxe3Qk7J2pErxOjDzGukeLm9HaXB1VqY3Tg1gjb2HY4kQjGMNkcn+mTevO63IgGnBt
         9B7XW3LgTC+Fm7YEz0+xPQwHuIMbdFaoU1L37jLwoKCNL7tYdSwapeRemwuNAN4sVbxb
         z6EUC5d9UB6+Lwpm1z6J8mUL+J/6Ct9X+N/SFid9mj2AWAOjkQ7F5arqUB4p1fhdkGdt
         UcZLCjBySFZpQUZvlB0a1dX2DRpdokgLvCTr0XFG/zYdvqWbNSPlbQdN7ZyfRQG+R0/a
         Ti1wq3fWJeYUCDio/xBJJojo7QVSG+gt15Fx9cx8kqmCOG+DiOhHuuvJqXAqTOy0LA2p
         BmsQ==
X-Forwarded-Encrypted: i=1; AJvYcCWUC72VCNbzThpigDPXbFuvxZbcQkEAMziYD4+FHSsu5LhaFppWYVQxTgqRzqjfWUx/MBsQPAfu2es9bDE4@vger.kernel.org
X-Gm-Message-State: AOJu0YwIEV0ubAUveWAr+CiaZWlgwXsTl2+d6oTk8eZbCHJlWi+UnFJ5
	KhO7IkeuzirZS8snRR5XJ/nnCasG7/KCbv687cBbgfhHgf85WEfJ4CXmJA+QJpYI7s1he/EHPr/
	h/SuZ
X-Gm-Gg: AY/fxX4xjw8svELWFmb9cUfifqd39x2J5F5drYjd2uVs7A6UrbEvh60/ozKlEExOCnp
	AMUWdD+pTzyyY1wtDzUQFrFFniwtf0Xlc6IbOBEK4iQO7h7EiKX6jVmTxRqlq4b1D6CyAEewqlh
	rE8xhvXRQnOoePvH/iLqockavfpezZ6TXs5ifB+2+65F5x1YY7ajXZOLEcHhFw9JhiE6d2FQIJG
	+rNRYk2DEM75RdK7bI6fiNzYt8oPWr2rvkqVeWhO6sfuMRwP7q6AUINhDd8PkW8YpL1rfXKAlgF
	8u/UaIsvRpa7vdWS4/XVtC2mIiPViUQD+H64Wn1fztHuQuOj0nobTMU/TvkgcaBX5htp/hVSfLJ
	dvEZgCyGWf3LoJVA2fNdi3DIY7q4TU6p9ly86O87jTV7iDsrDV9301WbMuV7a/LRPXoqkL7UyNA
	CAMmPZNyQH3k0=
X-Received: by 2002:a05:6a00:4008:b0:81f:477d:58da with SMTP id d2e1a72fcca58-81f8200cdb2mr3948607b3a.60.1768450203685;
        Wed, 14 Jan 2026 20:10:03 -0800 (PST)
Received: from localhost ([122.172.80.63])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-81f8e4c2293sm1058671b3a.13.2026.01.14.20.10.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Jan 2026 20:10:02 -0800 (PST)
Date: Thu, 15 Jan 2026 09:40:00 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Konrad Dybcio <konradybcio@kernel.org>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>, 
	Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>, linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v2] cpufreq: dt-platdev: Block the driver from probing on
 more QC platforms
Message-ID: <zlt6uqucsbbyua65wy5epr6fmjoydoqf7sub7idkijb3meccq7@53vuidepfvyg>
References: <20260113-topic-cpufreq_block-v2-1-537cc7f06866@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260113-topic-cpufreq_block-v2-1-537cc7f06866@oss.qualcomm.com>

On 13-01-26, 16:25, Konrad Dybcio wrote:
> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> Add a number of QC platforms to the blocklist, they all use either the
> qcom-cpufreq-hw driver.
> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> ---
> Changes in v2:
> - Drop entries associated with scmi-cpufreq (no OPP table => wont probe anyway)
> - Add SM7125
> - Link to v1: https://lore.kernel.org/r/20260113-topic-cpufreq_block-v1-1-91f27df19028@oss.qualcomm.com
> ---
>  drivers/cpufreq/cpufreq-dt-platdev.c | 3 +++
>  1 file changed, 3 insertions(+)

Applied. Thanks.

-- 
viresh

