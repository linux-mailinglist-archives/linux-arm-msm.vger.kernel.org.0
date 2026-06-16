Return-Path: <linux-arm-msm+bounces-113355-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id vSaBBFAbMWrKbgUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-113355-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Jun 2026 11:45:52 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BC4768DA9F
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Jun 2026 11:45:51 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=U3QF9A08;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=MjHvrKRW;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-113355-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-113355-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 15850300BBBA
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Jun 2026 09:45:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 316E1413D62;
	Tue, 16 Jun 2026 09:45:50 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE2673A6B67
	for <linux-arm-msm@vger.kernel.org>; Tue, 16 Jun 2026 09:45:48 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781603150; cv=none; b=bjT2rAg1qIidov+wfDqkiavSAHgdL/MQDkoTProjo9wo8IQhSOvqyUSrxepHtiQ0stlD2KVptBgZxaGS6S2oxtV4oisNYDgoKOZfpMswXKJ46K+5FKT2mS3Lb2XqzNwOUU8n7w8f0+cOnmUpDpo/I1bSuqJGaFiBCT+/mheQ1A0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781603150; c=relaxed/simple;
	bh=LC7dDtmk+ZW/FYQaJQ4mv5Z0clS776B0o/QgDFWksAw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=geAvhj5dXqChpUS2JmjNEc7UE/tQQWyFNTNCp0IhE4zrnlcNs5U50btH71yEQtpM3MRvqGKM0P6/vyPULzw3OLx4K1pJitQWOWFJQ4Zv2nZkorTJSuvW8y3VcPMrO+yhSLh4mmI3we7xIG7G0fc/K7A/b+ahUwOdcDSzwAk8QGE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=U3QF9A08; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MjHvrKRW; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65G65mmJ2699777
	for <linux-arm-msm@vger.kernel.org>; Tue, 16 Jun 2026 09:45:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	0aEEZ+OkgRg4egXxqmcIcO+IisKGYk8Fwd2iLOFyAnQ=; b=U3QF9A080EZPWBs6
	H2V2Y8Hb7OTLlO9XK7w34lQLF8XIKvwWeacYlq+dULEUwalseVno75iBhP9uGOVJ
	wsgqxBJWAcSogMyaLXrE3Nj2q38bMr2Obi6tBYGikOZJHhi8ivB8Xhhdd5TNhN6d
	GBALD4JTKbC4Xu7Nv55UIMrpQFHuUzdHSVwlz1Vj6fMxJbhxyeb0diOtvOypnlN9
	en6+Wg2uVcf/9UsKFQwwVwzeDIQ+SnAy8nRuc5pRfRjyJuZo9vkNjHOW8yDP9K1v
	XbJ9I/8f+ucs8L7pQeVKvwjjetVlptC86ch02lLJyZByiZj4HLQRDWDeytIg5KDL
	KB9Zsw==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eu09k93c7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 16 Jun 2026 09:45:47 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-5176891d0a9so10679301cf.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 16 Jun 2026 02:45:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781603147; x=1782207947; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=0aEEZ+OkgRg4egXxqmcIcO+IisKGYk8Fwd2iLOFyAnQ=;
        b=MjHvrKRWS20Xg5pInBp+IvYysNYLAIvY96Nd44K+c4wR62Zvve5IXfdqcIbVpEzYHd
         ey1UjxNiJYZn3KRNe9H/4BqwodlP89jYIvcsq8vn+bUExtZe+zVo1/SWn/95Vq42Hwd7
         cBMLeTa/+9UVC5V9cj0XUxIrsV1h+Mf0guH6QPxH4YL1MxfcIAWs6ejNIrNJpBL1HUcm
         Zi4SmPlNa3B1zNu+0SCoI+FinOEG73bnWRy4nxBckgC46rC1dFLAdOPdDhCPV49Q5jMO
         K24Okk63Rqi9523APfvdi864C9tMe8DjNgQm5JJ5M8XFt2Kmcb/5BIbakPGgK0MaRT9I
         zXaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781603147; x=1782207947;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0aEEZ+OkgRg4egXxqmcIcO+IisKGYk8Fwd2iLOFyAnQ=;
        b=bB4lyJ1k3v+Na5Y8YLP+9ICDMsc6uu+HmC17jEfY4N/k8s1DXz8ukqDRC0a9UG3EQ5
         bwUszaohkO92dt0FG2J1VLs0nCf3eP7+/SQUovkRSbTIsNfbZqieRUPTPZNvBSQ0hTxL
         zeSGJcaernB/C65g6HF1RrIY0xGNV8LIQPlq41HNrh9eNDX0TeMqTcOefzqT9e5yRrOF
         6qOg+Ed/uPZIAf1hzM0QlLAOx8YNYrDhaN0sE4L2Dh8wFidY1ZmJ51+g4z+/OziLiTN3
         lNrIKxP6/uK3KH1QXPopyfm1FnxZoJtg4EGszoYfmpON52sFKeoFJw9aizMPfvp8iNLP
         MbsQ==
X-Gm-Message-State: AOJu0YzEU98oyAy0CzkPwDPmmIp9psT2+vc8bIuuO9kWxbOSE5fj4M/K
	MNIjwnV/FD0GOdA4meRvynJU06kYe384bX56WRLYSdSOPk2bWNboJcXTIWKSwKlnotpdfQeYl8G
	0f2SUVvdpnr4uM946km1iGykLq78RL2xxd2Li4N5dicg593n0agocMKYzLnroTmJseamN
X-Gm-Gg: Acq92OFgMEiZNAGlkWomJsvteZdstz3W14i0AymmiLbC+kL/1Y3uCGfUShU284OCQET
	NQNEOx/WAoRemavOf8eXMwz2KpvRbJPmhdaoFw5eA8B9aPnc987GgpC/chdz6O9bVDW+lrKvWOJ
	8kIKrKmgYWwUDB435VC4yogCUajH5PajBZRqNzn9yobB55oIqDJEho2yySNvWKUjjCBEBjlgusI
	6aRTXnbX1UtnNjt0OddhKor9DwTzsC0s4nm/qrP3BbTLkKQ9lsDSUK0LpvWeGxy5x1CDVTRQ72Q
	puVs1pusaA4BfM1TcJfC33n7L3yHrgnIMD9O0DQEOc6m8U1UgGOP7Wj/aOwo0VcdrONtAOk8agS
	jZJVq3k8qiJPrtAAEWdg5ZL4XLs0587lTyLv6/oMq6J6YCQ==
X-Received: by 2002:ac8:5855:0:b0:50b:3489:5495 with SMTP id d75a77b69052e-517fe49783amr170523181cf.8.1781603147158;
        Tue, 16 Jun 2026 02:45:47 -0700 (PDT)
X-Received: by 2002:ac8:5855:0:b0:50b:3489:5495 with SMTP id d75a77b69052e-517fe49783amr170522931cf.8.1781603146627;
        Tue, 16 Jun 2026 02:45:46 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bfdb8341840sm623721966b.43.2026.06.16.02.45.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 16 Jun 2026 02:45:45 -0700 (PDT)
Message-ID: <511f53cf-0f1c-450f-b55f-cc7f3dcd73b0@oss.qualcomm.com>
Date: Tue, 16 Jun 2026 11:45:44 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] powercap: qcom: Add SPEL powercap driver
To: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>,
        Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
        Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
References: <20260519-qcom_spel_driver_upstream-v1-0-75356d1b7f94@oss.qualcomm.com>
 <20260519-qcom_spel_driver_upstream-v1-2-75356d1b7f94@oss.qualcomm.com>
 <7ea2f2cc-ef11-4727-810c-e32e815bd973@oss.qualcomm.com>
 <8f045340-a6c8-41c7-b1c7-6d9b87b05d90@oss.qualcomm.com>
 <fe5ff2e6-4c54-4b21-be5c-0f06bf0e6696@oss.qualcomm.com>
 <c85b658c-ea61-4d34-8327-2a0be2618611@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <c85b658c-ea61-4d34-8327-2a0be2618611@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE2MDA5OCBTYWx0ZWRfX/005RjZ+qfW+
 +R27khAGy3n07O2vAy8Iv2KV3N5svt7EpuMlI/EfzfPiA+gy/AcWssglg/Nlta9hUGSR5N7QY72
 kGoAedPVDUmgAUlnVmQA9BFsp/V9HCc=
X-Proofpoint-GUID: VU2pSEryX6Z5I_6B2Fn04b9CDNkp7KRJ
X-Authority-Analysis: v=2.4 cv=DoZmPm/+ c=1 sm=1 tr=0 ts=6a311b4b cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=iXSNKydA93grDqh3_akA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-ORIG-GUID: VU2pSEryX6Z5I_6B2Fn04b9CDNkp7KRJ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE2MDA5OCBTYWx0ZWRfXz2dt+7ZQY1Di
 D7zpcCyyF48r6Y5BgtlWcAr7YeUTR1En+0RY4D39hbwToqX6uc4HVhgkkFBTmbTJ8QjH4sL+zg1
 sm3zS8CNhymw9nklLQX3u66Dk/1ied9cnYhmcPgeJ+ExF7FoRbINzdqOFVN6V2OuiJC6si0NU2P
 R4hSp1iiH388W//cbDjDls+Z7JoRghvHn7/PkDjWPVP09nvpA1S+nUmJ8SWrvjobBizgjA3xpEp
 8PwZC5cIkBcIhluFTOcIf2ZO5+fX06Q1IDDiEQBjTwJASmLK3EAozt4AWDCjWyhne0+uEP8eEZp
 R5lDreZzq2Li7QRtIuYlVhd5UjbNUqcbxBn9PrI5W/mlDoD7arJwmHm40TQ2e941j0IJaac21RF
 L6F2ktzH3wCmk77L9qFUXyd/iO7leMYC/pyvktUEIjzfTPrEkFE7PpWuLNXr1G9taULq9GhwWJB
 lgevhqU7MSp1u7LX0rA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-16_02,2026-06-15_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 phishscore=0 adultscore=0 impostorscore=0
 suspectscore=0 priorityscore=1501 spamscore=0 bulkscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606160098
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-113355-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:daniel.lezcano@oss.qualcomm.com,m:manaf.pallikunhi@oss.qualcomm.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:rafael@kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-pm@vger.kernel.org,m:gaurav.kohli@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,qualcomm.com:dkim,qualcomm.com:email,vger.kernel.org:from_smtp];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 9BC4768DA9F

On 6/15/26 2:07 PM, Daniel Lezcano wrote:
> Hi Konrad,
> 
> Le 09/06/2026 à 15:31, Konrad Dybcio a écrit :
>> On 6/9/26 3:23 PM, Manaf Meethalavalappu Pallikunhi wrote:
>>> Hi Konrad,
>>>
>>>
>>> On 5/21/2026 4:46 PM, Konrad Dybcio wrote:
>>>> On 5/19/26 12:49 PM, Manaf Meethalavalappu Pallikunhi wrote:
>>>>> The Qualcomm SoC Power and Electrical Limits (SPEL) provides hardware
>>>>> based power monitoring and limiting capabilities for various power
>>>>> domains including System, SoC, CPU clusters, GPU, and various other
>>>>> subsystems.
>>>>>
>>>>> The driver integrates with the Linux powercap framework, exposing SPEL
>>>>> capabilities through powercap sysfs interfaces.
>>>>>
>>>>> Signed-off-by: Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
>>>>> ---
>>
>> [...]
>>
>>>>> +static void spel_remove(struct platform_device *pdev)
>>>>> +{
>>>>> +    struct spel_system *sp = platform_get_drvdata(pdev);
>>>>> +    int i;
>>>>> +
>>>>> +    if (!sp)
>>>>> +        return;
>>>>> +
>>>>> +    /* Unregister in reverse order: children first, then SOC, then SYS */
>>>>> +    for (i = SPEL_DOMAIN_MAX - 1; i >= 0; i--)
>>>>> +        powercap_unregister_zone(sp->control_type, &sp->domains[i].power_zone);
>>>>
>>>> Could you try adding a devm_ variant of these register functions?
>>>
>>> Powercap framework doesn't support any devm_* API, you meant add this support in framework in this series ?
>>
>> Yes, this should be fairly trivial - look at e.g.
>>
>> drivers/regulator/devres.c : devm_of_regulator_get
> 
> Given how structured is the powercap framework, I'm not sure it is so trivial. May be it is, but I doubt.
> 
> I don't think it is worth to investigate adding devm_ variant now (for a few lines saved) and diverge from the objective of this series

Might as well be, looks like the powercap zones are "namespaced" inside
powercap controllers, so it's not that trivial

Konrad

