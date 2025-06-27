Return-Path: <linux-arm-msm+bounces-62863-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AEF5EAEBE8F
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Jun 2025 19:47:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D4DED4A7D1B
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Jun 2025 17:47:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DD5E72E9ED4;
	Fri, 27 Jun 2025 17:46:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="K8WOH50W"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B05FC38DF9;
	Fri, 27 Jun 2025 17:46:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751046419; cv=none; b=f6Clcbt5sjFnuJ8g9UqCRpq1ZZVb4GnEYafNcZ2LqTLCdTEvS3GqzGJWfsQVhyrXSEFUKaSVgHXE/SyeVzjl911/jruaFXctPG/JqofUZVRHh82ec42TGkD6wrA2JMEAOWjXIR9nRBJEqbjQDvutVD1y00Knv3G0rbVh0rvMii4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751046419; c=relaxed/simple;
	bh=834LtEDDKmSJjQzk82TMIFq6V2flBM6uUKKjUnRC5r4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NWmITPnw0ZxraJhRmkaM+itBilPlHKLsjmnN4gk+d44yfsTdL59LZdRArDC0fb2Vs5MuhFL/Fcp9reFYQS8YOwBU1nzVcFqb7QmTya/N9MGmhEKery8N5LdpV4+urEeQuFsV4NoCxh227QxthO54luc1liu4x3UJAPEUW9zU3Vs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=K8WOH50W; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1B5BDC4CEE3;
	Fri, 27 Jun 2025 17:46:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751046419;
	bh=834LtEDDKmSJjQzk82TMIFq6V2flBM6uUKKjUnRC5r4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=K8WOH50W226cAG8yh101MReBaS0kxcmuk6tb3FXa8IGpKPAT8qLaThlDmdgww8Mi1
	 KKjW/88AdBaQSo933UN9uoLqap1BWIVOFLa+xLbB5OxxXy5jcvi6AtjSrTMLCbyDFf
	 PLrtWm/rT1ZDbYT2WmQx/LxJmqemJfspgvnn0etju8SNcV8zBbpr4M9cz4pXtzppKO
	 qEZqe530TgIWsaRmxiBLqWQ9orKqjOq0GxDqZmLX6exil5klt7ozsnPVzWz9iD51iD
	 OFbyeFdManIJw/jmEri40jKgngZhfEJKTarp+DakNaqGSvv8XFIXFe3fNTtWESqlug
	 hiUVTxejSJIRg==
Date: Fri, 27 Jun 2025 10:46:58 -0700
From: Vinod Koul <vkoul@kernel.org>
To: srinivas.kandagatla@oss.qualcomm.com
Cc: broonie@kernel.org, yung-chuan.liao@linux.intel.com,
	pierre-louis.bossart@linux.dev, lgirdwood@gmail.com, perex@perex.cz,
	tiwai@suse.com, krzysztof.kozlowski@linaro.org,
	linux-kernel@vger.kernel.org, linux-sound@vger.kernel.org,
	linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH 1/4] soundwire: bus: add of_sdw_find_device_by_node helper
Message-ID: <aF7ZEi9qQxshnWed@vaman>
References: <20250627155103.441547-1-srinivas.kandagatla@oss.qualcomm.com>
 <20250627155103.441547-2-srinivas.kandagatla@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250627155103.441547-2-srinivas.kandagatla@oss.qualcomm.com>

On 27-06-25, 16:51, srinivas.kandagatla@oss.qualcomm.com wrote:
> From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
> 
> There has been more than 3 instances of this helper in multiple codec
> drivers, it does not make sense to keep duplicating this part of code.
> 
> Lets add a helper of_sdw_find_device_by_node for codec drivers to use it.
> 
> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
> ---
>  drivers/soundwire/slave.c     | 6 ++++++
>  include/linux/soundwire/sdw.h | 9 +++++++++
>  2 files changed, 15 insertions(+)
> 
> diff --git a/drivers/soundwire/slave.c b/drivers/soundwire/slave.c
> index d2d99555ec5a..3d4d00188c26 100644
> --- a/drivers/soundwire/slave.c
> +++ b/drivers/soundwire/slave.c
> @@ -273,4 +273,10 @@ int sdw_of_find_slaves(struct sdw_bus *bus)
>  	return 0;
>  }
>  
> +struct device *of_sdw_find_device_by_node(struct device_node *np)
> +{
> +	return bus_find_device_by_of_node(&sdw_bus_type, np);
> +}
> +EXPORT_SYMBOL_GPL(of_sdw_find_device_by_node);

Helper for single code lines?? why!

> +
>  MODULE_IMPORT_NS("SND_SOC_SDCA");
> diff --git a/include/linux/soundwire/sdw.h b/include/linux/soundwire/sdw.h
> index 2362f621d94c..84d1a101b155 100644
> --- a/include/linux/soundwire/sdw.h
> +++ b/include/linux/soundwire/sdw.h
> @@ -18,6 +18,7 @@
>  
>  struct dentry;
>  struct fwnode_handle;
> +struct device_node;
>  
>  struct sdw_bus;
>  struct sdw_slave;
> @@ -1080,6 +1081,8 @@ int sdw_stream_add_slave(struct sdw_slave *slave,
>  int sdw_stream_remove_slave(struct sdw_slave *slave,
>  			    struct sdw_stream_runtime *stream);
>  
> +struct device *of_sdw_find_device_by_node(struct device_node *np);
> +
>  int sdw_slave_get_scale_index(struct sdw_slave *slave, u8 *base);
>  
>  /* messaging and data APIs */
> @@ -1113,6 +1116,12 @@ static inline int sdw_stream_remove_slave(struct sdw_slave *slave,
>  	return -EINVAL;
>  }
>  
> +static inline struct device *of_sdw_find_device_by_node(struct device_node *np)
> +{
> +	WARN_ONCE(1, "SoundWire API is disabled");
> +	return NULL;
> +}
> +
>  /* messaging and data APIs */
>  static inline int sdw_read(struct sdw_slave *slave, u32 addr)
>  {
> -- 
> 2.49.0

-- 
~Vinod

