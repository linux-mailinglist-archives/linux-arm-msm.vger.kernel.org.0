Return-Path: <linux-arm-msm+bounces-92001-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +IFTD127hWmOFgQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-92001-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 06 Feb 2026 10:58:53 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 92F37FC559
	for <lists+linux-arm-msm@lfdr.de>; Fri, 06 Feb 2026 10:58:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 34C5D300DDCD
	for <lists+linux-arm-msm@lfdr.de>; Fri,  6 Feb 2026 09:57:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 06AC535FF41;
	Fri,  6 Feb 2026 09:57:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cpLbXzmq";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="a0VNl2ti"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C92EA30FC16
	for <linux-arm-msm@vger.kernel.org>; Fri,  6 Feb 2026 09:57:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770371831; cv=none; b=ZKP6MAoKWj8uN99/azwhTTh5F9KRai17UK2kRlJY1UeMAQ1bVPo210TC3KTzdEazkUOtuk7BAe+MHQgCTdb7tTuMv1we7rl8HWWXV12qNo4fuST8GgA5yvCgOz5/Om7AHnkxluXIyKdEeRzSHOrRG31ID8xMzKu1rnVgGcYL86E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770371831; c=relaxed/simple;
	bh=874jKBgx5p60UdLfSDb1SqFEXBqYVoMemdb1f82kxW8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=fbFZmsRXEPtaN79LRTd01DOsqvPgF9D7PIq83gs6twEwQZwOiyKpcSZh+ilcJJL/Q6dw8ap1s/F9M/BiiL7rNFYNVNTyDjSBZnP3tbH5vN6idQBRI8/og82VDFq94FwbZpyCW59gmIXbBGRZsx7NsvUMj5ZrAvS2H0rK835sI+4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cpLbXzmq; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=a0VNl2ti; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6168whwv2058377
	for <linux-arm-msm@vger.kernel.org>; Fri, 6 Feb 2026 09:57:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	gULrD6EZGmOr61r/6ME9YlZuoHQCjXSBluqrL+O0wNs=; b=cpLbXzmqD+pI5kJP
	9U+PloUvVBcA9fO0JV39OOb/jibO8JNo3m2OApfN09UOryWvxEJAOWtiXGbH8lD4
	j+l98J+dBH2/aVFHu5yI5APOr3BqPOGmTKW/0RZkxGjiuZSvS9almbWHcV+yCACr
	lX38RpxOnq4zZP/iAR/5XBigtgErm2+dXH3uY5KDODos2Ryakg1dzsE2d2rCRwuK
	2Yx1rSsuGswLr0CPU1UXGBRYmaWJr4nfV4ntH7y/Xnbn1SXKenX4e2kWUJbChgFG
	yea/YqrfwCBLxmM6Cb4A630gK2Ojfi9IrYLWuckk0QIjlyfK+wp5Yv6iTaTftCgy
	QAVLvQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c4x8bk8e3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 06 Feb 2026 09:57:11 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8c70cb31bcdso49085185a.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 06 Feb 2026 01:57:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770371830; x=1770976630; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=gULrD6EZGmOr61r/6ME9YlZuoHQCjXSBluqrL+O0wNs=;
        b=a0VNl2tia6wvtXRJSqcXUreYOFxyg2AzsMomdQgBO+Cun2ZxKXcTNLFvRjmiNxOVrn
         lWKmu8H0QpgZi/VkK6PRNCEIsowrxMTcISVNKMOG24xJyIXKWVZnMoQzBpoEr9eeq4+s
         gRxzYdLQ1kdqNazJZGN2CGF2sMm9TSxhdWD9Gj8SIB7n6/DtiFSNunmRinEAE0hB/0U8
         /1hiXao9UjyPKrGYvMfQwCs8OYNU7sK4R2jvmBegcV8ZSrEfrQyYnOqYsb/lE95NO9Cf
         dsU8wIkgQeoWcrGJ/wXOBstIuzFQXK5rrzlHxBdIbtKWHTDG8wiCzgzp15d0n9OkVuJR
         CAKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770371830; x=1770976630;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gULrD6EZGmOr61r/6ME9YlZuoHQCjXSBluqrL+O0wNs=;
        b=a1sle0JbJtxe4odnwbPt+VTUqy6BvRjgjjeKmlOFa9p7vkI+jMFj4XVILgbRgmP4mB
         DofYJVV2pmWeLRi0xDk6IXlcKmZN2L4mhgHh+dUq8QH3CrFk3h3rSEnwh+MtIQx7993z
         B6rli3oV/GWcqpzE9+sOOPJwX4BiRiABBBXZ5xrn875oDEMsip+3ukbj5gGIwE9CDQsT
         WaC3ab2Ja1KfuP77b75DSMdx7Qv05/NmZ1u6vztbewxcBngdjgLgSB1aa/Tg4JeycmxC
         ja7glSrggCkf9EdQA1a6/11w+/mZGlNfLWYObigtZSSchmI2Oyu3Y7C1fMMyyD8uARl8
         zI4A==
X-Forwarded-Encrypted: i=1; AJvYcCWQZtBc8ZaUFx0iTe/N7ixkfcW7MSi5znxEK9D7Lz810cpR1ZIHe7UOE6uOoxqA0L6OfqHPQzZGa1nh8Nt0@vger.kernel.org
X-Gm-Message-State: AOJu0Yxv4jY+dGWMllFi3cJIs+sLh9CB6sq4mT3GB2d185rYCxzsJEC2
	9Tlb1X+FyGP/AyC+P/tUdfNtQj/owS9CF16UxhSlbbalLhJpTuFjX290x/lInl04JqgZ7pkUkGE
	/IB1MV+5B0Nl4cfYO4nEj/mjZD9qalEEf9Nn79ylUKE+f90bVozDqODIWPbKUhZPzf7f0
X-Gm-Gg: AZuq6aJf6iawh0AC94kujp+Z1qFwJ66jRBVO40RCNZxPJWe/htaDBAmLT4aazMsyhKI
	iw3xmAvMh4uWQdQtn3YprBfLCnZdW5K3mEiM/3jNKvHM58TRBRS6jVdUZN5hc93tfz+JbuE0rhv
	42V5OblA3ZwiW8AUdkzWSYg1BzVutEmbJvlavpApoX5pTRx12oxHXLb0Mm3vD9wg9NxREw20Lkl
	3ID5dopdTXaQXZ0rhP+bWbyOpbfAYru7VpUmgBcFJ6DMnCbp1MYOKvsb6adoFhXyNxl85JXVcue
	vrDWdZ8SREUV2JoKxSQliZstn+VcHCWZAkk8bhPjc86K2Zxq5aljT17u4H1msLXJnEcM9w0sKWY
	EWribdLsdcfFF5zhi11iPDLDf4O423vLsJWttTxUwt36j4v3E6qpnhKV2xToz7/WKSeE=
X-Received: by 2002:a05:620a:46a1:b0:8b2:e346:de7b with SMTP id af79cd13be357-8caeed3aea5mr211014685a.1.1770371830067;
        Fri, 06 Feb 2026 01:57:10 -0800 (PST)
X-Received: by 2002:a05:620a:46a1:b0:8b2:e346:de7b with SMTP id af79cd13be357-8caeed3aea5mr211012785a.1.1770371829651;
        Fri, 06 Feb 2026 01:57:09 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8edacb3195sm65683166b.35.2026.02.06.01.57.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 06 Feb 2026 01:57:09 -0800 (PST)
Message-ID: <b1d791e3-849e-4d76-bda0-816418f98e39@oss.qualcomm.com>
Date: Fri, 6 Feb 2026 10:57:06 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: qcs6490: Add Thundercomm AI Mini PC G1
 IoT
To: Roger Shimizu <rosh@debian.org>, Krzysztof Kozlowski <krzk@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <6cd569ad19ae8efb5f4244b3aa185754@gmail.com>
 <eb9c1489-4496-48b3-8709-739cd45c11b0@oss.qualcomm.com>
 <d398cd57-41b8-4646-834e-ff0c0b7ff749@kernel.org>
 <CAEQ9gE=kH4Np32xZdp+jzaTo9TMjtLVRD+xaimuKWxdag2Whew@mail.gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <CAEQ9gE=kH4Np32xZdp+jzaTo9TMjtLVRD+xaimuKWxdag2Whew@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=GaoaXAXL c=1 sm=1 tr=0 ts=6985baf7 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22
 a=VwQbUJbxAAAA:8 a=aHQwvktsUJShgGQTGxUA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: jWejUq4iWPjyNKlhtbBham08m0CAldv7
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjA2MDA2NyBTYWx0ZWRfX/ZyKc+DiqP7y
 GIxJMzuOKzOLoxpdfEFdGNmPQvF1NV4ycF2o+BlTgshGil61Nai2ZucbNWI4vvtT61OJYPFq5IH
 iTDgw6P5ZiKdPb22kCrCMj20B1Jav9YulHf8NpUdyGPz6/1u2XrvtsOF/N0a4xZ+hcgk4GJsDJV
 wAdzjUreJQfXXkeTMXptHq8sYRrnv6TsLl7GKX19O+XG7zLRpjRK0Cihi2oKT4UatqpHLoNOi2b
 sNgwguipnbo2KXZnjH1bOERZ5m/JlcVDOzFNQrwACm7W1w5T+szjLdlyBm7at2AHf1Lj3WIJqPB
 pZHGX7RsW75aghRGnojViKA/yl1TSISIwud12bZl4eJF3ZzAZao1zoEsD6xESu877V6WuNyQ0wk
 16uyjmIz6quBXJVBCW/mUD/tIQqRN66VEdVjfP4AnPVdTHFTE9Cw8Z6K9luLYnhmjp1Nx4EacLB
 Ls20AeSLEluBBOPNlqA==
X-Proofpoint-GUID: jWejUq4iWPjyNKlhtbBham08m0CAldv7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-06_03,2026-02-05_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 spamscore=0 clxscore=1015 impostorscore=0 phishscore=0
 priorityscore=1501 suspectscore=0 malwarescore=0 bulkscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2602060067
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:dkim];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-92001-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 92F37FC559
X-Rspamd-Action: no action

On 2/6/26 10:55 AM, Roger Shimizu wrote:
> On Fri, Feb 6, 2026 at 1:41 AM Krzysztof Kozlowski <krzk@kernel.org> wrote:
>>
>> On 04/02/2026 10:20, Konrad Dybcio wrote:
>>> On 1/31/26 11:31 AM, Roger Shimizu wrote:
>>>> ---
>>>
>>> [...]
>>>
>>>> +/ {
>>>> +    model = "Thundercomm AI Mini PC G1 IoT";
>>>> +    compatible = "qcom,sc7280", "qcom,qcm6490";
>>>
>>> You need to add a board-specific compatible here, see:
>>>
>>> Documentation/devicetree/bindings/arm/qcom.yaml
>>
>> The true problem is that this would probably fail validation, so I
>> suspect this was never tested/checked.
> 
> Thanks for the review!
> I did test this device-tree with the board.
> If you mean some other test, please let me know in detail.

make ... CHECK_DTBS=1 qcom/qcs6490-thundercomm-minipc-g1iot.dtb

make ... dt_binding_check  

Konrad

