Return-Path: <linux-arm-msm+bounces-43995-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A7646A0267C
	for <lists+linux-arm-msm@lfdr.de>; Mon,  6 Jan 2025 14:25:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 816AB164A20
	for <lists+linux-arm-msm@lfdr.de>; Mon,  6 Jan 2025 13:25:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5334C1DE3C0;
	Mon,  6 Jan 2025 13:24:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="c++d8cPu"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 409651DE3A5
	for <linux-arm-msm@vger.kernel.org>; Mon,  6 Jan 2025 13:24:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736169893; cv=none; b=oCsMIn3NQn2b7SbIpY72ZspDGT5WV4q5j+rlHITqVqPv3z/bWtIEiDyHIIZvL6MiGTv4OJPW3drWwcMaqHoGBk+BAuhRotuolCHVKRueyl0NaIhkNJVzuRPZG9vAw/Nn4I0zg8AuGAc/Ps3GvDWxqc7NEtRC/lHYk6pqOW+iGT0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736169893; c=relaxed/simple;
	bh=A6SCwTH0ZBMAjyXZe4Ko+ILCUaVYRr9Sxpbg6XtVUkk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=huxtAYzUb80Yf+2FEzAiX4v/ZGPdqrDtCyCINt3piNPQTqu4f5z8waEqwfPdYAzm+9UCmOwuLh9F0LHexg9MkcNMc1lTQYg1BFItDHdS6jsQMAJSbXEu+6EGfXgrBsiSl9B/Z+mf2QCI1z6WdjhpX3etGJ8oxnyaUpLOcgCTnrA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=c++d8cPu; arc=none smtp.client-ip=209.85.216.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-2ee86a1a92dso16543713a91.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 06 Jan 2025 05:24:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1736169890; x=1736774690; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=vUfLE4D3L43/Hjy6xgTH9enXIQ9LZQ3WuF35y/r7t68=;
        b=c++d8cPuESR6NexYKzQ16ESFV55wFfEmBpIooGun7tyUrQCMiAGkVMbeU8Lzj0IlG8
         leeoed2jdePW71hV0nOKn3we8OhbEdhUiLk/X9tlm50HFkJPyvupjQvz1iKMrowU2jcE
         epu4N2rpS/zzpQVs85ura1qLSiNIsRs+9tBUg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736169890; x=1736774690;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vUfLE4D3L43/Hjy6xgTH9enXIQ9LZQ3WuF35y/r7t68=;
        b=D+VuI5BrYZne6dookslrtKClp+Uod+K3mg7hjmOS9qxmVRDOfnEc8XfknS9XaKHjqw
         r1j7vSGp/Fue0xeooqbdHMAU7wDY0/skrq1RMQoxhdYTRCvjHLboQvnTV6P8UBPOPoxa
         53IkKiGUtg2T1pTiUBzY0u4Ql3MVN9JtxfvEgdsncnI5qPQPgGEm5cTIOrG40VhnKH0y
         dmsnahlzmnl73zrtFzyq+0I5STeOPBA4/pVdxypk7K9upkYHEAoT8+CAmyLGkAA/pFTN
         njOfbVOVT5zT5vuxIjwMu2xLdLW8/GOyu8qw3pPuQXR7GLmzl1b3r73Tn4vIG/igsRW0
         5tXg==
X-Forwarded-Encrypted: i=1; AJvYcCUBamywq2E9Ec/ob/VWS2PVatWTaDpiT8ldUeVXDw3Acc+FriUDHuZT15LvueOqefHKtXxmQjOK2I72OoWe@vger.kernel.org
X-Gm-Message-State: AOJu0Yy7LKSC6/y+2etLTz6UH/ZWj1vI0jhDURnHc49sBJgcJlFgkGkD
	9zLIeoKI4/OEiV/gub8/bwmWVSyrxls2/D8xjQSFZQKMVDo7B9YV79gjxPec0Q==
X-Gm-Gg: ASbGncvxG+F8Yyc+Ed4ViZdPYDGn+mwH9yj7m+kHgOIfcsShQUWGO5zfekj0OeI3EmO
	L+6xliF7lOjOgdcG5c8JUeniZZmG5az3DynwexujlOHTuc7KaEfrO9Jg0fBQBRtKhr1y++/g7f3
	fKeTvnYPZJdBeTsvfP5gv/CQU4VH5UDDgZeHTOQMrfoKqG1pPTXndKbCUYro/KXKtT7imgrv8bO
	4TOak+I+rgz/KAsN1rpJw0MOFh17wtFJnkfnVaRBLg6Bc8p8bMwhjArhtFu
X-Google-Smtp-Source: AGHT+IHZBSveO4NqFWbE0Vn/nrTYHh/OfJIa6sa9I67SklwWdJzelh6PPGsVsnRTOyb5vgsDPuYezw==
X-Received: by 2002:a17:90b:5183:b0:2ee:5111:a54b with SMTP id 98e67ed59e1d1-2f452eec7dcmr73020037a91.31.1736169890617;
        Mon, 06 Jan 2025 05:24:50 -0800 (PST)
Received: from google.com ([2401:fa00:8f:203:c142:c1e8:32c2:942a])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2f4633df7c0sm29908133a91.18.2025.01.06.05.24.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jan 2025 05:24:50 -0800 (PST)
Date: Mon, 6 Jan 2025 22:24:43 +0900
From: Sergey Senozhatsky <senozhatsky@chromium.org>
To: Hans Verkuil <hverkuil@xs4all.nl>
Cc: Sergey Senozhatsky <senozhatsky@chromium.org>, 
	Stanimir Varbanov <stanimir.k.varbanov@gmail.com>, Vikash Garodia <quic_vgarodia@quicinc.com>, 
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
	linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	stable@vger.kernel.org, Nathan Hebert <nhebert@google.com>
Subject: Re: [PATCHv3 1/2] media: venus: destroy hfi session after m2m_ctx
 release
Message-ID: <3teih4ch3qze5xdt4at2snv4ln5ebffhdc4f7bclbqxr3dhoiu@kwjnitey74uk>
References: <20241224072444.2044956-1-senozhatsky@chromium.org>
 <20241224072444.2044956-2-senozhatsky@chromium.org>
 <bd751d52-c378-4706-b93d-a063d1b8352d@xs4all.nl>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <bd751d52-c378-4706-b93d-a063d1b8352d@xs4all.nl>

Hi Hans,

On (25/01/06 14:15), Hans Verkuil wrote:
> Hi Sergey,
> 
> On 24/12/2024 08:24, Sergey Senozhatsky wrote:
> > This partially reverts commit that made hfi_session_destroy()
> > the first step of vdec/venc close().  The reason being is a
> > regression report when, supposedly, encode/decoder is closed
> > with still active streaming (no ->stop_streaming() call before
> > close()) and pending pkts, so isr_thread cannot find instance
> > and fails to process those pending pkts.  This was the idea
> > behind the original patch - make it impossible to use instance
> > under destruction, because this is racy, but apparently there
> > are uses cases that depend on that unsafe pattern.  Return to
> > the old (unsafe) behaviour for the time being (until a better
> > fix is found).
> > 
> > Fixes: 45b1a1b348ec1 ("media: venus: sync with threaded IRQ during inst destruction")
> > Cc: stable@vger.kernel.org
> > Reported-by: Nathan Hebert <nhebert@google.com>
> 
> Do you have a link to Nathan's report so I can add a 'Closes' tag
> afterwards?

No public link is available as the report was internal.

