Return-Path: <linux-arm-msm+bounces-91112-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2PchBB/1emnDAAIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-91112-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 29 Jan 2026 06:50:23 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 79333AC146
	for <lists+linux-arm-msm@lfdr.de>; Thu, 29 Jan 2026 06:50:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 64614301371C
	for <lists+linux-arm-msm@lfdr.de>; Thu, 29 Jan 2026 05:50:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6576E3590D1;
	Thu, 29 Jan 2026 05:50:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ACVr9MM5";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Hr4sYyvw"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99AD83542EA
	for <linux-arm-msm@vger.kernel.org>; Thu, 29 Jan 2026 05:50:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769665819; cv=none; b=SRS1oNTyBqAdN69YzWUCDC0aYm/qhbtyuGPqw5iRHUBjypoXX2cczLzDFoNGhSiv4ojwhEBWPT00h1HnSYgcxuWZcMmOwnn9nlhluidFpl/g1JW6BihYeTzZoOD/GztPoAv/0dqfHh76NKD+/8KM8IN4g7gF+zmArmUjcWB1UqM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769665819; c=relaxed/simple;
	bh=TuI0R9m/8R/nxiEr+3IMtBamo8oUpSsnx1QjfHef34A=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=g1ZlrbfE049KmBosVMTxia1z/y/lGxbAGF1xSXNRAztSb7vtWUoNGyRfbAcHkjw8QN/HLT4f5oDNusdN+Iajq6/CznMT1QEqzkuaAQ1aR6RVEKA+z2fYPNPWwieeN9529muQghU3jD613uPCS6xg56EMOZf+ZQzI4Z9RSnU637Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ACVr9MM5; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Hr4sYyvw; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60T2oxbc2664080
	for <linux-arm-msm@vger.kernel.org>; Thu, 29 Jan 2026 05:50:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	LWYbjI5aVzoNHdidcSzzzigC0tluOOBxWM/OQF4xuiI=; b=ACVr9MM5JPCOdkrE
	b2W1jqhfaFTMYJrn/PjqkY0eO5Wjx32E+U7q4DcO9KhVHVhNRLT4JuWatQJx4S9G
	EWeSy/dyvIVlCpWH6glIhbcPpZUI14Elxvz4pBY4NI6Nwp+CEKm62jBo3Tt2disF
	A6QvPLgolN6cbeCORQahH35oyhqBUfX3dFuSjZy1k45P1xeIOTnkV1PmYF26S5B4
	KckMy4Fz5h6dNxknNgQH2K4VagwFofxJAKS0LtgvCTJx67F4u6HWrvHFlrHmhu5R
	YzhtZ/lV9eACaiKfddjQC5appHFuUS9k7tq7vO8rA7S36xWYMS0oKW9w0Aisemk/
	g1zFHQ==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4byphgj07h-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 29 Jan 2026 05:50:14 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-352c79abf36so530884a91.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 28 Jan 2026 21:50:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769665814; x=1770270614; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=LWYbjI5aVzoNHdidcSzzzigC0tluOOBxWM/OQF4xuiI=;
        b=Hr4sYyvwKyTjPYsgNQ+vPRma7EwRv9wHqWT+0mbJGaCkRrYqi0DpIRSekNE+5HIz2x
         qkBiDzQCR0HYCxxD/+VKDvAINMXihWdVMJu3MF1mUhgoKB1B9cZl9mAm2+0Rvmhx6aZ/
         AwHqMN9Lf9tt7KknIddRxFuKtl0lSvKnFtAw9NiXToW1qvjnHaDLhn/mSR6lhuc5WAW+
         vLqH+3t61WUDVOC5piQTU+pP+j7lDWMY1kKb8GKtkWmxKYJy+0sVmfQXmvocdKeshU4R
         HRIaKNXa4z9ZGC7eTZ07XEAKIj0cPXE71N02I0lC1MbsKGjFKbaooyNd+GnLPfq7SGhj
         g5zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769665814; x=1770270614;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LWYbjI5aVzoNHdidcSzzzigC0tluOOBxWM/OQF4xuiI=;
        b=v/kjlUk9w3BWVUqAs1lKCA3jd/oHM276CVPTNtIdAnpuEeRGteCgNsT3nsSSo5nrEP
         uih+8t9L3tDewivLqOa1sF6a9mUct8ZlTkA0MsKfEXh+NblW5ZZupY0MuQEETrX/Sfz3
         KMUdKwctfNV3X/e9LKErXCgoATdsEFhXYtJvC7kAh/3xbhLM2iWz3WKyyi5sfVFYBE1r
         0bIRbRA90bCPpR/yndpem2Cj1idnS2W+R6iBBPmF4cWkmquBEm5QFbp1qYyEvvDv2xet
         gH3lywcIOffpoxpOmZG19Q0FfE7+oDBMQkO+xNuM4Te7KV/SXiMxL7WEgrUbdCK4etQ7
         4ZCA==
X-Forwarded-Encrypted: i=1; AJvYcCXyvEy/pUFcI6NL9BRRt3ocFjNL6eVA0ETyPKb2x5LeC3qsP2wnOKZn7SJ/sudQg1lEgb+iBvLgfgz80MGv@vger.kernel.org
X-Gm-Message-State: AOJu0YygjF30oL3t3DBAMAaQWlvVN2Ah6LZEhgBHgsVC1BLYcbIk/e1i
	hxBXW8HbTjVd/wiDPVVhbD7imxvKb2tDxj1p4hPPG0akIMFMZxUFJApQgX6svNhV2DCs7AyOsAp
	n2SP0kpYOCb4K5D7WzYRee944i9H68YZRSOegNpbYhbAUVwLwtKpvRz6sXGRQhD8FFwbl
X-Gm-Gg: AZuq6aI/WMSh+bVtpw4dvNAHRp8ocPmGCzP2bqUpuB2aUmfAImHfjUe0DMI+8SATAV9
	a1meKFvt4Sk7gdTccitKJ6t3vRSLMJgfQ/iB6/oxgPaF7y/g0DhzyYwb/leFQ1R1+c9t82CicXe
	vPK+TFSxPKtafYpXt69DBg27fxu3cuh75AYUF+8QkeKFqozI8dIFEYmyXe7A4FpyUGpBo02FwGZ
	EPbmr9/BRuvAKi4brqDoi2X+W/Oe+QY6F0xQ4N7BKjZHPFc7AS2dPoLBpM4P8xJXvwQavJoz1La
	qlviO6edpGxyDi8k0ossrXbimOojUquwWDXz6i+0rXfk+cSDNL0lM79TjU9OixU/QNJXJ2Fe0fV
	BP6ElfcVC2RdAN8pWA74CfraRmTYuGUDYukqOrs4=
X-Received: by 2002:a17:90b:2d83:b0:34c:6124:3616 with SMTP id 98e67ed59e1d1-353fed87b05mr7031888a91.27.1769665813820;
        Wed, 28 Jan 2026 21:50:13 -0800 (PST)
X-Received: by 2002:a17:90b:2d83:b0:34c:6124:3616 with SMTP id 98e67ed59e1d1-353fed87b05mr7031858a91.27.1769665813288;
        Wed, 28 Jan 2026 21:50:13 -0800 (PST)
Received: from [10.0.0.3] ([106.222.235.0])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3540f3cc74dsm3909276a91.9.2026.01.28.21.50.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 28 Jan 2026 21:50:12 -0800 (PST)
Message-ID: <4257fb6f-280d-1866-b531-c25efe155d04@oss.qualcomm.com>
Date: Thu, 29 Jan 2026 11:20:06 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v3 4/4] media: qcom: venus: flip the venus/iris switch
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        cros-qcom-dts-watchers@chromium.org,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
References: <20260127-venus-iris-flip-switch-v3-0-7f37689f4b39@oss.qualcomm.com>
 <20260127-venus-iris-flip-switch-v3-4-7f37689f4b39@oss.qualcomm.com>
Content-Language: en-US
From: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
In-Reply-To: <20260127-venus-iris-flip-switch-v3-4-7f37689f4b39@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: jqdmvt8alK5GYLxxAnICOqhpbZ7Dl-HW
X-Proofpoint-GUID: jqdmvt8alK5GYLxxAnICOqhpbZ7Dl-HW
X-Authority-Analysis: v=2.4 cv=J/inLQnS c=1 sm=1 tr=0 ts=697af516 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=6cH4IgXjao/mkWo6W7aGpA==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=tiI1SodC8CJpEoPmcAoA:9
 a=QEXdDO2ut3YA:10 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTI5MDAzNCBTYWx0ZWRfX6K6yekeCXqxU
 EmJ7lx8noOisRL6F3lawIdnXfwD7cp1BZw0M1UqP8ISZGHxBBCo9RufPRFjc/OOXKwWRwRV3a56
 PoSCbPzUOaF9+bgjAJLJ5LoV8RvvzYMq65WjsolXINTpdIHv8iz31voyXE/GIpGs6GSAEaIsFLV
 o8sLwMeACncoT41lBSv6OH8eJrCY54CFhZrk1PsYLIN2e+8ChblxvmAMxB+2BilTFdCL543PQe1
 ooFMi1fqQhd2ATqzqcdDe2i+gfV072/tlScbyKeWnkmR0Aur8inyRsOImfV1fSZ0QWVW1O1IG8D
 7rWs2UuLz3I1quIk/3jd53BxNMNHkV7R96FujXzqS8/6pME+8oP6As7M4OIiFIewzusmkpap99A
 Oy4xcQWkOtkXbOo/iDPspxp5/6//Gc2C4L/dTZDOqxvK1qroG7HhD9DYUeisrg1ITkrRZn44DKN
 TqB/lNpks0CUw6QI4Uw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-01-28_06,2026-01-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 malwarescore=0 impostorscore=0 spamscore=0
 clxscore=1015 bulkscore=0 lowpriorityscore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601290034
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[17];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-91112-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,0.0.0.30:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dikshita.agarwal@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 79333AC146
X-Rspamd-Action: no action



On 1/27/2026 5:53 PM, Dmitry Baryshkov wrote:
> With the Iris and Venus driver having more or less feature parity for
> "HFI 6xx" platforms and with Iris gaining support for SC7280, flip the
> switch. Use Iris by default for SM8250 and SC7280, the platforms which
> are supported by both drivers, and use Venus only if Iris is not
> compiled at all. Use IS_ENABLED to strip out the code and data
> structures which are used by the disabled platforms.
> 
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---
>  drivers/media/platform/qcom/iris/iris_probe.c |  2 --
>  drivers/media/platform/qcom/venus/core.c      |  6 ++++++
>  drivers/media/platform/qcom/venus/core.h      | 11 +++++++++++
>  3 files changed, 17 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/media/platform/qcom/iris/iris_probe.c b/drivers/media/platform/qcom/iris/iris_probe.c
> index ddaacda523ec..7b612ad37e4f 100644
> --- a/drivers/media/platform/qcom/iris/iris_probe.c
> +++ b/drivers/media/platform/qcom/iris/iris_probe.c
> @@ -352,7 +352,6 @@ static const struct of_device_id iris_dt_match[] = {
>  		.compatible = "qcom,qcs8300-iris",
>  		.data = &qcs8300_data,
>  	},
> -#if (!IS_ENABLED(CONFIG_VIDEO_QCOM_VENUS))
>  	{
>  		.compatible = "qcom,sc7280-venus",
>  		.data = &sc7280_data,
> @@ -361,7 +360,6 @@ static const struct of_device_id iris_dt_match[] = {
>  		.compatible = "qcom,sm8250-venus",
>  		.data = &sm8250_data,
>  	},
> -#endif
>  	{
>  		.compatible = "qcom,sm8550-iris",
>  		.data = &sm8550_data,
> diff --git a/drivers/media/platform/qcom/venus/core.c b/drivers/media/platform/qcom/venus/core.c
> index 24d2b2fd0340..646dae3407b4 100644
> --- a/drivers/media/platform/qcom/venus/core.c
> +++ b/drivers/media/platform/qcom/venus/core.c
> @@ -949,6 +949,7 @@ static const struct venus_resources sc7180_res = {
>  	.enc_nodename = "video-encoder",
>  };
>  
> +#if (!IS_ENABLED(CONFIG_VIDEO_QCOM_IRIS))
>  static const struct freq_tbl sm8250_freq_table[] = {
>  	{ 0, 444000000 },
>  	{ 0, 366000000 },
> @@ -1069,6 +1070,7 @@ static const struct venus_resources sc7280_res = {
>  	.dec_nodename = "video-decoder",
>  	.enc_nodename = "video-encoder",
>  };
> +#endif
>  
>  static const struct bw_tbl qcm2290_bw_table_dec[] = {
>  	{ 352800, 597000, 0, 746000, 0 }, /* 1080p@30 + 720p@30 */
> @@ -1125,11 +1127,15 @@ static const struct of_device_id venus_dt_match[] = {
>  	{ .compatible = "qcom,msm8998-venus", .data = &msm8998_res, },
>  	{ .compatible = "qcom,qcm2290-venus", .data = &qcm2290_res, },
>  	{ .compatible = "qcom,sc7180-venus", .data = &sc7180_res, },
> +#if (!IS_ENABLED(CONFIG_VIDEO_QCOM_IRIS))
>  	{ .compatible = "qcom,sc7280-venus", .data = &sc7280_res, },
> +#endif
>  	{ .compatible = "qcom,sdm660-venus", .data = &sdm660_res, },
>  	{ .compatible = "qcom,sdm845-venus", .data = &sdm845_res, },
>  	{ .compatible = "qcom,sdm845-venus-v2", .data = &sdm845_res_v2, },
> +#if (!IS_ENABLED(CONFIG_VIDEO_QCOM_IRIS))
>  	{ .compatible = "qcom,sm8250-venus", .data = &sm8250_res, },
> +#endif
>  	{ }
>  };
>  MODULE_DEVICE_TABLE(of, venus_dt_match);
> diff --git a/drivers/media/platform/qcom/venus/core.h b/drivers/media/platform/qcom/venus/core.h
> index 7506f5d0f609..c7acacaa53b8 100644
> --- a/drivers/media/platform/qcom/venus/core.h
> +++ b/drivers/media/platform/qcom/venus/core.h
> @@ -54,8 +54,10 @@ enum vpu_version {
>  	VPU_VERSION_AR50,
>  	VPU_VERSION_AR50_LITE,
>  	VPU_VERSION_IRIS1,
> +#if (!IS_ENABLED(CONFIG_VIDEO_QCOM_IRIS))
>  	VPU_VERSION_IRIS2,
>  	VPU_VERSION_IRIS2_1,
> +#endif
>  };
>  
>  struct firmware_version {
> @@ -525,13 +527,22 @@ struct venus_inst {
>  #define IS_V1(core)	((core)->res->hfi_version == HFI_VERSION_1XX)
>  #define IS_V3(core)	((core)->res->hfi_version == HFI_VERSION_3XX)
>  #define IS_V4(core)	((core)->res->hfi_version == HFI_VERSION_4XX)
> +#if (!IS_ENABLED(CONFIG_VIDEO_QCOM_IRIS))
>  #define IS_V6(core)	((core)->res->hfi_version == HFI_VERSION_6XX)
> +#else
> +#define IS_V6(core)	(0)
> +#endif
>  
>  #define IS_AR50(core)		((core)->res->vpu_version == VPU_VERSION_AR50)
>  #define IS_AR50_LITE(core)	((core)->res->vpu_version == VPU_VERSION_AR50_LITE)
>  #define IS_IRIS1(core)		((core)->res->vpu_version == VPU_VERSION_IRIS1)
> +#if (!IS_ENABLED(CONFIG_VIDEO_QCOM_IRIS))
>  #define IS_IRIS2(core)		((core)->res->vpu_version == VPU_VERSION_IRIS2)
>  #define IS_IRIS2_1(core)	((core)->res->vpu_version == VPU_VERSION_IRIS2_1)
> +#else
> +#define IS_IRIS2(core)		(0)
> +#define IS_IRIS2_1(core)	(0)
> +#endif
>  
>  static inline bool is_lite(struct venus_core *core)
>  {
> 

compilation fails with this change.
ERROR: modpost: "sm8250_data"
[drivers/media/platform/qcom/iris/qcom-iris.ko] undefined!
ERROR: modpost: "sc7280_data"
[drivers/media/platform/qcom/iris/qcom-iris.ko] undefined!

to fix this:
==============================================
--- a/drivers/media/platform/qcom/iris/Makefile
+++ b/drivers/media/platform/qcom/iris/Makefile
@@ -10,6 +10,7 @@ qcom-iris-objs += iris_buffer.o \
              iris_hfi_gen2_packet.o \
              iris_hfi_gen2_response.o \
              iris_hfi_queue.o \
+             iris_platform_gen1.o \
              iris_platform_gen2.o \
              iris_power.o \
              iris_probe.o \
@@ -26,8 +27,4 @@ qcom-iris-objs += iris_buffer.o \
              iris_vpu_buffer.o \
              iris_vpu_common.o \

-ifeq ($(CONFIG_VIDEO_QCOM_VENUS),)
-qcom-iris-objs += iris_platform_gen1.o
-endif
-
 obj-$(CONFIG_VIDEO_QCOM_IRIS) += qcom-iris.o

==================================================

Thanks,
Dikshita

