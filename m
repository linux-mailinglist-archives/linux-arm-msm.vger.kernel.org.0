Return-Path: <linux-arm-msm+bounces-60345-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 17F99ACF3A7
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Jun 2025 18:03:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 835783A1AE4
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Jun 2025 16:02:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B554A1DE4F6;
	Thu,  5 Jun 2025 16:03:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foundries.io header.i=@foundries.io header.b="LUUEvwMm"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C697F2E659
	for <linux-arm-msm@vger.kernel.org>; Thu,  5 Jun 2025 16:03:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749139384; cv=none; b=fUXGdFxXzW7GtGX9ODitpuM3JbO7tE0ztvEbfJGkPGxjhLlNi4I/Jt9r484p5mVhGFdhYc3dRrQwFWEAoM72WkfEiexUk1DVfG4dxpsylWfiGam/VGDjVkvAwl8rMC8+QJ+eRs5RA0ajCiW344kwt2v8WY5wUXUejFy7SZduKog=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749139384; c=relaxed/simple;
	bh=VGMFzuutfV7nKkXdKYYfg9/r/xi0TIh+wLazNY1Pl0o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GOQLyNZCNC0BOO5tXZknhWrIRcPL4wc4dvxoLbsDESLlQ2WOSHZRQeKk/8tu2TS6viZxjO4Gig/2fJVMWbmyl0TYv+SKlBh0TMCMm6xnY/RU5rPp7+917TVnHexAJmlNShppcqBTWF9WKp0h2mBQBbgR6hA992/icpCFXz0pTkY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=foundries.io; spf=pass smtp.mailfrom=foundries.io; dkim=pass (2048-bit key) header.d=foundries.io header.i=@foundries.io header.b=LUUEvwMm; arc=none smtp.client-ip=209.85.167.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=foundries.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foundries.io
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-5533302b49bso1271766e87.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 05 Jun 2025 09:03:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=foundries.io; s=google; t=1749139381; x=1749744181; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=/I4Gm32to9IUdM/ZTUFSas8K0NUMH72IM2vm2cX2xmU=;
        b=LUUEvwMmujd2rH8z0Ji2TggIhz3Bqn97JiVykwmflOfF+kvNthbcl6xs0lNMYs+OY9
         JaTPRB7B6Fa1BSfYrzlxPDohw/yBNf7O1Wrk/kE/X73o/mQ8WQdSNZUZZ5SOB41MEDcm
         Z74eo0ZlCoHuO6wJTOID/ot3CHUAFETGxZIixwUtiI8bo74fqOdUz3W3MQWrnkcj4otW
         QxSgEuJwZ0SlfQPIDGB9u3vOTDwZ9reiuarOgkQy9jjUk4D+isd1PLndfAHA2udcoelV
         /x24rAxo5YT6/cEjMw+2uVT0rBrN2PhpAasRA1IcjJBwlSnVvIylNMC7Wg7sJAxJYj09
         3ioQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749139381; x=1749744181;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/I4Gm32to9IUdM/ZTUFSas8K0NUMH72IM2vm2cX2xmU=;
        b=U0N03HQs3KeZ5lPs3tpJBC+jCPuoA7Y8YPBZCcuf+puFRn9exwa87LDdUQLScWLOUn
         NNq1GpLdBnXthBFunH8Gzpz/8cSkH9ibabwLUAZLF3vte1VH0AYgWAT1tBBWT7GZk1cS
         QIofcDNqLoi/FzSdq04wrPtXgwIAkzb1p2PSZVRYfbx1WCSVTIOU7we2FhOpwVdlow6R
         x5L9oPQdMVgC2HsVlbLGQcEBDI9t31M9SPc35DPTUkRKhCZfozsE7cWJb905+o9UIoY5
         O3OectK/wrhZAgqs0aCbX7krHrBI0sNQWSbJbntdRSn2IXT/ekH4NUSlgrUjwhCbmXNF
         nVQA==
X-Forwarded-Encrypted: i=1; AJvYcCXtB9CGVsbUSaxHGcrz28Zz3A34ECj6lnFfNY3FIubhhqYOAaktGeXcXdUGGLUTYeDg7vyLDSM8l4RWXpuN@vger.kernel.org
X-Gm-Message-State: AOJu0Yzgk058kEs6rxJjaXUq+qC4XsS20FY/MtJ2/yxmUVB+u5SOTktj
	qKxvcMUdRngxADq53byFBC+RVGgpZr6xR/kjUq7cVbug3hy+I7GpetxBJXGqUiLz2yQ=
X-Gm-Gg: ASbGnctcjbhngISj4UjZ0txX9oF1ZxoS+XBYDP4DWx56yIqaCxLZ15Udr6wCPxL9H3U
	SqMneFyd5swr6ZOxjtqDiilQe64htSULs2CQZenjRBUc4Axn0XAVfbmrYL45yQcxcJCl6is3MgG
	RoaHM57ZYb3T8/aG4a+PIomdTlXBCWhdox1JhxjZP+dW2be+QfNa0BQpW4qdwxCT8PM8QbeRefu
	c83aGfp7OYvTh0d6pEv8YJ+Gqqg9FtAUyKgxUdx0aXC1AcKcbNRdvOOyN4OBC6289qWwQgmwzyW
	nghBLHdquY1+NPDXgUmLJKy3VS3XgpH3S6rj0XXrxzAaIdpOnZoT0J3gaXnxEul6qsgPjEiKoTA
	Q0+LxMi12DEmf8nIEN0nIhOTOi55xRech0QtW9PWQs9AH
X-Google-Smtp-Source: AGHT+IGGrsU9oyLOmDMZpm3mAqCnpB+qWkpA03Us/Yp6H9QrPMC3zQ8mYOciDw3ZVJ10YE9FbJYcKg==
X-Received: by 2002:a05:6512:b10:b0:553:35c4:db08 with SMTP id 2adb3069b0e04-55357bacfdfmr1990165e87.30.1749139380261;
        Thu, 05 Jun 2025 09:03:00 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5533791cceasm2648322e87.170.2025.06.05.09.02.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Jun 2025 09:02:59 -0700 (PDT)
Date: Thu, 5 Jun 2025 19:02:58 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@foundries.io>
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, 
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, Renjiang Han <quic_renjiang@quicinc.com>, 
	Vikash Garodia <quic_vgarodia@quicinc.com>, Dikshita Agarwal <quic_dikshita@quicinc.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, linux-media@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	Nicolas Dufresne <nicolas.dufresne@collabora.com>
Subject: Re: [PATCH v8 0/3] media: venus: enable venus on qcs615
Message-ID: <nr2je5ssn22npl2dqu5aj2xcwinnjmhvl3tvuz5smr4dd2rxaj@dfkk6aktkafy>
References: <20250530-add-venus-for-qcs615-v8-0-c0092ac616d0@quicinc.com>
 <wmri66tkksq6i3hfyoveedq5slghnnpozjzx6gck5r3zsiwsg6@xevgh54rnlqd>
 <285cae4a-219c-4514-818f-34c8225529de@quicinc.com>
 <t6niql4jfotjnbducypwxkdjqt3or7k3rwmltvbhifmpphsiwy@er56ey4v2pzo>
 <a3bf69f3-6500-4e45-ba34-8ba24312938a@kernel.org>
 <CAO9ioeWkLu+ne18kjEST7YU7b1aBzcMBBeyfpagzis99BAeOHg@mail.gmail.com>
 <b710e357-09e3-460e-b097-28cf0c856aeb@kernel.org>
 <44b3779b-702c-4e8b-8ccd-c9c3314a511f@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <44b3779b-702c-4e8b-8ccd-c9c3314a511f@linaro.org>

On Thu, Jun 05, 2025 at 01:40:03PM +0100, Bryan O'Donoghue wrote:
> On 05/06/2025 13:33, Krzysztof Kozlowski wrote:
> > On 05/06/2025 14:30, Dmitry Baryshkov wrote:
> > > On Thu, 5 Jun 2025 at 13:13, Krzysztof Kozlowski <krzk@kernel.org> wrote:
> > > > 
> > > > On 02/06/2025 08:16, Dmitry Baryshkov wrote:
> > > > > On Sat, May 31, 2025 at 08:05:24AM +0800, Renjiang Han wrote:
> > > > > > 
> > > > > > On 5/31/2025 4:27 AM, Dmitry Baryshkov wrote:
> > > > > > > On Fri, May 30, 2025 at 09:32:12AM +0530, Renjiang Han wrote:
> > > > > > > > QCS615 uses the same video core as SC7180, so reuse the same resource
> > > > > > > > data of SC7180 for QCS615 to enable video functionality.
> > > > > > > > 
> > > > > > > > There are no resources for the video-decoder and video-encoder nodes
> > > > > > > > in the device tree, so remove these two nodes from the device tree. In
> > > > > > > > addition, to ensure that the video codec functions properly, use [3]
> > > > > > > > to add encoder and decoder node entries in the venus driver.
> > > > > > > > 
> > > > > > > > Validated this series on QCS615 and SC7180.
> > > > > > > > 
> > > > > > > > Note:
> > > > > > > > This series consist of DT patches and a venus driver patch. The patch
> > > > > > > > 1/3, which is venus driver patch, can be picked independently without
> > > > > > > > having any functional dependency. But patch 2/3 & patch 3/3, which are
> > > > > > > > DT patches, still depend on [1].
> > > > > > > I'd say 2/3 and 3/3 still depend on 1/3, otherwise we can get video core
> > > > > > > on QCS615 over(?)clocked.
> > > > > > Agree, so we need to make sure that the driver patch is not picked after the
> > > > > > DT patch.
> > > > > 
> > > > > Worse: we need to make sure that the driver patch is present in the
> > > > > branch which picks up DT patches. Otherwise building & testing that
> > > > 
> > > > 
> > > > Well, that's a NAK then (although depends what you mean by DT).
> > > 
> > > I mean qcs615.dtsi. I'd suggest an immutable branch for the driver
> > 
> > Sorry, but no, DTS cannot depend on drivers. You CANNOT merge them into
> > one branch.

Surely it can... Like any other cross-subsystem dependency.

> > 
> > > patch. Or just merging the patches in two consequent releases.
> > 
> > That's a new device nodes, new hardware so it should not be blocked by
> > any driver patch. This is just totally broken process / patchset / work.
> > 
> > Best regards,
> > Krzysztof
> 
> Reading this thread, I don't think that is the case.
> 
> I don't see how patches 2/3 or 3/3 depend on 1/3.

Please correct me if I'm wrong. Without driver changes from patch 1, the
driver will always use frequency table from the driver itself. In this
case it will be the frequency table (and corners) for SC7180, which
would make venus driver overclock the hardware on QCS615.

> 
> The frequency table is a fallback in the driver and the DT changes are
> completely straight forward.
> 
> TBH, I think we are hitting an email comms/social barrier here, not a
> technical one.

I assume so.

> 
> @Renjiang can you please confirm that freq_table is a fallback, qcs615 will
> work without OPP table and the DTS stuff doesn't depend on the driver.
> 
> TBH, I don't see how the DTS can or should but...
> 
> ---
> bod
> 

-- 
With best wishes
Dmitry

