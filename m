Return-Path: <linux-arm-msm+bounces-44218-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CBFDA04C8F
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Jan 2025 23:43:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 782011669B9
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Jan 2025 22:43:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2BE84199FC9;
	Tue,  7 Jan 2025 22:43:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="nT5OkujT"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com [209.85.208.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A2A519F120
	for <linux-arm-msm@vger.kernel.org>; Tue,  7 Jan 2025 22:43:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736289816; cv=none; b=laXw5UgOC6zf0Z26bldHFmXCg3MVwqbZNtuvyuifzg+NNNmzpFLR1f3qPxedIwbDgKNBMOTWD9fDVtOhPcSPiaD8ugDSZXVgU7UVESDLSJsDRajq0FbUEuwZtkRt2xtyXjd8koKEmm5zdyiGSWXI2Zfe7zALgSdfYjqI3QXZgtM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736289816; c=relaxed/simple;
	bh=DV7wpbry1jkw+VWJERzJa6U1rgHn8ivUK6AEfkD8XWc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=snL9WXcjwmHzyKgQJswupRTFT506ZsHLCaNwo8GhnOwKK9fCc7cXeG9hDwp9EB57By+I5tQPxVdfFWv+aWW4smAn4C70HF2H9zoAHRfZhLafli7oYd1JAkOYUjXk43P6HGpG/zoveJxSD9xkVHZcny5Job/BOu7skZDJyMohRTM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=nT5OkujT; arc=none smtp.client-ip=209.85.208.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-3011c7b39c7so186618081fa.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 07 Jan 2025 14:43:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1736289812; x=1736894612; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=pa3RqmxudYJyFQPRnw18vNuYTg6IZacGgInKXmkuvPY=;
        b=nT5OkujT7Eb6/jPWMB3/PQFJimGn6zAarYezM5HUzy9xMvqVmpFI+lrLL+4nQe57X1
         djCuWEoXvZXE2v5EXK5NAZjC5Xgwk+0NFIw1G7HRf9zENXNbtBJGfPEeURwjy14i5pA2
         Qc4vWTTIhE72qzlBBq7t1qayVw9sPbdQwvOw5g0hqx0sump075XF726bYNrtxH21jYNX
         ppjteGXediW3imgQxSnM8iCDHt8/QwPiRsXmwbhx5Wk8c5EAxiNt+59zP8pkWEj4z0wx
         14T5fEU0Pm1NWfEj0RV0+pRpXqWkT1ARaumvq06R0jrNmcQHQ4OjZQLdqPk3eu+nP3QK
         KDuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736289812; x=1736894612;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=pa3RqmxudYJyFQPRnw18vNuYTg6IZacGgInKXmkuvPY=;
        b=kyW8YHlDNjMwV1i2X78DgYltR982cn+2HxfoetCs/9cPk2Y/jdmRXPYrFxprVA/kK1
         gJ8LNtvckpTDEnJq9MghHOWhxrDiTCuvD+rlbn30tXacYErIG9jBhDyv6HAgGQYFgP1Q
         ZlDn+ukaZ5ifluCcu/1qy9BWT0fs1YULBWq0X7jqdICWeTQvWlgP/7R9mrbNHMdhgOdu
         fviKbyzxPqTWfdZPegM81YbhjWs9UetGrWw7CkzvN2GWZnqcKabR/euOtbvG7JgkzFVv
         WhXq5/gl5FOUahGTDfUijdbIxr8XIAYJMXnGZVbqr8kbh8lzIq+Q2yjYI6JrZ9J+EYWW
         X5PQ==
X-Forwarded-Encrypted: i=1; AJvYcCVj2BLk7N1RWYXmJ1i8j/hAdztNISI8Jy0foBfcBnqHAJsFIG+PwhLZqXNyMkvpPq9iDguN6rL4kWEPQplV@vger.kernel.org
X-Gm-Message-State: AOJu0Yx4Gl10+L7qPNLOalFskXizDv4F7WjtdWTQWMhtvYhdOSM8jBoB
	6MTDL/9H04jjH/ZUotCw+R9dYKtzRcSGbxS6FcjpZYoTLfnTEg4sEC4JmXHjSm0=
X-Gm-Gg: ASbGncsJcjcRRwJnp98sOSV3F9+4TX2YAQii21maJftWsWKy1EPgcINwoGXrSsGsYz3
	LAhckw9sKENdpNABtaMLg0YrjztkpK78AWlBOTBocxBCcfL/TDu4pDksjhgIRajv2h1jQlIWoFY
	F0VVZ8sTVCnYpRQXDB1IxVkPpa4qsmfu5UGt4TPQLOAOzbpkO4+in0D59YoXtgqqsx+vH6DKbfc
	y4VG4pZRIuOvKGhl8hOfNEpklvs9RPptDCm1d0lQ6Znq1KhiCIZeBsgV3IU0jGTpOC0M1zKHllw
	8cUzFmVk/lgPcQHjHZQaZX4I0yo7YtlwuuMH
X-Google-Smtp-Source: AGHT+IHy5V27gDH+by9fnJ68iOhPGvEIJqeaut59nvgCwr8FXp2+T/5yYWYjCX3jT2mFaBHiG+I4UA==
X-Received: by 2002:a2e:bea8:0:b0:302:1b18:2c09 with SMTP id 38308e7fff4ca-305f45ba080mr1149561fa.27.1736289812296;
        Tue, 07 Jan 2025 14:43:32 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3045ad9b9c4sm61091001fa.31.2025.01.07.14.43.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jan 2025 14:43:31 -0800 (PST)
Date: Wed, 8 Jan 2025 00:43:29 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>
Cc: Will Deacon <will@kernel.org>, iommu@lists.linux.dev, 
	linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org, 
	Robin Murphy <robin.murphy@arm.com>, Rob Clark <robdclark@chromium.org>, 
	Joerg Roedel <joro@8bytes.org>, 
	"moderated list:ARM SMMU DRIVERS" <linux-arm-kernel@lists.infradead.org>, open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2] iommu/arm-smmu-qcom: Only enable stall on smmu-v2
Message-ID: <fipxf3vf3nrbiqgwtu7z4vqcyt52dludehdvqc2cnfbal6poyv@uj4hxrlhnqeg>
References: <20250102183232.115279-1-robdclark@gmail.com>
 <20250107125738.GA6991@willie-the-truck>
 <CAF6AEGtZSOMi-=AOmjoXSVkwfyvKOymSuRRMZ7jOcM2wyhu5qg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAF6AEGtZSOMi-=AOmjoXSVkwfyvKOymSuRRMZ7jOcM2wyhu5qg@mail.gmail.com>

On Tue, Jan 07, 2025 at 07:26:44AM -0800, Rob Clark wrote:
> On Tue, Jan 7, 2025 at 4:57 AM Will Deacon <will@kernel.org> wrote:
> >
> > On Thu, Jan 02, 2025 at 10:32:31AM -0800, Rob Clark wrote:
> > > From: Rob Clark <robdclark@chromium.org>
> > >
> > > On mmu-500, stall-on-fault seems to stall all context banks, causing the
> > > GMU to misbehave.  So limit this feature to smmu-v2 for now.
> > >
> > > This fixes an issue with an older mesa bug taking outo the system
> > > because of GMU going off into the weeds.
> > >
> > > What we _think_ is happening is that, if the GPU generates 1000's of
> > > faults at ~once (which is something that GPUs can be good at), it can
> > > result in a sufficient number of stalled translations preventing other
> > > transactions from entering the same TBU.
> >
> > MMU-500 is an implementation of the SMMUv2 architecture, so this feels
> > upside-down to me. That is, it should always be valid to probe with
> > the less specific "SMMUv2" compatible string (modulo hardware errata)
> > and be limited to the architectural behaviour.
> 
> I should have been more specific and referred to qcom,smmu-v2
> 
> > So what is about MMU-500 that means stalling doesn't work when compared
> > to any other SMMUv2 implementation?
> 
> Well, I have a limited # of data points, in the sense that there
> aren't too many a6xx devices prior to the switch to qcom,smmu-500..
> but I have access to crash metrics for a lot of sc7180 devices
> (qcom,smmu-v2), and I've been unable to find any signs of this sort of
> stall related issue.
> 
> So maybe I can't 100% say this is qcom,smmu-500 vs qcom,smmu-v2, vs
> some other change in later gens that used qcom,smmu-500 or some other
> factor, I'm not sure what other conclusion to draw.

Might it be that v2 was an actual hw, but mmu-500 is somehow
virtualized? And as such by these stalls we might be observing some kind
of FW bug in hyp?

> 
> BR,
> -R

-- 
With best wishes
Dmitry

