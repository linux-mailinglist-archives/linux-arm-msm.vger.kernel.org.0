Return-Path: <linux-arm-msm+bounces-82785-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 91AE2C78039
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 Nov 2025 09:56:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by tor.lore.kernel.org (Postfix) with ESMTPS id A767B2CF38
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 Nov 2025 08:56:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E1ADE33C50E;
	Fri, 21 Nov 2025 08:55:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eJOhqxZI"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35B1B7405A
	for <linux-arm-msm@vger.kernel.org>; Fri, 21 Nov 2025 08:55:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763715355; cv=none; b=GyNO7Nm90yuzkuoedlDGBWoLRY4B5LFHOdS+WNWnAk8DBCnwrw+VFlbGf3ROIV/LiRynyKaaLWnWRm7+fblOmqMSQRqks2ymzh9jSL2Rp3wz3zMAK5DSov1CTzuxqAxynXg4UQvfCoP4WHfzPMDxlPN2X48q5Kr7Eqwj2NSDUzg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763715355; c=relaxed/simple;
	bh=OoL2umZT03m72CkFeJusRaWHWhvFa9IHNPN2eP9Kd9g=;
	h=Message-ID:Date:From:To:Cc:Subject:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iNokYw9JtCMvSuYjyAhSqNWVCMCBgz7usN5XUYFsHGqFAJ8XzAPohdVE3sTlMFRHMPR98ff8iBRD8pw/8vybKGpp6n0dc07lw7o1wWuV4pkoDx4xLmi5lI0knniKFR7/2LlH9LegSUZJif/wGh5KIf9FYMgg5feg0L01Ycru2MQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eJOhqxZI; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-477563e28a3so12290805e9.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 21 Nov 2025 00:55:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763715352; x=1764320152; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:subject:cc
         :to:from:date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=SMm/YL9VsIZIkUk1u+E8h9LVIR7JYnW9dD/TgeFH9hE=;
        b=eJOhqxZIzB9/hEwxQjPRJif6AyoDigeP1L0SpgSJURrD5DAgQDurduKyqVnn1EXgSG
         X0B1uYeKEEfNpIF7JUR9Fbr3xd9edaL/+968PTSawNpiEBFzMcNRAVKvRS3kdL1EsFqK
         bgkozwQVzv496Caw9zKX5BEy2gi2ACdQMD88qUF77yPZAe3G+luGRuvSKzgKljOBQbHw
         CNetYgxrsyEvdfIrRkbqxfKMLLv5xm/9v0GCMtenQ6qscHYTrw6thipEwaXEuRkj7fg2
         GtBmUhwZpfHJNe6nAtBz8DUHSB2+hS38gZDMvUhzledCvek3TSX3qb5mnBIr9FYkKv+n
         CZVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763715352; x=1764320152;
        h=in-reply-to:content-disposition:mime-version:references:subject:cc
         :to:from:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SMm/YL9VsIZIkUk1u+E8h9LVIR7JYnW9dD/TgeFH9hE=;
        b=kIzch6O48NRyuAWHAV2jLTib1Nh8Jh5/d1wJupjsoZi2YmQ9UQympzkudIAtmxgFnB
         6po2uW7mkwUgUKi+f/4T+FN4WNKHVx1ydNpeVfW/WsYPxC20dPLCCPPoa31rGyIxAxrC
         uK/7Jo0TE+46x+Akeaer66WR/AKgdMswWSZerPRwAi9tNFAJtTqvrVY2dwFMh9a/xMck
         OtHrIHoTMFqOThTOuGCETTlfllPbbRKJZLHylq8R6GIz/7shlaMfTwGMNXZxRlBVGb2L
         4ba8b9ZYRHOMoXGDqf5ZMgj+8aGHHL3h1HaAxgG3Zz80YwhtGB3865o7P0HXD8WuhTPW
         SReQ==
X-Gm-Message-State: AOJu0YypN1oqZWv/CIdICzjm76eLp2SFKKrQJP9jdlvllLzPXEsnvUdr
	xxvi1oOkqkgxGRSwXXR3egCj910qAx4QV/70DOs7Raqk9GW4GuPB1WOS289cBA==
X-Gm-Gg: ASbGncu9hKo9Q1DMT6jSs6a7X9zR2dB3S6D43ePkSyNJD4T3Zd2vGOQsvOVwAMuP3qw
	cilCdR8aZ9Metzgh4r40LuVgE16LgB7BJ8bigd2V70IwqZlp6dB9Geg1RaRm8++1m0JzegZt0w7
	47NGClKQ9KE9wT9C6eqK8Fyn7IUzJRBbOPShRSfkpwMLtmUbcFwA1srddpJRBhB18qT+8py9N5i
	lYnSrGBOZo097fBESuTJL9eurC+EYY6z4BwM/lPDUzEvGSbW9nt7pquCyQzXffet13GA4ALiJdR
	A2MvTRlfQhRJzlMJq6BXEdev0KAnfSIuHnxSFm90DFhlVd9MGdYvJdOV0/tDtdf391Hews7tSYq
	fSpGatFRAJQ5M5rYC2L+9KIry+C5U3LNr/gl8O3Mtk9Twsmlff5ZiMX2FM5+KZqF7odw1fdFaX2
	YbXnb//zKgpgC2djgGVhWZ9TgoyeEm4ZHZiF0J0fiqFeoC7ByhsA==
X-Google-Smtp-Source: AGHT+IHWgdKXsY37uiJeh/GHImX5sD3eIwyAoodvXy8X4oRJ+Y+XJcHEJulJZ1TZPsZK0kLmINMseg==
X-Received: by 2002:a05:600c:1d14:b0:477:9d88:2da6 with SMTP id 5b1f17b1804b1-477c026ed62mr15395755e9.0.1763715352200;
        Fri, 21 Nov 2025 00:55:52 -0800 (PST)
Received: from Ansuel-XPS. (93-34-90-37.ip49.fastwebnet.it. [93.34.90.37])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-477bf355933sm33758365e9.2.2025.11.21.00.55.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Nov 2025 00:55:51 -0800 (PST)
Message-ID: <69202917.7b0a0220.234ce9.9e36@mx.google.com>
X-Google-Original-Message-ID: <aSApFlqNOF6D9zGM@Ansuel-XPS.>
Date: Fri, 21 Nov 2025 09:55:50 +0100
From: Christian Marangi <ansuelsmth@gmail.com>
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: linux-arm-msm@vger.kernel.org
Subject: Re: [bug report] soc: qcom: smem: better track SMEM uninitialized
 state
References: <aSAnR3ECa04CoPqp@stanley.mountain>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aSAnR3ECa04CoPqp@stanley.mountain>

On Fri, Nov 21, 2025 at 11:48:07AM +0300, Dan Carpenter wrote:
> Hello Christian Marangi,
> 
> Commit 7a94d5f31b54 ("soc: qcom: smem: better track SMEM
> uninitialized state") from Oct 31, 2025 (linux-next), leads to the
> following Smatch static checker warning:
> 
> 	drivers/soc/qcom/smem.c:519 qcom_smem_alloc()
> 	warn: '__smem' can also be NULL
> 
> drivers/soc/qcom/smem.c
>     509 int qcom_smem_alloc(unsigned host, unsigned item, size_t size)
>     510 {
>     511         struct smem_partition *part;
>     512         unsigned long flags;
>     513         int ret;
>     514 
>     515         if (IS_ERR(__smem))
>     516                 return PTR_ERR(__smem);
> 
> We recently changed this from being NULL at the start to being -EPROBE_DEFER
> but the qcom_smem_remove() function still sets it to NULL and the
> qcom_smem_is_available() still expects it to be NULL at the start so it
> needs to be updated as well.
> 
>     517 
>     518         if (item < SMEM_ITEM_LAST_FIXED) {
> --> 519                 dev_err(__smem->dev,
>     520                         "Rejecting allocation of static entry %d\n", item);
>     521                 return -EINVAL;
>     522         }
> 

Hi,

I remember editing qcom_smem_is_available but probably it got lost when
amending the changes.

Creating a fix patch just now. Can you help me with what link I should
put in the Closes tag?

-- 
	Ansuel

