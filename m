Return-Path: <linux-arm-msm+bounces-19433-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id F1BED8BEE5E
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 May 2024 22:49:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A6C89280C91
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 May 2024 20:49:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C555155E6B;
	Tue,  7 May 2024 20:48:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b="jHLGKIa3";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="kObYxWcr"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from wfout1-smtp.messagingengine.com (wfout1-smtp.messagingengine.com [64.147.123.144])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC03454FAA;
	Tue,  7 May 2024 20:48:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=64.147.123.144
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715114932; cv=none; b=RswfOPwZhD71jVX5rtFQFpNW+AuP6lZ35W8EKfW3eWrEBqzbH92omItNbn8fZrS9/dqDew463rbZ7cli6HAm/Z8Smu8xS9mJ6vZLyx4ZzgLMqPSxNywDmdfIUPj+sI4ka21osWHHfeSPCZ2qL9lJYOXqJ4ue13Jwmcbf3W55fYA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715114932; c=relaxed/simple;
	bh=HEUFsU6+GbrvvWJ5r0D3OYRudWAEMmNWkbpg2pnlAck=;
	h=MIME-Version:Message-Id:In-Reply-To:References:Date:From:To:Cc:
	 Subject:Content-Type; b=sUHfAz5FxE00XIVobYAviz2PSX4ZMXDH4z3QIlzWxL5Tbg5yPiaybGAW1nmyi43ioS83sQWHvL/y/wz+kYTtShdxKecVFfFQEdsXkxE/8ze6k5sz08mcwjw1IFWSuYO5Y7wHZWgNd03IbGd6thlJqKerg5r89N0dEXuDicpBNaY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de; spf=pass smtp.mailfrom=arndb.de; dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b=jHLGKIa3; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=kObYxWcr; arc=none smtp.client-ip=64.147.123.144
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arndb.de
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
	by mailfout.west.internal (Postfix) with ESMTP id 94C0C1C0010C;
	Tue,  7 May 2024 16:48:49 -0400 (EDT)
Received: from imap51 ([10.202.2.101])
  by compute5.internal (MEProxy); Tue, 07 May 2024 16:48:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm2; t=1715114929; x=1715201329; bh=bk57LfF5IJ
	RUTZp8F/Afjo6cLQ7YrYnev8qqlUkN1Fs=; b=jHLGKIa3qEI3RgJasiaH9SsUaw
	X79aOnnHvHVgkOosQFLPc0t963nlCvuO6Yc03ZS1ruBcJ8btrM3KtGhm5FxgW0Ll
	zgA8HBjq6ioGdUnu/Ddd8+KRNY0lCeGYsZmDdULvrjAgxa2JuSpsTUx4I/shvVDy
	w3VqVmVATXrwND1RmJWvN04/R6aVOcCdohU+3Iq9YDWEbzy3TeLH7wT5HApuDuYI
	Pt/0hPQIYxVXD4YlvA9gvX2MZdfIPWTBngvCVprCECXA4110EDIjq5K0A1pXtYuK
	6k635JQn+T8nEHKyjiFKlUxx8uk8hHvs9+lk9iO7QLjrIY69zC/tHlEsUaJw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm3; t=1715114929; x=1715201329; bh=bk57LfF5IJRUTZp8F/Afjo6cLQ7Y
	rYnev8qqlUkN1Fs=; b=kObYxWcrRekpOxEtvCJBSwu9WrJ3saNNzge2zGuNoBkK
	OCyjfJ1ke1ifE84O6HIWbIQtCfLaWYOdA9eVjNm4Rh3ezbzgqIzT81Z/15epD+g5
	9hI2FzEvaKdhx1O81buQ28ue1Obdqnhy/FvqLCFQKEOyHeDPd5kgraO0GFHSWylJ
	0H2ReUCM8VrfN6izgNefffb9qTCNp32uyxrqKK2ek+U64enwd2iP0it6T05+PCAX
	015josKe+GqYO0MTd2AZdQ6Y2yvZD+u0abyxgeZsAyaKKQr6dOuQBfp2VUQNYn3u
	lzG9vKW8vbO6RC+bNlbz2O0WZZlpRfU0fOrelwouOA==
X-ME-Sender: <xms:sJM6ZgYcnENuCjx08OQtuFu4Bn5Sk7IfKmQZT7owBLRVLRgiW6Wn9A>
    <xme:sJM6ZrZuI1wZIqDwOXMaagJ0HkbxkbDYXSx-TGerC6uW533z3NbIs6tC0qRg4W-hn
    iRzXXJ1gJV0p4Ck2H4>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledrvddvkedgudehudcutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
    enucfjughrpefofgggkfgjfhffhffvvefutgesthdtredtreertdenucfhrhhomhepfdet
    rhhnugcuuegvrhhgmhgrnhhnfdcuoegrrhhnugesrghrnhgusgdruggvqeenucggtffrrg
    htthgvrhhnpeffheeugeetiefhgeethfejgfdtuefggeejleehjeeutefhfeeggefhkedt
    keetffenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
    grrhhnugesrghrnhgusgdruggv
X-ME-Proxy: <xmx:sJM6Zq__tesrTM01qibvZ852Q1AhH79yZ3aK9WAxR3rZj_-moilUEQ>
    <xmx:sJM6ZqqDbJwp8ksHWcC1EJhShau5KOYKIRgPRG-uLpqAvQvgTyzZEQ>
    <xmx:sJM6ZrqPeiGf_qyhkUVH3o5Z6DtENDPwu62tAojKoNBdPcwqWkF-DQ>
    <xmx:sJM6ZoTqrqq9BW7LwxJX_RGtBtEYjPHVNWBECyCEnXLvMSANbohagQ>
    <xmx:sZM6ZsDEhhKTFp0mu6xGdHAFdYMxjSvfBua4b8Lwogc9Bq79pFNUjfgP>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id BB590B6008F; Tue,  7 May 2024 16:48:48 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.11.0-alpha0-443-g0dc955c2a-fm-20240507.001-g0dc955c2
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-Id: <29b33c18-f123-4656-8507-406c87a12ec8@app.fastmail.com>
In-Reply-To: <20240507201238.213396-2-thorsten.blum@toblux.com>
References: <20240507201238.213396-2-thorsten.blum@toblux.com>
Date: Tue, 07 May 2024 22:48:26 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Thorsten Blum" <thorsten.blum@toblux.com>,
 "Srinivas Kandagatla" <srinivas.kandagatla@linaro.org>,
 "Amol Maheshwari" <amahesh@qti.qualcomm.com>,
 "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] misc: fastrpc: Use memdup_user()
Content-Type: text/plain

On Tue, May 7, 2024, at 22:12, Thorsten Blum wrote:
> Switching to memdup_user() overwrites the allocated memory only once,
> whereas kzalloc() followed by copy_from_user() initializes the allocated
> memory to zero and then immediately overwrites it.
>
> Fixes the following Coccinelle/coccicheck warning reported by
> memdup_user.cocci:
>
> 	WARNING opportunity for memdup_user
>
> Signed-off-by: Thorsten Blum <thorsten.blum@toblux.com>

The patch looks correct to me.

> ---
>  drivers/misc/fastrpc.c | 11 +++--------
>  1 file changed, 3 insertions(+), 8 deletions(-)
>
> diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
> index 4c67e2c5a82e..2857cddaf812 100644
> --- a/drivers/misc/fastrpc.c
> +++ b/drivers/misc/fastrpc.c
> @@ -1259,17 +1259,12 @@ static int 
> fastrpc_init_create_static_process(struct fastrpc_user *fl,
>  		goto err;
>  	}
> 
> -	name = kzalloc(init.namelen, GFP_KERNEL);
> -	if (!name) {
> -		err = -ENOMEM;
> +	name = memdup_user((void __user *)(uintptr_t)init.name, init.namelen);
> +	if (IS_ERR(name)) {
> +		err = PTR_ERR(name);
>  		goto err;
>  	}

There is also a chance to simplify this further using u64_to_user_ptr()
instead of the double cast if you want.

Acked-by: Arnd Bergmann <arnd@arndb.de>

      Arnd


