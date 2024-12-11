Return-Path: <linux-arm-msm+bounces-41527-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B39A89ED037
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Dec 2024 16:46:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1169D16A585
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Dec 2024 15:45:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CA0AA1DA11B;
	Wed, 11 Dec 2024 15:44:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="pZ6aMIe7"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50AF61D5CDD
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Dec 2024 15:44:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733931895; cv=none; b=im/yR3Mnwke88gjfVn65zDLH18+ArdypEJYab8atGbHh1zvy6EBK6ZnMGJ+220gtYLWwzzQsnQ9YkxzOHoU5vCm+2fWIPpCMC5F56voQBVaoHsDeCSPd622af6VPqxZu8Ycuo6GNGyB+sjC0H/eAUMs9EN8ppzo+DhwpkhzRYxE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733931895; c=relaxed/simple;
	bh=Y7RUfnCiAOKkUerIqaBCl0TUIFGov53LacoipgJNjPc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=kgKFLezcjBDlXER5eFw/AHLLhBY5glKsC3fOCjRdDXUbk4y0XiZVvY2lcw4d4CgdNghpK6p2qmyHyLL64guO8jgNF20iCOAUi595bOi3yf8xxXGBCK/Eih6fY1ST/gZnhcah56l1HzzvmYHmMoptZNVPelMtx/J1Z6A7yc/KMy4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=pZ6aMIe7; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-3862df95f92so3496877f8f.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 11 Dec 2024 07:44:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733931891; x=1734536691; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=oBmna7+6RMIWIREX03MVhyyHeHj5nS5NLCMMk7SB1Kc=;
        b=pZ6aMIe7eYcI80OMcQgywNLBmxx+zZtOtQGjflMD+DILV6NKFxFSZ3YeCAtMHwHKUP
         KVXf7D6VFsfTJBLLuLsBxsO8HicK8Ub5tYFLBnzqmw+mj4K0fuf4YOG/j/u6ZuD5G9k6
         1oh82fOxNMPA9K4tEhZswbcvbpbP88hOu0GoSnRhwALU2myveTI5T2pQPL8U4s6mcBBc
         n4Ma7WUZugsr2qzYh7uhDMQIzEGzz/SRaMvJg69hGqZ5qJ0OSqls+XfSC+TXN0o1Dkee
         gkjyxPeYmGDU209HDTBKACWSdO73TVktB7TRbIJ/jUHvdvUhUjSCdmQPoZfRvjT3bh+O
         6Fsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733931891; x=1734536691;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=oBmna7+6RMIWIREX03MVhyyHeHj5nS5NLCMMk7SB1Kc=;
        b=A3Jcbgt3fLf5Y4Fffy2todGmbQCHHhgLY2rhDzgCWAHKg1nBb7S1XMJgM6n/Iu+SXr
         pJRSTr6yGX7r3h4xLwuZmxDN9bu+3bN//ro0itjex90hq9zfDfAgY2sYgrvrtWWS/TFM
         BmDmYHmSAoz0NcCZpvh6D8SBeyJ7eXMQAR9pwWUa/5F5vVJPuLhIlKS21mnyo4niVIZY
         faFuQkPSVhZpMCb0YFS6TSiJgYdBthzp88DUaOz1zY1NKGfq2IPdfPFqjbSZu5Rql7yj
         /1T7Gvz0EdSR06CPUx0JJDHIyiyi+zAMYORtmns9PfO50M/bY7nYKXvKxhh40zrmKdXn
         V8pQ==
X-Forwarded-Encrypted: i=1; AJvYcCWp99dGD2LIF8LnXvJZ8BfaEeNnHzYvWgZcjsgtFyKzxiAIhgVd7t1L1m0hvZ7tEie+ACoHK37pcBFbAJJT@vger.kernel.org
X-Gm-Message-State: AOJu0YyEpQXFYUDdSH3QnYA/Cw/ZUmAEMDrT+pLwnfX4kOamUkRZZYBb
	ffZNxWSg4rSHH0BzUs0x88H8Ek/fUDOeior4QvsPJEN+qNWpGMB/5CFnNjqwmSE=
X-Gm-Gg: ASbGnctvY4TCTPz5o9258GMEvf7q6bN0/DK2cLPQg5WYDLushEXZ0PK4GHnMyhKq/W9
	gXCT07+hYarCs7vod1MoHDxF/V8D0VhvnBkCM8+x1+eLu0bu2Be9QC1DwFuioqxeAhTVVfT1r+U
	9jxvNKzYlzGGgRSUfYtJs5z/mzlvVXg+EYSN4T4aSxnqR3/HsS03I5ODQVsc317m41Nygci/soQ
	Gt5Pfxti3k18CpEPm+L731+HLB6fIUPkdSvLdG4SQmwugiCEK2chHMkm35t0KxFe5M=
X-Google-Smtp-Source: AGHT+IEWZzmBMWvFGvTooD56kxpnFOuI8vUWhZdHT9OAfinfrH9O5pPMEGROg6P7/K5rwwn2X/PyIA==
X-Received: by 2002:a05:6000:4807:b0:385:f092:e16 with SMTP id ffacd0b85a97d-387876c41ecmr45709f8f.55.1733931891604;
        Wed, 11 Dec 2024 07:44:51 -0800 (PST)
Received: from [192.168.0.40] ([176.61.106.227])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38782514da2sm1521777f8f.66.2024.12.11.07.44.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 Dec 2024 07:44:51 -0800 (PST)
Message-ID: <12dabbc6-5813-4369-b882-2fc72333746c@linaro.org>
Date: Wed, 11 Dec 2024 15:44:50 +0000
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 11/16] media: qcom: camss: csid: Add v4l2 ctrl if TPG mode
 isn't disabled
To: Depeng Shao <quic_depengs@quicinc.com>, rfoss@kernel.org,
 todor.too@gmail.com, mchehab@kernel.org, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, vladimir.zapolskiy@linaro.org
Cc: quic_eberman@quicinc.com, linux-media@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, kernel@quicinc.com
References: <20241211140738.3835588-1-quic_depengs@quicinc.com>
 <20241211140738.3835588-12-quic_depengs@quicinc.com>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20241211140738.3835588-12-quic_depengs@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/12/2024 14:07, Depeng Shao wrote:
> There is no CSID TPG in some modern HW, so the v4l2 ctrl in CSID driver

"some modern HW" => "on some SoCs"

> shouldn't be registered. Checking the supported TPG modes to indicate
> if the TPG HW is existing or not, and only register v4l2 ctrl for CSID

"TP HW is existing or not, and only register" => "TPG hardware exists or 
not and oly registering"

No need to abbreviate hardware to HW.

>   only when TPG HW is existing.

"when the TPG hardware exists" you could also say "is present" instead 
of "exists".

You have additional whitespace in your log before " only"

> 
> Signed-off-by: Depeng Shao <quic_depengs@quicinc.com>
> ---
>   .../media/platform/qcom/camss/camss-csid.c    | 60 +++++++++++--------
>   1 file changed, 35 insertions(+), 25 deletions(-)
> 
> diff --git a/drivers/media/platform/qcom/camss/camss-csid.c b/drivers/media/platform/qcom/camss/camss-csid.c
> index 6cf8e434dc05..e26a69a454a7 100644
> --- a/drivers/media/platform/qcom/camss/camss-csid.c
> +++ b/drivers/media/platform/qcom/camss/camss-csid.c
> @@ -760,11 +760,13 @@ static int csid_set_stream(struct v4l2_subdev *sd, int enable)
>   	int ret;
>   
>   	if (enable) {
> -		ret = v4l2_ctrl_handler_setup(&csid->ctrls);
> -		if (ret < 0) {
> -			dev_err(csid->camss->dev,
> -				"could not sync v4l2 controls: %d\n", ret);
> -			return ret;
> +		if (csid->testgen.nmodes != CSID_PAYLOAD_MODE_DISABLED) {
> +			ret = v4l2_ctrl_handler_setup(&csid->ctrls);
> +			if (ret < 0) {
> +				dev_err(csid->camss->dev,
> +					"could not sync v4l2 controls: %d\n", ret);
> +				return ret;
> +			}
>   		}
>   
>   		if (!csid->testgen.enabled &&
> @@ -838,7 +840,8 @@ static void csid_try_format(struct csid_device *csid,
>   		break;
>   
>   	case MSM_CSID_PAD_SRC:
> -		if (csid->testgen_mode->cur.val == 0) {
> +		if (csid->testgen.nmodes == CSID_PAYLOAD_MODE_DISABLED ||

if (csid->ctrls ||

feels like a more natural test. Less cumbersome and also less typing.

I think that change should be feasible, could you please update your 
logic from if (csid->testgen.nmodes == CSID_PAYLOAD_MODE_DISABLED) to if 
(csid->ctrls)

Otherwise looks good but, I'll wait to see your next version before 
giving an RB.

---
bod

