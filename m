Return-Path: <linux-arm-msm+bounces-78095-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B9FBBF4D31
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 Oct 2025 09:08:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id EB7AA18C5D15
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 Oct 2025 07:08:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9464D275AFB;
	Tue, 21 Oct 2025 07:08:06 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 958F8273805;
	Tue, 21 Oct 2025 07:08:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761030486; cv=none; b=rJZUa+5MDKwsNCsANdTLoBRyT+NB8YcZs+F838lFXor6TVwC+sTkXePpd+ksSUVazeSXT18USzIIHkKeWtACV8PSYw+C7l7h3wUhAcMZbh51OMC73Rhk+6PgC7yRueTxxD0IG0M4RgCTcx76u5KhjcXm+6H8X4XtbMmZ9YRnnCA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761030486; c=relaxed/simple;
	bh=i9l9MFRWwj7syIRpiVJObf/x/w9KrsaHS+iN1oIRGBU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ts8hfF8/NGGcpznb5EX4Q86xc2WDu7L8vhK31Fntxv5HJlvBfB23c9zXCj+hdd787tgHjKOFvnA2Id+42k6GkZ/QiUEYCFA7y7kAni6L5F4arF0GodyyG5h1JAroDRPE4jwdBGWmCqEUODvlGddC3Y43h6zgJaRwBU2oeor2lrg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id EC0431063;
	Tue, 21 Oct 2025 00:07:54 -0700 (PDT)
Received: from localhost (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 68E2E3F66E;
	Tue, 21 Oct 2025 00:08:02 -0700 (PDT)
Date: Tue, 21 Oct 2025 08:08:00 +0100
From: Leo Yan <leo.yan@arm.com>
To: Jie Gan <jie.gan@oss.qualcomm.com>
Cc: Xiaoqi Zhuang <xiaoqi.zhuang@oss.qualcomm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Mike Leach <mike.leach@linaro.org>,
	James Clark <james.clark@linaro.org>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH] coresight: ETR: Fix ETR buffer use-after-free issue
Message-ID: <20251021070800.GK281971@e132581.arm.com>
References: <20251020-fix_etr_issue-v1-1-902ab51770b4@oss.qualcomm.com>
 <20251020143718.GH281971@e132581.arm.com>
 <6e6c3034-221c-4e79-8971-7bfbe26f91a6@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6e6c3034-221c-4e79-8971-7bfbe26f91a6@oss.qualcomm.com>

On Tue, Oct 21, 2025 at 09:56:43AM +0800, Jie Gan wrote:

[...]

> > diff --git a/drivers/hwtracing/coresight/coresight-tmc-etr.c b/drivers/hwtracing/coresight/coresight-tmc-etr.c
> > index b07fcdb3fe1a..d0fac958c614 100644
> > --- a/drivers/hwtracing/coresight/coresight-tmc-etr.c
> > +++ b/drivers/hwtracing/coresight/coresight-tmc-etr.c
> > @@ -1241,6 +1241,8 @@ static struct etr_buf *tmc_etr_get_sysfs_buffer(struct coresight_device *csdev)
> >   	struct tmc_drvdata *drvdata = dev_get_drvdata(csdev->dev.parent);
> >   	struct etr_buf *sysfs_buf = NULL, *new_buf = NULL, *free_buf = NULL;
> > +	WARN_ON(coresight_get_mode(csdev) != CS_MODE_SYSFS);
> 
> I think we should check the WARN_ON result and exit if there is an error?

When run at here, it should be in Sysfs mode. Here the check is for
debugging purpose in case any mismatch.

[...]

> > +static void tmc_release_mode(struct coresight_device *csdev, enum cs_mode mode)
> > +{
> > +	struct tmc_drvdata *drvdata = dev_get_drvdata(csdev->dev.parent);
> > +
> > +	scoped_guard(raw_spinlock_irqsave, &drvdata->spinlock);
> > +
> > +	if (WARN_ON(coresight_get_mode(csdev) != mode))
> > +		return;
> 
> the mode here could be set to any CS_MODE, so I think it's possible to
> encounter the secenario below:
> 
> coresight_get_mode(csdev) == CS_MODE_DISABLED, mode == CS_MODE_DISABLED,
> 
> With the condition, the csdev->refcnt will go to negative number?

The parameter "mode" might cause complexity, will drop it.  The
correctness will be ensured by the callers.

Thanks for review!

Leo

