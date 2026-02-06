Return-Path: <linux-arm-msm+bounces-92062-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2OUWMIUHhmkRJQQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-92062-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 06 Feb 2026 16:23:49 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2300DFFB2B
	for <lists+linux-arm-msm@lfdr.de>; Fri, 06 Feb 2026 16:23:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D3C2D30097F0
	for <lists+linux-arm-msm@lfdr.de>; Fri,  6 Feb 2026 15:23:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 596803D902A;
	Fri,  6 Feb 2026 15:23:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="K/uXAkMD"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f67.google.com (mail-wm1-f67.google.com [209.85.128.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFAB326ED33
	for <linux-arm-msm@vger.kernel.org>; Fri,  6 Feb 2026 15:23:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.67
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770391427; cv=none; b=esM8OkjBSkGe2x4jYa2nOE0g7+ZjPVUSbL9WAh+gUznl1S6b1JIH3CVitGU2qgtYroaB1OdEpzXD2uYqloBjd5sYY58w2W42oyR0paph6AkUyaFBdxedBr+bCdyDxsWGfYwprfM2JemtQDFf80//MERrq4yiwHRaWhvITmSREm4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770391427; c=relaxed/simple;
	bh=+O1Ls5mJN2w86ohgl0FWaLhpMAN9yWArFMvJtTQfTl0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JHZi+bg3VkhIZgxOiyEFYHIy3BLbD/71u2ZtgYzPoBpnaJDHxLhQ8u1S/djyuAKw1y2BNgmu9RQQoB/BfUob8yen1qiq5Kz+iUf2p7cuHn5xzz5OvbHEGG2v4gmsrHcwmCBuWO79k7bG/f3bI7zJhPbPu4GxUU63Oyq7fen93Hs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=K/uXAkMD; arc=none smtp.client-ip=209.85.128.67
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f67.google.com with SMTP id 5b1f17b1804b1-48329eb96a7so1686395e9.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 06 Feb 2026 07:23:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1770391425; x=1770996225; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=vmk3i2Xic+N6h+88mYHjXnA3IoHoaC3fj4TmXWw7rGg=;
        b=K/uXAkMDWvGQxodUUir939WxLkYqVCxvkC6umuDuKPQ+bl/LrMa2xTRS1g6wpO5zSe
         FubY9ilhu3RR3GIfEql69EVwOmXbdN2OBTEb1C7o8NQ6P8bwMP4U/PnmTYRHix/Hpb7u
         6lzE3KZtcPQNtId6S3uuJ4FqV4YG8ueqltz0stLJRSbi9yDRLq0v4H01SwDTerxTzXeA
         dQrKivfRuOxhNeU3pxDWMbpV/zkO3nu6FtwgPAzcRJZFvF9ZfgM+kmiKR8g8wVPhU1mR
         XLKpNnOBu1LsthkmCoiQxd9VJ8XIAUQ6XnLXvlswQ8R+DP6aJTeomLsiqZ8W7JXLSlVp
         ETTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770391425; x=1770996225;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vmk3i2Xic+N6h+88mYHjXnA3IoHoaC3fj4TmXWw7rGg=;
        b=asvjV8ypoDWhEROaAQcvewZRR1xphzmVZPuOlmq0AeYzMVtgrwR2xr7/6TEWlaMW1m
         UrFFpSqpmwghGbaVhe7vPN1vTDIuaWQZvNeTXwv5o4CDue1uhPPLf324a83we13ptDRP
         62+6B9CW3458QTIKeAGE3M2/9Fz7Smw5toBp9X+VZOipZinL5TwYxyYU3NCEKdtQ1bCA
         e9Xm1tobJIlc/TF5jZwoCmu23254Deg8Y8MgHXxakOhQ2KdHYdHBVgSQ85RI2ZQeTQT0
         NAVaLXTmufPJ1M/bG0Jn9IUdlmJBOEFO28I7c5386xXrfZZBp5PsVy9BADDFcvu3iJSm
         GOkw==
X-Forwarded-Encrypted: i=1; AJvYcCX27mFf1uzGlArEVJV0hvqHuEKhg8sfLKwF6bzmYvhyxi1EqX7z/frviqRh5oXI8ENHJi78ouI9hEjl1rJ7@vger.kernel.org
X-Gm-Message-State: AOJu0YySBYPv6l9kvmYaPQo/BOu1GDKmjNwuSV2vYNKovSLU29m1GZfh
	fHh8AJ5MsyRijUGJz9fHq+SmC6V5js3G6V0fNDES8++W5nmb6BbPGsioFe4x++i0QFE=
X-Gm-Gg: AZuq6aItZzowkvAbOW9alOhcpW6g7nl8IFhj9BtIWxQhUmvsD/YqsQRXqnhBT086Fdf
	/YznBls9Shk9sGBFeNQRiNV/+GM6Zi4fn9dvMqSP26bxFBcB5nJ6NEXfkoi/vTXQrJ86dXXza3o
	kkr/mqLcf55DRnWEkQCpI0VjKkt/5P+Z7eyKi/pGuhdgb5C9eDY2wZ7+rJyOitbTTfnt21Bp9+V
	O1gJgzSSIetvvbhFEgddU01PAZm/ZSaTzjz5haU/or2JRMn1LGFcxWL3+y1Di15s4UCB84r3iLe
	B2zqCH2uR0f/rSN2KSKkeWImQ2bINKJLhDkjXnBfCZcjMGHJJidvOx4LTT/TQjOXRFmAVP4xqb9
	ATwlrC1K9OaZLPgXaswpzxINTnrPDb6zC1630anRUS+qvwlqnuXSSLwxiz/PbTqBff2JunlFnMF
	aYq9r9WlGnRVB7kHMmxZiN37XnNik=
X-Received: by 2002:a05:600c:3b87:b0:477:df7:b020 with SMTP id 5b1f17b1804b1-48320966a0cmr42152645e9.18.1770391425272;
        Fri, 06 Feb 2026 07:23:45 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48317d7a924sm202077135e9.10.2026.02.06.07.23.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Feb 2026 07:23:44 -0800 (PST)
Date: Fri, 6 Feb 2026 18:23:41 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Stephan Gerhold <stephan.gerhold@linaro.org>
Cc: Stephan Gerhold <stephan@gerhold.net>,
	Johannes Berg <johannes@sipsolutions.net>, netdev@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel <linux-kernel@vger.kernel.org>
Subject: Re: [bug report] net: wwan: Add Qualcomm BAM-DMUX WWAN network driver
Message-ID: <aYYHfapZdjGYCGLI@stanley.mountain>
References: <caa37f28-a2e8-4e0a-a9ce-a365ce805e4b@stanley.mountain>
 <aYXu1uXRG1KHrKej@stanley.mountain>
 <aYYE0SBR6V-HWcPr@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aYYE0SBR6V-HWcPr@linaro.org>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-92062-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[linaro.org:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dan.carpenter@linaro.org,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCPT_COUNT_FIVE(0.00)[6];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,linaro.org:dkim]
X-Rspamd-Queue-Id: 2300DFFB2B
X-Rspamd-Action: no action

On Fri, Feb 06, 2026 at 04:12:17PM +0100, Stephan Gerhold wrote:
> Hi Dan,
> 
> On Fri, Feb 06, 2026 at 04:38:30PM +0300, Dan Carpenter wrote:
> > [ Smatch checking is paused while we raise funding.  #SadFace
> >   https://lore.kernel.org/all/aTaiGSbWZ9DJaGo7@stanley.mountain/ -dan ]
> > 
> > Hello Stephan Gerhold,
> > 
> > Commit 21a0ffd9b38c ("net: wwan: Add Qualcomm BAM-DMUX WWAN network
> > driver") from Nov 27, 2021 (linux-next), leads to the following
> > Smatch static checker warning:
> > 
> > 	drivers/net/wwan/qcom_bam_dmux.c:505 bam_dmux_cmd_data()
> > 	error: buffer overflow 'dmux->netdevs' 8 <= 255 user_rl='0-255' uncapped
> > 
> > drivers/net/wwan/qcom_bam_dmux.c
> >     500 static void bam_dmux_cmd_data(struct bam_dmux_skb_dma *skb_dma)
> >     501 {
> >     502         struct bam_dmux *dmux = skb_dma->dmux;
> >     503         struct sk_buff *skb = skb_dma->skb;
> >     504         struct bam_dmux_hdr *hdr = (struct bam_dmux_hdr *)skb->data;
> > --> 505         struct net_device *netdev = dmux->netdevs[hdr->ch];
> >                                                           ^^^^^^^
> > Smatch thinks skb->data is untrusted.  This is the rx path.
> > 
> 
> Thanks a lot for the report!
> 
> I believe this is not a problem in practice, since there is an existing
> check for this in bam_dmux_rx_callback() (which is the only function
> that calls bam_dmux_cmd_data()):
> 
> 	if (hdr->ch >= BAM_DMUX_NUM_CH) {
> 		dev_dbg(dmux->dev, "Unsupported channel: %u\n", hdr->ch);
> 		goto out;
> 	}
> 
> 	switch (hdr->cmd) {
> 	case BAM_DMUX_CMD_DATA:
> 		bam_dmux_cmd_data(skb_dma);
> 		break;
> 
> Is that something Smatch should be able to detect?
> 

Ah, you are right.  Thanks.

The problem is that skb->data is a buffer of u8 data.  Smatch does cross
function analysis, but it treats a buffer like that as opaque data.

Btw, I see that this code is actually from five years ago so I don't know
why it's showing up as a warning now.  :/  Sorry about that.

regards,
dan carpenter

