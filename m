Return-Path: <linux-arm-msm+bounces-83584-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id D7C4EC8E179
	for <lists+linux-arm-msm@lfdr.de>; Thu, 27 Nov 2025 12:47:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 236ED350662
	for <lists+linux-arm-msm@lfdr.de>; Thu, 27 Nov 2025 11:47:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CBA1C32C31C;
	Thu, 27 Nov 2025 11:47:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WSFeM/s8";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="GLy/RqyO"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 337D031A07C
	for <linux-arm-msm@vger.kernel.org>; Thu, 27 Nov 2025 11:47:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764244061; cv=none; b=YIU293+cGAkQH3IS5lSQja4/NWk8kvH1iUw6OKneXNMXkqe8T0q6GdADB9CdmEypRcMucKCKV75FKd6yi6X3ryO2nWfnoIxDJiMxOAICI5qpfKXCTaWP/z+aT7ZEtlF0Zm15okRXNEIG4WSdvH/D114VkbX6auw/gkAujHXOoNU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764244061; c=relaxed/simple;
	bh=+gxmd9icSYlbqAispPKwnf7BzQU8F0RGLdyHmc9XgjY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=dCJUnGccub/9heXZe0rl5CYyWiJM5EH2BKHNz2cOJDeYl0IicPq9suDqZC/IF3UAXskmaKhUHaB6VW22RYIhlHUvk+eTvMVBKw4Y1OMcmxeOZh4nTdDPTzd1QZ5N11XFrgn7tXA+2kkdkcRq38GPgz7gfnslYFBaJHvVIrINSeg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WSFeM/s8; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GLy/RqyO; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AR5oBkv2855055
	for <linux-arm-msm@vger.kernel.org>; Thu, 27 Nov 2025 11:47:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	lDYzsPsglBGkvA6BL4GlUtJIqxMEjx5ALvjgIXrDDkA=; b=WSFeM/s8kEQFEZex
	IaDpXgbCu9Dl0PDCNazx8eRRe7ccGuCNOEfJlytixoIF6z7OK+PtmvDoXB6lFmAC
	IepID38fGdeIw6ltcIWT88fMmJ8FpOt0j5LxbHrCaS75l0fAOsE0FhKf4IhCjwwQ
	1i/5Du6jnzTWpLlEAymPMs0HXdTaJLT+MKVyF6rhRPCxWv1TibR//6uvw3yBxhh9
	dinbGYzE/wzY9QRLytiLHPrQ1OOnbma+kPg+HysqIdHS98Lo0U3R8fZWbNkqlOG7
	WzlWEzk2lDozQt/QNzkEOk7B+FM9XGF+Rd1EsPAvXYUX2bSHep+7tWEvVFEHGylp
	tLrj8A==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ap4vhasu5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 27 Nov 2025 11:47:39 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3437b43eec4so1058608a91.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 27 Nov 2025 03:47:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764244057; x=1764848857; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=lDYzsPsglBGkvA6BL4GlUtJIqxMEjx5ALvjgIXrDDkA=;
        b=GLy/RqyOE0XTo7GpJoWMaeJ2RC5ldNYNjWRGWDE2a/0c3ZrISS1zJKsFv0X1e1eDtU
         cjBiZTzvsw2f7LPgbdI7JOa5J8rwLuoGi+EoEordWG2TG0Q4wBkWTdsP11nN4nJMRLR1
         nuw1FzxtnefNCxTmqx9UGu80mQZyLp3xxbA6l0brnGRww/JTCzw7TMAs4pUqVkyjjKEz
         kLAv9f+uhLzceYrDVyIvXKZFUXqSgWXnmFGqmgNmxqN8WT0j66baPJpZbYYnxZcA5tS9
         Ez6JF5xQRGcIoT3NtNS6nj/flim8ZS2zXUkFIPcEEcy9QJ4SbLJfU/6d8qA67eL8YPaQ
         x1rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764244057; x=1764848857;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lDYzsPsglBGkvA6BL4GlUtJIqxMEjx5ALvjgIXrDDkA=;
        b=Oawt/pTCTrM2BmxRE6q6CKQqCzj/p6WHaI887vvj6ESKVPsh+js8YWL2b9p9+KFHuT
         EB5lpKNr3Zeo/ORv4SSbkuLUanJP6lKE4DeigoFMA4h+tYPflOiB5OT72Rkjc2Lxgyxx
         6ru0tB6kl1WoRlV78YX7FVpZwpwWMRhcoGcM2qxAX7gaRyu2kgAP1wgQj/6u06LopHNc
         PHJoVmoErukD/HYbaPiTissn1ggJIs3hOJ1BDo3aJnsy8zT3f39SOenpjIwSmjQdSqLm
         jfcKBpXpOxgcpO927ylb/LfHYpHHR+kTMttAUhpXSjtyqKJud3vvM1FZr+JQ4tvAA4gf
         +luA==
X-Forwarded-Encrypted: i=1; AJvYcCW3rpdQ4rhKeBsRiOylYYrfjMaIPjA3dVvei5mB95xY4IUBHH0m4SXG8fbloDvr4EaNqOipexDDg6omZWSm@vger.kernel.org
X-Gm-Message-State: AOJu0YyspACENGDeltK1xoxnzSCcZWrZ4qskcZiFQitt80lPNVLrGK9b
	31VmYhWQKz7HIzb+XPSnQ65kXss3vDgU8GWGvXU9vPXLEvB+63DFoG1p+ZbfJO0sevoaoa5SEtc
	ngk3aYn0IBjgT71pfsHQrBLWR0F9CyU7lIowF2pxE4rz7SNEQ5ZqBcR0HYoxW+9dfWJa0
X-Gm-Gg: ASbGncvLrVce5Fbz5AAcQ8T8U9YYYsq3TTSAzLMfoXtPWj8CCQ2vfet4RZP6vOn5hjF
	zXS7poh4xbNKy9RsXa4Wu6s4VjBhVdABpzYN8i0BESKAUk4T/9/K7HXNZXqvr/kk0jrUDuE9GIN
	KpiyKew15gz2Q/5mRftXB026hWcyQ5H+n8eEbNwYHgvTnGGlAcm9fFYQKVTVVe6t+FyeXzzLvtY
	m1QUVSfXBfeXZuekQoEjuFat/4S9LdMzuxJMLF3dqLWnMxaBHEw9Hw9TSDTiH55JUU0Gd4+A0SJ
	JabvOb8O8OOyeP7mqXEH7Pfc4n6DROyA/A3iMZdN74xth6AyDPBhMjF9h88MRjn3rPs9cZYLWwV
	zcCydfLVEty/2NBHmVwxkWnzmrMULt4inkWAUg73Ud2U=
X-Received: by 2002:a17:90b:4a4f:b0:341:761c:3330 with SMTP id 98e67ed59e1d1-34733f11c1emr20609328a91.23.1764244056952;
        Thu, 27 Nov 2025 03:47:36 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGZ7En26V9sshGmDQVwH6b1r9YcBM83RyEfzK3Y0oLSrIV6i7j1PRsKIwXoQ9UUKQcXYegrjw==
X-Received: by 2002:a17:90b:4a4f:b0:341:761c:3330 with SMTP id 98e67ed59e1d1-34733f11c1emr20609304a91.23.1764244056478;
        Thu, 27 Nov 2025 03:47:36 -0800 (PST)
Received: from [10.204.100.255] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-be4fbb0094dsm1811586a12.10.2025.11.27.03.47.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 27 Nov 2025 03:47:36 -0800 (PST)
Message-ID: <0027428e-8e0e-4efb-a953-b83dfb8102af@oss.qualcomm.com>
Date: Thu, 27 Nov 2025 17:17:32 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] media: qcom: venus: flip the venus/iris switch
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20251119-venus-iris-flip-switch-v1-1-852369f66e36@oss.qualcomm.com>
Content-Language: en-US
From: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
In-Reply-To: <20251119-venus-iris-flip-switch-v1-1-852369f66e36@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTI3MDA4NyBTYWx0ZWRfXx052dif/DSkG
 /KwU5kersAWagF4Kq7fEJQqkc4gDF20jCp8Lv3hddUEbclypqoE889mZqU2aoq8QyS1mv0TMQLa
 hQ/ZrMQthjiNRyZYO+kMl9IUDhMYr9qmQ6qeoxfV8Ndl1iqGVLgLbwZGWWpb30sBZ/ASa6uJ9k6
 XOONZXrB0vMuJBEl90r2ce0T98/5k/ydIU8KtXotkOUMC+1KvmUSp8h2AE2DrrQXHzlU9l5yYQU
 nhOE+9OVy3ky7kZAzpxSLa2gIiG27hF05XdqRe36wpBubu2zkBKHi/xbqNUufJXnTHEyREn2HTN
 siakxomxlM+97h9brBwCUr5akj+yqQ8gP/JdODMevwyWhs0P/ItTdItRwbLNu1SAPU++WtI0wFv
 y/foV8P8amZrJpYU37F/jZlD6tl3VA==
X-Proofpoint-ORIG-GUID: DgaPFcqYJBzFuHSwod6Ls-KPq7y4cuVa
X-Proofpoint-GUID: DgaPFcqYJBzFuHSwod6Ls-KPq7y4cuVa
X-Authority-Analysis: v=2.4 cv=Lt6fC3dc c=1 sm=1 tr=0 ts=69283a5b cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=rjoTukvE8U3cw58jYosA:9
 a=QEXdDO2ut3YA:10 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-25_02,2025-11-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 lowpriorityscore=0 impostorscore=0 phishscore=0
 priorityscore=1501 suspectscore=0 adultscore=0 spamscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511270087


On 11/19/2025 8:48 PM, Dmitry Baryshkov wrote:
> With the Iris and Venus driver having more or less feature parity for
> "HFI 6xx" platforms and with Iris gaining support for SC7280, flip the
> switch. Use Iris by default for SM8250 and SC7280, the platforms which
> are supported by both drivers, and use Venus only if Iris is not
> compiled at all. 

Good to see platforms moving to iris.

> Use IS_ENABLED to strip out the code and data
> structures which are used by the disabled platforms.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---
> Note: then intention is to land this in 6.20, which might let us to
> start dropping those platforms from the Venus driver in 6.21+.
> ---
>   drivers/media/platform/qcom/iris/Makefile        |  5 +----
>   drivers/media/platform/qcom/iris/iris_probe.c    |  2 --
>   drivers/media/platform/qcom/venus/Makefile       |  5 ++++-
>   drivers/media/platform/qcom/venus/core.c         |  6 ++++++
>   drivers/media/platform/qcom/venus/core.h         | 11 +++++++++++
>   drivers/media/platform/qcom/venus/helpers.c      |  7 ++++++-
>   drivers/media/platform/qcom/venus/hfi_helper.h   | 11 +++++++++++
>   drivers/media/platform/qcom/venus/hfi_platform.c |  2 ++
>   drivers/media/platform/qcom/venus/hfi_platform.h |  2 ++
>   drivers/media/platform/qcom/venus/pm_helpers.c   |  3 +++
>   drivers/media/platform/qcom/venus/venc.c         |  3 +--
>   11 files changed, 47 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/media/platform/qcom/iris/Makefile b/drivers/media/platform/qcom/iris/Makefile
> index fad3be044e5fe783db697a592b4f09de4d42d0d2..ce360c67846b1243dd9245972672591076bfdee2 100644
> --- a/drivers/media/platform/qcom/iris/Makefile
> +++ b/drivers/media/platform/qcom/iris/Makefile
> @@ -10,6 +10,7 @@ qcom-iris-objs += iris_buffer.o \
>                iris_hfi_gen2_packet.o \
>                iris_hfi_gen2_response.o \
>                iris_hfi_queue.o \
> +             iris_platform_gen1.o \
>                iris_platform_gen2.o \
>                iris_power.o \
>                iris_probe.o \
> @@ -25,8 +26,4 @@ qcom-iris-objs += iris_buffer.o \
>                iris_vpu_buffer.o \
>                iris_vpu_common.o \
>   
> -ifeq ($(CONFIG_VIDEO_QCOM_VENUS),)
> -qcom-iris-objs += iris_platform_gen1.o
> -endif
> -
>   obj-$(CONFIG_VIDEO_QCOM_IRIS) += qcom-iris.o
> diff --git a/drivers/media/platform/qcom/iris/iris_probe.c b/drivers/media/platform/qcom/iris/iris_probe.c
> index 9bc9b34c2576581635fa8d87eed1965657eb3eb3..0d5f37e51558ed1207554b3a3841096d8699c755 100644
> --- a/drivers/media/platform/qcom/iris/iris_probe.c
> +++ b/drivers/media/platform/qcom/iris/iris_probe.c
> @@ -356,7 +356,6 @@ static const struct of_device_id iris_dt_match[] = {
>   		.compatible = "qcom,qcs8300-iris",
>   		.data = &qcs8300_data,
>   	},
> -#if (!IS_ENABLED(CONFIG_VIDEO_QCOM_VENUS))
>   	{
>   		.compatible = "qcom,sc7280-venus",
>   		.data = &sc7280_data,
> @@ -365,7 +364,6 @@ static const struct of_device_id iris_dt_match[] = {
>   		.compatible = "qcom,sm8250-venus",
>   		.data = &sm8250_data,
>   	},
> -#endif
>   	{
>   		.compatible = "qcom,sm8550-iris",
>   		.data = &sm8550_data,
> diff --git a/drivers/media/platform/qcom/venus/Makefile b/drivers/media/platform/qcom/venus/Makefile
> index 91ee6be10292e0c275106f090f521f268da4c50a..60a3f948adbfaa4c6c91abdbbbe050f0bd724c9c 100644
> --- a/drivers/media/platform/qcom/venus/Makefile
> +++ b/drivers/media/platform/qcom/venus/Makefile
> @@ -5,7 +5,10 @@ venus-core-objs += core.o helpers.o firmware.o \
>   		   hfi_venus.o hfi_msgs.o hfi_cmds.o hfi.o \
>   		   hfi_parser.o pm_helpers.o dbgfs.o \
>   		   hfi_platform.o hfi_platform_v4.o \
> -		   hfi_platform_v6.o hfi_plat_bufs_v6.o \
> +
> +ifeq ($(CONFIG_VIDEO_QCOM_IRIS),)
> +venus-core-objs += hfi_platform_v6.o hfi_plat_bufs_v6.o
> +endif
>   
>   venus-dec-objs += vdec.o vdec_ctrls.o
>   venus-enc-objs += venc.o venc_ctrls.o
> diff --git a/drivers/media/platform/qcom/venus/core.c b/drivers/media/platform/qcom/venus/core.c
> index 24d2b2fd0340b55ed1aa329f49ded449dc466f14..646dae3407b4d13454eedd8e926f16e7470d5d3d 100644
> --- a/drivers/media/platform/qcom/venus/core.c
> +++ b/drivers/media/platform/qcom/venus/core.c
> @@ -949,6 +949,7 @@ static const struct venus_resources sc7180_res = {
>   	.enc_nodename = "video-encoder",
>   };
>   
> +#if (!IS_ENABLED(CONFIG_VIDEO_QCOM_IRIS))
>   static const struct freq_tbl sm8250_freq_table[] = {
>   	{ 0, 444000000 },
>   	{ 0, 366000000 },
> @@ -1069,6 +1070,7 @@ static const struct venus_resources sc7280_res = {
>   	.dec_nodename = "video-decoder",
>   	.enc_nodename = "video-encoder",
>   };
> +#endif

There are configs check all over the venus driver, like the one above. 
Can we do this with keeping _only_ the compat under config check ? And 
if needed to keep it inline with iris code, we can keep the makefile change.

Regards,
Vikash


