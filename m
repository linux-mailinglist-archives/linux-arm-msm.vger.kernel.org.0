Return-Path: <linux-arm-msm+bounces-46498-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CFC1A21C1B
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Jan 2025 12:24:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B5DA31884831
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Jan 2025 11:24:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 525D11B87F4;
	Wed, 29 Jan 2025 11:24:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="wKxxFiBI"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FB941AE003
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Jan 2025 11:24:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738149845; cv=none; b=HThcuOdUwZO5vY310Ngpqbh+9ZopXDPwu37UDgiQrBe6etUlOgaYWr0aGfiXv4IMeWww8LpJN94M7qrq7TwolxAuq2eJJj//uXLwgQvigLkJEYlVeclqsp+3pmVjYNErA/7ojfzzV0VFEG6laarGUMwcOGem7EQhIbJcFMrdmHU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738149845; c=relaxed/simple;
	bh=9NSzep+K0h2DraDOpD6cMXxE6StkzEqUUMS58tzyfDA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LdexhntEVfgKjZWrrE+3UFSY8h+PJszyYxj+/fkNNPO+JSvGY1OeLoXH9sUjxDzbWCsCRF6w5IQ/wvCsNqSA8k7u57ywFXuNUd1Bthk8FNk1rw12GXam9NtINnk9mUMdGl21bNGByRBd76YArAMwDaKUeaBGdz1a7SsV1isZpNk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=wKxxFiBI; arc=none smtp.client-ip=209.85.167.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-5401bd6ccadso6934457e87.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 29 Jan 2025 03:24:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1738149840; x=1738754640; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Sq0Kz/LUg6HvCz1toVpRA5JbYsjs1CqFZvdJ700FNco=;
        b=wKxxFiBIys/l0PKhKip9DDILDDRTrDqf+/1OgM5dS1rJ4ChGsyM5x1xgQga8MS/8mf
         r3nHd6f5t9YmhJd6YmMunA8nlPbWqQyc7re7VhisyqHeHxxz1z2MxFjI1lbe3qnbKiMW
         aIqd9IfFpRypbcVXBP2juHSXbHFKE5JV+sfTXFRSsda1paVbQoijQUPPlEzFHp5xjDva
         7rH3xuVwnCboW3jrMxkA9Oz9Y9cDYr2PbQ7U2zr4ZuDCp8f2u6RwUwiVR3ECBP/Suszg
         XMCO3OTjkvgORC1vZwpcOQupLvhdz/XxV6QAPyjdi43Opd4jFyi9TOFr1QzsssQvaK5K
         Vnzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738149840; x=1738754640;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Sq0Kz/LUg6HvCz1toVpRA5JbYsjs1CqFZvdJ700FNco=;
        b=CzuEPGioCeHvf1Iov65rwpEjNo0WkwlcB062xWkHh6AFWTK5Uxt5syeSmVoYTIDXPy
         hnhT6iLjFntdmhBv+qXAzdoCNm4iIJ4w9dDGn6PTYCn3MUv203V+QNMWYLU8LSamEX/T
         DIL89ctwzlmxnpIMpNVro2y68JIYoixI9TeJ5FJ/INX3igFcjD0tsRY+8eT5GTr5Q+y1
         ICFhtPRt2hSzhdODq6T4Z+R+W9AvvFeH9UtF5mXQitJmWJcUQU8ZHInjyGpPd+ohWEab
         FEV/wpBgroBhDRJ9cl4j6M8HIpIZf/DHeHl9Y7XSyyV/HHR6QdFjUjCGBkn8D1s6s0Zj
         eIpA==
X-Forwarded-Encrypted: i=1; AJvYcCVNM1HI0RociqFATi+ac1y3oMS2sQyyp5g6QzvZ+zpJ2tm2tnaZ/0D9M/tBGkiwXBzVL8YUi6MYdjz9+apx@vger.kernel.org
X-Gm-Message-State: AOJu0YwTCvJA6QTHg1yVpz/Tr/0ous1IJFUmRoKeOlMX3+boq1Cfed+l
	dll8BOwDUPAWPxaZNKtkcdewEA8CXR2MpARZZN22sw2vvdvQWge/6YR20NgfIBw=
X-Gm-Gg: ASbGnctx/Bno1lJ5nNoGdGakT8Ngjm3np1X/321FS4M6osOW2kuLkHPe7VGfmbdjHZc
	H6i1QSkP3FaajUDND56ycR2ho8Ap9mU84pgX1kzwUXy/gXVOzXYTtP/gqLSxZa89fZO3KpyDAZz
	MIbkBvW/H2lCSCoYJj14/czx7WDHC2fUCx5B6Sp9/D6MwIcjtZbHWIQBbzn0UJzpd33HGcwTw0K
	jMrCfyMXL6+QnDnDQF4ovYWx1cuzhHrV8hCsQeo+EeM5J7KuZ06xnZSwZZ8CYBJh2mSg4iLFYeG
	SAeOMG520JUsMywnYUdZQXzcHCmJHVr8MVDBIkQD2P19VkuOmgP0BN7FDbcp54ESDpM2LE0=
X-Google-Smtp-Source: AGHT+IFonMmnwyTxQvsSSBnscsFfAgnvairUN/GGWJXwTFN/hxnAK0AAK+OBASz6YUt7B+HlQTOT7g==
X-Received: by 2002:ac2:41d7:0:b0:542:6f2a:946a with SMTP id 2adb3069b0e04-543e4be034cmr688424e87.6.1738149840126;
        Wed, 29 Jan 2025 03:24:00 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-543c8231338sm1978338e87.103.2025.01.29.03.23.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Jan 2025 03:23:59 -0800 (PST)
Date: Wed, 29 Jan 2025 13:23:57 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Ekansh Gupta <quic_ekangupt@quicinc.com>
Cc: srinivas.kandagatla@linaro.org, linux-arm-msm@vger.kernel.org, 
	gregkh@linuxfoundation.org, quic_bkumar@quicinc.com, linux-kernel@vger.kernel.org, 
	quic_chennak@quicinc.com, dri-devel@lists.freedesktop.org, arnd@arndb.de
Subject: Re: [PATCH v2 5/5] misc: fastrpc: Modify context id mask to support
 polling mode
Message-ID: <jeixk4dmk53ubnujop3sp2lc6jffugjmzndmmqmyuft7uquibt@s2h2dgj7yj7h>
References: <20250127044239.578540-1-quic_ekangupt@quicinc.com>
 <20250127044239.578540-6-quic_ekangupt@quicinc.com>
 <im7gi5ib7wnihu3ff4a2erqctne2pm2zf3wl4qmuejz4dfhf7e@z5au6vnm5por>
 <08b469b8-2339-4fde-9472-fcaadbb4ed87@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <08b469b8-2339-4fde-9472-fcaadbb4ed87@quicinc.com>

On Wed, Jan 29, 2025 at 11:13:05AM +0530, Ekansh Gupta wrote:
> 
> 
> 
> On 1/29/2025 5:00 AM, Dmitry Baryshkov wrote:
> > On Mon, Jan 27, 2025 at 10:12:39AM +0530, Ekansh Gupta wrote:
> >> DSP needs last 4 bits of context id to be 0 for polling mode to be
> >> supported as setting of last 8 is intended for async mode(not yet
> >> supported on upstream driver) and setting these bits restrics
> >> writing to poll memory from DSP. Modify context id mask to ensure
> >> polling mode is supported.
> > Shouldn't this commit come before the previous one?
> 
> Yes, I'll change the order in next series.
> 
> Thanks for reviewing the changes.

Please consider asking somebody for the internal review before sending
patches. This should help you to catch such mistakes.

Next, I keep on asking for a sensible userspace and testing suite. No,
existing fastrpc doesn't pass that criteria. We have discussed that, but
I see no changes in the development. The PR that you've linked in the
cover letter contains a single commit, covering documentation, new
IOCTL, CRC support, poll mode support, etc. What if the discussion ends
up accepting the CRC support but declining the polling mode? Or vice
versa, accepting poll mode but declining the CRC support? There is no
easy way for us to review userspace impact, corresponding changes, etc.

Last, but not least: I want to bring up Sima's response in one of the
earlier discussions ([1]): "Yeah, if fastrpc just keeps growing the
story will completely different."

You are adding new IOCTL and new ivocation API. That totally sounds
like "keeps growing", which returns us back to the uAPI question,
drm_accel.h and the rest of the questions on the userspace, compiler,
etc.

[1] https://lore.kernel.org/dri-devel/Znk87-xCx8f3fIUL@phenom.ffwll.local/


> 
> --ekansh
> 
> >
> >> Signed-off-by: Ekansh Gupta <quic_ekangupt@quicinc.com>
> >> ---
> >>  drivers/misc/fastrpc.c | 8 ++++----
> >>  1 file changed, 4 insertions(+), 4 deletions(-)
> >>
> >> diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
> >> index 257a741af115..ef56c793c564 100644
> >> --- a/drivers/misc/fastrpc.c
> >> +++ b/drivers/misc/fastrpc.c
> >> @@ -40,7 +40,7 @@
> >>  #define FASTRPC_INIT_HANDLE	1
> >>  #define FASTRPC_DSP_UTILITIES_HANDLE	2
> >>  #define FASTRPC_MAX_STATIC_HANDLE (20)
> >> -#define FASTRPC_CTXID_MASK (0xFF0)
> >> +#define FASTRPC_CTXID_MASK (0xFF0000)
> >>  #define INIT_FILELEN_MAX (2 * 1024 * 1024)
> >>  #define INIT_FILE_NAMELEN_MAX (128)
> >>  #define FASTRPC_DEVICE_NAME	"fastrpc"
> >> @@ -524,7 +524,7 @@ static void fastrpc_context_free(struct kref *ref)
> >>  		fastrpc_buf_free(ctx->buf);
> >>  
> >>  	spin_lock_irqsave(&cctx->lock, flags);
> >> -	idr_remove(&cctx->ctx_idr, ctx->ctxid >> 4);
> >> +	idr_remove(&cctx->ctx_idr, ctx->ctxid >> 16);
> >>  	spin_unlock_irqrestore(&cctx->lock, flags);
> >>  
> >>  	kfree(ctx->maps);
> >> @@ -664,7 +664,7 @@ static struct fastrpc_invoke_ctx *fastrpc_context_alloc(
> >>  		spin_unlock_irqrestore(&cctx->lock, flags);
> >>  		goto err_idr;
> >>  	}
> >> -	ctx->ctxid = ret << 4;
> >> +	ctx->ctxid = ret << 16;
> >>  	spin_unlock_irqrestore(&cctx->lock, flags);
> >>  
> >>  	kref_init(&ctx->refcount);
> >> @@ -2675,7 +2675,7 @@ static int fastrpc_rpmsg_callback(struct rpmsg_device *rpdev, void *data,
> >>  	if (len < sizeof(*rsp))
> >>  		return -EINVAL;
> >>  
> >> -	ctxid = ((rsp->ctx & FASTRPC_CTXID_MASK) >> 4);
> >> +	ctxid = ((rsp->ctx & FASTRPC_CTXID_MASK) >> 16);
> >>  
> >>  	spin_lock_irqsave(&cctx->lock, flags);
> >>  	ctx = idr_find(&cctx->ctx_idr, ctxid);
> >> -- 
> >> 2.34.1
> >>
> 

-- 
With best wishes
Dmitry

