Return-Path: <linux-arm-msm+bounces-83427-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 9039CC890E8
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 Nov 2025 10:47:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 865FA3A4134
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 Nov 2025 09:47:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B356931A577;
	Wed, 26 Nov 2025 09:44:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="iOJ+n71O";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ggmS0kWy"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 301E72F1FE2
	for <linux-arm-msm@vger.kernel.org>; Wed, 26 Nov 2025 09:44:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764150283; cv=none; b=l0T6Gk5dzbbbXsnbtrsqIaPtd8csnxp5FRoS4iSEI+aNkjccV0SOND2koxBjiUOzU/RI8Ejy6Sf9nGIFHAQItzzO3cC/Fs5bPVVTDsNITDbQjCeM9FdJx0h2VkQzA4qdvkz95dSPEFUmQEgbAzunDzdFhVBqQneRYrTdteLL1dY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764150283; c=relaxed/simple;
	bh=pNqR9AEM7+ZOakg8yrIPpT3k6keMkYWNBi3+IO8DwOw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=oza1fATPJGqOWwqr5HJ4emmFmqF2UhgdlBr0m2uZbrXuXSeIAhLyQrV18A2pv885rFMkViHyslwPSZDuoXq6DWiQtszd9SR8iXjp942EJBiEaOXVZVPcc4oPTnlUQFpymFJ6grpWAlPF2oA9NwvTul3TYPjcxJePgm6R/aBeuuE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=iOJ+n71O; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ggmS0kWy; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AQ7gJ5x1234827
	for <linux-arm-msm@vger.kernel.org>; Wed, 26 Nov 2025 09:44:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/EmFx9kDHRG496LzQmpF29635F3Dw2LR3j2y5b5Nff8=; b=iOJ+n71Ou8wceuNs
	+ES47Rs4zm6+tXhuLyI3r3VQWmyQGaxn6YY1Uw4qTqxqdb+Hb8TB+Sl3OtTtF8x5
	ngOSdK6aK/djQTYfFdzuw7MiKsAlTsjYzvP0uNMY/VYbEP2KhNDQChA+TORhZpdE
	hnTDAz80hmPQ1HNkhyueje/9vAZxLvGzAP9rdU8CfaX8CutsGyVitk5KoOj+HCOR
	D1sd8F3ZUvUELIGU94qvya22Q5g5La75G0kpmqynuuY0KJSx0GWQK+1Ttrk2uZSD
	1lQaLl9a7ZzlnZl2CENuAkt1gv/yeWIJNLuk1VO0EhHTQmUWRrg+nQOq1e/W0PwG
	C8JRxA==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4anwd40ch9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 26 Nov 2025 09:44:41 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-3437b43eec4so10051384a91.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 26 Nov 2025 01:44:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764150281; x=1764755081; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=/EmFx9kDHRG496LzQmpF29635F3Dw2LR3j2y5b5Nff8=;
        b=ggmS0kWyCHIcyfEWds0ekyv57gtd0sToukczu9eU9T20WEcw3Yx8tXkOw7/xDGpwic
         YJ5V6r+aOZiAAdWFLGx6ykudhBvGhia/lk2rknokQKBUtNxcGQv3BKDLvxAbiE5gbGkv
         kQQgk24V58pb2NNKYcbwdbNPKyb5ZPGMT48GWnW/8BmeNMgpF8SvsHjXaa7vgQyQs7oF
         fhWW3zuCrMku8bygCYhodKu/h6uSbY62ry3pT5OMmy8xCaihLntSauxcHhBYCyvfNU8/
         sEhoRXa8hdhNM/91wxl6IqL9jQ647hN+xKbB4fr1fMJInor96l2F/RAVq0r5FDEkL44r
         BXQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764150281; x=1764755081;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/EmFx9kDHRG496LzQmpF29635F3Dw2LR3j2y5b5Nff8=;
        b=NroVbLZIYr3KHuusGze0kO6dPnTmj064HTaLAuu32aRbvT5SlbtQT905gvv3UJ3mtc
         kpZKDvCBtZvWevbIj0vp0kX1TqbjtGHknFA5QZ23qpkhMLd+AZF+cTBAGzHmTxXUpcy1
         CTpTWYVc7G5qBxzWDIVm+josT2kT9LNoHtiPEubvAG9hsvxMiofqkIr9CC1661HIPHtF
         3jtd/K6TFhpWUc88Mwzb4bIe3VZbYyn4tmr7VvHxOwDJ1ju+mdEpZy4hQhJelyDoyAoV
         D5eH/rDULU54iVIPPlPcIyFPPpEluTQZRMfBzKg84NaHjlEzwwsc7GBo11Bhjfyd7EkY
         4+3A==
X-Forwarded-Encrypted: i=1; AJvYcCUPeFbqL4iPriXJCPHd0k/jRGe2JfnXWYBpV1crMeeAnVSZMhW+NrNWumdVdyiGbcJ9+CLLwI9x9j496+jn@vger.kernel.org
X-Gm-Message-State: AOJu0YwGdJ53PHVwvE88DtT9nTUHl5hPScWXmpnSndEqYdZaHQb6Xrpg
	azo/QQAk/zxLx/RNQIPoz/MjIFbgzU8dYUWqBemiZpYIw9zeCyd8BF2QpfmMq4jbUBvXSrR7nf/
	MC+QJHHvKX7ZrKvBHtfTuGAccmNk/DymeXlctumOVWH997C3CVnVmdFojqKE4fhbzVW6H
X-Gm-Gg: ASbGncufcqqIKYZT0YsZvjS4W3V9826prZMoGWa9MSbXmxIkyZhQnvJ2d5SGtsRlqKW
	ip4iljfq0BMVpIPRQXTcoXLnt5HtwUjsy3iZh4SpsnpwWgPCmBM6K8ek7p7ZN4w8QaDyYWSuEF7
	xevAXHBN90prXrykR1um1ESBNWRGlBIA1ITq79B8jSM6WDKCwxWcXb1SvxzSltyS/oDNVD4UOeW
	1Qp6lN8oU6bQPHNlaLllYcwZ9URb4yeHHRxTrCtU+W29EG3jTr2+w+i+I6yDbnB6H+16g3ONTN2
	bCV7ssIS/VVbDGhrBgS8uaGtAM2YBZfpyFmtjDsAtqfO14cwkb/hV9kA7z3ztJ5RQCrtgOHd0TG
	wGQbwE9o2AeOuGP+4tcU3d3vR4e+adlZGB7uWSw==
X-Received: by 2002:a17:90b:17d1:b0:340:b1b1:3d28 with SMTP id 98e67ed59e1d1-34733f332a8mr16329722a91.25.1764150280650;
        Wed, 26 Nov 2025 01:44:40 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFQWtfU4EwU3gf/sMuRF13SIm7OqPr00Bhxi3ZsMwr+VwCTnT9swDjrZG7lGrH6JtHUpscU+A==
X-Received: by 2002:a17:90b:17d1:b0:340:b1b1:3d28 with SMTP id 98e67ed59e1d1-34733f332a8mr16329694a91.25.1764150280165;
        Wed, 26 Nov 2025 01:44:40 -0800 (PST)
Received: from [10.217.217.147] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3476a54a5a8sm2024876a91.4.2025.11.26.01.44.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 26 Nov 2025 01:44:39 -0800 (PST)
Message-ID: <95918b3b-7cba-4c40-a405-b8d7d0a9fa1e@oss.qualcomm.com>
Date: Wed, 26 Nov 2025 15:14:33 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/5] clk: qcom: gcc-sm4450: Update the SDCC RCGs to use
 shared_floor_ops
To: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Taniya Das <quic_tdas@quicinc.com>,
        Melody Olvera
 <quic_molvera@quicinc.com>,
        Ajit Pandey <quic_ajipan@quicinc.com>,
        Imran Shaik <quic_imrashai@quicinc.com>,
        Luca Weiss <luca.weiss@fairphone.com>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20251126-sdcc_shared_floor_ops-v1-0-9038430dfed4@oss.qualcomm.com>
 <20251126-sdcc_shared_floor_ops-v1-3-9038430dfed4@oss.qualcomm.com>
Content-Language: en-US
From: Taniya Das <taniya.das@oss.qualcomm.com>
In-Reply-To: <20251126-sdcc_shared_floor_ops-v1-3-9038430dfed4@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: lGN9F0i7LEV9C6-eJ-L9k7U8yppiA8wC
X-Authority-Analysis: v=2.4 cv=feqgCkQF c=1 sm=1 tr=0 ts=6926cc09 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=BxFOA6ydGOS16N4CFHUA:9
 a=QEXdDO2ut3YA:10 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-GUID: lGN9F0i7LEV9C6-eJ-L9k7U8yppiA8wC
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTI2MDA3OSBTYWx0ZWRfX1Pw6XpZhczK6
 1/2H+HDHBDPQXtOtO4vnqypkF6E197yOacIkF5Qz3uxfXm5MO/1L9lCHYwOtcTWEJxzPrfcING3
 quAJPafzf3aCTb84RkaSc59XyhlScFy5/KgCGgZpCdS5VoWlwUVu8rZqv6+DeVV1jHpjJa3cQVi
 KOxecPTWhBTgjS1FMt8s5yTIT84zIWkRWbvVCGltx3mdtANUuyGdvtHSYDQ/KGS3EOmvbQfg6GL
 UhwazmImStbAujPsIpn1c5OZOnMfpBG3NjuyyJoqIkNlrFkzVp2igUSyXK6Ptv9GTuw3R6GP1Co
 05CT8jbK8PJnIxTj9C/yiKVypYIIyjsh6184n1bjX/Wi2jmr7llDK3nU9AlwbSxWwkFgit4d8gi
 7u3xdpLuYGd//KOj08xs+CRfZJampw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-25_02,2025-11-25_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 bulkscore=0 suspectscore=0 adultscore=0
 lowpriorityscore=0 impostorscore=0 spamscore=0 priorityscore=1501
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2511260079



On 11/26/2025 9:45 AM, Jagadeesh Kona wrote:
> Use shared_floor_ops for the SDCC RCGs so the RCG is safely parked
> during disable and the new parent configuration is programmed in
> hardware only when the new parent is enabled, avoiding cases where
> the RCG configuration fails to update.
> 
> Fixes: c32c4ef98bac ("clk: qcom: Add GCC driver support for SM4450")
> Signed-off-by: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
> ---
>  drivers/clk/qcom/gcc-sm4450.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/clk/qcom/gcc-sm4450.c b/drivers/clk/qcom/gcc-sm4450.c
> index e2d9e4691c5b719adfa86b904394ba85d086c12c..023d840e9f4ef0d6e9e7f16372cb9eb493f623d3 100644
> --- a/drivers/clk/qcom/gcc-sm4450.c
> +++ b/drivers/clk/qcom/gcc-sm4450.c
> @@ -769,7 +769,7 @@ static struct clk_rcg2 gcc_sdcc1_apps_clk_src = {
>  		.parent_data = gcc_parent_data_4,
>  		.num_parents = ARRAY_SIZE(gcc_parent_data_4),
>  		.flags = CLK_SET_RATE_PARENT,
> -		.ops = &clk_rcg2_floor_ops,
> +		.ops = &clk_rcg2_shared_floor_ops,
>  	},
>  };
>  
> @@ -791,7 +791,7 @@ static struct clk_rcg2 gcc_sdcc1_ice_core_clk_src = {
>  		.parent_data = gcc_parent_data_4,
>  		.num_parents = ARRAY_SIZE(gcc_parent_data_4),
>  		.flags = CLK_SET_RATE_PARENT,
> -		.ops = &clk_rcg2_floor_ops,
> +		.ops = &clk_rcg2_shared_floor_ops,
>  	},
>  };
>  
> @@ -815,7 +815,7 @@ static struct clk_rcg2 gcc_sdcc2_apps_clk_src = {
>  		.parent_data = gcc_parent_data_6,
>  		.num_parents = ARRAY_SIZE(gcc_parent_data_6),
>  		.flags = CLK_SET_RATE_PARENT,
> -		.ops = &clk_rcg2_floor_ops,
> +		.ops = &clk_rcg2_shared_floor_ops,
>  	},
>  };
>  
> 

Reviewed-by: Taniya Das <taniya.das@oss.qualcomm.com>

-- 
Thanks,
Taniya Das


