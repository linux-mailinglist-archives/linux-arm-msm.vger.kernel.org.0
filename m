Return-Path: <linux-arm-msm+bounces-84654-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id EF33FCACED2
	for <lists+linux-arm-msm@lfdr.de>; Mon, 08 Dec 2025 11:55:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 484FB306AEE9
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Dec 2025 10:54:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B58FA2E9EAD;
	Mon,  8 Dec 2025 10:54:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="aVBxkF1d";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="CP8khLrX"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2614B2E7F32
	for <linux-arm-msm@vger.kernel.org>; Mon,  8 Dec 2025 10:54:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765191271; cv=none; b=KYPaeOnwnVMXM2GBHvx4FP/OWMotGfwOza2FB37yjWxm8FT3jGl9UlthJLU4eyMwOy0HfcLPI6z2yVidfUe0srXY8YL71/ZUUyUOuwL4hzZ0n9P+ebRzEoMAJYXOvdYs0jfYt9kaclrXyfShpAsbKgZ599jGxYgERf/ZX27gwmw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765191271; c=relaxed/simple;
	bh=L2PFKeWLruFT7HhSZW1fWbSIekQGNtX6aWxeUgNX2rE=;
	h=Message-ID:Date:MIME-Version:Cc:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=cL05n43eq60mYCbpojFodtxzZoMvTt8u1Pd4TcUrGQKMvam4HwXb9MckepCZi5Y+QhOoJumOWSqgZFtH58d44zu2LEUjCDthuQWuYY01l4czfRyflUDGY5dM1rS6CdHGTi4dmwts4rrWpwX4plPV7qiI6DLWshsdIpf3OJO7ViQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=aVBxkF1d; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=CP8khLrX; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5B893prx3668899
	for <linux-arm-msm@vger.kernel.org>; Mon, 8 Dec 2025 10:54:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	6YGYntBelCU0BbNsavFK91z9JODq2w5Zuuf+jwFRJWo=; b=aVBxkF1dh5l/ICM4
	bDpHw40Cs9ex8+0MJYHeIXSwfBvUUXwT7R9xZxOeK6f5xlvT1OiLYRVIH837A88O
	cQswzKOeN/IDYeb6YUyLjE2MbVrfqlI4w03CMcPUt3WKELZe+w+vq5GViSqPwWP2
	HLb+blE1/OaXeiI4aXEqXnlobKepSqOpJtNxAcU+8WJ4n55MXsYRqElOXbliE8iC
	Np8hWHAaXfd0s5Gvt+TZv7aLZUtCd0Apt9xQFQFGZWgzDGyS20lVqWecCqjOElGW
	TZu4FqDYpkyCqWB0s6sSKBpsu5T/YMjenST21BS2UsZdE6Y0+TPX82W1Ju+DA3C5
	KrxTmA==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4awnkr1dwp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 08 Dec 2025 10:54:27 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-7b8b79cbd76so2672694b3a.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 08 Dec 2025 02:54:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1765191266; x=1765796066; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:cc:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=6YGYntBelCU0BbNsavFK91z9JODq2w5Zuuf+jwFRJWo=;
        b=CP8khLrXUzJbgG8tIbkC7TSjRRTYXXv3D29wHgB18j5OjRETqi4tPpnw6GACRuDyK3
         RbGEQGwd5Bm1KLfFjmsVp1uk5R/2TVsQeZwSgTfPvcg8saGCM0zUdjShg2ZwHF0mPd9p
         I0Z9cV20+eIOh6R8ZFcuWgdTKtRJLkJ5Zdu3agDVO2EXoOW2ch/yrwggagKMnpPJqLor
         a/bv/YG95JHN7QxjSYvoilxd8BTq0jYy93M3EjHrA8C9uaQujH2wUPoyBLhO2MWMqjVn
         wbPBUebafJiw5MYymZYxyPalYQ0EHO5SX/VLkoMp47pa7yTq88X4rBfbP12pgvRVk/4A
         ojng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765191266; x=1765796066;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:cc:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6YGYntBelCU0BbNsavFK91z9JODq2w5Zuuf+jwFRJWo=;
        b=HT+XjHEfT5El+U7rCtt8GdqV+XLeMEEZc93QvTKvX/YVkgpxtnXa/AYUkmySnmxtSK
         x+kHBSvUzahYHAqgTyP1Vqe+LQ48DxLR7r+qOEF0x3IL0HPr0D3mmvBbNG2uqWIHhGyW
         +7HNQnbJEl9WW2zZz6F1WfUjSDH1ER+yvZOJ97QxABvPTwGdEqp9BqCOHSa2rt/+Nh8F
         Vp6FJPvlVOcLS+0ZA+uUhcbxX5/pyw23qwZtrMI5vvP+Q+pgtfLtiDkGXbWjOliS62Sy
         Cx8pmsDKS/Utp6ZNOKUJZABYc2eGxT3PCjVdbXyyYGFkQSJkMsEBd8STGJttqd7u5Ywc
         N5AQ==
X-Forwarded-Encrypted: i=1; AJvYcCUQPxd0NuF5cwI6GF5UIBB+9/M1cnDxZmKfQg39p5sz9uCr8C6Fx9xJWA3KDoGECmQ8iLfF+5dPkoF3mUHB@vger.kernel.org
X-Gm-Message-State: AOJu0Yy2AylnlBPaL9cI5Uqnh/h7PoEYNoZ8PfdL8gCKcF6kL5Mawo95
	gUoq1VLKhwFfGChVZ9e0SsBdr9vvMm6ZmBHUdUXK+2uHypZBxEOzDQJ38t8ueuy8WaV+7Sa+UYO
	dFNgCNhfjB6lTO8o8Kky6HaIO4bV2jb9IgB2KzEX+FBRTPXok9YsDTtZeH2T9Tuzxg/whk8pBFx
	8rZDQ=
X-Gm-Gg: ASbGncusmSrbLtcxLTrpPtCRh7XGL0GLgEHHzHVtdtatRcXLZ5bs0coWXVDrxZd0BFL
	Na7lSFHO13tIAH54XXoLCqHO2xJEUXk5v5BK9e0o9vV0QI0ZqEad44fOevADinPbD7bEaAJl9xA
	B+JyoM2ZDBwKtc0M8F7e8myMyb97URa1dhundfpntfdPj6h0WtLyZz6qrBCeYemD2YXKt7AZhhu
	nw4KVkzj0u+ei7kH8IRrFQon6TD1m1UgnL1wCQax6zUx94bUhAVBDRIMj1QToXfX7GUpXnbFw+J
	WkW0MGYBuqH7+PJ+xTo8zbjvDcC4aluhxJaHKI+1aNHUDzejRuQ3MFrnGocBMp1npxZLU+4QVQy
	J2DwV1GE3u1iaff7VdPlxjUm6r8zdI/EDlqYLX0iQHWuOI5NryBaBh9F5O0E9S3FVAfwI5uWNdB
	623x0=
X-Received: by 2002:a05:6a00:94c3:b0:7aa:d1d4:bb7b with SMTP id d2e1a72fcca58-7e8ba3e05bcmr5969924b3a.16.1765191266366;
        Mon, 08 Dec 2025 02:54:26 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEVJ4BfiayXI3USMdJhTQB/6nSjE5qeDOWZsrG9ZJqjSZ3nCF4lPkB00yUa8weUUa1tLSsWEg==
X-Received: by 2002:a05:6a00:94c3:b0:7aa:d1d4:bb7b with SMTP id d2e1a72fcca58-7e8ba3e05bcmr5969907b3a.16.1765191265865;
        Mon, 08 Dec 2025 02:54:25 -0800 (PST)
Received: from [10.249.8.129] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7e29ff6b56esm12804088b3a.20.2025.12.08.02.54.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 08 Dec 2025 02:54:25 -0800 (PST)
Message-ID: <161da76e-b05f-4267-a4b8-bf290b74f85e@oss.qualcomm.com>
Date: Mon, 8 Dec 2025 18:54:21 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: wangao.wang@oss.qualcomm.com, linux-media@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        kernel test robot <lkp@intel.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Subject: Re: [PATCH v8 4/5] media: iris: Define AV1-specific platform
 capabilities and properties
To: Deepa Guthyappa Madivalara <deepa.madivalara@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>
References: <20251202-av1d_stateful_v3-v8-0-2f74a81773b4@oss.qualcomm.com>
 <20251202-av1d_stateful_v3-v8-4-2f74a81773b4@oss.qualcomm.com>
Content-Language: en-US
From: Wangao Wang <wangao.wang@oss.qualcomm.com>
In-Reply-To: <20251202-av1d_stateful_v3-v8-4-2f74a81773b4@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjA4MDA5MCBTYWx0ZWRfX/dBCCvLmo82/
 Bj82Hov5+ZQOJpK9xHusf4maITcm1+AIIyqPu5NSO6RyVA4DnQ00olXWYZoakXPXwk7nBxPzbhU
 fIbgchpFck+4ifwxf7F/B6LxcPL8sG69GLvxXe58DgwiSRBfVJpVkyytjDRVyrIdi4dE7OawH3F
 wZYKSJfTPNcXY36GNlU8R8n/SJ0Cl6t497S9T30N1ZTumRp2ZF1lj7Tpza03KHWhsBL6nSURxUq
 clkXNzWh0M2g87jTYl3AFicK/urch34RK8Mi4bv4WaP/e2D4Q82b2QtMp7Qhylki2ZaHyW3LU3j
 O3OSCkyAsBYuTaTilIHTcHnxb99Sl4G2kXdDwGUbXsPOd0S+PUacK5anCLTJdamAX7MWL3Qea9K
 u5qg0NqbB6mBZmnn9oWCqwJsH9ZCTA==
X-Proofpoint-GUID: yszJ45Pbo2-VZoLnrBDzJG8zypuutnt_
X-Proofpoint-ORIG-GUID: yszJ45Pbo2-VZoLnrBDzJG8zypuutnt_
X-Authority-Analysis: v=2.4 cv=RMy+3oi+ c=1 sm=1 tr=0 ts=6936ae63 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=xfU0YH49k9lLscIIeUMA:9 a=QEXdDO2ut3YA:10
 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-06_02,2025-12-04_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0 suspectscore=0 spamscore=0 lowpriorityscore=0
 adultscore=0 phishscore=0 clxscore=1015 impostorscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512080090



On 2025/12/3 7:03, Deepa Guthyappa Madivalara wrote:
> @@ -805,11 +909,14 @@ const struct iris_platform_data sm8550_data = {
>   		sm8550_vdec_input_config_param_vp9,
>   	.dec_input_config_params_vp9_size =
>   		ARRAY_SIZE(sm8550_vdec_input_config_param_vp9),
> +	.dec_input_config_params_av1 =
> +		sm8550_vdec_input_config_param_av1,
> +	.dec_input_config_params_av1_size =
> +		ARRAY_SIZE(sm8550_vdec_input_config_param_av1),
>   	.dec_output_config_params =
>   		sm8550_vdec_output_config_params,
>   	.dec_output_config_params_size =
>   		ARRAY_SIZE(sm8550_vdec_output_config_params),
> -
>   	.enc_input_config_params =
>   		sm8550_venc_input_config_params,
>   	.enc_input_config_params_size =
> @@ -830,6 +937,9 @@ const struct iris_platform_data sm8550_data = {
>   	.dec_output_prop_vp9 = sm8550_vdec_subscribe_output_properties_vp9,
>   	.dec_output_prop_vp9_size =
>   		ARRAY_SIZE(sm8550_vdec_subscribe_output_properties_vp9),
> +	.dec_output_prop_av1 = sm8550_vdec_subscribe_output_properties_av1,
> +	.dec_output_prop_av1_size =
> +		ARRAY_SIZE(sm8550_vdec_subscribe_output_properties_av1),
>   
>   	.dec_ip_int_buf_tbl = sm8550_dec_ip_int_buf_tbl,
>   	.dec_ip_int_buf_tbl_size = ARRAY_SIZE(sm8550_dec_ip_int_buf_tbl),
> @@ -899,6 +1009,10 @@ const struct iris_platform_data sm8650_data = {
>   		sm8550_vdec_input_config_param_vp9,
>   	.dec_input_config_params_vp9_size =
>   		ARRAY_SIZE(sm8550_vdec_input_config_param_vp9),
> +	.dec_input_config_params_av1 =
> +		sm8550_vdec_input_config_param_av1,
> +	.dec_input_config_params_av1_size =
> +		ARRAY_SIZE(sm8550_vdec_input_config_param_av1),
>   	.dec_output_config_params =
>   		sm8550_vdec_output_config_params,
>   	.dec_output_config_params_size =
> @@ -924,6 +1038,9 @@ const struct iris_platform_data sm8650_data = {
>   	.dec_output_prop_vp9 = sm8550_vdec_subscribe_output_properties_vp9,
>   	.dec_output_prop_vp9_size =
>   		ARRAY_SIZE(sm8550_vdec_subscribe_output_properties_vp9),
> +	.dec_output_prop_av1 = sm8550_vdec_subscribe_output_properties_av1,
> +	.dec_output_prop_av1_size =
> +		ARRAY_SIZE(sm8550_vdec_subscribe_output_properties_av1),
>   
>   	.dec_ip_int_buf_tbl = sm8550_dec_ip_int_buf_tbl,
>   	.dec_ip_int_buf_tbl_size = ARRAY_SIZE(sm8550_dec_ip_int_buf_tbl),

dec_input_config_params_av1 also needs to be added for other platforms 
if they support AV1.

-- 
Best Regards,
Wangao


