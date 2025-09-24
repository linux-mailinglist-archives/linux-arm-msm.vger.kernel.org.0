Return-Path: <linux-arm-msm+bounces-74559-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 8ACEAB983E6
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Sep 2025 06:53:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 90DED19C759C
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Sep 2025 04:54:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4533520DD51;
	Wed, 24 Sep 2025 04:53:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Ck/DVsim"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9290E13DDAE
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Sep 2025 04:53:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758689623; cv=none; b=S7UeuAD+vWiyorVrtLeTz5M8jaWieKHT4kOfgQSzuWlpO2x/2wlvL7h8hfeCq8b8n8UEucj3iU4APTBlxGSYg4MaTa0IGmuzi2Jh/O96HE5eLm2AgIeyIABfMfJuoDxcjyWdi1eeh4Q4bluzOhCMj97aFp0N9HTaWe0HkRqrvjw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758689623; c=relaxed/simple;
	bh=eUxBTMvzdb2zkKh9nJDwMMhUwPeFhTFBjEfTT9wSGbE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=mogNjNWVsJOfL3IJVitRJ/2sFPinBOmX6wAVbQ0oz2FO7gL2swbtx90JpmVhLN02U3xJDL1c5K6aXAKKkOxGLcQO1ihgMZbLTLh66T4NNg5nFVbIf6dxwFpijJO2vfnJrrvbkTI5QL6RTawHBaV7QDHih0lS0jyMGkKDG7cxF8A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Ck/DVsim; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58O4iD1w021499
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Sep 2025 04:53:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Ey1FV8fGRJ5ouO4792MVn66otxtTJ2WPhmB3J6JcvYk=; b=Ck/DVsimvGywDSo2
	qOWu11zFo10W2OKu35r+sOcvJjHoacGGcbYw37L6tbSA8GKvJ5gO81EQgQc0iNOq
	y+TEZOgV1ad4shlMY40UlNoJT3htvBSnT0AQzjDjOQT+Si1fgJXpYJLJ+OEGiv7+
	Ji6lgPXEFRedqcgA0LuoYZasSo1Gx+e8a8VhSLAwWMyERru+Z5fyTySwlYOQdknf
	U+hB7TXqLR/LZEA+7DQ9F2KuvvSLHtbFr7yZRqaUe9RjrGcd8mlgKlRdQGHcvuiC
	Y6wa3Pbxm85KxualEPPMIxq1Sp376oQRM3ydVJvCkwDec7CsMy6Y3Ir7ndaPIzel
	6BLBsA==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49budaakqk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Sep 2025 04:53:40 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-332560b7171so462112a91.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 23 Sep 2025 21:53:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758689619; x=1759294419;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Ey1FV8fGRJ5ouO4792MVn66otxtTJ2WPhmB3J6JcvYk=;
        b=WUPrfMdDzhB7qGEz1rD/USq1f/TLS1tbhZrmSlllF3qFKl8uNtyTvCpAycusovSwm/
         AffszrdkG1pIrvlaheohQpEtAstZaLraGttGAiLLBJyGfd3XHagpBP4s5u4oZHz6L6zu
         BnXgu9M5jUe8dvopiVrxYjEC0dVJFyi8ZtlSAi7dT0exUjSxCDnvMW5FUtKLEWU9q8w1
         6R1PrPH/7D2GTODypa7FE5n5ST4vQrW5uiERMMh9TgoPki43a0FvXySC6AnLE41DvjxX
         77fs35uEw5pjdZ3xA0KqAa+I5fJhOseyQZTBE1p0Dp8E7IQZBPRAIfdbHQZYv2Lriy5o
         P6VA==
X-Forwarded-Encrypted: i=1; AJvYcCV9tEWhtF7WfyQDzPFD/9xMbKW0mUHevU5xUGVGavNEkEuEB70N1HlM1XSFQs5Gp0t93G7bGnlhx5/yzsQk@vger.kernel.org
X-Gm-Message-State: AOJu0YwKkpo+gx5pjSGulBLyS7/Bd4kCVrwAnPZbI7EbCcHJM+gb+VSH
	0z5nLfll85gP3IytmmZzkTJ2ehGuizmsFsEbGGXdnPcaWFJM8LnyAZg/FL0SnmWwSHSlVRlp26M
	Lv+nHlor/KDkYercPgPeRT2W3gDmtj5KU64FV+zzFrBI5ixtJo46HRYUXwB+y1pq4s5bx
X-Gm-Gg: ASbGncu94sDg/GPEgcN3WPl0pMzLpURgfbhoVwzQtzu7BarMVAS/ZQAoN5YGaHKT1/J
	kUnIzlCrC0Qg5JztkpAPO/bdCGXkr/ff7ayFOJFFDkbnYibHpF8h90IM7oUagKfTUOSXDnpoEjY
	wm4JH5E8jcwK4Wr+38xd+61gagLmnU/yH4qRfKwktx22bgMzpIRZntx7Pu8nc8dha/IIeUiFmYv
	Sj/EvDOST3i1SwZOHaJDjfBquO7TSBs8hKE3p3qdw8VKZXVi57rhpX5eWnRkGMbSXBD2bjSewDA
	2RUX+VvEh9X6QEDMHL8ebf22iHNkr1L2OBYxk0o2S4cJXd++nRsbwZDrdIXSet9jaQsh0rGPMZh
	ciaM=
X-Received: by 2002:a17:90a:ea0e:b0:31c:39c2:b027 with SMTP id 98e67ed59e1d1-3341bf8b511mr1299844a91.7.1758689618169;
        Tue, 23 Sep 2025 21:53:38 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHwXizxz4PvN8bqF8/MZ0uIjY2bjNGutKbI+ypFUQlXZY6lfqzhFtn3JjO2PW+Psr+gOzAsuA==
X-Received: by 2002:a17:90a:ea0e:b0:31c:39c2:b027 with SMTP id 98e67ed59e1d1-3341bf8b511mr1299825a91.7.1758689617753;
        Tue, 23 Sep 2025 21:53:37 -0700 (PDT)
Received: from [10.92.183.157] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3341be14666sm894634a91.15.2025.09.23.21.53.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 23 Sep 2025 21:53:37 -0700 (PDT)
Message-ID: <49ee48ca-1b55-471d-a400-6054ac1fbed7@oss.qualcomm.com>
Date: Wed, 24 Sep 2025 10:23:32 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] sound: soc: qcom: use sa8775p/ subdir for QCS9100 /
 QCS9075
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>,
        linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20250918-lemans-evk-topo-v1-1-9680600e62d4@oss.qualcomm.com>
Content-Language: en-US
From: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
In-Reply-To: <20250918-lemans-evk-topo-v1-1-9680600e62d4@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: vvXnpl4oWJKKTjeU73EsRFUa2zBbXrrW
X-Proofpoint-ORIG-GUID: vvXnpl4oWJKKTjeU73EsRFUa2zBbXrrW
X-Authority-Analysis: v=2.4 cv=Yaq95xRf c=1 sm=1 tr=0 ts=68d37954 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=IA5jmXtsaGuytGhItUkA:9
 a=QEXdDO2ut3YA:10 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTIzMDExMyBTYWx0ZWRfX9dBjfBgHZjLU
 wzdxqJ6QGMCg44HX2cuoEMY+w86simzlAZhS9bR4bRXrm6VACJa0A6qQ5DsIYOB8a3W7jS/J7V+
 vtrdsxFLgrwX5D8l93kiwzrswAUxGemEl1KrTm2gByn1JhOZ+r2ZJM6mh/S0OzAoS2EhCnWGW5G
 Y+Qd0iHsdQFPfIHxTRftslfUHxLsJOTkASKpEE7MMbDALEYOL8iAju60xFo0qCh9rYD3wxSU5uH
 Wrb1sk/FFOinw8zjRXeHlwwtx4etljKhvcLgetIfVKam8jPSutfOVL8E+IWkxKBz9RIQptTH62p
 OQD+3dordxsr/YKuoJdpUfpgWJEuxp9Fncl/WBWf3q7/l+twSwo74Jrry0u9dtghGcb6jMR+MxO
 T/zZWxVc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-23_08,2025-09-22_05,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015 suspectscore=0 priorityscore=1501 phishscore=0
 adultscore=0 malwarescore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509230113



On 9/18/2025 8:11 AM, Dmitry Baryshkov wrote:
> All firmware for the Lemans platform aka QCS9100 aka QCS9075 is for
> historical reasons located in the qcom/sa8775p/ subdir inside
> linux-firmware. The only exceptions to this rule are audio topology
> files. While it's not too late, change the subdir to point to the
> sa8775p/ subdir, so that all firmware for that platform is present at
> the same location.
> 
> Fixes: 5b5bf5922f4c ("ASoC: qcom: sc8280xp: Add sound card support for QCS9100 and QCS9075")
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---
>   sound/soc/qcom/sc8280xp.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 

LGTM,

Acked-by: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>

> diff --git a/sound/soc/qcom/sc8280xp.c b/sound/soc/qcom/sc8280xp.c
> index 73f9f82c4e2581c132e6f6468740a33a6f2ec0c8..0d482d8eb1dd41a3a93d8a6d5cc4b419b8c45dbd 100644
> --- a/sound/soc/qcom/sc8280xp.c
> +++ b/sound/soc/qcom/sc8280xp.c
> @@ -187,8 +187,8 @@ static const struct of_device_id snd_sc8280xp_dt_match[] = {
>   	{.compatible = "qcom,qcm6490-idp-sndcard", "qcm6490"},
>   	{.compatible = "qcom,qcs6490-rb3gen2-sndcard", "qcs6490"},
>   	{.compatible = "qcom,qcs8275-sndcard", "qcs8275"},
> -	{.compatible = "qcom,qcs9075-sndcard", "qcs9075"},
> -	{.compatible = "qcom,qcs9100-sndcard", "qcs9100"},
> +	{.compatible = "qcom,qcs9075-sndcard", "sa8775p"},
> +	{.compatible = "qcom,qcs9100-sndcard", "sa8775p"},
>   	{.compatible = "qcom,sc8280xp-sndcard", "sc8280xp"},
>   	{.compatible = "qcom,sm8450-sndcard", "sm8450"},
>   	{.compatible = "qcom,sm8550-sndcard", "sm8550"},
> 
> ---
> base-commit: 05af764719214d6568adb55c8749dec295228da8
> change-id: 20250918-lemans-evk-topo-dddd73c29024
> 
> Best regards,


