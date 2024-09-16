Return-Path: <linux-arm-msm+bounces-31863-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5565397A7DA
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Sep 2024 21:40:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 879871C221A3
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Sep 2024 19:40:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 470F84594D;
	Mon, 16 Sep 2024 19:40:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="IMzCJTA5"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2B472A1B2
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Sep 2024 19:40:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726515636; cv=none; b=c7J6/TiKAFFB/sa+PJTUAlW8CG24X6RG+iszqIgPm2EwBnQ4efvgAhnwUWvnaZMnjxRPEDUA9mMhuyqfxnpzO9ufp7C4dfciDbsg+xMdmGS35tCeV6kJVwkLrB7UN+MSqyqFicZ4fnzAxYM6DHBs7fq7I/xg2dOLcnNbvj1YX94=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726515636; c=relaxed/simple;
	bh=7yRCF6W5FfU3ij3odUYqCq8SxiLvJkMBHMwwpkwMnTk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BdcPPlcJiO7BRyiv8c84/9AiP+W/6E67feSmFWAcCdURnsv8hfpJMJbDCTPS6qOLUvLyJlg2mEIwQmPcCE71dCswP5YTpPZIXFAaj1m4oWNSgeZzbtb8zBQUTajGXSqRxQWGivMRiuOJF8H09e7EsEMYt9ZsljcPcaLISJOBBZE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=IMzCJTA5; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1726515633;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=7yRCF6W5FfU3ij3odUYqCq8SxiLvJkMBHMwwpkwMnTk=;
	b=IMzCJTA5Nggtxv0Bef+0dtt8mYm/ViIEnLBihxMEWPzmolfoqC0cSPDykyFVxNi5R0ke7P
	EIGVGiYuFiRKFccUX1k2kSCVYdo22pQt0+gQoq+EbbWWspRvBrA6PSgrJ/4+LP1pADO7Lb
	UJH1xjGEphqwnB3fgkxhS7ACfZOoMVo=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-542-igKOkfgFNMaZhCmyG-w8pg-1; Mon, 16 Sep 2024 15:40:32 -0400
X-MC-Unique: igKOkfgFNMaZhCmyG-w8pg-1
Received: by mail-ej1-f69.google.com with SMTP id a640c23a62f3a-a8a7f3f191dso383208966b.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 16 Sep 2024 12:40:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726515631; x=1727120431;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7yRCF6W5FfU3ij3odUYqCq8SxiLvJkMBHMwwpkwMnTk=;
        b=NZheXQN7FD81Sxd/ABegERiOx6WC8i1yMBcLffrqtlj6rqqGRt6wuaVJG8l4U8kshZ
         4jHy/QcSPI2jBniSQDJdOPBML4RGmnoiZkeQPf+eYCHQa5W2meSr0dW07HzJRfBSOLoP
         zGjnD+2k4uQr9gDgsvM1N2SY0RKhVRWMhE9jTfoipcol2VZ3yl6Thex9ntQTNpGli/Yf
         BZ2EqmYgfnScmVTb7gf+8ckZvfMGwqXkYyx8QZGjHj2RZ4y+kMfUA/mntP8lUz+Ub8Wb
         p4t2gBVPhTVjcKG4qTihpF4CUeO1MZhb+IzGH4Bi9A9zm2F+q05aadIeegA5ClryTW/0
         WTfQ==
X-Forwarded-Encrypted: i=1; AJvYcCWjIrXYThNIpLQ9DvgdShuLd7xrQoCPocEvXoITIAtrNBrUYZEWWXXrxMDU/992XxB0rh+rC/1Mq7nRF8Qo@vger.kernel.org
X-Gm-Message-State: AOJu0YyyAKEOjpbW4fBHyEsonWkap95DeeveE9ikLAtzt6GvDVIUW5gx
	t1hGeW21Vf6EAzW6yDAj3p4Hz0gkMF7njwmXbeXXRrPuEDDetrvqhmwFJjxSVugNJJ1sdmXb6ZN
	lG28LSFyBYzL7H7C7qjtUaSiHHmAuPM02IplgQH3zMek+wmK/H0p7DV9ax4xMOfZ8NHBK14CMss
	1KP8Wl/9TlOw83TJnMKQmFUgFqEjrAFNO/KeNy+A==
X-Received: by 2002:a17:906:fe47:b0:a7a:3928:3529 with SMTP id a640c23a62f3a-a90293b188cmr1868770666b.13.1726515631084;
        Mon, 16 Sep 2024 12:40:31 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFuZUPKSthj4I2w8hTxO/iTa1QbGDWHgOQucPifVaEN66W/B56Gvsea9nDnlESpuDV/2Wyi7249hfokF3p3ZxE=
X-Received: by 2002:a17:906:fe47:b0:a7a:3928:3529 with SMTP id
 a640c23a62f3a-a90293b188cmr1868769166b.13.1726515630567; Mon, 16 Sep 2024
 12:40:30 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240828184019.GA21181@eaf> <a8914563-d158-4141-b022-340081062440@quicinc.com>
 <20240828201313.GA26138@eaf> <CABx5tq+ZFpTDdjV7R5HSEFyNoR5VUYDHm89JEHvKb-9TW6Oejw@mail.gmail.com>
 <f6075361-1766-35a5-c7ac-cc3eb416a4e1@quicinc.com> <CABx5tqJomV_Su2NmyBBgipOiiby5sF7LAo_kdvhYT6oNYwVpVA@mail.gmail.com>
 <da23b318-1d65-c001-1dc2-8ba66abe9d6f@quicinc.com> <e6299c6d-dc18-eb05-2af5-8f8d885831c9@quicinc.com>
In-Reply-To: <e6299c6d-dc18-eb05-2af5-8f8d885831c9@quicinc.com>
From: Brian Masney <bmasney@redhat.com>
Date: Mon, 16 Sep 2024 15:40:18 -0400
Message-ID: <CABx5tqKWNCoE_9-MX+9unVLK8eqaJZiK6SC2RWMXDRzVayQLkQ@mail.gmail.com>
Subject: Re: qcom-rng is broken for acpi
To: Jeffrey Hugo <quic_jhugo@quicinc.com>
Cc: =?UTF-8?Q?Ernesto_A=2E_Fern=C3=A1ndez?= <ernesto.mnd.fernandez@gmail.com>, 
	Trilok Soni <quic_tsoni@quicinc.com>, linux-crypto@vger.kernel.org, 
	Herbert Xu <herbert@gondor.apana.org.au>, "David S. Miller" <davem@davemloft.net>, 
	linux-arm-msm@vger.kernel.org, Om Prakash Singh <quic_omprsing@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 16, 2024 at 1:42=E2=80=AFPM Jeffrey Hugo <quic_jhugo@quicinc.co=
m> wrote:
> Bisect pointed to the following which makes zero sense -
[snip]
> I wonder if bisect-ability got broken somehow.
>
> I'm going to try to do a bit of a manual bisect to see if I can avoid
> whatever glitch (possibly self induced) I seem to have hit.

I've seen this happen if the error is due to a race condition and only
happens part of the time. When you are testing a kernel, try booting
the system up to 3 times before you run 'git bisect good' against a
particular iteration.

Brian


