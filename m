Return-Path: <linux-arm-msm+bounces-113402-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id A9k6L5U+MWpofAUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-113402-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Jun 2026 14:16:21 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 3939268F362
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Jun 2026 14:16:21 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=OrXaf1mS;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=ZayDDwoM;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-113402-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-113402-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id E5DFF3022556
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Jun 2026 12:10:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DC7C143DA25;
	Tue, 16 Jun 2026 12:10:51 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF3FF43C063
	for <linux-arm-msm@vger.kernel.org>; Tue, 16 Jun 2026 12:10:49 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781611851; cv=none; b=pwtuvwQESNQ+90bfokZWhkDANEj3NvOT/aiAYsZtuDVxi5S7xyq7j0uUSzavmNfS4MCePzCmmkdwQO0Ve5YXOyK0TFzitrAmKn3cpKA5gbRea5lMIN7xkBO2IOsN8uyNCeXLTHKo7mqj1UM5Jp+MlOujKDiGHRJ3SG7o5XC0I4k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781611851; c=relaxed/simple;
	bh=DHt3BcI99ZRJlsijYSVKVUjw0Sa5XjRe/lmkpsqPH8U=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=LHe7hc0RFYn2MxYudEfyp094I4+/W1+JDa90OJTa6if1Au+hGqgNuh7cYwG3cw42890k9ucMxjj09NacIE6bxJ+BYpnl9h6d9lc+M/YOwSk0xdi5xslkIbiVyJD67VTc0OVbWfhQ0/bcigN3ErNgYAvLTLGd458khNr2HglHbUc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OrXaf1mS; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZayDDwoM; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65GA9TxG2915025
	for <linux-arm-msm@vger.kernel.org>; Tue, 16 Jun 2026 12:10:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	OxWmbtNOroxnYSGzP/yu/120wi4D28MbvydbCpAWsUo=; b=OrXaf1mSlsaRbclh
	jogx3mPNnbjwr84U4rLQ7hdZ6zUbMvr+0iaB/rY9J+kvDJjD/9m51XnnCHUSjRI5
	MC3b611Uk4vq+bH7PRhxmBIec0T9zIyl5b7snzZxibfGsR2Cvw9AyRXdaiowPdtg
	8q7GpX6y28sywhN5CDW2hFZAMpVVKOPVkcfJ56Fgzs0IIOFF3KFrociHeN/mVzlN
	FpeFSv3Ep5is3F/aKsOLTojBkqUx0hX7pGJLFHOYfqMJ/PvQ3SOcTlm2XabgKiwe
	A1VMvmQyVyaFZgW3Wdi4t5yPBGtFDCoWAMK6BRJyIFcnF5a66TphHJ9XQqcRYj1P
	kJ8RpA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eu1761cyt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 16 Jun 2026 12:10:49 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-9156dc90fdaso105203385a.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 16 Jun 2026 05:10:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781611848; x=1782216648; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=OxWmbtNOroxnYSGzP/yu/120wi4D28MbvydbCpAWsUo=;
        b=ZayDDwoM9meH17oG0IS1YhXX/IDyvx+o0c8GNRu8CUshs3Xeta4oEqAAwUMSdLOBPT
         hLgerCXQGTY1iQbPTI7KN7OpSvaD1QoppDCyN+BebRGpXL7cEbc18xg4v4u24aFQJzP7
         M2dcTM+07+1oJbdGOti1ylEMt2YmBL+U7PB0vz8rMcIoJvOBZx0gTpM1JXIGIbIo6HLy
         9EF22nT/WMKM9sULm9YKRh1J+TTAT9Rtkpuv7Jxi5nLMgNgbj0Wf/9oiIay/BbzLC4r9
         bVl1yzEMmmsr/anFMIdicFIaKGj4on+NW0ncbSFrzuEdt47ZOQBwDm1qviVqWORmSVPa
         DGPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781611848; x=1782216648;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OxWmbtNOroxnYSGzP/yu/120wi4D28MbvydbCpAWsUo=;
        b=N2O1uiD49mafKhO1dzbvJdtEiwWamJ28rzBG9e2rzuac0ZtD8GlDESnaxV/SOll+V2
         voOXq3gmd4FUe5u69G4BgGM68biRZ2mYAcWYUse5Ip2YuuXiPr2MzeTYwOPoXq16EyE7
         qDRSDsz1Y8F/FytJ3Z9ldgC3DlEF9XyF1ylJHv2CkzxZbVJKpZBR6kpviLIGZSOEf5p4
         o7yrVWbM2rLFMgUULZ711eFPNTpVjQqbEO6PELBOl8er3PmmcHFF+HWAh3IxfOBOmyMV
         fC+9MP+lhsz7lMkHVBtgngB/xa2HpBZ5etByrd6NOCdp7gE9D7R9Phheiw55/9i1Bgxn
         OC8A==
X-Forwarded-Encrypted: i=1; AFNElJ+nhFtbDHsBUBzRsPK+OYVlxF3wYZOYl7Gv1OVJtINLB6tdJeIT5yLLTL4BwhwhPJveSQPTkOJY93uiQZas@vger.kernel.org
X-Gm-Message-State: AOJu0YwFgYqJaAz9YSe1vCdZsIQ423nIq4i36F9j8EBaEbc4unP77Siu
	2Mk3ZPUEgicS5Fzg0a+U2tXiS8zkV9ZmPhcYCT5MFlkg3ZCRGndiJ3519VYjfgMkQYh7NwpxGOa
	AvN2FGoDcpJdzDBY/WmoEF/Y/1QkVRCyv1jhZhcDQNZTuIneY5rgqClkTK6iiqRaM9wQH
X-Gm-Gg: Acq92OHgGFNQQBOxfL8D5M0fEiXqi3qpbqBgsqXuq/yMvX81DTW1ZgDetnTJDqhoGOS
	kEe+snrHFu0zxvgK5cqjBA1Wl5dvYOPHJhMSqzonGHneTo4hZgUUJ//Y6HPTksjJ7QGr2ibIfU5
	aYjPzh82pvtGQ0DPdpcO9u4wz9YOrZe0gw9F6gOrNPCYIl+szhNNWRGSVXxIp5zu2lCcQ+Qq93y
	7VUPpVuiyJxcfO3rBeN3UceOcXidpaWOmYDAPek/qy3Ql1YuF8kdQbb5ICsa1VPReuy7TwftC/v
	gmk4Llnv4TejLrIVL3Ye/ER+mnr7BY2NtMjaTdaatgVYIQWQGHjno2dGr8EKotoNN8J13mvPb+1
	p0OwNCzbUo5MxavQO0T7xe84pBFW1kIkHDdehCkNEz9zpfw==
X-Received: by 2002:a05:620a:2714:b0:911:295d:59a1 with SMTP id af79cd13be357-9161bd4df47mr1667713285a.8.1781611848148;
        Tue, 16 Jun 2026 05:10:48 -0700 (PDT)
X-Received: by 2002:a05:620a:2714:b0:911:295d:59a1 with SMTP id af79cd13be357-9161bd4df47mr1667709785a.8.1781611847540;
        Tue, 16 Jun 2026 05:10:47 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bfdb8b1bb64sm652683866b.52.2026.06.16.05.10.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 16 Jun 2026 05:10:46 -0700 (PDT)
Message-ID: <5c80c430-8bc7-4d03-be7e-c6dd518705e7@oss.qualcomm.com>
Date: Tue, 16 Jun 2026 14:10:44 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 3/3] arm64: dts: qcom: Add Vicharak Axon Mini
To: Ajit Singh <blfizzyy@gmail.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260607113658.25117-1-blfizzyy@gmail.com>
 <20260607113658.25117-4-blfizzyy@gmail.com>
 <39228ace-9404-4ade-bcb1-28e763548b7f@oss.qualcomm.com>
 <aiuGjH4qeOIXXgqq@page.local>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <aiuGjH4qeOIXXgqq@page.local>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: KAQsZrrNHfikfvjJJNIDnPoCtt3wjYrB
X-Proofpoint-ORIG-GUID: KAQsZrrNHfikfvjJJNIDnPoCtt3wjYrB
X-Authority-Analysis: v=2.4 cv=I4RVgtgg c=1 sm=1 tr=0 ts=6a313d49 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=pGLkceISAAAA:8 a=yPoNxxP9iKLQiR109SsA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE2MDEyNCBTYWx0ZWRfX4vgQ95+NOtZr
 ehNTFXLQA1UpoBSWvJfe+BZk/JO/8HoVbolVp4s/11eAw+RxGR9sBR/MEvVjoUPaRmzJQfdcKsP
 bgQTAX97+Zd+YFwmCDH6cIjOUjBvC/g=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE2MDEyNCBTYWx0ZWRfX6iNHSA3nWRfI
 RcI77nzy3ixPQDV1K3S6wUcveMBxG/aBoQrC/oes9nI7gKy+zSnStaUb5Gqb15vKisUJAG3aN++
 0nFlryXmz0SeljKUzs2dKNs5FYmPMUYMMxkgOgdL2uGKDUE44ZgO4CZ/jeZ2XvQ4KNergNOMRkT
 6c8Mn1maBT2CYQN8BMV4TKNnmnBPr698AfAFxAQymdimLKI5SRY8vJGsSdzLaxzx4rgXu1hVrU7
 pBwoCGeArtrfEyvYCje7fPlwWP5bLsF08s9MIKvAR8ebagvPL7lYQihnWhQtDuYlnDNJqpVkL1+
 +z4RUgRADlJrwrKHk+lsuW7ndH4bENTz9SOutb6B+jy0OUbmYgKDW15wF5BJuQkTzvUsBK0PRRq
 zIEi7/Lqv2NXUJSNvh/OLlIIR2yhGAroXt84yoKQn31lDZgT6b8vAGX46FNZds6hU5oTzCYdPyV
 eZYfVeop3ZFd16wUGsg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-16_03,2026-06-15_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 spamscore=0 suspectscore=0 lowpriorityscore=0
 priorityscore=1501 clxscore=1015 bulkscore=0 malwarescore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606160124
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-113402-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:blfizzyy@gmail.com,m:andersson@kernel.org,m:bartosz.golaszewski@oss.qualcomm.com,m:dmitry.baryshkov@oss.qualcomm.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,vger.kernel.org:from_smtp,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 3939268F362

On 6/12/26 6:16 AM, Ajit Singh wrote:
> On Wed, Jun 10, 2026 at 02:58:19PM +0530, Konrad Dybcio wrote:
>> On 6/7/26 1:36 PM, Ajit Singh wrote:
>>> Add DTS for the Vicharak Axon Mini board based on the Qualcomm
>>> QCS6490 SoC.
>>>
>>> This adds debug UART, eMMC, UFS, SDIO WLAN, USB 2.0 host, PCIe
>>> support along with regulators.
>>>
>>> The UFS ICE block is kept disabled because enabling it currently causes
>>> an SError during qcom_ice_create() on this board. UFS works without ICE.
>>>
>>> Signed-off-by: Ajit Singh <blfizzyy@gmail.com>
>>> ---
>>
>> [...]
>>
>>> +		vreg_l12c_1p8: ldo12 {
>>> +			regulator-name = "vreg_l12c_1p8";
>>> +			regulator-min-microvolt = <1800000>;
>>> +			regulator-max-microvolt = <2000000>;
>>> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
>>> +
>>> +			/*
>>> +			 * VREG_L12C_1P8 supplies the Ampak WLAN/BT module
>>> +			 * VDDIO and the external 32.768 kHz oscillator.
>>> +			 */
>>
>> Sorry for the long review timelines on the previous patch, many of us
>> were out for conferences..
>>
>> Is the oscillator used for that WLAN module? Would you ideally like to
>> be able to turn it on/off?
> 
> yes, oscillator is used for WLAN modules. Oscillator is powered from the same
> VREG_L12C rail as WLAN VDDIO, so there is no separate regulator control to put
> in pwrseq. So I think this will work fine?

Probably? My point is that you marked it as always-on, so it will *never*
turn off right now. For e.g. Qualcomm wifi, there's some timing spec that
needs to be met wrt delays between toggling various regulators and GPIOs
going to the module, hence I suggested you may need some pwrseq inbetween
to achieve reliable powering on/off

Konrad

