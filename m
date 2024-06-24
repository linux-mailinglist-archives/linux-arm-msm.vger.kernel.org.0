Return-Path: <linux-arm-msm+bounces-24054-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 66E9C9159C0
	for <lists+linux-arm-msm@lfdr.de>; Tue, 25 Jun 2024 00:20:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id E4129B234DC
	for <lists+linux-arm-msm@lfdr.de>; Mon, 24 Jun 2024 22:20:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6B68D1A0B15;
	Mon, 24 Jun 2024 22:19:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="NXf8vkoy"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-oo1-f46.google.com (mail-oo1-f46.google.com [209.85.161.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEB4D19E837
	for <linux-arm-msm@vger.kernel.org>; Mon, 24 Jun 2024 22:19:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719267595; cv=none; b=A4FEuLAKikwpF09fMr3m2LewfZTwTQypKgPCSM8erhjPcJdCNKojGXXnx1UQJkV7xLgE3SsoBdUhErOV+4LBmSXiQBF+3rsfhLlQEnWerp+FPGUvHE3M3zAnpsgU/UVLS2cKgQvi3BOxI8/fkDNmdtHqvxRsddrTRW9a9s0Br+g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719267595; c=relaxed/simple;
	bh=WbV55czxCzoSTYA/sPnqyvQYpq3855larmC1rOGAf6c=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=KAS2x5/KKhidHSdqEwAiZp5pY4Jf2Effbgrl5smfUeDdFeVScGeQu69GUz4vQfg7aY5ca392MacGer5FJkNokRbsKlyv/vWjGlv5+eZcfPxk/rbxldF5+6gyUz9dYtf03WF8E0b3mSiMw1fLtS/uLgFhYkv3T6aVCxr25ez1J5A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=NXf8vkoy; arc=none smtp.client-ip=209.85.161.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-oo1-f46.google.com with SMTP id 006d021491bc7-5c200bee86aso674886eaf.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 24 Jun 2024 15:19:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1719267591; x=1719872391; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WbV55czxCzoSTYA/sPnqyvQYpq3855larmC1rOGAf6c=;
        b=NXf8vkoyUdiLGwE8GXhqfp+i0/XFM/uxv1z+ah3oPd4B0I+Yj8/dPV9jjwO47ZsYYc
         LOTMyyDernxOb7HrZplSnr+/NCsbyISz/heDNl4BKAMJWH9MrIaW4i5pj1A6LmzZodxz
         NKnEge4UouqjZ1rp/7/l3Lsx0smTL1LesgPoM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719267591; x=1719872391;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WbV55czxCzoSTYA/sPnqyvQYpq3855larmC1rOGAf6c=;
        b=hddgPJ/n1YmQDEVy0X/pgVpBrs5YCn35sMC/wA2we0jbh1OFwQej2u6u/cf3THDTkK
         U3jrYu7z+z9v4ztk1omt8z011SaH/dTAd16COzn4XfJSHjlg7y+8AZ7TWafj9KO+Lvwj
         +y/Q4laN72500+fOJKOfmKN22GgzEWj1z5qMHqvS3KCohMcZJRhF5uT7kLHwBUGAfgUH
         rBan5NOiQZVkzqrpJcuUK+PNuBAoKJUeMMMAZYYqvrCtqHb6Jjmp8i6f2hv71m4PHqyn
         75me12ro88pvZSzsgoymEaSY8SZaXCcUz9mHCd55KAJNj+FAn5LdzqXmTiJv20HAsS1D
         +PpA==
X-Forwarded-Encrypted: i=1; AJvYcCXCQOtqaevQ/LrmqQ/iEAjc7xyJAKJTGy73/Qw8LQrTwqv4eSHeWQEjGLRGC0PFBERl5XGFQeHp3JQ2R/IHS7NWpO+n7KNbblX4xu+I9g==
X-Gm-Message-State: AOJu0Yy1Ow5kWtemV3R457inN3dp0CpZAAr6VjN5mRVF9FHBayHMYIqJ
	LM7K2k2RWLsCCjT5jOrzSwSwqzD9xq8ajQCZ6eiLdfsSRSagoLAqLqZFVq3vhB7VQpSPOo+R9SA
	=
X-Google-Smtp-Source: AGHT+IFN4cPapuoOB2fV4bD+s3pcTYw2i5HzRb3z07M8mNY91/BDCBlKB86TFJwRqwVshUVfbmzFbg==
X-Received: by 2002:a05:6358:5328:b0:19f:54a8:db62 with SMTP id e5c5f4694b2df-1a23fe0f8f4mr624789555d.20.1719267591281;
        Mon, 24 Jun 2024 15:19:51 -0700 (PDT)
Received: from mail-qt1-f169.google.com (mail-qt1-f169.google.com. [209.85.160.169])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6b51ef58fcesm38865766d6.116.2024.06.24.15.19.50
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 24 Jun 2024 15:19:50 -0700 (PDT)
Received: by mail-qt1-f169.google.com with SMTP id d75a77b69052e-44056f72257so52661cf.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 24 Jun 2024 15:19:50 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXWivulzAh7BYt0Koz399eOogpOJ1oRp6gu7/06wxmxgvt/aDnirQ1X06/ryFPOblPpESPKwon/LdnD2uVuKZXdpgOTCvt2DfFGj3gqow==
X-Received: by 2002:a05:622a:18a9:b0:444:ee24:8dc8 with SMTP id
 d75a77b69052e-444f2566c83mr1037071cf.22.1719267590005; Mon, 24 Jun 2024
 15:19:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240624133135.7445-1-johan+linaro@kernel.org> <20240624133135.7445-4-johan+linaro@kernel.org>
In-Reply-To: <20240624133135.7445-4-johan+linaro@kernel.org>
From: Doug Anderson <dianders@chromium.org>
Date: Mon, 24 Jun 2024 15:19:33 -0700
X-Gmail-Original-Message-ID: <CAD=FV=UL2NCbxmQALjKbW4BSpf4WkM30ZHLf1eZiMqRP+s-NDg@mail.gmail.com>
Message-ID: <CAD=FV=UL2NCbxmQALjKbW4BSpf4WkM30ZHLf1eZiMqRP+s-NDg@mail.gmail.com>
Subject: Re: [PATCH 3/3] serial: qcom-geni: fix garbage output after buffer flush
To: Johan Hovold <johan+linaro@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jiri Slaby <jirislaby@kernel.org>, 
	Konrad Dybcio <konrad.dybcio@linaro.org>, Bjorn Andersson <andersson@kernel.org>, 
	linux-arm-msm@vger.kernel.org, linux-serial@vger.kernel.org, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Mon, Jun 24, 2024 at 6:31=E2=80=AFAM Johan Hovold <johan+linaro@kernel.o=
rg> wrote:
>
> The Qualcomm GENI serial driver does not handle buffer flushing and
> outputs garbage (or NUL) characters for the remainder of any active TX
> command after the write buffer has been cleared.
>
> Implement the flush_buffer() callback and use it to cancel any active TX
> command when the write buffer has been emptied.

I could be reading it wrong, but in the kernel-doc of `struct
tty_ldisc_ops` it seems to indicate that flush_buffer() is for the
other direction. Specifically, it says:

This function instructs the line discipline to clear its buffers of
any input characters it may have queued to be delivered to the user
mode process.

It's hard to figure out which direction that matches to, but looking
at the descriptions of "read" and "write" makes me believe that it's
supposed to flush characters that have been read by the UART, not
characters that are being written out to the UART. Maybe I'm
misunderstanding or the kernel doc is wrong/incomplete?

I guess the underlying worry I have is that there's no guarantee that
the flush function will be called when the kfifo loses bytes. If it
ever happens we'll fall back to writing NUL bytes out and that doesn't
seem amazing to me. To me it feels like
qcom_geni_serial_send_chunk_fifo() should detect this situation and
then it should be responsible for canceling, though better (in my
mind) is if we never initiate any big transfers if we can get away
with that and still be performant.

-Doug

