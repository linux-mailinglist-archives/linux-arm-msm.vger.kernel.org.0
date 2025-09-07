Return-Path: <linux-arm-msm+bounces-72417-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 60708B47A4C
	for <lists+linux-arm-msm@lfdr.de>; Sun,  7 Sep 2025 12:00:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D8E67189E0BA
	for <lists+linux-arm-msm@lfdr.de>; Sun,  7 Sep 2025 10:00:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5C99C23ABBD;
	Sun,  7 Sep 2025 10:00:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ROsvt3gP"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7575238140
	for <linux-arm-msm@vger.kernel.org>; Sun,  7 Sep 2025 10:00:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757239223; cv=none; b=nwoLCrdQYHJ0gdLnUBWrgzwTbsh3TitZ092yjc6/Vpr3i8hfFWAhRJVCAMygAXcFjmt11uR4Y0yPi1PxmoHdWJzrCEhT4K43CxoWZ9ZX7FM/SEZHUzdqkrMSyCysVxMdgrhMA8F5tHBHbM+MKb4cF7cl032DEa0z/acnn5cumaM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757239223; c=relaxed/simple;
	bh=JdRGVx4bHeaB9hxsshS++UJcE2XQe4YXg/1/cdY5kpc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=OxfgLuWS2w4lvkH71Y2OS4uu2auMYvPPB7fiHskVGgXVESwKYg+BwQe2GkhPw8k7mLFK5gAbHm7dZ2FTEQOLyOb/WBCJ/dd3EIiUnetLNSZHkmd/h1ZyUpudS/OwB9sXQn1CrKXa9jQEv3cJOh80USo7AHSjye+hT4LxlaVZkDk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ROsvt3gP; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5878jP3L002719
	for <linux-arm-msm@vger.kernel.org>; Sun, 7 Sep 2025 10:00:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	qr3Czd9PwhhylBpPVieXHwCBf6HZ/rEjYpqLSCwU1MQ=; b=ROsvt3gPtum96m7O
	O+9R4aaL8zNmbnZ+R/3AfPkim2F6zAIbHwZq1T5fz/KNVz4e9KfKVXQhGVbESLb6
	m7iX3fXPgiMe59J1CbZJhtQp5nQ2hf7bdQDAWynMIqjnT+3Cq46IFcW+7f2ra7dk
	mUo3UwG1xETfod5qzQIyZpf+WCbg4V62gOa17zkTWQCjNDQv6boB/ojppi3UM1Y/
	/tsvSboIWkAaUBRpYUY5Tq/Sw3GyO8BTqLcQdIbgwTNWveXlCD76nMsoPc73uvVo
	kviLF5HEdr6HLO5uxptPcTtzMhPJhQ+PchDdTvJ4enNTGUcPsOwvZ45gWPjD5QYY
	o3K5ug==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 490c9j2064-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 07 Sep 2025 10:00:20 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-718c2590e94so106224396d6.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 07 Sep 2025 03:00:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757239219; x=1757844019;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qr3Czd9PwhhylBpPVieXHwCBf6HZ/rEjYpqLSCwU1MQ=;
        b=D8zHrJkKNf3G3lovQMGC5oFb6hIz8hJKYB5sT26wfmNVr7qvNYLdA8cqMuRNDWH5gg
         WKb3x0wcD8oK7/i/upwUHs0qfzdJh8j5s+lkH7KlP411JZn8gM5L3pAogQWC0wSQ08qQ
         ow2SQVCk7huta50xlPH+UfUeeNbekw0tDhzLAW7s8K/8qciJtxRUi+A16Dqr6wqIcavz
         PTgczZP5x9yKxL8seYRldIgC4y7U/7zJB16cjIz8wQIbRBidTMpycZfYSRc5VClgHhS2
         An0UvRAHxnHfbFP9xRYWPiyf2w//gO4gXh6ykmV4xStF6u6uCiIbqTV/iozYyAnkFvQ2
         nTww==
X-Forwarded-Encrypted: i=1; AJvYcCV6WUvkCvwldiIM54p5LymDq7aaiSpBcXPN9wX/pc5SBStgLUHOjrnnsBLYM4TodQdd4koWWztNs+UHZLKD@vger.kernel.org
X-Gm-Message-State: AOJu0YwUwiPSk3fzRK+oVeoGUw7byWX/LaZPmHryBWwnfCHJhkgzwLV7
	C3lt4EtfEOTp2qOrX7lzSmzLcaRKISZ65zqsyebYJ3LPuiMd7pgJCxmJ7MUHL/7UHMLeJh3ATz6
	/1snPTP7rntUX7XpSOjZukovx9TEYj7WP9PkPecdAbY13jfCeGxsz6HZFdSm8KR30D3RV
X-Gm-Gg: ASbGncs3bF6nG+ShadAj9K9EdqsnxKeTOm3/NZGycc1r00UauH1KST5PleriAuAPoLp
	qh5fzbFAT3DOLzEKRsDS4KsRrElPaK2yNWpfAITapGaq7TnpBfVUHbNhKfZDsw72t6i9oOwPNRs
	PKvRQ/Ab3PYqX0DJVq4nioeFCUhLSLH1xllnIj0Vyl6ADncXts7aaejP+mxGs9eDLNpLSs/eQLr
	oVh7ManACLe9cZb4JdGFIma7IXDyyz/7T8C+sb3DunVaBtJ1aRNspHTpWhSUt97aHyxvQDUwWhD
	Uib0oehiPIJMawIZrmXbNQcrYLsm5mav0ot3geuf57JwJxWjbD168CU4uWSXWlzPgiE=
X-Received: by 2002:a05:6214:2462:b0:70d:ae61:7ddd with SMTP id 6a1803df08f44-72bc5842ebcmr122738936d6.31.1757239219439;
        Sun, 07 Sep 2025 03:00:19 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHZRn6PmHHN0WVzaevPq6eNyd0NSdg9SA4KKI1yKwL5vha/Px9Z7l0N1LQNsS6IGy0U+cad0g==
X-Received: by 2002:a05:6214:2462:b0:70d:ae61:7ddd with SMTP id 6a1803df08f44-72bc5842ebcmr122738456d6.31.1757239218799;
        Sun, 07 Sep 2025 03:00:18 -0700 (PDT)
Received: from [192.168.68.119] ([5.133.47.210])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-45dd296ed51sm141015435e9.3.2025.09.07.03.00.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 07 Sep 2025 03:00:18 -0700 (PDT)
Message-ID: <899db9f0-27f5-4404-8357-4985e084ac99@oss.qualcomm.com>
Date: Sun, 7 Sep 2025 11:00:17 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/3] ASoC: qcom: sc8280xp: Fix DAI format setting for
 MI2S interfaces
To: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>,
        Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>
Cc: linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, stable@vger.kernel.org,
        kernel@oss.qualcomm.com, prasad.kumpatla@oss.qualcomm.com,
        ajay.nandam@oss.qualcomm.com
References: <20250905150445.2596140-1-mohammad.rafi.shaik@oss.qualcomm.com>
 <20250905150445.2596140-4-mohammad.rafi.shaik@oss.qualcomm.com>
Content-Language: en-US
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
In-Reply-To: <20250905150445.2596140-4-mohammad.rafi.shaik@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA2MDAyMiBTYWx0ZWRfX8O7IqlovUbnj
 Xixy6V0n71vAUkNHuoLm7aUXn65bVM/Af8ld1yODIg4OIxJm3JtdylNU42U1orw0uMkBg57tsDV
 Y2FSY0LIKaVOoP+/mYPLpMsgii8axS9FF6IPtF7nwiBTJcxPWXAWlgzT2gb4hr8IuR32nt3AyzV
 zmNC72O6gOe0K0BwcnR+Ba7X3QvvqDeOaNF++a8PVA6n5OiypXC5W7931q7v9aNYtXweczbvhDF
 iY2ZvOfECWT6HiE4JJAjGSNzkPCRHLWGHF7OejPjX+75UgaMwnu4wMwuyfEegi+GHkScMDQrpBz
 6zECUZvf02vmkvFMJnmN6wauRkif8RtZ/Asjg6H1Jc6x7Tijh3GzTAgvh51eUBqfxny2hQBy03V
 5l5r9yEV
X-Proofpoint-ORIG-GUID: Xq3nhasE9P4q88jukyAL0Yutd5h3VpIo
X-Authority-Analysis: v=2.4 cv=PpOTbxM3 c=1 sm=1 tr=0 ts=68bd57b4 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=VTWOZG3uf4wZYCvkMeEA:9 a=QEXdDO2ut3YA:10 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-GUID: Xq3nhasE9P4q88jukyAL0Yutd5h3VpIo
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-07_03,2025-09-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 spamscore=0 bulkscore=0 clxscore=1015
 malwarescore=0 adultscore=0 impostorscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509060022

On 9/5/25 4:04 PM, Mohammad Rafi Shaik wrote:
> The current implementation does not configure the CPU DAI format for
> MI2S interfaces, resulting in -EIO errors during audio playback and
> capture. This prevents the correct clock from being enabled for the
> MI2S interface. Configure the required DAI format to enable proper
> clock settings. Tested on Lemans evk platform.
> 
> Fixes: 295aeea6646ad ("ASoC: qcom: add machine driver for sc8280xp")

Am really not sure if this is a fix, because sc8280xp does not have any
Mi2S support. If you have added support for MI2S on any other platform
that uses sc8280xp machine driver, then that is the right fixes tag.

--srini
> Cc: <stable@vger.kernel.org>
> Reviewed-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
> Signed-off-by: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
> ---
>  sound/soc/qcom/sc8280xp.c | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/sound/soc/qcom/sc8280xp.c b/sound/soc/qcom/sc8280xp.c
> index 73f9f82c4e25..3067b95bcdbb 100644
> --- a/sound/soc/qcom/sc8280xp.c
> +++ b/sound/soc/qcom/sc8280xp.c
> @@ -32,6 +32,10 @@ static int sc8280xp_snd_init(struct snd_soc_pcm_runtime *rtd)
>  	int dp_pcm_id = 0;
>  
>  	switch (cpu_dai->id) {
> +	case PRIMARY_MI2S_RX...QUATERNARY_MI2S_TX:
> +	case QUINARY_MI2S_RX...QUINARY_MI2S_TX:
> +		snd_soc_dai_set_fmt(cpu_dai, SND_SOC_DAIFMT_BP_FP);
> +		break;
>  	case WSA_CODEC_DMA_RX_0:
>  	case WSA_CODEC_DMA_RX_1:
>  		/*


