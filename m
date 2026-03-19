Return-Path: <linux-arm-msm+bounces-98700-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6A/MMdrLu2leoQIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-98700-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Mar 2026 11:11:38 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E6BB2C948F
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Mar 2026 11:11:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C34F23152F39
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Mar 2026 10:04:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 689CE3AD536;
	Thu, 19 Mar 2026 10:04:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fEBErR4l";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="aJXYUNI2"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F8513B8BA4
	for <linux-arm-msm@vger.kernel.org>; Thu, 19 Mar 2026 10:04:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773914690; cv=none; b=sZtY9EAIEJcWiJnMsYrKehzwIK84zyEQOsHKC0NSJf9mRy/JPu73ClOUJakdpY6P/WeNgAzhzen7lkEppqV4s9ZMsV4jWnQhyvb9aiGwmnyxpq23EWluAWyJiSp7Itkk0kg4/eEn0gOz1Gqq4hGnUbYzuBqDdfwKmmEIRrI9nC0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773914690; c=relaxed/simple;
	bh=/UZRgESq5P4RD7beAashZ6nyvplyzhWfJ5LnAvVrrRA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=cS7GnXbXdLfhRHd/gO4vhXoIWY+QCrzfL5dgFbttvQDHwKIntmZz5ZgWvLLoZh09bvT6hozwTxEqnGWrnP5ir5GFD6oIOHvnbpbpFau/pjCK7crv1u2GSUVMwb5ZaxYf7yZ0qQ5gvuGrwTjkUoUgEsa+VTCtNhqXKBxw++rwllQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fEBErR4l; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=aJXYUNI2; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62J748942667016
	for <linux-arm-msm@vger.kernel.org>; Thu, 19 Mar 2026 10:04:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	5GTauEHSGm4i3XT68NJbUfwxUwP+W5UkvCHabhr2+BI=; b=fEBErR4lthQNn4v9
	ZMxOQYhiV43EvXAT0j2MkfztgGZbH9A7ZALIhLAL0AFDs45FTMf05lrcsZQyG73t
	mP66d3btFxNNWre9lLNg1MWi5jSBddRRCj0KOABxhkoPs5ml3as6Yg4dNK7TX1zj
	+J+FTrj8kBN4uifBhZckyP+hw0K6g08JabNJ/tmsnfpcolL3RfEU4NEaUAcv45/o
	K1ReXowqAqcEjTeKUUjJ2Ny/G0Ff4lKdqkmriTXBW+hWS4dAFIck0JZjKNePBOnw
	T6RPYTjHG75k8O0QiJBhhKDt5qMwj/H2t7z7Ta7eGANE9VJRbcXljUP9wlfBeDPg
	zDrKOw==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cytj548y7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 19 Mar 2026 10:04:47 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-50947db2e97so6150081cf.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 19 Mar 2026 03:04:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773914687; x=1774519487; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=5GTauEHSGm4i3XT68NJbUfwxUwP+W5UkvCHabhr2+BI=;
        b=aJXYUNI2ADc6MoutJf0k8owYMfLzpaMOHSDFhrsK4LhzIhoKBVqehHmdUhRTtJKmh9
         21p6w6NgZARiAwPF5bwIwNm9FZAuah6U8wXW85NvjWzr8wcQtFDbNHb5aYwUO1IXi4c3
         qyLWMvkP6jJpOoVFiMEV7XOxTA5xmd3yYhUs0yihfRJLnN7mZc5UftsNYfvZvgc1oe48
         uR+WM6vBX9MjV60PrysCerIM264hiCM9f46BlJEVJcdpp4RJlks/kTib2yDNpLz8eu9Q
         RnZyowAleqjNNUp8D+xepGkL1/KuS1zKGx7MSj8hUYyY9YJR73bTv47U/+EU0L67foYt
         nNbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773914687; x=1774519487;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5GTauEHSGm4i3XT68NJbUfwxUwP+W5UkvCHabhr2+BI=;
        b=B7NjoXPBy/f4Jpgj/lKn/zm/7DJgb7DIhHqeLW65VS6hpSIRKVku8AL8n80SZRdlqB
         5MoUPN2EknIv3MsCwNNXrV6NwN+CQPbtHtmXn7rvQAkVFqRxsjPmEUqRGFot1uCI5F69
         OP9rJsA7gK+rcHXC8M6Hl7Jqxg37R7uVhGN8LULbhEcWQwi0rTZR4H/ixdvaKo3ynF6d
         pN/Hd804Opk/25pHDD8xlDloHtUzQNCL30jQYUuWEp8Y/GlcAEnDjEPjVaSnIGxuWxX7
         RBSexJ7sxzyyuoWLURWmipxeqTFRX6yengAfFKovTC3w/FG15tcSr3vE8rPYE9BeeMcw
         fIog==
X-Forwarded-Encrypted: i=1; AJvYcCXQ13tcECWxqOkrS2IM5MldjUylWemrFvQZl8NKQxrSaNEJUQ0iJMsb9KvoIry+fsDWY+vJvYBhZvsf8JWq@vger.kernel.org
X-Gm-Message-State: AOJu0Yydb+/1SaS+wDCZ4XNj9XX7EzxuEwX1ExJskyG62XvKsjYLlI1x
	yStt4XN0VpM8cUEXgVZhgXuS7DWFgNj7cOpqIvPzp8h4hy7g6selCex+9bFOOZ87XNqafiOqtzQ
	MR9r4jBYRqSvw10wbMFZfr3yhokUOgQ9c4N3D+PdM0SWkMvSCkQVhq/MmGm7J92FQXjBx
X-Gm-Gg: ATEYQzyiP+3nvgkfbzBm5p+cmiYPQ2EfvUOcy1O5nFLsYAyhGIJKYLo7ToGpot+AnoZ
	h6IaeyK53QDDllSBGaTHieuuh2/P/H0530uq9VNGNZr74XR9kS9fh0iWqF1lshUSZ+j/Nq1egGi
	u2bE3IeJDq8LoPNuj6M7I00AKnPA7Sz5rddmzlfr1Vum3NQmmxFiM4LHQwfMxrofQwKaoWfbj8e
	bNstPH7ynmoYIIf1Pqu6knIEKj9vSZwr7qV+ZJvC91iHNXEt6CDG+pR5PXoH3/sS+H7Pr8Zi9BX
	aBqEBCwZTQUfgIUp8oe/YnMhXgTht6+APNwjIPKksI5NXUa4EpbMC/1o08n5OGOO0SxHP8x6ht8
	hrHwz7hWOSv+0eYHxud0CKz7tZzo/cczOrG9Z45Ubo768ExbxGYzVCW/TVHu3EGUdH4jI3UNlrc
	E4ZkY=
X-Received: by 2002:ac8:59c1:0:b0:509:38b0:c44b with SMTP id d75a77b69052e-50b14866da5mr64921981cf.5.1773914686625;
        Thu, 19 Mar 2026 03:04:46 -0700 (PDT)
X-Received: by 2002:ac8:59c1:0:b0:509:38b0:c44b with SMTP id d75a77b69052e-50b14866da5mr64921631cf.5.1773914686102;
        Thu, 19 Mar 2026 03:04:46 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b97f142a785sm426601566b.14.2026.03.19.03.04.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 Mar 2026 03:04:45 -0700 (PDT)
Message-ID: <f0edd84c-bc83-479f-8168-1bcdddd8fa94@oss.qualcomm.com>
Date: Thu, 19 Mar 2026 11:04:42 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/3] drm/msm/dpu: fix video mode DSC INTF timing width
 for non 8 bit panels
To: Neil Armstrong <neil.armstrong@linaro.org>,
        Alexander Koskovich <akoskovich@pm.me>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov
 <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org
References: <20260318-dsi-rgb101010-support-v2-0-698b7612eaeb@pm.me>
 <20260318-dsi-rgb101010-support-v2-3-698b7612eaeb@pm.me>
 <c9d14a74-8e59-43bb-827b-577c8f675c8f@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <c9d14a74-8e59-43bb-827b-577c8f675c8f@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE5MDA3OSBTYWx0ZWRfX9nrz5E7c815+
 EY+PcZUWo/nIQ5EINXbyRrPpYpMiFbV8WnpnAzhB2I6NjS97YoUhXVLB2Doxog0wiENZoItg+Ir
 CTgtExSqGxYXXRO+WPyulA8lR+4o45HpQpu9SH0vl/oRP5QsMZML4hRLPTkNoYKuW1FlLNBR4e7
 +0/T2OuRz8ru6gjn0DZI26ZyF1kcQ8HH8jMW4OkI3JlDibPssicxDQrA7oN2EMWpOVPLF5ybFNR
 LGRZ63K0dnEWFMJdgXYlPmJvMNF6cdHq7/0Oo1MGlFiKBW66U+eoI1bKBSBzXzCt4m+QGLTno9O
 wruWqIuG7BM2R6gHpdihH2tk5EbcOeYVfb4Wu0K1j/euwbwGyenEim3Qx4927iOXa5tuIkJkzNS
 tBfpc+GnaLVOnDEGEoqa2mu0ExgAVAN9RMP1iv9L/M10n3QfU0F/r01Hv5f7PGRpdNT6fdKryO5
 k6FqBC2yyJx2p5+JpTw==
X-Proofpoint-ORIG-GUID: Hz2EPruW69aAfTf1dXPb2V3s1fZoRW2n
X-Proofpoint-GUID: Hz2EPruW69aAfTf1dXPb2V3s1fZoRW2n
X-Authority-Analysis: v=2.4 cv=dM+rWeZb c=1 sm=1 tr=0 ts=69bbca3f cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=FH03U6bJQyAcg50I1OgA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-19_01,2026-03-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 adultscore=0 clxscore=1015 priorityscore=1501
 phishscore=0 impostorscore=0 bulkscore=0 lowpriorityscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603190079
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-98700-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[linaro.org,pm.me,linux.intel.com,kernel.org,suse.de,gmail.com,ffwll.ch,oss.qualcomm.com,linux.dev,poorly.run,somainline.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCPT_COUNT_TWELVE(0.00)[17];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,pm.me:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 3E6BB2C948F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 3/19/26 9:34 AM, Neil Armstrong wrote:
> On 3/19/26 05:00, Alexander Koskovich wrote:
>> Using bits_per_component * 3 as the divisor for the compressed INTF
>> timing width produces constant FIFO errors for panels such as the BOE
>> BF068MWM-TD0 which is a 10 bit panel.
>>
>> The downstream driver calculates the compressed timing width by
>> dividing the total compressed bytes per line by 3 which does not depend
>> on bits_per_component. Switch the divisor to 24 to match downstream.
>>
>> Signed-off-by: Alexander Koskovich <akoskovich@pm.me>
>> ---
>>   drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c | 12 +++++++-----
>>   1 file changed, 7 insertions(+), 5 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c
>> index 0ba777bda253..9b046a0e77aa 100644
>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c
>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c
>> @@ -122,19 +122,21 @@ static void drm_mode_to_intf_timing_params(
>>       }
>>         /*
>> -     * for DSI, if compression is enabled, then divide the horizonal active
>> -     * timing parameters by compression ratio. bits of 3 components(R/G/B)
>> -     * is compressed into bits of 1 pixel.
>> +     * For DSI, if DSC is enabled, use a fixed divisor of 24 rather than
>> +     * bits_per_component * 3 when calculating the compressed timing width.
>> +     *
>> +     * This matches the downstream driver and is required for panels with
>> +     * bits_per_component != 8.
>>        */
>>       if (phys_enc->hw_intf->cap->type != INTF_DP && timing->compression_en) {
>>           struct drm_dsc_config *dsc =
>>                  dpu_encoder_get_dsc_config(phys_enc->parent);
>> +
>>           /*
>>            * TODO: replace drm_dsc_get_bpp_int with logic to handle
>>            * fractional part if there is fraction
>>            */
>> -        timing->width = timing->width * drm_dsc_get_bpp_int(dsc) /
>> -                (dsc->bits_per_component * 3);
>> +        timing->width = timing->width * drm_dsc_get_bpp_int(dsc) / 24;
> 
> 
> 
> @bits_per_component: Bits per component to code (8/10/12) <= how the DSC pixels are encoded in the stream
> @bits_per_pixel: Target bits per pixel with 4 fractional bits, bits_per_pixel << 4 <= the target display pixels
> 
> - bits_per_component is the transport width
> - bits_per_pixel is the display width
> - 3 is the DSC compression ratio
> 
> So for a RGB101010 DSC display bits_per_pixel should be 10 << 4
> 
> But here you say bits_per_component should be 8 ? can you share the downstream config of your panel ?
> 
> Are you sure about the bits_per_component & bits_per_pixel values you set in the dsc parameters ?

The computer tells me that if widebus=off, regardless of the compression
ratio and pixel depth before compression, 24 bits of compressed data are
transferred per pclk, and then you can transfer 1/2/4 slices per xfer

(As a note, the DSC compression ratio isn't fixed)

This also impacts the byte/pixel clock calculations (but dsi_host.c seems
to have taken care of that)

Maybe Dmitry knows something more..

Konrad

