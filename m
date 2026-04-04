Return-Path: <linux-arm-msm+bounces-101768-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eIbCDPHr0GnCCAcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-101768-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sat, 04 Apr 2026 12:46:09 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B876B39AD07
	for <lists+linux-arm-msm@lfdr.de>; Sat, 04 Apr 2026 12:46:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 4CB8830066B6
	for <lists+linux-arm-msm@lfdr.de>; Sat,  4 Apr 2026 10:46:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A93B02DA757;
	Sat,  4 Apr 2026 10:46:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TYkj0Mv3";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Arf8g6gg"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61C5814884C
	for <linux-arm-msm@vger.kernel.org>; Sat,  4 Apr 2026 10:46:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775299563; cv=none; b=fldFIWZWOxII7kbOEyg95W4qnzg1JNnhhKHlM/80JPZS3L5OdPS/15hfln3DJkKVjZNhcaRpM93Th15vY51iP7CZ2ymGqp0IVbyUkmK5SkYstsg4nbfTS/kebIN52wYmjeMJ996EY8FREP0CjZgtLntzmDToJTkGcMxrT0xqtVQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775299563; c=relaxed/simple;
	bh=aYrePvcUXovVni1iKaDN/7closkAZNMqTpAbBEJxOfo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=eW7azpFk0cB0FvauFs4nUdDo3taLgzzOvUx1U2jvRh7SakawuLVaWAiNC4dGjfac60/W5DQqMG8Xqp0fvVz9C+3Kn0e9AB+0TcEeviK63+lRvtsTMsEi7iMLPwmtmmB/ZLiAxK9fyexNm1khwbJIbKz7s2c4EkrlhrTPCEQFFCU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TYkj0Mv3; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Arf8g6gg; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6342XaKp3989112
	for <linux-arm-msm@vger.kernel.org>; Sat, 4 Apr 2026 10:46:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	6nrB6L8Mc+M9ITuIoXIfhrZ7HpsY2bfsSBniy3AVQwQ=; b=TYkj0Mv3Nqq5yWGN
	e95H09u1INlnEd9yrD4q/HCLS7fC+ct2jX2gEO5mwHzpqrlOTZGX9pAA+KwP54M6
	KRbZbF0foqQOe1nDE4xRp4ZNA60hYCr7jSoNMvfzgMVmVNRwThV9FnywZMLS1DdL
	Xfz3t8z3m3Uy/XuVjPBuHTMNurBf+0Qbl89gwtzHES+z7X2+imNyEp5pyOF7Ygag
	rXFX2X9lwcrHs/OAszZ4i/PhXj6tIOiHlGh1EcxPfeBze+DgTIVBzq6/RhZ3lS6d
	V0Zjwkhan7QBVfmnWvzHn4QS9Vf61l8P0bjcHUmU649kNgEQHjAZcAqqr8mz7PN9
	TVNjFg==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dasyfgqtr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 04 Apr 2026 10:46:01 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2ab344e3164so6672495ad.1
        for <linux-arm-msm@vger.kernel.org>; Sat, 04 Apr 2026 03:46:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775299560; x=1775904360; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=6nrB6L8Mc+M9ITuIoXIfhrZ7HpsY2bfsSBniy3AVQwQ=;
        b=Arf8g6ggki60AiFhi2ATRojuIERmS3eBn/Jmq9Gb4GThKDAq1EK8gKXxfOsn6ku29M
         9DuDwjSIoaRbhhX8VlTBbPVtYoidXNZp2Ab47XPHMUp/OudMldwnWjdBQbhMazKq2XEK
         MOOkawA2vndSh1Vr9wgk5bvwKNqvV5fp2MTym1lUyYk1RZVpd/Ik+gCYD0Bn+RqZBBPi
         NOV6e1FSqIK28xelz1KF3kJxP2k4A/9T+mrbMqdTcgnsELlbd6G3PpUVblZYCenEssr3
         zNwdaUy4NFkxQbkT2XcIU2mG/H/Y+7kte5VOK8G+6aqbPV1FDad3n80Q94huYcnpgy4z
         DlHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775299560; x=1775904360;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6nrB6L8Mc+M9ITuIoXIfhrZ7HpsY2bfsSBniy3AVQwQ=;
        b=WM83Jt0p0TdWAQfn/P4mYTyV/6jJfgIfHYwQ7tpH2Uv3S9tRvRDnEfisuC4bhyfUf1
         zcrZkHOZ87bvWcOreH9tU9NHPbSzmjutThB6EWyD/Uft76kSLX7206aBvBUz3+vHiAvW
         R0eWmIoxkn1UfVr0FjAOPk037AHnGar/6VKlPvnHbz1saDoL8Mc7S5F/9UIVryt8j/mu
         uGiMGAegfab8N5Gd1cwTmZV00d2B3clHinw8fjsRe6cw3T65fkBAZ2/fZ1omukiXzWDB
         /D3r5U8YbcFHpnW3oK9pprNeDxvF77DPK5EqhiabbU+OUu/pyCcF9oqRzgC4r3LEW3na
         3pjA==
X-Forwarded-Encrypted: i=1; AJvYcCX343nSJUFqnHVezw+TuL42QF9MiA+QMEaiXNH4HMCbDnqR9oCY5PMDqznG+Z/Kzi3hnr/F+JgzFdfu4hgr@vger.kernel.org
X-Gm-Message-State: AOJu0Yyn9vOYoezDl56NKnXA38Pd+mJD2E1Gs1bT4vnUzqwNfcowEbsJ
	LLzTPR0Ww6bjnB/+QGGedQwPJ+a1IkuzsM2V3XqfR2OyynpvZckVGcJa2/smf9L0o1MHTUws8zA
	fUpz0Yh8vwVvK4JqGUXiE0Fj6JGnw+hSxbgCs0sKTA+3sKp09OBUEUlhalJZS5q3F9rL/
X-Gm-Gg: AeBDieu9DQMUoHSjJKAG5uiwXYLtqvNCjSy7NOYoBcBwHqD95Js9jGSuaM3WW5+WkjV
	7bsqVvxf/i6Vc69cJ5x4t70tI6+KpIWLj4PgwQxkgmIkH8uFB+0Y5kt4ISDrLEDM+MCD1A2iAOV
	syXfIGysFVRrgyhzDwSAOdHY9wFZ8UuWyP6qBpHHxVrO2e2WHaU7jIbO4Bi8XzOOwH3T0mAQn3O
	A5ONsDwJL4jpSpFsD4A0E1KGUQCl7I659xhCoXK8/f25Prus1gcQPjL6cv2KAWVFCD4pat5qORZ
	tGkWtZ8fF5vTPsSjfAKcAkAT9fuFP9YFsmmhu5ZAaz4VfKjC9w+hTkP4110UjeD3z/Ihyf9Lms5
	veBN9EwmyDV1QFLeH54cznSjeGSBrOBjr++z8LE/SeO/YsoQVog==
X-Received: by 2002:a17:902:da2d:b0:2b2:67ca:5ffa with SMTP id d9443c01a7336-2b2815d8057mr36572375ad.0.1775299560367;
        Sat, 04 Apr 2026 03:46:00 -0700 (PDT)
X-Received: by 2002:a17:902:da2d:b0:2b2:67ca:5ffa with SMTP id d9443c01a7336-2b2815d8057mr36572185ad.0.1775299559862;
        Sat, 04 Apr 2026 03:45:59 -0700 (PDT)
Received: from [10.218.41.33] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b27472d20bsm83780095ad.16.2026.04.04.03.45.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 04 Apr 2026 03:45:59 -0700 (PDT)
Message-ID: <4d32e86f-353c-4951-89ca-46aa49d60f76@oss.qualcomm.com>
Date: Sat, 4 Apr 2026 16:15:54 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] dt-bindings: arm: qcom: Add monaco-evk-ac support
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Richard Cochran <richardcochran@gmail.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, netdev@vger.kernel.org
References: <20260401-monaco-evk-ac-sku-v2-0-27b5f702cfba@oss.qualcomm.com>
 <20260401-monaco-evk-ac-sku-v2-1-27b5f702cfba@oss.qualcomm.com>
 <7baeajhlqv6ujiqzmknjw3h6qr4mdw6qdywhaczm3c42pzjiue@nsgcbd4jsba5>
 <0f2612b8-5c44-4934-a625-27a66eeb7bdd@oss.qualcomm.com>
 <zyarcaimg67uivssnm4uxqiwc2jadolf5kx6moycwlbzhg4gmv@xa75wcpotzpr>
Content-Language: en-US
From: Umang Chheda <umang.chheda@oss.qualcomm.com>
In-Reply-To: <zyarcaimg67uivssnm4uxqiwc2jadolf5kx6moycwlbzhg4gmv@xa75wcpotzpr>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA0MDA5NyBTYWx0ZWRfX3wTTQCUkwXW5
 p1qI6HPulEUUQ9VCD/JPGyEdG3mVt2xiuwX1VeJN28kSEtKMDhGwivpl/bpA45wA+ADrMf78ZUo
 dKSq9CtcFGDKfGg+lJpZzAE5w0qqI2QyebprgGdzvKbNqjH97l0zlki26Ivp2/sqzeDuGyc37Zs
 8JfS/igfhWDyrRetwByQA8CjQe3qvhHXWXTxP9Wd6k4252h4mWx5D2YWoHb1Pq20xuWvQJJ78cu
 l+fSJrJOBNqIw7jHwmrexG6YaDdEByekCP8JGhfds7OIFToG1WDUZtCTRKhXj84iZPMQeLQ9rcE
 /gHRuIpAfb1UjwKGI2qbFwMQ76xI18BX2oFfYaWC8HrfJCT047gNYLjTRlnUVJ4a6pw5ECSg7DJ
 ZKoCrdWJthKjWZoharZo/NCVQe8qi09Sci8WXqE4FA1ULpF5MBKhvuDcUK2WmhxaOmZdA9TdCGS
 194ef2wwy1hM0Nsymbw==
X-Authority-Analysis: v=2.4 cv=U5qfzOru c=1 sm=1 tr=0 ts=69d0ebe9 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=tEkBMu-lKGZmCQ_eyYMA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-ORIG-GUID: YeB7VVaPsm0IvmG8KNNY25z1z2O8fIit
X-Proofpoint-GUID: YeB7VVaPsm0IvmG8KNNY25z1z2O8fIit
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-03_07,2026-04-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 malwarescore=0 lowpriorityscore=0 adultscore=0
 suspectscore=0 clxscore=1015 spamscore=0 impostorscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2604040097
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,vger.kernel.org];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TAGGED_FROM(0.00)[bounces-101768-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[umang.chheda@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: B876B39AD07
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 4/4/2026 1:58 AM, Dmitry Baryshkov wrote:
> On Fri, Apr 03, 2026 at 04:14:28PM +0530, Umang Chheda wrote:
>> Hello Dmitry,
>>
>> On 4/1/2026 5:06 PM, Dmitry Baryshkov wrote:
>>> On Wed, Apr 01, 2026 at 12:14:42AM +0530, Umang Chheda wrote:
>>>> Introduce bindings for the monaco-evk-ac IoT board, which is
>>>> based on the monaco-ac (QCS8300-AC) SoC variant.
>>>
>>> If it is a different SoC SKU, should it be reflected in the SoC compat
>>> strings?
>>
>> Monaco‑AC does not introduce any S/W differences compared to Monaco SoC
>> -- All IP blocks and bindings remain identical from S/W PoV, Hence
>> haven't included the SoC SKU in the SoC compat strings.
>>
>> Hope this is okay ? Your view on this ?
> 
> You are descibing -AC as the main difference between the kits, but then
> you say that -AC doesn't bring new software interfaces. What is the
> difference then between monako-evk and the -ac variant?
> 

The major difference between monaco-evk and monaco-ac-evk boards is that
of power grid. monaco-evk requires 4 PMICs (2x PM8650AU + Maxim MAX20018
+ TI TPS6594) to support higher power requirements of monaco-AA variant
of SoC which supports upto 40 TOPS of NPU - whereas this board
"monaco-ac-evk" supports 20 TOPS of NPU and has lesser power
requirements hence 2 PMICs suffice the power requirements (2x PM8650AU).


> Also, from the naming point of view, it is monako-ac-evk, not the other
> way.

Ack, will change this to "monaco-ac-evk" in the next version.

Also, should I change DT name "monaco-ac-sku.dts" instead of current
"monaco-evk-ac-sku" ?

> 
>>
>>>
>>>>
>>>> Signed-off-by: Umang Chheda <umang.chheda@oss.qualcomm.com>
>>>> ---
>>>>  Documentation/devicetree/bindings/arm/qcom.yaml | 1 +
>>>>  1 file changed, 1 insertion(+)
>>>>
>>>> diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
>>>> index ca880c105f3b..c76365a89687 100644
>>>> --- a/Documentation/devicetree/bindings/arm/qcom.yaml
>>>> +++ b/Documentation/devicetree/bindings/arm/qcom.yaml
>>>> @@ -918,6 +918,7 @@ properties:
>>>>            - enum:
>>>>                - arduino,monza
>>>>                - qcom,monaco-evk
>>>> +              - qcom,monaco-evk-ac
>>>>                - qcom,qcs8300-ride
>>>>            - const: qcom,qcs8300
>>>>  
>>>>
>>>> -- 
>>>> 2.34.1
>>>>
>>>
>>
>> Thanks,
>> Umang
> 

Thanks,
Umang



