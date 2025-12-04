Return-Path: <linux-arm-msm+bounces-84339-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 71550CA3217
	for <lists+linux-arm-msm@lfdr.de>; Thu, 04 Dec 2025 11:02:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id DF39D300807D
	for <lists+linux-arm-msm@lfdr.de>; Thu,  4 Dec 2025 10:02:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 727282D0615;
	Thu,  4 Dec 2025 10:02:12 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9DB503346BC;
	Thu,  4 Dec 2025 10:02:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764842532; cv=none; b=D5uBZw5RDwU57vYlAwHrl1IjCD202td83HTdXwxbW+X51h42ed1YEJbFSqat7146nBy+66BBmee1FHEl3mWgw+l13cY6WlT0uIGpD4/g7ByYh1MDXdXqBaxLtnASEdToN9NLMqQpqVsdEuSREtmf0477acF2emnyHJpU3uhbY2c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764842532; c=relaxed/simple;
	bh=OHCNMz8TiWOK0N8mP8HOSbotnat1jkvJuUEYaZhCEKc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ay7mUujUkTPyYp8fzyM3fz0w3yCXt41wYzY4zQpi04NOqc8ri6XRte7sFjBP8QW0+FgsNjYFju11yXlgahW/zK2dH8zmuRjUyyEa7Ee+dud0j7MV1rTZAMVVckc3uvv2jKwKg8TflT9xGNpjcfhshzvkH5zexeajVPZKVaPbu7o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 90593339;
	Thu,  4 Dec 2025 02:01:58 -0800 (PST)
Received: from localhost (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 817523F73B;
	Thu,  4 Dec 2025 02:02:05 -0800 (PST)
Date: Thu, 4 Dec 2025 10:02:03 +0000
From: Leo Yan <leo.yan@arm.com>
To: Mike Leach <mike.leach@linaro.org>
Cc: Yingchao Deng <yingchao.deng@oss.qualcomm.com>,
	James Clark <james.clark@linaro.org>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>,
	quic_yingdeng@quicinc.com, coresight@lists.linaro.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	Jinlong Mao <jinlong.mao@oss.qualcomm.com>,
	Mao Jinlong <quic_jinlmao@quicinc.com>
Subject: Re: [PATCH v6 2/2] coresight: cti: Add Qualcomm extended CTI support
Message-ID: <20251204100203.GJ724103@e132581.arm.com>
References: <20251202-extended_cti-v6-0-ab68bb15c4f5@oss.qualcomm.com>
 <20251202-extended_cti-v6-2-ab68bb15c4f5@oss.qualcomm.com>
 <20251203182944.GG724103@e132581.arm.com>
 <20251204083802.GI724103@e132581.arm.com>
 <CAJ9a7VhNW6cQt_O6NX+99LXfo-t3mFTejzdNjWcyssbMrXR4OQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAJ9a7VhNW6cQt_O6NX+99LXfo-t3mFTejzdNjWcyssbMrXR4OQ@mail.gmail.com>

On Thu, Dec 04, 2025 at 09:04:03AM +0000, Mike Leach wrote:
> Hi,
> 
> On Thu, 4 Dec 2025 at 08:38, Leo Yan <leo.yan@arm.com> wrote:
> >
> > On Wed, Dec 03, 2025 at 06:29:44PM +0000, Coresight ML wrote:
> >
> > [...]
> >
> > > > +/* Read registers with power check only (no enable check). */
> > > > +static ssize_t coresight_cti_reg_show(struct device *dev,
> > > > +                                 struct device_attribute *attr, char *buf)
> > > > +{
> > > > +   struct cti_drvdata *drvdata = dev_get_drvdata(dev->parent);
> > > > +   struct cs_off_attribute *cti_attr = container_of(attr, struct cs_off_attribute, attr);
> > > > +   u32 idx, val = 0;
> > > > +
> > > > +   pm_runtime_get_sync(dev->parent);
> > > > +   raw_spin_lock(&drvdata->spinlock);
> > > > +   idx = drvdata->config.ext_reg_sel;
> > > > +   if (drvdata->config.hw_powered) {
> > > > +           switch (cti_attr->off) {
> > > > +           case INDEX_CTITRIGINSTATUS:
> > > > +           case INDEX_CTITRIGOUTSTATUS:
> > > > +           case INDEX_ITTRIGINACK:
> > > > +           case INDEX_ITTRIGOUT:
> > > > +           case INDEX_ITTRIGOUTACK:
> > > > +           case INDEX_ITTRIGIN:
> >
> > I read again and now I understand why you need "config.ext_reg_sel"
> > as an index for these expending registers.
> >
> 
> Having this index for these extended registers matches what we do for
> the INEN and OUTEN registers. This gives the user a consistent
> approach. We do not want the unnecessary attributes as  it will
> increase the memory footprint for all cti instances, not just the qcom
> ones.

I agree with using index for CTI triggers, but it is not necessary to
add a new index for other registers (status, mode setting, ACK, etc).

It would be directive to present the status and mode setting
registers, given these registers are only from 0-3.  This will be easy
accessed from userspace, and avoid complexity in the driver.

> The first patch in this series works to reduce the memory footprint by
> only allocating resource based on the actual configuration. For
> example for an ARM designed CTI with 8 trigger registers, we no longer
> declare static 128 x 32 bit arrays for each of INEN and OUTEN which
> were required by the original design.
> 
> Given that there can be 10s or 100s of CTIs in a large multicore
> system, reducing the footprint to match the actual configuration, and
> offering a level of compression by using an index + single file to
> access a set of registers improves the efficiency of the driver.

It is good for reducing footprint, but I would give priority for a
neat implementation and easy use interfaces.

And the sysfs attr code and global structures (e.g. register conversion
struct) can shared by all instances, so I don't worry much the scale
issue if we extend them.

Thanks,
Leo

