Return-Path: <linux-arm-msm+bounces-29884-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 22DDA9637B0
	for <lists+linux-arm-msm@lfdr.de>; Thu, 29 Aug 2024 03:26:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 8765DB20BC9
	for <lists+linux-arm-msm@lfdr.de>; Thu, 29 Aug 2024 01:26:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 172E61798C;
	Thu, 29 Aug 2024 01:26:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="IJsfSflN"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8978ED51E
	for <linux-arm-msm@vger.kernel.org>; Thu, 29 Aug 2024 01:26:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724894762; cv=none; b=YoS7m1zPQVuOqBSSE9g9FSMZKBqSDzpWruGTSggLPTrMvo5vZcyHvJ9nnHxER8CC6g7uJdz3K1cK90JucTMExtXhNQlM0LoIqtNvY8+LqXQT6YL+OKA8W2dRbNlZzovoEvEhP+Qnb0+/nE2m+AWV0AwWV2/VpGgkkn9VV/u3Cbs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724894762; c=relaxed/simple;
	bh=F6LYgtupOlXgjAGai0ZKkEXkGCwTktV7Rh1Kho42+dQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=H8FtPdEDIpvpxZN56PeuuXUYHzhmrqyyG9s4Z4vS+dw2MbM2KrFfFsfDhyYEa1e8/z6KL70oPTVVfVn2mb+9bVgmM/Ic43dJzK5GIFz2v9DYavCatmCBSCm2FUuZ2mJSVT+ph+/BmA47B62cy3nBrPRpOCYUmryxOONVrNt+cMo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=IJsfSflN; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1724894759;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=NCKBnd0N4ngofQtqdbmG0bsbv/saL/8NeHoK/DY/VL8=;
	b=IJsfSflN+xVlhudor/fUjlM7BvKjj1uRP4s8Ilft0TdZkXEdorKq6woFBUEj9RIgzyE+en
	saIQh3jJBYCo1cHOLQItd0a1bniYWiG3llCyCTYonwOQWAI0H9OraxMPPZ0bCml+sWZ7eL
	7m6rZpQ72jABBHN37slx1qiyFlb/YxA=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-509-CyCxNePnMSmO1fC22Fbv4g-1; Wed, 28 Aug 2024 21:25:58 -0400
X-MC-Unique: CyCxNePnMSmO1fC22Fbv4g-1
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-3718bf7d54aso60052f8f.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 28 Aug 2024 18:25:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724894756; x=1725499556;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NCKBnd0N4ngofQtqdbmG0bsbv/saL/8NeHoK/DY/VL8=;
        b=o5ErNm4jQkbDLQ9vomy1cyrxlbuchze0JQU8FW1JL9+cxc0oP2sTjuGtAiQ/zDEs3i
         xj7sbhHqz2pUWfIwA3hwSKrlkSyB/+icjWZ5NUfIqRwnqEdh4heA7G3T/sEjvWFDhnFO
         yRd9OA8FONUtozOP/Mo4jBa+Xa5pj/8wamJXzBTuvnjLDS4cqeXxDYdc+jSDoq/XfPad
         r2CAvWu8WF/yIyoS2R5OfpjUfPhPdZ3bnALCAbpBD0PnvmuNk7cMZlPd64Ln1uhLkMuP
         nsYEyt2DKucIxFH5NULpW+CQOp4DI4DAAq+AJYu0OZNIU2tXBJJGn3IrJwxddYbjGlql
         lCxA==
X-Forwarded-Encrypted: i=1; AJvYcCWu6WFdBBsZ9vTtDXp6asDwa7/nzUGQ+qlNywO+OKaX3k/+q93M0hAmWpGuftG31PY7AOTW6PmDO4vk8oQQ@vger.kernel.org
X-Gm-Message-State: AOJu0YwVpMrytMQyojCev5dKRUs0duNSHJ6Axvnj8uRN4E/iMJGU1KrS
	hphcibrp7fvWXidfcaLa5zURmI5IqcOn/cYwSMsgO9DdsBXV82582fr7h5qRHRapAg0sW8+REM7
	2qf5eCCOrMp5b4bj7F/wEwvj8rkY5EIURogoYg+GM+haWcFoyNBFwrj3g7Yu9+CUDcBwkm4ZMlr
	DIX6gtfZUqfcgzMraBWjj1RaQLhFS/lGCeWpRX9WfjFMxwWkzy
X-Received: by 2002:a5d:6188:0:b0:367:bb20:b3e1 with SMTP id ffacd0b85a97d-3749b585e8cmr751686f8f.51.1724894756686;
        Wed, 28 Aug 2024 18:25:56 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH+KwBJlKEFrvCMNKO3gDjDCmOoXBeyyJ7X1fRtCCoZgJdTwG2aRjnzlCpU5Q++v6rK8ksdBopA+iVJG8goB+4=
X-Received: by 2002:a5d:6188:0:b0:367:bb20:b3e1 with SMTP id
 ffacd0b85a97d-3749b585e8cmr751675f8f.51.1724894756248; Wed, 28 Aug 2024
 18:25:56 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240828184019.GA21181@eaf> <a8914563-d158-4141-b022-340081062440@quicinc.com>
 <20240828201313.GA26138@eaf>
In-Reply-To: <20240828201313.GA26138@eaf>
From: Brian Masney <bmasney@redhat.com>
Date: Wed, 28 Aug 2024 21:25:44 -0400
Message-ID: <CABx5tq+ZFpTDdjV7R5HSEFyNoR5VUYDHm89JEHvKb-9TW6Oejw@mail.gmail.com>
Subject: Re: qcom-rng is broken for acpi
To: =?UTF-8?Q?Ernesto_A=2E_Fern=C3=A1ndez?= <ernesto.mnd.fernandez@gmail.com>
Cc: Trilok Soni <quic_tsoni@quicinc.com>, linux-crypto@vger.kernel.org, 
	Herbert Xu <herbert@gondor.apana.org.au>, "David S. Miller" <davem@davemloft.net>, 
	linux-arm-msm@vger.kernel.org, Om Prakash Singh <quic_omprsing@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 28, 2024 at 4:13=E2=80=AFPM Ernesto A. Fern=C3=A1ndez
<ernesto.mnd.fernandez@gmail.com> wrote:
> On Wed, Aug 28, 2024 at 12:03:57PM -0700, Trilok Soni wrote:
> > On 8/28/2024 11:40 AM, Ernesto A. Fern=C3=A1ndez wrote:
> > > Hi, I have a bug to report.
> > >
> > > I'm getting a null pointer dereference inside qcom_rng_probe() when t=
his
> > > driver gets loaded. The problem comes from here:
> > >
> > >   rng->of_data =3D (struct qcom_rng_of_data *)of_device_get_match_dat=
a(&pdev->dev);
> > >
> > > because of_device_get_match_data() will just return null for acpi. It=
 seems
> > > that acpi was left behind by the changes in commit f29cd5bb64c2 ("cry=
pto:
> > > qcom-rng - Add hw_random interface support").
> >
> > Which Qualcomm platform you are testing w/ the ACPI? Most of our platfo=
rms
> > uses the devicetree.
>
> Amberwing.

We have a few Amberwing servers in the lab at Red Hat. I verified that
qcom-rng was crashing on boot with an upstream kernel, and it's now
fixed with this:

https://lore.kernel.org/linux-arm-msm/20240829012005.382715-1-bmasney@redha=
t.com/T/#t

Brian


