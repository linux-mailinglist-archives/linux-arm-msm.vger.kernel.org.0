Return-Path: <linux-arm-msm+bounces-90090-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QBlaBhdZcWkNEwAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-90090-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 Jan 2026 23:54:15 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id B815D5F1E8
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 Jan 2026 23:54:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id CF499901CF6
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 Jan 2026 22:54:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A021E40B6F6;
	Wed, 21 Jan 2026 22:54:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="HRnIqR3t";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="GtDoFVbf"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C66A4425CC7
	for <linux-arm-msm@vger.kernel.org>; Wed, 21 Jan 2026 22:53:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769036044; cv=none; b=pew2Zd5S+YH/sDx4HRZoMNLThxnx0YMdtdzOT7Tw+BRdlupk6CHUrE0M99VuAEbb49nPB8vrF2enYtZtt40O5pjWsuplhHfgPVlZWnQr6mcYScF2O1b/kLiX9Sssww3W3uyFQ60bSQcEzHMT22VyAR2Fa7a+CU22yVYb4n/zwKc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769036044; c=relaxed/simple;
	bh=UiEPj0ZcSawildEgR+9wJ/AtCxMbPbzcmfyb7UYIQ4E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CylOzY+9YkjUB3o4d8zQKpL8tLxDzoQitQJWJ2HFImUYEyQevYZ4z46ePyDPN5FJO/4iDbuBppxhYH9aZDUTDXYykEbhhMQxxKv9ZU0vj3ZNFX6LxhTPsgVUeVyWJpIEP0QVRxd/g6GkKC8hLGIqxOX5cTFLAoDGM27AqQnqcYw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=HRnIqR3t; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=GtDoFVbf; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1769036034;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=UiEPj0ZcSawildEgR+9wJ/AtCxMbPbzcmfyb7UYIQ4E=;
	b=HRnIqR3t3Rkd7ysV+hJ0eEgVek9bLr0i3uuVycuVcWvN+TPcQmBYxfQAkZi8FrtoLlarEl
	pQOcKXvJz5oPql7klxMX6v1SsKarP8QvmQXVbAl0uS/o0iE9bU8VO4jzI4l8FYJJoXsRq7
	LR84vGtKQTT+t2bdY1nd/iV7psbjeVQ=
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-134-XyQ1VMo9MV6F2Q0-aiSAXQ-1; Wed, 21 Jan 2026 17:53:51 -0500
X-MC-Unique: XyQ1VMo9MV6F2Q0-aiSAXQ-1
X-Mimecast-MFC-AGG-ID: XyQ1VMo9MV6F2Q0-aiSAXQ_1769036031
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-5014d8b3ae0so8896731cf.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 21 Jan 2026 14:53:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1769036031; x=1769640831; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UiEPj0ZcSawildEgR+9wJ/AtCxMbPbzcmfyb7UYIQ4E=;
        b=GtDoFVbfPIev6Y45lnUj8xiA8GxcY4vLl7Zc+zcX/Z69kLArm87l/wSqn/UI7DCfSf
         U30AimhGVESqjkpe/jreBjvHZgsNKn7docRbMu16NEBpLoFzCGFBxuqLQUgyXu5dVQis
         HaT4reFMxuhHlp5vW+xnI6QoI8md1+lGBpH4Eb4H/yOGB69lkFRTa1lL7OKfKMCx8Ztb
         SHjmUGudpNV/kOuCkjTFdlmS47bqkS46ZDIM4ORSaYcXzVvSvs2cwZCDSH5+19PCe80n
         iObPgZrtysxGJfgmz4JJmJvBVw1Pbm/IW6vXLbEl2gCIfT251WTL2usfoDhuCbaPGo68
         ebYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769036031; x=1769640831;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=UiEPj0ZcSawildEgR+9wJ/AtCxMbPbzcmfyb7UYIQ4E=;
        b=Ydfu2PclAMxLOfyz01F0511X3Pj9xmrNOVpuV+r7S6UG9VkmhLpYs7Z7LhXII+yKwQ
         kN5LFckOOnmzVi3oGpJa4ALOJYF9cE2UPIHW5gTX0kCBlXir+uVaOEXHsnFMpi0etpRU
         5XHoOYpVFtasn4Ww7P64CQahF9Qg+ls7YziMnfSYzflA6z8LJTLPwUP9mruEBe5MBTWS
         qQaJ/jsPJ5ZhwQZveu5fKb/udq1j6yjlQ8Q03VHzCXAEa64Fyd3Q4Nqle79tPOLbJDMN
         17h6Kgqydf9sFD7mrPqjNPjbxG7DFl76yhxmag8ivibi3m7RgKVYOEaEkMK3JZRjKSIc
         rxKg==
X-Forwarded-Encrypted: i=1; AJvYcCWVzho7C9VuvyICahdj2iLNn6ShJv00aM/RGwNArGA8HQWTyfk1IdkQoFmviDLMIu7UZs1goKi1NjhM5Cpc@vger.kernel.org
X-Gm-Message-State: AOJu0YxASNE8jRJxJflhpXfSt4gR9lxjt25wdur23j9sm3gAQO/BTjfm
	e/pGCSRjXuwBs3bbQ0kKJFwYIci7b1r8CPD4B5UvrctJt6PUwYxAZo/PohLa8WJc22Lolb2dDvp
	h3qZv1R5gcEx6cAdoWquD455UGOSi5ZPpyLU7aPsdMAt5Wb9xNXJUDLz65A5lbCcr5JY=
X-Gm-Gg: AZuq6aIu/LDRCUyHtw7X1yio+qGttEpjGF1o+qrKk0zJkbIJFVbgAS2RYKggAMvPsDK
	2zShUcJBXvniNZ2QfymQzXPbrHg91MgRQrBVW7S5qCIEyOxqhCChzM2POPVwHB5IX50EpTUJiJG
	PG65bX39BNjGYOf1r5PM3sRcCo2/jYCnUcpG3ZXDuCAXAyerXzypbe2NMld8KD7FATia14FtffS
	XzWfkEttiuTOjEXkVBwmhYPxkuj03j7dC3H9hz+9nyLWjbtnKtWLWKgvRQ6H1ssbEL3h7X6KkrC
	nRKzVOq1uv/FUmrUgRmfPnRaNtSiwzAoubmkQRhP4UkhGN9+KsGY3hFeijH6QFm4JIwKEAVBBKN
	hYuSyjZv8
X-Received: by 2002:ac8:5fca:0:b0:4e7:2210:295f with SMTP id d75a77b69052e-502d84b0ca5mr87957191cf.13.1769036030790;
        Wed, 21 Jan 2026 14:53:50 -0800 (PST)
X-Received: by 2002:ac8:5fca:0:b0:4e7:2210:295f with SMTP id d75a77b69052e-502d84b0ca5mr87956771cf.13.1769036030338;
        Wed, 21 Jan 2026 14:53:50 -0800 (PST)
Received: from redhat.com ([2600:382:8125:73a8:e201:8ac3:bd7d:6acd])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-502a1f1abb9sm117138811cf.30.2026.01.21.14.53.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Jan 2026 14:53:49 -0800 (PST)
Date: Wed, 21 Jan 2026 17:53:44 -0500
From: Brian Masney <bmasney@redhat.com>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>
Cc: linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
	Chen Wang <unicorn_wang@outlook.com>,
	Inochi Amaoto <inochiama@gmail.com>, sophgo@lists.linux.dev,
	Chen-Yu Tsai <wens@kernel.org>, Maxime Ripard <mripard@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	linux-rtc@vger.kernel.org,
	Andreas =?iso-8859-1?Q?F=E4rber?= <afaerber@suse.de>,
	Manivannan Sadhasivam <mani@kernel.org>,
	linux-actions@lists.infradead.org,
	Keguang Zhang <keguang.zhang@gmail.com>, linux-mips@vger.kernel.org,
	Taichi Sugaya <sugaya.taichi@socionext.com>,
	Takao Orito <orito.takao@socionext.com>,
	Jacky Huang <ychuang3@nuvoton.com>,
	Shan-Chun Hung <schung@nuvoton.com>,
	Vladimir Zapolskiy <vz@mleia.com>,
	Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>,
	Bjorn Andersson <andersson@kernel.org>,
	linux-arm-msm@vger.kernel.org, Orson Zhai <orsonzhai@gmail.com>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	Chunyan Zhang <zhang.lyra@gmail.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	linux-stm32@st-md-mailman.stormreply.com,
	Michal Simek <michal.simek@amd.com>,
	Rob Clark <robin.clark@oss.qualcomm.com>,
	Dmitry Baryshkov <lumag@kernel.org>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Abhinav Kumar <abhinav.kumar@linux.dev>,
	Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
	Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	linux-phy@lists.infradead.org
Subject: Re: [PATCH 00/27] clk: remove deprecated API divider_round_rate()
 and friends
Message-ID: <aXFY-FxqeBv4BsHd@redhat.com>
References: <20260108-clk-divider-round-rate-v1-0-535a3ed73bf3@redhat.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260108-clk-divider-round-rate-v1-0-535a3ed73bf3@redhat.com>
User-Agent: Mutt/2.2.14 (2025-02-20)
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.46 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	R_DKIM_ALLOW(-0.20)[redhat.com:s=mimecast20190719,redhat.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[48];
	FREEMAIL_CC(0.00)[vger.kernel.org,outlook.com,gmail.com,lists.linux.dev,kernel.org,sholland.org,lists.infradead.org,bootlin.com,suse.de,socionext.com,nuvoton.com,mleia.com,timesys.com,linux.alibaba.com,foss.st.com,st-md-mailman.stormreply.com,amd.com,oss.qualcomm.com,ffwll.ch,linux.dev,poorly.run,somainline.org,lists.freedesktop.org,linaro.org];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-90090-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DMARC_POLICY_ALLOW(0.00)[redhat.com,quarantine];
	DKIM_TRACE(0.00)[redhat.com:+];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	R_SPF_SOFTFAIL(0.00)[~all:c];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bmasney@redhat.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:7979, ipnet:2605:f480::/32, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[dfw.mirrors.kernel.org:helo,dfw.mirrors.kernel.org:rdns]
X-Rspamd-Queue-Id: B815D5F1E8
X-Rspamd-Action: no action

Hi Stephen,

On Thu, Jan 08, 2026 at 04:16:18PM -0500, Brian Masney wrote:
> Here's a series that gets rid of the deprecated APIs
> divider_round_rate(), divider_round_rate_parent(), and
> divider_ro_round_rate_parent() since these functions are just wrappers
> for the determine_rate variant.

I sent you a GIT PULL for what can go to Linus for the upcoming merge
window from this series:

https://lore.kernel.org/linux-clk/aXFYU324yQ6uBmk0@redhat.com/T/#u

Thanks,

Brian


