Return-Path: <linux-arm-msm+bounces-75097-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E6D0FB9F4CE
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Sep 2025 14:40:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 99EE31775B1
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Sep 2025 12:40:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7A4D115B135;
	Thu, 25 Sep 2025 12:40:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mkyxQbXL"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF0631A0728
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Sep 2025 12:40:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758804053; cv=none; b=A8C/nmi/0PQjOApHnKidUw6SpNfKJpqG4zOs0LA1HLUDNk/3wQYOgT4V/1mGYnJ8qm3s+5KNXm1d02uM4x1uWssSGxJfmZ+A6vVZ6LZhEKkvZxpxnRUdddYwxgGUptwvEq0x+wb8Glpz8F/wM4YI8vHvrYY3H0/P0O9+h7IC8Wc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758804053; c=relaxed/simple;
	bh=AhGGCS6dDI+GEQk34E+bshyvtzLQAsH6srofQOixnko=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ZaEzBbZyxT29V2mxAZH35QtemJQvWO8UEiu1Gwz/sCWov1SiElF1FCRFHEYgLsrOjPBjmdw/oD/5q4PLYw0VNfP9t0hJ+ICnSxTzIE6+lMHdGBsQszQhIR0JA9mbniwUL0eBVH1f2KBaBfl7ClE/2c2a3YD2wflEY4dUMN/4D7g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mkyxQbXL; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58P90Enb027782
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Sep 2025 12:40:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	7DA5QlEXLvO5wlCLJTK0tIK5026blUS+NEp9jsrNDPI=; b=mkyxQbXLg+VJXAgZ
	bza7J42SJZPEgNsNAeBceG/gVepjIMmlfexF361ghuqmabdWDK7IJVs4bCY1iAfD
	dr4erPtvdC6GWRtZvNIEIM+pYvwE4qePtN9oLMdXw1/5rkzcwAHvL96feWaU73Yf
	4SMTgnlaccwedgwH2RabZ/6MtEOcAlVdNH485U31kd44eVVgLYO1F+eR364x93CA
	85MQbzFo3UXgkOnXCKOAolW9Ly+XnFoAGl43CzDxCiZyEtBZDkoebd0g2TjHuIMS
	qnIm6FqsvB2GZtqgUUKtH0qn1k+h3fOH6qJwGaMrH1t3w68MHd8rctvXYMkZUZed
	nTNTbA==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 499hmp0f8y-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Sep 2025 12:40:50 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-795cd25af0aso9053506d6.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 25 Sep 2025 05:40:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758804050; x=1759408850;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7DA5QlEXLvO5wlCLJTK0tIK5026blUS+NEp9jsrNDPI=;
        b=mS4u+mXcFtTv8gIDdPb1UZGj3Y98dHdwPzrA92n9IVPgq8O1NVPHY2/22WJsYsHBZ5
         b5qiQhEqDbLf4x1mBFtu1TWVai8tS+qY1CU22gCxHEuMqS5kVxUlzXMBYHng4WSN5hgz
         6t1TO/Wyrw3wZQeRWVWcsdL6hmkQ6QVi8bnOWrsM4Z1S2wNVIWKALZjPjbCHvXC5+yYx
         87/ZXGxcENZ3xYkTnM5KXzpAN1uyNmEZQyd09HAgA7x4aDoLGBq1Aa0H1sPB8gkUJX1U
         wlSqH4VfMBq08tXa+j81UO40VcdTmXupjgAYORkuHOl4ZZ0XgZ2VPH/TMXFS2H6wXuc/
         4U7g==
X-Forwarded-Encrypted: i=1; AJvYcCU23uut/lwC3YefiJdR7KFp0HQVhECCVRSTntnZagte9OVA3tSp1/xbvNnPREO5UkwzxKhBScd6654wZlnU@vger.kernel.org
X-Gm-Message-State: AOJu0YzTcAiUNrNLmtE0H/5BNtE6Nj4gaEdVH6fgUCyJysILLYkJwqi4
	drq+YcVDNBiQNAinOx21FtmZPqSYSgnGzvJAg3JVF1qotbGZK2Ab7VI44Oy1Qkwt14EtnnIcqBi
	6vXpPKmU7xIUpbPrDAgkxWTnpc0VRj2j3zk5+nIL1bs1VyKIP6Kpz/eWPQvMC3MfB/KlJ
X-Gm-Gg: ASbGncvh3LdwL3bmDSBYrueGMu1dHQG0b1QU0oOLVLj1JvNV9KhrNJOIMMgBrYrETTc
	VtOJiDl2EqWHvSVwDp1JgeBUaHdNkA//MyoMDvu6et70VgWFiwCKjZAsoEZXzzdKv1TGKWyr4KT
	sDh099u4O5Qs38PBgJ1+2PMf4lSCr9JUK2ZkmNNG8E29Lh/YTxHDvuXM8MgQIldjxLuuGQMqZ8d
	PLowZQKztOjmUt/gxmqWBM5xxqcRviAYaECjVzxJOkZQUJ0IhTCnSBvMqotzrX9Rg371IZgwROh
	3xOv2i/LRNBDAgi+oxE5nbQdC2Rsz5Q+cIP6dncw540qGonpMX87uq24MEwXa4gqGB0=
X-Received: by 2002:a05:622a:1493:b0:4cc:1ef6:9c07 with SMTP id d75a77b69052e-4da4bbe5ef9mr35814321cf.60.1758804049749;
        Thu, 25 Sep 2025 05:40:49 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHX85mpHDw23mdnZOpD/BzldlFTXbeXvu6iZKgjDkleBCCGikK22j+c/QmDKXYYH6nMkDB1xw==
X-Received: by 2002:a05:622a:1493:b0:4cc:1ef6:9c07 with SMTP id d75a77b69052e-4da4bbe5ef9mr35814031cf.60.1758804048934;
        Thu, 25 Sep 2025 05:40:48 -0700 (PDT)
Received: from [192.168.68.121] ([5.133.47.210])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-40fc5602dc2sm2881204f8f.32.2025.09.25.05.40.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 25 Sep 2025 05:40:48 -0700 (PDT)
Message-ID: <fc956fe4-e4f9-4f34-b1c1-1bc23125494a@oss.qualcomm.com>
Date: Thu, 25 Sep 2025 13:40:47 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] ASoC: qcom: sc8280xp: use sa8775p/ subdir for QCS9100
 / QCS9075
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
Cc: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>,
        linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20250924-lemans-evk-topo-v2-1-7d44909a5758@oss.qualcomm.com>
Content-Language: en-US
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
In-Reply-To: <20250924-lemans-evk-topo-v2-1-7d44909a5758@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=YPqfyQGx c=1 sm=1 tr=0 ts=68d53852 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=IA5jmXtsaGuytGhItUkA:9 a=QEXdDO2ut3YA:10 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-ORIG-GUID: -4Cpc__fb_Y84G6ZfbHgHAJTyKiqcBWl
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTIwMDAwMCBTYWx0ZWRfX4r0hHwnisukq
 B86dyUMPYCBVhBzmkg2S8udx2V2nedCkI+QnzxQftc27i+KL91TJCxN0uOoPy9EPdiQ93oZ99EW
 Qn9vrmFMEeEFkBBEP6UMCw6Y1amYUJT37W7x4BpT3zDczKm8ceBMwggFNN2UwMNIGoZ880wEIlf
 WsW3zj6mvnnQgM+pk8M6XKw9RPX+8A/XT5LudLA35zSMLbk/xPnxcsh+EDHLUVWOHmXxF34xi++
 SCIdwdOsgP3eLvyLkD0A+i+Koz68tL+hLeuhxd9LkUNNZ6EHsfGqOMDRQBKsuhjzBl1FOkFRgGB
 Iz6WaEaRVn6RxbAKd3aAfY7sKOs+/4BdGo8LoZVXtNdzlbylc4LReyn5raI7/6NSUhIzL8M+6k0
 54aon82v
X-Proofpoint-GUID: -4Cpc__fb_Y84G6ZfbHgHAJTyKiqcBWl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-25_01,2025-09-24_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 priorityscore=1501 phishscore=0 adultscore=0
 clxscore=1015 impostorscore=0 spamscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509200000



On 9/24/25 8:34 PM, Dmitry Baryshkov wrote:
> All firmware for the Lemans platform aka QCS9100 aka QCS9075 is for
> historical reasons located in the qcom/sa8775p/ subdir inside
> linux-firmware. The only exceptions to this rule are audio topology
> files. While it's not too late, change the subdir to point to the
> sa8775p/ subdir, so that all firmware for that platform is present at
> the same location.
> 
> Fixes: 5b5bf5922f4c ("ASoC: qcom: sc8280xp: Add sound card support for QCS9100 and QCS9075")
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

Thanks Dmitry for cleaning this up,


Reviewed-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>

--srini
> ---
> Changes in v2:
> - Rebased on linux-next (Mark)
> - Fixed commit subject (Mark)
> - Link to v1: https://lore.kernel.org/r/20250918-lemans-evk-topo-v1-1-9680600e62d4@oss.qualcomm.com
> ---
>  sound/soc/qcom/sc8280xp.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/sound/soc/qcom/sc8280xp.c b/sound/soc/qcom/sc8280xp.c
> index 3cf71cb1766ed7e3d6caf6a74876f6102ddcbc41..78e327bc2f07767b1032f09af7f45b947e7eb67a 100644
> --- a/sound/soc/qcom/sc8280xp.c
> +++ b/sound/soc/qcom/sc8280xp.c
> @@ -194,8 +194,8 @@ static const struct of_device_id snd_sc8280xp_dt_match[] = {
>  	{.compatible = "qcom,qcm6490-idp-sndcard", "qcm6490"},
>  	{.compatible = "qcom,qcs6490-rb3gen2-sndcard", "qcs6490"},
>  	{.compatible = "qcom,qcs8275-sndcard", "qcs8300"},
> -	{.compatible = "qcom,qcs9075-sndcard", "qcs9075"},
> -	{.compatible = "qcom,qcs9100-sndcard", "qcs9100"},
> +	{.compatible = "qcom,qcs9075-sndcard", "sa8775p"},
> +	{.compatible = "qcom,qcs9100-sndcard", "sa8775p"},
>  	{.compatible = "qcom,sc8280xp-sndcard", "sc8280xp"},
>  	{.compatible = "qcom,sm8450-sndcard", "sm8450"},
>  	{.compatible = "qcom,sm8550-sndcard", "sm8550"},
> 
> ---
> base-commit: bf2602a3cb2381fb1a04bf1c39a290518d2538d1
> change-id: 20250918-lemans-evk-topo-dddd73c29024
> 
> Best regards,


