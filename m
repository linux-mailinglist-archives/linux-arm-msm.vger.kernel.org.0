Return-Path: <linux-arm-msm+bounces-72265-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B25EB45537
	for <lists+linux-arm-msm@lfdr.de>; Fri,  5 Sep 2025 12:47:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 77F21482251
	for <lists+linux-arm-msm@lfdr.de>; Fri,  5 Sep 2025 10:47:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7C2552EA496;
	Fri,  5 Sep 2025 10:46:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fILQNVkA"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CD422E92A3
	for <linux-arm-msm@vger.kernel.org>; Fri,  5 Sep 2025 10:46:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757069173; cv=none; b=eRiSwl4U0xCxSHG+o0sth3Zz+C4S0uX7tgrnEI3yvaiE0GFDlVF0SdxYOMdEVfJE/NXcn1rJfe7kj6jR6oWPV+euskBXQsEznUHzHGfGwwvFUId/3XjUXJZRH8hsRUn92nnDj3bN/In1huXQt2OUQvQAk3bxjVpH6rNBWSJzQck=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757069173; c=relaxed/simple;
	bh=6duR9AAEjGMbDChCm8l0AFz9pGIbE/3Wj9Ss016HRu8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=fCUClqx+EVbM+T3ZSoW5a75KROivOCeVSQffQzUDlyGTnk38clYUnSB99DPH49OnaJXNcAHO707NKZdj29RfjAprgdKSL4O5lel3w/h0A2YeMU44SvBoWpLOcVPQAa8yCCCMZbNyGJWys7XWrARQXOyS4yjdVZcJ/WZ+BFctgpA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fILQNVkA; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5856LKNq004616
	for <linux-arm-msm@vger.kernel.org>; Fri, 5 Sep 2025 10:46:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	J/7Fvq0+FlOaEckovLs1a380VDNkHEU+i14RtfKNleU=; b=fILQNVkAxHT0ZY6O
	jRGEvytkX82/e3eFG6T8msjXcbkGYPu5eTCcgwcbcJU1V3XKXOSgWBYFhYhcMPNj
	FbZowFTJ4+z8+OIWv07RrkRTB3ImRPMbkme2+CvYolzH574tz2r7jQ1FgE1/FYIC
	k6SW/ZVhvnHl6cUD2U3wOuTDqejnuVeGwcoO3EIV1nNSP/Ye3UVx8MGUdful/60g
	oLxuHJZ33m29xrO4iUsx1ktEJWhtYQARmdz69XpCqGLsaxiZGRmAUoP16v9cwlxo
	bd18I6oKU+YdTZ0g1zCZU9fmfA55XsrbhP4pbQTJUvnGqL7Rrb3QU9bDRJPt4w+s
	K56NQg==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48ur8saxu8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 05 Sep 2025 10:46:11 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-726a649957dso40615686d6.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 05 Sep 2025 03:46:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757069170; x=1757673970;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=J/7Fvq0+FlOaEckovLs1a380VDNkHEU+i14RtfKNleU=;
        b=WNNmzupGyNKJ1SPcvAlol1BN0W4X9E94I6X/QfmbHG9aDtt60YEUPyIsGtiuHrCjEg
         pA76TEjIfWQO/a57ZydJkJdJ5J4JIZbXOMq8K40GnSw4Fr37JROKsWp43tWL9PXW/YwE
         R/1RH7i5QG3BVjbK+0gmXVuGZzyzRn/Ph06o5ICrTdmppErLRfFGlnfrPM+W5dbz/+yY
         7AbcBx2CCZp2USdI5kwrj315CiFfqDh9d57/55iHnKkbOokx/zBb7jfFMxzLYpaQ0GuZ
         E79w+JTZ5Qagw+3lEXhdKs0UBt4Zc2dawG4unmDUfEiinFobMXQ6M1Sg8JM09y3RDoio
         idCA==
X-Forwarded-Encrypted: i=1; AJvYcCUcPYBG3O22htMn3Fpw3cP5i4gykAu1Ir1HRYFl3CsrkzqO2hs375D5J8FCD7zkcNlzw11M1CM3pUPWcVO6@vger.kernel.org
X-Gm-Message-State: AOJu0YwX3s8uT/lui7vf7Q3gfYITIf/KKwwTQyRWSL+lBJoic+r+T63c
	sJGgdo7smmN85YtirG4lkWWEKKUTBqgo/WfbO9OC5oXH/OOpIxBI39pP43GmjG7zzoF5nd29mo3
	uiscOyamVzyNndkTmmPg9VaICyLNoizhRKFJOynwgj6gff+ha+9jKB7IW/7oPh9rkUQwv
X-Gm-Gg: ASbGncsppWMI5Fm56R3DCpRwILGQ85Oaj12kzCHdPsSRXrhwEbPxnvklfxJnYzG1OTP
	hTkEQAs4Owl8EgRN36KA3i55EJa4kTfar1zySZb9rl1U8RKQv71CN7VjD255OMzwiNwV3S9c5a5
	FIPRJIXpMmo2XHGtbsFOKH3ZrNozhX16vXKdmVsoot5QyqraC9GJ+UVILz/8dcJQRH+BvVV8nfc
	jy8tqZ3dgK+mbINCeZ7kE/2mcho7ylvhQ2k0B1EWtbCkwIAx7Wtb6dH0w/o3gD6E/NRQ3asC9Qf
	vKlOs8bAUumfOcWtbBGSY0va8gY7yymxGu75Ob3X0knoDokr55NKj6rawHspYR8quQY=
X-Received: by 2002:ad4:594a:0:b0:72c:cc04:c3b6 with SMTP id 6a1803df08f44-72ccc04c48dmr22169046d6.31.1757069169811;
        Fri, 05 Sep 2025 03:46:09 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IENRTTCwihhjXzgztLbzF3k7QDm2kkG3ZKRYNv9pLyaHqZ4H+c5PLsgbiWtYQtvOUfDYu5mfA==
X-Received: by 2002:ad4:594a:0:b0:72c:cc04:c3b6 with SMTP id 6a1803df08f44-72ccc04c48dmr22168666d6.31.1757069169201;
        Fri, 05 Sep 2025 03:46:09 -0700 (PDT)
Received: from [192.168.68.119] ([5.133.47.210])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-45dd05d0c43sm37831165e9.2.2025.09.05.03.46.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 05 Sep 2025 03:46:08 -0700 (PDT)
Message-ID: <fb126ef2-aa44-4a67-9188-3483b07b73d6@oss.qualcomm.com>
Date: Fri, 5 Sep 2025 11:46:07 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/3] ASoC: qcom: sc8280xp: Fix DAI format setting for
 MI2S interfaces
To: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>,
        Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>
Cc: linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, kernel@oss.qualcomm.com,
        prasad.kumpatla@oss.qualcomm.com, ajay.nandam@oss.qualcomm.com
References: <20250905104020.2463473-1-mohammad.rafi.shaik@oss.qualcomm.com>
 <20250905104020.2463473-4-mohammad.rafi.shaik@oss.qualcomm.com>
Content-Language: en-US
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
In-Reply-To: <20250905104020.2463473-4-mohammad.rafi.shaik@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODMwMDAxOSBTYWx0ZWRfXxavdSIZkDnp9
 xqM+WN4s0Qp2MgZ5Q/SftaZ0alazKvA1S3gwsXKRfGnuOr2kiFyMOpOPEU8STzhhGyZDSrB56vi
 BHguAyEa5yCIupxV64XJFn7yN9GfZRKeFpBsxrKj3fA7ED8SAoHUPYSybD2xBQay6ud4/SB52TH
 zSxQfQnYNdm1eOJgpaPD68q2onkkxi3hmQSIxfJMXgyV/4KEF1/wxY/fzOokgSHDAShJumjzQBC
 /gDTqRlTiTwO1lWZGG4f0S5ruTkakDxJ3F5cG46qTLUzwk04W+UE8gzG+roraPsSjkD7KhKYDud
 h4wWtQ9vk0MCGGf78qqJknDQWK+zvLSzIRMIT/dolG3WT/A0UEML4gkuJ/gWUXqbzdakm23/MOq
 YOPpYX7H
X-Proofpoint-GUID: Vjkoj88kBuiPsfEtkgBm-Lr7Qsaq_KG8
X-Proofpoint-ORIG-GUID: Vjkoj88kBuiPsfEtkgBm-Lr7Qsaq_KG8
X-Authority-Analysis: v=2.4 cv=PNkP+eqC c=1 sm=1 tr=0 ts=68babf73 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=4EjxHe3qrgCn2qlGiy0A:9
 a=QEXdDO2ut3YA:10 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-05_03,2025-09-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 priorityscore=1501 impostorscore=0 clxscore=1015
 suspectscore=0 adultscore=0 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508300019

On 9/5/25 11:40 AM, Mohammad Rafi Shaik wrote:
> The current implementation does not configure the CPU DAI format for
> MI2S interfaces, resulting in -EIO errors during audio playback and
> capture. This prevents the correct clock from being enabled for the
> MI2S interface. Configure the required DAI format to enable proper
> clock settings. Tested on Lemans evk platform.
> 
> Fixes: 295aeea6646ad ("ASoC: qcom: add machine driver for sc8280xp")
Why? this is not a fix, this is an enhancement to the machine driver.

> Signed-off-by: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
> ---

other than that,  LGTM

Reviewed-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>

--srini

>  sound/soc/qcom/sc8280xp.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/sound/soc/qcom/sc8280xp.c b/sound/soc/qcom/sc8280xp.c
> index 73f9f82c4e25..2fd06354923a 100644
> --- a/sound/soc/qcom/sc8280xp.c
> +++ b/sound/soc/qcom/sc8280xp.c
> @@ -32,6 +32,9 @@ static int sc8280xp_snd_init(struct snd_soc_pcm_runtime *rtd)
>  	int dp_pcm_id = 0;
>  
>  	switch (cpu_dai->id) {
> +	case PRIMARY_MI2S_RX...QUATERNARY_MI2S_TX:
> +		snd_soc_dai_set_fmt(cpu_dai, SND_SOC_DAIFMT_BP_FP);
> +		break;
>  	case WSA_CODEC_DMA_RX_0:
>  	case WSA_CODEC_DMA_RX_1:
>  		/*


