Return-Path: <linux-arm-msm+bounces-20521-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A8C38CF7FC
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 May 2024 05:11:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 18AAB1F2163A
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 May 2024 03:11:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DFDBC1FBA;
	Mon, 27 May 2024 03:11:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="X2aK+GHx"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5307DDA5;
	Mon, 27 May 2024 03:11:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716779507; cv=none; b=QtLEwqfbkXohVf2lzzI9s7LOqYE/hIpK3Rd4eT3dZ+8wC+jgXYf0FKk4KAHPH1s+Ht3gAYyP/RhRE9MWWjULdUSQWFEU+FVjDbAqjwma2Zfho/MLM1CSEyN6+gmuVTs20TymVkA8SzBTjgo2UZ4jKnXGWbxjap455GZMiFPqRzg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716779507; c=relaxed/simple;
	bh=MRV95ptO8M8/LH3xJMcdozG2tVt7MtaRVLIZ99obl+s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZKm30GAcitz04H+VXPa2BDymVxmGxIi4Cd7Dx+Z7oYoVXfirmH2vQFtCUjgLhybQtE6xm70q1o0iypbRUJTN4SfMGGel6z+de0mqo7z0JGQabskRX7uPBJj10CqrJ/E8HXifsNRxRPmscFSI2iv7Dqc9WjpODh+yyqotV3vwYzU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=X2aK+GHx; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6DCF8C2BD10;
	Mon, 27 May 2024 03:11:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1716779507;
	bh=MRV95ptO8M8/LH3xJMcdozG2tVt7MtaRVLIZ99obl+s=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=X2aK+GHx2No830rQwQ9WBmzzlYbvWzJy9R3e5c/Ybb6vpwAQ6WmWfQjJjxzdlm1xj
	 1hqe2CFWLcIP4jgYxSpkIPgjGEx3rdP2YFyRM0geHEMi+KGK2xUA+AjRWYLICHNgyB
	 h5hIXwVek1uEmfoJeYTDhWSi9dR+WhaddDSL6sCRL46G3uwJ9d+C+ZZMWdUEn6AeR3
	 OliQnhZNkg3O5OQfOn0X6qmaCxOj1ZLjFyUNv1cYLacimreEviviavzIbXkRd0tw89
	 ikLHBVSuWEJjF3/288YG7UMujOGVB4M+Cq+NK1kM00V4msfFEc3b/+Y6qErHFNplgH
	 6G4MMyyYOnBVA==
Date: Sun, 26 May 2024 22:11:44 -0500
From: Bjorn Andersson <andersson@kernel.org>
To: Unnathi Chalicheemala <quic_uchalich@quicinc.com>
Cc: Konrad Dybcio <konrad.dybcio@linaro.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
	Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, kernel@quicinc.com, Bjorn Andersson <quic_bjorande@quicinc.com>
Subject: Re: [PATCH v5 2/5] soc: qcom: llcc: Add regmap for Broadcast_AND
 region
Message-ID: <xykcsrfq7mpu7fkjvvhfcew2x2522xmq6poua5utcn2uu5h5ub@j45xpqkedgwa>
References: <cover.1716228054.git.quic_uchalich@quicinc.com>
 <2c7654492ee436b41acddf2edc65d6722c3ad6aa.1716228054.git.quic_uchalich@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2c7654492ee436b41acddf2edc65d6722c3ad6aa.1716228054.git.quic_uchalich@quicinc.com>

On Mon, May 20, 2024 at 02:00:14PM GMT, Unnathi Chalicheemala wrote:
> Define new regmap structure for Broadcast_AND region and initialize
> this regmap when HW block version is greater than 4.1, otherwise
> initialize as a NULL pointer for backwards compatibility.
> 
> Switch from broadcast_OR to broadcast_AND region (when defined in DT)
> for checking status bit 1 as Broadcast_OR region checks only for bit 0.
> 

This is a good technical description of the change you're making. But
it's been long enough since we discussed this that I've forgotten which
problem it solves, and the commit message doesn't tell me.

Please add a paragraph on the top describing the actual problem this
solves?

Regards,
Bjorn

> Signed-off-by: Unnathi Chalicheemala <quic_uchalich@quicinc.com>
> Reviewed-by: Bjorn Andersson <quic_bjorande@quicinc.com>
> ---
>  drivers/soc/qcom/llcc-qcom.c       | 16 +++++++++++++++-
>  include/linux/soc/qcom/llcc-qcom.h |  4 +++-
>  2 files changed, 18 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/soc/qcom/llcc-qcom.c b/drivers/soc/qcom/llcc-qcom.c
> index cbef0dea1d5d..5eac6aa567e7 100644
> --- a/drivers/soc/qcom/llcc-qcom.c
> +++ b/drivers/soc/qcom/llcc-qcom.c
> @@ -821,6 +821,7 @@ EXPORT_SYMBOL_GPL(llcc_slice_putd);
>  static int llcc_update_act_ctrl(u32 sid,
>  				u32 act_ctrl_reg_val, u32 status)
>  {
> +	struct regmap *regmap;
>  	u32 act_ctrl_reg;
>  	u32 act_clear_reg;
>  	u32 status_reg;
> @@ -849,7 +850,8 @@ static int llcc_update_act_ctrl(u32 sid,
>  		return ret;
>  
>  	if (drv_data->version >= LLCC_VERSION_4_1_0_0) {
> -		ret = regmap_read_poll_timeout(drv_data->bcast_regmap, status_reg,
> +		regmap = drv_data->bcast_and_regmap ?: drv_data->bcast_regmap;
> +		ret = regmap_read_poll_timeout(regmap, status_reg,
>  				      slice_status, (slice_status & ACT_COMPLETE),
>  				      0, LLCC_STATUS_READ_DELAY);
>  		if (ret)
> @@ -1284,6 +1286,18 @@ static int qcom_llcc_probe(struct platform_device *pdev)
>  
>  	drv_data->version = version;
>  
> +	/* Applicable only when drv_data->version >= 4.1 */
> +	if (drv_data->version >= LLCC_VERSION_4_1_0_0) {
> +		drv_data->bcast_and_regmap = qcom_llcc_init_mmio(pdev, i + 1, "llcc_broadcast_and_base");
> +		if (IS_ERR(drv_data->bcast_and_regmap)) {
> +			ret = PTR_ERR(drv_data->bcast_and_regmap);
> +			if (ret == -EINVAL)
> +				drv_data->bcast_and_regmap = NULL;
> +			else
> +				goto err;
> +		}
> +	}
> +
>  	llcc_cfg = cfg->sct_data;
>  	sz = cfg->size;
>  
> diff --git a/include/linux/soc/qcom/llcc-qcom.h b/include/linux/soc/qcom/llcc-qcom.h
> index 1a886666bbb6..9e9f528b1370 100644
> --- a/include/linux/soc/qcom/llcc-qcom.h
> +++ b/include/linux/soc/qcom/llcc-qcom.h
> @@ -115,7 +115,8 @@ struct llcc_edac_reg_offset {
>  /**
>   * struct llcc_drv_data - Data associated with the llcc driver
>   * @regmaps: regmaps associated with the llcc device
> - * @bcast_regmap: regmap associated with llcc broadcast offset
> + * @bcast_regmap: regmap associated with llcc broadcast OR offset
> + * @bcast_and_regmap: regmap associated with llcc broadcast AND offset
>   * @cfg: pointer to the data structure for slice configuration
>   * @edac_reg_offset: Offset of the LLCC EDAC registers
>   * @lock: mutex associated with each slice
> @@ -129,6 +130,7 @@ struct llcc_edac_reg_offset {
>  struct llcc_drv_data {
>  	struct regmap **regmaps;
>  	struct regmap *bcast_regmap;
> +	struct regmap *bcast_and_regmap;
>  	const struct llcc_slice_config *cfg;
>  	const struct llcc_edac_reg_offset *edac_reg_offset;
>  	struct mutex lock;
> -- 
> 2.34.1
> 

