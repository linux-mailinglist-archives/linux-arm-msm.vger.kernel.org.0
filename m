Return-Path: <linux-arm-msm+bounces-70362-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F657B31597
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 Aug 2025 12:39:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B3EBF1BC3FB3
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 Aug 2025 10:39:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6DC062F6179;
	Fri, 22 Aug 2025 10:39:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KThJm8W6"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0AA42F6171
	for <linux-arm-msm@vger.kernel.org>; Fri, 22 Aug 2025 10:39:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755859147; cv=none; b=J7qzLhnWZBmDLCZy7H1UehZojwJB8eN1HoUulXcFsdLTCMDABN0+tJ8Nv3MHnIwYo2T86WlhtpcAraBzG7dhj359QnYZ5V/rMoTXww+AcqMfc6FqbGOBTUth8wBrlZn3eVmk3eJfOwCP5Kcm6wCIAf7Knv1l4ROSTC4fwzWxMrU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755859147; c=relaxed/simple;
	bh=jUX/r9RsZcGNRJ/PKy1ft9RmpI77wTYlMOSZQGBL1e8=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=l4+FNaTPRh3VI0m74ZdbtjOPkHsFh7YpQARnz4q2iUZOkOYa1eFRzESqVXtjA8GjTtzafIA/vCuDTpngFZbS8Tu6getZsoifCJTxE8//TTpPBVEBXa+cg/CnhLLCQ6syXwknGx3q2GVTOQ3dUHtKvkP4B7ZOPH2JfQhgBAXg2QI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KThJm8W6; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57M8UJYF024107
	for <linux-arm-msm@vger.kernel.org>; Fri, 22 Aug 2025 10:39:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	tEYj78kDDZNqCektDc9Qzj8ZYGHcgUPi5WGwOTOcZMY=; b=KThJm8W6guybmZky
	4Gpe717HgSm+HdEq8UaU8LDF70MF4SVmZismIDipdr06drGLvJ1V1n+BfuWxIUTh
	BASEwGA16njo+Cz2rWgY1M++WLlj0g8SWd7C//SWE39lMr6/GSp2qHjeKTLYc3gg
	qGzBu8wxfCEDiPBGYiI2xH7dFDGbNu8binKDgukMTflrMX8Vwlxy5TUGCeRYJPSy
	J+hVniMCvitFgeFgwdkt89Ur8wjpf7GuR6XNUPFF2w1Xw+xQuCiPg9DiqmTTWMu+
	IcZeXAtZvZF55XZuuHFuUVFSUwtjPwKMzMWszA3HAUkpi7fBGJFt42cr+fdiCVGd
	l2geOw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48n52agyg4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 22 Aug 2025 10:39:05 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7e864817cb8so814559185a.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 22 Aug 2025 03:39:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755859144; x=1756463944;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=tEYj78kDDZNqCektDc9Qzj8ZYGHcgUPi5WGwOTOcZMY=;
        b=fJFm4LFGXqHnz7bzQVcpf+9aldnZnBc+xvBQllQHRHKDqH0wqnyEgov0hf2RLrEz/R
         boSiyU9TnBcMyCFCZTck8zWTEPttEmXcmbhwWr3PdjG+y4YiLCMo1QoIdrJcyv5a/IkW
         qk06QzrpWV3v84y1zSZL7t6e79/SQH39T5bEWH4Rrt1Iec6Q7IvBw8McWa9ND2Z+WCpM
         KerAfUmHK/tc+YkM/FYdMVC8WAHiTTPS1xs95+KC8OdkFtZK6nfVkQb1iWxXRvGP7VAI
         r/+glxodDEzS2ihb6dR6QBqK6ln+ZiCS99jpbdD+LuVEHN4O7Ta0pcv6pnFZ6SHO3yiU
         L15w==
X-Forwarded-Encrypted: i=1; AJvYcCUJ7V00AVsPxkeBM3+XqrxdGz0q49UcubFekR+gBKmpANM/nRWEO37gdP7RbvhDMAmxNAjRqYw3sUhXKfG/@vger.kernel.org
X-Gm-Message-State: AOJu0Yy/T9Ubt503qgfAWYBkW96qEhrxQFQ914UUfl+reuYG8cybVsu8
	M2Apt945dEBOZivXa8i5tTpMeJFPzCeFrJYTpHcVdY0K8ly/1wmh2I9z+L95X0PYg41Dgn8F7e/
	VpYqo0LFRub7iiAo0bLe8U/FalZkNf3B0c88N4+oYBp/ZeZlQAIuJtEjCZ+TvmO/0g7Rl
X-Gm-Gg: ASbGncvdO4OOzIjvWlxPEqmK2OGMj8tIlsmjdLZ8zGiFawId7tQOuLs2VeHDnXbrers
	ZgmeUO16MBjD4DiFJ46WFQ1o0UlyRvUqkSrq9xOgwM+/f2C0zBM5B4L5nBliMFPLWBMJdayfhUg
	Ukzcej5xPBWcglx6RWpzOCklES9nO6taKl/+SQkf7TSLlSPpy3LMhBx6sTy/tDunk64FdX+IJrn
	F1wmttQnUDGaptzp+AXbPkWKuN5cVC894LNx96e9iOHTDPosjM86at1M14rj7gGH1QAAOWAl1MH
	zSzzOCoNJ7Q1taYmmAyt7PfW78ND+HRDhXMoqIrhzK2S0IAQNMC9bOOpif0vxwqSKxw=
X-Received: by 2002:a05:622a:389:b0:4af:bfd:82bf with SMTP id d75a77b69052e-4b29ff9063fmr57492581cf.17.1755859143807;
        Fri, 22 Aug 2025 03:39:03 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHDI6VWxl67USh3oUaMFJLIrKflkLf1xshpbfrxke76ywOQuvAn1j74aJhLi/r7gO3jGaiwLQ==
X-Received: by 2002:a05:622a:389:b0:4af:bfd:82bf with SMTP id d75a77b69052e-4b29ff9063fmr57492281cf.17.1755859143324;
        Fri, 22 Aug 2025 03:39:03 -0700 (PDT)
Received: from [192.168.68.118] ([5.133.47.210])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-3c5826751d5sm3527432f8f.14.2025.08.22.03.39.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 22 Aug 2025 03:39:02 -0700 (PDT)
Message-ID: <2566eea5-a153-42e6-9a43-1c0af5a4c11c@oss.qualcomm.com>
Date: Fri, 22 Aug 2025 11:39:02 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] ASoC: qcom: audioreach: Add support for Speaker
 Protection module
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20250821141625.131990-3-krzysztof.kozlowski@linaro.org>
Content-Language: en-US
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
In-Reply-To: <20250821141625.131990-3-krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: pge4v0KpDKa-jPvxopmjSrZciM4AkgQe
X-Authority-Analysis: v=2.4 cv=B83gEOtM c=1 sm=1 tr=0 ts=68a848c9 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=KKAkSRfTAAAA:8 a=jR5H-ETkXLhSoB5CPuAA:9
 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: pge4v0KpDKa-jPvxopmjSrZciM4AkgQe
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIwMDAxMyBTYWx0ZWRfX2PxEQiK9TfC5
 XEL8BSH5VaEZgrmkf6Y8D7G4v4ZELU9EC1k802yAJ/w5OrAOskOZzeVksRdaXmrdmKldHdL6HAy
 oPIS1PaoM3GCOvI/2lT5A0jeu9sjc5547xxOHJL+sVcBNxfJDN1BdqOKct4c16LJMAGiSbNZeDV
 sRxDPc2zWZcLD6qDxSJulW4WngEmGDM8p0eoJdiLcJhrIAk8H1AUo59VllMcCJnSknCzh+YpDjG
 K478KE0uVQifgXLRM3VvNJZCmMnpE1W6HrgVJWmgboxhKB2QeZ9ZXkFGUigm8f3ZhY5GmjIZLr1
 Hz6BeFUqeHM9ufAgWL8ApLpXGRicqrCM9Qm1DR6MHiym3A6SKisv+WFzB8ZRFL3mcnH9OKmjZTp
 oTxtM/Zd/9KeTiZqA/PNcHi5iRSOug==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-22_03,2025-08-20_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 priorityscore=1501 suspectscore=0 malwarescore=0
 lowpriorityscore=0 adultscore=0 impostorscore=0 clxscore=1015 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2508110000 definitions=main-2508200013

Thanks Krzysztof for doing this.

On 8/21/25 3:16 PM, Krzysztof Kozlowski wrote:
> Speaker Protection is capability of ADSP to adjust the gain during
> playback to different speakers and their temperature.  This allows good
> playback without blowing the speakers up.
> 
> Implement parsing MODULE_ID_SPEAKER_PROTECTION from Audioreach topology
> and sending it as command to the ADSP.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>  sound/soc/qcom/qdsp6/audioreach.c | 13 +++++++++++++
>  sound/soc/qcom/qdsp6/audioreach.h | 11 +++++++++++
>  2 files changed, 24 insertions(+)
> 
> diff --git a/sound/soc/qcom/qdsp6/audioreach.c b/sound/soc/qcom/qdsp6/audioreach.c
> index f4c53e84b4dc..b7f1fc835dc2 100644
> --- a/sound/soc/qcom/qdsp6/audioreach.c
> +++ b/sound/soc/qcom/qdsp6/audioreach.c
> @@ -1250,6 +1250,15 @@ static int audioreach_gain_set(struct q6apm_graph *graph, struct audioreach_modu
>  	return rc;
>  }
>  
> +static int audioreach_speaker_protection(struct q6apm_graph *graph,
> +					 struct audioreach_module *module,
> +					 uint32_t operation_mode)
> +{
> +	return audioreach_send_u32_param(graph, module, PARAM_ID_SP_OP_MODE,
> +					 operation_mode);
> +}
> +
> +
>  int audioreach_set_media_format(struct q6apm_graph *graph, struct audioreach_module *module,
>  				struct audioreach_module_config *cfg)
>  {
> @@ -1299,6 +1308,10 @@ int audioreach_set_media_format(struct q6apm_graph *graph, struct audioreach_mod
>  	case MODULE_ID_GAPLESS:
>  		rc = audioreach_gapless_set_media_format(graph, module, cfg);
>  		break;
> +	case MODULE_ID_SPEAKER_PROTECTION:
> +		rc = audioreach_speaker_protection(graph, module,
> +						   PARAM_ID_SP_OP_MODE_CALIBRATION);

Are we leaving this in calibration mode forever? When does the mode change?

> +		break;
>  	default:
>  		rc = 0;
>  	}
> diff --git a/sound/soc/qcom/qdsp6/audioreach.h b/sound/soc/qcom/qdsp6/audioreach.h
> index 790fba96e34d..0ad566e45e09 100644
> --- a/sound/soc/qcom/qdsp6/audioreach.h
> +++ b/sound/soc/qcom/qdsp6/audioreach.h
> @@ -31,6 +31,7 @@ struct q6apm_graph;
>  #define MODULE_ID_MP3_DECODE		0x0700103B
>  #define MODULE_ID_GAPLESS		0x0700104D
>  #define MODULE_ID_DISPLAY_PORT_SINK	0x07001069
> +#define MODULE_ID_SPEAKER_PROTECTION	0x070010E2
>  
>  #define APM_CMD_GET_SPF_STATE		0x01001021
>  #define APM_CMD_RSP_GET_SPF_STATE	0x02001007
> @@ -542,6 +543,16 @@ struct data_logging_config {
>  	uint32_t mode;
>  } __packed;
>  
> +/* Speaker Protection */
> +#define PARAM_ID_SP_OP_MODE			0x080011e9


Are we missing

#define PARAM_ID_SP_OP_MODE_NORMAL		0
?

> +#define PARAM_ID_SP_OP_MODE_CALIBRATION		1
> +#define PARAM_ID_SP_OP_MODE_FACTORY_TEST	2
> +#define PARAM_ID_SP_OP_MODE_VALIDATION		3

> +
> +struct param_id_sp_op_mode {
> +	uint32_t operation_mode;
> +} __packed;
> +
>  #define PARAM_ID_SAL_OUTPUT_CFG			0x08001016
>  struct param_id_sal_output_config {
>  	uint32_t bits_per_sample;


