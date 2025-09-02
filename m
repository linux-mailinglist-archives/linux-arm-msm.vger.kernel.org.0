Return-Path: <linux-arm-msm+bounces-71513-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 44F84B3F8DB
	for <lists+linux-arm-msm@lfdr.de>; Tue,  2 Sep 2025 10:43:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 04F873A262C
	for <lists+linux-arm-msm@lfdr.de>; Tue,  2 Sep 2025 08:43:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E7BBC2E8DF6;
	Tue,  2 Sep 2025 08:38:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PFDANPdO"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B64E82E88AB;
	Tue,  2 Sep 2025 08:38:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756802300; cv=none; b=KTa+KnXYbK0Irr2ln4GgDd6ODkzl3awE1W/LxxD3E4sf7uSc8keapF7LYrGzAMaeqoNEGJdp8oPkcXXvH5wb3++Vh1FCnpnqqssoXlAAhwD6c1hB+S+nRaAi3KD9tDOVTVKHjHa4PQt+iO3e6rLYHp4E4yWP+Ay0VQb0k+flssc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756802300; c=relaxed/simple;
	bh=cwgdem8vKiy3CQWfL+x3RfkBewMyB5GZGIa1qsHXMvA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OZ0lJX7I93W60VSji9liJLvVKTf1kFpiUNw1sXuTuiGJILyuj8ZvORF4M4YQnGx+9FD0VNsHxRRBIM6BHKFpS/74P2tqT6/l5MLoTM34crxSlwh6F79UhLfiQqfqWC+Zkz6kQr8/2taJn8RFPom31uAptWWoKSD4tiD1NNltqJc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PFDANPdO; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8E4A9C4CEED;
	Tue,  2 Sep 2025 08:38:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756802300;
	bh=cwgdem8vKiy3CQWfL+x3RfkBewMyB5GZGIa1qsHXMvA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=PFDANPdOfM/p6ekHLq6Jii3ccHU1acIXj0R6wb64i4msjWG69qbfmknwHFYDn+zyB
	 ++YH9I+TQuN2lWV94irqkLV41WTKFBGuQkQHN5MQdpzuE+tK4n7XKLdebD5EruXb2N
	 DnnZyVrXpKN58+coVl2Z96jFS9JFHxIrsALLv3sloFD3EU/YW12S3VMspOAyBK8IZB
	 0tvIEqmD/YEVVS2eAmdN8aPITuVbH6BUyJ29Ic11H0V5njSxvIa/rpv2knFda1t1PD
	 mtnWMpiGlo7i4v4Utq0k1n45ZGblI4avZEl4WjlCwlUwOup6Keqk00A88ZS7+FA2Zi
	 8vShVMqDcwefQ==
Date: Tue, 2 Sep 2025 10:38:17 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, vkoul@kernel.org, 
	conor+dt@kernel.org, srini@kernel.org, yung-chuan.liao@linux.intel.com, 
	pierre-louis.bossart@linux.dev, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-sound@vger.kernel.org
Subject: Re: [PATCH 4/7] soundwire: qcom: deprecate qcom,din/out-ports
Message-ID: <20250902-light-vegan-snake-efe03c@kuoka>
References: <20250901195037.47156-1-srinivas.kandagatla@oss.qualcomm.com>
 <20250901195037.47156-5-srinivas.kandagatla@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250901195037.47156-5-srinivas.kandagatla@oss.qualcomm.com>

On Mon, Sep 01, 2025 at 08:50:34PM +0100, Srinivas Kandagatla wrote:
> Number of input and output ports can be dynamically read from the
> controller registers, getting this value from Device Tree is redundant
> and potentially lead to bugs.
> 
> Remove the code parsing this property along with marking this as
> deprecated in device tree bindings.
> 
> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
> ---
>  drivers/soundwire/qcom.c | 134 ++++++++++++++-------------------------
>  1 file changed, 49 insertions(+), 85 deletions(-)
> 
> diff --git a/drivers/soundwire/qcom.c b/drivers/soundwire/qcom.c
> index 7f19ebba6137..4fa3e1c080ef 100644
> --- a/drivers/soundwire/qcom.c
> +++ b/drivers/soundwire/qcom.c
> @@ -128,7 +128,6 @@
>  #define MAX_FREQ_NUM						1
>  #define TIMEOUT_MS						100
>  #define QCOM_SWRM_MAX_RD_LEN					0x1
> -#define QCOM_SDW_MAX_PORTS					14
>  #define DEFAULT_CLK_FREQ					9600000
>  #define SWRM_MAX_DAIS						0xF
>  #define SWR_INVALID_PARAM					0xFF
> @@ -195,6 +194,7 @@ struct qcom_swrm_ctrl {
>  	int wake_irq;
>  	int num_din_ports;
>  	int num_dout_ports;
> +	int nports;
>  	int cols_index;
>  	int rows_index;
>  	unsigned long port_mask;
> @@ -202,7 +202,7 @@ struct qcom_swrm_ctrl {
>  	u8 rcmd_id;
>  	u8 wcmd_id;
>  	/* Port numbers are 1 - 14 */
> -	struct qcom_swrm_port_config pconfig[QCOM_SDW_MAX_PORTS + 1];
> +	struct qcom_swrm_port_config *pconfig;
>  	struct sdw_stream_runtime *sruntime[SWRM_MAX_DAIS];
>  	enum sdw_slave_status status[SDW_MAX_DEVICES + 1];
>  	int (*reg_read)(struct qcom_swrm_ctrl *ctrl, int reg, u32 *val);
> @@ -1157,7 +1157,7 @@ static int qcom_swrm_stream_alloc_ports(struct qcom_swrm_ctrl *ctrl,
>  				       struct snd_pcm_hw_params *params,
>  				       int direction)
>  {
> -	struct sdw_port_config pconfig[QCOM_SDW_MAX_PORTS];
> +	struct sdw_port_config *pconfig __free(kfree) = NULL;

That's incorrect usage of __free(), missing constructor.

>  	struct sdw_stream_config sconfig;
>  	struct sdw_master_runtime *m_rt;
>  	struct sdw_slave_runtime *s_rt;
> @@ -1167,6 +1167,10 @@ static int qcom_swrm_stream_alloc_ports(struct qcom_swrm_ctrl *ctrl,
>  	int maxport, pn, nports = 0, ret = 0;
>  	unsigned int m_port;
>  
> +	pconfig = kcalloc(ctrl->nports, sizeof(*pconfig), GFP_KERNEL);

This almost always goes to definition and I do not see anything
preventing it.

> +	if (!pconfig)
> +		return -ENOMEM;

Best regards,
Krzysztof


