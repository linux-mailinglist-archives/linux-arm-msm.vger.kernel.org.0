Return-Path: <linux-arm-msm+bounces-12950-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id F31FA86C689
	for <lists+linux-arm-msm@lfdr.de>; Thu, 29 Feb 2024 11:13:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id C1CB0B29FA8
	for <lists+linux-arm-msm@lfdr.de>; Thu, 29 Feb 2024 10:13:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F088964A98;
	Thu, 29 Feb 2024 10:13:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="XuHYGAA/"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AEDB6350F
	for <linux-arm-msm@vger.kernel.org>; Thu, 29 Feb 2024 10:13:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709201587; cv=none; b=q5nHEXID4PeeUYsHLw2MQ4dmPo7DtFBNtFZ7Rci3LhH55LwjuEd+jWwHA/frzG2UpX5/zVGSFQoVny4uIRcCBcD4NNYZX/ZT2N7gWg6uFDfjsFlc1l/FAahn5We9froMFf1h0e08kozRP/pZdgiHJRgSygMI+USaKSDurLjQ9vA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709201587; c=relaxed/simple;
	bh=JvJIOXpLW0YZXDe6zPWZQWdWHZCOjK+ofAJQOD+9kLU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Fqu1s+J6hmSgWCqyhuJTpPN1MtKfuT/Lkr7j4Pl4Y80HVQrlOv0xPR8ALQIFhUAAfe2De28p2yUUzpGbedKuWXMGfNkfer33mgVEe2NntzM/VtZ4B/XnnUO7NAofTpKEssXKESZdqxlAFrPF8NDei4Zgq0geX8CAiy7yrj4xUxQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=XuHYGAA/; arc=none smtp.client-ip=209.85.210.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-6d9f94b9186so626989b3a.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 29 Feb 2024 02:13:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1709201586; x=1709806386; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=FTSeHl4t56ihFRBLYPjJvNh39suZY1xPljTjFaZyy/Y=;
        b=XuHYGAA/R/ancfw1Z07fv4DwQqe5vbo/MeguMDeYW+3bKp7R469rFUfwlB1j0WG7BN
         Xw/oGm3R2g5KqbVZ7Q19nvh2+5Blao194iQqTCfe/RQ4VeUp/uuYzGI2XCp+hw2gCnv7
         XMCiktKqEsNx+lGGFSn1YfAEE/caI/J4qzB3k1RoWsdqMPzwxbjT7pXFzBFwjqhRJlds
         elqa78+2uW2b9ackaX5OEgIYVCzjmnHc4ddkmyteULY6f5ctfv0ckGw5XKayRiMMiVu+
         OscMH7oYOUy7gyz9lBnlsF9jD+0Jm9JlrecPXbkz2VhMFRDaUeMe3OTc6ReAx9dEnKn8
         Z0HA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709201586; x=1709806386;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=FTSeHl4t56ihFRBLYPjJvNh39suZY1xPljTjFaZyy/Y=;
        b=m5zSuePkezLVEFFVphCOEyRl0ucj+wyShXrI/LvUuTFbxs3mJTBB4o6JI0MzgQ8/+r
         RendBorkmdcExwt1L3Z4uEKyBixVlqi4aoa7JH1/lw0GgwJZPBkp+UgZNzaZPGFa1TMm
         mU0g0gptZ9Cqy7okhIZg2LrOmkO+eGs561Bb3ACds+5ij/cB2kCCyEHe1n0u3UKOatMR
         EqBo83Pzurx9YY2l+/dRR5+sHCtISBXHcli4wbIqj9nzxsmsflVZNWhnVSpNjCws0wOC
         TRk7SP/bPVgm+7Bm9W4fZmFeSnQBlVhBFdnSZggzgqpqlNzEm4X3hxpHqn4+J9h0Ntjl
         ZX5w==
X-Forwarded-Encrypted: i=1; AJvYcCVOJkgF5gHk/qa5BKw4jtkThsclti0XUfxyQA/AnGiTfUOGOgQ6hgNXjW4790hW3DgA4b1IH1/K03V0Gm4u7+6k6pLq+pzV6PJRBopHpQ==
X-Gm-Message-State: AOJu0YySrTsKp8LBtBWi6k7cMkQ5bPKU4m+Q+7v2HkHCnqssNDdEm/pO
	2Rx7kUsLkwnzihi6/ofDcEYgKvIGuGDy1DvGgpGBRcAinV5DiFyqivHcoEk+9A==
X-Google-Smtp-Source: AGHT+IGygXML0wQBkJwD/GAHTQBBip4QFRiWJxFBsL4N97u47bRPEOg2GIwnNaxsGTOu/S/paGqlYw==
X-Received: by 2002:a05:6a20:9f09:b0:1a0:e17c:d771 with SMTP id mk9-20020a056a209f0900b001a0e17cd771mr2366560pzb.7.1709201585776;
        Thu, 29 Feb 2024 02:13:05 -0800 (PST)
Received: from thinkpad ([120.138.12.68])
        by smtp.gmail.com with ESMTPSA id x15-20020a170902ec8f00b001dcb654d1a5sm1069127plg.21.2024.02.29.02.12.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Feb 2024 02:13:05 -0800 (PST)
Date: Thu, 29 Feb 2024 15:42:54 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Baochen Qiang <quic_bqiang@quicinc.com>
Cc: ath11k@lists.infradead.org, linux-wireless@vger.kernel.org,
	linux-arm-msm@vger.kernel.org, mhi@lists.linux.dev,
	davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
	pabeni@redhat.com, netdev@vger.kernel.org
Subject: Re: [PATCH v4 2/3] net: qrtr: support suspend/hibernation
Message-ID: <20240229101254.GC2999@thinkpad>
References: <20240228022243.17762-1-quic_bqiang@quicinc.com>
 <20240228022243.17762-3-quic_bqiang@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240228022243.17762-3-quic_bqiang@quicinc.com>

On Wed, Feb 28, 2024 at 10:22:42AM +0800, Baochen Qiang wrote:
> MHI devices may not be destroyed during suspend/hibernation, so need
> to unprepare/prepare MHI channels throughout the transition, this is
> done by adding suspend/resume callbacks.
> 
> The suspend callback is called in the late suspend stage, this means
> MHI channels are still alive at suspend stage, and that makes it
> possible for an MHI controller driver to communicate with others over
> those channels at suspend stage. While the resume callback is called
> in the early resume stage, for a similar reason.
> 
> Also note that we won't do unprepare/prepare when MHI device is in
> suspend state because it's pointless if MHI is only meant to go through
> a suspend/resume transition, instead of a complete power cycle.
> 
> Tested-on: WCN6855 hw2.0 PCI WLAN.HSP.1.1-03125-QCAHSPSWPL_V1_V2_SILICONZ_LITE-3.6510.30
> 
> Signed-off-by: Baochen Qiang <quic_bqiang@quicinc.com>

Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>

- Mani

> ---
>  net/qrtr/mhi.c | 46 ++++++++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 46 insertions(+)
> 
> diff --git a/net/qrtr/mhi.c b/net/qrtr/mhi.c
> index 9ced13c0627a..69f53625a049 100644
> --- a/net/qrtr/mhi.c
> +++ b/net/qrtr/mhi.c
> @@ -118,6 +118,51 @@ static const struct mhi_device_id qcom_mhi_qrtr_id_table[] = {
>  };
>  MODULE_DEVICE_TABLE(mhi, qcom_mhi_qrtr_id_table);
>  
> +static int __maybe_unused qcom_mhi_qrtr_pm_suspend_late(struct device *dev)
> +{
> +	struct mhi_device *mhi_dev = container_of(dev, struct mhi_device, dev);
> +	enum mhi_state state;
> +
> +	state = mhi_get_mhi_state(mhi_dev->mhi_cntrl);
> +	/*
> +	 * If the device is in suspend state, then no need for the
> +	 * client driver to unprepare the channels.
> +	 */
> +	if (state == MHI_STATE_M3)
> +		return 0;
> +
> +	mhi_unprepare_from_transfer(mhi_dev);
> +
> +	return 0;
> +}
> +
> +static int __maybe_unused qcom_mhi_qrtr_pm_resume_early(struct device *dev)
> +{
> +	struct mhi_device *mhi_dev = container_of(dev, struct mhi_device, dev);
> +	enum mhi_state state;
> +	int rc;
> +
> +	state = mhi_get_mhi_state(mhi_dev->mhi_cntrl);
> +	/*
> +	 * If the device is in suspend state, we won't unprepare channels
> +	 * in suspend callback, therefore no need to prepare channels when
> +	 * resume.
> +	 */
> +	if (state == MHI_STATE_M3)
> +		return 0;
> +
> +	rc = mhi_prepare_for_transfer_autoqueue(mhi_dev);
> +	if (rc)
> +		dev_err(dev, "failed to prepare for autoqueue transfer %d\n", rc);
> +
> +	return rc;
> +}
> +
> +static const struct dev_pm_ops qcom_mhi_qrtr_pm_ops = {
> +	SET_LATE_SYSTEM_SLEEP_PM_OPS(qcom_mhi_qrtr_pm_suspend_late,
> +				     qcom_mhi_qrtr_pm_resume_early)
> +};
> +
>  static struct mhi_driver qcom_mhi_qrtr_driver = {
>  	.probe = qcom_mhi_qrtr_probe,
>  	.remove = qcom_mhi_qrtr_remove,
> @@ -126,6 +171,7 @@ static struct mhi_driver qcom_mhi_qrtr_driver = {
>  	.id_table = qcom_mhi_qrtr_id_table,
>  	.driver = {
>  		.name = "qcom_mhi_qrtr",
> +		.pm = &qcom_mhi_qrtr_pm_ops,
>  	},
>  };
>  
> -- 
> 2.25.1
> 

-- 
மணிவண்ணன் சதாசிவம்

