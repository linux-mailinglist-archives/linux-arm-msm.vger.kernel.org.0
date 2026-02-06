Return-Path: <linux-arm-msm+bounces-92059-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id j+2yIeMEhmkRJQQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-92059-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 06 Feb 2026 16:12:35 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E4B6FF8A1
	for <lists+linux-arm-msm@lfdr.de>; Fri, 06 Feb 2026 16:12:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 856B1300492D
	for <lists+linux-arm-msm@lfdr.de>; Fri,  6 Feb 2026 15:12:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 868EA28134F;
	Fri,  6 Feb 2026 15:12:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="HYUlrxOu"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28366278E5D
	for <linux-arm-msm@vger.kernel.org>; Fri,  6 Feb 2026 15:12:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770390753; cv=none; b=P7pzrBrM2UBNI12oLlQVC0c+0jWQiuE+R2Sp+96dgeUR53ZyV3ThPuCGdDv9K/rmYlIHZRiIqpC8Qmo43VGoI213TVwQBwdDJx8I0YP+WL0JH74tpSzRLlnEJMaTHl9Q4+FByfke5frRZv8AIKLx+MisK/vdvYwouGvOdH6NuCM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770390753; c=relaxed/simple;
	bh=exS9lpvMIPSui5dYPl8RRm6T2he8TXZfJaJDI9hyJHA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dhkzrw+2jt16+JJceu2huHDp1XKh888Nwr1IQoUJLSpCEiD2CH6Co7EvpKuOMaOfsrBoA41ZffAnmA63eHs0eM/KDnStmKAhJ8InDVzBohzdZI0aAibH325FSkIjTA0gj2EVTsdfTVHMTQP+4AOhnHpF4U+gm2P6l633PUlX87U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=HYUlrxOu; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-43629377370so962640f8f.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 06 Feb 2026 07:12:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1770390751; x=1770995551; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=0qv6VsOCxQoO4j1TGj8cncRGggXzBemd1h0aOThntp4=;
        b=HYUlrxOu3drfZfJ0AFP+uraCfTaG7/ApdImYW8f/PdLnkRo7RJdMm4U8GGGgW/y+uS
         nvD56atoc9X1F6zk5UncJzjbgQhfDo3tOKtZAswgvi10L+3ndpvhNw6+zKeoamgtorWB
         qKvPLLzZAPtJs/EiwhjNpohVHeOIg3zRcEAVG8iuuCeXBvvZ6z4sX57oEGKeqTPX0Y51
         E+Jf4yM4gJNi2hwiq1wSyUK+snzboIoXhghYtF3vqMTVDNQcvF1Iw3H3znmUjIJmr6Ky
         W6/5bMG6gToW+CE81BYQLCdlprCxXlZXTMHXdX4t1lO01dcqwq9GA3vbRQe5JdQS8etI
         HmNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770390751; x=1770995551;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0qv6VsOCxQoO4j1TGj8cncRGggXzBemd1h0aOThntp4=;
        b=iKeDYIuute0hX4rnmXmTcFdObZGg4k7oj9HfAz/QWzWUDYNDMpRJct+Bh6EsDioMHG
         6NWytHR/Jhj9hDCrjxjP+aTFQMCQuOrlAvHMJ36z+v402sx+dIaehUgQCRjUJVv9v3mS
         6E2H/veo51noc6xa71f7Y8/nKVMpB9CxmCrOL8/zWjqJOtC7wO7myFZpCcUX3NMNp5F1
         GPOaYZzKSeLGAx/M7mTAuf7axNi7PJXQAirD2kAYkvLfRXgdzuaXi4iH84TaycuqD0Qb
         CmH1cuHXrhPC+grnmO9vETyPuL87YWaCexfFDdhqcwRa7ueJdPvLy7gVSJ2xNmBZpFI+
         Q8pA==
X-Forwarded-Encrypted: i=1; AJvYcCWl8mlA0OYaqgMGiR12+IoDZxx6KwH9P7RsM/SAZNyVFjoTkHheefrC929y3leTWDsG8QVCtCYXPeHpO/pt@vger.kernel.org
X-Gm-Message-State: AOJu0Yw4yQRtiIpodCmkHsJBXxKWEQeRZIvujByEbQMXw3782+mIo0qV
	qwEqBGah3qRipnQ3acltOVHZUwVh/slBgvlW9x/1kYLfsHTd0qIXa64vWjU7+7e7NQk=
X-Gm-Gg: AZuq6aJ9BQzVulIShz5ix3W1LSNq60RKMLdGcIqf71PXCcYZgB1LjUD7dgxY4RZrh37
	+b2GYg9d6HWlpUfbg9mK6Ihqs8nK/hHfnfV+GY+Ame0c/Pf5Uhb/GjRXHhW/hU8cCT5eXTDMLMP
	uGGlAJQ6ENdMt+IJMlcmOZ+YLSt8zWQBvmBn36+ejLEto0hZ6IYCjtivKBSfX2qWMNkjT8euAJT
	RVN+DZYw0oGYf2QeKxsjCWvl46DL2Bbzb3jHqNTwSd4P8nvi6eKV3oI927B4+ADeUlxGejPpu0K
	g4lUUw7o6dY5euFgBQg43A3qkl3W97yz6UkkUy5di8EkdqnVcKUhBXigqwLJPFrXpa5dyn5VCo7
	wzzDG/VS8IS1+9NukBwXNxDAnxyQvTMwW6KfaIrXviKWfedMJ8bYkjsBRkVEX183Qc5+aiDgEfP
	tWYuJt7QcNpfxbu0yH4Cr9B2Y=
X-Received: by 2002:a05:6000:1844:b0:436:68e:3302 with SMTP id ffacd0b85a97d-4362933bd46mr4575279f8f.13.1770390751499;
        Fri, 06 Feb 2026 07:12:31 -0800 (PST)
Received: from linaro.org ([2a02:2454:ff23:4441:1c2c:7aff:fe45:362e])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-436296b2110sm6393053f8f.3.2026.02.06.07.12.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Feb 2026 07:12:30 -0800 (PST)
Date: Fri, 6 Feb 2026 16:12:17 +0100
From: Stephan Gerhold <stephan.gerhold@linaro.org>
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: Stephan Gerhold <stephan@gerhold.net>,
	Johannes Berg <johannes@sipsolutions.net>, netdev@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel <linux-kernel@vger.kernel.org>
Subject: Re: [bug report] net: wwan: Add Qualcomm BAM-DMUX WWAN network driver
Message-ID: <aYYE0SBR6V-HWcPr@linaro.org>
References: <caa37f28-a2e8-4e0a-a9ce-a365ce805e4b@stanley.mountain>
 <aYXu1uXRG1KHrKej@stanley.mountain>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aYXu1uXRG1KHrKej@stanley.mountain>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[linaro.org:+];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-92059-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[stephan.gerhold@linaro.org,linux-arm-msm@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,linaro.org:mid,linaro.org:dkim]
X-Rspamd-Queue-Id: 1E4B6FF8A1
X-Rspamd-Action: no action

Hi Dan,

On Fri, Feb 06, 2026 at 04:38:30PM +0300, Dan Carpenter wrote:
> [ Smatch checking is paused while we raise funding.  #SadFace
>   https://lore.kernel.org/all/aTaiGSbWZ9DJaGo7@stanley.mountain/ -dan ]
> 
> Hello Stephan Gerhold,
> 
> Commit 21a0ffd9b38c ("net: wwan: Add Qualcomm BAM-DMUX WWAN network
> driver") from Nov 27, 2021 (linux-next), leads to the following
> Smatch static checker warning:
> 
> 	drivers/net/wwan/qcom_bam_dmux.c:505 bam_dmux_cmd_data()
> 	error: buffer overflow 'dmux->netdevs' 8 <= 255 user_rl='0-255' uncapped
> 
> drivers/net/wwan/qcom_bam_dmux.c
>     500 static void bam_dmux_cmd_data(struct bam_dmux_skb_dma *skb_dma)
>     501 {
>     502         struct bam_dmux *dmux = skb_dma->dmux;
>     503         struct sk_buff *skb = skb_dma->skb;
>     504         struct bam_dmux_hdr *hdr = (struct bam_dmux_hdr *)skb->data;
> --> 505         struct net_device *netdev = dmux->netdevs[hdr->ch];
>                                                           ^^^^^^^
> Smatch thinks skb->data is untrusted.  This is the rx path.
> 

Thanks a lot for the report!

I believe this is not a problem in practice, since there is an existing
check for this in bam_dmux_rx_callback() (which is the only function
that calls bam_dmux_cmd_data()):

	if (hdr->ch >= BAM_DMUX_NUM_CH) {
		dev_dbg(dmux->dev, "Unsupported channel: %u\n", hdr->ch);
		goto out;
	}

	switch (hdr->cmd) {
	case BAM_DMUX_CMD_DATA:
		bam_dmux_cmd_data(skb_dma);
		break;

Is that something Smatch should be able to detect?

Thanks,
Stephan

