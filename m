Return-Path: <linux-arm-msm+bounces-31602-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id D50FC976922
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Sep 2024 14:28:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 13F1A1C22530
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Sep 2024 12:28:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 52A341A707B;
	Thu, 12 Sep 2024 12:28:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="P7tBVwDd"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com [209.85.208.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C0021A4F1F
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Sep 2024 12:28:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726144095; cv=none; b=pRIaeZ6ngy2Mfbox54cDJKUhOtAd+z+LiQu9C+2+ShJaOouHFB82jFiN6GvPKErtOJbnBUZT8IJKWFD2vzUIcF834UMMAY4BEFM3iYtQrOX89GF2PQNMY1be4pewq7dt/X7w+hnGE7gjQVLDD60nJ340Dr56I3qdwKouuvzqf/c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726144095; c=relaxed/simple;
	bh=06PZCU9pJY60QkJ+jzcYvctxX7G4YpqLc4n+xsTPC7g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LgolaMpB/q801Ktz8MRBRraRddEBf8QCsJOY5m4uJlqqEdXKcfTA5UxrmzCqh5y73LPjOambvz4YuotFIj0KVqlQZG3Km+Mma2fOx0+lO6PYki8oUzcNdAOnKqMzPzsDd4T3HH7pguN2qq0Bvs8s3Fh2sMrtZxgpE5ouGRgKd6w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=P7tBVwDd; arc=none smtp.client-ip=209.85.208.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-2f75c205e4aso10900181fa.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 12 Sep 2024 05:28:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1726144091; x=1726748891; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Nl/pzHbhLOzz441VrKGLN3ifLEKBri2nTyCnIIMSwgg=;
        b=P7tBVwDdC7in9cJbInMO+IS0dot3pC/xre5UNlKKOkSq+KTXzJCI/6GnjOcush4Cq4
         +5uRZ7KuGaIA0jR8p9paR9jqUDqzr1gi+HSDFMcNldDxr8NkXreRvqoosDLhn4Ek1Aza
         M0Mv9KJPpps85KwlH3Xieg4JTKPUWK/FZHqCYowmlasl+iA1HnCFQSwIkbw054CM9reM
         klIZuKGRMW9dx6TnEOSfk/XMOt+p4IxWew/JBxpyonkE4etBp4G8sCPL8gQbTSeBfCbW
         VwA5GqT3xF/XPE8hgV/GbGeY5AvLNJ/wu77bScbGpzOVemskcLPkt9K3TkC1MTA0DZBN
         oygQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726144091; x=1726748891;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Nl/pzHbhLOzz441VrKGLN3ifLEKBri2nTyCnIIMSwgg=;
        b=aOGjrqPDdEhNWMKi7IR923a7b9CJTsON5B0plyGVIT0mDuUp2K+1erzA11Vt4NYS1T
         8mKoMko+D8WArkZUTW9g0HYXlqGPjWUaIMbH4+CH4x/+GSYCNlNq+2wP3ntdkJPlscF7
         UPhwBs4g0kpx0UBQBVf/T5RtYwZKLxHhFl7BokQxpLMgPFvd0Lp4nkPYSgNdWTpcHIYX
         vQVqUroxNLq8AAJogUeRbvyaj3At1jeibSPEAvP9SpNQDlUHup87Fw1iPLH3ucrKxmGM
         b8BCiGjkMaEZbxeK2vxT0OrRo0Lt5oOBIBzxsrdNWQBGtmCLSCCe/3r4Dq1/8MieO8KM
         UZGg==
X-Forwarded-Encrypted: i=1; AJvYcCU/E9SpLLv/b1ViPe0oR0lfoTCGG/aswYzM2U0oLvExlODQfirhgdWZW310yh+fOFM5po68dL0xEzom7wvs@vger.kernel.org
X-Gm-Message-State: AOJu0Yw8vnp6iXCxl9JJ49KJaTp3pj+Wy6mfWCdWncd0QDpS1SXxDyHn
	z6szIfFhN4wj3soxPIzXxfTp6Vr6qHFjmDrXM66EeZ1rbMrCoV3dEEzc1jVnPNvt5RoXa095En/
	o
X-Google-Smtp-Source: AGHT+IFeeErHHjfyvJWyQ+cnrtXNl0pyMGb74TL8Cog6G87KqqxNaP9uq5woHyEWVmAwe2h9OjT+/A==
X-Received: by 2002:a2e:be22:0:b0:2f6:63d1:166e with SMTP id 38308e7fff4ca-2f787da0b93mr16054701fa.3.1726144090794;
        Thu, 12 Sep 2024 05:28:10 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2f75c07c830sm18225791fa.100.2024.09.12.05.28.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Sep 2024 05:28:10 -0700 (PDT)
Date: Thu, 12 Sep 2024 15:28:08 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Marc Gonzalez <mgonzalez@freebox.fr>
Cc: Jani Nikula <jani.nikula@intel.com>, Arnaud Vrac <avrac@freebox.fr>, 
	dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org, 
	Nathan Chancellor <nathan@kernel.org>, Rob Clark <robdclark@gmail.com>, 
	Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
	Marijn Suijten <marijn.suijten@somainline.org>, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH 7/8] drm/msmi: annotate pll_cmp_to_fdata() with
 __maybe_unused
Message-ID: <uosenmxvixug7yfakpbynbltryvvxqc2hxtagby362c2lvps22@kce4vsbi7xql>
References: <cover.1725962479.git.jani.nikula@intel.com>
 <3553b1db35665e6ff08592e35eb438a574d1ad65.1725962479.git.jani.nikula@intel.com>
 <4ag2efwiizn5bnskauekqwfhgl4gioafcvetpvsmbdgg37bdja@3g6tt4rlfwcb>
 <19ac4e25-7609-4d92-8687-585c6ea00c79@freebox.fr>
 <878qvyjxpg.fsf@intel.com>
 <9028f858-8c6d-4292-a6aa-27eedff3ac8b@freebox.fr>
 <87ed5pgm2i.fsf@intel.com>
 <c2ed3380-82c3-43a3-9c01-534b08333f95@freebox.fr>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c2ed3380-82c3-43a3-9c01-534b08333f95@freebox.fr>

On Thu, Sep 12, 2024 at 02:14:10PM GMT, Marc Gonzalez wrote:
> On 12/09/2024 13:15, Jani Nikula wrote:
> > On Thu, 12 Sep 2024, Marc Gonzalez wrote:
> >> On 11/09/2024 12:23, Jani Nikula wrote:
> >>> On Tue, 10 Sep 2024, Marc Gonzalez wrote:
> >>>> On 10/09/2024 16:51, Dmitry Baryshkov wrote:
> >>>>> On Tue, Sep 10, 2024 at 01:03:43PM GMT, Jani Nikula wrote:
> >>>>>> See also commit 6863f5643dd7 ("kbuild: allow Clang to find unused static
> >>>>>> inline functions for W=1 build").
> > 
> > [snip]
> > 
> >>> GCC doesn't catch unused static inlines, while Clang does.
> >>
> >> It makes no sense to me that adding "inline" would prevent
> >> GCC from diagnosing the issue... GCC should simply ignore
> >> the "inline" keyword when definition is not in a header file
> >> (maybe they don't store "origin").
> > 
> > Please just read the commit message for the commit I reference above for
> > details. There's not much more I could say about it.
> 
> OK, I read 6863f5643dd7.
> 
> My remark still stands.
> 
> GCC's decision to not warn for unused static inline functions
> in source files (not headers) is questionable at best.

What's the difference between source file and a header after the CPP
run?

> (For the record, I think clang is the devil's spawn.)
> 
> Regards
> 

-- 
With best wishes
Dmitry

