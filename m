Return-Path: <linux-arm-msm+bounces-117870-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id +jCwMJ1KT2qTdgIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-117870-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 09 Jul 2026 09:15:41 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C0CC72D818
	for <lists+linux-arm-msm@lfdr.de>; Thu, 09 Jul 2026 09:15:41 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=cDkLfVkh;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=KkhFxX36;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-117870-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-117870-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6D1D6304756F
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Jul 2026 07:10:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E2B5F3D3D18;
	Thu,  9 Jul 2026 07:10:56 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C8EE39891E
	for <linux-arm-msm@vger.kernel.org>; Thu,  9 Jul 2026 07:10:55 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783581056; cv=none; b=c/5WjCbODYMFbaQJomdwMgb1P/sAVzcMZY7H6jDMdC99H6+SS0relabKndoiAwml9sXsyD+p8ZCyLowU9tf+oYACV0BPI2u1CR3f/gSNnQmJpNjiR8SJoclfmva8b4DRithzQXpSngUAYPncKnpTjsKP6oYHkmMfdRt+vOT+IUw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783581056; c=relaxed/simple;
	bh=wmtnvbryyjiJzl7SaPnq48PVp/YEJcRWLDkO8/ccom8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=L/yrmKVSzJ/gYDJBhHgChh/SPUXseRd0cZgg8SWWJ9z3Bywn46WOaqkZby9QrR6LivOk1vvcOoli2xdTCxnApzxCHZ+RcOTd9ZQx+AIfYVve/WtcKzrxq7ajlxDpKPZ25qRME7qp8x+7JFrdUc4uR4TGN6iAXtuCZykt4NveVes=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cDkLfVkh; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KkhFxX36; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6696l44T1021498
	for <linux-arm-msm@vger.kernel.org>; Thu, 9 Jul 2026 07:10:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	c4myeLAcS+dyKu9UkU4SatOyxmBrFEX2SbmQWD8dyg4=; b=cDkLfVkhs527DKJU
	O+QN/w2/USalMKEDoO2OvN7LhZkn4A08fvN3Aa4WLtaVLgeb9jzNu4HcB504Svp8
	ZeY0CecU3KyyDLGKdu2Sg9kawbJKIlpPIrJxjlvLcmyTOEk8rK8GDcFDVYi9Njmi
	RuAmWrGQQpare53+2AtVABajcnO3zCXSlbE4npwK26xPjbPDNPGRrFGggmY0sTys
	Ys6boID03q/P1TSN2J+ywReB3fY82v/k+ZWRT1bSBL2yCoCIxohpvn1SCOLNrnRn
	UbKZW+u7HifHmpLinegVYX+zxVL+in0fmZLzwaOdSNbicIffADcFLnfdWY4lsgpH
	QVzgPA==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fa6p3r30v-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 09 Jul 2026 07:10:54 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2cca3673560so10582235ad.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 09 Jul 2026 00:10:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783581054; x=1784185854; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=c4myeLAcS+dyKu9UkU4SatOyxmBrFEX2SbmQWD8dyg4=;
        b=KkhFxX36oyBAqMnLPC8ekaiZCvKW1Eumslxptaj35bz/x7n3Zo+fH/6nvu6uJ+hVkt
         FbpnA1/l48wAq/laR7VhXDIjUhljZJ9m4SBYRKpGrgKFoAhlHheVfWvwqNUZtQ7J5vqY
         LfAcxIZea4W6qmTZu1tOsMGK38DS2KBSkOokcq7GCrOsE3pokm94W+7V9L/DiKYIrtOT
         /aizszIFgx6o+tqFpUNaZCJJoxI2ZP+uKvCpo0qjvOu0gK+aMgpffIkOlckitbTMkRZY
         1cO5sSzskmM5Fh0cunZgJq/VHrKbVWcxD6AIAn324JqnV4IHAVp1sGTU5CmT3hanvsE3
         6mhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783581054; x=1784185854;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=c4myeLAcS+dyKu9UkU4SatOyxmBrFEX2SbmQWD8dyg4=;
        b=APwi+xKAFpcMysLGfXX/H1hdE7cnP71SbMKxwiSvOnjEhRYEs3v/MvowTxpzTQ6S03
         12c7QZZsWZjWu0YUL7VdwNom9uZVOkBhAHLs2kn/Vizyp16G09K33dIdTfRd790AePtI
         l6Avvsgmj9ay+XkI9bt4chS2Rwlvle20EkgZnPtKpux9mH+rUL7x4nG1S1Yo8kOJ6q49
         ixAzl4n5xxu+ECgfFHkp9wTFQuTba23QjCZWXMCvsytiEOS/ywKldJilSv8es29dkV+B
         qWQg4btV8jWmteC7v/Fc1kdKt+G3/Z8WoN+FhtCg/7qIgVUB8EDElFQoQQT40giIM9WG
         2mgQ==
X-Forwarded-Encrypted: i=1; AHgh+Ro4S7cj9lSdqJvwAde+GsHBgAKhlIwbdVOF33SLMDF+3Ru3TFHZbofv2Ao7XI8RSXqyFDInrYD3+5914bAL@vger.kernel.org
X-Gm-Message-State: AOJu0YyWr2adh84CdRWFBJBrOklWbtF6IvCVidqlgHaTQ3PnZzvIN7N1
	H1yfIKJtf2KClU2k6pee0P68SJ+wIypX+ESR+dqg4U8qA++sewFEiGgefFPk7jBqYKSzJHe39Yp
	sCVxPAHshGwdKExTvDW4rKJl70NFO+U5b7+1MC/npsY5J6jx/rDnYmJRMzgdsZAf7DxGE
X-Gm-Gg: AfdE7cmRDvoIdrRyIQKTQ6HwcPjFuQGN/rOXsJRXNm5Tmqr7kWmYoFo9fThhvwlcsj1
	uj6b/m3curtDg4bm7xYiZzzWC1ZXCP9Wu8qf3WCmcPh+mSLyktuuHIRaunTMRkChOkqHKtCaO0d
	VjJ64lSSZHKsYgw8hGN9ioTAWoDeATpIMwP47bklFTIVJy0wwF51rT+2Fyzb9KYPXszskYlivJW
	hunVlzDBPUv4fGD0Nk5DtnTnz7q35ahJn7woXxxJEpcBSCgzBM6meLXe+N2zjNBy+SafJKq1Tjv
	oiDUT/Z0aE01C/i6kj/dVZhu/sES7QX95lmAAR20ubV5wgMyFW7b3CL6YGOejx5Mwg4GQ+L5FzA
	BLBEctWTV8f7B3IDwuZPI2j0NHSE/T7Tvcyh38qXGtzRON5PLgQ==
X-Received: by 2002:a17:903:1b0f:b0:2ca:481:de45 with SMTP id d9443c01a7336-2ccea37370fmr71589405ad.6.1783581054353;
        Thu, 09 Jul 2026 00:10:54 -0700 (PDT)
X-Received: by 2002:a17:903:1b0f:b0:2ca:481:de45 with SMTP id d9443c01a7336-2ccea37370fmr71589135ad.6.1783581053936;
        Thu, 09 Jul 2026 00:10:53 -0700 (PDT)
Received: from [10.218.21.154] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ccc9d1e0c4sm39237515ad.49.2026.07.09.00.10.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Jul 2026 00:10:53 -0700 (PDT)
Message-ID: <355e8208-467c-47dd-8a2d-63de6a44abec@oss.qualcomm.com>
Date: Thu, 9 Jul 2026 12:40:47 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/3] ASoC: qcom: q6apm-lpass-dais: Add MI2S clock
 control
To: Mark Brown <broonie@kernel.org>
Cc: Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>, Krzysztof Kozlowski <krzk@kernel.org>,
        linux-arm-msm@vger.kernel.org, linux-sound@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>,
        Neil Armstrong <neil.armstrong@linaro.org>
References: <20260706132009.1496321-1-mohammad.rafi.shaik@oss.qualcomm.com>
 <20260706132009.1496321-3-mohammad.rafi.shaik@oss.qualcomm.com>
 <36d2cb00-81e1-47d4-a234-47feea11a351@sirena.org.uk>
Content-Language: en-US
From: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
In-Reply-To: <36d2cb00-81e1-47d4-a234-47feea11a351@sirena.org.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: 33Egyy_HwD3TX7GfORwRmP4Q6Av1nZRP
X-Proofpoint-GUID: 33Egyy_HwD3TX7GfORwRmP4Q6Av1nZRP
X-Authority-Analysis: v=2.4 cv=TPh1jVla c=1 sm=1 tr=0 ts=6a4f497f cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=Q1EBz3ZnqiQg-LZ14swA:9 a=QEXdDO2ut3YA:10 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA5MDA2NiBTYWx0ZWRfX4h2f7fOrl/Oc
 1eQf8zpaVb+1wOKEv/6laC9xeMVp4MheusDq3rkWiK+9mNlLFIIrMwEJHGnxHZsiVZhHN05F5NN
 Fw5YTRQagxvdGJsnBqaPr4ATi3P6gBw=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA5MDA2NiBTYWx0ZWRfXwG8zIs+2DDua
 LT577SahhsmHGjWvO+1r/qCKKhUmeEibZngCnHcZCcDHDOvpevsyxHRoUYEAZWdAPtMS5i/M5st
 Xy2amHenKPtqLRNI1YHv6eKyrcNXSuFX3aMYtOSauG7xBJNhcRzTiHtzvRIcckDkli/YBgHSA7F
 D5d9vJ6LmCskJzHNdcl4zyuaojmpwZ12b+mW1zTDlXy8sI2xChZdn4Ri9xxQIvZaTbDqTVGhkxx
 0M4Ae/x6wWhVYufm0RXfK9Pjv8Ilci9qLG3jUdWNRNX9eQDgiyWezPe/ujXBhkTwYOmW+laEf5+
 oGYg24Q+5UbPOzbAqvYVn17J+SKssiT8NC/JZ+EBf+ntcoioj5fCCvFu/iytr4HALcJF7qpfSm9
 zHeNSAhEZTmEnc8du7rmzuZKXkDaKI4by5e3m4b2uh7RPFXrI/V2u7ON69JCvoABqOQhKBBou5q
 bzTAPchoeMlIZSU+Mow==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-09_01,2026-07-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 adultscore=0 bulkscore=0 phishscore=0
 lowpriorityscore=0 clxscore=1015 malwarescore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607090066
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-117870-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER(0.00)[mohammad.rafi.shaik@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,perex.cz,suse.com,vger.kernel.org,oss.qualcomm.com,linaro.org];
	RCPT_COUNT_TWELVE(0.00)[15];
	FORGED_RECIPIENTS(0.00)[m:broonie@kernel.org,m:srini@kernel.org,m:lgirdwood@gmail.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:perex@perex.cz,m:tiwai@suse.com,m:krzk@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-sound@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:srinivas.kandagatla@oss.qualcomm.com,m:neil.armstrong@linaro.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mohammad.rafi.shaik@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 1C0CC72D818



On 7/6/2026 11:48 PM, Mark Brown wrote:
> On Mon, Jul 06, 2026 at 06:50:08PM +0530, Mohammad Rafi Shaik wrote:
>> Add support for MI2S clock control within q6apm-lpass DAIs, including
>> handling of MCLK, BCLK, and ECLK via the DAI .set_sysclk callback.
> 
>> +static int q6i2s_set_sysclk(struct snd_soc_dai *dai, int clk_id, unsigned int freq, int dir)
>> +{
> 
>> +		clk_set_rate(sysclk, freq);
>> +		ret = clk_prepare_enable(sysclk);
>> +		if (ret) {
>> +			dev_err(dai->dev, "Error, Unable to prepare (%d) sysclk\n", clk_id);
>> +			return ret;
>> +		}
> 
> clk_set_rate() can fail too.


Will fix it in the next revision.

Thanks & regards,
Rafi




