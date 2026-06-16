Return-Path: <linux-arm-msm+bounces-113460-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id OHEIMPabMWqGoAUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-113460-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Jun 2026 20:54:46 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id C1ECE694906
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Jun 2026 20:54:45 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=Q3V67WP5;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=VvYwH9SU;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-113460-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 104.64.211.4 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-113460-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id EBBD230093B6
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Jun 2026 18:54:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F01B547D929;
	Tue, 16 Jun 2026 18:54:41 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9466F47CC7A
	for <linux-arm-msm@vger.kernel.org>; Tue, 16 Jun 2026 18:54:40 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781636081; cv=none; b=GWIXIPTcEFsH0i1S8x2CuLgdVWnbSWJJpE0p79wqjVN44Oxw3CrpUKV9nPoOWlATMqTTreMeVuIn4dvuD2nWxwnIDPjVU9AvUsNE0FhobyZz90abV0ZraoNg27Gn3nYJnb34YQAbhQOX4kE6aI4mNzKhS31FR5syYzdOXLyIfcI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781636081; c=relaxed/simple;
	bh=9P5ywowxZ7sG3J0zUIV+m1n+yJLNaTIzKokqaNzncAs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=A/dDbGxV5HdhkHgo+zAcqiTnObKH0MvTFg6YZtIap4rQt0lE4JhoSQ6MNiCUx6ZSLcaN8q43F5K38uiTICwkSlcFX1GUxawoQTpaduOtvGhwADvRyeh14SZDZhD9iHVJekd+CaQT/mu+EUOJlE9Hm2WuXng1Hn07Bnmpl754UsY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Q3V67WP5; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VvYwH9SU; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65GIOe7T382359
	for <linux-arm-msm@vger.kernel.org>; Tue, 16 Jun 2026 18:54:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	fpOyMKeLDAw+3XSNLlU8yH505LS9kArFfaRTBNtkEvs=; b=Q3V67WP51invc51Z
	BfpLxw+Mr+UvbTy6/2m4Bj9aMuvrTfLpMtbwNkRgeJLRIBnwoxwt0a195Cnp2c6L
	08vbPson04WvDAzA/0A712wPG40xpv9I6zHZeZ0SnZvb2hQVH+19xIRQY/MHjIOj
	XcO1Ob1bv8U3rY92+Mu5oxR5FEPGPuntGCem4j3d25wB4h1u+8paua1l/Z1mZQd2
	faCD8Ab5HqK9JUsq0rAHM+L6RDtmvzSc3wdkKoDbEOgl3E0qLkMMH8h366yoyvED
	YzQmtZAubIX3DOzTm4sQlYhBvz8ZRoJ8am5MO2G4337M/BJcVHAYbki9Vuk+Ml32
	0MPc0A==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eu4dkjhha-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 16 Jun 2026 18:54:39 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-8ccd3213beaso95377606d6.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 16 Jun 2026 11:54:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781636079; x=1782240879; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=fpOyMKeLDAw+3XSNLlU8yH505LS9kArFfaRTBNtkEvs=;
        b=VvYwH9SUHCA++qTEPOcn3t9wJqGLcvMiMycMqJZVI4PcUhAJ47SdPd8Pq7GIU3cXTZ
         NV+N9QIS5U+ngXt5rzaKmLrRVqFycjKmce8WgtyGE0cQVMabGj37Wnvd9pu9UCNrO042
         xg4BOKV8NHspFCcs4zWMsgnCIorQIfawVrn5OK83MQK2RiQXmNTPeGv948JnSKiD9dHh
         c+JiJ7Wy5oskkGJwHg2d9XqdRAzAS68KOj+TrzMJtkZ36pXg8Khw336xnjZb4qyTqEx/
         nSSE6P/MkLLdoxb4FbvfiVBsmFdwHQdhMSlYRxsnKUEPgsmj54B0y9OWIwJ94fbfCzp0
         1L1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781636079; x=1782240879;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fpOyMKeLDAw+3XSNLlU8yH505LS9kArFfaRTBNtkEvs=;
        b=jaIzeqyXXBjwNLhwTIItAG3wyFITsigIj4AZWHE7vQHRX9L0YOLsn+ouRMvI1JZzQp
         xWGr6RkR09+2GmdWJriepYSAMtNvtzpMsJMr9DtTs0Hriqmer5krF2RZLuQArj56YMJP
         6rA3jxIjAl03sgeUWHQHhxX4pUV2dIGNjyBhSDBiycaLQ8SIhDzSUSAadXy/d65e8eii
         L0zIhAiBdl3PKOuDA7iUF+E8Tu9uzeNa9RnwBciL5GmNU77Xrzs5+Pxiy6yRABqZYR9M
         a8Na3p71HORV7s+/sZc4Md4UY24rBJVfTPH1Th0I+r0V8Pjit7XPfJs9vWvnVRJqtnw/
         WRxg==
X-Forwarded-Encrypted: i=1; AFNElJ/jw6Z5+BUvQ+y+RNh5TnYqx56luPFHdpSrGNO3hEq+4SaxyKMZtEK4+VHgclFcvEqFCt3PYLProamsnh5i@vger.kernel.org
X-Gm-Message-State: AOJu0YxPfsQdFTtx23a4JkQS08bSHYnUCpvw9jz2viZqGh558MrypJvP
	JMJ7QSzJDcQe6PYiWm8ZkBdlTPU6FyqkINNvGpKOmn248VcW4+yu+DSQTBiyh+srBuF1xVj5rEt
	gvIuDX2u05PJ5U//M67PKVOy6+vT9Wz9oVvck8HXARA4FZfrVsbaXgZ0TXMIOd7THKCeQ
X-Gm-Gg: Acq92OGfp6trTUM5V89H4cAA74Ya+5dtf7icnqKlDiavN4cxzNbz8lQlFM46lxwfVwd
	pDznrn0XPgWHaPqxy/8H73BPgf0PRIjFysWPEHUiWFjkyoBoO/BzQQVHRuT5gYFj7rUiUK/7c8n
	X4o3wrtP5J8xsDklvTXHUD5q1sj7ha7U8okTW9uc/ulkTAYg4GYGpsM4RgwMpur1Wwr9YiEiJk1
	QI1UFsJm64B8rPrimJAo2A/CrPD/N5ytlrciJjB0eCiNN5gxaWSd/weurZK68tbwBV2Y8cXicmL
	EK9LrJbdGL/g1ohwpmmTROq+mJYwB4YkYnCmFvTmKk1Izc2g+3POVCiMWlVDkhHnutA5n8iJ4jx
	85mgHxSHvN8jvpcoES+c++3B24dmuJQCb8BY0ilLE44jc6BdO
X-Received: by 2002:a05:620a:2b94:b0:8cd:9033:1724 with SMTP id af79cd13be357-91db9495476mr32832985a.9.1781636078801;
        Tue, 16 Jun 2026 11:54:38 -0700 (PDT)
X-Received: by 2002:a05:620a:2b94:b0:8cd:9033:1724 with SMTP id af79cd13be357-91db9495476mr32826985a.9.1781636078155;
        Tue, 16 Jun 2026 11:54:38 -0700 (PDT)
Received: from [192.168.68.125] ([5.133.47.210])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-462236047c8sm1980892f8f.10.2026.06.16.11.54.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 16 Jun 2026 11:54:37 -0700 (PDT)
Message-ID: <5d820cad-255b-4f9d-bf3c-1c7ab9e53f5a@oss.qualcomm.com>
Date: Tue, 16 Jun 2026 19:54:36 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/4] ASoC: qcom: sc8280xp: add Ayaneo Pocket S2 card with
 special WSA channel mapping
To: Neil Armstrong <neil.armstrong@linaro.org>,
        Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: kancy2333@outlook.com, linux-sound@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org
References: <20260610-topic-sm8650-ayaneo-pocket-s2-wsa2-fix-v1-0-18bb19c5ca22@linaro.org>
 <20260610-topic-sm8650-ayaneo-pocket-s2-wsa2-fix-v1-2-18bb19c5ca22@linaro.org>
Content-Language: en-US
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
In-Reply-To: <20260610-topic-sm8650-ayaneo-pocket-s2-wsa2-fix-v1-2-18bb19c5ca22@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: _wKOKdeQ77jPk9xGMjForjYFc80gpDna
X-Proofpoint-ORIG-GUID: _wKOKdeQ77jPk9xGMjForjYFc80gpDna
X-Authority-Analysis: v=2.4 cv=Ibi3n2qa c=1 sm=1 tr=0 ts=6a319bef cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=igH7msBiZFST2wJAeAMA:9 a=QEXdDO2ut3YA:10
 a=OIgjcC2v60KrkQgK7BGD:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE2MDE5MyBTYWx0ZWRfXwdwhpUgvG/st
 X46CQhL+Xjgej+n200/mOTTus+y5SwZ7ys9uoC29MFEa19RH7lgOJ+fDxI8/HsqUldFNUDNtqDz
 l0vmztgz8nEns5bkvJOguELyc42Iv7VtOcAk84j62yCJ6JfXuwXFxC2mL58W8v+kpS/g6LpkR1v
 AIUs1dNpc0tjQzZJucxARUadKIpnlGY+92QyEnE9bZMjJz6uL2tXhszM6Wz2L6hhXvNHfC7Zx8s
 YoKCpHxj8jBakk+odL4aV7O8xb6BQ2hhpGisPPyNXUIZYuB/3Ppxj30qYvRvTdylE35Hmf8ldnU
 +s1nHgd+c90Rh3dUQMk1RHOhLJGdgh4pJIagi91q+cRZg2eCAoSxUP/Jqq1sh90WcxdoVThi0zC
 n5FsdyYEZgpQWbDS9rRO7f860ZJ+3ElBAMxlHTdRF2UlXjkK0jnVXXKUjwuhzwBq833o2toN65O
 idRibdnDIzWf1IQV5HQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE2MDE5MyBTYWx0ZWRfX6ucb0/f+igra
 5UWL41SKdxbMOO4gVnlTZpDNdgY+XkYaIoXhWXSxyptWUhUuCNT2++rq2CJSVbdzLwX9PONHRx1
 uJSVoocZgiCQ303Q1t0gClAI9Ip88GI=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-16_05,2026-06-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 clxscore=1015 priorityscore=1501 suspectscore=0
 lowpriorityscore=0 impostorscore=0 spamscore=0 malwarescore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606160193
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-113460-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:neil.armstrong@linaro.org,m:srini@kernel.org,m:lgirdwood@gmail.com,m:broonie@kernel.org,m:perex@perex.cz,m:tiwai@suse.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:kancy2333@outlook.com,m:linux-sound@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:devicetree@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[linaro.org,kernel.org,gmail.com,perex.cz,suse.com];
	FORGED_SENDER(0.00)[srinivas.kandagatla@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[16];
	FREEMAIL_CC(0.00)[outlook.com,vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,linaro.org:email,vger.kernel.org:from_smtp,qualcomm.com:dkim,qualcomm.com:email];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[srinivas.kandagatla@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: C1ECE694906



On 6/10/26 8:41 AM, Neil Armstrong wrote:
> The WSA Speakers are connected on the WSA2 interface, but the
> WSA and WSA2 links are handled as a single dai and DSP interface, so
> we need to specify the channel mapping of the Ayaneo Pocket S2 for the
> WSA dai in order to have functional playback and avoid DSP errors.
> 
> Let's add a special entry for the Ayaneo Pocket S2 adding a prepare
> callback in order to set the proper channel mapping.
> 
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> ---
lgtm,

Reviewed-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>

--srini
>  sound/soc/qcom/sc8280xp.c | 56 +++++++++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 56 insertions(+)
> 
> diff --git a/sound/soc/qcom/sc8280xp.c b/sound/soc/qcom/sc8280xp.c
> index 1f3afc6d015c..2f1688c9f317 100644
> --- a/sound/soc/qcom/sc8280xp.c
> +++ b/sound/soc/qcom/sc8280xp.c
> @@ -14,6 +14,7 @@
>  #include "qdsp6/q6afe.h"
>  #include "qdsp6/q6apm.h"
>  #include "qdsp6/q6prm.h"
> +#include "qdsp6/q6dsp-common.h"
>  #include "common.h"
>  #include "sdw.h"
>  
> @@ -49,6 +50,7 @@ struct snd_soc_common {
>  	bool codec_sysclk_set;
>  	bool mi2s_mclk_enable;
>  	bool mi2s_bclk_enable;
> +	int (*snd_prepare)(struct snd_pcm_substream *substream);
>  };
>  
>  struct sc8280xp_snd_data {
> @@ -193,12 +195,58 @@ static int sc8280xp_snd_hw_params(struct snd_pcm_substream *substream,
>  	return 0;
>  }
>  
> +/*
> + * WSA and WSA2 are handled as a single interface with the
> + * following channels mask:
> + *  __________________________________________________
> + *  | Bits  |     3    |     2    |   1     |     0   |
> + *  ---------------------------------------------------
> + *  | Line  | WSA2 Ch2 | WSA2 Ch1 | WSA Ch2 | WSA Ch1 |
> + *  ---------------------------------------------------
> + *
> + * The Ayaneo Pocket S2 speakers are connected only to
> + * the WSA2 interface and the WSA interface is not enabled.
> + *
> + * Set the channel mapping on the WSA2 channels only.
> + */
> +static const unsigned int ayaneo_ps2_channels_mapping[] = {
> +	0,			/* WSA Ch1 */
> +	0,			/* WSA Ch2 */
> +	PCM_CHANNEL_FL,		/* WSA2 Ch1 */
> +	PCM_CHANNEL_FR		/* WSA2 Ch2 */
> +};
> +
> +static int ayaneo_ps2_snd_prepare(struct snd_pcm_substream *substream)
> +{
> +	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
> +	struct snd_soc_dai *cpu_dai = snd_soc_rtd_to_cpu(rtd, 0);
> +	unsigned int channels = substream->runtime->channels;
> +
> +	if (cpu_dai->id != WSA_CODEC_DMA_RX_0)
> +		return 0;
> +
> +	if (channels != 2)
> +		return -EINVAL;
> +
> +	return snd_soc_dai_set_channel_map(cpu_dai, 0, NULL,
> +					   ARRAY_SIZE(ayaneo_ps2_channels_mapping),
> +					   ayaneo_ps2_channels_mapping);
> +}
> +
>  static int sc8280xp_snd_prepare(struct snd_pcm_substream *substream)
>  {
>  	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
>  	struct snd_soc_dai *cpu_dai = snd_soc_rtd_to_cpu(rtd, 0);
>  	struct sc8280xp_snd_data *data = snd_soc_card_get_drvdata(rtd->card);
>  
> +	if (data->snd_soc_common_priv->snd_prepare) {
> +		int ret;
> +
> +		ret = data->snd_soc_common_priv->snd_prepare(substream);
> +		if (ret)
> +			return ret;
> +	}
> +
>  	return qcom_snd_sdw_prepare(substream, &data->stream_prepared[cpu_dai->id]);
>  }
>  
> @@ -273,6 +321,13 @@ static int sc8280xp_platform_probe(struct platform_device *pdev)
>  	return devm_snd_soc_register_card(dev, card);
>  }
>  
> +static struct snd_soc_common ayaneo_ps2_priv_data = {
> +	.driver_name = "ayaneo-ps2",
> +	.dapm_widgets = sc8280xp_dapm_widgets,
> +	.num_dapm_widgets = ARRAY_SIZE(sc8280xp_dapm_widgets),
> +	.snd_prepare = ayaneo_ps2_snd_prepare,
> +};
> +
>  static struct snd_soc_common kaanapali_priv_data = {
>  	.driver_name = "kaanapali",
>  	.dapm_widgets = sc8280xp_dapm_widgets,
> @@ -341,6 +396,7 @@ static struct snd_soc_common sm8750_priv_data = {
>  };
>  
>  static const struct of_device_id snd_sc8280xp_dt_match[] = {
> +	{.compatible = "ayaneo,pocket-s2-sndcard", .data = &ayaneo_ps2_priv_data},
>  	{.compatible = "qcom,kaanapali-sndcard", .data = &kaanapali_priv_data},
>  	{.compatible = "qcom,qcm6490-idp-sndcard", .data = &qcm6490_priv_data},
>  	{.compatible = "qcom,qcs615-sndcard", .data = &qcs615_priv_data},
> 


