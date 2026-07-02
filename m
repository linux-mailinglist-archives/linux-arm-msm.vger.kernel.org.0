Return-Path: <linux-arm-msm+bounces-115935-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 2B/OEZxHRmq5NgsAu9opvQ
	(envelope-from <linux-arm-msm+bounces-115935-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 02 Jul 2026 13:12:28 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 985116F67FC
	for <lists+linux-arm-msm@lfdr.de>; Thu, 02 Jul 2026 13:12:27 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=gcGrQWQX;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=hCbEyJZH;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-115935-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-115935-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 7D3D1319C8C8
	for <lists+linux-arm-msm@lfdr.de>; Thu,  2 Jul 2026 10:41:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A53323A3E60;
	Thu,  2 Jul 2026 10:41:00 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53345367296
	for <linux-arm-msm@vger.kernel.org>; Thu,  2 Jul 2026 10:40:58 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782988860; cv=none; b=KUxAWjMIMU9HQa9zwSa6ctlOy21hmW5tjwULlj6FS+ceJAE8Uma1Fe1vmFzY8mpGKzX26YtKWqhRMEgE4Jjt9rBLxLmDoGCCvW47cpdTT9169ImSr/EZnMar5TQSL0anymZhb2Hlf7J+mklGaZiT/cUWliYLW+OEfCVUPPswN3Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782988860; c=relaxed/simple;
	bh=sebh+utV2CTFOisKY1OgnSqraF5Xbo/dLmuLfRjNQZk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Of2hiA8b1pxGuaRBtbvCM2NH3g+FKIpUEe/GkrHQfkcuI8lgFFTYt34nK7ja2ttEzB0keI7LTu4imUXf7QfOigyBmcJdlroVFBtyhS0MBYEftWajaJxc3XgyPDEwzJ1Qibh5+1AkHIph1ctmMZvjXNgHx3clzH7FIOXjAS1ifac=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gcGrQWQX; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hCbEyJZH; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6627Tu2w3964274
	for <linux-arm-msm@vger.kernel.org>; Thu, 2 Jul 2026 10:40:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	vKPyCeFSLo0JTSMTQNfV2R92Q7AZZ1/B+TBr6BmrZT0=; b=gcGrQWQXCAdVftbe
	JpopkdnICD7YzHrEmSkgjbsTz1ufP/i3VvIHxWnko3YYgzweyL+Am2JcUUFw6nRy
	dlkjyCQT6Gyfuv3YvXaOD5gB8KNvrke4+dEp1rmqY4KqyZvnf/cYhf88cE0eBkFW
	i3bYfoRxi+nM+H+d84garjbP/2TZjojpAP+NsiJbHZpP20RbbIf+bXXuzay2LlNd
	s4d+mLt/hYThVtnvyZO2G2aGdOeCjdV4BAhIstttWh7/ykXG1P/DJUt1l7y8S2kH
	fDcQgyCuQHT2hk1GEpC7TvPc5tahIOrf2EqoSlq2dBY/VspUbtpa7WMMS7yKpVVa
	oF73ZA==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f5knc0qsa-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 02 Jul 2026 10:40:57 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2c81c7421abso37812995ad.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 02 Jul 2026 03:40:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782988856; x=1783593656; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=vKPyCeFSLo0JTSMTQNfV2R92Q7AZZ1/B+TBr6BmrZT0=;
        b=hCbEyJZH9Jb4pIp2vM+8S5Cd5Muv4MuGn8adwCyBQQXbpWTFm8UvfSnHPOt8UB3+MQ
         0vrcMroTcMvja4nd/M1xcW4jVinA+tP6Ov7zcguEspp4uX4Nj4qOPGwTAUkK58E1RY/o
         oVQzOd6ndDB98p0UF6tQ/AdkX41i7jNrG0ZJM/Bp3vzxT1EEa6pxg5AvNMZhEOPop1ef
         iMaVSRjxwZtFhzaalUe5bFrLpi/rriaWFOabIDBpBxGMo8ArtcJjMjzQGTtNh59n1ATl
         2aFokBVDCho8rSsMxiZq9nwG27OwzmfJ3PXMaXNduBCT6PCxy4cWQmXp2fYxKuE66jvs
         u+Hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782988856; x=1783593656;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vKPyCeFSLo0JTSMTQNfV2R92Q7AZZ1/B+TBr6BmrZT0=;
        b=o2yCFlDIMPc1bwa6vGOjDqpYAw7xZwMfIbvcTyQnVHUcYJaGL2yKHw0F+7ibV6Buv1
         dkUNoSvojWyYa3yQKS8IoKqOFKSdACZh0Vy+iCDCi6KAxoYJ7f2Um5YNoxdkfbOERTm1
         dkdQMxujFM4jB+DxkHCnmqG4CfLuDduJeOlOiaWInCb9zgOAjj1NrKPNt8lIaT3ao+TB
         los1I8tR5Re87gR1FO05oTfUGR4rGgbGUYY1rZRxhS6cGNScT+SRiJ0K5rBbeahViqII
         eUnwg/3tqzG4/HXgSDwT6EGMTU9rDhTnhXz+Caob5IAFsA+VgS69b3M04jiiNcXMc0aU
         OIeA==
X-Forwarded-Encrypted: i=1; AHgh+RrxfoFjp/HqQ9t65HjSKY0P0rEAu0u7Lyr6RMbI7xd3mCZi/tA541FY9MitstfPIhDaLf5/e3NV05F5cNEp@vger.kernel.org
X-Gm-Message-State: AOJu0Yy8Y6ILmVkhvtVEg8uEit9IGIqehui3WL+fkyR/NzI3VwfR9r9G
	NnSFkky/V3s5NE88Ou2UABJA1wdFgsAgDzjjlUoqyTKH0N2zU+ImcNIYIxFJok9lz5GdAAGrBtL
	vE6Hn0wcOex2T+35lsf58BuGsOAxNGs3w1Mmmqd4/R8XFWgt3BMe8dYnHmzw21aMWDHsf
X-Gm-Gg: AfdE7cljdYSR/G7M5pHE4QFpfVE4K/uMZua4em8a1M17P66Tw8X1FFV+5Tpz67onrAK
	UMXflQRAWbXoJjEER/e8QZJtrq9USfNE6McJ665dLYpyDKrmNCBIyrtA58/6wQen88+Tpfw7m55
	6lzQr1FBscEQCI5CiOKuOPeEKFaesvplCH7jvqqD6B0j57rFV/PurF+SthelyB23soCXT/wQsIY
	SXpbxqlTm0Y5cm68jKQ5e4gIyROj0v0AxUsPtbgyFaQuGpuz1VDZGQG1biBwmXINq92HZ8RUAtk
	gNkNWGNYLBCiyuNaQ0NaruGF9J7eV336BaF4K/Kq0f87dFosuLhkZ16GdkLOmbXrBH1Vnnjl03D
	9mqD9VRHTKN0QGwtEH/Dzma6qkK9kj5CmjqLR/Oja
X-Received: by 2002:a17:902:f547:b0:2c9:97a9:2099 with SMTP id d9443c01a7336-2ca9123c3d9mr47503495ad.45.1782988856303;
        Thu, 02 Jul 2026 03:40:56 -0700 (PDT)
X-Received: by 2002:a17:902:f547:b0:2c9:97a9:2099 with SMTP id d9443c01a7336-2ca9123c3d9mr47502955ad.45.1782988855605;
        Thu, 02 Jul 2026 03:40:55 -0700 (PDT)
Received: from [10.218.39.201] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ca9a8f8458sm11689655ad.18.2026.07.02.03.40.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 02 Jul 2026 03:40:55 -0700 (PDT)
Message-ID: <43b94089-37e1-4e4c-818f-39cfbde4770b@oss.qualcomm.com>
Date: Thu, 2 Jul 2026 16:10:48 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/4] arm64: dts: qcom:
 qcs6490-rb3gen2-industrial-mezzanine: Add QCC2072 Bluetooth M.2 overlay
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Marcel Holtmann
 <marcel@holtmann.org>,
        Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Balakrishna Godavarthi <quic_bgodavar@quicinc.com>,
        Rocky Liao <quic_rjliao@quicinc.com>
Cc: quic_mohamull@quicinc.com, quic_hbandi@quicinc.com,
        rahul.samana@oss.qualcomm.com, harshitha.reddy@oss.qualcomm.com,
        dishank.garg@oss.qualcomm.com, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260529180234.3373056-1-yepuri.siddu@oss.qualcomm.com>
 <8ba8a59c-fb80-45e3-b4b7-0db06614df49@oss.qualcomm.com>
 <88770279-0c63-4c56-a727-dcebf03c32c5@oss.qualcomm.com>
 <9cc33cc1-b7f4-4fd7-9bf7-2ec58283cc4e@oss.qualcomm.com>
Content-Language: en-US
From: Yepuri Siddu <yepuri.siddu@oss.qualcomm.com>
In-Reply-To: <9cc33cc1-b7f4-4fd7-9bf7-2ec58283cc4e@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: jDNLy5NDk2ek3TYtBnf5PYzs2-hBpr50
X-Authority-Analysis: v=2.4 cv=a4kAM0SF c=1 sm=1 tr=0 ts=6a464039 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=u3R6sUP49V7FBL3LJ_8A:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAyMDExMCBTYWx0ZWRfX3iQTlaeseKs5
 jJh8vwOsBPsTM81rBDzmy19xCC4iDKRszsBQpsLlH0kqiY3yZULgJF0unyAZjc9qHI5bL3GDexW
 fiSgpt7BIBo5J6cibwc5VV0M2+RN36Z9W50HKSjTrf3V8nNT43fLBs5DvkwZe/+RRnCzhabjpZO
 Kv6sl7Zwob5yqnIYvymQhrBKR7SpMuPuPyMpndbWcmu5dTHGotzpN+YM0UxAnnoEKcYc1bR/bDy
 MFQgbt54feuVgJqvaQTagSeu5k5Ixt/KDX9biSqwI2YjkDJ5869jEK5ZI1C040lykqCda1qKvYM
 CDCBp8ZBHLAB0llbo49HRdw2xH0dK8Aqn90B8oQEjqI9IHTtGFa0D2R+btjjQbgxn+xr07LLtxW
 w8BNBPxR6m15ps+yoR9XqvLTAWhHjvb9sIyfCXES4m9HYUXZ9eenXkSxpYST/ktl8N4jFOsfnyk
 lNvzRqePsnjMryc7naA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAyMDExMCBTYWx0ZWRfX1jLP3IwYzeTR
 TxmReZ+NyjqNioq1A9ETwTlmRQ0cTB6rlfYTrAjjvN+iZBVcBFe0Eb3htPc7WkEZhOkVtyVXjsY
 Fk70EDGYH1024zDrt+JNX95fn3weL3Q=
X-Proofpoint-GUID: jDNLy5NDk2ek3TYtBnf5PYzs2-hBpr50
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-02_01,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 impostorscore=0 malwarescore=0 adultscore=0
 suspectscore=0 priorityscore=1501 bulkscore=0 spamscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607020110
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-115935-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:konrad.dybcio@oss.qualcomm.com,m:brgl@kernel.org,m:marcel@holtmann.org,m:luiz.dentz@gmail.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:quic_bgodavar@quicinc.com,m:quic_rjliao@quicinc.com,m:quic_mohamull@quicinc.com,m:quic_hbandi@quicinc.com,m:rahul.samana@oss.qualcomm.com,m:harshitha.reddy@oss.qualcomm.com,m:dishank.garg@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:luizdentz@gmail.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime];
	FORGED_SENDER(0.00)[yepuri.siddu@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[19];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,holtmann.org,gmail.com,quicinc.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[yepuri.siddu@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 985116F67FC



On 7/2/2026 4:05 PM, Konrad Dybcio wrote:
> On 7/2/26 12:11 PM, Yepuri Siddu wrote:
>>
>>
>> On 6/30/2026 5:03 PM, Konrad Dybcio wrote:
>>> On 5/29/26 8:02 PM, Yepuri Siddu wrote:
>>>> Add a DTSO overlay for the M.2 E-key slot on the QCS6490 RB3 Gen2
>>>> industrial mezzanine board when populated with a QCC2072 Bluetooth
>>>> module.
>>>>
>>>> The overlay configures UART4 (gpio16-19) for Bluetooth communication
>>>> at up to 3.2 Mbps. Sleep pin states are defined for all four UART
>>>> lines to minimize power consumption when Bluetooth is inactive. Host
>>>> wakeup is handled via a GPIO interrupt on the RX line (gpio19), and
>>>> SW_CTRL is mapped to gpio86 for power sequencing.
>>>>
>>>> Disable UART7 in the base industrial mezzanine overlay as it is
>>>> not used when the M.2 slot is populated.
>>>>
>>>> Signed-off-by: Yepuri Siddu <yepuri.siddu@oss.qualcomm.com>
>>>> ---
>>>
>>> This seems to be a single, unthreaded message. Please switch to
>>> using the b4 tool for submitting patches - https://b4.docs.kernel.org/
>>
>> QCC2072 is an M.2 E-key chip. As M.2 Power Sequencing changes are being upstreamed, we will reupdate our existing patches to align with M.2 power sequencing approach.
>> This includes aligning the bindings, DT and also BT driver changes.
> 
> This is a tone-deaf reply to a question I didn't ask.
> 
I apologize for the off-topic response
Thank you for the feedback. I apologize for the incorrect submission 
format. I will switch to using the b4 tool for submitting patches going 
forward and resubmit the patch properly.

Thanks,
Siddu

> Konrad


