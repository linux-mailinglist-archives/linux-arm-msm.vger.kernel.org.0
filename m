Return-Path: <linux-arm-msm+bounces-83328-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B435C874FE
	for <lists+linux-arm-msm@lfdr.de>; Tue, 25 Nov 2025 23:28:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 754F53B4C20
	for <lists+linux-arm-msm@lfdr.de>; Tue, 25 Nov 2025 22:28:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8DA692EA173;
	Tue, 25 Nov 2025 22:28:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QXzWPwxd"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA60127E07E
	for <linux-arm-msm@vger.kernel.org>; Tue, 25 Nov 2025 22:28:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764109715; cv=none; b=tlRjopirn7e80Bv4kUmoOVOpyRiF2rZQbskXB3IXxoMJ1AzhZZSY+LWMM64S+fgnIKeKiGowlYxTquugnojR1jxzKxMOYWOPbmQqxXTpzKZAjD1OG/uwl5FohP+hGKA8njM1i5C++NFvG98NGaWvUwrSy0UmyOiWooEWWwf1qx0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764109715; c=relaxed/simple;
	bh=sNyVRXVpr2fxlfdrmMN3IaUxk8ease1NX3SocFMldzo=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=XrOIrYnUXytzYCVADj7Kr5k3XiXk5okGA6nYlJ33krdHYuQFbhL1c4/HJ0oPEO8z/u48Ew9dxqLQiPEqWn2Y2TN6aSXL+wgEJEEPLrWm40OY3fCAN3rZ3uP/Uoh0kDYkMcjrC4ZYMm02cC+pokuLQF2D9Vi/8btUKySjembe+fY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QXzWPwxd; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-42b3c965cc4so135846f8f.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 25 Nov 2025 14:28:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764109712; x=1764714512; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eCUVexFsXDWoIit+VMfgiiB5w9tt++PEcFHBr9yJ/KQ=;
        b=QXzWPwxdZZsX73EsmRpj324p+REOvIun1KmCSN81+qPIF0XaVoi9i0lZwA6I+d4fWD
         Go+0afyDv5+8/Zk6kJR6MLaSd//94V5bOp08A7YC1X/n5DmCYqXVT11niGvB7CjxYVlA
         7B2Z5gLNl3cjkwfXBWXWjm1QJp6iqheZ8WYLHGTuxTENImAjuM6btD81FBieYnYQ0qx8
         OyjQ2AShNwP7qzI8XbZVioWIyHPZdru6pligjn+lstDFXg+/1xNpdpk9a6VhXU6Sh6NB
         s/VfZV5z0QbyUqgPBDfBMxF2OGGCBz8vH8YpUYdSZCpqwavQY110ZbNLzegkXpe1FAQV
         X7Nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764109712; x=1764714512;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=eCUVexFsXDWoIit+VMfgiiB5w9tt++PEcFHBr9yJ/KQ=;
        b=TO4pN3nNLPMrZST7ASSHnTJkVM+ZgfX2G5LFr5icw8uV0DikCi97O4RFL6rHvYNWZB
         iVosdlpvyU+ic94KWEmuTIBcZNWJEkUWqWPZMsjP2ShO3wb6BKC3eRNuYGPZ/m8m4liG
         TJ0ELjwTmyMi8nMGJAcsg/1z7ljsAF38OSvbHjIkMPVPD56MVqPvqLUfJNWrcjFy77ov
         waWN8FGbS26OIwMzLGXV/NCKgJFDWD9iQoLHLmpTiXxw8ZYpflGV8KsAajzeckKiMyGS
         stPl+qQVC+sIM/1hh0ceVTv67COfneY2b14jkIiEF5eicfoDj9ksSSABdSA0HAIyiWkC
         eb+g==
X-Forwarded-Encrypted: i=1; AJvYcCWbwQvqj6V39rkM5MyKLmFut0RbTQpKwtTTmr8S/xg1XuH5j9yKYnLV62HUv9OKn8huwoiC/hkjA0ucqz6A@vger.kernel.org
X-Gm-Message-State: AOJu0Yw7c+eYvawSdEZcIfRCSCY4Ob7cnJhroi7qpCzNMQ+WrfyO+TE1
	OMz2H1UFhlElAnNwMIDVVBvA11iVCMVG8jTDzXyUt6os7XVBx6PAkz2n
X-Gm-Gg: ASbGncu0dGOXWNgIVV1v+UZHT2HhCkbFBgYi/EMlanmh6kJKsctnQTjbbvgzvFbUiYD
	V7os2cPnNbciL/HZCx5QkzOgx4YR70kdIjMqwrLrekuR9GW0Df5hjpFWNuJcvpi0/9C/TwQdizL
	ESTKGEEMvJINv5Z5K1bs6CvFRsW6n/gbwyDun02poIn/d1R823ER0qy0KBRnieb4rFvwckL2/Gl
	M6jn6tICazjCYnz0LKQzX+csoLjK5hSMvEdGpwlzvdPHjv6gzRiggUT/weUdIwG3s/fpdD+zgLI
	8TznM0FVJUG5KuHE2LIQ6o4oDHhpG5rMjwas4sdiJm66hZwwW+idn7r+ZmtNf7IGZICypqoalNm
	qPYfy++OpBDcLU6KPFNiQ73rBnNXcl/tZt6+lu3LN0WrKGBV39hQDPGN3jgCuZZR47haTu40mwY
	RUQg4hH6c/bZuVKrfFYnZhOL8+DQ7fW2XjucRTS824HnZft/hDk584df1ivkNPSmA=
X-Google-Smtp-Source: AGHT+IGRix9H0ebsIu500KvnYNHS6p/T/0zRkM2JsHUpkoNOlZZtTgVh8WwiYXJTe0DH725xppC7Dw==
X-Received: by 2002:a05:6000:3101:b0:42b:3455:e4a1 with SMTP id ffacd0b85a97d-42cba7a3381mr24934723f8f.15.1764109711807;
        Tue, 25 Nov 2025 14:28:31 -0800 (PST)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42cb7f34ff3sm37550260f8f.16.2025.11.25.14.28.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Nov 2025 14:28:31 -0800 (PST)
Date: Tue, 25 Nov 2025 22:28:29 +0000
From: David Laight <david.laight.linux@gmail.com>
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: Youssef Samir <youssef.abdulrahman@oss.qualcomm.com>,
 jeff.hugo@oss.qualcomm.com, carl.vanderlip@oss.qualcomm.com,
 troy.hanson@oss.qualcomm.com, zachary.mckevitt@oss.qualcomm.com,
 ogabbay@kernel.org, lizhi.hou@amd.com, karol.wachowski@linux.intel.com,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH] accel/qaic: Fix mismatched types in min()
Message-ID: <20251125222829.28ea138a@pumpkin>
In-Reply-To: <aSYMb4EKFCaYrWTI@black.igk.intel.com>
References: <20251015153715.184143-1-youssef.abdulrahman@oss.qualcomm.com>
	<aSYMb4EKFCaYrWTI@black.igk.intel.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Tue, 25 Nov 2025 21:07:11 +0100
Andy Shevchenko <andriy.shevchenko@intel.com> wrote:

> +Cc: David
> 
> On Wed, Oct 15, 2025 at 05:37:15PM +0200, Youssef Samir wrote:
> > 
> > Use min_t() instead of min() to resolve compiler warnings for mismatched
> > types.  
> 
> I believe it's the opposite to what has to be done here.
> At first glance it should be umin(), but I Cc'ed David
> who is the expert in this topic.

The old code should compile fine - and did for my x86-64 'allmodconfig' build.
Both values are 'unsigned' types; one is u64 the other 0xfff0u - so unsigned int.

What are you compiling it for? and is it an old kernel with the old minmax.h?
I think the new minmax.h has been backported to quite a few of the stable kernels.

The correct 'fix' for the old min() is to change the type of SAHARA_READ_MAX_SIZE
to be u64 - the same as the LHS (so 0xfff0ull).
This probably has other repercussions.

Just adding 0ull will change integer type without any danger of changing the value.
so (to me at least):
	min(dump_length, SAHARA_MAX_READ + 0ull)
is actually much better than a (u64) cast.
(even if the value is a pointer, it is still one afterwards...)

But this shouldn't need changing for the current kernel.

	David

> 
> > --- a/drivers/accel/qaic/sahara.c
> > +++ b/drivers/accel/qaic/sahara.c
> > @@ -615,7 +615,7 @@ static void sahara_parse_dump_table(struct sahara_context *context)
> >  
> >  	/* Request the first chunk of the first image */
> >  	context->dump_image = &image_out_table[0];
> > -	dump_length = min(context->dump_image->length, SAHARA_READ_MAX_SIZE);
> > +	dump_length = min_t(u64, context->dump_image->length, SAHARA_READ_MAX_SIZE);
> >  	/* Avoid requesting EOI sized data so that we can identify errors */
> >  	if (dump_length == SAHARA_END_OF_IMAGE_LENGTH)
> >  		dump_length = SAHARA_END_OF_IMAGE_LENGTH / 2;
> > @@ -663,7 +663,7 @@ static void sahara_parse_dump_image(struct sahara_context *context)
> >  
> >  	/* Get next image chunk */
> >  	dump_length = context->dump_image->length - context->dump_image_offset;
> > -	dump_length = min(dump_length, SAHARA_READ_MAX_SIZE);
> > +	dump_length = min_t(u64, dump_length, SAHARA_READ_MAX_SIZE);
> >  	/* Avoid requesting EOI sized data so that we can identify errors */
> >  	if (dump_length == SAHARA_END_OF_IMAGE_LENGTH)
> >  		dump_length = SAHARA_END_OF_IMAGE_LENGTH / 2;  
> 


