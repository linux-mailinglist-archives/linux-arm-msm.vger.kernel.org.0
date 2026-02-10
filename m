Return-Path: <linux-arm-msm+bounces-92482-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EN/UHcQLi2lXPQAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-92482-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Feb 2026 11:43:16 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id D005B119BC9
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Feb 2026 11:43:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 847843036601
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Feb 2026 10:43:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 76658341666;
	Tue, 10 Feb 2026 10:43:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="RjkeQXv5";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="cjLmWxS3"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51D633246F8
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Feb 2026 10:43:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770720192; cv=none; b=H4/0pcT0p4yjfGl6/+6e63GzrfSFYDwZZKRg/NrzwSJHfDBauax2/rCYDgRIpAudDnPan5grfR8jNQqvCmFV7ETWZJYVv12wq5bJofpcjb/sTTEnJkkxytpHO84nCb8iJsr2BS/41cE+knnfZ+DMWFwt0BcKYVZevc3N2xhTi0g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770720192; c=relaxed/simple;
	bh=vHPy9K6nokN5ud3vsHqsnfz5aMNvYf7p1Fjjl5JuZl4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=KyYWVP4ukqNRAqu0P6RB6CH0SsLvy5MP0RasNC6gUm1VfO7E2Y+i4sZT1TfiLegbu7SvdCZhsGgdps6QkejzyA0hq9DoG3zxTLs/nH/ii76bMj1w0nbLJMEZnu4bIU81gmV29E1bQ570pdivNJGiBOhJ53pvi0tfA3tyeMqsGfU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=RjkeQXv5; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=cjLmWxS3; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1770720190;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Fmh15d1w5jSmpFxvJDonnQ9HoIg4ckFkxRJYSCGgMUo=;
	b=RjkeQXv5yxtKt6J80wP1q7vd3TeHejtnQjHYdsR/DilO4uJ6MYA4UucKTrTmAEP8P4kk12
	FILD1Yko8JkUybUwOWjgOqEhUgwrYQez2En5RMZpy6LqOe8sRhcXJXsyLn9e19kL3NbOWj
	yIVmwmzNIUjHe4s648ej+YIqYqJJwf0=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-250-Jxa2U3WSPuGkcgzCk9OlKw-1; Tue, 10 Feb 2026 05:43:09 -0500
X-MC-Unique: Jxa2U3WSPuGkcgzCk9OlKw-1
X-Mimecast-MFC-AGG-ID: Jxa2U3WSPuGkcgzCk9OlKw_1770720188
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-4802bb29400so50916475e9.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 10 Feb 2026 02:43:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1770720187; x=1771324987; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Fmh15d1w5jSmpFxvJDonnQ9HoIg4ckFkxRJYSCGgMUo=;
        b=cjLmWxS3rvNWcQRyuoZSEmNtfPCgWKWwhQefWCRGW1KWUCIbdqYuzLqH3utruLC62d
         ShNSuGs8LvHexACHDJcLes+DGh/zjeO68iiXf/r3GaHzi9RHlpV3xuaMtTUixX6upfF/
         8d9erq2kuQh+/x4+aOME+ycO1PDn2oeZC1Rsbp+oudCTLuxXwxlod5bUPO0JDzrUbEYu
         qVBnXtljOWZ+vp1PQtJLiKMZleyU5IJkG3lC5DWxYNljV1W4xGI4SDH3gqn5BgViwu2S
         5buo3Yx3Tb58Dmx1o3NI3gJuBO40IdtBPvm+HLy8dX6kwxT8mEmF/FDQ6B06w1GnTpmr
         z8nQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770720187; x=1771324987;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Fmh15d1w5jSmpFxvJDonnQ9HoIg4ckFkxRJYSCGgMUo=;
        b=Ulh+slrT0i+Bbp7jssVfA4eIHQSWiRbH6XPh1iKRHDS18RxXJ8MA5hRfRDZgv9hGH/
         9rjccu4qKTv0Ucf45AfASY1ASY8Rm6FrJB3P3rN760bccmx1TbGn+/31JGSLv6l9mPCX
         fsd9IBPliKvAPQEj4D1Edmd8Y9JCQOLyebN08xKCB8CgR6TBhWawXheKPElB3aZUyDxh
         gVfCLNR9fraU613j5jLiJZV32o0n8mcu7zEkMUdS7Xyt/U9uXLAWf0Sx73iJ0bpdeud8
         SwymF1hvM9NyHNl+RvfKlUqzAE+KXgeI9XPD0D+LD/YoUMSgwcUKe1NYS+EWh3ItO3jc
         OOVw==
X-Forwarded-Encrypted: i=1; AJvYcCW1MYeQBHyhsZyUsvcO7hrgtWSwga+EkdaeuWrl6knX8iTkbiJGmurqjwLMHXQt/d/oNpPEOZG/c9CQKzYQ@vger.kernel.org
X-Gm-Message-State: AOJu0YwxW9/1x00behnWZ2p7oDI2FtIr+E3yXBWj8ar2OAl9RKNxcQz7
	Gv6pfNFmT80JiawG14LL08tmY+nUUirgoacNXDgvLw7x1uQN659MjXnGjscbi7YVrdoU60OOKkd
	20yx4His2cwPtObBMDwdj2Erk/1LgOP0NVzzM4A6/PSUXqR5mYEp8A0M/mVdeOe3uX5pAcp+V4t
	o=
X-Gm-Gg: AZuq6aLsHHQGlqI+9kKdmEuXzK181xm5Bptol6e7UUtItOIl+IyVOwuLiSGuRidFa9a
	NdTh06kA2MMtIJCovnFLhvvVbgNFw/DKWqp9yLhgaRUORYflJXrP7IBdFpaHW+NXC/zyvCBNyoo
	0bOJuL8djy7iKylsw9dTsEJf5LO90zJCmzw/siYuQuKvv2hPIBefx2ghjCt/pijRwGCaaWIqNi5
	YP5gnkOVzXT6PQ1OY2EOB9cHuUM9QAEuuJdcIRLliLI2pcOHXG6DnMUZhQrHdyPW/zlO9j61IR8
	1M9pGv9QWxVkOJU8fx3tLR6Ah06bZlB1Jx53oXf52oTxIj0SIZIR2q6/cvK5BicZatNn8A4zpfF
	3Ime4lxMtQYI1CCt87gzhvL0=
X-Received: by 2002:a05:600c:3b87:b0:47d:4047:f377 with SMTP id 5b1f17b1804b1-48350836495mr29816005e9.36.1770720187352;
        Tue, 10 Feb 2026 02:43:07 -0800 (PST)
X-Received: by 2002:a05:600c:3b87:b0:47d:4047:f377 with SMTP id 5b1f17b1804b1-48350836495mr29815545e9.36.1770720186881;
        Tue, 10 Feb 2026 02:43:06 -0800 (PST)
Received: from [192.168.88.32] ([150.228.25.31])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4834d8334a8sm50734615e9.12.2026.02.10.02.43.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Feb 2026 02:43:06 -0800 (PST)
Message-ID: <59e7518f-65b2-4d97-ab81-bf64af758d00@redhat.com>
Date: Tue, 10 Feb 2026 11:43:01 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 1/2] net: mhi: Enable Ethernet interface support
To: Vivek Pernamitta <vivek.pernamitta@oss.qualcomm.com>,
 Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Manivannan Sadhasivam <mani@kernel.org>
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 mhi@lists.linux.dev, linux-arm-msm@vger.kernel.org,
 Vivek Pernamitta <vpernami@qti.qualcomm.com>
References: <20260205-eth_vdev_next-20260204_eth-v7-0-f85645210f81@qti.qualcomm.com>
 <20260205-eth_vdev_next-20260204_eth-v7-1-f85645210f81@qti.qualcomm.com>
Content-Language: en-US
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <20260205-eth_vdev_next-20260204_eth-v7-1-f85645210f81@qti.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[redhat.com,quarantine];
	R_DKIM_ALLOW(-0.20)[redhat.com:s=mimecast20190719,redhat.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[redhat.com:+];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-92482-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[pabeni@redhat.com,linux-arm-msm@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,netdev];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linaro.org:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: D005B119BC9
X-Rspamd-Action: no action

On 2/5/26 11:34 AM, Vivek Pernamitta wrote:
> @@ -4,6 +4,7 @@
>   * Copyright (C) 2020 Linaro Ltd <loic.poulain@linaro.org>
>   */
>  
> +#include <linux/etherdevice.h>
>  #include <linux/if_arp.h>
>  #include <linux/mhi.h>
>  #include <linux/mod_devicetable.h>
> @@ -38,10 +39,12 @@ struct mhi_net_dev {
>  	u32 rx_queue_sz;
>  	int msg_enable;
>  	unsigned int mru;
> +	bool ethernet_if;

This is not needed, instead you could check !!dev->header_ops

/P


