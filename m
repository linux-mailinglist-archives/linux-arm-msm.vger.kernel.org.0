Return-Path: <linux-arm-msm+bounces-115734-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id lJgAChgvRWpm8QoAu9opvQ
	(envelope-from <linux-arm-msm+bounces-115734-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 01 Jul 2026 17:15:36 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id B06C36EF2A0
	for <lists+linux-arm-msm@lfdr.de>; Wed, 01 Jul 2026 17:15:35 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=jHaPMyux;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=fstFlsgH;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-115734-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-115734-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id CE94B30D9AB8
	for <lists+linux-arm-msm@lfdr.de>; Wed,  1 Jul 2026 15:11:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B348A40B6EF;
	Wed,  1 Jul 2026 15:10:29 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 783FC416D01
	for <linux-arm-msm@vger.kernel.org>; Wed,  1 Jul 2026 15:10:26 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782918629; cv=none; b=s16LepTKpSyvbXGksgLAc8C6tWEDgoWxQAHMUJRHagZkvKt21BeguhUr1XBZBxNl2TLGSzkILVoX2sraJ2nHTz8SC3qoSPc4UVjzB6HDkKuMbIT5sym+vWSEKoNcZEN/9amt2AU4bO013iTE3TK16SVnwkcNy0qAAzTGMEySHfE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782918629; c=relaxed/simple;
	bh=Y8CJCopl2osjelajHaXS1SoqtaMdjy4EbFtTQBsiAyk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=CetW2Qxm85J1RZKWfCSk3PKEMLcRvJHyeX2G7fPcmbQDy8yxa5fekmnVOKMkLigw4q/iQ4RHEMsOf688hTk7W4BvJMLdBPGGKrRaWlkkssVVVVN0NFFyL4/4RTYH+vMRkapwjXmU1xEhsZ2i6XbCiv+pggFZF1iTh/VkKtrMV70=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jHaPMyux; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fstFlsgH; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 661AGIcp793831
	for <linux-arm-msm@vger.kernel.org>; Wed, 1 Jul 2026 15:10:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	g+Wn7MrdjOVOT8MzAqjXDORJcNbRYbYSkFaFfGJPCcU=; b=jHaPMyuxVwCPG6vs
	XD4YYHt/3hRWChzPMd6K2hoQ0cSGoqwBNnYFLWTwPD5N03Ib4XaGnkgApEUUVXeB
	WIZhB4+xwCX9FvPKxm+C8+0XUU3q9i58CggjI88BZjCTsz6+Q2z6AiY7t2ajlfij
	4BoowlMzoWM5XDlwAuo9FM6XRw4qgpSH8dffwA0h8uIReCuFu42v5nU1BjMnutDg
	QRgqHwj7DBffU0A95WRK/5yiyG5dEIrt+ZFSxIlWKIcPbqr/W4QCAWHSrjzKEpur
	fn4Wwm0JkMRKEnJSXU+Ifhl7xOoIQIOb3uW9CxRWl4EqLxWCRridauSylZZ6SbOT
	ozoiKQ==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f510ah7q6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 01 Jul 2026 15:10:25 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-8ead919557cso2969266d6.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 01 Jul 2026 08:10:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782918624; x=1783523424; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=g+Wn7MrdjOVOT8MzAqjXDORJcNbRYbYSkFaFfGJPCcU=;
        b=fstFlsgHvSCNbM2fV5ibKzZ31QFR29Hw3hzZXgSYvOWzqqJVVskFMe7ZIjivRaEPEa
         oEndOf49iL0jIR/R7GXOYb9DLCPxckenOMQeDjT2YSYR89eStZV0DvPT6enCXzVGwrM3
         8+T9+9I59GRSYiwh/8lHns5xCvIrn3Ak15RITd9FqwKR1Y2bNVov3kKlTMYGNPOgfP7q
         wtTeNhPR1rd5MFT9tl8YNtY6Di5QqtS4zis0BE1OV2BvMNaqgoXgAW1by8wCHbg5pswE
         02JBHbZEAY/ZsTG7GDYMnmUyCALP+5w6FDh2yXkmvN7csY23jzKiO688dCekcZNv357l
         LtiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782918624; x=1783523424;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=g+Wn7MrdjOVOT8MzAqjXDORJcNbRYbYSkFaFfGJPCcU=;
        b=BtANh/kTvejkEiFGugmvE+H6iO4tz9LXB90ojVJw/gZsNyMTjOaiibK+ExR5vJlbzN
         zNWg2/wsdGUUgBz+93dXXBvS+Bdq/GBf/b9ALOXZkJQmq/6B4tHLe+UfKwI1YiGYIikJ
         UBnT3X5gNentkoJJZ48Zy5OgpQrWHpXrcCPL4WLDxL55uUUPf6WqyAUZ5gNTnIfgGuom
         5ZWbjf6vkfi1QEAP5Skjjv6uyuozNXgB/dJxOyBC83qYOlPG1L5ltDgzBTCzO3LjVlvg
         rtd9QWXHRGANxLWJfdX4SoBWu8UwiqTnBuPxmY0iCdX5j/4TlsDAQ2qXHIgXX+lHoK28
         3cqA==
X-Gm-Message-State: AOJu0YyMe2sOWpY9IvfrvngEnhWqE9QlyzUzHCOqGwdrHaJ394VNIO/c
	g8CgyGXztdvS9Gt3pkVyT19ctb/qYJpElDmVDh2YZS+W7gJ/uwcM0Bg5fQSwA7pWFlPUGKuOUyY
	BhT86BgRLXRCEJMCBZnT9wfLOLkw+A936FDlfo1IHL8TUn4IjrzUuzJwFsT87fPDLsidx
X-Gm-Gg: AfdE7clD7K74dEckrhBwD0js/OOoVxkn6UEHtAiZiLBQk0Gc5/4+LXqOtHXrERHIMzG
	44/HGA96veUok92HJWyFc7bABWapjwg9C33AUpOwJW55VsPPYRAQvcD9YCNJd1SrOecDOXiy0uS
	gIGYMqa8xQ1vu7nHV2Y0K0hP+MVI/LbckxrEM3dKlI5xMVmpeBecLc0xl9ISDnIG6K2+RVPh20W
	IuDQwMv2RDcFvAeQsrYAmdrrFqri/Fg9bmg63c9XX1Mh5cDbazHMqDPw8COAT62SdFE3LYtpCn7
	HTt3tJCZoC+MYpUp+7mp+u/24L4Z3olH0JecwrEeHEs6cwmQPKCmknPLaEKCAjzMRv5P8400R75
	QaJ088ufM0++yo8zNRgfWiopGW4S5JwFauyY=
X-Received: by 2002:a05:6214:588f:b0:8f2:fba:7f36 with SMTP id 6a1803df08f44-8f3c67c8e3fmr16072876d6.4.1782918624227;
        Wed, 01 Jul 2026 08:10:24 -0700 (PDT)
X-Received: by 2002:a05:6214:588f:b0:8f2:fba:7f36 with SMTP id 6a1803df08f44-8f3c67c8e3fmr16072286d6.4.1782918623638;
        Wed, 01 Jul 2026 08:10:23 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6987c95003bsm2787777a12.21.2026.07.01.08.10.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 01 Jul 2026 08:10:22 -0700 (PDT)
Message-ID: <2cb32deb-4266-416a-8db7-1b3b46b52162@oss.qualcomm.com>
Date: Wed, 1 Jul 2026 17:10:20 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: sc8280xp: Flatten usb controller nodes
To: Xilin Wu <sophon@radxa.com>, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260507-sc8280xp-flatten-dwc3-v1-1-b18be56bebba@radxa.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260507-sc8280xp-flatten-dwc3-v1-1-b18be56bebba@radxa.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: bhhxQLdSdNqX-Uun9pDXhZto4aJKAS1F
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAxMDE2MCBTYWx0ZWRfX/3auuXDDH/dK
 maH4kPUsFtPKZ4jeeNoGys1VYn3WpGilOXSmiLRdc7DJ5coth14BLYXscyIWcPa4m7lFiL5l8eP
 tuLiB7FWrMdMpAvv728/iiY74wzrupxSQksRzF9+l9Z6Bkn7bzrcDul/re79uYAL5QTi9QqxJrz
 uKean9pdTseUBPiwZvt8XDvTwvRvHWeJZiDuCgjga1zJOo/zQe2n/8LCK41P+D1lGNxU5cix7dL
 W1IBSPwbEO3Z4iLiAxR4dX2KkSNXWBtIt5RKvwUOpaOACfzV2Cs3Hi2iFOYxMp2Pifu5fEWCB26
 4Kxt1bYV16UOkblbz+b9xZ4Z8ke9ghte43FHY6bu67KJbLQbL9qWM0jI0a3lUEkDAVm9nTEtIRi
 vvedeXGlQ0dWIRmDum+33YmaOWmtFWaPHYV6RlDKzbTCbpJ9NSWnov2sCez0eFjh1ycRB1rQwSt
 gi3YA8+Oa0CLvd5Fb+A==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAxMDE2MCBTYWx0ZWRfXwckar0vWhO10
 hmbUY8nuOtgHjvrgkmtbCLKw6M02iCyXEUFb1w1JS2rXMI+bS4a9iygfnGRECc5UvX8keTVAhCl
 f5aLbUbc0A9HN5vLlFXVVGh/8V/mo4E=
X-Authority-Analysis: v=2.4 cv=JpXBas4C c=1 sm=1 tr=0 ts=6a452de1 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=ksxQWNrZAAAA:8 a=EUspDBNiAAAA:8 a=2gBu4Zd02xb1IUzQ7tQA:9 a=QEXdDO2ut3YA:10
 a=1HOtulTD9v-eNWfpl4qZ:22 a=l7WU34MJF0Z5EO9KEJC3:22
X-Proofpoint-ORIG-GUID: bhhxQLdSdNqX-Uun9pDXhZto4aJKAS1F
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-01_03,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 suspectscore=0 malwarescore=0 impostorscore=0 clxscore=1015
 spamscore=0 priorityscore=1501 phishscore=0 lowpriorityscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607010160
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-115734-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:sophon@radxa.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,vger.kernel.org:from_smtp,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,qualcomm.com:dkim,qualcomm.com:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: B06C36EF2A0

On 5/7/26 4:29 PM, Xilin Wu wrote:
> Flatten usb controller nodes and update to using latest bindings
> and flattened driver approach.
> 
> Signed-off-by: Xilin Wu <sophon@radxa.com>
> ---

I tested this on a CRD and an x13s, both work fine across suspend.

Turned out in my local experiments I made a typo in the name of the
interrupt that was carried over to the big node..

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Tested-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com> # X13s, CRD8280

Konrad

