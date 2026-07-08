Return-Path: <linux-arm-msm+bounces-117457-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id lLM7NWuqTWp88gEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-117457-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 08 Jul 2026 03:39:55 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A479720E13
	for <lists+linux-arm-msm@lfdr.de>; Wed, 08 Jul 2026 03:39:55 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=ShLeWp18;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b="bYCXU/mT";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-117457-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-117457-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 2A766301CC12
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Jul 2026 01:39:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 262773AE188;
	Wed,  8 Jul 2026 01:39:52 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C04CE1B87C9
	for <linux-arm-msm@vger.kernel.org>; Wed,  8 Jul 2026 01:39:50 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783474792; cv=none; b=s81H2kYXJRwwLDOMZxDQkj2Ldxp4X1piSSMiGYSQcBLY5eusrWrh/pDbtiIaGQ3WEjT389tYrvp7HafLbJGJUbC2RHR21WhdJzX5gJKhlLNPOGtA2o7+bLhji8ueJF0rwPh6TD93z3459duwsbAG70CmucZpYp+nlFxM9CmQl1s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783474792; c=relaxed/simple;
	bh=yCncyE3KlpVre3IkDw/pkbr47CSxW+I8kefLdPBj2hI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jSYvLKNqcaWRacetWrubTp+QAPV4YzWkqiWmaSdgXvsJTy7DfdjlYJ6846dMooL6CH1WgKqUTSnhRO11w8qeByxKKuyVOxdrRfgbuVC3b5K7shWpJMBhM4NvcVb+kfmYzFqfoYXePJnmGRe1GfF7EflwHguhAIuP+k1RxS0nqjA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ShLeWp18; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bYCXU/mT; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6681K1eT1340494
	for <linux-arm-msm@vger.kernel.org>; Wed, 8 Jul 2026 01:39:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	dg9S1ReWnO628QueH5exSmyzBX+YB3dCIncjF9Fit/g=; b=ShLeWp1829Zxz3pA
	rMJbwZSnB2Xcv3uwTMUpd1+DyUEnB55gn/RL6XWzE8sy/behNltJqmhsGvECKcx4
	uAxHXwvYP1VbU2VZP1+AGtkEBKI9b7RqgjbkjZtcoOOV2NRXPeSohZDRsnm0EszK
	WTvCIApwc8Fug0aA0dxrkxMr9ofoSrbLPwKqKCbJC9fr2MJDDtAJmwtQBYRuDKCn
	54YCcvaokUjdU9eIbC896aHZNSf/4KnXYRjRD9qjFPrJAdnoPaSUWj6Us4A7KHMu
	4HD1IEMn470zVEqPsBsVVnsQdb+wLSYMobEkBoW/pd5lKNcYLSF1r9GWv3VUMmT1
	Z+l3kA==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f9csw81ks-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 08 Jul 2026 01:39:49 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-3811279d51aso374139a91.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 07 Jul 2026 18:39:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783474789; x=1784079589; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dg9S1ReWnO628QueH5exSmyzBX+YB3dCIncjF9Fit/g=;
        b=bYCXU/mToj0wPvRUigk8IlKr9inIZNhdW3OvCRJ03+5uoOQpS3oT87iRxexIHGRmHJ
         bRaEaaVzK8kf1Fl0EicdDDVJIZ3UlBo6euqiEJUArPjpnUiTOnpqNKI0OVMtFd6SzUcn
         n19bKYhJfBoXGizl4iboFLxDRC/bKq73wciZgsYct2Cl4eoIfPB+1A29a+Kb1b/zA0Tc
         jeyKtoez6mNEy/kFgD/AfkCQCoX1PdgkL4XtfUjLC1xxotmAxTkP9J/MhYbrpj8o/8Hd
         /+bJP3M4/qkKtybiZwl8Xr888DA5iswrkNmbkasEl9d7jPF1PmoZWdJ13+iClYEIFp7w
         5LEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783474789; x=1784079589;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dg9S1ReWnO628QueH5exSmyzBX+YB3dCIncjF9Fit/g=;
        b=CuPDwK1g9KJMm9D/8Tno2nMPfeldowDfXhGJE1h+wjh0TWly/i4d0MxxF7OMBi+RO1
         qn5RDOdQt108Wxk+TpOsceO7pTbyTSexdvj3W59pcld6aMNrrU/CXyv8u2+ZXUdRi/fD
         pafmUkRKsBTDj7raE6zXf9kPwmy/lT+BCUmCd6cw2fExnAvsiuCe442qr1Ys9Y+foorc
         F9VaA/gkzXkGguLr0rEkmFUErDv25phyiVExwIf0AZFkKEt2/a+mGEzJrb36cr6QyYir
         T/3CKJUbOViSUjZD2hZnmli7f0KSliIqgL46UgU9Rt6ua2Gzm1lruINW5K8Ii94dFMuv
         82Aw==
X-Forwarded-Encrypted: i=1; AHgh+RpwLR7T2HDi6agutGuKAJk3aC+uy3O6uMQ/2HHceUnrX6k4AhfzqOD2q3C34QCUlpadh05t+Uke+JRGwm3s@vger.kernel.org
X-Gm-Message-State: AOJu0YxaKJWgHdZtePF1vfnjMnfkMsRkMr7HvZPtdxsuy7Shl/lN1wxJ
	s6je0GjSPOIxzecCOnIR89vC0KAqa0yGWG1caZNSk3MxwfLqW3+t4xkxEwPDHHd8vI6K9StwGF4
	ExQareowtUP48jjYfAsMBYbh6FqFxYBRiu1aORzQA7SO1GSRr8J9JV/n9fE0SM7gz8NV1
X-Gm-Gg: AfdE7ckcoaAMXPVptNOEcASWZS8Bhvm82dKd9lHrVGiSZ7QUS47w0lxYFKWv4KLSeD7
	lsad99i5vYkogUfuT0lA/pWIYR0D7gQwvEvUQ7CrxeUpqUd7TrisN9vClbmnhbTHezVDgdYRVDI
	YGsy323OcEnEP0v37H9PGHP/htYjcJz16+tvwWmyEt2ZyjeD4KXGEjGqT3foTbnlOaZ4fp2/aj1
	b7AcPu7HE3QEco//uqIJhiuDrL1LBDl5bqhtIzvehz+bu2mcpxzMUvAs8sEE8fApsKdsj2yjvT5
	rS8TLxIFNpQ7viKaTjR5TrUXkL+1giXJ5WaUdeL3+LWH7UYYSivt0oo73/46O7SZ4Kc1ViXYU92
	wMyXMSoGrGhP4dHpchbg4qH8L9AGykMXMI0AC7NKB+Yob69OR+Rt0eADtEngdq/XqhL5Ofpdiq5
	/q
X-Received: by 2002:a17:90b:2641:b0:387:e0db:3fab with SMTP id 98e67ed59e1d1-389424990fbmr352064a91.36.1783474789006;
        Tue, 07 Jul 2026 18:39:49 -0700 (PDT)
X-Received: by 2002:a17:90b:2641:b0:387:e0db:3fab with SMTP id 98e67ed59e1d1-389424990fbmr352017a91.36.1783474788369;
        Tue, 07 Jul 2026 18:39:48 -0700 (PDT)
Received: from [10.133.33.179] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-387d17ed52bsm1853284a91.11.2026.07.07.18.39.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Jul 2026 18:39:47 -0700 (PDT)
Message-ID: <3547c76e-0b6a-41e3-9ce1-e7ff652b199d@oss.qualcomm.com>
Date: Wed, 8 Jul 2026 09:39:42 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/3] Enable CTCU and ETR devices for multiple QCOM
 platforms
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach
 <mike.leach@linaro.org>,
        James Clark <james.clark@linaro.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
References: <20260204-enable-ctcu-and-etr-v3-0-0bb95c590ae1@oss.qualcomm.com>
 <545b4ebb-2c7e-480d-80bb-5e08dd3c52a7@arm.com>
 <f2f23d0a-dc24-4a06-948d-56df913994ba@oss.qualcomm.com>
 <6b7294a1-8c13-42aa-9f64-5b5c9af0b41f@arm.com>
Content-Language: en-US
From: Jie Gan <jie.gan@oss.qualcomm.com>
In-Reply-To: <6b7294a1-8c13-42aa-9f64-5b5c9af0b41f@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: Re6uWFjUCz5LWqoeVv9vyGGB2IoxjP88
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA4MDAxNCBTYWx0ZWRfX49ULCTWzP7zv
 ZWYyY1NAa51FI0YD3ESG4Ls6pMq+hp4FAbUSQl0RL73EoLqVNiHxxnWfAce1hFv5+S6h7y8XNit
 0Qmu0C4DJAPgIK0R13uI/nq08v4oTqY=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA4MDAxNCBTYWx0ZWRfX790uavn4HPlJ
 dSjAvV7LAjogcvMplvYtnSSC82Sbwe3QWUazuHp3rhzpUuhorR2Wcu6+ns6YYakaJ/SiG0yiyTp
 8R88bCeOvXLifgNO69asIALSmj8eDHB76W6tdyia80qs881ETvqLcUKJcIniO/OzRWRHsAyN+Kk
 bVaEQk4J4z6/ev+f+OET1utkkYhCOcG/C40AjG1AdDtBix20lJBuT6uQdRPViAvCYbDIr2RKrbu
 qaVjSeVbmEH4tRV6d9UhGslcE5P1gB+Je//dOxE5bbDGD5mzDwvzzMymUuqe5dTRkLuRi7RiFvj
 u2g7HD8+QWsrgX8fPdQCYnEEwUHrV/jB7eOynwT57xVeZiH8mYjfbzkpNOJWB46WBMEMUwlTyD8
 oF5OWSuyP6N1wniAeC10Fz+WclI1EmG9vaKMyUUeH/q3rSEGQmIA+/8Xxx6Nf0XvRQlLrZtXuaI
 D2ESkgDrwEOeiKW3c3g==
X-Authority-Analysis: v=2.4 cv=HaYkiCE8 c=1 sm=1 tr=0 ts=6a4daa65 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=VwQbUJbxAAAA:8 a=7CQSdrXTAAAA:8 a=EUspDBNiAAAA:8 a=Z8Xz-ZLPEYxu-CxkxF4A:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=iS9zxrgQBfv6-_F4QbHw:22
 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-GUID: Re6uWFjUCz5LWqoeVv9vyGGB2IoxjP88
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-07_06,2026-07-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 lowpriorityscore=0 clxscore=1015 adultscore=0
 malwarescore=0 suspectscore=0 priorityscore=1501 spamscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607080014
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-117457-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	FORGED_SENDER(0.00)[jie.gan@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[15];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:konradybcio@kernel.org,m:suzuki.poulose@arm.com,m:mike.leach@linaro.org,m:james.clark@linaro.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:tingwei.zhang@oss.qualcomm.com,m:coresight@lists.linaro.org,m:linux-arm-kernel@lists.infradead.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:konrad.dybcio@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jie.gan@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 2A479720E13



On 5/29/2026 7:10 PM, Suzuki K Poulose wrote:
> On 29/05/2026 11:26, Jie Gan wrote:
>>
>>
>> On 2/27/2026 6:10 PM, Suzuki K Poulose wrote:
>>> Hello,
>>>
>>>
>>> On 04/02/2026 02:22, Jie Gan wrote:
>>>> The DT‑binding patch adds platform‑specific compatibles for the
>>>> CTCU device, and the following Qualcomm platforms are included:
>>>> Kaanapali
>>>> Pakala(sm8750)
>>>> Hamoa(x1e80100)
>>>> Glymur
>>>
>>> Given this is predominantly DTS changes, and there is very low chances
>>> of a conflict with the binding yaml change, I would recommend this to go
>>> via soc or the qcom platform tree.
>>>
>>> For the series:
>>>
>>> Acked-by: Suzuki K Poulose <suzuki.poulose@arm.com>
>>
>> Hi Suzuki,
>>
>> May I ask is there a chance this patch series could go through the 
>> CoreSight tree?
> 
> Like I said, it is mostly Qcom platform changes. So, I would leave it to
> the appropriate channel
> 
> Suzuki
> 

Hi Bjorn/Konrad,

Gentle reminder.

Could you please help to review the patch series?

Thanks,
Jie

> 
>>
>> Thanks a lot.
>> Jie
>>
>>>
>>>
>>>>
>>>> Since the base Coresight DT patches for the Kaanapali and Glymur
>>>> platforms have not yet been applied, I created DT patches only
>>>> for the Pakala and Hamoa platforms. I will submit the Kaanapali
>>>> and Glymur patches once their corresponding base Coresight DT patches
>>>> are merged.
>>>>
>>>> The Hamoa‑related patches were posted in a separate email, and I
>>>> have included them in the current patch series.
>>>>
>>>> Link to the previous Hamoa patch series:
>>>> https://lore.kernel.org/all/20251106-enable-etr-and-ctcu-for-hamoa- 
>>>> v2-0-cdb3a18753aa@oss.qualcomm.com/
>>>>
>>>> Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
>>>> ---
>>>> Changes in v3:
>>>> - change back to the numeric compatible from hamoa to x1e80100.
>>>> - Link to v2: https://lore.kernel.org/r/20260203-enable-ctcu-and- 
>>>> etr- v2-0-aacc7bd7eccb@oss.qualcomm.com
>>>>
>>>> Changes in v2:
>>>> - change back to the numeric compatible from pakala to sm8750.
>>>> - Link to v1: https://lore.kernel.org/r/20260203-enable-ctcu-and- 
>>>> etr- v1-0-a5371a2ec2b8@oss.qualcomm.com
>>>>
>>>> ---
>>>> Jie Gan (3):
>>>>        dt-binding: document QCOM platforms for CTCU device
>>>>        arm64: dts: qcom: hamoa: enable ETR and CTCU devices
>>>>        arm64: dts: qcom: sm8750: enable ETR and CTCU devices
>>>>
>>>>   .../bindings/arm/qcom,coresight-ctcu.yaml          |   4 +
>>>>   arch/arm64/boot/dts/qcom/hamoa.dtsi                | 160 +++++++++ 
>>>> + + +++++++-
>>>>   arch/arm64/boot/dts/qcom/sm8750.dtsi               | 177 +++++++++ 
>>>> + + ++++++++++
>>>>   3 files changed, 340 insertions(+), 1 deletion(-)
>>>> ---
>>>> base-commit: 193579fe01389bc21aff0051d13f24e8ea95b47d
>>>> change-id: 20260203-enable-ctcu-and-etr-31f9e9d1088d
>>>>
>>>> Best regards,
>>>
>>
> 


