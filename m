Return-Path: <linux-arm-msm+bounces-82524-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 40465C6FAB7
	for <lists+linux-arm-msm@lfdr.de>; Wed, 19 Nov 2025 16:33:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sea.lore.kernel.org (Postfix) with ESMTPS id F38732EA51
	for <lists+linux-arm-msm@lfdr.de>; Wed, 19 Nov 2025 15:33:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 731672D9EF2;
	Wed, 19 Nov 2025 15:33:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="iCCo9Jov";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Sa5jlmC4"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7E4B286413
	for <linux-arm-msm@vger.kernel.org>; Wed, 19 Nov 2025 15:33:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763566428; cv=none; b=PPy8HZbdIN6ZgS7QHZFGVFSt8X6ZzFg0M6ZaqWmoRLuW9THh+HoeyojMu9TsjrX46l5g+zhBbsncSgIjCgWVtplqmR8MkR9QnBzmVhXahLenhf0uxPVd10kHHxeF4zTy1xYQDM2NUZarJg0+HhfYDltQpytJ3eUzaerWn6YINE4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763566428; c=relaxed/simple;
	bh=CBZQZs7xv6X2kFv2IfVFnqy0djw3Av6sZemZObvjki0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=tN6lM0NY0hxocH2lpiZNk/137P0ohpZn3LGsYLtXytuSadCtbbRAUXHLnqxQWBsGgAUI+O2I1vxy2x0/DvH3OATMBZ7vcQRX8Ze5NZj8POEjdy2NrqbQ8n0KVNf6Y852G2cMkSlP9WBWeB8sS3AZY+L5118h9DSntb+C12unRCk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=iCCo9Jov; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Sa5jlmC4; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AJEbUpm971170
	for <linux-arm-msm@vger.kernel.org>; Wed, 19 Nov 2025 15:33:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	S+kYNHmbeavT7vwFo0OFeKP1HGEGvaspPqZiWOp5Jy0=; b=iCCo9JovqrVKL4u+
	EUNE3hthiibLg4APRqdYhoynMybOpzYLUX6X7+zcDrwMWbxTjC/Mbkf5wb7TljYJ
	Ju4Ts0kHvv3+boPDqFencc8uRX6xC+AWRQj2Jj2N2/A2fOfONxvQrTg/ciM0frty
	ElZznIG18bqjoYUMzgqYOTqaNNWV+mR1sKV2UXHhT4fLb1XnU20+A3TtjeuTCdez
	fDD9HJLoa6AvXuXPHky4tT6TSgBcmbSgjypdc4hn+NhUnT1vHXIYU2P/cyyZGEeI
	a1cprdoWIf5tEjj9V62vTGrYHoITG7qX/h9Nvy2xTIPlZR6xTmaZRxavEuYyhyMO
	kSTc2g==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ah9fu9ekg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 19 Nov 2025 15:33:46 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4ee0995fa85so106654911cf.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 19 Nov 2025 07:33:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1763566425; x=1764171225; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=S+kYNHmbeavT7vwFo0OFeKP1HGEGvaspPqZiWOp5Jy0=;
        b=Sa5jlmC4OWQBAxe7HfEdAm5kgmtAOtWiu8d2FCA1TvjF66zAp2hSsDrhdeTsFotkyL
         IAFwnT+VIWWeN5DlzG3H/k5P8K9nrt5PHBAeKZlprYmYHqm9j+oFpevxjKaMT77pIhLO
         6d7T89Hc4VDsQ4UqrVBAZVMuEDSH4kMFzxziEdV0LIhtfnm40JpSE0QyR9hk7VTWfGKS
         vHb6VFzCGy91UoOJKfGCFJ3qltRvIjX34hT/CdsVSS6zOC2krwRTUm+AoR034zqn7Jsk
         B0tH+mknX4ThbqByWqDVoHuzhYQNeQ5DOZkEwQjKbqqAtz8uuceI2PBwcEJvgV0bi1hN
         qcSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763566425; x=1764171225;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=S+kYNHmbeavT7vwFo0OFeKP1HGEGvaspPqZiWOp5Jy0=;
        b=TbRnqoBCi6V/2NRLh6g03aFoe4cP6ahatkdYjwr6fImLKMSB1Ioapl3EVi8v7bG3o7
         WsI2hEfSglUUvUTSFqzDjb+cKo29ATT4eWQIINKCiVTWApZC1bl76OOgitHJYvVJVvue
         lyhkwVljHj6CN9LDyo0zZXyLLkDSfLZe64LJWTx696PG5mOwzYSID+7xxRPP/QwLqgpV
         5YLMbQib0A0Jy8DFjhLkFfBYIR5TPZO2FRMxVNh6z3GkGrJb2LRK6NL1HHIzfBlax4uM
         5EItXqJccjfmXldpYV0pdrbUekDW1bBCLB4g9ZNIBKbk+opE3oDO/NaiVAksHomuWbN6
         015A==
X-Forwarded-Encrypted: i=1; AJvYcCUC/8YEQ614Tc1+rpTOxD0HShw7SSguwW6TgJcdMFhZsHDt86iWKOmmSMHxoj8OcIl9uEj7DcW72CRYG3DU@vger.kernel.org
X-Gm-Message-State: AOJu0Yyx2jWM4TelH6XYIxC8NX40+RFiwOpmxaemAzF4PNE4o5R7vw9K
	alhrksvq8WfGE3OslDVQHYFTxd7TZCmqY288Xah/+Mylbysxlnt2gZZa5vt+eznypTl9NaTM334
	cDlY+QkI3vMdZstL+4fqIazh52+zDTHFMP/zJGNHL5ydDIDoTXACSZ6U0YVXsm26Qxdz5
X-Gm-Gg: ASbGncsphlWA5XsizQUadPq1RD+prfpWPJnZF/OgyyUf47MPdAJhHtvoRsL1IqnSGgE
	g3VXa+/aFmqGtGmAqatNaAVOnqYj4CkA0kNTiw9uc4LdOIKvknGsS/henU6xLktRUKIM2Z2wCp3
	NhqzKAU9eVw4UE4QgjmnRmb0epj/1FGJV7+e3EeI4AGVn018tKub+E48wx0pZCFri68vD4+sXjp
	l6vA8VMMn3JOOsEbnifRumgYScfKmgA3YRFjdqmKsUvB1yf5i1XALRYJMY2ZHTQUULqIRZT+gEQ
	t1Huex5/TwmxWgJHubFoEzCdmD6/ad65h0PjV2DcYgauSOhipMIbP6CFnAUqtTwUqwPvmatFgXk
	Yzo6lr/NoozSzy+2ZJkjaLoOBFDtYPxM720T8
X-Received: by 2002:a05:622a:1487:b0:4ed:1381:7877 with SMTP id d75a77b69052e-4edf2048d6fmr329639701cf.5.1763566425059;
        Wed, 19 Nov 2025 07:33:45 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHchlSRaRHTyobQtmeeRcR9FiTw+LF0isQlciqgDdX6FujnjR6pDwb5sSRpy+IUBfurVrqqyg==
X-Received: by 2002:a05:622a:1487:b0:4ed:1381:7877 with SMTP id d75a77b69052e-4edf2048d6fmr329639061cf.5.1763566424579;
        Wed, 19 Nov 2025 07:33:44 -0800 (PST)
Received: from [192.168.68.121] ([5.133.47.210])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-42b53e91f2dsm39745372f8f.19.2025.11.19.07.33.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 19 Nov 2025 07:33:44 -0800 (PST)
Message-ID: <257ffaba-fa78-4daa-8d6b-e54542c5891c@oss.qualcomm.com>
Date: Wed, 19 Nov 2025 15:33:42 +0000
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 8/9] ASoC: codecs: lpass-wsa-macro: remove unused
 WSA_MACRO_RX_MIX enum
To: Jonathan Marek <jonathan@marek.ca>, linux-arm-msm@vger.kernel.org
Cc: Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        "open list:QCOM AUDIO (ASoC) DRIVERS" <linux-sound@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>
References: <20251117051523.16462-1-jonathan@marek.ca>
 <20251117051523.16462-8-jonathan@marek.ca>
Content-Language: en-US
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
In-Reply-To: <20251117051523.16462-8-jonathan@marek.ca>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE5MDEyNCBTYWx0ZWRfXxoOORXlqlNan
 xb7huOy9eujvMqmMVbcpLmUlYLmTk7DW1ulXNmx8LCB8nuRQgBqpMATEmDub8sM2dQrshCj0qUr
 8vmDR7hlqlcXSKrKcfe7xYCfm/r92cvCIHOnBHG3N8ZH9zagHusNeyOalZJZ0nyq2rOEGKZJCGw
 r2XZce7KtX8bQprvBg1IKA8PYqLOZEYoPSJXUqIId1GRV2XXV9I7joGXZZNL/StcDPzpJmMtI/7
 l+1fBeERd5WzP3/63GhSANe2prCNkqZI7SrVEPavz9BhFk+avRggV635f2OugQTyH+t/CgKGtdk
 eVqhILg5wB/zAsHVrz4V6Wqx1M1nJWZD3lj9xqNEg==
X-Authority-Analysis: v=2.4 cv=KZTfcAYD c=1 sm=1 tr=0 ts=691de35a cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=RAbU-raeAAAA:8 a=EUspDBNiAAAA:8
 a=sJkrBO08HKnthcKKufgA:9 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22
 a=JiizpSU_mAIq9zsZDqn2:22
X-Proofpoint-ORIG-GUID: gaHKMAJr8uQdkZs9Od-P5Pswu0-p4ZWc
X-Proofpoint-GUID: gaHKMAJr8uQdkZs9Od-P5Pswu0-p4ZWc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-19_04,2025-11-18_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 lowpriorityscore=0 spamscore=0 phishscore=0
 malwarescore=0 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2511190124



On 11/17/25 5:15 AM, Jonathan Marek wrote:
> Minor cleanup.
> 
> Signed-off-by: Jonathan Marek <jonathan@marek.ca>
> ---

lgtm

Reviewed-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>

>  sound/soc/codecs/lpass-wsa-macro.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/sound/soc/codecs/lpass-wsa-macro.c b/sound/soc/codecs/lpass-wsa-macro.c
> index f02153108c275..694ee3ceda986 100644
> --- a/sound/soc/codecs/lpass-wsa-macro.c
> +++ b/sound/soc/codecs/lpass-wsa-macro.c
> @@ -297,8 +297,7 @@ enum {
>  enum {
>  	WSA_MACRO_RX0 = 0,
>  	WSA_MACRO_RX1,
> -	WSA_MACRO_RX_MIX,
> -	WSA_MACRO_RX_MIX0 = WSA_MACRO_RX_MIX,
> +	WSA_MACRO_RX_MIX0,
>  	WSA_MACRO_RX_MIX1,
>  	WSA_MACRO_RX4,
>  	WSA_MACRO_RX5,


