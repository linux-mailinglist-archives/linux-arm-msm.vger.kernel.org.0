Return-Path: <linux-arm-msm+bounces-63538-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 90512AF7730
	for <lists+linux-arm-msm@lfdr.de>; Thu,  3 Jul 2025 16:22:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 39E061888603
	for <lists+linux-arm-msm@lfdr.de>; Thu,  3 Jul 2025 14:19:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E81572E8E0A;
	Thu,  3 Jul 2025 14:19:09 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 64DCF18A6A7;
	Thu,  3 Jul 2025 14:19:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751552349; cv=none; b=Ma2E8f6D4gTZpTiplfkFGLjwC/Vk+hDOk8MfEElnUb3WJPBjCB1lr6roS05/7LGMFATavRyDk1Gv4fQnfUs8bdwgG5DMprtrO1x3mfRlZ6FYgxUpBlLEa5Ei+g7GLwuDyCbfjiaGflWFc9qQNeq63OePqum+KQKr/7ceMuXnbMg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751552349; c=relaxed/simple;
	bh=RXl2AD1m2IYSvA9DnaRUoy0bq5NdmV6BO5rT6wHMAHI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QEsntS5xlAhB8Wx8P9exaUCH2HPwmOzyjabykNxCw4OpdV/EGE78D2zAOlSZqyT9FhInGpfdtLRprDv2rexoLiq/rpM1KUM+J2Ov+cIM5WxCi5ZsKYwZXtnp/DTs5sZR/QAmvpLxCuUMHyXc0PNHz0JXZIeKCxFhATjvXamD8EA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 463221596;
	Thu,  3 Jul 2025 07:18:53 -0700 (PDT)
Received: from localhost (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 4150E3F66E;
	Thu,  3 Jul 2025 07:19:07 -0700 (PDT)
Date: Thu, 3 Jul 2025 15:19:05 +0100
From: Leo Yan <leo.yan@arm.com>
To: Mao Jinlong <quic_jinlmao@quicinc.com>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>,
	Mike Leach <mike.leach@linaro.org>,
	James Clark <james.clark@arm.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>, coresight@lists.linaro.org,
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH v8 2/2] coresight: Add label sysfs node support
Message-ID: <20250703141905.GE1039028@e132581.arm.com>
References: <20250703130453.4265-1-quic_jinlmao@quicinc.com>
 <20250703130453.4265-3-quic_jinlmao@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250703130453.4265-3-quic_jinlmao@quicinc.com>

On Thu, Jul 03, 2025 at 09:04:53PM +0800, Mao Jinlong wrote:

[...]

> +static ssize_t label_show(struct device *dev,
> +		struct device_attribute *attr, char *buf)
> +{
> +
> +	const char *str;
> +	int ret = 0;

No need to init ret to 0.

> +	ret = fwnode_property_read_string(dev_fwnode(dev), "label", &str);
> +	if (ret == 0)
> +		return scnprintf(buf, PAGE_SIZE, "%s\n", str);
> +	else
> +		return ret;
> +}
> +static DEVICE_ATTR_RO(label);
> +
>  static struct attribute *coresight_sink_attrs[] = {
>  	&dev_attr_enable_sink.attr,
> +	&dev_attr_label.attr,
>  	NULL,
>  };
>  ATTRIBUTE_GROUPS(coresight_sink);
>  
>  static struct attribute *coresight_source_attrs[] = {
>  	&dev_attr_enable_source.attr,
> +	&dev_attr_label.attr,
>  	NULL,
>  };
>  ATTRIBUTE_GROUPS(coresight_source);
>  
> +static struct attribute *coresight_link_attrs[] = {
> +	&dev_attr_label.attr,
> +	NULL,
> +};
> +ATTRIBUTE_GROUPS(coresight_link);
> +
> +static struct attribute *coresight_helper_attrs[] = {
> +	&dev_attr_label.attr,
> +	NULL,
> +};
> +ATTRIBUTE_GROUPS(coresight_helper);
> +

This change adds a 'label' entry for source, link, helper, and sink
components, but the documentation has only updated for three components:
CTI, funnel, and TPDM.

Should we also update the documentation for all relevant components,
such as ETM, ETR, etc.?

Additionally, patch 01 is missing the update to the ETM yaml file for
the new property. I checked patch v4 [1], which includes a change to
etm.yaml, but this change was dropped since v5. I briefly read the
v4 discussion thread and didn't see any mention of removing the ETM
related change. Did you see any particular issue when add label for
ETM devices?

Overall, this series is fine for me. Just please ensure that all
relevant components are covered for completeness.

Thanks,
Leo

[1] https://patchwork.kernel.org/project/linux-arm-msm/cover/20240703122340.26864-1-quic_jinlmao@quicinc.com/

>  const struct device_type coresight_dev_type[] = {
>  	[CORESIGHT_DEV_TYPE_SINK] = {
>  		.name = "sink",
> @@ -390,6 +420,7 @@ const struct device_type coresight_dev_type[] = {
>  	},
>  	[CORESIGHT_DEV_TYPE_LINK] = {
>  		.name = "link",
> +		.groups = coresight_link_groups,
>  	},
>  	[CORESIGHT_DEV_TYPE_LINKSINK] = {
>  		.name = "linksink",
> @@ -401,6 +432,7 @@ const struct device_type coresight_dev_type[] = {
>  	},
>  	[CORESIGHT_DEV_TYPE_HELPER] = {
>  		.name = "helper",
> +		.groups = coresight_helper_groups,
>  	}
>  };
>  /* Ensure the enum matches the names and groups */
> -- 
> 2.17.1
> 
> _______________________________________________
> CoreSight mailing list -- coresight@lists.linaro.org
> To unsubscribe send an email to coresight-leave@lists.linaro.org

