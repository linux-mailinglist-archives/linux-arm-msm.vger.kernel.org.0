Return-Path: <linux-arm-msm+bounces-88880-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 45F96D1B4BE
	for <lists+linux-arm-msm@lfdr.de>; Tue, 13 Jan 2026 21:53:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C486630A0F4A
	for <lists+linux-arm-msm@lfdr.de>; Tue, 13 Jan 2026 20:53:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 48D3431AF07;
	Tue, 13 Jan 2026 20:53:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VlH/BiqW";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bubgec4K"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB44B318EFB
	for <linux-arm-msm@vger.kernel.org>; Tue, 13 Jan 2026 20:53:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768337629; cv=none; b=kJcC67gwaUjw9S2LXTHvknYnQ9uLrlIHJFKZq5zBTZr3dkMgs8JQIbkr6NnEysdB/QNlx9cycn36qp4dEV3zlURKfwzk5m83DYbYeabk1jsnCfMH8b/KpRV0i4+7JsGrlxULeRzsPdqoRheNfbhmvzDzbO1sH+lKwLcwIkrjYFo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768337629; c=relaxed/simple;
	bh=/7bIFzYyfl+31sKjQggmwqyoEPNR5xP3+nn03WYuGRA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=rS6qbO94Ls4Q1LaSOzz0xYEw/HKqacLbWGtr0wgNWADo/r8Jnb8eKxLb55J1GB252h48aVK9+cfFcg1S8q7fdutN67g3MNCQ+UAHz+57oGGC11fvlQi6T2VkPvh292MiYtg8ORWtIVeZ91IQUejVFrevJO8uuILTP70aG7lAw2Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VlH/BiqW; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bubgec4K; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60DKaJii1390538
	for <linux-arm-msm@vger.kernel.org>; Tue, 13 Jan 2026 20:53:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	0ZWU+g9QjzL0tqtxM6fgFHBpVcn+auaOkUPAWt/mGUY=; b=VlH/BiqWg9vWw2o6
	LfhC0Hg6qQRKgdxjBq6UFdRqXVK/hBcEfDLjf99DCEF4vb/ycdb99XBxdd/6B/ui
	11G9FCS0+1Haim9B/DmcM4RE7DCZWwXpescN577xB2mIzHkQvnYxRGBYuphRNySd
	vtkv+DQmMCqlI/tRLtlw4YTAFD/UHPMeemReduwClZLr3lu6kn0BsP9QL+e7HvL+
	ITecF1zT5kefyRd5PF8v34DWTLbJGU9g9Pw91Tnu2+pK7MyR94DiMP9WKBVgq7Io
	atGjd0Y+3tz83AEoOkyAhPe0KEl9SJOjtjSkmD6tvgP33TyTAzpRQhynxjC9XceP
	29fXNA==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bnw7v81e8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 13 Jan 2026 20:53:47 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-2ae29a21e7eso263153eec.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 13 Jan 2026 12:53:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768337626; x=1768942426; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=0ZWU+g9QjzL0tqtxM6fgFHBpVcn+auaOkUPAWt/mGUY=;
        b=bubgec4KKgmz+DWq2PG6lVQ3Hyp1OKAM9wCXKprCm+6n3/BLwQViGopY95sFEdbES/
         E3r9E79jfkFiZXuVuVf3Ju6bWShq1eKcWb3uCyIA1kYVkIFes4wt/9lWUGeT83wxBlPB
         WvxAgKifXR+wknRvYPFDFHyJw4hOt4hQ/dVYaEsga+2KoNN6g76ngxnsNm+hGy9iSd9U
         5kWouV12HQ5QRQ953KOwbP8Tr/R1Q4ByCLwPlcRdxMIs5uAydvYT0QG1HMe+amMoRMY4
         O4YJpiNDWq922wByK9hEkbf4YHHx0MRrX4OBZHP8ruHz6isRXFkZPNFfWbr4IgA/yPpL
         kKHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768337626; x=1768942426;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0ZWU+g9QjzL0tqtxM6fgFHBpVcn+auaOkUPAWt/mGUY=;
        b=bwnP80plMLHRHjfHZ4z/lMeu7KtJ7TevZTVq0VZnXzYea7R2VvApnjIKXgmxWPPRJD
         loSNFRPNkrBMaQBDpeTML+fdzvNiyCZk7cvsI06I3TOiQfrtypgkJOYU1vV0d4vi3dWh
         5ib4HTh0dByHEiG6KEzbuIlCEm8azNBHEaMJDGanIvcGI5iWcPRWLCih5E4AZF0VD37p
         Ju8HyVSo0WA3DstYf+BB9gKpAwy5fbJlF3+X9UvnGD0I/u2dcRrcnoiboZOXNr+y7TaN
         8UdLR9Ffu6B6lB4rqeu0YXahzq84eJCUmJ2VAHyXbpEcHj++5mw3oLEtqtV8uE26J9gd
         1EuA==
X-Gm-Message-State: AOJu0YzhTUCtE3WdP2BstrjujHZQlvDns9PDnyrMMATxPvVHgpdCizST
	2MpXoia0tfODrB9Q/Un0k2juCVQlGpuN0xsNLimZuT9sNQm0t+7FwxpxCEoDCHmob/35RoroI64
	hEvSvBiN28lAcs6njOBbeNK4+QX89qHIp1DgdgHaqJ91z2kzUeRNUEvNbyyt7BjD1fOow
X-Gm-Gg: AY/fxX4rX4jmhx+q0cJdlQabuaIMLjtqPl6t7eIUEoBR2gCa9wrahbKMNlvfAAJ3qut
	i8vXVyHXJFezdJs/1RiHn4ZDBhCyv69KB56KXDh8hJ3yk4BVvx/npJlJiFzxuUA19fLSjsEaRRF
	ZK4OOrVzzNwu3828NhLx4HsOsWUJ5SZ+u4GaMCAZs3Oynv79GH/yvawIZdPdjUdeS0xPoO5YWKd
	UNyfBg2lY01yI+UvYMu9uWIHNpoNZd4bi8rRtKiUJdicsO0+bg3XG1yQL/ZZhYK9kxi1+sRgqEO
	FdqxS0+xzV2RsloU7ubjS1/wRwSg3rpJDRUUM/YsUPNAq7ze3IMsaawGNr6HzrF0Uz0FycnnFnP
	Mku5yjuJ+3yTAr/DZ0c3+SpEn9jAhY56S3P9pNVGSOrRfjT2hx8DxFHamdWEAnHliNA==
X-Received: by 2002:a05:7300:5353:b0:2ab:9c11:4c91 with SMTP id 5a478bee46e88-2b486de3db6mr365843eec.12.1768337626295;
        Tue, 13 Jan 2026 12:53:46 -0800 (PST)
X-Received: by 2002:a05:7300:5353:b0:2ab:9c11:4c91 with SMTP id 5a478bee46e88-2b486de3db6mr365816eec.12.1768337625723;
        Tue, 13 Jan 2026 12:53:45 -0800 (PST)
Received: from [10.62.37.112] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2b1707b21dasm20399681eec.27.2026.01.13.12.53.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 Jan 2026 12:53:45 -0800 (PST)
Message-ID: <61801034-225f-429c-9f34-f80044506bf3@oss.qualcomm.com>
Date: Tue, 13 Jan 2026 12:53:43 -0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/5] media: qcom: camss: Add SM8750 compatible camss
 driver
To: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>,
        Robert Foss <rfoss@kernel.org>, Todor Tomov <todor.too@gmail.com>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        jeyaprakash.soundrapandian@oss.qualcomm.com
References: <20260113-sm8750-camss-v2-0-e5487b98eada@oss.qualcomm.com>
 <20260113-sm8750-camss-v2-2-e5487b98eada@oss.qualcomm.com>
Content-Language: en-US
From: Vijay Kumar Tumati <vijay.tumati@oss.qualcomm.com>
In-Reply-To: <20260113-sm8750-camss-v2-2-e5487b98eada@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTEzMDE3MiBTYWx0ZWRfX2950wHfXbu5L
 6H6FUsEzE9sAu6sjlbXbmnVBzdmbdm9Yr4XDeg7yrH6+XlY4QtGV2q1bsUa2yfx8VLQ8CzMeifH
 zictgl6f4npXAnUbsUYY56+YwkTCci0jgBIwWNlcaPWJP1BM0xUkNheKxdEWxs/IiFi6ElNrf8Q
 VYO6eNAVo1WhxPLKfcnQDnX3XNebl7XYTwSE8R1VIfOZ+iSYOfpXTocrovqzFqp6SoCfKcmccW0
 48xFzVlt4j/N/M6LXfSSY7jzHeMPGTus64obcdNx7XJc6vOgwXLUgZfRnVlkoL8N71YE80wc7Se
 1mvC+IaDGh3tkhe/FF9+fZRNiM9mzbMBJ7WmPWfB+kmz8tETXfP09zLwQ7rgtvPCsj6fnapK8DO
 coyDwhJpPBNR/CEegSbR7/bkWPxI+80NPwKa7a3pi04C0Wy0mgbhDUx+hUug5zjH2NEuLfUTiID
 hS9gk3rsrlviBE1VNWA==
X-Authority-Analysis: v=2.4 cv=PJ0COPqC c=1 sm=1 tr=0 ts=6966b0db cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=6gQvxzz4ZpawDXRFAvoA:9
 a=QEXdDO2ut3YA:10 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-GUID: ReLlDDFgMfIDcYxS9N73M4Zr0oMatu-k
X-Proofpoint-ORIG-GUID: ReLlDDFgMfIDcYxS9N73M4Zr0oMatu-k
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-13_04,2026-01-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 suspectscore=0 malwarescore=0
 priorityscore=1501 adultscore=0 lowpriorityscore=0 bulkscore=0 phishscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2601130172


On 1/13/2026 2:28 AM, Hangxiang Ma wrote:
> Add support for SM8750 in the camss driver. Add high level resource
> information along with the bus bandwidth votes. Module level detailed
> resource information will be enumerated in the following patches of the
> series.
>
> Signed-off-by: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
Hi Hangxiang, I believe some reviewed-by tags are missing for these 
patches. Can you please double check?
> ---
>   drivers/media/platform/qcom/camss/camss.c | 22 ++++++++++++++++++++++
>   drivers/media/platform/qcom/camss/camss.h |  1 +
>   2 files changed, 23 insertions(+)
>
> diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
> index 36ff645d9c1e..56f20daeca3e 100644
> --- a/drivers/media/platform/qcom/camss/camss.c
> +++ b/drivers/media/platform/qcom/camss/camss.c
> @@ -4066,6 +4066,20 @@ static const struct resources_icc icc_res_sa8775p[] = {
>   	},
>   };
>   
> +static const struct resources_icc icc_res_sm8750[] = {
> +	{
> +		.name = "cam_ahb",
> +		.icc_bw_tbl.avg = 150000,
> +		.icc_bw_tbl.peak = 300000,
> +	},
> +	/* Based on 4096 x 3072 30 FPS 2496 Mbps mode */
> +	{
> +		.name = "cam_hf_mnoc",
> +		.icc_bw_tbl.avg = 471860,
> +		.icc_bw_tbl.peak = 925857,
> +	},
> +};
> +
>   static const struct camss_subdev_resources csiphy_res_x1e80100[] = {
>   	/* CSIPHY0 */
>   	{
> @@ -5487,6 +5501,13 @@ static const struct camss_resources sm8650_resources = {
>   	.vfe_num = ARRAY_SIZE(vfe_res_sm8650),
>   };
>   
> +static const struct camss_resources sm8750_resources = {
> +	.version = CAMSS_8750,
> +	.pd_name = "top",
> +	.icc_res = icc_res_sm8750,
> +	.icc_path_num = ARRAY_SIZE(icc_res_sm8750),
> +};
> +
>   static const struct camss_resources x1e80100_resources = {
>   	.version = CAMSS_X1E80100,
>   	.pd_name = "top",
> @@ -5518,6 +5539,7 @@ static const struct of_device_id camss_dt_match[] = {
>   	{ .compatible = "qcom,sm8250-camss", .data = &sm8250_resources },
>   	{ .compatible = "qcom,sm8550-camss", .data = &sm8550_resources },
>   	{ .compatible = "qcom,sm8650-camss", .data = &sm8650_resources },
> +	{ .compatible = "qcom,sm8750-camss", .data = &sm8750_resources },
>   	{ .compatible = "qcom,x1e80100-camss", .data = &x1e80100_resources },
>   	{ }
>   };
> diff --git a/drivers/media/platform/qcom/camss/camss.h b/drivers/media/platform/qcom/camss/camss.h
> index 616ed7bbb732..2a53524dec93 100644
> --- a/drivers/media/platform/qcom/camss/camss.h
> +++ b/drivers/media/platform/qcom/camss/camss.h
> @@ -91,6 +91,7 @@ enum camss_version {
>   	CAMSS_845,
>   	CAMSS_8550,
>   	CAMSS_8650,
> +	CAMSS_8750,
>   	CAMSS_8775P,
>   	CAMSS_KAANAPALI,
>   	CAMSS_X1E80100,

Thanks,

Vijay.


