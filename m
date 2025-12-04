Return-Path: <linux-arm-msm+bounces-84313-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 2627ECA2D77
	for <lists+linux-arm-msm@lfdr.de>; Thu, 04 Dec 2025 09:38:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 9591A3007D69
	for <lists+linux-arm-msm@lfdr.de>; Thu,  4 Dec 2025 08:38:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7A5B13254AD;
	Thu,  4 Dec 2025 08:38:08 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0816C1D6BB;
	Thu,  4 Dec 2025 08:38:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764837488; cv=none; b=h5lB/RvAhXKXznp6u4ywh3+hagk6P487Uiaff5vx5lOvGwcnCe0LOmU2Oa3ejNKhpeXvgOKkheRzeKf7jsLVOQl8Rnc+C+KxCQRjQnSPT+5DU08d5bSQWhgRLApuE7wHdUB00wmAVp5J80WCE4xPfJzz3yoAtknuLJH5qLkgG3U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764837488; c=relaxed/simple;
	bh=9+uu5ZSlq66frF5wBW2nXLerWrCuBEamXfoAD0RNyp8=;
	h=Date:From:To:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ve9wxznkuB+xCl72yXMWyPpFtS31r0htUyBhuqkBykqAAdernBGt0LbLtJKcgN1O54BVn2jVUpI4LGmTOXmBjIxTfC42pXCEQLv/GpB4SvSSRuPCaf5gmGMc0BCapk5JLTCFuEJS5BhDApZHwM6nFNjPlDXRL9n09SEJ+7dqEPU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D7529339;
	Thu,  4 Dec 2025 00:37:57 -0800 (PST)
Received: from localhost (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C8ACB3F73B;
	Thu,  4 Dec 2025 00:38:04 -0800 (PST)
Date: Thu, 4 Dec 2025 08:38:02 +0000
From: Leo Yan <leo.yan@arm.com>
To: Yingchao Deng <yingchao.deng@oss.qualcomm.com>,
	Mike Leach <mike.leach@linaro.org>,
	James Clark <james.clark@linaro.org>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>,
	quic_yingdeng@quicinc.com, coresight@lists.linaro.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	Jinlong Mao <jinlong.mao@oss.qualcomm.com>,
	Mao Jinlong <quic_jinlmao@quicinc.com>
Subject: Re: [PATCH v6 2/2] coresight: cti: Add Qualcomm extended CTI support
Message-ID: <20251204083802.GI724103@e132581.arm.com>
References: <20251202-extended_cti-v6-0-ab68bb15c4f5@oss.qualcomm.com>
 <20251202-extended_cti-v6-2-ab68bb15c4f5@oss.qualcomm.com>
 <20251203182944.GG724103@e132581.arm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251203182944.GG724103@e132581.arm.com>

On Wed, Dec 03, 2025 at 06:29:44PM +0000, Coresight ML wrote:

[...]

> > +/* Read registers with power check only (no enable check). */
> > +static ssize_t coresight_cti_reg_show(struct device *dev,
> > +				      struct device_attribute *attr, char *buf)
> > +{
> > +	struct cti_drvdata *drvdata = dev_get_drvdata(dev->parent);
> > +	struct cs_off_attribute *cti_attr = container_of(attr, struct cs_off_attribute, attr);
> > +	u32 idx, val = 0;
> > +
> > +	pm_runtime_get_sync(dev->parent);
> > +	raw_spin_lock(&drvdata->spinlock);
> > +	idx = drvdata->config.ext_reg_sel;
> > +	if (drvdata->config.hw_powered) {
> > +		switch (cti_attr->off) {
> > +		case INDEX_CTITRIGINSTATUS:
> > +		case INDEX_CTITRIGOUTSTATUS:
> > +		case INDEX_ITTRIGINACK:
> > +		case INDEX_ITTRIGOUT:
> > +		case INDEX_ITTRIGOUTACK:
> > +		case INDEX_ITTRIGIN:

I read again and now I understand why you need "config.ext_reg_sel"
as an index for these expending registers.

I think you should extend attrs for the new adding registers:

  static struct attribute *coresight_cti_regs_attrs[] = {
      ...
      coresight_cti_reg(triginstatus, CTITRIGINSTATUS),
      /* Qcom CTI only for triginstatus1/2/3 */
      coresight_cti_reg(triginstatus1, CTITRIGINSTATUS + 0x4),
      coresight_cti_reg(triginstatus2, CTITRIGINSTATUS + 0x8),
      coresight_cti_reg(triginstatus3, CTITRIGINSTATUS + 0xc),
      ...
  }

Then, you can add a is_visible() in coresight_cti_regs_group:

  static umode_t coresight_cti_regs_is_visible(struct kobject *kobj,
                  struct attribute *attr, int n)
  {
          struct device *dev = container_of(kobj, struct device, kobj);
          struct cti_drvdata *drvdata = dev_get_drvdata(dev->parent);

          /* Mute QCOM CTI registers for standard CTI module */
          if (!drvdata->is_qcom_cti) {
              if (attr == &triginstatus1.attr ||
                  attr == &triginstatus2.attr ||
                  attr == &triginstatus3.attr)
                  return 0;
          }

          return attr->mode;
  }

  static const struct attribute_group coresight_cti_regs_group = {
          .attrs = coresight_cti_regs_attrs,
          .name = "regs",
          .is_visible = coresight_cti_regs_is_visible,
  };

Thanks,
Leo

