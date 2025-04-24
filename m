Return-Path: <linux-arm-msm+bounces-55364-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CECBA9AB0C
	for <lists+linux-arm-msm@lfdr.de>; Thu, 24 Apr 2025 12:52:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id E16BC7B8756
	for <lists+linux-arm-msm@lfdr.de>; Thu, 24 Apr 2025 10:40:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 308F3224B00;
	Thu, 24 Apr 2025 10:38:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FH9ORVNB"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9703B221FBD;
	Thu, 24 Apr 2025 10:38:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745491106; cv=none; b=mEE/n4LMbn0l6JiNBF6LTqgOQ6t1p7lr1yi9xGPD1jeoFXRrfMV3tZ4rQWJCIHG1xfw7sUc4vSh4uS/pNhQ5JwgVgQ6nNPxeHL9xMLAXM/LUDfBFq77DXNJpbpaebt7e0aCCyKol96t5GtzeNonZCwgD2L1IvPhH7C8qOifXDIg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745491106; c=relaxed/simple;
	bh=Nrgta2/7VEwA556j+K1CA7sPpFtBFe12i6Ec93SGicw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=dfdehJgkM866s/djmtBw9FfFfTHmp0LwAWPuwsBBDFQRv++BBiWQpCAFLgeqzNeBoFJFQMzsxH/5mPQ2IQ9Ir0nTVXeBlR0cBYTqSnNkUc0eVjI9d+kQG80TR1OClAQ999OUd6DZFpjQ0of/rXTM0CPAIMmpYPx2Of6+wqlen8w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FH9ORVNB; arc=none smtp.client-ip=209.85.210.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-736dd9c4b40so1735528b3a.0;
        Thu, 24 Apr 2025 03:38:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745491104; x=1746095904; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Nrgta2/7VEwA556j+K1CA7sPpFtBFe12i6Ec93SGicw=;
        b=FH9ORVNBD72y70zeWChjV33lpdCb/XitqOssOS6NauR14D6XK3XlqAv87pUHnPibv+
         w6qcWm5/2+2OuptglAs5ntC/1tkNSAfdRc/qoreNVTxg4u62VfIV2nIw2rWwMzXTkVEw
         +Wi/08HCs3iDKw/RT21lV2guGPlxjLMfqCORhlFE6oarMqWiabtVM/enhf6mU1B9OM8R
         ucVVIi1pSCVbYq3iOU4/w9pVo1YM/5cZXR/kDk0ZxiMgeK7FZkA7Fz/LSwIYl4DcQRwm
         2GjQEM32v1QGadGAlv+Vjpv1pmYVIF05LAt3lERQmbwILwVoE/6NyzRL8sAdZViQRJnv
         XElg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745491104; x=1746095904;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Nrgta2/7VEwA556j+K1CA7sPpFtBFe12i6Ec93SGicw=;
        b=lB8ijPuCUzOq/76UKtBRXDJTgQJiCdIp5LHkOTQaG1fVbHMExLyh9foeAclm5DfgkU
         mKD53Hx/lE7Jvgst6N+MB7edoaotOkPJ5CP7MqPZLH0FUN4R7QGIebCVzRpV3yWpyRQ1
         1mYj71sHygAGvZIIMvFLx2jbXNThmqBOoO72kqmbcv3bcYoKrtu/zVPQteEMZbLwdS7G
         5naD+XXxb30U64stOehcTDCFa0h5wsErjcMt7nBznfq7uIIrr3lXVUcjxh6o845ve0KD
         waNOy473eCem/zo/uCGkI3/YeclvShPuWOC1YK8wSkttGcrfGq0LudaQ57IXBL9KZOXo
         rxYg==
X-Forwarded-Encrypted: i=1; AJvYcCWSvfDvnK+oZwP0ogk1sgWZoD4dSitiCIfDouAzBOthwCNRVIHv4wxiePvAhjb8xrvhKNJgM9jAxkmbvxae@vger.kernel.org, AJvYcCWlEQxQGdp2CzPz85nhvER6ojgr0B1YWw3tZMHX3GG4SLhAVCEVezxvo6JPdjWvARBJtcO1eLHe+MJJiov7@vger.kernel.org
X-Gm-Message-State: AOJu0YwPNMhSTmxc7GC9ynHSHEeYx8qPaCEYqk53vRebsftOVhs5O6kQ
	z/Izj6Pk1kzt2itRwyJQEp3xMGaea2FKul83bER5KGXkbgvTigas
X-Gm-Gg: ASbGncvp39EkbqynQ6IzQaCum3ffqbvbIspc4a2UP9mZcLzJIDpvgqNkzsaPOqGON/Y
	QDB7+pkqlu5rtmnFUrs+O5z6cUnnh0qUq2CtxGZdBrJLzrbwbtWAVnXYpLvD/LiKIxQqdyY39mO
	xrdLvbpi7NoZCe3pilIit/uLedS/jKbrl+SUvOk1M4UgOeu/rGSlfVFa3FWftDhy+0fT/tAxx5Z
	Tzh5+FCLECpMJMrrui9YJ7xTRYD1+7l8YPhqTrdjDyICKrr8WdS1Zri0juiF1BtkEVL0iYsDtSm
	CpThpf5ns5oC3cR1W458vLsaM+TiNvmVypwKUD4=
X-Google-Smtp-Source: AGHT+IFblAEa2IajwDR48LGObFOr5YUTTm5hJ8f17L8YWgIJiEYZv9GGeLnUC1zETXQSojboHqvwfg==
X-Received: by 2002:a05:6a21:9102:b0:1ee:d664:17a4 with SMTP id adf61e73a8af0-20445dea998mr2677158637.10.1745491103634;
        Thu, 24 Apr 2025 03:38:23 -0700 (PDT)
Received: from nuvole.. ([144.202.86.13])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b15fa80fa97sm887608a12.51.2025.04.24.03.38.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Apr 2025 03:38:23 -0700 (PDT)
From: Pengyu Luo <mitltlatltl@gmail.com>
To: jun.nie@linaro.org
Cc: airlied@gmail.com,
	dri-devel@lists.freedesktop.org,
	freedreno@lists.freedesktop.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	marijn.suijten@somainline.org,
	mitltlatltl@gmail.com,
	quic_abhinavk@quicinc.com,
	quic_jesszhan@quicinc.com,
	robdclark@gmail.com,
	sean@poorly.run,
	simona@ffwll.ch
Subject: Re: [PATCH v8 00/15] drm/msm/dpu: Support quad pipe with dual-DSI
Date: Thu, 24 Apr 2025 18:36:07 +0800
Message-ID: <20250424103608.184295-1-mitltlatltl@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <CABymUCNL2FQax13vie8kqX_FpNOTZBPwKbxvKzmXHaXr2OjbAw@mail.gmail.com>
References: <CABymUCNL2FQax13vie8kqX_FpNOTZBPwKbxvKzmXHaXr2OjbAw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On Wed, Apr 23, 2025 at 10:50 AM Jun Nie <jun.nie@linaro.org> wrote:
> Pengyu Luo <mitltlatltl@gmail.com> 于2025年4月19日周六 02:34写道：
> >
> > On Mon, 03 Mar 2025 23:14:29 +0800 Jun Nie <jun.nie@linaro.org> wrote:
> > > 2 or more SSPPs and dual-DSI interface are need for super wide panel.
> > > And 4 DSC are preferred for power optimal in this case due to width
> > > limitation of SSPP and MDP clock rate constrain. This patch set
> > > extends number of pipes to 4 and revise related mixer blending logic
> > > to support quad pipe. All these changes depends on the virtual plane
> > > feature to split a super wide drm plane horizontally into 2 or more sub
> > > clip. Thus DMA of multiple SSPPs can share the effort of fetching the
> > > whole drm plane.
> > >
> > > The first pipe pair co-work with the first mixer pair to cover the left
> > > half of screen and 2nd pair of pipes and mixers are for the right half
> > > of screen. If a plane is only for the right half of screen, only one
> > > or two of pipes in the 2nd pipe pair are valid, and no SSPP or mixer is
> > > assinged for invalid pipe.
> > >
> > > For those panel that does not require quad-pipe, only 1 or 2 pipes in
> > > the 1st pipe pair will be used. There is no concept of right half of
> > > screen.
> > >
> > > For legacy non virtual plane mode, the first 1 or 2 pipes are used for
> > > the single SSPP and its multi-rect mode.
> > >
> > > To test bonded DSI on SM8650, the 5 patches for active-CTL improvement
> > > are needed:
> > > https://gitlab.freedesktop.org/lumag/msm/-/commits/dpu-4k?ref_type=heads
> > >
> >
> > [...]
> >
> > > base-commit: b44251a8c179381b9f3ed3aa49be04fe1d516903
> >
> > Hi, Jun. The display of my sm8650 device requires 4:4:2(lm, dsc, intf)
> > topology, I want to test this series, these patches can't be applied to
> > the latest linux-next tree, and I can't find the commit id in linux-next
> > or msm-next. Where can I fetch the tree?
> >
> > Best wishes,
> > Pengyu
>
> This is staging patch set. Code clean and formatting is still needed.
>
> https://gitlab.com/jun.nie/linux/-/tree/sm8650/v6.15-quadpipe-staging?ref_type=heads
>

Sory, it seems that this repo is private or internal for linaro, it is
unavailable in my end. Is it possible to set the repo publicly accessible?

BTW, I had tried it with linux-6.14-rc2 as you mentioned in changelog,
my display(PPC100HB1-1 binding with TDDI NT36532E) has the flag
`BL_UPDATE_DELAY_UNTIL_FIRST_FRAME`, if there is no frame, backlight
would refused to turn on. It turns out no frame is sent to display. I
checked encoder in debugfs(/sys/kernel/debug/dri/0/encoder-0/status),
found all frames underrun. Do you have any idea? Thanks in advance.

Best wishes,
Pengyu

