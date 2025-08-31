Return-Path: <linux-arm-msm+bounces-71307-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id C3B2BB3D169
	for <lists+linux-arm-msm@lfdr.de>; Sun, 31 Aug 2025 10:37:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 760841770CA
	for <lists+linux-arm-msm@lfdr.de>; Sun, 31 Aug 2025 08:37:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 227A022154B;
	Sun, 31 Aug 2025 08:37:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="pRyITQd8"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FBF119D07A
	for <linux-arm-msm@vger.kernel.org>; Sun, 31 Aug 2025 08:37:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756629427; cv=none; b=P2w9+1lwHeJaS1Otd62XuHc8QdIAV0qhIAhABOMaHlboCVMwCxbJ/w+7UbEk/dwcRbu029lP2kurDqeXjCWW3e8N07iUFkvwKyIj0OqelABJpMJ0lj79oD0fGd+pYDI2+HDERbsFJTGTsPjAVL2Vyw3vaUz3IDI5qp6YR5JvYoQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756629427; c=relaxed/simple;
	bh=KTcx5AK/U1aLX2t7lvHDaX6OWhGHUj3CO9nJLkF7ahc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=sqq0Z3FNfPWuC/X5rjNZF8Qd1nw/iOF7tepJHPyB4hKhv/ZUcu2LoRqwoStZ/LBV3xVUZ8FfshZYt7h+6IAb6Og4fMTlxmPH/lFZhLGmPsTYebGq8D3XF0VV0/j82k9THX0SbS7aQQTfPWu8glHwdnVfkAZZJ84cVfOwBwWojIk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pRyITQd8; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57V8J3Ic008936
	for <linux-arm-msm@vger.kernel.org>; Sun, 31 Aug 2025 08:37:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	xvUaMplkMJogbDO2u3ua3bX/R2mAiQNL2SvnRzJqJK4=; b=pRyITQd8eZFFZXxP
	vJDX//nE2JfjK13IJy1+MyOvvVVtqbcja5mVIA2IgSyfDKpEw9mrajXMmUw69GRP
	SCahhquzp3wATwCi1jsGiAn58T9xn+P/7h7xPuyAXhDtnpkWEtF0H4aPwsrFQN42
	QlrIvkWy55hs18i0RFr9ZfR8B2QLb9CUhCjXnBoT+GsYrHcHKo2OcSvq/l1FIe8a
	lvoux2jA0NzVMl8bCZrEpF2NdecPyTpic+Abv484+/FtaJupXsgWB/YeLtMDx+zJ
	7mk/7613Fuhw0VoTXFbNR6QCnT2y6wimd7lWlGWQoJloIlTsX0RJ7ry2424skUu8
	Gn3n0A==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48utfk9pxg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 31 Aug 2025 08:37:04 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-70ddd80d02fso35844116d6.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 31 Aug 2025 01:37:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756629423; x=1757234223;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xvUaMplkMJogbDO2u3ua3bX/R2mAiQNL2SvnRzJqJK4=;
        b=s04Gx5/48USb3pzMkt3mq5dKGzkj/UKh5wd0MkKfSo6N4mRy4AHsu1p+VaK3n9PqpB
         x5aMRxTpsGXB+T+q5YaskBAXO8hpFDg6AGtdPht3TC9iHwEtRodrBDL0kSqdPjwhFOlM
         A9DYMTrC1iXA1WDepTEfYlmPplrlAD4slkh/Urp2dbj7d8JMTuuhtWMTJM5UbCKWOMV5
         gJ/5LVkOGzOkpr6SiYmz120iC8CEJETTVe9qXDraZvEUNeGRjinC8iABYF2pToMHhKTw
         /XwsdRbWCCrldqzqCwcnaTZuQuL3xpPIG/EV4P0TwlPHaFEok20m4xv/IvDCC5Bv1B4r
         IXIg==
X-Forwarded-Encrypted: i=1; AJvYcCWf07NLlQV9VR+V1NBx9nrLKyd/e4/D7VlasXlNMieYUx237EOJ9EUr/1gbryWkXgScGa3G3yGyl6c91ys1@vger.kernel.org
X-Gm-Message-State: AOJu0YwO9ESQCoW5vLB6qTVfQue9qBgGljgI99RRdocK7eQY7Rk2IDtq
	5zxX/2ZiUaBdtbZ2npyAIgDP6XyeQauUaZgenSodyWsxO5GIGqkDyfTiv5fDJvDlEKOH5F/2Zk0
	D9W5CmHEWXHq4uVrDrvmvpPo0l4h1FKj6uJYWPnx2RkUyCfoiy8MNsAIEUjvKvbYFUWGn
X-Gm-Gg: ASbGnctbGWG3z4/iWOKeSTbyMJUAU+kywS/cJ7DUPPLhYRU4dhiwdbWb11JjmiBnbSw
	99Lydw13hw1Eh9mf0H7CtucT+etbWtn7ofkzcLyb2Snk7hAnfj6eulOWf/a4haJFDUFHqRr8AjR
	ml/sgn+F6dSpg1eGfSeokl/x4/79vBbtpbMx5VEw7ffsSGg9YEhlPHxvX06lC/MTLUL67fOt5X6
	IsvYTeE7ixtBQ8IV+3eQxm2ls3sic+dqGzeAdAvgNDvZLkNpgGx0AnzNN7NCkvwOZpmLmiKjp3X
	6bFRZDuTmoGMhEH2BU7TBVZYb6GqSkMF/yPDXMzA/YnXAlQvKmCJkICgZXyeD+bhMYI=
X-Received: by 2002:ad4:5948:0:b0:70d:a379:b954 with SMTP id 6a1803df08f44-70fac6f8bd0mr40632816d6.9.1756629423414;
        Sun, 31 Aug 2025 01:37:03 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFysRsDtlezgcpowiIOwxzIZWWR53SUtf3htCaraOnRVnxUG9PshDQSDY8Wu2/z3X0OOzKOSg==
X-Received: by 2002:ad4:5948:0:b0:70d:a379:b954 with SMTP id 6a1803df08f44-70fac6f8bd0mr40632576d6.9.1756629422878;
        Sun, 31 Aug 2025 01:37:02 -0700 (PDT)
Received: from [192.168.68.118] ([5.133.47.210])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-3cf276d5816sm10162308f8f.25.2025.08.31.01.37.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 31 Aug 2025 01:37:02 -0700 (PDT)
Message-ID: <6ca759f1-27ef-4cf4-833c-ee2f6a9b2d87@oss.qualcomm.com>
Date: Sun, 31 Aug 2025 09:37:01 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 2/2] ASoC: qcom: audioreach: Fix default WS source
 assignment for I2S interface
To: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>,
        Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>
Cc: linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, kernel@oss.qualcomm.com
References: <20250822171440.2040324-1-mohammad.rafi.shaik@oss.qualcomm.com>
 <20250822171440.2040324-3-mohammad.rafi.shaik@oss.qualcomm.com>
Content-Language: en-US
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
In-Reply-To: <20250822171440.2040324-3-mohammad.rafi.shaik@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=eaQ9f6EH c=1 sm=1 tr=0 ts=68b409b0 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=BoCV0UJ9-xh1oqjoEqQA:9
 a=QEXdDO2ut3YA:10 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-ORIG-GUID: Ymr0teMpvGthJS2uMCG_bOzq6j3Z0d-7
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODMwMDA0MCBTYWx0ZWRfX+i3XwcG6BBs3
 mCZT/9Y36i2D+Yw8mtaoCCbqBZI0SVxmbpvLHVkNrebzEzZs7bagUe4xmvPXGWvUWeKERcG0wE7
 1ydqD0uvNMKG54yfO6ZzVrOLbQAM1+1+pRkmFj/NBp00Su6h4QmDTfxnUvWc/gLJ2yTZXRLqEzA
 QeSoxkYhLtGTRG4VYPvGgSDYcDX6YE0SxHOJsIRPk8Xv4I9+xkfWv21zDNJmXHONFiGfrAQNoNP
 /jdVwjEJRnjMDPYcDGPjHZxTHVKQHph/gVi2FwSmfyTF8eJc4/e1uK7OTa6+1ukPzjKaIROnNyz
 ecr+DTt1Nm8LahN82psOMGSxNyU9IGwhAbl9eqLRDIGaRWiKxKplgoiH7Dvla2r9EUePFj1ur9m
 TboOSZjU
X-Proofpoint-GUID: Ymr0teMpvGthJS2uMCG_bOzq6j3Z0d-7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-31_04,2025-08-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 impostorscore=0 spamscore=0 malwarescore=0
 adultscore=0 bulkscore=0 priorityscore=1501 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508300040



On 8/22/25 6:14 PM, Mohammad Rafi Shaik wrote:
> Resolve an issue where the I2S Word Select (WS) source could remain unset,
> leading to misconfiguration of the I2S interface. A default WS source is
> assigned when not explicitly configured by the AudioReach module.
> 
> For HS MI2S interface, the DSP need proper WS settings to set
> appropriate endpoint configuration.
> 
Sorry this is not the right way to do this, machine driver should select
the correct configuration via snd_soc_dai_set_fmt.

who supplies the frame clock is decided by that configuration, we should
not be assuming any default as this is totally board depended.

--srini

> Fixes: 25ab80db6b133 ("ASoC: qdsp6: audioreach: add module configuration command helpers")
> Signed-off-by: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
> ---
>  sound/soc/qcom/qdsp6/audioreach.c | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/sound/soc/qcom/qdsp6/audioreach.c b/sound/soc/qcom/qdsp6/audioreach.c
> index 6d7b1a4b0b2a..d4397f75e310 100644
> --- a/sound/soc/qcom/qdsp6/audioreach.c
> +++ b/sound/soc/qcom/qdsp6/audioreach.c
> @@ -999,6 +999,12 @@ static int audioreach_i2s_set_media_format(struct q6apm_graph *graph,
>  	intf_cfg->cfg.intf_idx = module->hw_interface_idx;
>  	intf_cfg->cfg.sd_line_idx = module->sd_line_idx;
>  
> +	/* Set default WS source if not already configured */
> +	if (!module->ws_src)
> +		intf_cfg->cfg.ws_src = CONFIG_I2S_WS_SRC_INTERNAL;
> +	else
> +		intf_cfg->cfg.ws_src = module->ws_src;
> +
>  	switch (cfg->fmt & SND_SOC_DAIFMT_CLOCK_PROVIDER_MASK) {
>  	case SND_SOC_DAIFMT_BP_FP:
>  		intf_cfg->cfg.ws_src = CONFIG_I2S_WS_SRC_INTERNAL;


