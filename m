Return-Path: <linux-arm-msm+bounces-67241-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B479B16F57
	for <lists+linux-arm-msm@lfdr.de>; Thu, 31 Jul 2025 12:19:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id AD1A71AA68E2
	for <lists+linux-arm-msm@lfdr.de>; Thu, 31 Jul 2025 10:20:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7A54129B8E0;
	Thu, 31 Jul 2025 10:19:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ptXNcbtm"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E51A21F4616
	for <linux-arm-msm@vger.kernel.org>; Thu, 31 Jul 2025 10:19:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753957181; cv=none; b=k245wXnBig7gbKguii0/7yPFQzUzrBhJRj/jQAmlLghqx6UUGsM/GYhVBUdOHXjVMl936HTLweoxMVs0fPpXmYdbpVhCU1vFrpTTlh+omHyTpqWlnFNvzsASa3eFa8ZvqWwB/7jgCtgjgcCaxZ9+9GKa/Hzc9kwEieBa+qK1Iqc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753957181; c=relaxed/simple;
	bh=dPZxHGiDDmJP2O5n4FEVepPTjbuvw2bfy82v/XA4SBk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=lwqhVgrp6tjwatlTMTMvbMsK7WkJiz7oIZrK5tdRZqjYHHoQJ/ZaxzJGxe4JDiWV+X6ESvm3a0RW/vanAoz0A3jOdZQlZ9p6fw3eyNkxj86R2dnGp3Pgo7nge7d0jCfr5JbqAUhBz5LUCqFM20FkzW4guK0lDjCpXCXvjkYBamw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ptXNcbtm; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56V9fFG5004990
	for <linux-arm-msm@vger.kernel.org>; Thu, 31 Jul 2025 10:19:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	gqP/D2mc8RmNlu9TpE5LUCbh7vx3tqZxEc4lxFUC8fM=; b=ptXNcbtm+uFqCgIr
	KbwxU6cwl7758BB/NFhsiopEmc1Tl8rGk3fQDYNV3ifl+UskRiMaJDv/i9nCmrUH
	rWmYZungI+4tH7ewQmuw3+ZHfsG9VxGjJsXWDkJ6SqhG/QyPJALZANk3ueBQwFqW
	Hjo4pfYOkMtEcIX6oOYSI2jlBUZdppqlhk00o3UlJVSqyZ7zwmx+UV1mQwMa7DrE
	8ihsj0DXQ1QuQ7tPEAaW3gVQwBJSZVn9CcH4+ARBxaNCP6mGWkW5khE58h1u3ln2
	h4WZsd88a88L6WL4wGSNEeHrNmoq/boYX+0VLCROGlMfEiH42uZFo27iTeBFnqoU
	mpPxmg==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 487jweuryy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 31 Jul 2025 10:19:38 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-7e2ced79f97so21763785a.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 31 Jul 2025 03:19:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753957178; x=1754561978;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=gqP/D2mc8RmNlu9TpE5LUCbh7vx3tqZxEc4lxFUC8fM=;
        b=Y8UoYPSYhaiRqs7jmbMzQUfcEe4oFkqLR7CudzbfxUxS36gRvW8yJXD5xvXm5WpRHo
         Yo9y4of9RGzQ0toORHp+7ZHmCp41sDfUg4nUfG/0Ni1+E3Cq4PCx5GIL1ppucr2Mxy/a
         5UF10irLI4vF9sLXjSWiuLL8bBUh5qHGGSePkWgOLO0yyEzvljzRtdEgtoEiYQ4OBAZv
         WhOD2xZqbER9H+en4ES6V0Ot/hM1Nya2J5kgVkD5mrSJjFZwg0Ulw4v0F1rDmUZiggNq
         1E0W/VEhd2Fl1o/rYjoxUOFhzd0GofSGhs9XUZuIF6k0NNQXIzd1Vv22Rtb4r+2Bk2Fp
         ohLQ==
X-Gm-Message-State: AOJu0YwtuxIh0R8lv+CP6cCGOhPyMSggc1beThakxyVddsC9FZO99rhf
	h9OLj9OqajAiS+uil56Or0fsbZMv8sVkM8qgjVumXUzrRf71Nq5O/Xa214wllzgDIqgI/HLjm+Z
	ss8YiVhroEMbcZ4GDbqWFc9tRA88DaY2N0yBRQb2ygePhKb328/b2dCrWkYmkgnI2MnLM
X-Gm-Gg: ASbGncu4qi9xOSYDPbIagRwbVJSgkm3MMO6WUdh0InUOpWiEq9S2uSZaKenbphOHrF5
	uTIhy3vyhOHDuRyeEBn5Ext5OdL+KeOUne7mpFqb37rp1yk7JXyKoayRFh/cOqdLQhNki4TYUcw
	oosMvXy5EY8svAkZOmSQ7x6efTOLZ6xIlSVitN5/SHpTLbVU8HxuzVEucHNAlePubF36pLaPreh
	PYFWaCtoAHdd8IrBNH4JbUNWrh8gxSAHnthDWJFMUWztH7Z/vH6qDFFVrd2ExVJhoTOl/KJFUqr
	xTqbwej9/SWsR5lVCAW5RbXBRHTGqioaqegCEv5mj4NS2VTOBEKPvSvyN16PpUX16fFlaajxYrS
	6bpm08XTiQQmWasB1fg==
X-Received: by 2002:a05:620a:3908:b0:7d4:5cdc:81e2 with SMTP id af79cd13be357-7e66f372189mr499710085a.13.1753957177811;
        Thu, 31 Jul 2025 03:19:37 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGxnVmrpW4543srRHthGrkNrWHw3gNj9WsEk2mKRTDtWtwh5cLKN5XiE5eDu2MaiRmkZuh3Fw==
X-Received: by 2002:a05:620a:3908:b0:7d4:5cdc:81e2 with SMTP id af79cd13be357-7e66f372189mr499707385a.13.1753957177212;
        Thu, 31 Jul 2025 03:19:37 -0700 (PDT)
Received: from [192.168.43.16] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-af91a2436c2sm84867466b.141.2025.07.31.03.19.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 31 Jul 2025 03:19:36 -0700 (PDT)
Message-ID: <e7ddfe18-d2c7-4201-a271-81be7c814011@oss.qualcomm.com>
Date: Thu, 31 Jul 2025 12:19:34 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] drm/msm: adreno: a6xx: enable GMU bandwidth voting for
 x1e80100 GPU
To: Neil Armstrong <neil.armstrong@linaro.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
References: <20250725-topic-x1e80100-gpu-bwvote-v2-1-58d2fbb6a127@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250725-topic-x1e80100-gpu-bwvote-v2-1-58d2fbb6a127@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: RT0YiacdD3pbEPyDpyZ9s6aOMoUf-CXU
X-Authority-Analysis: v=2.4 cv=Wv0rMcfv c=1 sm=1 tr=0 ts=688b433a cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8
 a=EUspDBNiAAAA:8 a=1B6o04Z4kyHWbw-D5gsA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: RT0YiacdD3pbEPyDpyZ9s6aOMoUf-CXU
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzMxMDA3MCBTYWx0ZWRfXzI9nSzsO4Y1f
 B4FN4ngKqCdcrACp+nlGfqKvHqafApjf5/rzgpWKM60HBkMmp5Dme+Am3u3eEbxgY2y2j+32SRU
 HYTjd5z80gnX3+9smO8bXuTx6pLAvqZp8Mt7WYIQ+++DNBzp8miNiqvm2eZ/RewdRpOyShkY4WH
 KvVInzqvjM5JNuZqpyFDpFHPrRYiYTbO0Z30fxUqGLKmDeO8/kwa9pXEIguM7RcflC4pTZXN0jH
 b/p8vhkqQENnFNWkHNmI3ah62fsF0nw2sPVShhNvAmMcqEALVpl/RZE3aylndpB0c2DAW/RZLhX
 rZJHRjIBmnDRSDyIBr1ASMWyVl+by0nN7luUW3hGbt4xXau8rudtx8Cbktq9ldwdji/jqG9ZGnk
 S/2+3zdmX/SMT876YBGBuT+5kimhzQuXIc6lTBmtz95VYSdJGIlTxqzn5EiUAiPwokD00fWw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-31_01,2025-07-31_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 malwarescore=0 clxscore=1015
 lowpriorityscore=0 bulkscore=0 mlxscore=0 adultscore=0 impostorscore=0
 phishscore=0 mlxlogscore=999 suspectscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507310070

On 7/25/25 10:35 AM, Neil Armstrong wrote:
> The Adreno GPU Management Unit (GMU) can also scale DDR Bandwidth along
> the Frequency and Power Domain level, but by default we leave the
> OPP core scale the interconnect ddr path.
> 
> Declare the Bus Control Modules (BCMs) and the corresponding parameters
> in the GPU info struct to allow the GMU to vote for the bandwidth.
> 
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> ---
> Changes in v2:
> - Used proper ACV perfmode bit/freq
> - Link to v1: https://lore.kernel.org/r/20250721-topic-x1e80100-gpu-bwvote-v1-1-946619b0f73a@linaro.org
> ---
>  drivers/gpu/drm/msm/adreno/a6xx_catalog.c | 11 +++++++++++
>  1 file changed, 11 insertions(+)
> 
> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_catalog.c b/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
> index 00e1afd46b81546eec03e22cda9e9a604f6f3b60..892f98b1f2ae582268adebd758437ff60456cdd5 100644
> --- a/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
> +++ b/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
> @@ -1440,6 +1440,17 @@ static const struct adreno_info a7xx_gpus[] = {
>  			.pwrup_reglist = &a7xx_pwrup_reglist,
>  			.gmu_chipid = 0x7050001,
>  			.gmu_cgc_mode = 0x00020202,
> +			.bcms = (const struct a6xx_bcm[]) {
> +				{ .name = "SH0", .buswidth = 16 },
> +				{ .name = "MC0", .buswidth = 4 },
> +				{
> +					.name = "ACV",
> +					.fixed = true,
> +					.perfmode = BIT(3),
> +					.perfmode_bw = 16500000,

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

