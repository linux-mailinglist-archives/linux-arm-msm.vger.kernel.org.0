Return-Path: <linux-arm-msm+bounces-26614-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A82D0937652
	for <lists+linux-arm-msm@lfdr.de>; Fri, 19 Jul 2024 12:03:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 9A5F4B25CEA
	for <lists+linux-arm-msm@lfdr.de>; Fri, 19 Jul 2024 10:03:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 26F862576F;
	Fri, 19 Jul 2024 10:03:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="JJHO3qn8"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0763F29A1
	for <linux-arm-msm@vger.kernel.org>; Fri, 19 Jul 2024 10:02:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721383381; cv=none; b=WMpeMeEdfJAjSMqrfPsXAP89Qdb2SDhYlRgp0r1ps6rxM9LHvbI63LTJ7aEoSYk31pHVw9D8RuQZNguybVX/b3D7bmXA5oV52LmWSaTMJ2wCCP4SoLbvmC/Y42EfRtOoYN7syYPA25zOl5d8uejutk3O2XHS8dMjhGW1v4Wn7t0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721383381; c=relaxed/simple;
	bh=DDbWejH0826CEYuFuU/J2G3IdF8lbct4NjUV349mjCM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VT1mRnwfbIjy1T9Rw+9Y2RL29BrfHO/osNQrw832Vjqoc6lt/pOM93w692morwCWNQlsA3xwC8Iq+x7k7xIZFIUFkDaqvsSnJD0DDC9RJzJXpBGa9BGYN7IjBbfaWM7M3CSpKqy/ony6qmlLwW3rbpkWtKvsOtYtnhinZpArEwk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=JJHO3qn8; arc=none smtp.client-ip=209.85.167.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-52e9b9fb3dcso1538536e87.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 19 Jul 2024 03:02:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1721383377; x=1721988177; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=kHNnLfch6WFVSzQPrKZyiqluVxXPZBjNyBbIvUOnhGE=;
        b=JJHO3qn8Kbemhy3YJ4XtPNjE6JwfUtugDhEsG+yWGfDpMmogYA7lqCeuTgxzWNu2n6
         yvIaePkEg8uconBKPYCzCEIEys/TcWpwy8qKMqYiQPuirhSOz8vFBFJPJBgB2cLigGOL
         S+/eby9LgllfT63ViwY6KJ/jT9aa1Fr4Twsga9FqgsXDKDe8+Wzo59yE/BQE5p6INPGg
         BlSbfRYEt6yRrcCQk7040qUxYBz7OxOMEjfN3NtKLQDQgLv4CDtaN6WT881fWbr9iANZ
         NAYckXA9zmrvAeQ3wVlCywuPQSDB2kHvK6DWzNo9zanqWCEKFtpdwdEkGT6Lch14MkJi
         qeVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721383377; x=1721988177;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kHNnLfch6WFVSzQPrKZyiqluVxXPZBjNyBbIvUOnhGE=;
        b=GEs3zmJ9Mc1ho6U3iTO3uqE2fuel1ZtgVUshgF7PP+J5oYdouRm5QBYj9I5+ZqFm2a
         P5ntXW813rsiSByxJaGrWIVKLKi6hIUyPcGwZq2AUt0xNabNN6sxnc6jyMzO4v2Ak3p4
         X/ArtWtJQoPra+Ni/2iHXaAjh0FTXuTJ0/h/Vavv1kW6Enf+/3/UcoKKii5mrJsH6jmy
         x/3aOlfTIPbg2rnck3eqiR7ILp1DOGt/aAasMz/AV8oifMJFatL1Vwe+sJ41Rn7hLbkC
         ur8nDg1p+KtZ43Z/XXl4AT4kyaeyg3gxRdFD93SzOSKU5/o4Bdex6PzqIiB32H7wavKF
         ElhA==
X-Forwarded-Encrypted: i=1; AJvYcCU7gsSetF2sl33eBQmv+FhdiLMKr/6ffkMfugbMSojz9Q/N0VM967WScSwFMgNuIMk6vBHGImZ/lElY+Ku5nIeHU6GrcoGR25iaSk1SpQ==
X-Gm-Message-State: AOJu0YzfoE5raetIpodKlxkZmHBVHqZXi07QZXh9NTe4NYfXZOmLBveK
	RT76y19a2/wUfdW+Ct6w4TlKteYRUWSzVkho6xwD3EXIA/2C9lOV8rqaW9oivPw=
X-Google-Smtp-Source: AGHT+IED6y1tnJ5XrT0b+mNFEwXHll5lZGlxvfoO3lJ7rMH1zs8DNLtBXo4wW882uhFeYY0NdJ8Ekg==
X-Received: by 2002:a05:6512:2387:b0:52d:259d:bd91 with SMTP id 2adb3069b0e04-52ee53b04c7mr6067497e87.18.1721383376987;
        Fri, 19 Jul 2024 03:02:56 -0700 (PDT)
Received: from eriador.lumag.spb.ru (dzdbxzyyyyyyyyyyybrhy-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-52ef5577b46sm146169e87.259.2024.07.19.03.02.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Jul 2024 03:02:56 -0700 (PDT)
Date: Fri, 19 Jul 2024 13:02:54 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Vikash Garodia <quic_vgarodia@quicinc.com>
Cc: Dikshita Agarwal <quic_dikshita@quicinc.com>, 
	linux-arm-msm@vger.kernel.org, linux-firmware@kernel.org
Subject: Re: [PATCH] qcom: update path for video firmware for vpu-3.0
Message-ID: <v53erplurzmez6rh7pnf2qyc33jxrg4soxuo2xspsjx3zimrcn@tybzz37og454>
References: <1721300902-24242-1-git-send-email-quic_dikshita@quicinc.com>
 <CAA8EJpo4OijebJ9n3TONnB+huT3+VkZEE9LCHETV8iWAYZXsdQ@mail.gmail.com>
 <b99c3806-b3f0-d73c-2338-2e98de52132c@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b99c3806-b3f0-d73c-2338-2e98de52132c@quicinc.com>

On Fri, Jul 19, 2024 at 12:16:10PM GMT, Vikash Garodia wrote:
> 
> 
> On 7/18/2024 5:07 PM, Dmitry Baryshkov wrote:
> > On Thu, 18 Jul 2024 at 14:10, Dikshita Agarwal
> > <quic_dikshita@quicinc.com> wrote:
> >>
> >> - Rename qcom/vpu-3.0/ to qcom/vpu/ to have common sub-folder for
> >>   new firmware files.
> >> - Create symlinks for firmware files for vpu-1.0 and vpu-2.0 in
> >>   the same sub-folder.
> >>
> >> Signed-off-by: Dikshita Agarwal <quic_dikshita@quicinc.com>
> >> ---
> >>  WHENCE                    |   2 +-
> >>  qcom/vpu-3.0/vpu30_4v.mbn | Bin 2306664 -> 0 bytes
> >>  qcom/vpu/vpu10_4v.mbn     |   1 +
> >>  qcom/vpu/vpu20_4v.mbn     |   1 +
> >>  qcom/vpu/vpu30_4v.mbn     | Bin 0 -> 2306664 bytes
> > 
> > Ok. You know that a single instance of the file had troubles getting
> > through. Now you are sending it twice when it's not required at all.
> > 
> > Please fix your setup so that git diff / git format-patch shows
> > renames are renames, not as an remove-and-add pair. Git does that
> > _by_default_, so it's something in your setup that changed this.
> > Please revert to the default behaviour.
> > 
> > This is how it looks by default:
> > 
> > diff --git a/qcom/vpu-3.0/vpu30_4v.mbn b/qcom/vpu/vpu30_4v.mbn
> > similarity index 100%
> > rename from qcom/vpu-3.0/vpu30_4v.mbn
> > rename to qcom/vpu/vpu30_4v.mbn
> > 
> > Also please consider using GitLab MRs or pull requests instead of
> > sending huge emails with multi-megabyte binary patches. It's all
> > described in README.md. And I think it should have been added to
> > Qualcomm internal documentation on upstraming.
> I agree MR/PR is the right way to do it for larger binaries, in that case,
> should the README.md be updated to keep the approach limited to MR/PR ? I see
> the approach to send the bins as email is also mentioned as one of the approach.

It's included because it still is a possible approach. For example
Adreno GPU is several KB and doesn't require any special handling. On
the other hand, 2MB binaries are definitely an above the sane boundary.
I'd say, one uses their own discretion to decide of the best way to send
data. In the end, you are not sending 2MB source patches too. Well, I
hope you are not.

> 
> Regards,
> Vikash
> > 
> >>  5 files changed, 3 insertions(+), 1 deletion(-)
> >>  delete mode 100644 qcom/vpu-3.0/vpu30_4v.mbn
> >>  create mode 120000 qcom/vpu/vpu10_4v.mbn
> >>  create mode 120000 qcom/vpu/vpu20_4v.mbn
> > 
> > Please move files to the new location and provide backwards-compatible
> > links rather than doing that backwards and providing
> > forward-compatible links instead.
> > Also please use Link: tag in WHENCE instead of creating symlinks manually.
> > 
> >>  create mode 100644 qcom/vpu/vpu30_4v.mbn
> >>
> >> diff --git a/WHENCE b/WHENCE
> >> index 5e91462..876f562 100644
> >> --- a/WHENCE
> >> +++ b/WHENCE
> >> @@ -5942,7 +5942,7 @@ https://developer.qualcomm.com/hardware/dragonboard-410c/tools
> >>
> >>  Driver: iris - Qualcomm Iris video codec accelerator
> >>
> >> -File: qcom/vpu-3.0/vpu30_4v.mbn
> >> +File: qcom/vpu/vpu30_4v.mbn
> >>
> >>  Version: VIDEO.VPU.3.1-0076
> >>
> > 
> > [skipped two instances of vpu30_4v.mbn]
> > 
> >> diff --git a/qcom/vpu/vpu20_4v.mbn b/qcom/vpu/vpu20_4v.mbn
> >> new file mode 120000
> >> index 0000000..56cdfe6
> >> --- /dev/null
> >> +++ b/qcom/vpu/vpu20_4v.mbn
> >> @@ -0,0 +1 @@
> >> +../vpu-2.0/venus.mbn
> >> \ No newline at end of file
> > 
> > 
> > 
> > --
> > With best wishes
> > Dmitry

-- 
With best wishes
Dmitry

