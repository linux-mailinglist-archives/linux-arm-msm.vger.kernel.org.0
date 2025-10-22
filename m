Return-Path: <linux-arm-msm+bounces-78309-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 140ADBFB6C7
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Oct 2025 12:34:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9683A1A04448
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Oct 2025 10:35:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 078CF2FD7CD;
	Wed, 22 Oct 2025 10:34:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="UhmDuNmL"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F2E126CE2D
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Oct 2025 10:34:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761129283; cv=none; b=d026Mo3CqmvVWQ2B3p2jSte34aUOj1fPSoKnzPLcagZSYrXsfk8pDucTxrgKLDiNtkZqyStCmy4LK8x/htkkLjNRLPS12jDPsLe4WfFABT//SaGl46wp1XUe/BEUrgRG8Wamc/zTbntxje7cukubGnOrIqAmC5s5S35Orn23MvQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761129283; c=relaxed/simple;
	bh=QpMNfT7FmfE9DJjiA0JFNPgcEP1z3UGq7yfCQDkFKVM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=d0BFlZCiDrrmT/zGqnAXnMqgN2bFh4Y8c5QT2ZYj21twDKtZIuy6m/ALh5UofRKstgc8IhM1eK+38lDjNmiSMrHXJo/k2ryDB/R5f3x1ZNLJ2sCtvV1bYDzJqA50BvPT/qnqROZN4Ion1AZpKdW8t/dDJoK7d9AD9/2B9H+GtJ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UhmDuNmL; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59M33q21026906
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Oct 2025 10:34:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=Ey36IRL4isg0/uNf3V/qgF/w
	XSf+ypTyipvXiTiDYHg=; b=UhmDuNmLfkLoPHPCiTu0KGf5/uMGk6H/V+wkb8DH
	xfeaUFz97MZMEsZBsRlgiYG+wZi29raAPyU0udr8HIAkUkgZvdWJt7N+u95ZiSmx
	HDd8We4o+GwUDoRbjnSpp9wYo5D6/7oADQ6Bhklq5/qZgWPrZKo8VHQgyPVlsqsV
	K8UJ+t81txXg9EUuk5PPSLcQQw3ycYlKWQ8stgVRHq0vh8SYu7UE9q9KwehH4yHD
	aoUt7ObmnqqOU5BJeOfU1icpEyehZrwlyoXlXe9alGpVYVsOVrVVtOOkyKoczBPs
	k+5tEYHUevZZ4FQK1myt5ARguRA2lJP9iS8RJk0UO7INPg==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49v08pmhbw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Oct 2025 10:34:41 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4e88947a773so44512101cf.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 22 Oct 2025 03:34:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761129280; x=1761734080;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ey36IRL4isg0/uNf3V/qgF/wXSf+ypTyipvXiTiDYHg=;
        b=p5Gruel1Iud9MGibVl2PYh5+EheVWabD74nKztgHIra97eP8SZW526uU/Qr2db1+WF
         PKLUFUKKqgjoWWwgxf4miJttcRPLjL8nffFPbApBVhUEmwAlGflJdBkWwjxAc7cTXZDn
         Ut83UDD0G0z3iBYjSzi24R/RTNqp0rYHNroW+qzAAtUXqihkY5dQ8aPst2G4hmBD1Rm4
         YCR4QDb1SXZRyhYsmAETGn1WPIbJ7B3B4Y3FZGcVG9OU9zx6Qut3LzJoX7HaamVckp7M
         ATx3HQvVXpx0L/uZJhi8d6k8Ln7Wdg5zzAaNTgOdmPa1kjV/FTG/7w2W1Cr6pb6OScq5
         5WAQ==
X-Forwarded-Encrypted: i=1; AJvYcCVxg6xCRnUOUFw3kGr4A+OCudu9VRdRvECKtpY4jnMx6zn1g9l1UmksIsqYVteGpPwtPRI032xGuUt1C2fj@vger.kernel.org
X-Gm-Message-State: AOJu0YxAEtXE8Ie0SFTEsBh7XlQfeVLQiXPY8bpEnj6FkGnbb1/tSq3v
	ko11f43iZOVieNABlHUVC4iw8VQ/hsOQLHgVsH2fPyfTgpn7vTDH4eV0UtNJbuJuZLC8Ww60VoS
	3FxhlitrSAgihF90AjqWDuH7q7gcLshgysP73OQvkWHpa70akmpQhHfhBYSuXoaDEDB3B
X-Gm-Gg: ASbGncvCNyucSoJ1zreAWEUKjj9HOMRBd1peNXFB8D7Ho3QqkLpYIvGIIUksh+bs7zU
	+Dn33pCe1qklXpfBFQ4aSQfJ2pzGCVrWSpBAGoMKtjJv7UIn2AlzHsQ3LaZ+zpdN2ChvqU/UzAg
	/vmqx2adoF00cLf92xgQ/ZwuABzeFG+ZCw3gIw8FH8D+XowyaO9Wrc54Bvbs/zOHQCzQsvx/4WT
	zYaOHx5+iu+c6NRO/gerYVkc8HR33RdfOhkSbtSGdi0Ab1lRpajfeK68Q1nAxRU1F0pC6L4aw1A
	hno0Go73mFPn/9A13OqE+tlgVJVnfC+I3p0vgLz/ENZwCAYiMkPU4nK6wCKheltBZHpPO1kmKNq
	Y5BTxhhyvlKTZceapANYXV7itkfz8dY+URh5VMJVpD7jef7PubFYDGMyvCGimPAbeReEk7+CmLd
	ald8l5BGPfXsA=
X-Received: by 2002:a05:622a:3cc:b0:4e8:a8be:5857 with SMTP id d75a77b69052e-4e8a8be5e94mr171268991cf.55.1761129280268;
        Wed, 22 Oct 2025 03:34:40 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGQLkTKu9y3Ou0mi+Djx6Gq6aJaXaybifcjUti0v+lLVcSxUR5WWEF0kxHzawkEmfJY+aBmeg==
X-Received: by 2002:a05:622a:3cc:b0:4e8:a8be:5857 with SMTP id d75a77b69052e-4e8a8be5e94mr171268571cf.55.1761129279594;
        Wed, 22 Oct 2025 03:34:39 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-591def26992sm4554093e87.103.2025.10.22.03.34.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Oct 2025 03:34:38 -0700 (PDT)
Date: Wed, 22 Oct 2025 13:34:37 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Abel Vesa <abel.vesa@linaro.org>
Cc: Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-sound@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH RFC 2/3] ASoC: qcom: x1e80100: Add Dell XPS13 9345 support
Message-ID: <sihiwhcdra2kviuago7r6gnm6b4goqcpjgt43loen5alk4atze@mhklkp2hz5y6>
References: <20251021-dell-xps13-9345-enable-audio-v1-0-6f3f6bbd977b@linaro.org>
 <20251021-dell-xps13-9345-enable-audio-v1-2-6f3f6bbd977b@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251021-dell-xps13-9345-enable-audio-v1-2-6f3f6bbd977b@linaro.org>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDE4MDAwMCBTYWx0ZWRfX9fiytBOxYexD
 d8EmR84NXp72tIscO7xy+fR/CpQ0ti4+Z5rNanZIMWZE2zihF0Sv7yBME2Jh/vq1fU5SayZiK0C
 1RzHJOt6R7GAVD2rYTBo4Wpt+hZjUk/8X9xm/ggNuC+6PXtMJp5aX529jUPAHvpGZWIVLScrPWM
 G/e4I7LebHhM1eENwWoW+mZtFNaAQNEvp3vpwykM5TnLxw/pYWhK0TqXMycD0dvKT2mTp1PH4C2
 7rYP77CGwpQNsRT0mTqNza9QdUsBJ176IUWIR3kenv8swNGQs/gH/DM3XvwJtx8hlOX1ISL57ns
 Js0vsQVqsqQqjSH4D4lNrv6eZX9bPGmRq7/X22Geio4us4EoX21JwhSUAgleTF5J1QkGVEGNlmL
 6diMxvFKdwM2aBTYiwKc0rGP38Sp5g==
X-Proofpoint-GUID: NXBAwh7A68UQd35v8-Lkf8wsSocrOceR
X-Authority-Analysis: v=2.4 cv=Up1u9uwB c=1 sm=1 tr=0 ts=68f8b341 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22 a=KKAkSRfTAAAA:8
 a=7aqP5zvjfKpTuSzq1rEA:9 a=CjuIK1q_8ugA:10 a=a_PwQJl-kcHnX1M80qC6:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: NXBAwh7A68UQd35v8-Lkf8wsSocrOceR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-22_04,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 suspectscore=0 malwarescore=0 clxscore=1015
 impostorscore=0 bulkscore=0 priorityscore=1501 spamscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510180000

On Tue, Oct 21, 2025 at 04:50:45PM +0300, Abel Vesa wrote:
> On Dell XPS13 9345, the PCM channels are mapped starting with right
> hand side instead of left. So in order to support this, we need to
> hardcode the mapping and tie it up to a dedicated board compatible.
> 
> So define a match data that brings the mapping as well, for the XPS 13,
> while the rest of the boards will fallback to use the mapping based
> on number of channels.
> 
> Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
> ---
>  sound/soc/qcom/x1e80100.c | 49 ++++++++++++++++++++++++++++++++++++++++++-----
>  1 file changed, 44 insertions(+), 5 deletions(-)
> 
> diff --git a/sound/soc/qcom/x1e80100.c b/sound/soc/qcom/x1e80100.c
> index 444f2162889f7d9d4b6b06bddc980d8a15dd988b..e21cf534b2ac3875b694f381f260164acb2e3ae4 100644
> --- a/sound/soc/qcom/x1e80100.c
> +++ b/sound/soc/qcom/x1e80100.c
> @@ -15,10 +15,17 @@
>  #include "qdsp6/q6dsp-common.h"
>  #include "sdw.h"
>  
> +struct x1e80100_snd_cfg {
> +	const char *driver_name;
> +	const unsigned int *channels_map;
> +	int channels_num;
> +};
> +
>  struct x1e80100_snd_data {
>  	bool stream_prepared[AFE_PORT_MAX];
>  	struct snd_soc_card *card;
>  	struct sdw_stream_runtime *sruntime[AFE_PORT_MAX];
> +	const struct x1e80100_snd_cfg *cfg;
>  	struct snd_soc_jack jack;
>  	struct snd_soc_jack dp_jack[8];
>  	bool jack_setup;
> @@ -95,8 +102,16 @@ static int x1e80100_snd_hw_params(struct snd_pcm_substream *substream,
>  	return qcom_snd_sdw_hw_params(substream, params, &data->sruntime[cpu_dai->id]);
>  }
>  
> -static int x1e80100_snd_hw_map_channels(unsigned int *ch_map, int num)
> +static int x1e80100_snd_hw_map_channels(struct x1e80100_snd_data *data,
> +					unsigned int *ch_map, int num)
>  {
> +	if (data->cfg->channels_map) {
> +		for (int i = 0; i < data->cfg->channels_num; i++)
> +			ch_map[i] = data->cfg->channels_map[i];
> +
> +		return 0;
> +	}

Why by default the driver remaps channels depending on the usecase, but
for XPS we use a static map?

> +
>  	switch (num) {
>  	case 1:
>  		ch_map[0] = PCM_CHANNEL_FC;

-- 
With best wishes
Dmitry

