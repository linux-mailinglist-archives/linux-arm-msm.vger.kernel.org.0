Return-Path: <linux-arm-msm+bounces-75928-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 1408ABB7950
	for <lists+linux-arm-msm@lfdr.de>; Fri, 03 Oct 2025 18:40:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C2552486572
	for <lists+linux-arm-msm@lfdr.de>; Fri,  3 Oct 2025 16:40:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 19BA11DF25C;
	Fri,  3 Oct 2025 16:40:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="T/FClGFd"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E18CE8F7D;
	Fri,  3 Oct 2025 16:40:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759509645; cv=none; b=bSCSLtyk82S1GmWy8qcjzrgUcoUkAdj0Hgdr/fPUWoR45t6pQRef4Ix8EufNi71OxfGkTYXS1uVWwSEwy5NVXrKZKCERAKlVP9++cjVfchs2jFSFneaRrlsoK/sINnlKoHfs/U80/jfoVO3pdEJNKbAVav6JErc7pnP0SUpOIcg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759509645; c=relaxed/simple;
	bh=a2RJsRNvoQXmDM1APniRUrNGrMrUzVW1Yh2uxqK1iqU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=N8hvX6LiSg9uF8MJEYtwSsIv68++KI9S+uSBCSa4XQrQzp+y4gEhXFHoI90ZW3CFEeiXwzt4GR38xjaJj9Zs+sDyMfYPwmnore3G0JHUV9xsCNb2OkbyM5f6EMIfim5+e4hPtqL8d53zWxoWUgW7D9rGfWiHBritgjelH8W3/nQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=T/FClGFd; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6691DC4CEF5;
	Fri,  3 Oct 2025 16:40:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1759509644;
	bh=a2RJsRNvoQXmDM1APniRUrNGrMrUzVW1Yh2uxqK1iqU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=T/FClGFdRG4WSjCh24oKaZiusXreRaQ6j1IEdcuwsl1Am9oCBnI6YLMy0+AJ3ZdJE
	 Cc/pZVPkjNPodXezWEiswiKU0VMeUhQHsIe+y7aPZmFes3bzJwsLLe8UH3b5X0vJl2
	 xotRPf86HJZXWubM25ofineJjJzIOv4qU9dahlLOonlEMo20qqqYJlmIk/NTUaREhH
	 suU73NiHHmjAq2DRDoI/NTgAFNDaaQNLRmgzSTvw32860UkLyN6Dsr+ls7LHFtR+Mj
	 5mdvyuhJgMKyiIzrP+mkTEx3QRlPlBbxIJXEFM7+RBpBlRHCAuinXkOyWuYT6rnmdX
	 zRjIeXso57s0w==
Date: Fri, 3 Oct 2025 22:10:28 +0530
From: Manivannan Sadhasivam <mani@kernel.org>
To: Abhinaba Rakshit <abhinaba.rakshit@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>, 
	"Martin K. Petersen" <martin.petersen@oracle.com>, linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-scsi@vger.kernel.org
Subject: Re: [PATCH 1/2] soc: qcom: ice: enable ICE clock scaling API
Message-ID: <izxqjidbslfigzf2jiwavtyousmurrwi6c3i5rxsb3npzyaoxz@3prtbcludlqp>
References: <20251001-enable-ufs-ice-clock-scaling-v1-0-ec956160b696@oss.qualcomm.com>
 <20251001-enable-ufs-ice-clock-scaling-v1-1-ec956160b696@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251001-enable-ufs-ice-clock-scaling-v1-1-ec956160b696@oss.qualcomm.com>

On Wed, Oct 01, 2025 at 05:08:19PM +0530, Abhinaba Rakshit wrote:
> Add ICE clock scaling API based on the parsed clk supported
> frequencies from dt entry.
> 

Explain the purpose.

> Signed-off-by: Abhinaba Rakshit <abhinaba.rakshit@oss.qualcomm.com>
> ---
>  drivers/soc/qcom/ice.c | 25 +++++++++++++++++++++++++
>  include/soc/qcom/ice.h |  1 +
>  2 files changed, 26 insertions(+)
> 
> diff --git a/drivers/soc/qcom/ice.c b/drivers/soc/qcom/ice.c
> index c467b55b41744ebec0680f5112cc4bb1ba00c513..ec8d6bb9f426deee1038616282176bfc8e5b9ec1 100644
> --- a/drivers/soc/qcom/ice.c
> +++ b/drivers/soc/qcom/ice.c
> @@ -97,6 +97,8 @@ struct qcom_ice {
>  	struct clk *core_clk;
>  	bool use_hwkm;
>  	bool hwkm_init_complete;
> +	u32 max_freq;
> +	u32 min_freq;
>  };
>  
>  static bool qcom_ice_check_supported(struct qcom_ice *ice)
> @@ -514,10 +516,25 @@ int qcom_ice_import_key(struct qcom_ice *ice,
>  }
>  EXPORT_SYMBOL_GPL(qcom_ice_import_key);
>  
> +int qcom_ice_scale_clk(struct qcom_ice *ice, bool scale_up)
> +{
> +	int ret = 0;
> +
> +	if (scale_up && ice->max_freq)
> +		ret = clk_set_rate(ice->core_clk, ice->max_freq);
> +	else if (!scale_up && ice->min_freq)
> +		ret = clk_set_rate(ice->core_clk, ice->min_freq);
> +
> +	return ret;
> +}
> +EXPORT_SYMBOL_GPL(qcom_ice_scale_clk);
> +
>  static struct qcom_ice *qcom_ice_create(struct device *dev,
>  					void __iomem *base)
>  {
>  	struct qcom_ice *engine;
> +	const __be32 *prop;
> +	int len;
>  
>  	if (!qcom_scm_is_available())
>  		return ERR_PTR(-EPROBE_DEFER);
> @@ -549,6 +566,14 @@ static struct qcom_ice *qcom_ice_create(struct device *dev,
>  	if (IS_ERR(engine->core_clk))
>  		return ERR_CAST(engine->core_clk);
>  
> +	prop = of_get_property(dev->of_node, "freq-table-hz", &len);
> +	if (!prop || len < 2 * sizeof(uint32_t)) {
> +		dev_err(dev, "Freq-hz property not found or invalid length\n");

We have deprecated the 'freq-table-hz' property in favor of
'operating-points-v2'. So you should not be using it in new code. Also, throwing
error in the absence of this property is a no-go.

- Mani

-- 
மணிவண்ணன் சதாசிவம்

