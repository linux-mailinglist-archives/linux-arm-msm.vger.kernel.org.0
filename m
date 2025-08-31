Return-Path: <linux-arm-msm+bounces-71308-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F133B3D16B
	for <lists+linux-arm-msm@lfdr.de>; Sun, 31 Aug 2025 10:39:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 341743B311F
	for <lists+linux-arm-msm@lfdr.de>; Sun, 31 Aug 2025 08:39:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A92F9245010;
	Sun, 31 Aug 2025 08:39:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XlRGZkZz"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E82A1A9FBC
	for <linux-arm-msm@vger.kernel.org>; Sun, 31 Aug 2025 08:39:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756629550; cv=none; b=cUSdkzrs9yAnbxuwMIvurWpeFOdOGsSYIK4On345QwYhCBsDio7oyOXMFZf0XK7LNsZHG+jDsLaFdesgEmBz76oUx5UR/1BCUnF4r2SFCjSavUu3IQrN7s6POYx/+yXlX/IVd1zAICKCvzJf0CZ489bOvBQQprbGX+Y62ah3it8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756629550; c=relaxed/simple;
	bh=/A+9TjPsnGaaJzFSwqhfMsQkNU5gbU9e8IGwIjA9oLg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=j2DhzWBXdd6hMZEaLIiL0BLyc/0I4sp+rHoy1vnkS1HxB3RWGdvXw4/9c5bvOPx22RmiD5K5Y85OGjixrJfTa0RrO8plX1HkxHDWDQaf9vvv8X/eUe789kqCDg+7BqdUpep45l/0QMjcbIkWkvxm53ik5USDOVsIibTksWFjcUI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XlRGZkZz; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57V7VQbE007459
	for <linux-arm-msm@vger.kernel.org>; Sun, 31 Aug 2025 08:39:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	BRXQM5Xhx9VNwUQ6ACMX0+vtiPfY733mOi6VzYAWoQQ=; b=XlRGZkZz5u+pAihs
	0xyj05uxTBenxYmSvN41H5BBt/3c66Elz8TU5Ix0JBAgGtRruh6ZKIpdQvcOV/fP
	Uhp38GCz5NRS+5NHevT/JK7TEAH0n2TH9bnFWo44sX7S5vo9kTj031fZhlol21mb
	3CtNTl6e4qxSI0svFD4y7DGl+uil0R0aFwqChqWlmum8aDipm55VnbW0VtfpdJ0+
	1+do4QZDE9dyXKqzH3YXtd48E/IgQkG2pgG7mvholxaIbjeEg1jNjL4lvYoVOnz7
	AZWW33HxH6D/sKPC9SIItUy2E+pHyx5DmzkbkiiK+qGEd65PD7AiTpcBxh8GU8tZ
	pVuWlQ==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48uscussqg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 31 Aug 2025 08:39:07 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-70de0bdb600so59997746d6.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 31 Aug 2025 01:39:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756629547; x=1757234347;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=BRXQM5Xhx9VNwUQ6ACMX0+vtiPfY733mOi6VzYAWoQQ=;
        b=G9Gsa4mD2brRkKA47+1v1rbFiiS/jX46eJDvsznurmBeeEWKG+nO9NfRAoYUrISMSp
         Zf1EilP2Vid9FDXb4dXA4lmTu5w0vd3x2XrStFesmU0uH52nIPl9kWMS4BvJU5pfvMO/
         UP1FC68NDkvE4CZugCUTfxxHimusNN3hlHY//U/0SzUahHgR0HXDClAPujNkaCtU6BLJ
         eb7TqmrHXs5xC4yK8xyxQiozBN4lmy4oVIytT3Nu87XrMKPp7c+salc0MbRlVXROIz/N
         J05mP+T/PycjzP1D7KxQPkRO47it+JAjJX8DdWjmvATVRSR3k3H+q9MCbXK8q5W9JALI
         hXJw==
X-Forwarded-Encrypted: i=1; AJvYcCXRe7Ebhg1P47cNGaqo90dC4KPBM/2u22qNbzl+vDeYnAJRs8P6iukWGTKFnHoyf3iKxeS5zHdvdwoA7Ugn@vger.kernel.org
X-Gm-Message-State: AOJu0Yws21HVJuYa+U90bkwBCtP/LbiqoN1T0FZdi0MfyAxdqrVFnR+U
	vO6m0j8wcyaBaud4e/3cQgli6kYf/Xb4WN8r/+eufVIKe7wDdoNmPnfZs7sGHx9yj/PkJ1pjutc
	E54TcJbSpZvEhThaTfxpW7QsTOuAPJViP19waxtCC42EQqlYo5kjLZ9+m9Iwd4DcA08bM
X-Gm-Gg: ASbGncsuxgsQueM4eNtZ/bEnOWrIwYpmiwH/UFahzmDLhr+S5LsR1YyO6W8HTOhIIZr
	0XFgPt+DgMtTeRC0JPr8Zx0VAY6O1pxBtOoc6ta5WtF4L7pwr++C+lhqsW/hOq01BIjNCe++3FQ
	Vl6FeGBnCzAJ+AlyXbzktti7RWdD3fSpfx/Z93tDo0Qdrwh55tfT4jcOFvTptbdP3jHPpz6CtBB
	CJulnHYvYev5RJyu3UuO4x8OLZ56DPICf7WZm1CCy7C/1y9MybZ2TFMLoBFO+XNb51P3TSwHxlX
	5h/F4Pi0zp8RCvSB/NuIKtIMicv6P4o21lLesDKcpXVDK/zHxZR21Lnb9h8DJlFSbtk=
X-Received: by 2002:a05:6214:5193:b0:70d:e501:1f9b with SMTP id 6a1803df08f44-70fac74ade3mr33464376d6.23.1756629546606;
        Sun, 31 Aug 2025 01:39:06 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGBzQ3HC5YME0UyGE1nyvjX0lufS8HE9JEN+POL+K35U2LzfmYAtT8yaQCjtNiPDfZCBh4nHw==
X-Received: by 2002:a05:6214:5193:b0:70d:e501:1f9b with SMTP id 6a1803df08f44-70fac74ade3mr33464266d6.23.1756629546197;
        Sun, 31 Aug 2025 01:39:06 -0700 (PDT)
Received: from [192.168.68.118] ([5.133.47.210])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-45b6ee66bddsm189016035e9.0.2025.08.31.01.39.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 31 Aug 2025 01:39:05 -0700 (PDT)
Message-ID: <f5cc1395-a3b7-4d5b-b8b0-d97de718e691@oss.qualcomm.com>
Date: Sun, 31 Aug 2025 09:39:04 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 1/2] ASoC: qcom: audioreach: Fix lpaif_type
 configuration for the I2S interface
To: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>,
        Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>
Cc: linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, kernel@oss.qualcomm.com,
        Neil Armstrong <neil.armstrong@linaro.org>
References: <20250822171440.2040324-1-mohammad.rafi.shaik@oss.qualcomm.com>
 <20250822171440.2040324-2-mohammad.rafi.shaik@oss.qualcomm.com>
Content-Language: en-US
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
In-Reply-To: <20250822171440.2040324-2-mohammad.rafi.shaik@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODMwMDAzMSBTYWx0ZWRfX+A45NQVMgKDO
 oX+AWzjo0cuNX7EpC3UoFmkp8bEsIwxP3jt3Q+K0RZp0TRvwjitWrPlFHuQe+EQ/z3BymkLdKTi
 zdZOo4v/9/FjYsC8+cZPU9P1d07PAY1csG1qxGB9Yec+gYHNMIFc4xRDnSt2pF9SjG5nG9/Srzi
 DAPdAZmOE5PXUW6zHV/fHIN6tXwJl/gmgbDzFzawb2zLXWwYU45Qdfm1wv1JM5IIrsyn868dUDk
 IXBK2K0YFFRJQVB7Jgk0S4gWajLn5hOwJNgOHprkMb/+pdMZJsPFna7q5saBM7+V+QbtOAfem+O
 5GgEf7yprF6wfys1LtEDttIXvC81yWvGbkz3XNNyrBhTp8OroTHj9Bv0R5RZZ8Ulu8luai4Biem
 A5/7lxZO
X-Authority-Analysis: v=2.4 cv=A8xsP7WG c=1 sm=1 tr=0 ts=68b40a2b cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=KWf2NDoUiaxIZHtpWeoA:9
 a=QEXdDO2ut3YA:10 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-ORIG-GUID: FwpAt425913gmh0sl2CyNPF9PdjxeWBy
X-Proofpoint-GUID: FwpAt425913gmh0sl2CyNPF9PdjxeWBy
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-31_04,2025-08-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 spamscore=0 impostorscore=0 bulkscore=0 clxscore=1015
 suspectscore=0 malwarescore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508300031



On 8/22/25 6:14 PM, Mohammad Rafi Shaik wrote:
> Fix missing lpaif_type configuration for the I2S interface.
> The proper lpaif interface type required to allow DSP to vote
> appropriate clock setting for I2S interface.
> 
> Fixes: 25ab80db6b133 ("ASoC: qdsp6: audioreach: add module configuration command helpers")
Missing CC Stable.

> Signed-off-by: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
> ---

Reviewed-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>


@Neil, this might help on the I2S Playback issue that you have been
hitting on SM8650.

--srini
>  sound/soc/qcom/qdsp6/audioreach.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/sound/soc/qcom/qdsp6/audioreach.c b/sound/soc/qcom/qdsp6/audioreach.c
> index f4c53e84b4dc..6d7b1a4b0b2a 100644
> --- a/sound/soc/qcom/qdsp6/audioreach.c
> +++ b/sound/soc/qcom/qdsp6/audioreach.c
> @@ -995,6 +995,7 @@ static int audioreach_i2s_set_media_format(struct q6apm_graph *graph,
>  	param_data->param_id = PARAM_ID_I2S_INTF_CFG;
>  	param_data->param_size = ic_sz - APM_MODULE_PARAM_DATA_SIZE;
>  
> +	intf_cfg->cfg.lpaif_type = module->hw_interface_type;
>  	intf_cfg->cfg.intf_idx = module->hw_interface_idx;
>  	intf_cfg->cfg.sd_line_idx = module->sd_line_idx;
>  


