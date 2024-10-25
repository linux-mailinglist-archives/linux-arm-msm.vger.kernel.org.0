Return-Path: <linux-arm-msm+bounces-35820-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 616129AFCD4
	for <lists+linux-arm-msm@lfdr.de>; Fri, 25 Oct 2024 10:43:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 25737282F43
	for <lists+linux-arm-msm@lfdr.de>; Fri, 25 Oct 2024 08:43:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D2A581D278B;
	Fri, 25 Oct 2024 08:43:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="XTinhZ2Y"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com [209.85.128.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C66111D270D
	for <linux-arm-msm@vger.kernel.org>; Fri, 25 Oct 2024 08:43:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729845797; cv=none; b=bfgWWh/owBg+MFn1SVqTqWdQB3LgwzT5MuLGipy7nFtQ1vyhTlGGq8cBiXFgI+9y4WdAWPTHtobbrS8mvWTG3tPtL9xsOsAVcu13rKgku1B7ybN8U6MAAJDfzXPXEyZBXtyn0pxYIgMlU4ap9EMhcJUE/sXPCJlnGmmL2We4gHk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729845797; c=relaxed/simple;
	bh=gqO6H9f6wkA2+S3L9LFbGLXMmbD0O/wXTCeVxvKUAQ8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jKSLcnB4CRUGke2bSaYibMIjrcFlfJV1xFN6DpcZ/+UcvVDuvE0LlkMSixpXIrw4zFNDUyIImX9NakKviWhzgR9j3sPPnHfMWBc3BhIEzR/GuP0ipKQZIbbbHIyflt1ADiXCljL4lJRMdwirOELgTX/TTEgKM/DvyRFAt+KmFEE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=XTinhZ2Y; arc=none smtp.client-ip=209.85.128.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yw1-f180.google.com with SMTP id 00721157ae682-6e5a5a59094so16820287b3.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 25 Oct 2024 01:43:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1729845795; x=1730450595; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=GC+qtopUK4oSW4KGo5gKXeaDDfYPEvj4E4F8hcqDrxw=;
        b=XTinhZ2Yle0mJw8ae4h4/NlZ42xApmKgqWq1gH+Na2cVGM8J4dJy5PT3XFmHcO4582
         +bH6+ruN/lKpr1chM4K/7x10RCyoMr95xOvNmiqfwfu16msNh4WZkP7/C1tAsVF9LAqk
         EsZqnb7PgLWwMv1BvByNSrgJWEW4a4SWc1EAIeIhE0CKrVS3RZ9sA7GQZJZAx5/xVP+O
         N8tui2e/oq1IR2XnEe1qJeEM2+DxyqVf0r8sLiybKpal9o2zMFa7zT6n3yHS6gPqhQTq
         4XDqhSwAByMSSxvYYOdsQdQQl4IxYUU2ivT+sS0cvY5aWydEv4+inih8M4IxH9WNhc3p
         5xxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729845795; x=1730450595;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GC+qtopUK4oSW4KGo5gKXeaDDfYPEvj4E4F8hcqDrxw=;
        b=foQO/QFjw9xuEJp7SNe5eZc8hO8lORpQnOtuRArXG6Bz1ksBjtww4uXORg7nO7ORUK
         gt7XolB+fVwppI3o1GP8CaZu4vA4GHFGdQyb3uMXqQcD0sbFa/AOQ5XMNbos0nJl89QT
         FCh6n65g0nmb1TXkFvtbedc+itZb3LY0sk361ii4o9cKV/lXE0SkBG332KpufMYXc1Fe
         vZkP5aZHYyFWuKGC9noklp0PL3KAQwCl2Iv4D5+en8ZFq3FwZky3rSqL7WcgemQ5CexR
         GxQlTVH2U6wyoKHggQ0DtLxRbK7iB5JH1h0LQjPKqCVuq+TwuenPQMHxpuC0XHKcLvDB
         V6Yw==
X-Forwarded-Encrypted: i=1; AJvYcCXQl81d5wEuKZat9Yiy2eFnR81xuQ/jbIumzgsJpgVDzuOohPyT5M+w15NzoAu7iNYNc4v/i4aLjmdTkVAj@vger.kernel.org
X-Gm-Message-State: AOJu0YzezSFp6l5anxk7U108nE4MAVHzeL4bmVInaDOh4oWt/QVbQYkz
	MDfEgodftMUumgx9kP+vRZ8RWHp07t3qBr8vZ5W56PoBeSNKRfbXQHZrhDNLUqJLrVXLMzvXYob
	WHJxAclZxy2kfN5wF6pxKHYJKsPOz/m269HVckQ==
X-Google-Smtp-Source: AGHT+IFrRXdZkgGxH0j5lBC5M/B8Et457P+nj+I6ZhAqPxt0MfCx1n+REAlyGGvq27rvvYwVe3tTniNTFUNptx7YNbM=
X-Received: by 2002:a05:690c:4a03:b0:6e2:446f:422c with SMTP id
 00721157ae682-6e7f0e4735emr106087327b3.21.1729845794711; Fri, 25 Oct 2024
 01:43:14 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241006135530.17363-1-quic_spuppala@quicinc.com>
 <20241023213134.GC3736641@google.com> <CAPDyKFo05Hyw9gdEBx7zQq_6P58ittHHsZQLuqmeR1AChyHSHw@mail.gmail.com>
 <20241025025628.GD1781@sol.localdomain>
In-Reply-To: <20241025025628.GD1781@sol.localdomain>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Fri, 25 Oct 2024 10:42:38 +0200
Message-ID: <CAPDyKFo5EijkL5Y+MZ0=ZWyGdLfDdSdqTOC0eMsTVY00KP+RAA@mail.gmail.com>
Subject: Re: [PATCH RFC 0/2] Avoid reprogram all keys to Inline Crypto Engine
 for MMC runtime suspend resume
To: Eric Biggers <ebiggers@kernel.org>
Cc: Seshu Madhavi Puppala <quic_spuppala@quicinc.com>, Adrian Hunter <adrian.hunter@intel.com>, 
	linux-mmc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, quic_rampraka@quicinc.com, 
	quic_nitirawa@quicinc.com, quic_sachgupt@quicinc.com, 
	quic_bhaskarv@quicinc.com, quic_neersoni@quicinc.com, 
	quic_gaurkash@quicinc.com
Content-Type: text/plain; charset="UTF-8"

On Fri, 25 Oct 2024 at 04:56, Eric Biggers <ebiggers@kernel.org> wrote:
>
> On Fri, Oct 25, 2024 at 01:07:18AM +0200, Ulf Hansson wrote:
> > On Wed, 23 Oct 2024 at 23:31, Eric Biggers <ebiggers@kernel.org> wrote:
> > >
> > > On Sun, Oct 06, 2024 at 07:25:28PM +0530, Seshu Madhavi Puppala wrote:
> > > > Crypto reprogram all keys is called for each MMC runtime
> > > > suspend/resume in current upstream design.
> > >
> > > Is that correct?  I thought that similar to what is done for UFS, the key
> > > reprogramming happens only after the MMC controller is reset.  I thought that is
> > > different from a runtime suspend.
> >
> > Looks like Seshu is not really worried about the host's runtime
> > suspend, but the card's runtime suspend.
> >
> > Perhaps there are some out of tree code involved here that makes use
> > of MMC_CAP_AGGRESSIVE_PM, which is what allows the card to be runtime
> > suspended?
> >
> > >
> > > If it's in fact triggering more often, maybe that is what needs to be fixed?
> >
> > We could extend the runtime PM autosusend timeout for the card, if
> > that makes sense.
> >
> > Kind regards
> > Uffe
>
> The keyslots are being reprogrammed from mmc_set_initial_state(), which is
> documented as:
>
>     /*
>      * Set initial state after a power cycle or a hw_reset.
>      */
>     void mmc_set_initial_state(struct mmc_host *host)
>
> It's called by: mmc_power_up(), mmc_power_off(), _mmc_hw_reset(), and
> mmc_sdio_sw_reset().
>
> Can that mean a power cycle of the card, not a power cycle of the host
> controller?

Yes, that's correct.

Well, indirectly the host is likely to be power cycled too, but not necessarily.

> The keyslots are part of the host controller, so that may explain
> the problem.  The keyslots should be reprogrammed only when the host controller
> is reset, as that is when they are lost.  (And it should not be skipped entirely
> as this patchset does, as a host controller reset is possible.)
>
> I am not an expert in MMC or in the details of how Qualcomm ICE is wired up to
> the system, so I might have this wrong.  But let me know if it sounds right.

It sounds reasonable to me, but I also don't know the HW well enough
to be able to tell.

Looks like we need some more input from Seshu and the QC folkz to
understand better.

Kind regards
Uffe

