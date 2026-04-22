Return-Path: <linux-arm-msm+bounces-104135-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UEypN3na6Gm8QwIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-104135-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Apr 2026 16:26:01 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 60FE04473D8
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Apr 2026 16:26:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 33B66305CB8D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Apr 2026 14:23:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 505E430F92D;
	Wed, 22 Apr 2026 14:23:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Myfrbeou";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XrWL2i89"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0563F27467F
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Apr 2026 14:23:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776867828; cv=none; b=L2TkinenmG6MMX2FLFKLvoD0Vo+tx/GmNaIIV6oQchIolmmFqiauGuUSEWkyOvnM15zI+PSv/EcGhKppgxP+Dh9wSCdOfCJMoEWqXFeSraavZObQb2crVUixaA5IiFG0l/40ykQ0tZAeA4nv8o+JluYS01bvRxd9dVBKTW99ukw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776867828; c=relaxed/simple;
	bh=itOHdZjnFmrjMy8RGLFE82HDcK05BSSyTxvDpujNSzs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ZBFy8JfyX2uF6h5D3Kf0AWtUtrvdQL7zmLpwil8hgbWmRzb7/VynvSmWz7SBBl96GgLjoQFkMyS4Lq4SY0In1XsWUYoiU8DquvoFHS0m5NQsN3thdstQr+EPPpsgsuW13/9PQ6+nEiodwOmcperEzyqVMjQjfTt04noxbiW9HH4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Myfrbeou; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XrWL2i89; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63MB0niC3083048
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Apr 2026 14:23:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+pfQsvTwLUI7BKLOP1FvBzhCol5UrXHb5S1pHKsq1fE=; b=MyfrbeouSSC8PKR0
	fZSYNFBNZhvALBr6c6P1H/R7eO8FV3l3mFfbotl1xyyoun7UIjmGcm0mg0+axbCv
	4QZ4fbEWsoyRd38qrOSRWVGge/HaeKf4oTKVx5RNbxzajp6oI68IatAX8+t0J2iB
	z6JcIpRT3AWOBgI5lPSO79VVhBLyIlJHRwADzJmNG1z7ojz5XSoJbHuKuqaMSy+x
	TEfYcGh2XC0x51Pi7hLilODZS+oOCuXgyqC1fC+cEape93MQnpvdiSr01CEHh1KH
	G46KZFYIn608eWZrI6JAAMbbT/DBJaPsdHgm1/Pxse70tiuufM9DNUqQz7fO69U0
	vQ4eQg==
Received: from mail-vk1-f197.google.com (mail-vk1-f197.google.com [209.85.221.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dpenmkvvu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Apr 2026 14:23:46 +0000 (GMT)
Received: by mail-vk1-f197.google.com with SMTP id 71dfb90a1353d-56d85c53a3eso465184e0c.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 22 Apr 2026 07:23:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776867825; x=1777472625; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+pfQsvTwLUI7BKLOP1FvBzhCol5UrXHb5S1pHKsq1fE=;
        b=XrWL2i89tptt+5s75O+lHi94XaiHDI9/JBYMqtYp4vTfXqDtuPMcOu/91tUHTsE4lz
         hY7+x6W9jSp+J/M9zwt6kZ92UufCL/NSlM2RudxuctotVENxy4qKwmaBjiAlslUigeHk
         kwkh/NUB9iSrXSp4YYjQTcFeRRBN045dz3MHX+8T/JsHaB+nLEjUyUYn/tAKtAALA8nk
         xtp+AkQN/JdE1gbPTAykKcHjCYXWKwPtq4eJVaxa4mmRGKP3tk1IyMNAQ8iy3i+mh1qB
         j+KKcrz0xLq2ANbXdhmEyKkMy233roGnIXq4O6xdcxyFgialT0EcBuAYn7m2JaxhDVsI
         5d9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776867825; x=1777472625;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+pfQsvTwLUI7BKLOP1FvBzhCol5UrXHb5S1pHKsq1fE=;
        b=E9VP/mn0S1R7n/UBUAVrmGAaagkRs42J3WMK/u0LzIC5Ahg+/KvaddNPmOdpM+14d2
         jWDdAWwHQwJRyL6F0h8IXKKUMXGes3QCCVEXuBJmJTOXAImBAYEJZKJFQeQ1wNUClQCv
         mlAsL7g+QV2N4jsc6kd+qDXMS+V/RjOWMPcf/W/rwERz+lzDKJVRoPpBzlK7bPYtUbCN
         5jc9lZ4kJU2UztT1Wc/Zh74x1jQ8XNgG6Zm42l7VIYxzkMFHlzNmxvmWxifvX/k/SBJz
         WB41AyncSRgOz5hKDEnHaeY2XGDzK746pd5kS0DvonZseDgQt4Mv9d1Ki4nlD316aYF6
         m+yw==
X-Forwarded-Encrypted: i=1; AFNElJ8dyjiXrnd/NVBxLJ0aDTNrNuovhcV2RT4yaeNuvFU6wbLRNUHBLLL3hXzxmFxpcbJXFFyvE63eVSw/kY2u@vger.kernel.org
X-Gm-Message-State: AOJu0YzEaVOhuuyOrqIiCRR+u3zUS8QTkUIHz0HkGLtEHHDM5qFKiiMa
	3fMEVchRyG3C6zg2Fzjbkx7nJyaeQiRzeA9feMX14SEhQf3pQcdYg6IUKxN/2y9BmrbisTq7uWX
	00YgFs/ZHR8Igu9+rHqhZJTadmnJLG5TF+wlXe8vTf8gDPxRI8tdzfD7dIqCMoHDFaR6y
X-Gm-Gg: AeBDiesdwt7OAsS0zf9BBsQdaFleCgffl8wCKZ5UkiWCRQ2hR3RQ2pW2sI69nwjAVx/
	gMzbKlD4pA3BVlvoPSOJr2Ap204ywmQmyZB7MHzm/l+D+3sgHUtP/0HpwOZSOtHREopq6z9rVXB
	uKiRQX0FnQczi+j5Hpx3cm5eZIL+kRbZNPTPIZwv7CSNB8Bh3mx/kOioN94J/+i12vD4mjb3bSl
	58W6X5w80u+qFK27LK+UMMj34uawtzp7LKUXhxIhbA/41UhXEj/Elpyt9z1hXD8YmQg51TIBqbv
	ZN0JWm02BhJ7SSRG+Q/WloZTG68jV/buQ5ixpW/p02MqUZVQyG0DG4RlJNcxXQFXVP+qOcJTcjj
	mtuvBulRMnHKyq6egr4yNaTItAQMG36PbFtVDjH8CELOz9FhdbUiycqRO7yWF2/96Fcxke9KZ3l
	ygeG8mB2O3BQixQg==
X-Received: by 2002:a05:6102:38cb:b0:5ff:9d74:9677 with SMTP id ada2fe7eead31-616f69d6e4dmr4763661137.3.1776867825300;
        Wed, 22 Apr 2026 07:23:45 -0700 (PDT)
X-Received: by 2002:a05:6102:38cb:b0:5ff:9d74:9677 with SMTP id ada2fe7eead31-616f69d6e4dmr4763646137.3.1776867824835;
        Wed, 22 Apr 2026 07:23:44 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ba451210e3dsm558060266b.2.2026.04.22.07.23.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Apr 2026 07:23:43 -0700 (PDT)
Message-ID: <89ac7a16-b610-466f-a332-9b688c972b47@oss.qualcomm.com>
Date: Wed, 22 Apr 2026 16:23:41 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v11 2/6] dt-bindings: remoteproc: qcom: document hexagon
 based WCSS secure PIL
To: Jeff Johnson <jeff.johnson@oss.qualcomm.com>,
        Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>,
        andersson@kernel.org, mathieu.poirier@linaro.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, konradybcio@kernel.org,
        quic_mmanikan@quicinc.com, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc: Gokul Sriram Palanisamy <quic_gokulsri@quicinc.com>,
        George Moussalem <george.moussalem@outlook.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
References: <20260326043320.2507890-1-varadarajan.narayanan@oss.qualcomm.com>
 <20260326043320.2507890-3-varadarajan.narayanan@oss.qualcomm.com>
 <58edec29-831d-44d1-b574-4dec8985ac2b@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <58edec29-831d-44d1-b574-4dec8985ac2b@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 7yJ0zPOaS1K60nbABVIkv1NFiV4gfc9g
X-Proofpoint-ORIG-GUID: 7yJ0zPOaS1K60nbABVIkv1NFiV4gfc9g
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIyMDEzOSBTYWx0ZWRfX1OUS4q+5Sv9b
 io+0muXCvyhHQAmifzBqUnCqgj2FjhAi2s4jTrHOOYQqrR3QTmwQ4m8nXQDtMwKPwZISk6wM1c5
 RdFfdPsaECEkmCfodO0uiQqovGdvt39WZ2JksROwGs4u996Afru01eQmE6aAfF5emYaTlkykC79
 87zRaCwIcWMl9yQ7Yk+po6weiO30nE9uidplq4w88gcnecbeEMycsLtV62Y0ieiavnkE6OO9YEO
 7RbKmhtJUA8SZX7OwdQx1oe0Q6+7/58ubglV8eAM60M7j6USwCOyM4qmmocKgPxyfwuHT8rUAjh
 TsSXm8rmkIG0cC//MLDbVbvyiHQ0htioCL0cafleAO5gys2tJINWCPGEj+6lVpl8+MwcsrzyE6X
 bakDbjCO3FNzBU4g+sAZ5Ft6jtA2mrFBOwYq8V8wYnLK/9fpgkWssPT0YMLEunlb1d2IBKhkVRg
 N1a6lUEQRYDNYms6QkQ==
X-Authority-Analysis: v=2.4 cv=Xd65Co55 c=1 sm=1 tr=0 ts=69e8d9f2 cx=c_pps
 a=JIY1xp/sjQ9K5JH4t62bdg==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=YaueY_eOwY7V1C5Z2doA:9 a=QEXdDO2ut3YA:10
 a=tNoRWFLymzeba-QzToBc:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-22_01,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 impostorscore=0 suspectscore=0
 priorityscore=1501 phishscore=0 bulkscore=0 malwarescore=0 clxscore=1015
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2604220139
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[quicinc.com,outlook.com,oss.qualcomm.com];
	TAGGED_FROM(0.00)[bounces-104135-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:url,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,quicinc.com:email];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 60FE04473D8
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 4/22/26 4:10 PM, Jeff Johnson wrote:
> On 3/25/2026 9:33 PM, Varadarajan Narayanan wrote:
>> From: Manikanta Mylavarapu <quic_mmanikan@quicinc.com>
> ...
>> +maintainers:
>> +  - Manikanta Mylavarapu <quic_mmanikan@quicinc.com>
> 
> given that quic_*@quicinc.com mailboxes are being decommissioned, should this
> be changed to either an oss.qualcomm.com or qti.qualcomm.com address?

Yes please, also please switch over for authoring and submitting patches

Konrad

