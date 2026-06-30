Return-Path: <linux-arm-msm+bounces-115399-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id CoqII9KxQ2oufQoAu9opvQ
	(envelope-from <linux-arm-msm+bounces-115399-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Jun 2026 14:08:50 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D0EF6E3FE4
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Jun 2026 14:08:49 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=J3aionmF;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=XwGVqTx9;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-115399-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c15:e001:75::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-115399-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 246233024EDF
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Jun 2026 12:02:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CFA6D409624;
	Tue, 30 Jun 2026 12:01:58 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2AB040803F
	for <linux-arm-msm@vger.kernel.org>; Tue, 30 Jun 2026 12:01:57 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782820918; cv=none; b=njEe1mDvKMGuRQBhhxIu7IlbGBUunqWZpvm2Aho2KhzU0KmirvDKdB08XHL9Zb8v4McYAGP4KCl+HQJDOxTjoIcowex6I3Lzc4y8pok5cuTPWBz1v2FLv84+ZSVXmbdrdcl/yU8NR2Bv8RcGwryGzE2/2U/Pvl2OQI1FUESMgnE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782820918; c=relaxed/simple;
	bh=jB8ORTPN/Ir/rdNJDngB2P7qDRWmgC5iuBxccmgQJpU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=E9FtEaebfyBuLuol9OZX+TXNmTo9q1Hhjo0piYhJiCSJTuUkMdtHy5SzRHe3E21Sj5k4BMVObKvN7yjCtO/es9V1jzx9F5IC5RyU9XMZg5raxl2U96OhftLq+BuUBRqX1t7gxPvY9E92tysPV5AWxWk1QaHwYgDu3Z5trrgSvws=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=J3aionmF; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XwGVqTx9; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65U9mn461541495
	for <linux-arm-msm@vger.kernel.org>; Tue, 30 Jun 2026 12:01:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ghIqzt2swN22I+Ok/FxKdmKOxX4q+2Bz9NLExdF6R7k=; b=J3aionmFiPLg5GU6
	Sv+MSK0KCIjz4E0L5/BagG6QrzTryp9CS6HWYvJ+Nc8rCdONGpes/ANva9n8rvhD
	N+VHMh+8VnebliA+jFtYhVY9KTdapI3zygRUJwd0RqwLJ7Oi7D1aXf+SI9RhehtF
	LsKt/Q0Y0KQjvO1+TK/ObRJDQCfUaDXRZoB1l17r9C4iuRUvOcNP8WxDuSD/SKXI
	MfU3BrQNfbgaNjRJrj+kqipfDsxtpagxrS644oG9tPCIgDkKN4DcdIzmlFBdYhNX
	V10f2t+yahF/Kkd1Y6gHUyEVmdeVeSJo5L1pNsSgGqAQ8LsZa+fFNOeso3AjkpR5
	5eULPA==
Received: from mail-vs1-f70.google.com (mail-vs1-f70.google.com [209.85.217.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f44wp2acq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 30 Jun 2026 12:01:56 +0000 (GMT)
Received: by mail-vs1-f70.google.com with SMTP id ada2fe7eead31-7359eba94f2so175620137.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 30 Jun 2026 05:01:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782820915; x=1783425715; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ghIqzt2swN22I+Ok/FxKdmKOxX4q+2Bz9NLExdF6R7k=;
        b=XwGVqTx9Bn4ogr30mOi7yOO5smyVUc7wd5RI6ii0aKBZIhGKjX7hqhRi2dK72M9aZ0
         JgnSk/YW8kYSQRT7Fd7esddUTwewh0AyTzLizbzwYi33tov8NL1cRkUjlrdDQXDtkj38
         ft1GJFUhzA6SWNcQIKf+9fMLF9SvmrdczpZmk6xuuNJs4VGaQ13qWRirwxuFoheCL3+Y
         Nalc9uf1axLKyJwEolBz075bDzwUmfz8y1uCimU6/h4/J49cRk9OI9W3JIONDyCFONYg
         ZwSSEKW0Et+xQYjyAcdqvRtPjRoF02P2hjgDOhAO9Zh3xFjisY02zGvgILbMmbmpvGQp
         HFkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782820915; x=1783425715;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ghIqzt2swN22I+Ok/FxKdmKOxX4q+2Bz9NLExdF6R7k=;
        b=gck1HApSmFnhMTAG7hOq7J6jWhBW0dk7+mvymPALpydKC/tcf4rOwMs2oIFcMYKFFV
         WszL9LZfm+Wf+Ut/VW9xnql8lZRyXcS7g3mXjOkcPAeMlAIvAs4yuPg3RyHSiuSwMeLB
         ppL9XCHV+0AFa5bNau7VxOIhCFkWitgrjf0VVSAWHbXpW3Hi98SlTAS+0P6a6KCzTtmJ
         enSu1NVKv8EoApzzNeXEIxw4inOhL8XJa/3MZofxvg5j4u2JikjjV6uNGgW20vtWboF6
         PAtMXDAkCMbqfvCF1i/1lVF+V02VadMrrCDFLim4lo3+QV6u0wGy/CENLVbm1X9vHN6J
         CEAw==
X-Gm-Message-State: AOJu0YyP8yXLYSTywKOtbsVSUythCUAZ3g3ldciaKRsGfs3rdE5njCxi
	VdrMXk95xPdcHOgJcEEwlw3VnK8DgTEyKUEhnqWbvIf/Fw/WlXMyPuVeSuy8tGk1Zqyl9ufpVhl
	e05QfxxOD5s84b+jHjf3YvxKAz86j/esCP17BgOiw24NV3KrgNUpQAkEsi5w2AiB1YjNTpws6e0
	+e
X-Gm-Gg: AfdE7ckIFWyiIZ9OTez8asCuv3ELnlwKPDdLL3EMc/peudnQAyuu8dC/DCR1bsLxyXJ
	+YrLWPcv+ByURfzPEHMTtBONZqm96MbtG1S4jfFyuK8ma6ZOzej1mRshXfcquEejCPbQ3WIDcSh
	lUP1Lk6NeAxYX/ALHHeEEY8ITL/r5OyCXov6w4hOTUgZUDuJ02MA3SGsJV9i/YEMw1mJ8MGhlmf
	9XaG7dv5l59zukL++EIx8eI87ZX7ImmiuSvU7dMMIHvvUrho6VfqnZZjXnGTwyzTaNy55qj5RZC
	k4lQTiGWtRPIeL9O9yiW4+kz/1F3oGzOOh9JBVX9Snj1O01EIgB7WuC5Wz1yEDMRP0tNvV8WLTb
	UxUR6MAd224tWbai2oEg+tp6D2JQCYk/UeU4=
X-Received: by 2002:a05:6102:6448:b0:737:9003:ac52 with SMTP id ada2fe7eead31-73a333d61b9mr492219137.0.1782820915431;
        Tue, 30 Jun 2026 05:01:55 -0700 (PDT)
X-Received: by 2002:a05:6102:6448:b0:737:9003:ac52 with SMTP id ada2fe7eead31-73a333d61b9mr490634137.0.1782820901854;
        Tue, 30 Jun 2026 05:01:41 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c1288d1d61asm113746666b.13.2026.06.30.05.01.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 30 Jun 2026 05:01:40 -0700 (PDT)
Message-ID: <c7d263ba-e837-4489-838d-8191ae18b993@oss.qualcomm.com>
Date: Tue, 30 Jun 2026 14:01:37 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/4] arm64: dts: qcom: hamoa-pmics: Add ADC support
To: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Ayyagari Ushasreevalli <aushasre@qti.qualcomm.com>,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>
References: <20260614-adc5_gen3_dt-v2-0-32ec576c5865@oss.qualcomm.com>
 <20260614-adc5_gen3_dt-v2-4-32ec576c5865@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260614-adc5_gen3_dt-v2-4-32ec576c5865@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: ir74aXux30DuR2TgEzh5Z_gJ2X9zamyE
X-Authority-Analysis: v=2.4 cv=AtDeGu9P c=1 sm=1 tr=0 ts=6a43b034 cx=c_pps
 a=N1BjEkVkxJi3uNfLdpvX3g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=XhgZWyofoZ1-JSIGm7gA:9 a=QEXdDO2ut3YA:10
 a=crWF4MFLhNY0qMRaF8an:22
X-Proofpoint-ORIG-GUID: ir74aXux30DuR2TgEzh5Z_gJ2X9zamyE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjMwMDExMCBTYWx0ZWRfX5Ljx4ahec2KO
 YAUgLqQGpW1+MFd+eAvqhKqv0ERENrz8ab2xehUoZSglscmZpuDCHQJKp/svL3umvf1z1g08vcC
 xjkrd+9YtwJliiDaKkhX6aob0c/pB+ZphHZ4VJVZFQTVtm1C8xLVREKuo0jHeHynqsEf+JrwT/8
 EZXAuSbGYDF8tiCRUjt9dDwH0UiXKhOBhlQXjE7AR3fJHtal8L/Q+M1QAlNdywtkpfRz3uF1sAK
 L/hspqCAvwFPJmQyl5agGcPTHCgDpjp5Yy4qhOJHIW72aEnAcYJb0vh/49dwKihatERx/WJWBTT
 kqz9TQIerrZv+Dqr+GEOadb4VWJdc96kOuQn4RlcLn5RNTa6sXl41VvTQldmoRxzl8zhP5fZVAS
 96vtugVpMqFHfGea0JnPwoSzretRVE9luSom649eGEtrbP3Yr0U7Cn79XBZoIzVcFUpW88JoTtJ
 8pY1c38UgyKetMM4abA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjMwMDExMCBTYWx0ZWRfX4v6yPrjbHI6g
 rJwtaW+H96SSlGwXmbOqL4KmTniifeTN8tOdOoffU87sUlZjCPmaNBt1h4XQfiKIh9TR06JV9g1
 RMRnItpZMp5V4GYiaSqIpzQovji0ueI=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-30_03,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 lowpriorityscore=0 phishscore=0 bulkscore=0
 impostorscore=0 suspectscore=0 priorityscore=1501 adultscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606300110
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-115399-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:jishnu.prakash@oss.qualcomm.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:aushasre@qti.qualcomm.com,m:kamal.wadhwa@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,qualcomm.com:dkim,qualcomm.com:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 7D0EF6E3FE4

On 6/14/26 10:05 AM, Jishnu Prakash wrote:
> From: Ayyagari Ushasreevalli <aushasre@qti.qualcomm.com>
> 
> Add ADC node and define channels for:
> - Die temperature for PMK8550, PM8550VE* and PMC8380* PMICs.
> - PM8550: Die temperature, VPH power, and system thermistors.
> 
> Define thermal zones 'sys-0-thermal' through 'sys-6-thermal' which
> correspond to the off-PMIC system thermistors connected via
> PM8550 AMUX/GPIO lines.
> 
> Also,add io-channels and io-channel-names properties to the
> temp_alarm nodes so that they can get temperature reading
> from the ADC die_temp channels.
> 
> Signed-off-by: Ayyagari Ushasreevalli <aushasre@qti.qualcomm.com>
> Signed-off-by: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
> ---

[...]

> +		sys-0-thermal {
> +			polling-delay-passive = <0>;

Drop, this is zero by default

> +			thermal-sensors = <&pmk8550_vadc ADC5_GEN3_AMUX1_GPIO_100K_PU(1)>;
> +			trips {

Please add a \n between the last property and the following subnode


>  		pmc8380_6_gpios: gpio@8800 {
> @@ -451,6 +697,8 @@ pm8550ve_8_temp_alarm: temp-alarm@a00 {
>  			reg = <0xa00>;
>  			interrupts = <0x8 0xa 0x0 IRQ_TYPE_EDGE_BOTH>;
>  			#thermal-sensor-cells = <0>;
> +			io-channels = <&pmk8550_vadc ADC5_GEN3_DIE_TEMP(8)>;
> +			io-channel-names = "thermal";
>  		};

pmc8380_6 isn't mounted on purwa boards - do we need to override the
channel definitions in the vadc?

Konrad

