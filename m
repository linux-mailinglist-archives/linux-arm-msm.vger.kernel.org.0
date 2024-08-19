Return-Path: <linux-arm-msm+bounces-29029-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DC439578BC
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 Aug 2024 01:40:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DC1051F239DF
	for <lists+linux-arm-msm@lfdr.de>; Mon, 19 Aug 2024 23:40:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8F81D1E2119;
	Mon, 19 Aug 2024 23:40:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="ThB3gtsx"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-oo1-f41.google.com (mail-oo1-f41.google.com [209.85.161.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 144671DF678
	for <linux-arm-msm@vger.kernel.org>; Mon, 19 Aug 2024 23:40:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724110827; cv=none; b=Jre3E/dfovOo8rD8ASjnKxN1GWs69Xb2Qqn1AVxq9enZ+cE+DTlUkdZZSDW6M7//AgBLG+n7OctjthmUXkVmhMdwqoPkIHdPelyIm4pqI6DJ5eAjbY3Yog0L+1/yLlfriroAom/obRSRXP6oJvUsBDeNcZBnJtMRmpfWW8b5cig=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724110827; c=relaxed/simple;
	bh=YPvzOFnH4gwgca48Ur3A8Ax1NuMLReALK95xcXHVHYg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gVeWIIyHnd7mufgG4+Pxeu2ScUXNTcGLhpT1N3oMuEnRCQKVTkDFBcaon45EwqYl3a2w8IOu74Kh1tDFybi7GyVpmRrroauAnzjMJVzd1bo+AMbdOtybJnPjmjlIUnbmaMZJfFvX+jnYdvo4zRTwJe9iUClSXGLN/lDZKNpMNCc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=ThB3gtsx; arc=none smtp.client-ip=209.85.161.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-oo1-f41.google.com with SMTP id 006d021491bc7-5d5eec95a74so3107460eaf.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 19 Aug 2024 16:40:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1724110823; x=1724715623; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XKnu/Iez1+mbjTx9dSE6EvXmZdzm/o7bv0RI9fycVok=;
        b=ThB3gtsxYPH9cvOUxdIm2gXbkLF6iq5SzmKGFFt6Xl9isS8SvtHQgsCLnDkWAxvL6h
         iLaZLobYyG1+Bml2iZF6Loqlp4pX5RhvcakbP9jaSKSQ0qguN3ghzGjY/Zm/5sFTTTOH
         FPctM7vX1lOVRnJ7TUU2inBpHIqGTSSIFjV3o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724110823; x=1724715623;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XKnu/Iez1+mbjTx9dSE6EvXmZdzm/o7bv0RI9fycVok=;
        b=d1LLfSuN4RHrK9tKVrqF/hPC8gMD+8CBgJZQkDeqCaUQxkdTQ5AHLBaeiIWPSrwBJd
         fYblvkFGlsZXocI+CUscEBSwMdEQSxy7bWUQu/cgi7Fs3QpDxNyZyK9xkgzBRfly2IQj
         u5LcnMS/ugZbx6FjqbdDRWxHnMoFVQCaEoWdQmjTBHCVcVjorO6cwag2XN7FDcj9SlX4
         l0aAU9LawRo2onpTW08T6SxoSxhc57Oyey4DMsXclbvDc2zjibyqyXg9ssYHtnNe8lJ1
         /hBZiYBC5/MBkwWEMMukJZ6W5BKjxdRjxjSDp1/Ueh7vUG507Oqlyz5yhNh9RhnxnkoI
         Zgig==
X-Forwarded-Encrypted: i=1; AJvYcCVpwe/Pb0wYWl13j/MC1TQWCr8ZA02sg5hu8901M0rk+vdEgaZe9u8ArdJBOH23qh6BcLdRyX+yfNFGFMNE02repYFRk3fRthkt9Wfx8w==
X-Gm-Message-State: AOJu0YxNywFmPudA5Osi/066wc/Lf2SWd0sgEcnSlzuc3drEVLHNLEuW
	UE1ZPNueCFtB50JiqiKSL1pAtmEUONsiqebKuTS37RQEs3K73R+7Dm4zzg4plSTtktRob3U69Tk
	q0rib
X-Google-Smtp-Source: AGHT+IHKqdleFRLNMrNaspqsgC2X0p9iTt4Os3yUbrHRLBUmJ7hnGvszosmQ1zOQeQI24TeTcsynEg==
X-Received: by 2002:a05:6820:811:b0:5da:b50a:2a6 with SMTP id 006d021491bc7-5dab50a08f0mr7184053eaf.4.1724110823547;
        Mon, 19 Aug 2024 16:40:23 -0700 (PDT)
Received: from mail-oo1-f41.google.com (mail-oo1-f41.google.com. [209.85.161.41])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-5dc93aa0fa3sm93444eaf.14.2024.08.19.16.40.22
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Aug 2024 16:40:22 -0700 (PDT)
Received: by mail-oo1-f41.google.com with SMTP id 006d021491bc7-5d5e97b8a22so2935616eaf.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 19 Aug 2024 16:40:22 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWHP96y0c6wff9eOT3vy1KzI4tDOOElAvZczLo6ss0zkNBuCJJkc7kW/6yROD9kuC9cWMn+HPcaMsqhi2ma/EZPWIMtElAp0sP4eTP6cw==
X-Received: by 2002:a05:6358:2923:b0:19f:4967:4e8f with SMTP id
 e5c5f4694b2df-1b39329f298mr1693684755d.22.1724110821953; Mon, 19 Aug 2024
 16:40:21 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240819073020.3291287-1-quic_sibis@quicinc.com>
In-Reply-To: <20240819073020.3291287-1-quic_sibis@quicinc.com>
From: Doug Anderson <dianders@chromium.org>
Date: Mon, 19 Aug 2024 16:40:07 -0700
X-Gmail-Original-Message-ID: <CAD=FV=VnQCO+y_wy=KQhK3wGwHGfO0+MQntgoPh78ZygcgNiig@mail.gmail.com>
Message-ID: <CAD=FV=VnQCO+y_wy=KQhK3wGwHGfO0+MQntgoPh78ZygcgNiig@mail.gmail.com>
Subject: Re: [PATCH] remoteproc: qcom_q6v5_mss: Re-order writes to the IMEM region
To: Sibi Sankar <quic_sibis@quicinc.com>
Cc: andersson@kernel.org, mathieu.poirier@linaro.org, 
	linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Mon, Aug 19, 2024 at 12:30=E2=80=AFAM Sibi Sankar <quic_sibis@quicinc.co=
m> wrote:
>
> Any write access to the IMEM region when the Q6 is setting up XPU
> protection on it will result in a XPU violation. Fix this by ensuring
> IMEM writes related to the MBA post-mortem logs happen before the Q6
> is brought out of reset.
>
> Fixes: 318130cc9362 ("remoteproc: qcom_q6v5_mss: Add MBA log extraction s=
upport")
> Signed-off-by: Sibi Sankar <quic_sibis@quicinc.com>
> ---
>  drivers/remoteproc/qcom_q6v5_mss.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)

As discussed offlist, this isn't a perfect fix since writes to this
IMEM could happen by other drivers and those could still cause things
to go boom if they run in parallel with this driver. That being said:
* It seems like a more proper fix needs a coordinated effort between a
device's built-in firmware and the modem firmware. This is difficult /
near impossible to get done properly.
* Even if we do a more proper fix, making this change won't hurt.
* This change will immediately improve things by avoiding the XPU
violation in the most common case.

I've confirmed that the test case I had where things were going boom
is fixed. Thus:

Reviewed-by: Douglas Anderson <dianders@chromium.org>
Tested-by: Douglas Anderson <dianders@chromium.org>

