Return-Path: <linux-arm-msm+bounces-88540-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id ED487D12284
	for <lists+linux-arm-msm@lfdr.de>; Mon, 12 Jan 2026 12:06:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id AE04C30537AC
	for <lists+linux-arm-msm@lfdr.de>; Mon, 12 Jan 2026 11:06:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CFFB6355049;
	Mon, 12 Jan 2026 11:06:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="O41eejZR";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Iph8kc2b"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6986E34DB7C
	for <linux-arm-msm@vger.kernel.org>; Mon, 12 Jan 2026 11:06:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768215963; cv=none; b=dIOROPMZ3jXszLLnrgFCnEGGk09uQ03RX+LKjDWnBrLlrYf5Wge8wjx6jhsP1R/zhuL4YLHHlst+KoQBgQhEOFxX/bVvwWRQM1P15Pu2jrCYs/REWF68gs/C63703LV5wBKgDKx4w+0gTp/WQzn54763SwJSm3/CUilop3AwN98=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768215963; c=relaxed/simple;
	bh=kYuNmGVXmfIdPGufiGEVDlDRzP1O19QSfUdMGpu6JSM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=BIiTvZBUFva6fmMibj6TNKGivNCkjkDMCWNAidxhkLW8n9JR1DqXqUFD7SRdVdjwmJwGxfcQI35z0kmg/EWD5s892uugi+moTTp4oezWclhFnJK5aB/AJg91f7IRu50X1PxrPRlJdjCb56W4Sm1dE+o9bYqttaeRTTo14o008N8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=O41eejZR; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Iph8kc2b; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60C83ilg3124249
	for <linux-arm-msm@vger.kernel.org>; Mon, 12 Jan 2026 11:06:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	CWPzQZzX3ElW2Gtvw0e+5qAqtv4K5X2Kt31bDWFr/r8=; b=O41eejZRHpAWdZ2l
	PNKFKurHrJh3SZCZmFjIu61O9IHVBoqQoULJ3GNgPi6ckTZqoZXR7qOvo9K3ob/r
	GhmbbNrrJby6gbn7Pv4c08c3crkKvnqeBwgeAdPcHzHUvJV3UWSYvXIvGX5yuOPz
	yw/veTUK+ISK8OS/QZBd6FgMVuIE++YzJuwPNRtthTOnqu1lOjmk/hbEeGHwHb1+
	KR25XPxLbeaBJiIIfvqPEtl1sO2DpArY9ko/451iYhyp+27nGNkgRErVb7NoxW49
	70G3LKnr9oYp+oUvu0OKaHa7bQl3BYGyV1f34ILMJKYoHPzQM61P0HcMv4ZYCMx0
	k6d68g==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bkntum3jv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 12 Jan 2026 11:06:01 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4ee05927183so11587161cf.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 12 Jan 2026 03:06:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768215961; x=1768820761; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=CWPzQZzX3ElW2Gtvw0e+5qAqtv4K5X2Kt31bDWFr/r8=;
        b=Iph8kc2bZdrNOFYSQjs1t+Slk4Np9A1zE6r3ivUXFPWNbR/UR41uvfSlyR84baZaUJ
         YsnnZCIWXNkAwZAwElgHwfVmkmlWDJFy8S0srhhiTB8+3zaibd07oAVP7CN7vNP5m6dW
         yygamA2PS1RNkBLekpA8Kb8PrF1Ome/5m3AB9LJ74CZ5vtLs7+fEgUjj4NkBQpriNp0c
         134FtW/UBFxCpDEs6s8e388v/w7q0RqzMDbKDP/A0x/4TUywZrX4YjT9jgMfkHgC5RM2
         vc0xO8bixtjLN2WPBPF0bYtLF1lLU8wdxA8TP9VLN3nKnlPL9hm5FP9Wd6dbrNFbGjQm
         xgPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768215961; x=1768820761;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CWPzQZzX3ElW2Gtvw0e+5qAqtv4K5X2Kt31bDWFr/r8=;
        b=IPQOC3nbN1CJX4nTCzBzLO77Rr739+YvotQAgfEQM2+bwcPLX8TigZaCamGTbLjCgu
         hxebmcKgiRWVj3l8Usg8Y+4YTJ28AIAV8HXPfAxFKXVoHxUwu2g0ywNn/1OZ4y2ePXad
         7XH4ZZDmaVDh1i9JjdVWTqz1RfTX9tKiuwnEK0A47E/jaT89HV/+P2mR0beq2ViJ0RKB
         n7JYHbmU+Z/kvAB+69YZzInLB90Nd/Jx9iqUb+BESYx5RFRrJyUcSDY4ywJDN2pjcE9I
         ylwCCvqCObv5m/JvmZm+lOaHRUk7VFS2s4LMgs013UQj5klV1kTpaUehKpeJCxIqKffa
         9fnw==
X-Gm-Message-State: AOJu0YwVu//ryhfaL9ka/vvEezz0hTfvVGJ0Mk0eNUMdo12RlIbNJ+Dz
	jJYcr3gYciSIDic2CI620xpOVscl9EkOOgi4CXk9sJGS/js2tVsXu13bXLiIJns0zYrQ7f+Gwar
	u6Wb5Li9iIMlgTwLPWrmKstyV48Jq22RNhZSnfM3ZwH2BshKbYlzdwWqYSLKv/TT2t9vW
X-Gm-Gg: AY/fxX4E2Z4ixGhuBxlfbBuK6GVI8u9ubLTQ7E9oZehY02s8ydn8fZC92iRwZo/i//K
	xqFhmrKJwWUJfBg5JeWHOjZnXMqLLkXtw1Jw9eXAJZuXAsKFGBiXZpxJoXnwyZ4LWxxiBXHRZn7
	yyBHciffiKWVGQ+NCduuvWgl7ObsWG9HiN6nAffB2FTuE58jSCB/7FQiOknelrbdQXcGyHyDMce
	IYAb7KoGNRWECb1diZu/46vrbYGCd2aYgmjvmpZX8ejYLYrycuSzhfIeu8Wkq1ZJG1Up+dVFz/S
	dRBepw8IEbH8sfLk8OY+bNJQfYhw7tfV2N6tuP65lT4wtl84j7WSIoN94NGDSCfY5ZuKMcUiVd6
	mTERW+p4SPM97eN6XfHZll8amZw1eDgXDqYx8hxwAnkV8fxyXTQqW9pBnVzDZLApOFaU=
X-Received: by 2002:a05:622a:4cd:b0:4ee:1063:d0f3 with SMTP id d75a77b69052e-4ffb4a8df70mr193903311cf.11.1768215960669;
        Mon, 12 Jan 2026 03:06:00 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHNv1v7wEqgWI3tjOCT1nA3PXnJ9lceXAcF2SXq40DOYlfVDQzD03ft0+q3tMM/DtBiVV4WlA==
X-Received: by 2002:a05:622a:4cd:b0:4ee:1063:d0f3 with SMTP id d75a77b69052e-4ffb4a8df70mr193902881cf.11.1768215960265;
        Mon, 12 Jan 2026 03:06:00 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b871f50cdc4sm209534566b.20.2026.01.12.03.05.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 Jan 2026 03:05:59 -0800 (PST)
Message-ID: <9b91ee50-9166-46f4-83f0-c7a46bc0ca06@oss.qualcomm.com>
Date: Mon, 12 Jan 2026 12:05:56 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 08/11] media: iris: don't specify max_channels in the
 source code
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov
 <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-media@vger.kernel.org
References: <20260110-iris-ubwc-v1-0-dd70494dcd7b@oss.qualcomm.com>
 <20260110-iris-ubwc-v1-8-dd70494dcd7b@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260110-iris-ubwc-v1-8-dd70494dcd7b@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTEyMDA4OCBTYWx0ZWRfX87aJL+S3RRVQ
 h+cj+XSnZPSzGszLXrgyx6eeelR8mbT3DvzMf8TeCt6suaJ8hP5aEINelKWd7BJkPgrE8TzmAnd
 zrOjG0yWETfPnj8gsi2shL9vrVf8ARxHme8UyJzk2A3Pj7E7JSDJzQJEzfIh/EGpDOo5mxt0MEM
 gmEBbKMmaVegF7CCL2OIAnrgeynmzZ3PquoUC+ce8RULVOjtQomOMJdKomb2O9rhmPjYKIh6uFO
 gUi+Ci7GcV2izNkftw1GgjDboauhfxjVqNubZhAE5IcJGivvEYelyLZUnKj/JmeH394D/PZX0Xj
 ts5USSIfuOPCvUHAq80mCNZeCcaYUVXNHhgXhzVIG7X7+jYHxzH8llM/wDzx+7EMTzX4WvWlyXJ
 DzAjVsI29vSHl20/fqKvUMhwtiw5/NiOu9cVN29zSONgl7oZTmbYVv8UbEdlAo8+YbaxwDeo7ro
 lqPFNRQL+u/dcQLgLlg==
X-Authority-Analysis: v=2.4 cv=R6AO2NRX c=1 sm=1 tr=0 ts=6964d599 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=Z5E5LkF8W0bl65O362YA:9
 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-ORIG-GUID: WishJInlt-rPuAGb4vfiVY_sbO16Lfoz
X-Proofpoint-GUID: WishJInlt-rPuAGb4vfiVY_sbO16Lfoz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-12_03,2026-01-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0 spamscore=0 clxscore=1015 priorityscore=1501
 adultscore=0 phishscore=0 suspectscore=0 lowpriorityscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601120088

On 1/10/26 8:38 PM, Dmitry Baryshkov wrote:
> The UBWC max_channels spreading is specified in the Iris driver, but it
> also can be calculated from the platform UBWC config. Use the platform
> UBWC configuration instead of specifying it directly in the source.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---
>  drivers/media/platform/qcom/iris/iris_hfi_gen2_packet.c | 2 +-
>  drivers/media/platform/qcom/iris/iris_platform_common.h | 1 -
>  drivers/media/platform/qcom/iris/iris_platform_gen2.c   | 1 -
>  3 files changed, 1 insertion(+), 3 deletions(-)
> 
> diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen2_packet.c b/drivers/media/platform/qcom/iris/iris_hfi_gen2_packet.c
> index 9945c939cd29..91dbea4c6664 100644
> --- a/drivers/media/platform/qcom/iris/iris_hfi_gen2_packet.c
> +++ b/drivers/media/platform/qcom/iris/iris_hfi_gen2_packet.c
> @@ -139,7 +139,7 @@ void iris_hfi_gen2_packet_sys_init(struct iris_core *core, struct iris_hfi_heade
>  				    &payload,
>  				    sizeof(u32));
>  
> -	payload = core->iris_platform_data->ubwc_config->max_channels;
> +	payload = ubwc->macrotile_mode ? 8 : 4;

With the hope that this never changes from a boolean

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad


