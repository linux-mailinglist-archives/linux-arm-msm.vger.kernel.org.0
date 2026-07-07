Return-Path: <linux-arm-msm+bounces-117327-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id cdRPAhsBTWpqtQEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-117327-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 07 Jul 2026 15:37:31 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AC4471BFED
	for <lists+linux-arm-msm@lfdr.de>; Tue, 07 Jul 2026 15:37:30 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=Bi4KvWky;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=Jd0749Qj;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-117327-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-117327-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 78E263113621
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Jul 2026 13:32:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4769C41D4F2;
	Tue,  7 Jul 2026 13:32:00 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B415441D4DD
	for <linux-arm-msm@vger.kernel.org>; Tue,  7 Jul 2026 13:31:58 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783431120; cv=none; b=WDg2v3X6KlTqEJ3E98gQari7j6ZL2Kc7+GzqRrwm6V0Z5JdTXTgat9ffrjPWoN2zZ08u1165mfpEUcYLI0rlETQkNQyflWArnvoMh5IPcjx71rFXPy5sbn+cTNmADIwg5rkhl5dHAskj0mLRyW9h2pXQ5aV57ylemrJ774ARkO0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783431120; c=relaxed/simple;
	bh=eRiu6xlRGCigoYlAt5WHX9RcoVVKkVTEbzs0xA2TxdA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=oIb4pSySRoH9dc558nvNV0OWXuAI5PTyMcsGLjtZcJc0eHkWzpY9WiYp9/E+PZ3rIeVh6mx6yN8IIhAKBVTxH1Zd5uL0WFzJwjezql1+hOhv5dWKOLXSo/viwLGZJBfZg5GZeIAGe6U6hSRHiqa62CK+lvtoQg/rPSGu35tnOUw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Bi4KvWky; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Jd0749Qj; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 667C8cZe3755349
	for <linux-arm-msm@vger.kernel.org>; Tue, 7 Jul 2026 13:31:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	vRuiy7dJLlykvulsIPzgvFs7mUvpBg3IQJtjypRN/Ic=; b=Bi4KvWkyjCYIWkkD
	zEbw6r4o4v85TAY5VHjqFOHkxPhVerGEX4bFosd6vbZklh8bu2AhZ+uF3rWaRuOD
	oYEsje6B2bP3xwAaBYyD4IzuirNL+NmuI/euaFFIcX4qSymRaXoqYcRjhQQl4eEC
	NiJy/M/Yp5viz3o7Q1C8HcuEL1MqCaFWd5ri5ihesyxWNh0hjh2IShWqwExbNI/V
	w1JhIHWO/kW0dua2epZqTnGiVfEx9l0NWzXFwPBCifSVoq+bghQeOyuKAyCHNZYs
	xMKS7+bFyM4jfXFhMp7/ul+n4EAc5J0ZajFmei7x+uMs7Q9jymxtjRvMjwM+vytr
	xEBE/Q==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f8wep1bbf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 07 Jul 2026 13:31:57 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2c80f89b64bso74186995ad.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 07 Jul 2026 06:31:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783431117; x=1784035917; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=vRuiy7dJLlykvulsIPzgvFs7mUvpBg3IQJtjypRN/Ic=;
        b=Jd0749Qjn3t9m5UZpf3y8imJYpAui7Vsau2EmXLKqWl0cJu6IMITP7bbqRBICC0lZY
         FU5zsm+rSl3f80jeiSTEgVdyeS/vCMZh0Pm9xb7bJ4066PzHVNcNFhVz0Y1uvZxgtjEw
         7aGO3zSnJKgntNB3fUmA/zO4Tq9etxehbB4mwttQeCBki60iRmCN2Eh/UhcEth1BTfXx
         38fIBR8QPk7got7suSiBTRTQDB02MmTQfEfIfg7Nn1tMAdzr9xxypQzRL9/Xd2OWGp3n
         frsYkJuU8ibrM5ZJZj+xg1bdxjac01XXzfXYYm11kSDluWHO2tcwDSuAXSAo1krVCEWs
         GeDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783431117; x=1784035917;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vRuiy7dJLlykvulsIPzgvFs7mUvpBg3IQJtjypRN/Ic=;
        b=nRCA/PqDUMjMdU0MK/2as8SdNdoBe44jlbLyFNIUdLDhtx246uaEP53ESOCvkR0bk2
         EE/T2AJi2HaBwS1WO/x2iv8yQQj/0EvpyMDN7H+ckr5HcH0yJqj8CKSMfH9FzNM8wc9u
         mRoCAGLEHOE62Rx1iuXxU3S5J7rcG/WMw170C7rimDgprq6g0PeFxONLdiTPTWNz9HGa
         pKR5y8ZQTb29sojDukNEWUcLk4/ggrlqugN1kU72FNgdagjxXoDy9LoTsus/IZiXIfY2
         PMKRJpdHOhwk7kLODOb9GJUQ14x+QTARlmCl0V4vqQATYOjF6qpYPFefgT689/lNNWWi
         8yEw==
X-Gm-Message-State: AOJu0Yw5JgW8WcukOW3xtasi69MSzbJi211MJZHe3hLC0ykPfirWY1UI
	W49bTX7Ez+K67np9v8Ke6TJ8Iz03788iYPkRgEe7Rpk58I3wIE6KhuMg06yjytH9dTnSaFEbs2+
	e3w0oS5ykzC99M+i0KOjoYx3t+TZTNGAg176A4yqWGWkKD/5MHP2fjMV690ersrrgZrJvZ3YJHz
	O9
X-Gm-Gg: AfdE7ckEAtGiizljHn3boQ/cEmOXj9kCPPkPH7/rNH6bOtBS6d8FWnGbEOzVJ8vDdw5
	kG/owstC1fHF65vy8sESboRxJCDEeqk1VI1zO+7RuU+qexnA6cojQmR9sRnE1RTRJ0MrMblH0qs
	wRfN/HOy4UmaUGv6URRGLQbV2DXwsEwZIbD1YPIAgE8Nr32H20OqnCDu49fTJa+RBauM8we5KDR
	5vMgBasycgTf8a7ETOj85UFXqa95xUyKaKMMRWT4a6E3iHr2Q6sbvvLmETCwzbSp5G9mffEOmQm
	Eje+D67N6oyCD6h+9OZSm1GJCEBAbwuA2VrgbFTsZXkJxrMtU1EwfVQmndnq5x0G5yKOzt0xvTM
	zOLCOVG8SKxC6wlDqLsi3DgUBN+xNodq37qKop5jjUMI=
X-Received: by 2002:a17:903:fae:b0:2ca:de3:15e1 with SMTP id d9443c01a7336-2ccbf0105d7mr53194435ad.31.1783431117214;
        Tue, 07 Jul 2026 06:31:57 -0700 (PDT)
X-Received: by 2002:a17:903:fae:b0:2ca:de3:15e1 with SMTP id d9443c01a7336-2ccbf0105d7mr53194075ad.31.1783431116723;
        Tue, 07 Jul 2026 06:31:56 -0700 (PDT)
Received: from [10.217.217.28] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ccc9d5fc81sm12180185ad.83.2026.07.07.06.31.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Jul 2026 06:31:56 -0700 (PDT)
Message-ID: <5b30d4c5-ce21-492a-97a5-2a64f0ceb65f@oss.qualcomm.com>
Date: Tue, 7 Jul 2026 19:01:52 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/4] arm64: dts: qcom: hamoa-pmics: Add ADC support
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
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
 <c7d263ba-e837-4489-838d-8191ae18b993@oss.qualcomm.com>
Content-Language: en-US
From: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
In-Reply-To: <c7d263ba-e837-4489-838d-8191ae18b993@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: It7fiy1D7Z0SNmHjlz5b6unzkQWwKESk
X-Proofpoint-ORIG-GUID: It7fiy1D7Z0SNmHjlz5b6unzkQWwKESk
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA3MDEzMiBTYWx0ZWRfX/NKkhTjnmq/8
 1KSUHRxPpuJ+xgH08yLW4FVb4j4JHVeCNz6QhDvJBH51Mes9dZnMHguEEkRd6FadQ+UpXEBeajy
 3menDPdlz8cVBQO1SH8akEPWzM/k3aCNSdW64caTfXWh/IvSavSNo/hQdQ+eSnfzrKd+GeTh6Ic
 eXnlUOIkzoPg1jGMG4oH1vYLXWAe4pq2pEnoAswGmdvU4rFQ3BQQ6SrJTwRhb0nZozWW7nv/G0v
 7zHThlbQhurvv89UBy+dVOsvLaCU0NKJv+WmR9fKCh01tCLFS0njGXFSe79c+78pdOVDE2En8u0
 ekBbQTTbN9GSQcWuUWtiQaSlgSqXEVLR7ZtDLMSIGpksHdsBSH2XS+uBF+QLjKJBjNQxLaMBBJz
 yycKRDkoIbobr59NhgkZa3ZAb5us9Nbm/gd3pVpzjG1+gg11dw7VtoEBfHRiAzMar/FC4us7H0Y
 Q2UcAYcdQOutJPMiwpw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA3MDEzMiBTYWx0ZWRfX4OZytjQsBhGf
 KDhagj6J/d0WOpKguCApnbBV2U+3/UxF5suhJm+nbOZriPbIoZrP9yvucMfYbFjLyVrgcCwgA8u
 G09iAEBySEccfSBsomC8N0yMwLqyWYI=
X-Authority-Analysis: v=2.4 cv=atSCzyZV c=1 sm=1 tr=0 ts=6a4cffcd cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=PgX6_706HHJfHgd0ez4A:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-07_03,2026-07-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 clxscore=1015 priorityscore=1501 spamscore=0
 suspectscore=0 lowpriorityscore=0 bulkscore=0 impostorscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607070132
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-117327-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[jishnu.prakash@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:konrad.dybcio@oss.qualcomm.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:aushasre@qti.qualcomm.com,m:kamal.wadhwa@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jishnu.prakash@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 5AC4471BFED

Hi Konrad,

On 6/30/2026 5:31 PM, Konrad Dybcio wrote:
> On 6/14/26 10:05 AM, Jishnu Prakash wrote:
>> From: Ayyagari Ushasreevalli <aushasre@qti.qualcomm.com>
>>
>> Add ADC node and define channels for:
>> - Die temperature for PMK8550, PM8550VE* and PMC8380* PMICs.
>> - PM8550: Die temperature, VPH power, and system thermistors.
>>
>> Define thermal zones 'sys-0-thermal' through 'sys-6-thermal' which
>> correspond to the off-PMIC system thermistors connected via
>> PM8550 AMUX/GPIO lines.
>>
>> Also,add io-channels and io-channel-names properties to the
>> temp_alarm nodes so that they can get temperature reading
>> from the ADC die_temp channels.
>>
>> Signed-off-by: Ayyagari Ushasreevalli <aushasre@qti.qualcomm.com>
>> Signed-off-by: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
>> ---
> 
> [...]
> 
>> +		sys-0-thermal {
>> +			polling-delay-passive = <0>;
> 
> Drop, this is zero by default
> 
>> +			thermal-sensors = <&pmk8550_vadc ADC5_GEN3_AMUX1_GPIO_100K_PU(1)>;
>> +			trips {
> 
> Please add a \n between the last property and the following subnode
> 
> 
>>  		pmc8380_6_gpios: gpio@8800 {
>> @@ -451,6 +697,8 @@ pm8550ve_8_temp_alarm: temp-alarm@a00 {
>>  			reg = <0xa00>;
>>  			interrupts = <0x8 0xa 0x0 IRQ_TYPE_EDGE_BOTH>;
>>  			#thermal-sensor-cells = <0>;
>> +			io-channels = <&pmk8550_vadc ADC5_GEN3_DIE_TEMP(8)>;
>> +			io-channel-names = "thermal";
>>  		};
> 
> pmc8380_6 isn't mounted on purwa boards - do we need to override the
> channel definitions in the vadc?

Thanks for catching that, I now see that pmc8380_6-related nodes are
disabled for Purwa. I think the pmc8380_6 ADC channel definition can
also be deleted using /delete-node/ for Purwa. If this is fine, I'll
make this change in the next patch series. I'll also address your
other comments there.

Thanks,
Jishnu

> 
> Konrad


