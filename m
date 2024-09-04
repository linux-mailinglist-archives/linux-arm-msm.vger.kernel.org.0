Return-Path: <linux-arm-msm+bounces-30808-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D096996C9CF
	for <lists+linux-arm-msm@lfdr.de>; Wed,  4 Sep 2024 23:52:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7A3A21F27CE4
	for <lists+linux-arm-msm@lfdr.de>; Wed,  4 Sep 2024 21:52:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0A47A17A58C;
	Wed,  4 Sep 2024 21:51:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="DbyohPtG"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-qk1-f177.google.com (mail-qk1-f177.google.com [209.85.222.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BBD5172760
	for <linux-arm-msm@vger.kernel.org>; Wed,  4 Sep 2024 21:51:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725486701; cv=none; b=kFb/JZVdqhV3O6EyHpb3fKe1VRcUjzuiLYeBV279HMQgoDEznAryjB+4lGAA0ATs4gDbvmXHFMX2eBCMREpv3WXfQlVREaS50T2xzeuTfCGb1X70rnck2Q9ckL8NQNBOf14s1L0pQpYtro9VnySkbcFNELkYydHD2lJlqQ/Y8Gs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725486701; c=relaxed/simple;
	bh=5z6CC3oEk1DrfjT6IKhNHe/dwtdCYWt9qCgTKqR1DtM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bL7tn9lD3mRTXUzyAMsBmrJ1aEsKEVXtHjgk5PrTefhYA2wfIvLT2x8p0OP2+JbziFxCrXZBtIjxVXfxZcEibu6TIT6ik8JFr7qjeZhkuCzgfu+252OT8vE/IX8OgmdTAV7oF7oapbyIjYc9mQiJoNo2OMgxBTvb2pteTgU8fY8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=DbyohPtG; arc=none smtp.client-ip=209.85.222.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-qk1-f177.google.com with SMTP id af79cd13be357-7a977bf02a9so5743785a.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 04 Sep 2024 14:51:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1725486698; x=1726091498; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5z6CC3oEk1DrfjT6IKhNHe/dwtdCYWt9qCgTKqR1DtM=;
        b=DbyohPtGfB3vtB5oTI2/rK4SHcKdaPnFUMyb/rGr2CgCFE3gWT3px9OWjqU8T/pbp6
         6Qb/p2nsA6qESSTuh5t700TcVdXqMTQRL6P/Q4Y4GIWPLxJHpczzlbi0WDOmfyk4pXL2
         EwwtwLR3lutGqqh+C5zJcSAdGxwj/m0RAJNA0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725486698; x=1726091498;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5z6CC3oEk1DrfjT6IKhNHe/dwtdCYWt9qCgTKqR1DtM=;
        b=oIwSYXErLtWSoo4j20zSbl1HimGrPScOIt1Ykvwb4lUORiKHjarxwPozJF1kuOmaf9
         M4gwqf21zKiZcspg52qe/QMVQH57nhzSOVmrekNyIPsVRdXA7SM2FoZgUu7fUIWay3fM
         hBeF1y7XBm9tLQwdHWRhkE+aP47A1pNuSnSV/2bDEBwPSfVWHyy0SWhIWo1OLju/uKNa
         FAZ5VJf+lxFfiATbPsmMHI0wlWiP32Dftb7WjTw24TSdlGzZB0/1b56Vy7mrD6k733iB
         VG+N/V+W+657VNLs4DZKEUYNo52Plt79MKw38eewuiVf3eKzSIfs2T+9hAfL72gH79W2
         cpsQ==
X-Forwarded-Encrypted: i=1; AJvYcCUF6vO9SP7xPsbBMitW2vpSWL5yWOw0NgPyR1CZ4x+Yclm6H1lAnfK3wYHYapv1xIbz3IjXjZg8nOLRXIYI@vger.kernel.org
X-Gm-Message-State: AOJu0YwCz6H/AhPKXmJ7MViBGscfxvUFV6zqp3h0xaCy92vrhNI93J0X
	tGItK2zuNbUHugdNUUbMbhBn2VovK4hgxcfCZNxCnEZd63q1hPw57VjqSallhnxvI0LB/Gfx0R8
	=
X-Google-Smtp-Source: AGHT+IEVOdw1heHxWY6Ms5Z3DXgE1SjWjmxuSm9OTPDBTukGBlGjqPJ3zZW9nwT8uHR91R+qeJJzcg==
X-Received: by 2002:a05:620a:4693:b0:79b:ea85:9f9f with SMTP id af79cd13be357-7a81d642be0mr2138918385a.2.1725486698465;
        Wed, 04 Sep 2024 14:51:38 -0700 (PDT)
Received: from mail-qv1-f44.google.com (mail-qv1-f44.google.com. [209.85.219.44])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7a98f00f935sm22137885a.116.2024.09.04.14.51.37
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Sep 2024 14:51:37 -0700 (PDT)
Received: by mail-qv1-f44.google.com with SMTP id 6a1803df08f44-6c35618056aso433246d6.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 04 Sep 2024 14:51:37 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCX2037wSTc+80/n3LcU2KYJ7+y9WW4kpSGtOBWThBvsLyHiFdN/1IcwPCrIcxsZpgq6CKrt3DVmAH1LhW9q@vger.kernel.org
X-Received: by 2002:a05:6214:5f0c:b0:6c3:6ab0:9dab with SMTP id
 6a1803df08f44-6c36ab09febmr118827336d6.48.1725486697181; Wed, 04 Sep 2024
 14:51:37 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240902152451.862-1-johan+linaro@kernel.org> <20240902152451.862-8-johan+linaro@kernel.org>
In-Reply-To: <20240902152451.862-8-johan+linaro@kernel.org>
From: Doug Anderson <dianders@chromium.org>
Date: Wed, 4 Sep 2024 14:51:22 -0700
X-Gmail-Original-Message-ID: <CAD=FV=UX_knVfrei4UPiR3DT=H81ybSjGeDGAsWc3n6q=PiFJg@mail.gmail.com>
Message-ID: <CAD=FV=UX_knVfrei4UPiR3DT=H81ybSjGeDGAsWc3n6q=PiFJg@mail.gmail.com>
Subject: Re: [PATCH 7/8] serial: qcom-geni: disable interrupts during console writes
To: Johan Hovold <johan+linaro@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jiri Slaby <jirislaby@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	=?UTF-8?B?TsOtY29sYXMgRiAuIFIgLiBBIC4gUHJhZG8=?= <nfraprado@collabora.com>, 
	linux-arm-msm@vger.kernel.org, linux-serial@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Mon, Sep 2, 2024 at 8:26=E2=80=AFAM Johan Hovold <johan+linaro@kernel.or=
g> wrote:
>
> Disable the GENI interrupts during console writes to reduce the risk of
> having interrupt handlers spinning on the port lock on other cores for
> extended periods of time.
>
> This can, for example, reduce the total amount of time spent in the
> interrupt handler during boot of the x1e80100 CRD by up to a factor nine
> (e.g. from 274 ms to 30 ms) while the worst case processing time drops
> from 19 ms to 8 ms.
>
> Fixes: c4f528795d1a ("tty: serial: msm_geni_serial: Add serial driver sup=
port for GENI based QUP")
> Signed-off-by: Johan Hovold <johan+linaro@kernel.org>

Reviewed-by: Douglas Anderson <dianders@chromium.org>

