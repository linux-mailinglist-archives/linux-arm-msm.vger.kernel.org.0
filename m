Return-Path: <linux-arm-msm+bounces-29950-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A23FA964064
	for <lists+linux-arm-msm@lfdr.de>; Thu, 29 Aug 2024 11:41:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4E45B1F21569
	for <lists+linux-arm-msm@lfdr.de>; Thu, 29 Aug 2024 09:41:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6EAD918FDB2;
	Thu, 29 Aug 2024 09:39:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="m9VdmNW9"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com [209.85.208.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73CE918FDA6
	for <linux-arm-msm@vger.kernel.org>; Thu, 29 Aug 2024 09:39:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724924365; cv=none; b=qp7ePs19VYtkf5bKY9y5+LP4FWZlbdKOkr02iWDUjj/3V33+aN3LzkUr2FCsbt/jVp8j9Bc3tCMrITPhpPNFZlgL2biD+XXFsll7qxqtoIV1h1FoN5KtIO3lEdw3eRxk38OCb4I/3BTm02Mx/zqq/9LTGkqH23rna4Fv0FbLtIE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724924365; c=relaxed/simple;
	bh=lLDOCp0JjYArDCajWCpScG2VzR6De38arrsuNVYW3wc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BL/PQsdYdUGiSSffzA047BNkMTBpI39jXsQbTOHXOm3FVg8yB+8Dg/i/UKSCIRsiw0DbBGrxfa661mvUEWjTXGlUyEfsnnnFQuur+QgC6BgOHv3wD9iNqO5onwCWNvSm6lbAEVE0s9YHFXoibNU1e7cdxdgzTs+k+x4/Dked9j8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=m9VdmNW9; arc=none smtp.client-ip=209.85.208.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-2f3ffc7841dso4068381fa.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 29 Aug 2024 02:39:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1724924361; x=1725529161; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=yDM7RjeAqR8mIYaGQ8a1+G3W/uE+J1ku7MSyGRa4NEk=;
        b=m9VdmNW92zGTQmV99Q9PFKPf92p6vkfVwrqGNU0MDkZ8aHjPXyp/pWTT4VFuY3B2TA
         hPTEoABuZPTgSmQCWDFUL7DALy1wlJMsTyB+d03zXLk1H8nwL1Zxc5peUSqxNiVR/A8s
         vLN+dP/UX95ZJXdSHB45SkH2N6SrGVFuhm/M1gQLyNX1y+3CiaO61RxS5bG/3FIr9zI9
         0alKjo9Lo5reSx+dPhiyNiHOY940tOQlr8wxg3MnOezHwqybmJghcTBTAX5FBah6Z6lk
         xxRoM+/sMLqiZy5QlYqdcnGfyVDgdWbu4g5FlMkNLBQsPG3/2bVdW7pftSVEa2PmzZ2W
         wDIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724924361; x=1725529161;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yDM7RjeAqR8mIYaGQ8a1+G3W/uE+J1ku7MSyGRa4NEk=;
        b=rSVGAzTuHKju2VmU/JOc+ENVArNiDlRSJCNJPqiZ76l9CaKqFjwEhk7WdehJ6F6xLj
         BKzExD1IrYiEB7t5uFAn6n2c7qCLqTviWlkBpd+TW4h8GSFm2Ndv0A3olYRhSDAySv9l
         zaoadOr3fG/c8W64Um1cE5S+zwtVktwZelHGzvuQ2tNsc1S6228+AjzawKuIBbPZcQ30
         5G34g5l1dPT/LtoHNl/+vUe1ZnrSUrmi9U6z5Jrh8ntZZ8wYdavNc38Q0l1sJb6mJAJ+
         oRGko4K6ZkOQ6KmwD0Ouy4weh4CJSVq4TiTeXwyfPbN+kFXEY/HrAkQH0nxXok8TTbUd
         PuVQ==
X-Forwarded-Encrypted: i=1; AJvYcCVBNrDiFTnb2YI7tScyTMgPiLAsdNIN1zJYH8q0hmDmTLjUJLSn8rHKqr89BNq/ovBtvC8/w0YuKIUjWxo0@vger.kernel.org
X-Gm-Message-State: AOJu0YwI2+uI/VDLPPqSUSg8N6Wub34y861CIZN9QvxKwpq3GfCirOwa
	vfRltAKyen+j8PAfdZGlcKVRAdzUH/D1heKj747RnEwZAtaHw+R+WoeksSnjexU=
X-Google-Smtp-Source: AGHT+IHGfWPcdIFytjVqqncQ/oLhZH7r/07x9IdMh7vGuT2jTNq7ysgN1KBCB+fKpMokwXTbVRG6nQ==
X-Received: by 2002:a2e:6112:0:b0:2f5:806:5d00 with SMTP id 38308e7fff4ca-2f610923e1amr14910221fa.32.1724924360947;
        Thu, 29 Aug 2024 02:39:20 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2f614ed15f1sm1291921fa.4.2024.08.29.02.39.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Aug 2024 02:39:20 -0700 (PDT)
Date: Thu, 29 Aug 2024 12:39:19 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Raviteja Laggyshetty <quic_rlaggysh@quicinc.com>
Cc: Georgi Djakov <djakov@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Jeff Johnson <quic_jjohnson@quicinc.com>, 
	quic_mdtipton@quicinc.com, quic_okukatla@quicinc.com, linux-arm-msm@vger.kernel.org, 
	linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Bjorn Andersson <andersson@kernel.org>
Subject: Re: [PATCH] interconnect: qcom: icc-rpmh: probe defer incase of
 missing QoS clock dependency
Message-ID: <xny4v2twbt5sjjtc5yoffpnymryfd6da6pirlmiii5txyz7rl5@xy7wdrzi5auc>
References: <20240827172524.89-1-quic_rlaggysh@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240827172524.89-1-quic_rlaggysh@quicinc.com>

On Tue, Aug 27, 2024 at 05:25:24PM GMT, Raviteja Laggyshetty wrote:
> Return -EPROBE_DEFER from interconnect provider incase probe defer is
> received from devm_clk_bulk_get_all(). This would help in reattempting
> the inteconnect driver probe, once the required QoS clocks are
> available.
> Rename qos_clks_required flag to qos_requires_clocks in qcom_icc_desc
> structure. This flag indicates that interconnect provider requires
> clocks for programming QoS.

Two separate commits, please.

> 
> Suggested-by: Bjorn Andersson <andersson@kernel.org>
> Signed-off-by: Raviteja Laggyshetty <quic_rlaggysh@quicinc.com>
> ---
>  drivers/interconnect/qcom/icc-rpmh.c | 10 +++++++---
>  drivers/interconnect/qcom/icc-rpmh.h |  2 +-
>  drivers/interconnect/qcom/sc7280.c   |  4 ++--
>  3 files changed, 10 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/interconnect/qcom/icc-rpmh.c b/drivers/interconnect/qcom/icc-rpmh.c
> index f49a8e0cb03c..5417abf59e28 100644
> --- a/drivers/interconnect/qcom/icc-rpmh.c
> +++ b/drivers/interconnect/qcom/icc-rpmh.c
> @@ -311,9 +311,13 @@ int qcom_icc_rpmh_probe(struct platform_device *pdev)
>  		}
>  
>  		qp->num_clks = devm_clk_bulk_get_all(qp->dev, &qp->clks);
> -		if (qp->num_clks < 0 || (!qp->num_clks && desc->qos_clks_required)) {
> -			dev_info(dev, "Skipping QoS, failed to get clk: %d\n", qp->num_clks);
> -			goto skip_qos_config;
> +		if (qp->num_clks < 0 || (!qp->num_clks && desc->qos_requires_clocks)) {
> +			if (qp->num_clks != -EPROBE_DEFER) {

if (qp->num_clks == -EPROBE_DEFER)
    return dev_err_probe(....)

if (qp->num_clks < 0 || ....)
    ....

> +				dev_info(dev, "Skipping QoS, failed to get clk: %d\n",
> +						qp->num_clks);
> +				goto skip_qos_config;
> +			}
> +			return qp->num_clks;


-- 
With best wishes
Dmitry

