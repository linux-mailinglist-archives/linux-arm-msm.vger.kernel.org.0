Return-Path: <linux-arm-msm+bounces-100718-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8E1wMxlCymky7AUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-100718-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Mar 2026 11:27:53 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 8877B3582E4
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Mar 2026 11:27:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 0378D3025F70
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Mar 2026 09:24:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 748593B0AFD;
	Mon, 30 Mar 2026 09:24:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="W0A7UMcQ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fLFhXUWt"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AA343A783B
	for <linux-arm-msm@vger.kernel.org>; Mon, 30 Mar 2026 09:24:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774862673; cv=none; b=gPKtZfMoNCDdkyXkqhVJ4LpvbXW5JVD3oVD5kyhUSoTWF8+3Qy80UTCw8bg/fbL4G5pEiyjDgNaZHiIZej2CbdhqbT5Gms5Jfpk1NXfprc22yvgmU7Hz7ACKFRVc+doL5C0JIp3fSnkAf9mm6ecqlGZ8uhIXcCgzL21BOsOlshs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774862673; c=relaxed/simple;
	bh=8FQXuUJcpQtjfEVJtChfXvc2WhQ4oxNz4YnKC3fcVzA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=pJUU74YJPyfGTYd7oZyF7xVmsXFP6J5TomCyIX1RSZQVx/oHKg78IKqdQhWGBgZukEU7+VeDO1DTLXqjMznU+WpZQlPb7IvlvDfptzVz0rZCoFPwFlr4tXi2nLcQvZW4X7MpBZLiFkSjC43W8BaL0wiV+Ds8uKFpC/RnL6vX2To=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=W0A7UMcQ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fLFhXUWt; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62U6R9DE3332318
	for <linux-arm-msm@vger.kernel.org>; Mon, 30 Mar 2026 09:24:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	8FQXuUJcpQtjfEVJtChfXvc2WhQ4oxNz4YnKC3fcVzA=; b=W0A7UMcQUcZUv9aq
	AmNzC5rDL+GDEARwmB09E08qB+h0snZhmcJjHjPAo/7oRj2pTpgytzz40wDAZzyh
	0E/2UgGa8tS7CtYDrlJD65vootkyH8+x5dG4Du+OOA6/ZdyCdet3pn0dKCN/c9nN
	WBN+Q7mrjwjeFIAr9V1JmVQxTrP9cOHv6cZZZPns1uhWziOtoaI+iIl8lTZdhCon
	EL5sBdNWzSS7U5RHcuRTsBGMx+N1xPrm8vC6lzKE0/ZmkdGXUT5Tx9H/OKFOzzG6
	RLvH4UfLG92KbAD6jPLvtXo1Z1Z69I0wHiYlpIzZdBaaQX/JhTKjkk5c/0ARPUJK
	NXuNxg==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d66afwh1c-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 30 Mar 2026 09:24:31 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8cb456d53a5so126417285a.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 30 Mar 2026 02:24:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774862670; x=1775467470; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=8FQXuUJcpQtjfEVJtChfXvc2WhQ4oxNz4YnKC3fcVzA=;
        b=fLFhXUWtqiHKWy+V+zgc0cxlOw1rdIstZF2YAxMNfg1eSCM0pwyuPlCj/myFuXpAhM
         6mwZnHoYJcbTtNvgh3ncpT4dEqI0xUEJWriGdhlT/TmanR/YljHfkyLqGkYiWrThQQFP
         xLCJc+OAu7hw3GLYw6vVLAfclTCIkY4MAhDMnhJYfVkZvnyLITjGniwUnPBLKWfCcsoF
         RyOz0JvG9FqB+pN/n6PCfDTnsz+gO/d0fOa/FOT4K4l91k1oo9HbXwOMVMb24Iz9YfY5
         jLwBco5/sLRRhGF64BlsAPPodVoDNlj13As7fFyHuARHjk82N/PLEiXnAscnF3Ds1Er/
         EXeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774862670; x=1775467470;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8FQXuUJcpQtjfEVJtChfXvc2WhQ4oxNz4YnKC3fcVzA=;
        b=JPjmtiw1BmWmbKYmZuqpinfsAJ2s67GDoIU0Kb00/irlmHpHoXyaqaKfa87Zhj0YB2
         z/tfZEiSCFJ8oayYfYZeKDHqbDoqTBPaXfvXJBTJQprqNverWPODPKanqr9x8/UKJ8Ci
         eves9MsGgU2S79dyYSiklDTk234rRTaSmc5BAf9LxNEtIQEXfEkcVSxbOuuqSqBf3tB6
         0nNbmZzjwwdueMhrL7Go0q+zKlFDkGLi9zjvLL3YDqxtRP2IzZ5AfbPQ7XhlqVuTKmTF
         K6Xl7p7bR9FWWwFoTEUMbD17pKa+x6qEEkyFBMq19MantUO6CQaLlsHpFTqiMCYx+cD/
         yiEw==
X-Forwarded-Encrypted: i=1; AJvYcCVqu2TFihzjnjaXuIAawRdx3gDnIR9QmgfLlS8s3afnAqJ/h2uytwj1uEbtWBPanjJ9KWI98Yz1KwQv4rVk@vger.kernel.org
X-Gm-Message-State: AOJu0YwQHHM1ziq1y9np71UC2jcbKwFdAkLLG1USUFVOMM9iOVxdoOyW
	W+dxNPLc0nvk1LXOLD9xLTV3oRToenyGHxv3JaO1t+Hv9pfFl1B2tmXJ54kCGtcVSNlBxlsCNIg
	4jWLD3dTDz9mZly4LZTl/WkML03bold59gmjNgcsg3+AvHqWVbEBkekER+TFdk3NbkAY0
X-Gm-Gg: ATEYQzxaj+iHK1LmJjzxids7fa3MzyieQF1DmDm5Rxu3CD3/dLRrKQn/2fCRQFVlaZ7
	kJofYOjnhVWMOx81aItV7JvZONp4wUdfRP/EqGd4Go0gYV910s0mIP20GXp/KcCQuC80ox56Mqg
	OwA8Wh2c42pPw42XZfziLuEWGIpBEu26NkjO1JTCwkdZ2cDnaEAxMS3NoskaLEMlvWHEnM1H4XV
	6XD77zBz5llulmSw9uCPk4z7/GIw0fRXUDP+xB14ZCPj3dsV+nwrmfhxX28Stu+hISxeUaalznH
	nw9zzcuqvAdigMSbUmrvsWEHY2Y/TleSFDFFwMEWpkAmuAh4rwDcOeJMp0CY3ejQXiM6suFmd/2
	plRXOJ5iwYz6cbrgdinpQkt5TcKjw2bo9pZZYKHa/Uq4MfnQ6WkLExVhaO0K6Qd52DT4WSSaUcv
	QpSB4=
X-Received: by 2002:ac8:7c53:0:b0:509:47e2:9df3 with SMTP id d75a77b69052e-50ba3819907mr122971941cf.1.1774862670341;
        Mon, 30 Mar 2026 02:24:30 -0700 (PDT)
X-Received: by 2002:ac8:7c53:0:b0:509:47e2:9df3 with SMTP id d75a77b69052e-50ba3819907mr122971711cf.1.1774862669917;
        Mon, 30 Mar 2026 02:24:29 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9b7ae24151sm263968066b.8.2026.03.30.02.24.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 30 Mar 2026 02:24:29 -0700 (PDT)
Message-ID: <5de59ab0-4249-4396-85c9-e8501bfcc35b@oss.qualcomm.com>
Date: Mon, 30 Mar 2026 11:24:26 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/7] dt-bindings: power: qcom-rpmpd: Split MSM8953 and
 SDM632
To: =?UTF-8?B?QmFybmFiw6FzIEN6w6ltw6Fu?= <barnabas.czeman@mainlining.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Stephan Gerhold
 <stephan@gerhold.net>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-remoteproc@vger.kernel.org
References: <20260327-sdm632-rpmpd-v1-0-6098dc997d66@mainlining.org>
 <20260327-sdm632-rpmpd-v1-1-6098dc997d66@mainlining.org>
 <ocrzwxmr256h3ef7ifwx3z6jgtzubiha3forfi7nao6gakb6wu@recertxxhlip>
 <39a320e472ddc6d44c950a995b577e77@mainlining.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <39a320e472ddc6d44c950a995b577e77@mainlining.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: rDtMqXcEyieOAfWZA4d9zlDI0VyjB1hb
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzMwMDA3MyBTYWx0ZWRfX18nQ1RiqpSbi
 rqR+Z1Ml6o5pfMCCp8DYaXPUjaws90m0NcCVjqD3eHhQwQqJRbqqMDaNK7jGwZzD68r3CAmCzVG
 /yHBVKLKKYT1vMQ6U6rOjvMm+VRBmHlPloru/oIwnNlGZBxT5gHesdgUCSPlJCoo7O80LCGelsx
 cHDjZgg+WYeYV7n4Rk8wsCEw2P+qdhgrPGtroU81FpTJdQp+KqjfUPm9N1p18/2j3ZSZ4IwBz9k
 4sCEo4/CLoA/7Dml99BotoKIsvXlZbX1DFcMuVU9JOUH0gdqAjPCvYQ0DCL5R/gNK2H4XkP1YVg
 ntdE+ClcZBBgJS98v4s5D5CIPCqxb2NU+cX8OknBt4pMiiNJPhJ13zGcaqN8KB/Zmpfg2CM18aF
 tO3pmw32i5KOFHlt7z9AS1/Kp7ivufJzLmKOFHtZxBQyEKehN9Tv4oReWZnrVqEiZEkNi46/0LL
 BiuA4TCinEYbj7z2ePA==
X-Authority-Analysis: v=2.4 cv=KN9XzVFo c=1 sm=1 tr=0 ts=69ca414f cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=OuZLqq7tAAAA:8 a=svdJbqrqvjlJHIucFT4A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22 a=AKGiAy9iJ-JzxKVHQNES:22
X-Proofpoint-GUID: rDtMqXcEyieOAfWZA4d9zlDI0VyjB1hb
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-29_05,2026-03-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 lowpriorityscore=0 phishscore=0 spamscore=0
 adultscore=0 suspectscore=0 bulkscore=0 malwarescore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603300073
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[15];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-100718-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,mainlining.org:email,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 8877B3582E4
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 3/28/26 9:22 AM, Barnabás Czémán wrote:
> On 2026-03-27 21:26, Dmitry Baryshkov wrote:
>> On Fri, Mar 27, 2026 at 09:11:43PM +0100, Barnabás Czémán wrote:
>>> Remove modem related bindings from MSM8953 rpmpd because MSM8953 MSS
>>> is using mss-supply as a regulator usually it is pm8953_s1.
>>> Split SDM632 bindings from MSM8953 because SDM632 is using mss-supply
>>> as a pm domain.
>>>
>>> Signed-off-by: Barnabás Czémán <barnabas.czeman@mainlining.org>
>>> ---
>>>  .../devicetree/bindings/power/qcom,rpmpd.yaml        |  1 +
>>>  include/dt-bindings/power/qcom-rpmpd.h               | 20 +++++++++++++-------
>>>  2 files changed, 14 insertions(+), 7 deletions(-)
>>>
>>> diff --git a/Documentation/devicetree/bindings/power/qcom,rpmpd.yaml b/Documentation/devicetree/bindings/power/qcom,rpmpd.yaml
>>> index 8174ceeab572..659936d6a46e 100644
>>> --- a/Documentation/devicetree/bindings/power/qcom,rpmpd.yaml
>>> +++ b/Documentation/devicetree/bindings/power/qcom,rpmpd.yaml
>>> @@ -48,6 +48,7 @@ properties:
>>>            - qcom,sc7280-rpmhpd
>>>            - qcom,sc8180x-rpmhpd
>>>            - qcom,sc8280xp-rpmhpd
>>> +          - qcom,sdm632-rpmpd
>>>            - qcom,sdm660-rpmpd
>>>            - qcom,sdm670-rpmhpd
>>>            - qcom,sdm845-rpmhpd
>>> diff --git a/include/dt-bindings/power/qcom-rpmpd.h b/include/dt-bindings/power/qcom-rpmpd.h
>>> index 4371ac941f29..2d82434b993c 100644
>>> --- a/include/dt-bindings/power/qcom-rpmpd.h
>>> +++ b/include/dt-bindings/power/qcom-rpmpd.h
>>> @@ -84,13 +84,11 @@
>>>  #define QM215_VDDMX_AO        MSM8917_VDDMX_AO
>>>
>>>  /* MSM8953 Power Domain Indexes */
>>> -#define MSM8953_VDDMD        0
>>> -#define MSM8953_VDDMD_AO    1
>>> -#define MSM8953_VDDCX        2
>>> -#define MSM8953_VDDCX_AO    3
>>> -#define MSM8953_VDDCX_VFL    4
>>> -#define MSM8953_VDDMX        5
>>> -#define MSM8953_VDDMX_AO    6
>>> +#define MSM8953_VDDCX        RPMPD_VDDCX
>>> +#define MSM8953_VDDCX_AO    RPMPD_VDDCX_AO
>>> +#define MSM8953_VDDCX_VFL    RPMPD_VDDCX_VFL
>>> +#define MSM8953_VDDMX        RPMPD_VDDMX
>>> +#define MSM8953_VDDMX_AO    RPMPD_VDDMX_AO
>>
>> Well, no. This is an ABI break. It will make previous DT to stop from
>> working. You can drop unused indices, but you can not change the values
>> used by the existing domains.
> Do these indices never can be changed?

Yes, values in include/dt-bindings are supposed to never change

Here you're e.g. changing the "msm8953 domain 0" from translating into
VDDMD to translating into VDDCX (because RPMPD_VDDCX is defined as 0)

Some other older platforms were converted to use these macros, because
the indices happened to match

Konrad

