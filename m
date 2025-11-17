Return-Path: <linux-arm-msm+bounces-82090-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B10CC64069
	for <lists+linux-arm-msm@lfdr.de>; Mon, 17 Nov 2025 13:25:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 2AB214E1207
	for <lists+linux-arm-msm@lfdr.de>; Mon, 17 Nov 2025 12:25:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8584B32BF2F;
	Mon, 17 Nov 2025 12:25:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bJjxcy1M";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="i5MmBRm2"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5ED012EA171
	for <linux-arm-msm@vger.kernel.org>; Mon, 17 Nov 2025 12:25:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763382331; cv=none; b=QW3Bdn6TzLPzd79caya7LVJ5mYnSeb+pBBO9+YHaOSRzSsMLJsGOCXUY/JQ0Y4bvIZD2alxAi4oXBW7aG+XqHWNgRupRkZABOMWogvHGqBWXUI1195xxyMYUkpXK0d4+77FyHNVQMLIOwO3flFhYM9blG51LZYcEkc7+x+eT/7w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763382331; c=relaxed/simple;
	bh=P+d8sacZyxf8sOydE5J52llTLlCPE6rJ4wlA6grSKz4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=otYh3oFBPfj0MUhZbYjZkNkgHQNd988dZJV+ezNqVNXM/FaZkShJBOWTI4X6CHBVtWEKOBjZkjKc+IRTaY96mUfyTm+n7TePHNpJ79SumHef5UBHPbK6255/TNt0EZkKTBYLFFziVxGwqsZUmHK16J+FYs/QcixMCFW04mlfEZc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bJjxcy1M; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=i5MmBRm2; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AHBdOMF2790480
	for <linux-arm-msm@vger.kernel.org>; Mon, 17 Nov 2025 12:25:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	HcnBJ0YluvnOiX+mgFmMGToDm0+SVzO/dQb3CrYR4QA=; b=bJjxcy1MmyOMeQsg
	t/uCJd+U/GecRFpgR+/F5UBzl/VgWtDR3X8MIHetrGKZubUwx4N2nhPxpIak5LFm
	Izuu9rmZIBncbiKzJN2QSMJ3IwIvo4Yj59grMY03/T/+8CQdq24vwnG5yAKMh+rp
	IlWux5ZO/ht54qpIhPErOhVgAIJ4DmrLW5SpLGsLubpXOz+KS9BY02x7CLMAf6MN
	a+TJLa3NoTmzrWCrANLqqxRSYXDZSCc/Nq0ySZVPYtnrCrmInFju+P0IpT7D3KfQ
	KyXY1I8MnvZfLT6/tnuigPkHhXETIqBncih5AJAy7EyHO5oygBhSFafF3x8JonGq
	3NA7ew==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4afu5bhjq2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 17 Nov 2025 12:25:28 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-8823e9c63c6so16158656d6.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 17 Nov 2025 04:25:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1763382327; x=1763987127; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=HcnBJ0YluvnOiX+mgFmMGToDm0+SVzO/dQb3CrYR4QA=;
        b=i5MmBRm2STETC3m3I8wQ+CxfiloMoBuzdMUAyAQD/Jq1DvPwKH35lognF1c3rs8rp2
         zW8k8jYtwQoTwL+qWgDKjr5Ld0INlDjgV6nqzjzzat+P8DvfIFTXAbY6lJ7cI08ZvrMF
         o8Jg0f+pUnZify3ATE9t0n8l4Tq48pC23rX9YNnxchaxYVcUZDiSAYBsScPb3zHg+NEO
         zwte8wqYtHac+91XnrIoTkQ0YVQGDbQ5uWORoRlDqdF+esDFMLxP4dvSQXfq7nMnU5+0
         p0Atz7mbDzVvWpiyZUNuCezMjaevDRtSXUAc3Z8PO17+nAn6FkQACW5l3VkbH7lMmdwO
         G5Ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763382327; x=1763987127;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HcnBJ0YluvnOiX+mgFmMGToDm0+SVzO/dQb3CrYR4QA=;
        b=Lko+7nct0J92zKPzIx9KjU8Jyq6CC7I5CaLbjtmr06ZlemVVSAm7SOyFS2EzihLKVq
         NHjErMT0aU5JyPLqT/3riMw2sqtpSTGe6F61egnR3NCbaR4wNdou5MVL+o5IPQq7pNCq
         p45tccway+t/EbU3iMpHu9W+xM23QyONUBlEXdHsRCtzRnE4zDqv50k4owmF84zMv6mA
         1EaVA7KXk4ejVyT2D6fzuB7KWxj9IsburSrWrGnsi8NaN7PAD0oRvvMeAvxcJAQL5pEd
         /pFQ66zc780i/OE8ZtRiyhYZILX2+kTbxchOM6De5Ss9eBfx6uJMtE1rmoGGHP4ELgVh
         AG5A==
X-Forwarded-Encrypted: i=1; AJvYcCWB2GIhwEosA+6vMojFhoVz3kf//bo3VMOIxEIaiQDOxnSD+jhsnlf+iwz5Y/evshEfZA45KpqpHbf3wKDD@vger.kernel.org
X-Gm-Message-State: AOJu0Yzc4Z0opexJ2ITqG37UCijaxRMxiLpQlU/r/zFiNGgxscWy2zRM
	0P1ViirmFAsw1oILK/NmBLtKr84Xe0UCjAv9k4jzDExpIC8Sd8KPvgfhCWOI9iu86woL/p3JoKV
	kM5BxILl8HtKZgM7chn7FtrTKZTT3UVIw+79ojlxc83oQRaBttDcXEM45DpMX6Kq8ry9a
X-Gm-Gg: ASbGncuFLfeUK2jhNoO2LTWhKqwfFT9D+aKHjWVjgCKlGG0pspaG+ros/lTQU1Dpc4Y
	vhet6k9Xz4L5jlfmu6D1AQkZwK4ZvEWPiq4SpyAXEhyWVThT00EIFwBz8wBgxkMWhdI8oU+APwV
	uXggdNIbBdujylKK774JJiqpsFwi/FXlxQ1eHDP0qnkETxU3tr3WYcJus0qPda2CaBMuBmF+vIv
	I7zD/0buTYEXcmhQpYpQKsJgwBfJSg4GbmsAVlxJPdQhMufGm3OoqVWaZbR6gi3roLdROSG//UL
	slwnc9sd0HwHjkJon3ilONzUg8/ANcOia6VNddW9zWuSR3C/72v04YueyeiQz1xwGhzFpXLYOJ1
	fCGTU/ZGo2P8d3QBfphOPty01XI0NPrmyr+FFv+9fMo700cDgNDDvJowM
X-Received: by 2002:a05:622a:1789:b0:4ee:1fbe:80dd with SMTP id d75a77b69052e-4ee1fbeada5mr30186221cf.5.1763382327441;
        Mon, 17 Nov 2025 04:25:27 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGFfSNmU8uxLAx2+GBUaC/bFUZi8vJWAJobCJFphyvwWR5qcEz6mk2Tyl/ktuieNSquY5mhGw==
X-Received: by 2002:a05:622a:1789:b0:4ee:1fbe:80dd with SMTP id d75a77b69052e-4ee1fbeada5mr30185981cf.5.1763382326879;
        Mon, 17 Nov 2025 04:25:26 -0800 (PST)
Received: from [192.168.119.202] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6433a3f8e6dsm10158525a12.10.2025.11.17.04.25.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 17 Nov 2025 04:25:25 -0800 (PST)
Message-ID: <121a5d34-e94f-4c29-9d58-4b730757760a@oss.qualcomm.com>
Date: Mon, 17 Nov 2025 13:25:23 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4] crypto: qce - Add runtime PM and interconnect
 bandwidth scaling support
To: quic_utiwari@quicinc.com, herbert@gondor.apana.org.au,
        thara.gopinath@gmail.com, davem@davemloft.net
Cc: linux-crypto@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, quic_neersoni@quicinc.com,
        kernel test robot <lkp@intel.com>
References: <20251117062737.3946074-1-quic_utiwari@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20251117062737.3946074-1-quic_utiwari@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: NL5U3F3QavDqCyC6KtQkZ01Nu06mC_Yg
X-Proofpoint-ORIG-GUID: NL5U3F3QavDqCyC6KtQkZ01Nu06mC_Yg
X-Authority-Analysis: v=2.4 cv=Xvz3+FF9 c=1 sm=1 tr=0 ts=691b1438 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=QyXUC8HyAAAA:8 a=COk6AnOGAAAA:8
 a=f8mhDL4D-r229udWvQMA:9 a=QEXdDO2ut3YA:10 a=iYH6xdkBrDN1Jqds4HTS:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE3MDEwNSBTYWx0ZWRfX5DvJlxK92F9P
 dGTucdgIhzY9rMYbKNGdAEfhDnwtM6KiUO/hImEfUd88F9N2l9tLXWt3WjLKe7Vk5LJ6teFG3KA
 HyBtiyP5q3cPQ8NnHKMPWKqJKSfjBRSDg3stAWTxzmGZyIr7oAauCIPnDCc18/ERt1J4aTItpma
 xnlB2Z3D9WJSMoksNQprjUMvg/iDTi/hBfC3ddonODtZJO+rJYa0GgnziZ8KiWtZ0JV8ACTHU1n
 f/NhSOpkOyEjmKG8ksN7xVgJYJsSriQdFJtSx+x9G0tzrO9azA4tOyippHlgWVDpU3KDkA1fOaP
 B4pwERcZvNmQghbHpTxelaFkmj+NIiCDod2oA+BhmPbzz4SPZ14MYuPIQvVC/EgRlgrpbjilr8y
 ZpWrLC/mVIcXmp5uvdViNbzPBqpScQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-17_03,2025-11-13_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0 lowpriorityscore=0 spamscore=0 bulkscore=0
 phishscore=0 priorityscore=1501 clxscore=1015 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511170105

On 11/17/25 7:27 AM, quic_utiwari@quicinc.com wrote:
> From: Udit Tiwari <quic_utiwari@quicinc.com>
> 
> The Qualcomm Crypto Engine (QCE) driver currently lacks support for
> runtime power management (PM) and interconnect bandwidth control.
> As a result, the hardware remains fully powered and clocks stay
> enabled even when the device is idle. Additionally, static
> interconnect bandwidth votes are held indefinitely, preventing the
> system from reclaiming unused bandwidth.
> 
> Address this by enabling runtime PM and dynamic interconnect
> bandwidth scaling to allow the system to suspend the device when idle
> and scale interconnect usage based on actual demand. Improve overall
> system efficiency by reducing power usage and optimizing interconnect
> resource allocation.
> 
> Make the following changes as part of this integration:
> 
> - Add support for pm_runtime APIs to manage device power state
>   transitions.
> - Implement runtime_suspend() and runtime_resume() callbacks to gate
>   clocks and vote for interconnect bandwidth only when needed.
> - Replace devm_clk_get_optional_enabled() with devm_pm_clk_create() +
>   pm_clk_add() and let the PM core manage device clocks during runtime
>   PM and system sleep.
> - Register dev_pm_ops with the platform driver to hook into the PM
>   framework.
> 
> Tested:
> 
> - Verify that ICC votes drop to zero after probe and upon request
>   completion.
> - Confirm that runtime PM usage count increments during active
>   requests and decrements afterward.
> - Observe that the device correctly enters the suspended state when
>   idle.
> 
> Signed-off-by: Udit Tiwari <quic_utiwari@quicinc.com>
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202511160711.Q6ytYvlG-lkp@intel.com/
> ---
> Changes in v4:
> - Annotate runtime PM callbacks with __maybe_unused to silence W=1 warnings.
> - Add Reported-by and Closes tags for kernel test robot warning.

The tags are now saying

"The kernel test robot reported that the QCE driver does not have PM
operations and this patch fixes that."

Which doesn't have a reflection in reality..

[...]

> +/* PM clock helpers: register device clocks */

Missing \t

> +	ret = devm_pm_clk_create(dev);
> +	if (ret)
> +		return ret;
>  
> -	qce->iface = devm_clk_get_optional_enabled(qce->dev, "iface");
> -	if (IS_ERR(qce->iface))
> -		return PTR_ERR(qce->iface);
> +	ret = pm_clk_add(dev, "core");
> +	if (ret)
> +		return ret;
>  
> -	qce->bus = devm_clk_get_optional_enabled(qce->dev, "bus");
> -	if (IS_ERR(qce->bus))
> -		return PTR_ERR(qce->bus);
> +	ret = pm_clk_add(dev, "iface");
> +	if (ret)
> +		return ret;
>  
> -	qce->mem_path = devm_of_icc_get(qce->dev, "memory");
> +	ret = pm_clk_add(dev, "bus");
> +	if (ret)
> +		return ret;

Not all SoC have a pair of clocks. This is going to break those who don't

Konrad

