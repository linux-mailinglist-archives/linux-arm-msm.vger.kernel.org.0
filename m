Return-Path: <linux-arm-msm+bounces-12558-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 58ACF8674A7
	for <lists+linux-arm-msm@lfdr.de>; Mon, 26 Feb 2024 13:21:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7C3F51C20F29
	for <lists+linux-arm-msm@lfdr.de>; Mon, 26 Feb 2024 12:21:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 06BA85FF04;
	Mon, 26 Feb 2024 12:21:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="E2uwEqAQ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 101CC604AD
	for <linux-arm-msm@vger.kernel.org>; Mon, 26 Feb 2024 12:20:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708950062; cv=none; b=IgrNEiLqKMEsYwQygW8r3LiBGqIEHGO3+hV1vtANXfE1oKq/QOMlA/Af/WPSFflwLJovB8nb2b5YwS4KK/hBdTXvz7pnlwtejlxaHwb+5XVwSZ93kbeAU1+FxblnMIcNasDsKPDdVj2MUkaUMxLKksN3uQT8HqapLj/ly5nszmA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708950062; c=relaxed/simple;
	bh=ryPozF+ZEiZQv5gU9znIhxNGg250XVTfuostgCQKxvU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=c35CFTDefFLPb00IccQ3oDT8dKoyVzff/pX5h4E1kogytTWWzF1Iwu/0iDibkYzQsjPh/V0uXt/jDYe6nO/FP4Npt8BBCph0XKpyYsSVmcDl0+ZEvs9FN1XMXgMyev3iVV10Yw2QN+xBf/aqBFRrPpXBKtbnIy32MCvSm8HW5Ag=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=E2uwEqAQ; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-1dc0e5b223eso24104595ad.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 26 Feb 2024 04:20:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1708950059; x=1709554859; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=kvYVirxxYrcEoYPYhVtajEjzNx9trrhQLd3ahVDvBX0=;
        b=E2uwEqAQabd+iwOkrE6CHndO1vckDLVTLq8WtPqb6U3zjWRx/9e+5FXcOdbSFUm5hs
         X9sY69UOt2s0i7JjXSMSyQt+HK8Klg5Bj1AQewLVUJEZ8udmjTIX0Ao6Yt6V0J52irKW
         j7I3kQnQUJc181kIZ+QRCJv8XH/oYlfGbZWol2mvmTKGmtJH0jQtc+RBX8QcnPOFx443
         DVveMug3JOZIvtBgOSGuXyo+fesE64kx6jRdZB2tBpZMx+TcidmB5tHaVjVo6KXznqk1
         20P+uMNlyi/aFwwlQHp1jlZ2ko2QiX6Tw5q6PLhgnNp9RP80rDosovef5QRjF1GTIroV
         X3QA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708950059; x=1709554859;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=kvYVirxxYrcEoYPYhVtajEjzNx9trrhQLd3ahVDvBX0=;
        b=gkKr+8xJV+Bttf1yhq+j7sJyfd6BE4GRwxXsmXFCWleMKiG5bEJXzc7U7klmer642Y
         P5PwEwQnONoiG0s6Pwby6c1G8RlEFfba29zBGO30UK01Em8REDhXWpfAc2nJCD4fUxc5
         sgwCaci9W+Y70E+g6hvS842g5ozcJqWGWkeWFR4l1q+oRHXwvfIfOvIs6SpqyvXodqIh
         Qt+GhCcvDVW59UaM2j1wI4jfkckg9AGKpVo/bTCFw/aBwwrQmV+fTEKJLl1P5l6hrEbR
         84evwX3ECgOemxd4uAqXDS5p1KSLM8vUMf/5qmnth2HOMJkBJCjyHqyMGMmBrB9GpkFe
         tb6g==
X-Forwarded-Encrypted: i=1; AJvYcCXchu1xdWhl2TrbKhGt51VV/vCHGfoKg0mIKwnc9IdWfyeIY9Xi+xP9Ps318U9ge37J3weLwf3Zyk4SIcun+oCPPQkHm8ozlsPFy9t+7w==
X-Gm-Message-State: AOJu0Yw6aG+J5AdKRFmpVGXnGzn2fY4MyqyboILJ4SLFd7dd8A3sXgo6
	8SEiYXBqaDqU5dcAL9k7jZBgH+BrTh1KeBtMxpHh700meQZuSYHGtn1QU/TNRA==
X-Google-Smtp-Source: AGHT+IFNO0EvqpSlsp90jIMoKkSHpuCVgm2eQEtRszipPHoVaXKCILn8GEKj9H06BqJROE7zrz5L0w==
X-Received: by 2002:a17:902:ba88:b0:1dc:266e:a7e2 with SMTP id k8-20020a170902ba8800b001dc266ea7e2mr6036261pls.11.1708950059447;
        Mon, 26 Feb 2024 04:20:59 -0800 (PST)
Received: from thinkpad ([117.202.184.81])
        by smtp.gmail.com with ESMTPSA id jh5-20020a170903328500b001dcada71593sm888333plb.273.2024.02.26.04.20.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Feb 2024 04:20:59 -0800 (PST)
Date: Mon, 26 Feb 2024 17:50:55 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Baochen Qiang <quic_bqiang@quicinc.com>
Cc: ath11k@lists.infradead.org, mhi@lists.linux.dev,
	linux-wireless@vger.kernel.org, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH 2/3] net: qrtr: support suspend/hibernation
Message-ID: <20240226122055.GE8422@thinkpad>
References: <20240221030026.10553-1-quic_bqiang@quicinc.com>
 <20240221030026.10553-3-quic_bqiang@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240221030026.10553-3-quic_bqiang@quicinc.com>

On Wed, Feb 21, 2024 at 11:00:25AM +0800, Baochen Qiang wrote:
> MHI devices may not be destroyed during suspend/hibernation, so need
> to unprepare/prepare MHI channels throughout the transition.
> 

Again, below content should go to the comment section, not in the commit
message.

Please add only relevant content in the commit message.

- Mani

> The RFC version adds new API to MHI stack with which an MHI controller
> driver can do unprepare/prepare directly by itself, see
> 
> https://patchwork.kernel.org/project/linux-wireless/patch/20231127162022.518834-3-kvalo@kernel.org/
> 
> Although it works well Mani pointed out that the design is not good
> because MHI channels are managed by MHI client driver thus should not
> be touched by others. See the discussion
> 
> https://lore.kernel.org/mhi/20231127162022.518834-1-kvalo@kernel.org/
> 
> This version changes to add suspend/resume callbacks to achieve the
> same purpose. The suspend callback is called in the late suspend stage,
> this means MHI channels are still alive at suspend stage, and that makes
> it possible for an MHI controller driver to communicate with others over
> those channels at suspend stage. While the resume callback is called in
> the early resume stage, for a similar reason.
> 
> Tested-on: WCN6855 hw2.0 PCI WLAN.HSP.1.1-03125-QCAHSPSWPL_V1_V2_SILICONZ_LITE-3.6510.30
> 
> Signed-off-by: Baochen Qiang <quic_bqiang@quicinc.com>
> ---
>  net/qrtr/mhi.c | 29 +++++++++++++++++++++++++++++
>  1 file changed, 29 insertions(+)
> 
> diff --git a/net/qrtr/mhi.c b/net/qrtr/mhi.c
> index 9ced13c0627a..b54a6c2113e9 100644
> --- a/net/qrtr/mhi.c
> +++ b/net/qrtr/mhi.c
> @@ -118,6 +118,32 @@ static const struct mhi_device_id qcom_mhi_qrtr_id_table[] = {
>  };
>  MODULE_DEVICE_TABLE(mhi, qcom_mhi_qrtr_id_table);
>  
> +static int qcom_mhi_qrtr_pm_suspend_late(struct device *dev)
> +{
> +	struct mhi_device *mhi_dev = container_of(dev, struct mhi_device, dev);
> +
> +	mhi_unprepare_from_transfer(mhi_dev);
> +
> +	return 0;
> +}
> +
> +static int qcom_mhi_qrtr_pm_resume_early(struct device *dev)
> +{
> +	struct mhi_device *mhi_dev = container_of(dev, struct mhi_device, dev);
> +	int rc;
> +
> +	rc = mhi_prepare_for_transfer_autoqueue(mhi_dev);
> +	if (rc)
> +		dev_err(dev, "failed to prepare for autoqueue transfer %d\n", rc);
> +
> +	return rc;
> +}
> +
> +static const struct dev_pm_ops __maybe_unused qcom_mhi_qrtr_pm_ops = {
> +	SET_LATE_SYSTEM_SLEEP_PM_OPS(qcom_mhi_qrtr_pm_suspend_late,
> +				     qcom_mhi_qrtr_pm_resume_early)
> +};
> +
>  static struct mhi_driver qcom_mhi_qrtr_driver = {
>  	.probe = qcom_mhi_qrtr_probe,
>  	.remove = qcom_mhi_qrtr_remove,
> @@ -126,6 +152,9 @@ static struct mhi_driver qcom_mhi_qrtr_driver = {
>  	.id_table = qcom_mhi_qrtr_id_table,
>  	.driver = {
>  		.name = "qcom_mhi_qrtr",
> +#ifdef CONFIG_PM
> +		.pm = &qcom_mhi_qrtr_pm_ops,
> +#endif
>  	},
>  };
>  
> -- 
> 2.25.1
> 
> 

-- 
மணிவண்ணன் சதாசிவம்

