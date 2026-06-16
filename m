Return-Path: <linux-arm-msm+bounces-113418-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id hxPpDkhLMWrRgAUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-113418-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Jun 2026 15:10:32 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 9167068FC57
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Jun 2026 15:10:31 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=PxDxIkdu;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=Lx0fe6EI;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-113418-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-113418-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 9B1C23013A7A
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Jun 2026 13:10:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EA9A4375F88;
	Tue, 16 Jun 2026 13:10:29 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DE973750C9
	for <linux-arm-msm@vger.kernel.org>; Tue, 16 Jun 2026 13:10:28 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781615429; cv=none; b=p1WDdgd6FpWhhTGZUB4PMACl1pSlDLcu/qVFPEfCU6wziwx14DI4xAZLUDTMRsuexMwldtUTb8R5VhpQ72jm5EQwHgAQoZNr83m/qbfjCdgCzsabqvZNpWbTB887QU3S2Z5OqhmEcy8hdV+iEDvY6y+agG+oxKo7YPFYktGlg6U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781615429; c=relaxed/simple;
	bh=7KtoaWHRSW6prUDBgssSr9WOdTqvJcgFyozrKS4b4sk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=OJbm3UaVq35oDvDzTpXtfzE+g8/zfvOIN1bHVy2b0DDAC25ZapUvkiJONSXazU6qDXNScSjWKB6j1Zkmi84lxKaZWwCGm8BzEsyPtt5e0zLKzvUGZeG9XZlmRxRF93DCOFRx0r7O3wUEe2oDDzguWlH2lpcqmAjOhsFaz+aFT6k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PxDxIkdu; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Lx0fe6EI; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65GACJrL3411160
	for <linux-arm-msm@vger.kernel.org>; Tue, 16 Jun 2026 13:10:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	7fmUqfGeJxD4om6MsTpdnfamCbm69Gri3ssVDYU8XJo=; b=PxDxIkdugThTuWCs
	QokoOGAps98XgYAqJme/bofg38paeVtQWQthw4Be9GN0pySBzZXb2JlslaENZhPM
	JjdHcGwwXvXGCLc0EvCg7cGTN955aR1VXULNHRQbTAKByCtyEpz+WP08+V1X0Cqv
	F0262Qj5vu5olilzdda0x6GFkcMhXpR8270gzzv7E04aYK5Rnjh0f7LNzstGIY/9
	D3HPi3JQiHKnvyx7Rut1oC+bkW/wRERd8ymjIxfUvufiDdTMh6w8iwG9afvFPMTx
	srhFc14CeRfFaG3NZiSIjqYMZlGsa7APRxD9hr6WWbB5asPhUV86h3MokdEflQD+
	82iR8A==
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com [209.85.217.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eu09g9wpv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 16 Jun 2026 13:10:27 +0000 (GMT)
Received: by mail-vs1-f71.google.com with SMTP id ada2fe7eead31-6cc6b92b8f3so130270137.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 16 Jun 2026 06:10:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781615427; x=1782220227; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=7fmUqfGeJxD4om6MsTpdnfamCbm69Gri3ssVDYU8XJo=;
        b=Lx0fe6EI+M3xUhiXDMZWysS47BSsypHI7pUgzqBZGhwwe7lxJF/RII9uBZkkgqIFfp
         Y8f7gUNuyqnKOJfhFSAvepfe1MHm4SPO8r4FiBjki/Lw71tZe+GdGM9V1v/qAD5TGQ1F
         M3pG2WdrvADN9isuFktrO7DoJ2vGy9viIFVEZ/imjFZlW46qRI8gAO/sjeiMgF4i3Ep+
         2vFA8iIoioZ10VMb1zGsvf0fz9K48q0ZopBg/9dnwn4gfiZCXm58O3v2IxXSkqUi9/sh
         qICP+HsKpLJuW7NuGwp6FOg1oU25Ncx1DyHlub3oBXrvCVm0OYxr9pK6w0mMRPyJJVKu
         9XXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781615427; x=1782220227;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7fmUqfGeJxD4om6MsTpdnfamCbm69Gri3ssVDYU8XJo=;
        b=ZCYFqvL44oZ855J5jhPfiDnPJe9+DolnWvQNcfTfOFyrIDniyeWAbuLrLIwsSc6vN8
         JSJkKeS6XdpFkD2fgdBD8GrlENO8/i0wmvUHy4Clp5XwFzYZlWJvaaHl/mWuNbJgMtok
         9v414aMoZPZu7P1IB6xMxPpBAniC0Op4a/iSta8rr0tDJwV/RMqpCaAATkY5yHKaP8Ff
         S9GiOeFXm5SwgvirB1Pw/mCUOJBq0R95KojvYXMM6PQlOjASlrPYWRVJZUk7W5ZdAe4O
         VdrTelU8eMwEEAH0G+My//4+W7ue/7m6FDciAwYhF1Py6IJ+s1fME6w/1k0daW4EXqBe
         rUTg==
X-Forwarded-Encrypted: i=1; AFNElJ+dXMQS/byhvbbGrNIgjgVAnb5aFEZuEOkv89yJoNNXLXcwtVulsTiRvhamGrRovvVqfZ/+CWXHf0311sVB@vger.kernel.org
X-Gm-Message-State: AOJu0YwgH/vihZsiqUnL2TAZeNIDlyA0CqciMfjRrfW/szKGpNG0MEJm
	2MqLYzg+a3A7I55Mi3tzEwpUv4dXkVmeYn3K1dVx34Bep28dyMvhXArHJVHUPUzWZBTd2eM2L6h
	Mz2ggrpx0ur+6VRrALehfaf3DE6++VmSAnoKbAofWSDM5+5Y63UDWn9cjWkALQ50HSIfy
X-Gm-Gg: Acq92OGQKs9TkLR+LXfnpcc0GsGp6RFqVBlw/UoCMPJtcwFW1GZLVgFbEcYPMKTdIMg
	iYJepgBGMG2RLq1SKyHrIlMiA/8PCJFOpG1H3JVlMNzOAgHbWTqF4M1WAkceaIlZZasaxJ2JaCz
	jawFRlvIzdQoNEntQrNTrqlpSr+VAa50yNU513HaQkOVj/biqIDauhC1kxZD/3iig6viOn/Lp9Q
	12/rieekheijjv2aGO6lo1dXi7NHod2TS2vKdTLqspBMILffAF4h4UjwIqVztsxi2lD36Yc9sWr
	UqLNGlVC86ApHWXnxQt7xphBLeRSlmaQ1Z8tYk44q5WrxuCdcVpgnoBfFFjHlAMSpn+jwLg6xe9
	u8Dhx2MAnOb5h1R4+EGNg91x8+YCvvwVJUFUp4/OunJBcbQ==
X-Received: by 2002:a05:6102:508d:b0:631:b312:a2a6 with SMTP id ada2fe7eead31-71e888ef7b8mr3277121137.0.1781615426856;
        Tue, 16 Jun 2026 06:10:26 -0700 (PDT)
X-Received: by 2002:a05:6102:508d:b0:631:b312:a2a6 with SMTP id ada2fe7eead31-71e888ef7b8mr3277098137.0.1781615426375;
        Tue, 16 Jun 2026 06:10:26 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5ad2e1b4869sm3576118e87.75.2026.06.16.06.10.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 16 Jun 2026 06:10:25 -0700 (PDT)
Message-ID: <08b52051-fdd8-4016-ad03-560aea32286e@oss.qualcomm.com>
Date: Tue, 16 Jun 2026 15:10:23 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC 1/2] pinctrl: qcom: eliza: Fix HDMI_RCV_DET function
 slot
To: Alexander Koskovich <akoskovich@pm.me>
Cc: Bjorn Andersson <andersson@kernel.org>, Linus Walleij
 <linusw@kernel.org>,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260423-misc-eliza-pinctrl-v1-0-2498b365ff2c@pm.me>
 <20260423-misc-eliza-pinctrl-v1-1-2498b365ff2c@pm.me>
 <5dae3a56-a17c-4201-ba0b-8591646197ef@oss.qualcomm.com>
 <P33wW6i3eN15uYIbIb8LfIVRvmL0zVdiI_FOKDoMIM_KFi01m_7PMaZmU1z3YJl9mGN2kDtSvXUujD-TWaXXiSOZeEH-kwj3JSjmIRfRb54=@pm.me>
 <109ad54c-f17f-49ea-9d7f-54e13dd367da@oss.qualcomm.com>
 <U4Ou8tzXQzd_9s7-BdFTARdlOQdxQ2P7o9Lx8kaqvvbPd-Jm16U26MFqvYUFkEGiOZ_yhO0GNref9oLmgbtMe9_8yUodoRODhYxWH_0c2Z0=@pm.me>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <U4Ou8tzXQzd_9s7-BdFTARdlOQdxQ2P7o9Lx8kaqvvbPd-Jm16U26MFqvYUFkEGiOZ_yhO0GNref9oLmgbtMe9_8yUodoRODhYxWH_0c2Z0=@pm.me>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE2MDEzNCBTYWx0ZWRfX2fneuil0/oYe
 VhjpuAwla9ySJ6nIh9LQguGPJw70d5nX5o1Uu0fsmvvrT/HkDUdJG8QDKhBDS+UcWsjjRQJPdhB
 euUBmHPMnBbon4NbCxRfve804YAYBfkou8gEzUNEyqsfVc5KERyOzbiFrjS8mDTE59h0mOcJfUI
 rsli19koPjjaYYi0UYjFjV59sfENPqHrpAY6DO3ekrzHosF2fJDTKJSanQi5A07cc/JQybKnnsp
 mae/pNx95nhw+IINrSNZRijRFHDFIQXSqYtFJi7VSts3+8wOeewphZDnK6u2CBdu7wRNowW2RsD
 Jbz90fMBm91uUlsknXFSAsQc60dd7Hjv6Nt9h7ZgMlpQ5p2dXSXTLhL3HJDV9vWvtuOuilhStT9
 usJBhylNBjcW9+ZoZgzMeygRydF3rEGmLoyo4HS+XVte4zUmkQw5yOch5o8JhDGM68fmDFtTX13
 RQdB9/vZkH5owR0fsfA==
X-Proofpoint-ORIG-GUID: KfxjsH8egCYGkmYn5c1wtW2Tu6fH7pNo
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE2MDEzNCBTYWx0ZWRfX4kxtipFqmK1w
 dTdSqVnDtpcaykuB9ikzvTmXzT69I9VAFXuFwz7mobGsiSyLMEaNr/jc0NeIz4SQvhN1M81K34G
 JwFkfrCDiW+bMKX/woOzBhvLoWp1LdA=
X-Authority-Analysis: v=2.4 cv=DLa/JSNb c=1 sm=1 tr=0 ts=6a314b43 cx=c_pps
 a=P2rfLEam3zuxRRdjJWA2cw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=db-TDxVd8kBkxHJwRWQA:9 a=QEXdDO2ut3YA:10
 a=ODZdjJIeia2B_SHc_B0f:22
X-Proofpoint-GUID: KfxjsH8egCYGkmYn5c1wtW2Tu6fH7pNo
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-16_03,2026-06-15_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 clxscore=1015 spamscore=0 malwarescore=0
 priorityscore=1501 phishscore=0 suspectscore=0 bulkscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606160134
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-113418-lists,linux-arm-msm=lfdr.de];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:akoskovich@pm.me,m:andersson@kernel.org,m:linusw@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-gpio@vger.kernel.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,qualcomm.com:dkim,qualcomm.com:email,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo];
	RCPT_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 9167068FC57

On 6/8/26 8:41 PM, Alexander Koskovich wrote:
> On Monday, June 8th, 2026 at 7:55 AM, Konrad Dybcio <konrad.dybcio@oss.qualcomm.com> wrote:
> 
>> On 5/28/26 7:24 PM, Alexander Koskovich wrote:
>>> On Thursday, April 23rd, 2026 at 7:08 PM, Konrad Dybcio <konrad.dybcio@oss.qualcomm.com> wrote:
>>>
>>>> On 4/23/26 6:51 AM, Alexander Koskovich wrote:
>>>>> The hdmi_rcv_det function was placed at alt function slot 2, but the
>>>>> correct mux value for this function on GPIO 19 is slot 3. Move it
>>>>> accordingly and leave slot 2 unassigned.
>>>>
>>>> No, 2 is the desired one per docs
>>>>
>>>> 0 -> GPIO
>>>> 1 -> QUP2_SE5_L3
>>>> 2 -> HDMI_RCV_DET
>>>
>>> Is it possible that CQ7790S is a special case? The pin assignment I have for it
>>> here is:
>>>
>>> 0 -> GPIO
>>> 1 -> QUP2_SE5_L3
>>> 2 -> N/A
>>> 3 -> GP_PDM_MIRA[0]/HDMI_RCV_DET
>>
>> I was reassured that my source has the latest information
>>
>> For reference, does your reference doc have any 80-xxxx-xx-like number?
> 
> Yes, the document I am referencing is 80-97791-1A, though since you've double
> checked likely just means this is is incorrect?

Yes, I got confirmation from 2 separate people

Konrad

