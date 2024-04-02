Return-Path: <linux-arm-msm+bounces-16081-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CEBE889516C
	for <lists+linux-arm-msm@lfdr.de>; Tue,  2 Apr 2024 13:06:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0C2151C2341F
	for <lists+linux-arm-msm@lfdr.de>; Tue,  2 Apr 2024 11:06:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C6EAF60DEA;
	Tue,  2 Apr 2024 11:06:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gRTwYxo6"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8535627E2;
	Tue,  2 Apr 2024 11:06:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712056003; cv=none; b=SO1JB0XlM28EUraLwXqmfjB/897AHeWiVnrtVzQr1XlJ1DbKoYWxmitDgP0Zv7C43pmR/JxuJsPOYJOKdYA/lddlp9nccTtyJECAXOWY2GozLgbkVNuhL6htCn1jHPf34eufSL4qFhEKi5D3+thX5kCTiRBTFJ6zHsycOrJxBKU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712056003; c=relaxed/simple;
	bh=oaM5U9XGg3Lekm0EIa+bpmwBz83OCNeuX7tRE9X3Xck=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QudVoxqOd6SHPrFt5+dq2+NvKED/n/P+UyX7cPop1pvuBo3jFzRM/mlzoYZJPyHAolU0ruVHiTJNo27/Z4ynd4N3eM6qowxTAnoUoC0A3ostDjALDhUF/MwbRPBa1K83OamofdAGK2WF3vhbwr/mWTq3wbRtV7wSZRZtc0cJ8/0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gRTwYxo6; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1712056002; x=1743592002;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=oaM5U9XGg3Lekm0EIa+bpmwBz83OCNeuX7tRE9X3Xck=;
  b=gRTwYxo6mc8A78rnmrsfPf2QotZ3QQueBmNmEfaJPNgsbgPfrN+ZzQDo
   DGdulBjg78LiXB/bbNV1j0W9aA8jOsFJfsIzNB9gz3tgMfrAQz3LlRAID
   lDiYF8nJcyXkndbonpO/SqINYK7Ue+vUv3JklPeMsDqEbHTb7ALTTLumM
   J5LnG6Ig2oBBrLFMedGTFVSp2SyAmZzta9XGPuDNPNYO3RWj/aenrzj4K
   ngL8L0yBjTNgh/qoYjXjLNNWSf4OR/hO/UVCKDAarbrNVjASjzeh2krz3
   Qh6bVU/z+ZFp0e2rza23nSfpqbcprOAaJP6cJZIleMOEZ+BHQxE/vFX/X
   w==;
X-CSE-ConnectionGUID: N6FjObOUTC+Ne6L3ImEmuQ==
X-CSE-MsgGUID: 6djmBuP8Q7KHzWWgfge7iA==
X-IronPort-AV: E=McAfee;i="6600,9927,11031"; a="17790236"
X-IronPort-AV: E=Sophos;i="6.07,174,1708416000"; 
   d="scan'208";a="17790236"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Apr 2024 04:06:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,11031"; a="937083355"
X-IronPort-AV: E=Sophos;i="6.07,174,1708416000"; 
   d="scan'208";a="937083355"
Received: from kuha.fi.intel.com ([10.237.72.185])
  by fmsmga001.fm.intel.com with SMTP; 02 Apr 2024 04:06:36 -0700
Received: by kuha.fi.intel.com (sSMTP sendmail emulation); Tue, 02 Apr 2024 14:06:36 +0300
Date: Tue, 2 Apr 2024 14:06:36 +0300
From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Guenter Roeck <linux@roeck-us.net>,
	Bjorn Andersson <andersson@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Johan Hovold <johan+linaro@kernel.org>, linux-usb@vger.kernel.org,
	linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH v2 08/11] usb: typec: ucsi_glink: rework quirks
 implementation
Message-ID: <ZgvmvPFQe+jAoH2I@kuha.fi.intel.com>
References: <20240329-qcom-ucsi-fixes-v2-0-0f5d37ed04db@linaro.org>
 <20240329-qcom-ucsi-fixes-v2-8-0f5d37ed04db@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240329-qcom-ucsi-fixes-v2-8-0f5d37ed04db@linaro.org>

On Fri, Mar 29, 2024 at 08:15:40AM +0200, Dmitry Baryshkov wrote:
> In preparation to adding more quirks, extract quirks to the static
> variables and reference them through match->data. Otherwise adding
> more quirks will add the table really cumbersome.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

Reviewed-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>

> ---
>  drivers/usb/typec/ucsi/ucsi_glink.c | 14 ++++++++------
>  1 file changed, 8 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/usb/typec/ucsi/ucsi_glink.c b/drivers/usb/typec/ucsi/ucsi_glink.c
> index 932e7bf69447..d7a18950faab 100644
> --- a/drivers/usb/typec/ucsi/ucsi_glink.c
> +++ b/drivers/usb/typec/ucsi/ucsi_glink.c
> @@ -297,12 +297,14 @@ static void pmic_glink_ucsi_destroy(void *data)
>  	mutex_unlock(&ucsi->lock);
>  }
>  
> +static unsigned long quirk_sc8180x = UCSI_NO_PARTNER_PDOS;
> +
>  static const struct of_device_id pmic_glink_ucsi_of_quirks[] = {
> -	{ .compatible = "qcom,qcm6490-pmic-glink", .data = (void *)UCSI_NO_PARTNER_PDOS, },
> -	{ .compatible = "qcom,sc8180x-pmic-glink", .data = (void *)UCSI_NO_PARTNER_PDOS, },
> -	{ .compatible = "qcom,sc8280xp-pmic-glink", .data = (void *)UCSI_NO_PARTNER_PDOS, },
> -	{ .compatible = "qcom,sm8350-pmic-glink", .data = (void *)UCSI_NO_PARTNER_PDOS, },
> -	{ .compatible = "qcom,sm8550-pmic-glink", .data = (void *)UCSI_NO_PARTNER_PDOS, },
> +	{ .compatible = "qcom,qcm6490-pmic-glink", .data = &quirk_sc8180x, },
> +	{ .compatible = "qcom,sc8180x-pmic-glink", .data = &quirk_sc8180x, },
> +	{ .compatible = "qcom,sc8280xp-pmic-glink", .data = &quirk_sc8180x, },
> +	{ .compatible = "qcom,sm8350-pmic-glink", .data = &quirk_sc8180x, },
> +	{ .compatible = "qcom,sm8550-pmic-glink", .data = &quirk_sc8180x, },
>  	{}
>  };
>  
> @@ -340,7 +342,7 @@ static int pmic_glink_ucsi_probe(struct auxiliary_device *adev,
>  
>  	match = of_match_device(pmic_glink_ucsi_of_quirks, dev->parent);
>  	if (match)
> -		ucsi->ucsi->quirks = (unsigned long)match->data;
> +		ucsi->ucsi->quirks = *(unsigned long *)match->data;
>  
>  	ucsi_set_drvdata(ucsi->ucsi, ucsi);
>  
> 
> -- 
> 2.39.2

-- 
heikki

