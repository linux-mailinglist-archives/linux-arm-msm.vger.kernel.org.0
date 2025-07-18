Return-Path: <linux-arm-msm+bounces-65607-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 98430B09E2B
	for <lists+linux-arm-msm@lfdr.de>; Fri, 18 Jul 2025 10:38:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 070E01AA2E1E
	for <lists+linux-arm-msm@lfdr.de>; Fri, 18 Jul 2025 08:38:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C20E2292B30;
	Fri, 18 Jul 2025 08:38:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="sSotEowd"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3407113FEE
	for <linux-arm-msm@vger.kernel.org>; Fri, 18 Jul 2025 08:38:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752827882; cv=none; b=grpCq0Lp9oMWsgnyPpSLh5/Tz7cnploJDFtuzEo/HNFvKMRmOFH+GjKk78LhZU8yFWqaURnQWRFRiRNhbpPLxQ7Mm7XIqiAUYBhzmfCr1c3X4csmj24WlnAr6Ds59tlVtEAa78sC/osyPa0QPm8dvkPT1SJZofst3xrZ4Dremv8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752827882; c=relaxed/simple;
	bh=xkrVlFl++yjki3bmgqZOv3E+MHiM7DAo5a8dlrBWSxw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cOnv6pu5RFiNIEHF69h1lYziPALxXL/JThxxhuo4XGAP8YQ1ktnYb9dpFdJ4HC+pW6Zfn7DsijgftM4GjhUfsikWvYb2aQRMPNlw+7zFiL4NZJR+IvH3F/Leb5wmhlVeeKPLLT8+q2/SzwJMS0EHAsKxZiVMVmcy2+3B7i8I+a0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=sSotEowd; arc=none smtp.client-ip=209.85.210.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-742c3d06de3so2154543b3a.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 18 Jul 2025 01:38:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1752827880; x=1753432680; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=T5DKf/JSZuAS6z2Xq7nrToIfpwa9ePTbW/i2x4sP8aQ=;
        b=sSotEowd9H5Ak/Q5YVL95C9Gl1h+0+YLlofTzc6tL38O9vn+CiooSTzRRQ6tZdzP36
         xsDNFDH6VIaVpmFUprpIkS0+WaBO3ML0827EC4vkRolSR5gFo3tilHN/dCOsxfoNyPH8
         qpWSJrg8oTXmd2chzQdgen5xunNyFcj/T+Cs0AmM4t6IwdmTn9BWIP1ZjdW2i4SWw+wE
         ueHRjMp0oJZvDE+Q9qu/n1N+0eQUr2pktqSlEfPWiNDLgA1okXzL1q07R1iA3ttlShXb
         hGzVGcoYyG9Y6+q28ODMvp+chWH9TF9/P4ikjslQSIBUQbN3zm/oiYYO4JxriAvCQVjx
         T9HQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752827880; x=1753432680;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=T5DKf/JSZuAS6z2Xq7nrToIfpwa9ePTbW/i2x4sP8aQ=;
        b=bqGsIfnC+/kEh15VYRRLo29sn48pXn3/itmE5SFgr+JVGo2PNUMsR2oABzu22IgS5K
         S8Wm7ELbDZs+1Ase34bHeWw+XrrtttohKAAm6yP9PvrERkmqV0hraqqGbrI5Ziqr2Zme
         o2Bzrc8xgRLKbCWNN4kWHtdW11UBmhtv/kcvygLX1YhzceMdNB+xLaXH215hKR6Xo25F
         n6kSQ/TYxk6rLy5B+88EIAPOa0eI3gjyDxm3QhM+/mzrel5JmH2dEVcnVJsfWz0+Mx83
         GKzWrfys2fkyKOzXNH0FpzDpii3QlAMPN3rNdmcUuvVxYEY5+S9k9aTdEQiYp3e5P+Ek
         DrNw==
X-Forwarded-Encrypted: i=1; AJvYcCVLHAdx5MmQPMJFRXkrtHpNSEGMHLWcLx88PTxjxRMBsj9ALyCIuFcSKz7WnglUoXOzBd7IXMYmjsmzCGt2@vger.kernel.org
X-Gm-Message-State: AOJu0YxSAhjXLiUDYeilxEwtuyjMollb1bbhgywBa3YH+a98WCH+gmhO
	U3eCA/RPmwyUsAt/wrdYs8iNNbpmh8dV52nheyFGAW48SbAwYlXd1zlT73L1DarsVokNBoFEPzN
	ipVK4Y3EBhH22qJJ6sB97uH+YVKs9qEOd9T+aXNzuyw==
X-Gm-Gg: ASbGncsaFgVf5WvxvECOb06KlPkvdihUAvK3Ur8GsybO6L9+mrDmiPUV2NQnFVl7Glt
	WBVPK8luUUi0HAFuB09qLPZq/AEKn1Pp+z+ikzoJtecVHHH7QgEGii8b8+974xlJzm1M8kZZwVt
	nK7ZJS5/08BJ436xq6dAGgAkHjJZNXw2ExBZnaMQW92lj5guQ9C0GVOz9uxK702zrhDOEu7Lblx
	WnrYSDK
X-Google-Smtp-Source: AGHT+IFqh+j+6EUjya6/Rjc1r8NT0FseuVGCh1Ka+tsqzW1wYMCTrimcXhsVexvinaMtnBJgBfcFHLy00MJtnLuDPNY=
X-Received: by 2002:a05:6a00:1883:b0:736:5664:53f3 with SMTP id
 d2e1a72fcca58-7572427b03amr12830626b3a.15.1752827880483; Fri, 18 Jul 2025
 01:38:00 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250714063109.591-1-jie.gan@oss.qualcomm.com> <20250714063109.591-3-jie.gan@oss.qualcomm.com>
In-Reply-To: <20250714063109.591-3-jie.gan@oss.qualcomm.com>
From: Mike Leach <mike.leach@linaro.org>
Date: Fri, 18 Jul 2025 09:37:46 +0100
X-Gm-Features: Ac12FXzbwn7h5sLCdV0XEMivqozSxEu3_Wm23VZ6koC6hPisQ9WkjxcqJkjzS7w
Message-ID: <CAJ9a7VikU9UktC-fpLfR5EdpGupHHor2GaDGAujBnQJky=W17w@mail.gmail.com>
Subject: Re: [PATCH v3 RESEND 02/10] coresight: core: add a new API to
 retrieve the helper device
To: Jie Gan <jie.gan@oss.qualcomm.com>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>, James Clark <james.clark@linaro.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, 
	Tingwei Zhang <quic_tingweiz@quicinc.com>, Yuanfang Zhang <quic_yuanfang@quicinc.com>, 
	Mao Jinlong <quic_jinlmao@quicinc.com>, Jie Gan <quic_jiegan@quicinc.com>, 
	coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi,

On Mon, 14 Jul 2025 at 07:31, Jie Gan <jie.gan@oss.qualcomm.com> wrote:
>
> Retrieving the helper device of the specific coresight device based on
> its helper_subtype because a single coresight device may has multiple types
> of the helper devices.
>
> Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
> ---
>  drivers/hwtracing/coresight/coresight-core.c | 30 ++++++++++++++++++++
>  drivers/hwtracing/coresight/coresight-priv.h |  2 ++
>  2 files changed, 32 insertions(+)
>
> diff --git a/drivers/hwtracing/coresight/coresight-core.c b/drivers/hwtracing/coresight/coresight-core.c
> index 5297a5ff7921..76e10c36a8a1 100644
> --- a/drivers/hwtracing/coresight/coresight-core.c
> +++ b/drivers/hwtracing/coresight/coresight-core.c
> @@ -580,6 +580,36 @@ struct coresight_device *coresight_get_sink(struct coresight_path *path)
>  }
>  EXPORT_SYMBOL_GPL(coresight_get_sink);
>
> +/**
> + * coresight_get_helper: find the helper device of the assigned csdev.
> + *
> + * @csdev: The csdev the helper device is conntected to.
> + * @type:  helper_subtype of the expected helper device.
> + *
> + * Retrieve the helper device for the specific csdev based on its
> + * helper_subtype.
> + *
> + * Return: the helper's csdev upon success or NULL for fail.
> + */
> +struct coresight_device *coresight_get_helper(struct coresight_device *csdev,
> +                                             int type)
> +{
> +       int i;
> +       struct coresight_device *helper;
> +
> +       for (i = 0; i < csdev->pdata->nr_outconns; ++i) {
> +               helper = csdev->pdata->out_conns[i]->dest_dev;
> +               if (!helper || !coresight_is_helper(helper))
> +                       continue;
> +

Manipulating the connections list almost certainly requires some
locking. See other functions in this file

Mike


> +               if (helper->subtype.helper_subtype == type)
> +                       return helper;
> +       }
> +
> +       return NULL;
> +}
> +EXPORT_SYMBOL_GPL(coresight_get_helper);
> +
>  /**
>   * coresight_get_port_helper: get the in-port number of the helper device
>   * that is connected to the csdev.
> diff --git a/drivers/hwtracing/coresight/coresight-priv.h b/drivers/hwtracing/coresight/coresight-priv.h
> index 07a5f03de81d..5b912eb60401 100644
> --- a/drivers/hwtracing/coresight/coresight-priv.h
> +++ b/drivers/hwtracing/coresight/coresight-priv.h
> @@ -158,6 +158,8 @@ void coresight_path_assign_trace_id(struct coresight_path *path,
>                                    enum cs_mode mode);
>  int coresight_get_port_helper(struct coresight_device *csdev,
>                               struct coresight_device *helper);
> +struct coresight_device *coresight_get_helper(struct coresight_device *csdev,
> +                                             int type);
>
>  #if IS_ENABLED(CONFIG_CORESIGHT_SOURCE_ETM3X)
>  int etm_readl_cp14(u32 off, unsigned int *val);
> --
> 2.34.1
>


-- 
Mike Leach
Principal Engineer, ARM Ltd.
Manchester Design Centre. UK

