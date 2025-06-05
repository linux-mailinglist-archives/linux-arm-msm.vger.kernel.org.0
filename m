Return-Path: <linux-arm-msm+bounces-60417-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id BC5FDACF8DB
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Jun 2025 22:37:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0E765189157F
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Jun 2025 20:38:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 30E3E27CCCD;
	Thu,  5 Jun 2025 20:37:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JP0l33FF"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0042D204F93;
	Thu,  5 Jun 2025 20:37:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749155875; cv=none; b=kooOQvZw2dnZbo1+BeLKsQbGQ02D8FBsxp9FxaeSI6d+9foBZZjK8GWlB6qHU65nfvb2AQnhAKjwU+TTqU5z6gcFoQhQKEgTgHvT7MKqe5513mhkl2YiPTB9f/sP0cSiBz+R8XNdDnb4IxrG0VlNjicELuzEDIL3uvyH1IpgVmM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749155875; c=relaxed/simple;
	bh=/EO1QHiyOJtBSf3NdtfcrnrpbEQOPFXMtGZoBdUrDlg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IYsJXOvSMWc+E/ohQ5GkCjePv/ippSfBhAd/PTe6aZWZJhMfAw2v9IpqSaDrhsJtnzh9KnLuXIEc6vrKL9W5SymBcj0s/szr1qhBpIzfWz7SrAAKfI9mhmqg9ZrMsKpocbqF7iTCH2vqy4ugLMtEwgXa4BTdcGyW2nL4yEgtKvI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JP0l33FF; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DDDAEC4CEE7;
	Thu,  5 Jun 2025 20:37:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749155873;
	bh=/EO1QHiyOJtBSf3NdtfcrnrpbEQOPFXMtGZoBdUrDlg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=JP0l33FFvErl28FgPd5Q65rS8HuiKt+YgJcIIfu710ztGjdqLFjoodEBhhWwYncx5
	 wo6tjduEB0DkUYjozNY3WfXBhhqI40ngSLoDr67Ts3TPdCfRVKGW6CrwniPB9lBPXw
	 iB0ytNe0k9St3tCi1QFUHFiQgIkoQ+aLPllxtkcHoFu6fTsTGZTMXMTe9bJf978916
	 fnVIEYST5Ma2nUv67EH6cijZDmdgM4+Ye8EehbXCQJyRiJDTMBQPDD2YdANVlJzfgn
	 Z0saDOBhTP5MMzrQz85CR/go/H/fJQ02oio5d5WJ5WaKWlqBSW47X1noJkuMiHEn9E
	 w7g6SICGC7UYw==
Date: Thu, 5 Jun 2025 15:37:50 -0500
From: Bjorn Andersson <andersson@kernel.org>
To: Wasim Nazir <quic_wasimn@quicinc.com>
Cc: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>, 
	Mathieu Poirier <mathieu.poirier@linaro.org>, linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] remoteproc: qcom: pas: Conclude the rename from adsp
Message-ID: <xbwizyrcst5jdpxfrsx7ghbph6ctf2il6yc2d7aveptifiydzs@mpniighbwanu>
References: <20250605-pas-rename-v1-1-900b770d666c@oss.qualcomm.com>
 <aEHAztFldxeu8Pnu@hu-wasimn-hyd.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aEHAztFldxeu8Pnu@hu-wasimn-hyd.qualcomm.com>

On Thu, Jun 05, 2025 at 09:37:42PM +0530, Wasim Nazir wrote:
> On Thu, Jun 05, 2025 at 10:23:51AM -0500, Bjorn Andersson wrote:
> > The change that renamed the driver from "adsp" to "pas" didn't change
> > any of the implementation. The result is an aesthetic eyesore, and
> > confusing to many.
> > 
> > Conclude the rename of the driver, by updating function, structures and
> > variable names to match what the driver actually is. The "Hexagon v5" is
> > also dropped from the name and Kconfig, as this isn't correct either.
> > 
> > No functional change.
> > 
> > Fixes: 9e004f97161d ("remoteproc: qcom: Rename Hexagon v5 PAS driver")
> > Signed-off-by: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
> > ---
> >  drivers/remoteproc/Kconfig          |  11 +-
> >  drivers/remoteproc/qcom_q6v5_adsp.c |  46 +--
> >  drivers/remoteproc/qcom_q6v5_pas.c  | 617 ++++++++++++++++++------------------
> >  3 files changed, 334 insertions(+), 340 deletions(-)
> > 
> > diff --git a/drivers/remoteproc/Kconfig b/drivers/remoteproc/Kconfig
> > index 83962a114dc9fdb3260e6e922602f2da53106265..4a1e469acaf139334686af1eb962ce9420c6ddb1 100644
> > --- a/drivers/remoteproc/Kconfig
> > +++ b/drivers/remoteproc/Kconfig
> > @@ -214,7 +214,7 @@ config QCOM_Q6V5_MSS
> >  	  handled by QCOM_Q6V5_PAS driver.
> >  
> >  config QCOM_Q6V5_PAS
> > -	tristate "Qualcomm Hexagon v5 Peripheral Authentication Service support"
> > +	tristate "Qualcomm Peripheral Authentication Service support"
> >  	depends on OF && ARCH_QCOM
> >  	depends on QCOM_SMEM
> >  	depends on RPMSG_QCOM_SMD || RPMSG_QCOM_SMD=n
> > @@ -229,11 +229,10 @@ config QCOM_Q6V5_PAS
> >  	select QCOM_RPROC_COMMON
> >  	select QCOM_SCM
> >  	help
> > -	  Say y here to support the TrustZone based Peripheral Image Loader
> > -	  for the Qualcomm Hexagon v5 based remote processors. This is commonly
> > -	  used to control subsystems such as ADSP (Audio DSP),
> > -	  CDSP (Compute DSP), MPSS (Modem Peripheral SubSystem), and
> > -	  SLPI (Sensor Low Power Island).
> > +	  Say y here to support the TrustZone based Peripheral Image Loader for
> > +	  the Qualcomm based remote processors. This is commonly used to
> 
> Maybe "Qualcomm remote processors"?
> 

That sounds better, thanks.

> > +	  control subsystems such as ADSP (Audio DSP), CDSP (Compute DSP), MPSS
> > +	  (Modem Peripheral SubSystem), and SLPI (Sensor Low Power Island).
> >  
> >  config QCOM_Q6V5_WCSS
> >  	tristate "Qualcomm Hexagon based WCSS Peripheral Image Loader"
> > diff --git a/drivers/remoteproc/qcom_q6v5_adsp.c b/drivers/remoteproc/qcom_q6v5_adsp.c
> > index 94af77baa7a1c5096f0663260c07a297c6bedd17..613826e0d7eff1712ca31ea102adef4f62d10f38 100644
> > --- a/drivers/remoteproc/qcom_q6v5_adsp.c
> > +++ b/drivers/remoteproc/qcom_q6v5_adsp.c
> > @@ -77,7 +77,7 @@ struct adsp_pil_data {
> >  	const char *load_state;
> >  };
> >  
> > -struct qcom_adsp {
> > +struct qcom_pas {
> 
> Any reason to change in this file?
> 

Wow, no of course not. I asked my editor to rename the symbols and
missed the fact that it changed the names of the symbols in both files,
that's weird.

Thank you for spotting that.

[..]
> > diff --git a/drivers/remoteproc/qcom_q6v5_pas.c b/drivers/remoteproc/qcom_q6v5_pas.c
> > index b306f223127c452f8f2d85aa0fc98db2d684feae..b0fc372ff0a9e032d784b1a4403ffeea5d0f9a00 100644
> > --- a/drivers/remoteproc/qcom_q6v5_pas.c
> > +++ b/drivers/remoteproc/qcom_q6v5_pas.c
> > @@ -1,6 +1,6 @@
> >  // SPDX-License-Identifier: GPL-2.0-only
> >  /*
> > - * Qualcomm ADSP/SLPI Peripheral Image Loader for MSM8974 and MSM8996
> > + * Qualcomm Peripahal Authentication Service remoteproc driver
> >   *
> >   * Copyright (C) 2016 Linaro Ltd
> >   * Copyright (C) 2014 Sony Mobile Communications AB
> > @@ -35,7 +35,7 @@
> >  
> >  #define MAX_ASSIGN_COUNT 3
> >  
> > -struct adsp_data {
> > +struct qcom_pas_data {
> >  	int crash_reason_smem;
> >  	const char *firmware_name;
> >  	const char *dtb_firmware_name;
> > @@ -60,7 +60,7 @@ struct adsp_data {
> >  	int region_assign_vmid;
> >  };
> >  
> > -struct qcom_adsp {
> > +struct qcom_pas {
> >  	struct device *dev;
> >  	struct rproc *rproc;
> >  
> > @@ -119,36 +119,37 @@ struct qcom_adsp {
> >  	struct qcom_scm_pas_metadata dtb_pas_metadata;
> >  };
> >  
> > -static void adsp_segment_dump(struct rproc *rproc, struct rproc_dump_segment *segment,
> > -		       void *dest, size_t offset, size_t size)
> > +static void qcom_pas_segment_dump(struct rproc *rproc,
> > +				  struct rproc_dump_segment *segment,
> > +				  void *dest, size_t offset, size_t size)
> >  {
> > -	struct qcom_adsp *adsp = rproc->priv;
> > +	struct qcom_pas *pas = rproc->priv;
> >  	int total_offset;
> >  
> > -	total_offset = segment->da + segment->offset + offset - adsp->mem_phys;
> > -	if (total_offset < 0 || total_offset + size > adsp->mem_size) {
> > -		dev_err(adsp->dev,
> > +	total_offset = segment->da + segment->offset + offset - pas->mem_phys;
> > +	if (total_offset < 0 || total_offset + size > pas->mem_size) {
> > +		dev_err(pas->dev,
> >  			"invalid copy request for segment %pad with offset %zu and size %zu)\n",
> >  			&segment->da, offset, size);
> >  		memset(dest, 0xff, size);
> >  		return;
> >  	}
> >  
> > -	memcpy_fromio(dest, adsp->mem_region + total_offset, size);
> > +	memcpy_fromio(dest, pas->mem_region + total_offset, size);
> >  }
> >  
> > -static void adsp_minidump(struct rproc *rproc)
> > +static void qcom_pas_minidump(struct rproc *rproc)
> >  {
> > -	struct qcom_adsp *adsp = rproc->priv;
> > +	struct qcom_pas *pas = rproc->priv;
> >  
> >  	if (rproc->dump_conf == RPROC_COREDUMP_DISABLED)
> >  		return;
> >  
> > -	qcom_minidump(rproc, adsp->minidump_id, adsp_segment_dump);
> > +	qcom_minidump(rproc, pas->minidump_id, qcom_pas_segment_dump);
> >  }
> >  
> > -static int adsp_pds_enable(struct qcom_adsp *adsp, struct device **pds,
> > -			   size_t pd_count)
> > +static int qcom_pas_pds_enable(struct qcom_pas *pas, struct device **pds,
> > +			       size_t pd_count)
> >  {
> >  	int ret;
> >  	int i;
> > @@ -174,8 +175,8 @@ static int adsp_pds_enable(struct qcom_adsp *adsp, struct device **pds,
> >  	return ret;
> >  };
> >  
> > -static void adsp_pds_disable(struct qcom_adsp *adsp, struct device **pds,
> > -			     size_t pd_count)
> > +static void qcom_pas_pds_disable(struct qcom_pas *pas, struct device **pds,
> > +				 size_t pd_count)
> >  {
> >  	int i;
> >  
> > @@ -185,65 +186,65 @@ static void adsp_pds_disable(struct qcom_adsp *adsp, struct device **pds,
> >  	}
> >  }
> >  
> > -static int adsp_shutdown_poll_decrypt(struct qcom_adsp *adsp)
> > +static int qcom_pas_shutdown_poll_decrypt(struct qcom_pas *pas)
> >  {
> >  	unsigned int retry_num = 50;
> >  	int ret;
> >  
> >  	do {
> >  		msleep(ADSP_DECRYPT_SHUTDOWN_DELAY_MS);
> 
> Do you want to change the macro too?
> 

That would make sense, thanks for spotting that!

> > -		ret = qcom_scm_pas_shutdown(adsp->pas_id);
> > +		ret = qcom_scm_pas_shutdown(pas->pas_id);
> >  	} while (ret == -EINVAL && --retry_num);
> >  
> >  	return ret;
> >  }
> >  
> > -static int adsp_unprepare(struct rproc *rproc)
> > +static int qcom_pas_unprepare(struct rproc *rproc)
> >  {
> > -	struct qcom_adsp *adsp = rproc->priv;
> > +	struct qcom_pas *pas = rproc->priv;
> >  
> >  	/*
> > -	 * adsp_load() did pass pas_metadata to the SCM driver for storing
> > +	 * pas_load() did pass pas_metadata to the SCM driver for storing
> 
> Don't see pas_load() API in this file. Please check if you are referring to
> qcom_pas_load().
> 

Yes, I refer to the qcom_pas_load().

[..]
> > -static int adsp_pds_attach(struct device *dev, struct device **devs,
> > -			   char **pd_names)
> > +static int qcom_pas_pds_attach(struct device *dev, struct device **devs, char **pd_names)
> 
> Can you check the indentation to 80 characters?
> 

We prefer 80 characters, but we allow up to 100 if it makes the code
cleaner. So not breaking this line was intentional...

> >  {
> >  	size_t num_pds = 0;
> >  	int ret;
> > @@ -528,10 +527,9 @@ static int adsp_pds_attach(struct device *dev, struct device **devs,
> >  	return ret;
> >  };
> >  
> > -static void adsp_pds_detach(struct qcom_adsp *adsp, struct device **pds,
> > -			    size_t pd_count)
> > +static void qcom_pas_pds_detach(struct qcom_pas *pas, struct device **pds, size_t pd_count)
> 
> Same indentation needed here.
> 

91 characters here, and I find it looks better given the "logical"
relation between pds and pd_count otherwise being split across two
lines.


Many thanks for the review, Wasim!

Regards,
Bjorn

