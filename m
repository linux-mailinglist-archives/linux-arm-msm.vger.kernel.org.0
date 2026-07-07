Return-Path: <linux-arm-msm+bounces-117172-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id RaZ9G0iwTGqxoAEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-117172-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 07 Jul 2026 09:52:40 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 08F9A718B4D
	for <lists+linux-arm-msm@lfdr.de>; Tue, 07 Jul 2026 09:52:40 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=jXYE35xw;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=T7kzjK8O;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-117172-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-117172-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id C56FC3028B22
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Jul 2026 07:51:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B6A0E2EC09B;
	Tue,  7 Jul 2026 07:51:46 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3E972E0938
	for <linux-arm-msm@vger.kernel.org>; Tue,  7 Jul 2026 07:51:44 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783410706; cv=none; b=m9RrbV4TMnEViu4auDUAKotQrCxvseKiR1kZbJHuwtBRFNdgWVUSA+7eeLqUb3Tmh1bFjTZqpiGhRWoKlPith94vJEz5iW9t1NR9EyQHwTms4nCkh243RzW8YHLM/3TxtXOeZMg7EgEtPU4suCshhHCRSpdRRMTFNJc8zQV37pU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783410706; c=relaxed/simple;
	bh=GTQCbbONJYb5DhiScbASo8gdRnlKVRI049kQ1W70M00=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=KrFtrXLj1VMcYbY7Mk1nv+er9X06bqAk5clvg7dx6xaB5T5DNzYPPjmbYjwJBqdtYYaQQYT5ddNNKyT3comu9We1ZhYjGE3+rmar5XDYifmUfMzwqA1Txna2OVwpZ+r1aEPaohhqNQTcuQ3SGehgL6hgxLGflx7x2E/Xu95TLVA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jXYE35xw; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=T7kzjK8O; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6676KbKA2922726
	for <linux-arm-msm@vger.kernel.org>; Tue, 7 Jul 2026 07:51:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	qGsKHl4+WtIZmZys5q4B4bjUDscQEyhEgFF3Vd/4R6Q=; b=jXYE35xwTgHmf+Wc
	/NuQ+dJN/CTmFW4o7MJT2nXFyp8G8pVk6BAh6BjYOtzlgGDt5d6gjQ0nIcGkd4Rr
	1yxra+rSe8pfYuGP/WXLg52thzqEb2hz2jkeFXJHNXcrDecpW0vwCu6mrdLFti8Y
	29C3jLip4ULi34m+MTGSVtomRJaQwKfl/eiLDgMwRo9MF7lBfY7g5bjto3RcMAhn
	wAYoFEl/aJ5onuzRvQK6xM2qVxwU3J07xm7ufjRjP4y0yV34rAIpAG8O+B/jCeRN
	1BhwEV+CGKYbRT0/1EqYn83kb4gHdggrbBcQnN2mJ/2pbm/9Da2MeSQDZz4te7QG
	obAPzg==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f8v3t8br6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 07 Jul 2026 07:51:43 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-51c15c77619so9047241cf.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 07 Jul 2026 00:51:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783410703; x=1784015503; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qGsKHl4+WtIZmZys5q4B4bjUDscQEyhEgFF3Vd/4R6Q=;
        b=T7kzjK8OILfkOvZFV1wp4AFbZq06QPTA08uGetPaJuAgfOOzyL4iR5o5zkFIKS4Gqn
         DUiccuDcRr8HyX5JMgZD3nRfzaL87/c4X+3z8fFuU40+qHXdzVGmmgfb7JgsRZ2LUJax
         MY33tBptnt3uv47M1Ibo7q2V2OoXWTp0pU04Zu80guehdyo8j8EwzOm+kA1A7wnHYedk
         gmJNCv+SuKO4uvB2I7UDeoxv8YVdS0hx7EjaqgeSiM0wOxFiQ+yzceRpkxJjQi6D+Zgl
         0dD6MTepS9AGeLEULj2CHImVWp8pcDosNF/StNyq2BsB4IYH3rfT8GO/BPMgTYWvxYhn
         /2/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783410703; x=1784015503;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qGsKHl4+WtIZmZys5q4B4bjUDscQEyhEgFF3Vd/4R6Q=;
        b=p6O9ybUaqBOizEjoUW26wVpJ4qf8pq2tlRUdB2Y+EtITkT5DBArCnlNT7Xivzxvyck
         T6ZdUNMRsSTLTmUrcXKi5tQQS5b+igg3ugjPobkSIeld8P3Utx6Pq0O2fH9z1lfQOV2c
         EB6sVSr13AScmnJjGgZjnTScxENhyq5RivlZ+gFGGc+3+9dTfjyTkrzWpzEiuJL2m3lG
         EwVIpmdfbbq9w9AlNj0FQq7akg+T4n2ITKpmqXGrBZqIUQoyNmrAnmAC/5yQNYb3k6gO
         3dppQQrca2Ruz9GiDUXrWuywrQ6bbxRgdp0XPdc5dLXm21BMtY7U21BZ8GdGtll4Jzbi
         639Q==
X-Gm-Message-State: AOJu0YzIs4a4gyNvN2Vy5s+6Zebcdw4HVgL/cJIcc3AlfuXU5ZGT4LjX
	yb00OgbZSgjQbn3WnNTQYJiKUhsDFLbVW3XCSMlzgVhuSLja0zW/x+JqTQyXy05PId6OL6iIbVP
	vSaEvHI6qSgQH0s84pLb2XuTA6DJeqx4WuK7TKJl7LqTJFuPe3XGODgiaBdd3YsPOPuzLZiaM6n
	kF
X-Gm-Gg: AfdE7cl0P+Q9/HzlGHMz8ausDnJll02wab7Pzi2C8ukUMmJ3h7Y5k7FgPeVSJTNnexP
	8G5UpVy55ssTcjoIydOarWRIV53At6BWAvQkFQchy0009owKAdSwfKJBxQrXLbuTmUV6iD+U2VD
	XtdcutPDluL+XVtMCWsdaWFIX4+Wtwezn3fh4GtC4cV0jLnyJr3mrjnyK0dZ4Y/cBWgKYwoekrU
	VROb4jBRNXXS+C2RalA0PJDsBom8UFELMC6SNy/TRec3BRVl+Rp+3tE24KUl6NbJCRIo4IPkGqK
	N0+2qnAfIv4mz3U/N4wV4TpaL2QLGqdUXQ7CgRqSA8pMgxYd7GTmpaDiXJWtABVyVRiYtsVYuST
	Qyk4T2IIzzCg7TjWRXQaXiqcVgu45tL6a754=
X-Received: by 2002:ac8:5710:0:b0:51c:db4:3cb8 with SMTP id d75a77b69052e-51c4bed6cd2mr121678321cf.8.1783410703133;
        Tue, 07 Jul 2026 00:51:43 -0700 (PDT)
X-Received: by 2002:ac8:5710:0:b0:51c:db4:3cb8 with SMTP id d75a77b69052e-51c4bed6cd2mr121678191cf.8.1783410702706;
        Tue, 07 Jul 2026 00:51:42 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-69a19d79906sm5534277a12.14.2026.07.07.00.51.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Jul 2026 00:51:41 -0700 (PDT)
Message-ID: <6a312986-49b7-483b-8253-5bb3b842ac34@oss.qualcomm.com>
Date: Tue, 7 Jul 2026 09:51:38 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 5/6] arm64: dts: qcom: ipq5018: add nodes required for
 Bluetooth support
To: george.moussalem@outlook.com, Bartosz Golaszewski <brgl@kernel.org>,
        Marcel Holtmann <marcel@holtmann.org>,
        Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
        Rob Herring
 <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-arm-msm@vger.kernel.org, linux-bluetooth@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
References: <20260706-ipq5018-bluetooth-v4-0-350262a30959@outlook.com>
 <20260706-ipq5018-bluetooth-v4-5-350262a30959@outlook.com>
 <6d8c0326-1b3e-4eae-b528-22ca77dbaf6d@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <6d8c0326-1b3e-4eae-b528-22ca77dbaf6d@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: V_N8_AloXzHKo_iWwsqaWNFa1YLxuTbw
X-Proofpoint-ORIG-GUID: V_N8_AloXzHKo_iWwsqaWNFa1YLxuTbw
X-Authority-Analysis: v=2.4 cv=HqVG3UTS c=1 sm=1 tr=0 ts=6a4cb00f cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=UqCG9HQmAAAA:8 a=EUspDBNiAAAA:8 a=iO9hu9iUymBLBQONcncA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA3MDA3NCBTYWx0ZWRfX5uEPXZEG5SCk
 dTe1HlE8wHJ0br0EMm0ty9wQXps4SYff2mWsV7sAyGv9MEHJsqSOF4L6M1kCBrI/hGXTg/9+kO5
 p+mVVQ/TJIq/bYspUwYpoUbitjF7rLvIQep+Ap6pGcRQOA2yw5bO+7JmCvCx3AUt2R6chAEaUrD
 C14kk7e2Q9SlgiWHudVz+wCd4iK6tUlmeT4VlDEHV7AuJ+nonf/3WlIENZFi3F3iPHCiLfXTEcy
 i0nrvHctqA6rsxcCH3JqbR3D88Hjg/QgMeYNcJw+KnlZ5a630mPaogDtFvwKV9L4azAOuEEuclS
 fHBFxusTcxLD9Goomkq1kPohnWjR3lkJ1/UgItR3CP5N2cKZL2zSp+IXttOqG22QF3fqDecaQH8
 FIiKE31s3KnwX6G5bsjpehP1SckZ1V+xjOjGmo1wqe4nj0b8fzUhdHC8eCF2Nwttb431STpo3Ma
 iPFbv7hb7/gUYN/LUuQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA3MDA3NCBTYWx0ZWRfX87ZExB5BQK9c
 wNIVcbcLtV8OLbYjkcp4FyeGjiOhvn/NB5g/gvcUO/Y7tzhLU+cUI8MQyw0fWK7o/9uryI01LrZ
 ty8Cko0Bjx24oN+A5RYKFauNWb87b8c=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-07_01,2026-07-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 adultscore=0 suspectscore=0 malwarescore=0
 bulkscore=0 lowpriorityscore=0 phishscore=0 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607070074
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-117172-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_TO(0.00)[outlook.com,kernel.org,holtmann.org,gmail.com,pengutronix.de];
	FORGED_RECIPIENTS(0.00)[m:george.moussalem@outlook.com,m:brgl@kernel.org,m:marcel@holtmann.org,m:luiz.dentz@gmail.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:p.zabel@pengutronix.de,m:linux-arm-msm@vger.kernel.org,m:linux-bluetooth@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:bartosz.golaszewski@oss.qualcomm.com,m:luizdentz@gmail.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,outlook.com:email,vger.kernel.org:from_smtp,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 08F9A718B4D

On 7/7/26 9:51 AM, Konrad Dybcio wrote:
> On 7/6/26 7:26 PM, George Moussalem via B4 Relay wrote:
>> From: George Moussalem <george.moussalem@outlook.com>
>>
>> Add nodes for the reserved memory carveout and Bluetooth.
>>
>> Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
>> Signed-off-by: George Moussalem <george.moussalem@outlook.com>
>> ---
> 
> [...]
> 
>> @@ -136,6 +153,11 @@ reserved-memory {
>>  		#size-cells = <2>;
>>  		ranges;
>>  
>> +		btss_region: bluetooth@7000000 {
>> +			reg = <0x0 0x07000000 0x0 0x58000>;
> 
> FWIW RAM starts at 0x4000_0000 - I'm thinking whether this should
> just be the 'reg' value of the bluetooth node. This makes even more
> sense as you write to this region using I/O accessors

FWIW2: The region is called "BT_RAM"

Konrad

