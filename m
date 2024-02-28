Return-Path: <linux-arm-msm+bounces-12859-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id C451286ACAF
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 Feb 2024 12:09:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 01AD21C20D7A
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 Feb 2024 11:09:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1BEE212D77B;
	Wed, 28 Feb 2024 11:08:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="g7+vzzhG"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yb1-f175.google.com (mail-yb1-f175.google.com [209.85.219.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67FDF36B09
	for <linux-arm-msm@vger.kernel.org>; Wed, 28 Feb 2024 11:08:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709118499; cv=none; b=WPBsImUpqzRBxkYmVBi3TU6cVrJNG4IwiLxP++cz70xQLqfOXV6XHxWwhoU3Ra4zuH2JTv0eonC6/UEdhuATxZtuAdItaKMZ5V1dlriSe2PvFzAGTeNWe+LIvKiY55QLwIF/9SuZR+gqpGdAMGL7yLfJW21j12pr+wHM7BtEJKI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709118499; c=relaxed/simple;
	bh=ynD4ep8b15eQ6ZvXLbHCGrVZFrycm6mlEPDvlkyespw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Bnm99rB7iKHrnBZKKKiH4JiBYtfKQ0ug7XiY0/8gaAhfsg9VMNXOdQQmeZ8jEOCbGiZCdcxqp/IncxrpsY7DD17eRO+8piJGBhI/Vw1o6yJyH06JvSZnQ0Xj7r/JcbzQl7vurptIsD7kHIELvvhKkxRYxzVAB9JppVMuLq3q7Ow=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=g7+vzzhG; arc=none smtp.client-ip=209.85.219.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yb1-f175.google.com with SMTP id 3f1490d57ef6-dcbf82cdf05so5452506276.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 28 Feb 2024 03:08:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1709118496; x=1709723296; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=pJmCHtzXEM7iHGUAof2e0JKiHgjZvY6I5vD12R0EcB0=;
        b=g7+vzzhGajPLekY4XVKok9VB+wSPyVLn96ZVW5g2D8Gu6WkwI77XXhbsPeQxo0+04Y
         1XyIePM9bxqLb/3+YkGTce8UcVjmXmfdSMuXOF/RyJSUPp9ve446+NRYwFirF1HcOCNz
         lGhU8uSk+Mv9ZInAkPARfwKXvKTaH5AZuSNGl8E/U7Wkfnjo/wJxSQt/TCImJ5404Rgw
         d+FFbgWTYg5/EltMk16FYD+9/yQ1NTUHG+hL69SGF9BMpwvUzZ+NYvw1yLviIZEjAVSo
         gLkfnKyw942dmaTd/Ct2ww7OTVOw0v+ubaF5zO37xHNmyLceaXDFkH10eKv0YL6x93qp
         jbiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709118496; x=1709723296;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pJmCHtzXEM7iHGUAof2e0JKiHgjZvY6I5vD12R0EcB0=;
        b=FNSXv5bvm8KElYFG0VUUqZccbHOB39i6r2/Mgrb7w0jUMV3FQu9sovhX41ZPlsY9Y+
         iCm1V0yoYI0slkv1SAXRe3boJaJquMLsLz5eSr+PlHaVbiHnrjzeCdOHgdvkD9pwElu4
         vXumLQcBt52ITsU107Mk6jxrsANMWTaLCI/XZsvg53+kit7FtKHbd6fQevX3BC1bkXaO
         qOclKEzNJuZAhk0I6wZ212td783erzRp50pyrxIzWtsHhL2364RmqhdbE915ZUTXqapP
         LizaozNKds148Yw5NIuPykEAo626FjoAnaMMIXjIKdtF4KiBNbG/5DmEDR2i+esHVTZV
         AgPw==
X-Forwarded-Encrypted: i=1; AJvYcCVpHB56+taqg0SZeVjhxthUCe+Thgbd0sL5Y8svUkTrimboBilAMUV+259Xc+93z7BepyA8HNYmaDe37Uub//sQW2JV28Xq9QeDi7hSlQ==
X-Gm-Message-State: AOJu0YxBz1jVVxnM3cx3Ngh74qDIBDzNFHX05AHdlZIeUbq+0R6VCfFF
	m5l+iJLsboOxv94T8i0/Fp+bPbPqrlHQmYg42P4fMw0a429UXalpzFnNAiAd8k+uO8gRtJvG8cy
	QVZwsjTbT/uprPyAL1vC/6eozD0/sbBbZAqYQkQ==
X-Google-Smtp-Source: AGHT+IE7FGesh2EjL5jyHeDznjzn/ZbnUFCAT6CsdLQR0L++/z1KEBV5qW9/rZM2L2bRBaXEmeKKtOqYWbh1cGbCgjg=
X-Received: by 2002:a05:6902:2192:b0:dcc:5aa1:7ac3 with SMTP id
 dl18-20020a056902219200b00dcc5aa17ac3mr2290311ybb.2.1709118496390; Wed, 28
 Feb 2024 03:08:16 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240227220808.50146-1-dmitry.baryshkov@linaro.org>
 <46fa8e0a-0af2-2a44-f5f9-70fd49649aa4@quicinc.com> <Zd8B6T6ROHFCqEyB@hovoldconsulting.com>
In-Reply-To: <Zd8B6T6ROHFCqEyB@hovoldconsulting.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Wed, 28 Feb 2024 13:08:04 +0200
Message-ID: <CAA8EJppvansib9NxqPcuuAVe+qc1i8HmDqNh6+kaDZn6zFijpw@mail.gmail.com>
Subject: Re: [PATCH] Revert "drm/msm/dp: use drm_bridge_hpd_notify() to report
 HPD status changes"
To: Johan Hovold <johan@kernel.org>
Cc: Abhinav Kumar <quic_abhinavk@quicinc.com>, Rob Clark <robdclark@gmail.com>, 
	Sean Paul <sean@poorly.run>, Kuogee Hsieh <quic_khsieh@quicinc.com>, 
	Sankeerth Billakanti <quic_sbillaka@quicinc.com>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konrad.dybcio@linaro.org>, Stephen Boyd <swboyd@chromium.org>, 
	David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"

On Wed, 28 Feb 2024 at 11:50, Johan Hovold <johan@kernel.org> wrote:
>
> On Tue, Feb 27, 2024 at 02:11:56PM -0800, Abhinav Kumar wrote:
> > On 2/27/2024 2:08 PM, Dmitry Baryshkov wrote:
> > > This reverts commit e467e0bde881 ("drm/msm/dp: use
> > > drm_bridge_hpd_notify() to report HPD status changes").
> > >
> > > The commit changed the way how the MSM DP driver communicates
> > > HPD-related events to the userspace. The mentioned commit made some of
> > > the HPD events being reported earlier. This way userspace starts poking
> > > around. It interacts in a bad way with the dp_bridge_detect and the
> > > driver's state machine, ending up either with the very long delays
> > > during hotplug detection or even inability of the DP driver to report
> > > the display as connected.
> > >
> > > A proper fix will involve redesigning of the HPD handling in the MSM DP
> > > driver. It is underway, but it will be intrusive and can not be thought
> > > about as a simple fix for the issue. Thus, revert the offending commit.
> >
> > Yes, for fixing this on 6.9 I am fine with this.
>
> Since this is a regression in 6.8-rc1, I hope you meant to say 6.8 here?

In the worst case it will land to 6.8.x via the stable tree process.

>
> > I hope there were not other changes which were built on top of this. So
> > it will be better if we retest internal HPD case as well with this.
> >
> > We will do that in a day or two and give Tested-by.
>
> Johan



-- 
With best wishes
Dmitry

