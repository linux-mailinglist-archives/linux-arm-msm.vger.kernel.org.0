Return-Path: <linux-arm-msm+bounces-112536-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id yT9uBZamKWqvbQMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-112536-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Jun 2026 20:01:58 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 815E566C222
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Jun 2026 20:01:57 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=linaro.org header.s=google header.b=GjY5cGN7;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-112536-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-112536-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=linaro.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8C934323B332
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Jun 2026 17:58:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DFF87351C1F;
	Wed, 10 Jun 2026 17:58:17 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9ECD9271468
	for <linux-arm-msm@vger.kernel.org>; Wed, 10 Jun 2026 17:58:16 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781114297; cv=none; b=sp+eTYAjejKqMYbWcmXK1idgb3f6/OgTYYVFGt0OqasUBDBoS/FZ39+DVgdEWf9XaaPWOfm18wEH99XErSply0DC2R2J7R2NTldUvurxkoNKHduVGgq3G6QLLpx9f3vDGL9KVN4QW79hZT0WudCp6oB8enwGIm8HZli5DMO+3UU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781114297; c=relaxed/simple;
	bh=DiEo+/bq8ErrnBnt4nPE9U123/wIPQRXBvgM8yxpiRo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=B3MbJTNknVqO4PQN0yKwWtI1JSvHrPQVxovfWUXgdIoDgprMKQ/BxbAEgELtCs/BXQDdHOsqLKPF78K8eqFVhI2DaSCfMv+ckM3jILTqtCT2bmxKC1k1qWaDcQJkctKr7lML+m/XeU5XbKiWLUC1MBXHkIp/pcjWXGRGdb8IW68=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=GjY5cGN7; arc=none smtp.client-ip=209.85.128.49
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4903d730b1fso81968115e9.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 10 Jun 2026 10:58:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1781114295; x=1781719095; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=3avyTluAk283iBEga6wGPVoycf0Awj4BxU+6wyL2mC0=;
        b=GjY5cGN7ou2yfRyQ41eAQ7Z7N03FLBFMGgEAy+DhN0ouFqI/A6gT4khKZmQVmKUtIL
         DV5VoqyIrO4MEBC7Aq8suZgNzPbchhj1ufR5/uebsFcQqwPNQYE5dqDBAkENzfZTkDwE
         YflnOwzRSdt4TjbK9hVN292GCNwbDZ05tqZzlxwEcRzjEcahJ71b27x7oLaRiAAum+H1
         4P8uQSyfbcy1TCePpTMm5JI+z0Aq+Y0MJuwSaWaUU/+NpyBzE4yOvlk7IEQca6cjoXgG
         fDVVrok86/SYgRcUIWzxYDXc1HtzwrxgBwBgiy56e/hMayAPkN6i6JHYswFtdSsBwN9f
         eTdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781114295; x=1781719095;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3avyTluAk283iBEga6wGPVoycf0Awj4BxU+6wyL2mC0=;
        b=Rpz/L8ppEeBZIhjBWQ2+0g5sRCsQeJLyxJXyadyPyoRbPdmgd4b2UaniAwBth2X4Kc
         hav8NzjCZVpo4ONhN8We3xhFd1JsnAvFVB8X0kpni4F0P9VxoJfEugMMDrK+REEr/iBI
         8xEVDbTwu/EnHdQykdfoYTrwEoRz2iLZ2yx98xkpZt+gXKlQiQ57prZj1TPEusTiIVuj
         sFMb/nGLenIJlUb6FHKeFeSu80jOAYU7VjITHek6AJlGqzwDVY6wthucn0cdfSWHUFbw
         yc4B5YM8muDoiqPfEoi2ctigbug2+AZGQecBrG0Vohx2ttjeKA2CzMH5NWG785M3WebS
         NG7Q==
X-Forwarded-Encrypted: i=1; AFNElJ/G3ouN7G8RwOy+8vHtt4rBUWgne4AbLUs6qDBxHsTe36eD7QD2kILznyoSUQNfp8ab2QrcXV4OdSNoL6o9@vger.kernel.org
X-Gm-Message-State: AOJu0YznmwTszxbZt99A1IcAwmn4Vif/slA6y0zmZyGHC3eunEI9MvDt
	SgkAz0XTsOQ22x2zepbj/jAP88Ei+YLTHFsX8mGFBCRwaTZ5P1iugGwrfObIlIPTKx8=
X-Gm-Gg: Acq92OG+QB2uQreQug0Vu6tBsvsJubTW/AXiFejBDNZGJzZUsnjOmHnMG88AVMtFUAN
	Xuyoq6Nas9xDvFmisQ4wJAeMMCTDVWdVzv55kjHb16kyhq7jpuGHzV43dSa4I+aK8uB2XJ6MXsT
	TjLEFk5UDVlN0eDG/nRNrgvBMMKEcVx87Z/LujgP2kiqSYFOIIxLTpF4Av+VAbyo5vILul/280T
	xrvEjHVFnYswfvYZR98dardH/bU4H6tNxK6ES3eC025Vj+ewEyj4FeQ5BO3SIMskIUGHGppQnWD
	gjF5OSbpZhuoWVrfp3byDF/zFUHm+wguOqHu5MUp46veqsYpomoJ9iki7s14mDC1tgisy0pu3Ey
	S6TNQGOhTQAtr1LAb+0wrsAD4HDqXa03iHJKjXxEXLCHdAAWpLpif5UUA/D3IidwsqfYE4A+vum
	gsoJTdM+/1BCLRK0Wf7icjyWvoxGSprcSO6YqHSw/ZiDBL
X-Received: by 2002:a05:600c:1d2a:b0:490:bbc1:d508 with SMTP id 5b1f17b1804b1-490c258f3femr428587595e9.1.1781114295096;
        Wed, 10 Jun 2026 10:58:15 -0700 (PDT)
Received: from linaro.org ([2a02:2454:ff23:4410:f160:c480:bee:c914])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490dc471b6dsm63912895e9.0.2026.06.10.10.58.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jun 2026 10:58:14 -0700 (PDT)
Date: Wed, 10 Jun 2026 19:58:10 +0200
From: Stephan Gerhold <stephan.gerhold@linaro.org>
To: Taniya Das <taniya.das@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Georgi Djakov <djakov@kernel.org>,
	Shawn Guo <shengchao.guo@oss.qualcomm.com>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH 04/12] clk: qcom: gcc-mdm9607: Fix BIMC PLL definition
Message-ID: <aimlsgJssczxBGhQ@linaro.org>
References: <20260609-qcom-clk-mdm9607-fixes-v1-0-5e9717faf842@linaro.org>
 <20260609-qcom-clk-mdm9607-fixes-v1-4-5e9717faf842@linaro.org>
 <022fb465-df10-4d95-a05c-1ff8e59558c1@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <022fb465-df10-4d95-a05c-1ff8e59558c1@oss.qualcomm.com>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-112536-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[stephan.gerhold@linaro.org,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[15];
	FORGED_RECIPIENTS(0.00)[m:taniya.das@oss.qualcomm.com,m:andersson@kernel.org,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:djakov@kernel.org,m:shengchao.guo@oss.qualcomm.com,m:bryan.odonoghue@linaro.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-clk@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:devicetree@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[linaro.org:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	MISSING_XM_UA(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[stephan.gerhold@linaro.org,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linaro.org:dkim,linaro.org:mid,linaro.org:from_mime,vger.kernel.org:from_smtp,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 815E566C222

On Wed, Jun 10, 2026 at 10:43:12PM +0530, Taniya Das wrote:
> On 6/9/2026 7:44 PM, Stephan Gerhold wrote:
> > The gcc-mdm9607 driver was originally based on gcc-msm8916, but a closer
> > match nowadays is gcc-msm8909. Looking at the differences between
> > gcc-mdm9607 and gcc-msm8909, there is quite some confusion around the
> > definitions for the BIMC PLL.
> > 
> > It turns out the BIMC PLL on MDM9607 is actually an Alpha PLL just like on
> > MSM8909. We can vote for it using BIT(2), which explains why BIT(3) was
> > used for GPLL2.
> 
> BIMC PLL is never controlled from High Level OS (APSS). These are
> controlled by other subsystems and voting should be via the ICC for BW
> requirements.
> 

The driver doesn't really control the BIMC PLL here, the PLL is defined
with fixed/shared/read-only ops so it mostly just exists to model the
clock tree properly and have the clock rate readable for the PLL itself
and any downstream consumers.

There are multiple drivers that do it like this (e.g. gcc-msm8916,
gcc-msm8939), is there a reason why we should drop this?

Thanks,
Stephan

