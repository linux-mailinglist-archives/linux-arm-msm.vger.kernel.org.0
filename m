Return-Path: <linux-arm-msm+bounces-112079-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id Yf3AFenZJ2pp3QIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-112079-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 09 Jun 2026 11:16:25 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id C020D65E318
	for <lists+linux-arm-msm@lfdr.de>; Tue, 09 Jun 2026 11:16:24 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=n6s7jDz5;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=dSau7YC6;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-112079-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-112079-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 521633016B46
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Jun 2026 09:15:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 35E2A3A6B77;
	Tue,  9 Jun 2026 09:15:18 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF8D03890F0
	for <linux-arm-msm@vger.kernel.org>; Tue,  9 Jun 2026 09:15:16 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780996518; cv=none; b=b63AfdvSl/V2G02waMoYPzwarhaOQ8K7HLSxwOSr4mqmEvXPoBZrrtwMn2vIDFYhI8xRnQ2W4M/a4rYEgVdM8urDCSG6+OpXghLD+/dc1z7MwSE+CVfGFgw5kcBtax9yFNAEX+kQEeizMKHr/r8jIvrpenT7j/sybZssQlL78zU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780996518; c=relaxed/simple;
	bh=2cVI7mOZk5wgdxeQHKFvOR4E4aQvBl/bXi6sFFQMiJY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=q3EHmAr7u1nYpauERpkvjsgtkCSDCipnlNaJf12e9tX5tMy1gRFAcJwxGlbH+G2p7bcEXzDBbwlAUg3eDpUh+KIVFLYTNeZ+fenNf4WGqPvtocjZdUoWcxY4oHE75btNbQjp74w5V2TYYMh4rnpl01o8aeqmMerahIDhqCwYmJ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=n6s7jDz5; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dSau7YC6; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6598Whsm2129869
	for <linux-arm-msm@vger.kernel.org>; Tue, 9 Jun 2026 09:15:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	RXkV4swW0PJks3vA3tB1AehUp80hU3W42XTBNT06mrM=; b=n6s7jDz5R69ldOfr
	4kC6tQXJcFjA1c2x6V8dBQ25PU0K7R6FRyFxxFdI7GJYl7HKa9xpw0mx4whuStP+
	JFEf+5lTai4WG1n75fHdqBKpUssomCBm5LZH4x2doWBvaxx1BxnNkIk5kfZLNqoP
	HV2KLjbsXf+jH8HSE8r+RGMZc15Hz3Qtd9DBtih+GbYcrEldT46MLj07H3654cdN
	agBX01gKK5v7yxh8eTTf4mRu34D8lXof5yOydcEJYnxPKEAMjLMMilcse3d8HkzX
	kT54CEZaSKcQvDi9GSuNXTswMDtIXhaEz/9Cqw6RHb5B9pwS0qy3kZhYHeVmoiO+
	eCe1lg==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4epfdt05tw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 09 Jun 2026 09:15:15 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-517647fbff1so17892591cf.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 09 Jun 2026 02:15:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780996515; x=1781601315; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=RXkV4swW0PJks3vA3tB1AehUp80hU3W42XTBNT06mrM=;
        b=dSau7YC6lb8d2B3IXFpRs48Gv94hr2kRRrfrSlf1FuEbTORju5TbqS0JG3IgI0cQkm
         1uqFb3KJuJvL4k2bl4dYaa10cHdFNpK1zol5HvBnSyCaNjdT3qGAZOouGQn5iGzCiBeH
         r2ByvxufZ/nFYp2HHrE/lotaLAihVsa4RjBjfizmnVEd4haBmHmzmnPLQzLWSqQ3drlL
         d7Q8UxTYn/1wRk2zaZDCitWngm9k9lScaYJRaTv8zRacYu2l5ty1riyMFGLFhpQtRFXz
         w5L9wbqvJpu+lLg3OEUtYbHgo3RvCYcDEsSBS+oCJTPKiOO+yEKhWYZ0FCtOrO97g8gj
         f7JQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780996515; x=1781601315;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RXkV4swW0PJks3vA3tB1AehUp80hU3W42XTBNT06mrM=;
        b=cNpi8DSv2Ssbn9X/PMM9+7O3KJ5x2I8XT68iKdOw/786bFk5ug7qlJUka8rXOEzqT1
         mGWrCGlfiqYG21rwVQdHS8pj47P27SOCE3nsq4+ViCA4osmMiPCZkILuPCnD9bscsdRp
         RUYmw6/ojA0B0g+i++EkCPr+4ZzZcC5qSSwUEb7mhMCahyfxCEFKoEyfwn3TYqmEXIdb
         Zy8yFZxl/arm3vTyeuKYUS7oGX9Ga1W0qg0L2Xk1zt3gNeXO8/TJi2vRZz1AekpFuqmO
         O+ZlF82JEJPxEBCrn1S2KwpHM0WCzPN2UYNck1Px3fuAKq5unwaX2l1O9vqVWwdZPaaJ
         nOwg==
X-Gm-Message-State: AOJu0YxENUOXgxBA2cEY7m2OUJRXa7ieKBCBmOzzBzsdS2vGEsaLHnju
	hmks+NkdlTnD94g13lbC/JMuIM8iDGcgSDlfaI5AXUMJ1eT47t7Frt/mhFlgiPEtsNJ8Mf4jlsA
	cudrOl1pmzoIQ2DoyI5yK00sBZU6Cd+kClFFBc+OdcP5rJ46lr3a33A/ngtwsgDRa5Tn/
X-Gm-Gg: Acq92OF6glTvFR140s7CEEepEEKt8XJMIfb4IYPunHz/mCgbtfl7X50VU0+KW8i4lun
	HImNVa1bDk4N5M5y3LXWrN+v1bNjgygi2TpnCxzIEOsjuTqZ+elkOQ4KjUOev3DDpH/HgUlt70l
	Dnnqy5am4mz3kcVkW4XXKzeXPCTAfRMLi7DY71zbYpkm9C0Qon18UE/Vml9wE34J4ONyQYIGLnA
	Aj/neUsXc45FEQnIgUbVyBcbQ7WPlH2a5o485XccrXfu3zJCe7UuPBeqYM9qYsmDwC2b4iwj/Zj
	4j6zrL2wQgaJ1LqJjUgIaZRQd2NiipwzZPImcrKb3j+6EstTQ29h43aZKmwsGMo2kaw8AF4qIKy
	dW3Y9+efc0Mp9OkQ1ppUtM8byWOxFOLlbu/Ithf95yj5Rrbu+CO8afzIS
X-Received: by 2002:a05:622a:228e:b0:517:8999:6c4b with SMTP id d75a77b69052e-51795bbf777mr160228061cf.7.1780996515228;
        Tue, 09 Jun 2026 02:15:15 -0700 (PDT)
X-Received: by 2002:a05:622a:228e:b0:517:8999:6c4b with SMTP id d75a77b69052e-51795bbf777mr160227661cf.7.1780996514622;
        Tue, 09 Jun 2026 02:15:14 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bf055307a35sm999893966b.52.2026.06.09.02.15.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 09 Jun 2026 02:15:13 -0700 (PDT)
Message-ID: <3a0890b2-f9c3-439b-a392-fd13e3da850d@oss.qualcomm.com>
Date: Tue, 9 Jun 2026 11:15:11 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 3/3] ASoC: qcom: lpass-va-macro: Add shikra compatible
To: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>,
        Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>
Cc: linux-arm-msm@vger.kernel.org, linux-sound@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260608172023.2965292-1-mohammad.rafi.shaik@oss.qualcomm.com>
 <20260608172023.2965292-4-mohammad.rafi.shaik@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260608172023.2965292-4-mohammad.rafi.shaik@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: vv6lNH82SO3nGvWyNbyHyetkud0FTrm2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA5MDA4NSBTYWx0ZWRfX/N0kAvAmd1Jx
 7oTHavZh90AktMhjIn3nJ17kDMilBcLV7V7lSarq9p785tc/cfqc0pk7QOHoJYmQ0rWW7EUfX8b
 U/IikkYJn34sTpwmUnzkR0kLKSUvIEmOu+DgUS3VOJ27/eOcRaBXNqX2rGKOKiMwT+E+QgJlIWN
 cw18VGqOsBlvvhpVh80k/BRTYkh1HizZAySI+s1IBxfU1YntIylvyNxOGkPUw2Qt/43xz9tl2lq
 zXPi93cbQLeCNsN5mpyMvgLr2ilzLQGeInU9RKkmdFwjV0LQat+JJd1r0yd03JNzemc9Y3HDB4b
 7x7UwVsEXMu0voIk2kYaf4KoUQz6WRIiaJ9dXCTnWCW3nA+uui4Y+Uc7HCpgu5aRxnDhvizgU8R
 gqmUJhs6JJbytNw0Fb79Vt8pMtCZV0IeoLPv/zcaDXhgTv2rnQ4c1nqXLbnzmS0OZGt1WxARgbc
 QgsOmJ+DY9n922OoMmw==
X-Proofpoint-GUID: vv6lNH82SO3nGvWyNbyHyetkud0FTrm2
X-Authority-Analysis: v=2.4 cv=doTrzVg4 c=1 sm=1 tr=0 ts=6a27d9a3 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=k1sLU3CPmF0_vJ11zi8A:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-09_02,2026-06-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 bulkscore=0 lowpriorityscore=0 priorityscore=1501
 impostorscore=0 phishscore=0 clxscore=1015 malwarescore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606090085
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-112079-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,gmail.com,perex.cz,suse.com];
	FORGED_RECIPIENTS(0.00)[m:mohammad.rafi.shaik@oss.qualcomm.com,m:srini@kernel.org,m:lgirdwood@gmail.com,m:broonie@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:perex@perex.cz,m:tiwai@suse.com,m:linux-arm-msm@vger.kernel.org,m:linux-sound@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
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
X-Rspamd-Queue-Id: C020D65E318

On 6/8/26 7:20 PM, Mohammad Rafi Shaik wrote:
> Add shikra specific VA macro data and register programming needed by
> the LPASS codec v4.0 implementation.
> 
> This adds a shikra regmap/default table covering the ADPT register
> range, wires new match data flags (bypass FS control and ADPT block
> presence), and enables the ADPT control programming path during TX
> decimator bring-up.
> 
> Signed-off-by: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
> ---

[...]

> +/* ADPT control registers - Shikra adaptive filter blocks */
> +#define CDC_VA_CDC_ADPT0_ADPT_CTRL		(0x0800)
> +#define CDC_VA_CDC_ADPT0_ADPT_GAIN_0		(0x0804)
> +#define CDC_VA_CDC_ADPT0_ADPT_GAIN_1		(0x0808)
> +#define CDC_VA_CDC_ADPT0_DH_FSM_CTRL		(0x080C)
> +#define CDC_VA_CDC_ADPT0_CUTOFF_FSM_CTRL_0	(0x0810)
> +#define CDC_VA_CDC_ADPT0_CUTOFF_FSM_CTRL_1	(0x0814)
> +#define CDC_VA_CDC_ADPT0_CUTOFF_FSM_CTRL_2	(0x0818)
> +#define CDC_VA_CDC_ADPT0_CUTOFF_FSM_CTRL_3	(0x081C)
> +#define CDC_VA_CDC_ADPT0_CUTOFF_FSM_CTRL_4	(0x0820)
> +#define CDC_VA_CDC_ADPT0_CUTOFF_FSM_CTRL_5	(0x0824)

Please use lowercase hex and drop the parentheses

[...]

> +static const struct reg_default va_shikra_defaults[] = {
> +	/* VA macro */
> +	{ CDC_VA_CLK_RST_CTRL_MCLK_CONTROL, 0x00},
> +	{ CDC_VA_CLK_RST_CTRL_FS_CNT_CONTROL, 0x00},
> +	{ CDC_VA_CLK_RST_CTRL_SWR_CONTROL, 0x00},

lowercase hex likewise, please keep a consistent space before the closing
curly bracket

[...]

> +		if (va->bypass_fs_control)
> +			regmap_update_bits(regmap, CDC_VA_CLK_RST_CTRL_FS_CNT_CONTROL,
> +					   0x80, 0x80);

regmap_set_bits()

[...]

>  	case SND_SOC_DAPM_POST_PMU:
> +		if (va->has_adpt_block)
> +			snd_soc_component_update_bits(comp, adapt_ctrl, 0xFF, 0x00);

Can you define these magic numbers?

[...]

> +	va->regmap = devm_regmap_init_mmio(dev, base,
> +					   data->regmap_config ? data->regmap_config
> +						: &va_regmap_config);

data->regmap_config ?: &va_regmap_config

Konrad

