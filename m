Return-Path: <linux-arm-msm+bounces-34624-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BF2A69A0F39
	for <lists+linux-arm-msm@lfdr.de>; Wed, 16 Oct 2024 18:02:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 76B1E285E99
	for <lists+linux-arm-msm@lfdr.de>; Wed, 16 Oct 2024 16:02:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 65CBA208D7A;
	Wed, 16 Oct 2024 16:02:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="lSBC/NJY"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 947103FBA5
	for <linux-arm-msm@vger.kernel.org>; Wed, 16 Oct 2024 16:02:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729094537; cv=none; b=u40JNe/YwKBSXLR/QFg75Z5vxjpmDazUKCqtNA0bZZKtn+SMu+dUCz0CvVllhKmz/WlVWnZ3i0ZmvXV4sW8FIESvZqoT3OFVaXcC2HwsfHClq+fcHZM7E8dsFqm3KcN/H9v68rJ73NYV8m/1PtrrBuOY1tF+UZ+lZB02OYwY3Wc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729094537; c=relaxed/simple;
	bh=izfJPuESLdADVyQIKgA65BaWb+dPd/rXtKW7oYvGde0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=RLJhDqoEIXr266whIZ1D/R/Liu8Wlj9n2R5G/hdUh1rQhPjY8hIs+J/1JIRhOXHdrjjF2YVsKqzlkeoUHBjIwXBTQ4xUN6IILEbzJLh/rVqLcqPxCkDxOAKSdQoUzer6jd2lyrqQVs2eur++Tt2E8KjGucK68pvW+BNWgMlGKs0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=lSBC/NJY; arc=none smtp.client-ip=209.85.167.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-539f76a6f0dso3387017e87.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 16 Oct 2024 09:02:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1729094533; x=1729699333; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cUD59f78GtNOAlqBmjuglWzX0LStg1/+Dw/KZ/SMHA4=;
        b=lSBC/NJYhu1mXb4EIhJcUgbjb05G4kgqYouNihyL1ERmgjyOYc6woWimGAhi9pbJNt
         vJL85a2GnlVcLz2Y2hSpwMpjvIkIBkLKtL0LGaB1qzsl47gBNKNnRJfjb2TbubpuxSM+
         UOAcWXayhK+Pdwtfnpnmh/KRd5Dg2bA+x6i3Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729094533; x=1729699333;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cUD59f78GtNOAlqBmjuglWzX0LStg1/+Dw/KZ/SMHA4=;
        b=tCwEs5bCeU7KJzY2Pa6ak2HWxfFcPbYSXg8cqsbYr5K3rIhoAOnQhMxBlLv3/BotqP
         B2UhoLPWdZBN5MgyG2OvSdncnc7C5k9RK328Qc+3DyOMV0Wgje15Yx0Got/Aa8cA1v9M
         tJpIND1/s89LGatxAyhiL84eA8Wi+sc1u8aglmLxqunrWgUxz51MMN0rp2/hAAfq9DPt
         3OFfjRZRGYP3MQRju3TfIw966KM9Q20s5PyJub3sbIcBplYvqUktj6LwGGnxHFzWsdSn
         BgOPWlYDxz3hMXUBgWlvig+S4xLh8Qk+mqTwCifTA+hZ+70nBRlwCv3YO9jy6wRLFG7W
         yDiw==
X-Forwarded-Encrypted: i=1; AJvYcCUgRvQwd7h+4GUI2CDsnZd2UCq3sFQF3R6Gb6uBVhroEV/MSqWg4TIIm3wUFRL/d5yHPjTI7LLarCbx7HZ6@vger.kernel.org
X-Gm-Message-State: AOJu0YyUKJLLYNSCpIaYcSbQMTS3NY7yxfRSMPz1eRTri/h+v91jKETe
	w9gQkhs7v7TMwHAKNNYI3ft20bqmKy06AOYRBevt/QRe+rasADmfvLw9LKpXSTfdCqjoCBrNq5l
	12w6x
X-Google-Smtp-Source: AGHT+IGWngWHHYwQABMGEFKsDH/JDGoI6knrZ6sTMfoNvmeR/Hc14a4MPhqOf1u2bCGgRnWec3JBlQ==
X-Received: by 2002:a05:6512:3da0:b0:53a:aea:a9e1 with SMTP id 2adb3069b0e04-53a0aeaabf9mr758444e87.54.1729094532774;
        Wed, 16 Oct 2024 09:02:12 -0700 (PDT)
Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com. [209.85.208.182])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53a0000613bsm495887e87.193.2024.10.16.09.02.11
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 16 Oct 2024 09:02:11 -0700 (PDT)
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-2fb49510250so68241fa.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 16 Oct 2024 09:02:11 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUI4Sm/Le0Gr9mrZd0UHBMvXBNkdKcg5HlU3YxpkFFLCYRN1gtpIRcl9i2C28NyGOplps+HC7n5y0HYwcyp@vger.kernel.org
X-Received: by 2002:a2e:70a:0:b0:2f7:6653:8046 with SMTP id
 38308e7fff4ca-2fb329c2176mr77403341fa.25.1729094531214; Wed, 16 Oct 2024
 09:02:11 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240819073020.3291287-1-quic_sibis@quicinc.com> <CAD=FV=VnQCO+y_wy=KQhK3wGwHGfO0+MQntgoPh78ZygcgNiig@mail.gmail.com>
In-Reply-To: <CAD=FV=VnQCO+y_wy=KQhK3wGwHGfO0+MQntgoPh78ZygcgNiig@mail.gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Wed, 16 Oct 2024 09:01:57 -0700
X-Gmail-Original-Message-ID: <CAD=FV=UXm59wL3yX5+8-BKt+h+uBqvYKa-+y2kMo7SHdCqnVcg@mail.gmail.com>
Message-ID: <CAD=FV=UXm59wL3yX5+8-BKt+h+uBqvYKa-+y2kMo7SHdCqnVcg@mail.gmail.com>
Subject: Re: [PATCH] remoteproc: qcom_q6v5_mss: Re-order writes to the IMEM region
To: Sibi Sankar <quic_sibis@quicinc.com>
Cc: andersson@kernel.org, mathieu.poirier@linaro.org, 
	linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Mon, Aug 19, 2024 at 4:40=E2=80=AFPM Doug Anderson <dianders@chromium.or=
g> wrote:
>
> Hi,
>
> On Mon, Aug 19, 2024 at 12:30=E2=80=AFAM Sibi Sankar <quic_sibis@quicinc.=
com> wrote:
> >
> > Any write access to the IMEM region when the Q6 is setting up XPU
> > protection on it will result in a XPU violation. Fix this by ensuring
> > IMEM writes related to the MBA post-mortem logs happen before the Q6
> > is brought out of reset.
> >
> > Fixes: 318130cc9362 ("remoteproc: qcom_q6v5_mss: Add MBA log extraction=
 support")
> > Signed-off-by: Sibi Sankar <quic_sibis@quicinc.com>
> > ---
> >  drivers/remoteproc/qcom_q6v5_mss.c | 6 +++---
> >  1 file changed, 3 insertions(+), 3 deletions(-)
>
> As discussed offlist, this isn't a perfect fix since writes to this
> IMEM could happen by other drivers and those could still cause things
> to go boom if they run in parallel with this driver. That being said:
> * It seems like a more proper fix needs a coordinated effort between a
> device's built-in firmware and the modem firmware. This is difficult /
> near impossible to get done properly.
> * Even if we do a more proper fix, making this change won't hurt.
> * This change will immediately improve things by avoiding the XPU
> violation in the most common case.
>
> I've confirmed that the test case I had where things were going boom
> is fixed. Thus:
>
> Reviewed-by: Douglas Anderson <dianders@chromium.org>
> Tested-by: Douglas Anderson <dianders@chromium.org>

Just checking in to see if there's anything else needed for this patch
to land. Thanks! :-)

-Doug

