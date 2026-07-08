Return-Path: <linux-arm-msm+bounces-117640-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id UFATGSBRTmqSKgIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-117640-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 08 Jul 2026 15:31:12 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id DF441726CFB
	for <lists+linux-arm-msm@lfdr.de>; Wed, 08 Jul 2026 15:31:11 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=P+Gsu0hc;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=Os0OS9Sw;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-117640-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-117640-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 8F8C53020EED
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Jul 2026 13:30:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3956C3655CD;
	Wed,  8 Jul 2026 13:30:24 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB5C5363087
	for <linux-arm-msm@vger.kernel.org>; Wed,  8 Jul 2026 13:30:21 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783517424; cv=none; b=lPFq5YonoMB1EtYGiGtKWUtGKOetafz/azzutwyWubmwQJZojOKJcG563fSSF9C66BRTvYa3mPzJFr6MO9Lwj6mndgoL564QHhCN30Xdxv1U48gC59fw7ylpkOyPEXfazpxEjnrGs5IFga8zGAIRol8NHNaQ0MwOi2KY+f479N4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783517424; c=relaxed/simple;
	bh=cFePTmMUkT3lRt1laLkIkh/dM/PSoWk01lu7/mhTCWI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=D1QZWm3dZu9OByXq60NlF/u17DYQwmwP8XH0TuJSaStKxyYlp56D3yGTMXpP0BZAcPhe7SKf1/Y7z6S2hX9K3R1D16dKPGIHwOFnDhuHiTNDnzaLiHfSrcVHJiIfb2tCfgu1eO0NbROR6WfXfsQ2S99iUSDC5DyG/UFWafl9dvg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=P+Gsu0hc; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Os0OS9Sw; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 668D7pHI2677922
	for <linux-arm-msm@vger.kernel.org>; Wed, 8 Jul 2026 13:30:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	9fhac78ZhHdttAnI46BHlBR95LUlCDDTOTw+svQZV90=; b=P+Gsu0hcg9253m10
	riYq1HmnVAjmOR3v2F+KeGp3NNc4yzwGs8koHlQ4SCth+BDB+BYf1b+1WaLzFZjI
	eZz5Ak2iZT0lnzVSB62WE7u6s+S/o7i6Felhyfphx0CiAl8WMEl+KrCwytlcb0wF
	8SmewvAciK/KVOqVEvj5iRGxwxZxEDoKCF2qUuarweb3kdJDy22lzd3F/HHTAdN8
	lY+IuG7GG3Fer3t0y3XPu2AbTp0bSQ/wuA1AiTruD1jqtQqvAL2FRnyScPd6g29d
	+akzyaHl5RYBXsj6KT68oaTi/X9t7jbuDak2u1k/l8U+gptpGIffeHeIQZkqBJWR
	IjWZCQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f9q5s82sf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 08 Jul 2026 13:30:21 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-92e63df032bso176179985a.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 08 Jul 2026 06:30:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783517420; x=1784122220; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=9fhac78ZhHdttAnI46BHlBR95LUlCDDTOTw+svQZV90=;
        b=Os0OS9Sw0lHngysAodBfsfcFHKANvlPXJmC8Rug8ZNLy4GYBMb9dfk5WSkeDjONnkN
         Wpy86TdifRBXPZ6co/nfjpNzBhsYxVgaDPRLEgfh3nNYFSBBHoBs/NFervFuNVUnFh2a
         xlgR/pXMEtervn2G/zXcHN+1zmT3N7CHRx+20DeQWRcsqROgbjH8DkbiZ1HFA2rn4P48
         olB/L13GbyGZWQ9R4rC69laPUKm8317bgLUqk/Jd9w9U2SG1gTDmkxztlNz6PDRQ6mwi
         0hglTIN5GBixh4icHaRV9wZQNoaVPK/M5mzEHxtEMSdss58Facrcs70RquMe2t/UAeS/
         kBiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783517420; x=1784122220;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9fhac78ZhHdttAnI46BHlBR95LUlCDDTOTw+svQZV90=;
        b=Zwh+WyEYjRNDXxQSWht9//2ttN4Lr91jYRTLQeIreENEDpH7n6/BF0pUyeDa29Yara
         QTJr/iSF5obUZwpxI8s4JWsYzVVoNcMS+H2nZODVD1Rb+R76WxwFZRSS4d9OgSLYA7fm
         EPJhxVjrngLc0XQKZ8jlkBtTHuMGTF8cFBbHjI7NLQDj5D49wNzvBI3aLEXKuk/CnYLl
         d2GJpHEHvNzOD+ZAClmMSY6wFy9UlZdNqUzGxUyEIhRdLKbGESu+fRVedgqyruLKapSA
         QmM+edQBTZmPRh3jKfIp4shoyI5hFXa1ADg4/SI38CaJGiQcrzpLcCpnszNqQYRKTjNh
         ZdNQ==
X-Forwarded-Encrypted: i=1; AHgh+Rpj1D5z1AJaifQD0ee+HIuxVPGRg193F31/WK0E9O8UQ1AdzJQ3C7cUOqUkThp+fEulTgGSTgP6vuCiTHiX@vger.kernel.org
X-Gm-Message-State: AOJu0Yxz0URRFbWqI98MBjG5bZ7nHw5f444QTzERrcv2w7Obb27FDbUD
	8OUR+ozvCRPKp5MBm6IORjO4/EedIyg90wd/idHtcYxMrWPybki4lZUYJQ86A4UC+fZkvVUkutI
	T8i4Ompgcx4bsKROkfCwWGWPZLaRUmLfBnAvh9TRiQGAa2Q2EXDRt8smgA/bW6sK9EGDV
X-Gm-Gg: AfdE7cmZ8WNxEXNS9z7kbOe2FS8QcwC9keQCCTTuPTPSDtXCYVE5jUl9RgGhJxmAcot
	+rcZtoLP7lCEsSxqqY8znTzIs1ivqZScGE52xHimXmmKv3+qnE+mF2nanFoES5IF4EKGiSGaFL5
	cIff8Mk9NQqLiQTMYFf7KDsxYpLY/6jGbr+V3pTyfszoV4gxVNMoQLTt6Pki3A7lfQsnu0izjNb
	mGNR1ak+h3VtpPUJMqgklYKPz8EdanJ8+W+o9aBpsjdQKvdRnQ47TUjXVYMeWFmO80Qs7ACaXkG
	verek4NHKFnbejuC/h3gUnlhbQuRNZrVatSmk1yl+8ocpRg6LG8Tgf0poEpw3f+yDTWSgkEQmWS
	GCAtPm78QmGBkV/Q7p2mmEQltgeBqA0Nj9BUl7n3nAZmBIJbIuEQxpTRSPQ==
X-Received: by 2002:ac8:7e96:0:b0:51b:fdc0:ddee with SMTP id d75a77b69052e-51c7a7722b1mr72523171cf.30.1783517419703;
        Wed, 08 Jul 2026 06:30:19 -0700 (PDT)
X-Received: by 2002:ac8:7e96:0:b0:51b:fdc0:ddee with SMTP id d75a77b69052e-51c7a7722b1mr72522571cf.30.1783517419060;
        Wed, 08 Jul 2026 06:30:19 -0700 (PDT)
Received: from [172.20.10.5] (82-132-212-199.dab.02.net. [82.132.212.199])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-493e0f40d50sm161991545e9.5.2026.07.08.06.30.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Jul 2026 06:30:18 -0700 (PDT)
Message-ID: <2fbf3481-0f46-4942-8273-7f6d827c2b15@oss.qualcomm.com>
Date: Wed, 8 Jul 2026 14:30:16 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] arm64: dts: qcom: monaco-arduino-monza: Add overlay
 for Waveshare WM8960 Audio HAT
To: Loic Poulain <loic.poulain@oss.qualcomm.com>
Cc: andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260707163703.233405-1-srinivas.kandagatla@oss.qualcomm.com>
 <20260707163703.233405-4-srinivas.kandagatla@oss.qualcomm.com>
 <CAFEp6-1VVmF-hrpPf34bFiYGOaa2HU9Pcvupt14MCjvW2-4VAA@mail.gmail.com>
Content-Language: en-US
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
In-Reply-To: <CAFEp6-1VVmF-hrpPf34bFiYGOaa2HU9Pcvupt14MCjvW2-4VAA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA4MDEzMiBTYWx0ZWRfX041qgPF+BTiL
 xQMp/TeAIfZVw73R5Z7L7gNHQTpvp1v2mswKCFIJyS9AL6K8BKv8ddlPgpD2hnBuvylZ6IetYLm
 XyeQAsK937hvrirGssvJQ3N1WYiGUu2aJ7yLEAjPmoqy254Y+YMymdalus6dTk7TXUeP57YgaNT
 F1RjyJUaYvtt/zXQzqKVDLq85qPrZTT665Mo2iGmP1JT7oaDqucjnViTQIGQ4aVgMtqIxuBzuR/
 1eAsduOqby7twp6/jR/wYRJtXhFOiI3cS1xfhvd1H8ehQjtkr7UJDRWS4UccHoGqDY42uoDlodJ
 6zdP4QkNQn+q4+lAVRlIsHzEtYrzBysCHUK0xIBFuYa0rxstflddJSOXvaAKtoYFgxf3QikKaE5
 I/48zHSwZrVMiAxaSJEXqrbrfQ8JpjLKWhCz+qGn7SVZ2ZuYRgFCMvve01AJA5f24R4YcBFIQWs
 M2BtntHq8ueKKpvVg7Q==
X-Proofpoint-ORIG-GUID: rH-usjFzDUcAFkVpHtbKBa38MIedVhzw
X-Authority-Analysis: v=2.4 cv=NfTWEWD4 c=1 sm=1 tr=0 ts=6a4e50ed cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=+oHb8pcatGVxCjskUc2jPA==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=ME7h6NJbtsD6biSAtVUA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA4MDEzMiBTYWx0ZWRfX2GF/bN4lpqQT
 /1P3BDsge6xnY3fhlX3/wnxPtlBJ5gXNxoWLnhpQ6TO3vx6J75LGXGT19Ql7rS5/bs3TxvgY49G
 vJ27ogdVu48TzHksa/auwtc/+MhUEH8=
X-Proofpoint-GUID: rH-usjFzDUcAFkVpHtbKBa38MIedVhzw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-08_02,2026-07-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0 phishscore=0 bulkscore=0 clxscore=1015
 priorityscore=1501 impostorscore=0 malwarescore=0 adultscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607080132
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-117640-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:loic.poulain@oss.qualcomm.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[srinivas.kandagatla@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[srinivas.kandagatla@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: DF441726CFB

On 7/8/26 1:33 PM, Loic Poulain wrote:
> Hi Srini,
> 
> On Tue, Jul 7, 2026 at 6:37 PM Srinivas Kandagatla
> <srinivas.kandagatla@oss.qualcomm.com> wrote:
>>
>> Add a DT overlay for the Waveshare WM8960 Audio HAT connected to the
>> 40-pin JHAT connector. The overlay adds the WM8960 fixed MCLK clock,
>> the WM8960 codec on I2C0, and the corresponding I2S1 playback and
>> capture DAI links to the sound card.
> 
> Looks like this hat also features a button on P11 (gpio85)?
> So it would be good to extend gpio-keys in that overlay.
> In that context, maybe assigning KEY_NEXTSONG or KEY_PLAYPAUSE?
> 

good point, We could add this, interestingly Rpi does nothing with this.
Will add this in v2 as PLAYPAUSE button.


--srini
> 
>>
>> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
>> ---
>>  arch/arm64/boot/dts/qcom/Makefile             |   4 +
>>  ...uino-monza-waveshare-wm8960-audio-hat.dtso | 100 ++++++++++++++++++
>>  2 files changed, 104 insertions(+)
>>  create mode 100644 arch/arm64/boot/dts/qcom/monaco-arduino-monza-waveshare-wm8960-audio-hat.dtso
>>
>> diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
>> index 5a1c56cf98f6..27cce61893ad 100644
>> --- a/arch/arm64/boot/dts/qcom/Makefile
>> +++ b/arch/arm64/boot/dts/qcom/Makefile
>> @@ -59,6 +59,10 @@ dtb-$(CONFIG_ARCH_QCOM)      += mahua-crd.dtb
>>  dtb-$(CONFIG_ARCH_QCOM)        += milos-fairphone-fp6.dtb
>>  dtb-$(CONFIG_ARCH_QCOM)        += milos-nothing-asteroids.dtb
>>  dtb-$(CONFIG_ARCH_QCOM)        += monaco-arduino-monza.dtb
>> +
>> +monaco-arduino-monza-waveshare-wm8960-audio-hat-dtbs   := monaco-arduino-monza.dtb monaco-arduino-monza-waveshare-wm8960-audio-hat.dtbo
>> +dtb-$(CONFIG_ARCH_QCOM)        += monaco-arduino-monza-waveshare-wm8960-audio-hat.dtb
>> +
>>  dtb-$(CONFIG_ARCH_QCOM)        += monaco-evk.dtb
>>
>>  monaco-evk-camera-imx577-dtbs  := monaco-evk.dtb monaco-evk-camera-imx577.dtbo
>> diff --git a/arch/arm64/boot/dts/qcom/monaco-arduino-monza-waveshare-wm8960-audio-hat.dtso b/arch/arm64/boot/dts/qcom/monaco-arduino-monza-waveshare-wm8960-audio-hat.dtso
>> new file mode 100644
>> index 000000000000..cf7b6a220bab
>> --- /dev/null
>> +++ b/arch/arm64/boot/dts/qcom/monaco-arduino-monza-waveshare-wm8960-audio-hat.dtso
>> @@ -0,0 +1,100 @@
>> +// SPDX-License-Identifier: BSD-3-Clause
>> +/*
>> + * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
>> + *
>> + * Device tree overlay for the Waveshare WM8960 Audio HAT connected to the
>> + * Arduino Monza 40-pin JHAT connector.
>> + */
>> +
>> +/dts-v1/;
>> +/plugin/;
>> +
>> +#include <dt-bindings/sound/qcom,q6dsp-lpass-ports.h>
>> +
>> +&{/} {
>> +       /* on board fixed crystal */
>> +       wm8960_mclk: wm8960-mclk {
>> +               compatible = "fixed-clock";
>> +               clock-frequency = <12288000>;
>> +               #clock-cells = <0>;
>> +       };
>> +};
>> +
>> +&i2c0 {
>> +       clock-frequency = <400000>;
>> +       #address-cells = <1>;
>> +       #size-cells = <0>;
>> +
>> +       wm8960: audio-codec@1a {
>> +               compatible = "wlf,wm8960";
>> +               reg = <0x1a>;
>> +               clocks = <&wm8960_mclk>;
>> +               clock-names = "mclk";
>> +               AVDD-supply = <&vdc_3v3>;
>> +               SPKVDD1-supply = <&vdc_5v>;
>> +               SPKVDD2-supply = <&vdc_5v>;
>> +               #sound-dai-cells = <0>;
>> +       };
>> +};
>> +
>> +&lpass_tlmm {
>> +       lpi_i2s1_active: lpi-i2s1-active-state {
>> +               clk-pins {
>> +                       pins = "gpio6";
>> +                       function = "i2s1_clk";
>> +                       drive-strength = <8>;
>> +                       bias-disable;
>> +               };
>> +
>> +               ws-pins {
>> +                       pins = "gpio7";
>> +                       function = "i2s1_ws";
>> +                       drive-strength = <8>;
>> +                       bias-disable;
>> +               };
>> +
>> +               data-pins {
>> +                       pins = "gpio8", "gpio9";
>> +                       function = "i2s1_data";
>> +                       drive-strength = <8>;
>> +                       bias-disable;
>> +               };
>> +       };
>> +};
>> +
>> +&sound {
>> +       pinctrl-0 = <&quad_mi2s_active>, <&quad_mclk_active>, <&lpi_i2s4_active>,
>> +                   <&lpi_i2s1_active>;
>> +
>> +       i2s1-playback-dai-link {
>> +               link-name = "JHAT Analog Playback";
>> +
>> +               codec {
>> +                       sound-dai = <&wm8960>;
>> +               };
>> +
>> +               cpu {
>> +                       sound-dai = <&q6apmbedai LPI_MI2S_RX_1>;
>> +               };
>> +
>> +               platform {
>> +                       sound-dai = <&q6apm>;
>> +               };
>> +       };
>> +
>> +       i2s1-capture-dai-link {
>> +               link-name = "JHAT Analog Capture";
>> +
>> +               codec {
>> +                       sound-dai = <&wm8960>;
>> +               };
>> +
>> +               cpu {
>> +                       sound-dai = <&q6apmbedai LPI_MI2S_TX_1>;
>> +               };
>> +
>> +               platform {
>> +                       sound-dai = <&q6apm>;
>> +               };
>> +       };
>> +};
>> --
>> 2.53.0
>>


