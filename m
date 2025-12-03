Return-Path: <linux-arm-msm+bounces-84262-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B941DCA12E4
	for <lists+linux-arm-msm@lfdr.de>; Wed, 03 Dec 2025 19:54:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id EACDC3004522
	for <lists+linux-arm-msm@lfdr.de>; Wed,  3 Dec 2025 18:54:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9C4AA329C78;
	Wed,  3 Dec 2025 18:29:49 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 59B4133D6D6;
	Wed,  3 Dec 2025 18:29:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764786589; cv=none; b=JSppaVWB1UYJ41qFHzYwXMOKmqGlaj9gNBvblR73iGbrDK2MOUeGjxXeuxHgdkGXe7TMQGf2MtZwdiUYh567adDQ8q+noVdIrmhTCkaa5iVcmf3+Uk28fPj5D7YMORdP1PmoFidtWzJGw+bKtgzZLKRZh+2+3rVwNofJWZVB4C4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764786589; c=relaxed/simple;
	bh=LW3aw26eoC9ZvMEpi1cMXoStW7SUDQTcv5d/9XMY/Sc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UQzmufRlFIZ1wBfSeR2hw9SAANH2bskh0Jpi2yDDevKz0uS1ZcWnbDX3X7JDwuvw5g04jpCIkOLLC4RUrwgZTHzJu8qMC7TYfG5ixMOHrjMU0wiT2UxAE5zKGzP3IpdMz66KkcNG9wrsK3woensNt3v5+pau3h/su/H3+/qlz5U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 3B801339;
	Wed,  3 Dec 2025 10:29:39 -0800 (PST)
Received: from localhost (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 2FBD83F66E;
	Wed,  3 Dec 2025 10:29:46 -0800 (PST)
Date: Wed, 3 Dec 2025 18:29:44 +0000
From: Leo Yan <leo.yan@arm.com>
To: Yingchao Deng <yingchao.deng@oss.qualcomm.com>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>,
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
Message-ID: <20251203182944.GG724103@e132581.arm.com>
References: <20251202-extended_cti-v6-0-ab68bb15c4f5@oss.qualcomm.com>
 <20251202-extended_cti-v6-2-ab68bb15c4f5@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251202-extended_cti-v6-2-ab68bb15c4f5@oss.qualcomm.com>

On Tue, Dec 02, 2025 at 02:42:21PM +0800, Yingchao Deng wrote:
> The QCOM extended CTI is a heavily parameterized version of ARM’s CSCTI.
> It allows a debugger to send to trigger events to a processor or to send
> a trigger event to one or more processors when a trigger event occurs
> on another processor on the same SoC, or even between SoCs. Qualcomm CTI
> implementation differs from the standard CTI in the following aspects:
> 
> 1. The number of supported triggers is extended to 128.
> 2. Several register offsets differ from the CoreSight specification.

I apologize for my late review of this series.  For easier maintenance
later, I have several comments for register access.

[...]

> +static const u32 cti_normal_offset[] = {
> +	[INDEX_CTIINTACK]		= CTIINTACK,
> +	[INDEX_CTIAPPSET]		= CTIAPPSET,
> +	[INDEX_CTIAPPCLEAR]		= CTIAPPCLEAR,
> +	[INDEX_CTIAPPPULSE]		= CTIAPPPULSE,
> +	[INDEX_CTIINEN]			= CTIINEN(0),
> +	[INDEX_CTIOUTEN]		= CTIOUTEN(0),

I prefer to update the these two macros to CTIINENn and CTIOUTENn, as
later we will not use CTIINEN(n) and CTIOUTEN(n) anymore.

> +	[INDEX_CTITRIGINSTATUS]		= CTITRIGINSTATUS,
> +	[INDEX_CTITRIGOUTSTATUS]	= CTITRIGOUTSTATUS,
> +	[INDEX_CTICHINSTATUS]		= CTICHINSTATUS,
> +	[INDEX_CTICHOUTSTATUS]		= CTICHOUTSTATUS,
> +	[INDEX_CTIGATE]			= CTIGATE,
> +	[INDEX_ASICCTL]			= ASICCTL,
> +	[INDEX_ITCHINACK]		= ITCHINACK,
> +	[INDEX_ITTRIGINACK]		= ITTRIGINACK,
> +	[INDEX_ITCHOUT]			= ITCHOUT,
> +	[INDEX_ITTRIGOUT]		= ITTRIGOUT,
> +	[INDEX_ITCHOUTACK]		= ITCHOUTACK,
> +	[INDEX_ITTRIGOUTACK]		= ITTRIGOUTACK,
> +	[INDEX_ITCHIN]			= ITCHIN,
> +	[INDEX_ITTRIGIN]		= ITTRIGIN,
> +	[INDEX_ITCTRL]			= CORESIGHT_ITCTRL,
> +};
> +
> +static const u32 cti_extended_offset[] = {
> +	[INDEX_CTIINTACK]		= QCOM_CTIINTACK,
> +	[INDEX_CTIAPPSET]		= QCOM_CTIAPPSET,
> +	[INDEX_CTIAPPCLEAR]		= QCOM_CTIAPPCLEAR,
> +	[INDEX_CTIAPPPULSE]		= QCOM_CTIAPPPULSE,
> +	[INDEX_CTIINEN]			= QCOM_CTIINEN,
> +	[INDEX_CTIOUTEN]		= QCOM_CTIOUTEN,
> +	[INDEX_CTITRIGINSTATUS]		= QCOM_CTITRIGINSTATUS,
> +	[INDEX_CTITRIGOUTSTATUS]	= QCOM_CTITRIGOUTSTATUS,
> +	[INDEX_CTICHINSTATUS]		= QCOM_CTICHINSTATUS,
> +	[INDEX_CTICHOUTSTATUS]		= QCOM_CTICHOUTSTATUS,
> +	[INDEX_CTIGATE]			= QCOM_CTIGATE,
> +	[INDEX_ASICCTL]			= QCOM_ASICCTL,
> +	[INDEX_ITCHINACK]		= QCOM_ITCHINACK,
> +	[INDEX_ITTRIGINACK]		= QCOM_ITTRIGINACK,
> +	[INDEX_ITCHOUT]			= QCOM_ITCHOUT,
> +	[INDEX_ITTRIGOUT]		= QCOM_ITTRIGOUT,
> +	[INDEX_ITCHOUTACK]		= QCOM_ITCHOUTACK,
> +	[INDEX_ITTRIGOUTACK]		= QCOM_ITTRIGOUTACK,
> +	[INDEX_ITCHIN]			= QCOM_ITCHIN,
> +	[INDEX_ITTRIGIN]		= QCOM_ITTRIGIN,
> +	[INDEX_ITCTRL]			= CORESIGHT_ITCTRL,
> +};

I saw CTI registers are within 4KiB (0x1000), we can don't convert
standard regiserts and only convert to QCOM register based on the
standard ones.  So you can drop the cti_normal_offset strucuture and
only have a cti_reg_qcom_offset[] struct:

  static const u32 cti_extended_offset[] = {
  	[CTIINTACK]		= QCOM_CTIINTACK,
  	[CTIAPPSET]		= QCOM_CTIAPPSET,
  	[CTIAPPCLEAR]		= QCOM_CTIAPPCLEAR,
  	[CTIAPPPULSE]		= QCOM_CTIAPPPULSE,
  	[CTIINEN]		= QCOM_CTIINEN,
        ...
  };

Then you could create two helpers for register address:

    static void __iomem *cti_reg_addr_with_nr(struct cti_drvdata *drvdata,
                                              u32 reg, u32 nr)
    {
        /* convert to qcom specific offset */
        if (unlikely(drvdata->is_qcom_cti))
            reg = cti_extended_offset[reg];

        return drvdata->base + reg + sizeof(u32) * nr;
    }

    static void __iomem *cti_reg_addr(struct cti_drvdata *drvdata, u32 reg)
    {
        return cti_reg_addr_with_nr(drvdata, reg, 0);
    }

>  /*
>   * CTI devices can be associated with a PE, or be connected to CoreSight
> @@ -70,15 +119,16 @@ void cti_write_all_hw_regs(struct cti_drvdata *drvdata)
>  
>  	/* write the CTI trigger registers */
>  	for (i = 0; i < config->nr_trig_max; i++) {
> -		writel_relaxed(config->ctiinen[i], drvdata->base + CTIINEN(i));
> +		writel_relaxed(config->ctiinen[i],
> +			       drvdata->base + cti_offset(drvdata, INDEX_CTIINEN, i));

writel_relaxed(config->ctiinen[i],
               cti_reg_addr_with_nr(drvdata, CTIINENn, i));

And apply for the same cases below.

>  	/* other regs */
> -	writel_relaxed(config->ctigate, drvdata->base + CTIGATE);
> -	writel_relaxed(config->asicctl, drvdata->base + ASICCTL);
> -	writel_relaxed(config->ctiappset, drvdata->base + CTIAPPSET);
> +	writel_relaxed(config->ctigate, drvdata->base + cti_offset(drvdata, INDEX_CTIGATE, 0));

writel_relaxed(config->ctigate, cti_reg_addr(drvdata, CTIGATE));

And apply for the same cases below.

[...]

> @@ -394,8 +447,8 @@ int cti_channel_trig_op(struct device *dev, enum cti_chan_op op,
>  
>  	/* update the local register values */
>  	chan_bitmask = BIT(channel_idx);
> -	reg_offset = (direction == CTI_TRIG_IN ? CTIINEN(trigger_idx) :
> -		      CTIOUTEN(trigger_idx));
> +	reg_offset = (direction == CTI_TRIG_IN ? cti_offset(drvdata, INDEX_CTIINEN, trigger_idx) :
> +			cti_offset(drvdata, INDEX_CTIOUTEN, trigger_idx));

For readable, we can improve a bit with code alignment:

  reg_offset = (direction == CTI_TRIG_IN) ? cti_reg_addr_with_nr(drvdata, CTIINENn, trigger_idx) :
                                            cti_reg_addr_with_nr(drvdata, CTIOUTENn, trigger_idx);

[...]

> @@ -981,9 +1035,28 @@ static int cti_probe(struct amba_device *adev, const struct amba_id *id)
>  	drvdata->csdev_release = drvdata->csdev->dev.release;
>  	drvdata->csdev->dev.release = cti_device_release;
>  
> +	/* check architect value*/
> +	devarch = readl_relaxed(drvdata->base + CORESIGHT_DEVARCH);
> +	if (CTI_DEVARCH_ARCHITECT(devarch) == ARCHITECT_QCOM) {
> +		drvdata->subtype = QCOM_CTI;
> +		drvdata->offsets = cti_extended_offset;

As a result, we can only set the is_qcom_cti flag:

  drvdata->is_qcom_cti = true;

> +		/*
> +		 * QCOM CTI does not implement Claimtag functionality as
> +		 * per CoreSight specification, but its CLAIMSET register
> +		 * is incorrectly initialized to 0xF. This can mislead
> +		 * tools or drivers into thinking the component is claimed.
> +		 *
> +		 * Reset CLAIMSET to 0 to reflect that no claims are active.
> +		 */
> +		writel_relaxed(0, drvdata->base + CORESIGHT_CLAIMSET);

I am confused for this.  If QCOM CTI does not implement claim tag,
then what is the designed register at the offset CORESIGHT_CLAIMSET?

Should you bypass all claim tag related operations for QCOM CTI case?
(I don't see you touch anything for claim and declaim tags).

> +	} else {
> +		drvdata->subtype = ARM_STD_CTI;
> +		drvdata->offsets = cti_normal_offset;
> +	}
> +
>  	/* all done - dec pm refcount */
>  	pm_runtime_put(&adev->dev);
> -	dev_info(&drvdata->csdev->dev, "CTI initialized\n");
> +	dev_info(&drvdata->csdev->dev, "CTI initialized; subtype=%d\n", drvdata->subtype);

dev_info(&drvdata->csdev->dev, "%s CTI initialized\n",
         drvdata->is_qcom_cti ? "QCOM" : "");

>  	return 0;
>  
>  pm_release:
> diff --git a/drivers/hwtracing/coresight/coresight-cti-sysfs.c b/drivers/hwtracing/coresight/coresight-cti-sysfs.c
> index a9df77215141..12a495382999 100644
> --- a/drivers/hwtracing/coresight/coresight-cti-sysfs.c
> +++ b/drivers/hwtracing/coresight/coresight-cti-sysfs.c
> @@ -172,9 +172,8 @@ static struct attribute *coresight_cti_attrs[] = {
>  
>  /* register based attributes */
>  
> -/* Read registers with power check only (no enable check). */
> -static ssize_t coresight_cti_reg_show(struct device *dev,
> -			   struct device_attribute *attr, char *buf)
> +static ssize_t coresight_cti_mgmt_reg_show(struct device *dev,
> +					   struct device_attribute *attr, char *buf)
>  {
>  	struct cti_drvdata *drvdata = dev_get_drvdata(dev->parent);
>  	struct cs_off_attribute *cti_attr = container_of(attr, struct cs_off_attribute, attr);
> @@ -189,6 +188,40 @@ static ssize_t coresight_cti_reg_show(struct device *dev,
>  	return sysfs_emit(buf, "0x%x\n", val);
>  }
>  
> +/* Read registers with power check only (no enable check). */
> +static ssize_t coresight_cti_reg_show(struct device *dev,
> +				      struct device_attribute *attr, char *buf)
> +{
> +	struct cti_drvdata *drvdata = dev_get_drvdata(dev->parent);
> +	struct cs_off_attribute *cti_attr = container_of(attr, struct cs_off_attribute, attr);
> +	u32 idx, val = 0;
> +
> +	pm_runtime_get_sync(dev->parent);
> +	raw_spin_lock(&drvdata->spinlock);
> +	idx = drvdata->config.ext_reg_sel;
> +	if (drvdata->config.hw_powered) {
> +		switch (cti_attr->off) {
> +		case INDEX_CTITRIGINSTATUS:
> +		case INDEX_CTITRIGOUTSTATUS:
> +		case INDEX_ITTRIGINACK:
> +		case INDEX_ITTRIGOUT:
> +		case INDEX_ITTRIGOUTACK:
> +		case INDEX_ITTRIGIN:
> +			val = readl_relaxed(drvdata->base +
> +					    cti_offset(drvdata, cti_attr->off, idx));
> +			break;
> +
> +		default:
> +			val = readl_relaxed(drvdata->base + cti_offset(drvdata, cti_attr->off, 0));
> +			break;
> +		}
> +	}
> +
> +	raw_spin_unlock(&drvdata->spinlock);
> +	pm_runtime_put_sync(dev->parent);
> +	return sysfs_emit(buf, "0x%x\n", val);
> +}
> +
>  /* Write registers with power check only (no enable check). */
>  static __maybe_unused ssize_t coresight_cti_reg_store(struct device *dev,
>  						      struct device_attribute *attr,
> @@ -197,19 +230,39 @@ static __maybe_unused ssize_t coresight_cti_reg_store(struct device *dev,
>  	struct cti_drvdata *drvdata = dev_get_drvdata(dev->parent);
>  	struct cs_off_attribute *cti_attr = container_of(attr, struct cs_off_attribute, attr);
>  	unsigned long val = 0;
> +	u32 idx;
>  
>  	if (kstrtoul(buf, 0, &val))
>  		return -EINVAL;
>  
>  	pm_runtime_get_sync(dev->parent);
>  	raw_spin_lock(&drvdata->spinlock);
> -	if (drvdata->config.hw_powered)
> -		cti_write_single_reg(drvdata, cti_attr->off, val);
> +	idx = drvdata->config.ext_reg_sel;
> +	if (drvdata->config.hw_powered) {
> +		switch (cti_attr->off) {
> +		case INDEX_ITTRIGINACK:
> +		case INDEX_ITTRIGOUT:
> +			cti_write_single_reg(drvdata, cti_offset(drvdata, cti_attr->off, idx), val);
> +			break;
> +
> +		default:
> +			cti_write_single_reg(drvdata, cti_offset(drvdata, cti_attr->off, 0), val);
> +			break;
> +		}
> +	}

For both coresight_cti_reg_show() and coresight_cti_reg_store(), can
we always use "cti_attr->off" as the offset for regitser access?  I
mean we don't need the extra config.ext_reg_sel, eventually any
register we can calculate a offset for it.

>  	raw_spin_unlock(&drvdata->spinlock);
>  	pm_runtime_put_sync(dev->parent);
>  	return size;
>  }
>  
> +#define coresight_cti_mgmt_reg(name, offset)	                        \
> +	(&((struct cs_off_attribute[]) {                                \
> +	   {                                                            \
> +		__ATTR(name, 0444, coresight_cti_mgmt_reg_show, NULL),  \
> +		offset							\
> +	   }								\
> +	})[0].attr.attr)
> +
>  #define coresight_cti_reg(name, offset)					\
>  	(&((struct cs_off_attribute[]) {				\
>  	   {								\
> @@ -237,17 +290,17 @@ static __maybe_unused ssize_t coresight_cti_reg_store(struct device *dev,
>  
>  /* coresight management registers */
>  static struct attribute *coresight_cti_mgmt_attrs[] = {
> -	coresight_cti_reg(devaff0, CTIDEVAFF0),
> -	coresight_cti_reg(devaff1, CTIDEVAFF1),
> -	coresight_cti_reg(authstatus, CORESIGHT_AUTHSTATUS),
> -	coresight_cti_reg(devarch, CORESIGHT_DEVARCH),
> -	coresight_cti_reg(devid, CORESIGHT_DEVID),
> -	coresight_cti_reg(devtype, CORESIGHT_DEVTYPE),
> -	coresight_cti_reg(pidr0, CORESIGHT_PERIPHIDR0),
> -	coresight_cti_reg(pidr1, CORESIGHT_PERIPHIDR1),
> -	coresight_cti_reg(pidr2, CORESIGHT_PERIPHIDR2),
> -	coresight_cti_reg(pidr3, CORESIGHT_PERIPHIDR3),
> -	coresight_cti_reg(pidr4, CORESIGHT_PERIPHIDR4),
> +	coresight_cti_mgmt_reg(devaff0, CTIDEVAFF0),
> +	coresight_cti_mgmt_reg(devaff1, CTIDEVAFF1),
> +	coresight_cti_mgmt_reg(authstatus, CORESIGHT_AUTHSTATUS),
> +	coresight_cti_mgmt_reg(devarch, CORESIGHT_DEVARCH),
> +	coresight_cti_mgmt_reg(devid, CORESIGHT_DEVID),
> +	coresight_cti_mgmt_reg(devtype, CORESIGHT_DEVTYPE),
> +	coresight_cti_mgmt_reg(pidr0, CORESIGHT_PERIPHIDR0),
> +	coresight_cti_mgmt_reg(pidr1, CORESIGHT_PERIPHIDR1),
> +	coresight_cti_mgmt_reg(pidr2, CORESIGHT_PERIPHIDR2),
> +	coresight_cti_mgmt_reg(pidr3, CORESIGHT_PERIPHIDR3),
> +	coresight_cti_mgmt_reg(pidr4, CORESIGHT_PERIPHIDR4),

I don't see any benefit for updating from coresight_cti_reg() to
coresight_cti_mgmt_reg().  If really want to do this, should remove
the macro coresight_cti_reg()?

>  	NULL,
>  };
>  
> @@ -258,13 +311,15 @@ static struct attribute *coresight_cti_mgmt_attrs[] = {
>   * If inaccessible & pcached_val not NULL then show cached value.
>   */
>  static ssize_t cti_reg32_show(struct device *dev, char *buf,
> -			      u32 *pcached_val, int reg_offset)
> +			      u32 *pcached_val, int index)

We don't need to change anything for this.  The passed "reg_offset"
should be always a final offset, no matter for standard CTI or QCOM
case, the driver directly uses the offset for register access.

[...]

> +/*
> + * QCOM CTI supports up to 128 triggers, there are 6 registers need to be
> + * expanded to up to 4 instances, and ext_reg_sel can be used to indicate
> + * which one is in use.
> + * CTITRIGINSTATUS, CTITRIGOUTSTATUS,
> + * ITTRIGIN, ITTRIGOUT,
> + * ITTRIGINACK, ITTRIGOUTACK.
> + */
> +static ssize_t ext_reg_sel_show(struct device *dev,
> +				struct device_attribute *attr,
> +				char *buf)
> +{
> +	u32 val;
> +	struct cti_drvdata *drvdata = dev_get_drvdata(dev->parent);
> +
> +	raw_spin_lock(&drvdata->spinlock);
> +	val = drvdata->config.ext_reg_sel;
> +	raw_spin_unlock(&drvdata->spinlock);
> +	return sprintf(buf, "%d\n", val);
> +}
> +
> +static ssize_t ext_reg_sel_store(struct device *dev,
> +				 struct device_attribute *attr,
> +				 const char *buf, size_t size)
> +{
> +	unsigned long val;
> +	struct cti_drvdata *drvdata = dev_get_drvdata(dev->parent);
> +
> +	if (kstrtoul(buf, 0, &val))
> +		return -EINVAL;
> +	if (val > ((drvdata->config.nr_trig_max + 31) / 32 - 1))
> +		return -EINVAL;
> +
> +	raw_spin_lock(&drvdata->spinlock);
> +	drvdata->config.ext_reg_sel = val;
> +	raw_spin_unlock(&drvdata->spinlock);
> +	return size;
> +}

As said, I don't think the trigger register is any different from
other register access.  So the existed APIs would be sufficient.

As a result, we don't need to add two above functions.

Thanks,
Leo

