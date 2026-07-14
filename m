Return-Path: <linux-arm-msm+bounces-118988-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id QhHJI/j0VWqDwwAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-118988-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Jul 2026 10:36:08 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id DD228752768
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Jul 2026 10:36:07 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=lMkwNLts;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=J9mxLuGc;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-118988-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-118988-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id DE77831034EA
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Jul 2026 08:32:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 00D77409638;
	Tue, 14 Jul 2026 08:32:21 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A1853FA5EB
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Jul 2026 08:32:08 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784017941; cv=none; b=WUMrTyLyQH9jpx8l3Vk7IQz8RKxBduIcEemxtwF7boKSkf0yUhZ7FXXQ9CiUJWjAWGDRFclgd8yYlkkmBLAOcOlDLUjpGVwec9mli2jj1Te9RCyLKDP42z1ykYDcaZx2WU4EJ6pqzlegUzjdRQIX3hj6o/ksVj3WuEAayS7GB5M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784017941; c=relaxed/simple;
	bh=BNx/cHZjW+rS8Q0g1cL/miwCM3f1tAwoVC1y8S6rPC8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=B2lqF9N6yXbB1MM0gXFSD6bfhiwLX6JhLL1u8Cm3JdzDQW/mHe3NoBVZE52QKcZhONoCeJx40I6Dbraoac6svEvSPGxSuFNhwh/xNMBsynf2Js+SMOEJQJZYkxZMzuUxmGR78qUbxz7o2CkH1XNDythMRQV7hI0uhx7XnsjYtos=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lMkwNLts; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=J9mxLuGc; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66E6SZEF4005248
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Jul 2026 08:32:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	w75jmxwiFCr7ZyNjRYRnD2Hm0xsHXlUYAtWIPAxB/HM=; b=lMkwNLtsH1RglDoL
	P1957EJSlyfKvaozt+JP44IRJI5mL2BvDVIgpcgX5AskFCdvfn9OxCs4lwL1jwj1
	IGPB5GCNAynYZUvx932/BIca71ykrUbY3ENbOLPthTsyD9EPVqAIM1xNc8Ixan4X
	kfci8NnUFqt3znAzoX34dxrD4lQdOqQ/NHVfYvLdNy3+evbe/b1oYE1R+2OBA2Gb
	RZFtWIHyZQjDPJPD+DLW/HtMXDvPVBvIZRGBtCU5RL+U+sl7wwbch+ul3FcsQem/
	SCZfILDZkHeCENbalt7mujhh5qg65EEy24eJmGPWOzTLaApZZR8Kq74eitlO0z0E
	74lPsg==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fd44ctu5n-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Jul 2026 08:32:05 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-51c2af04aeeso9558031cf.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 14 Jul 2026 01:32:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784017924; x=1784622724; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=w75jmxwiFCr7ZyNjRYRnD2Hm0xsHXlUYAtWIPAxB/HM=;
        b=J9mxLuGcIu+/DeG7YSSVGm5bKqE+yj98R/Fj0xx/1mjufbfNNWSuAwXraNhKN2ykO4
         tvGoYPb86DiDF05Acffve7Q1+i5g/Huz6KclUa/gG5FkkSXQHQRhj3MuwkCeBdWQJpDQ
         JUiMpIvjahryasQjRija8KXsdj+NJcTYFMbEk32aSkox1Eujiho8O57qqg+oZ47bNOZO
         GrNUm2zVRd8COu8g0+slX864U9FwhsmCDLxcwhzgmRzH8uF4n7IVE3NW+K/Fp//OGmc7
         2joo7FKd+1XJYKvwDYnvvNtlLRBfP1ZbA6izfs7yF20rkkdhBHTF7l1e78fwzxrj06RE
         DL/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784017924; x=1784622724;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=w75jmxwiFCr7ZyNjRYRnD2Hm0xsHXlUYAtWIPAxB/HM=;
        b=c91U9adgMIjZvmvguzGRuIPrqqrIx+JfJMq49tTdmxGglGjo8iCi3EskT4D5A9/QTT
         HNysOwYJtlu7MjWxEBRRMzpsHJ8yoqgAAsZ+Aw8qHGxM29G8Kp0idYIVPvdx5B4EUauJ
         Ry/MGq1Vg6TxT8+PoNHiD+ueRocrQ/eEZaXxC1zAdZIh1XIMmw85qQWaL1X2j732DsxD
         SJJldJeUlBkf0NYu0dCYW2HP/ZE0tkkqfe7Bi5dzkKsBg2IVuNESYylU7T/OosYIwofe
         oJe1kYuSCUZ8rINL8i3de9yTLSj3PrpQ2NRqvFChSF0YNW6qL303A07RMODF4zwBl4Ka
         8B4g==
X-Forwarded-Encrypted: i=1; AHgh+RonoYouE/pHYVDJyjVlGXZvbyUR5kr75X9qfaRydXkn3KfDeWk1rOSiCC2OvW92FRG6PFA3lWisRROTNV15@vger.kernel.org
X-Gm-Message-State: AOJu0Yy3xk+WkLJXygOJ/8m1qwGYSmpybfs85fTorTusfLs7lcv+uDJd
	x39i8zqD2CQ7KLmn0zJ3nRed2pFZ/W/BcBLzo0GWAToaAks3SzZbq2pUghQ9jj3lH1QZ70xT0Eb
	cQA1u6ispDNtUCFHUSF6ex4KZtawU8V9VfEo/sBm4BkwXBB1wMB4nLIlbjJD2rB7QdyNM
X-Gm-Gg: AfdE7clg5zjVEEvEq5NXT3bAsTMrwesEicGvZM1yRRrD8exQ/dXaVb6t/QHxI/vWPvI
	x6kEVmEVc60XsKqgv60Y8KE+w5bbqocnE2F4rA76gqIQ4HpqVqj4mIJgVgYGhTqC8mGRVOKyNqc
	PYoKAqK4NMbH4H2dzcE/YPLRN/HuDYOXyDBprhZ2dFbwxtzwP3UB1+B27TBENgUbtgdlTljYxB4
	tLlAVSKoDfRWmrXVhSjXutcpry9u38xP6OICZm0WqucaOphT0P/eBIZ6XMfI9BGToqGM+ka69MJ
	t07qZmMfRemSj6ooLSVwTN8id3swVaTOJgGfoApP4XwO1Qe+0kGoqL5ImORQiHVU8PZhAOZ7lWA
	XVPztNpAGlWGeVJMv+1dEsDCeKdtLawZgDEXfWg==
X-Received: by 2002:a05:622a:1813:b0:51a:8691:4427 with SMTP id d75a77b69052e-51ca9eb3ad7mr167867921cf.0.1784017924451;
        Tue, 14 Jul 2026 01:32:04 -0700 (PDT)
X-Received: by 2002:a05:622a:1813:b0:51a:8691:4427 with SMTP id d75a77b69052e-51ca9eb3ad7mr167867781cf.0.1784017924003;
        Tue, 14 Jul 2026 01:32:04 -0700 (PDT)
Received: from [192.168.68.109] ([5.133.47.210])
        by smtp.googlemail.com with ESMTPSA id a640c23a62f3a-c15d3e54e83sm897380266b.42.2026.07.14.01.32.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 Jul 2026 01:32:03 -0700 (PDT)
Message-ID: <d104da3e-036f-4681-b9b1-dc3e44ea20fe@oss.qualcomm.com>
Date: Tue, 14 Jul 2026 09:32:02 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/7] ASoC: qcom: q6apm-lpass-dais: add TDM DAI
 operations
To: Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>,
        Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260712134110.3306763-1-prasad.kumpatla@oss.qualcomm.com>
 <20260712134110.3306763-3-prasad.kumpatla@oss.qualcomm.com>
Content-Language: en-US
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
In-Reply-To: <20260712134110.3306763-3-prasad.kumpatla@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: _1f5fJcjgPpZxKB-5S4hLp4T6qt_Umld
X-Proofpoint-ORIG-GUID: _1f5fJcjgPpZxKB-5S4hLp4T6qt_Umld
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE0MDA4OCBTYWx0ZWRfXzUryQ4LhkLKB
 deINWCVq3h5TeklKdB7EXvKerc3OGE+YmVi1VEEqBetmWeCUePmxFrcdcy7thedGfDqWM+68JV0
 2Vwu+OPNGiVq/U1d5q/5fEuj+LPfBzU=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE0MDA4OCBTYWx0ZWRfX821mVx9L+n4B
 QmqM46sak0z9sThbvFOo0PpgC0fQlSW6pPc5JcQgkAc4jcunEZIVcvKsRjTHC6g2MQ9s8T7Wx3v
 S/1JRyOtG1epNx931+M0+Da9LBndhdWCmm3z1bxQpo49p+bu4JC+ypE2C0SIJFx+hWBbjKP956q
 XQwIY2Nr/8bM7pBy/bPPD0sbynynS6frsgMyGh3FiVDAr95kCfpjaqSOSBfSYtQhQ+BZWS2Tamp
 6aDnrbBjNZXd7MAEXo1TUlrjgOEGKZn/pMkmAbv3k6YOIv/kXcBlOKqoBeS1toVHk/KOY3Ry7yC
 QcMY+OsxdlZNuOO1riZcD93PTbPxS51T28f+1H3x77AUKEQsGbGlh/sArGSO42wZSd4AZdiN+F1
 Kv2W4KOqIeBaBhBZ/YV8uUEV+7engCS4BmjZRk8MowSh8KbUK6JGWd3qArCKnsYtAVoJJXPNtiu
 W38tGLbUMN+vZ88mjvg==
X-Authority-Analysis: v=2.4 cv=P84KQCAu c=1 sm=1 tr=0 ts=6a55f405 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=VHJlbi77fKg4ZXaQ5xoA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-14_02,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 impostorscore=0 malwarescore=0
 lowpriorityscore=0 phishscore=0 spamscore=0 bulkscore=0 suspectscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607140088
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-118988-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,gmail.com,perex.cz,suse.com];
	FORGED_RECIPIENTS(0.00)[m:prasad.kumpatla@oss.qualcomm.com,m:srini@kernel.org,m:lgirdwood@gmail.com,m:broonie@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:perex@perex.cz,m:tiwai@suse.com,m:linux-sound@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[srinivas.kandagatla@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,vger.kernel.org:from_smtp,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[srinivas.kandagatla@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: DD228752768



On 7/12/26 2:41 PM, Prasad Kumpatla wrote:
> Add TDM DAI operations to q6apm-lpass-dais so AudioReach TDM
> backends can be configured through the normal ASoC hw_params and DAI
> setup flow.
> 
> The TDM set_tdm_slot() callback validates the supported slot width and
> slot count, stores the active slot mask in the AudioReach module
> configuration, and leaves existing DMA, I2S and HDMI paths unchanged.
> 
> Reuse the existing LPASS child-clock handling for TDM nodes as well as
> MI2S nodes, since TDM backends also request optional backend clocks
> through the machine driver set_sysclk() path.
> 
> Signed-off-by: Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>
> ---
>  sound/soc/qcom/qdsp6/q6apm-lpass-dais.c | 57 +++++++++++++++++++++++++
>  1 file changed, 57 insertions(+)
> 
> diff --git a/sound/soc/qcom/qdsp6/q6apm-lpass-dais.c b/sound/soc/qcom/qdsp6/q6apm-lpass-dais.c
> index 5743586ff..672189625 100644
> --- a/sound/soc/qcom/qdsp6/q6apm-lpass-dais.c
> +++ b/sound/soc/qcom/qdsp6/q6apm-lpass-dais.c
> @@ -372,6 +372,50 @@ static int q6i2s_set_fmt(struct snd_soc_dai *dai, unsigned int fmt)
>  	return 0;
>  }
>  
> +static int q6tdm_set_tdm_slot(struct snd_soc_dai *dai, unsigned int tx_mask,
> +			      unsigned int rx_mask, int slots, int slot_width)
> +{
> +	struct q6apm_lpass_dai_data *dai_data = dev_get_drvdata(dai->dev);
> +	struct audioreach_module_config *cfg = &dai_data->module_config[dai->id];
> +	unsigned int cap_mask;
> +
> +	if (slot_width != 16 && slot_width != 32) {
> +		dev_err(dai->dev, "%s: invalid slot_width %d\n", __func__, slot_width);
> +		return -EINVAL;
> +	}
> +
> +	switch (slots) {
> +	case 2:
> +		cap_mask = 0x03;
> +		break;
> +	case 4:
> +		cap_mask = 0x0f;
> +		break;
> +	case 8:
> +		cap_mask = 0xff;
> +		break;
> +	case 16:
> +		cap_mask = 0xffff;
> +		break;

switch (slots) {
	case 2:
	case 4:
	case 8:
	case 16:
		cap_mask = GENMASK(slots - 1, 0);
		break;
?
> +	default:
> +		dev_err(dai->dev, "%s: invalid slots %d\n", __func__, slots);
> +		return -EINVAL;
> +	}
> +
> +	switch (dai->id) {
> +	case PRIMARY_TDM_RX_0 ... QUINARY_TDM_TX_7:
> +		cfg->nslots_per_frame = slots;
> +		cfg->slot_width = slot_width;
> +		cfg->slot_mask = ((dai->id & 0x1) ? tx_mask : rx_mask) & cap_mask;

Should we validate the tx/rx mask here if its with in cap_mask range?
> +		break;
> +	default:
> +		dev_err(dai->dev, "%s: invalid dai id 0x%x\n", __func__, dai->id);
> +		return -EINVAL;
> +	}
> +
> +	return 0;
> +}
> +
>  static const struct snd_soc_dai_ops q6dma_ops = {
>  	.prepare	= q6apm_lpass_dai_prepare,
>  	.startup	= q6apm_lpass_dai_startup,
> @@ -401,6 +445,17 @@ static const struct snd_soc_dai_ops q6hdmi_ops = {
>  	.trigger	= q6apm_lpass_dai_trigger,
>  };
>  
> +static const struct snd_soc_dai_ops q6tdm_ops = {
> +	.prepare	= q6apm_lpass_dai_prepare,
> +	.startup	= q6apm_lpass_dai_startup,
> +	.shutdown	= q6i2s_lpass_dai_shutdown,
> +	.set_tdm_slot	= q6tdm_set_tdm_slot,
> +	.hw_params	= q6dma_hw_params,
> +	.set_fmt	= q6i2s_set_fmt,
> +	.set_sysclk	= q6i2s_set_sysclk,
> +	.trigger	= q6apm_lpass_dai_trigger,
> +};
> +
>  static const struct snd_soc_component_driver q6apm_lpass_dai_component = {
>  	.name = "q6apm-be-dai-component",
>  	.of_xlate_dai_name = q6dsp_audio_ports_of_xlate_dai_name,
> @@ -429,6 +484,7 @@ static int of_q6apm_parse_dai_data(struct device *dev,
>  		case PRIMARY_MI2S_RX ... QUATERNARY_MI2S_TX:
>  		case QUINARY_MI2S_RX ... QUINARY_MI2S_TX:
>  		case SENARY_MI2S_RX ... SENARY_MI2S_TX:
> +		case PRIMARY_TDM_RX_0 ... QUINARY_TDM_TX_7:
>  			priv = &data->priv[id];
>  			priv->mclk = of_clk_get_by_name(node, "mclk");
>  			if (IS_ERR(priv->mclk)) {
> @@ -490,6 +546,7 @@ static int q6apm_lpass_dai_dev_probe(struct platform_device *pdev)
>  	cfg.q6i2s_ops = &q6i2s_ops;
>  	cfg.q6dma_ops = &q6dma_ops;
>  	cfg.q6hdmi_ops = &q6hdmi_ops;
> +	cfg.q6tdm_ops = &q6tdm_ops;
>  	dais = q6dsp_audio_ports_set_config(dev, &cfg, &num_dais);
>  
>  	ret = devm_snd_soc_register_component(dev, &q6apm_lpass_dai_component, dais, num_dais);


