Return-Path: <linux-arm-msm+bounces-104945-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GKgNAHOC8Gn6UAEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-104945-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Apr 2026 11:48:35 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 6768E481D1B
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Apr 2026 11:48:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 293EA3039F48
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Apr 2026 09:41:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0BC223BBA1D;
	Tue, 28 Apr 2026 09:41:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ANHJD3Oi";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="KAgFyEI3"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBF8A3D6465
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Apr 2026 09:41:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777369291; cv=none; b=eUWUyMPEiYM3VdhqvXFI/A+ChsD25T5lhaw9uO9lEvTOi0SdjJErgkuQ1Z7bYkVRkhF/6qQw7J6gPetblHrs4KZxSy2cyRjnB1xPpCB3b6tXezMb4zURusyPm9wCttMu+qnoGlAyUDg0giVDlAZ5hS7jcFjEx9SwuUd69qKDVI0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777369291; c=relaxed/simple;
	bh=0jGJqIEvHyuE2jd3yZfBzTnMNJvxYmCxBDEiDeKiL/g=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=IyjneumwtpG9AxZxjGgmfF91sxHZbObMqz8M49hpkHeRp9rUj6vYKUlq2umyPVJWi6IZgGOC8X63UbDOs5O3U6wBLlBCYrz6q8UhhG+AFbZFXrdV9+RJlCweTOkZRKjQNnn/pLBX7tU64D5OlbKefB1pb00TQPjbSEUpBMD9SxY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ANHJD3Oi; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KAgFyEI3; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63S5qg691625683
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Apr 2026 09:41:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	wnKHfK8K/F+/mKvBliY5EUv22XSILH050ZJQu5YGI5E=; b=ANHJD3OidzSjwTJC
	D6vAaI3U05MLMhATgvzD8bqSZlaopuRWFCrAN6QjrfpvOpkb7Yi9I1yAJtGBVRWt
	LBu0fGjTtfEw+g973jtTGwY5gwGwj1RWjs8MjI3frKi5zF5UEt0GST1zK+Kf89dg
	N/q+ZCH4drFVqBMgdJpkQJH1hyCymLizGdTFMDyKnEVICe6U2h934In8wQHr+tVB
	yJ82++EvRuu+JRb3gcPHJ/0oXeypEfZPKGfiyUwOCv4wRE/+DDDaamqdrOj5/Tmm
	Z6G6FIX1jZQ7j7Qs33qn+xtwLtt75xF2yd/fybmPzzd7dw6GCtz9a33k2/gHMJko
	jtBciA==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dtgmsa9yf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Apr 2026 09:41:30 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-8acb4b340f4so30280656d6.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 28 Apr 2026 02:41:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777369289; x=1777974089; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=wnKHfK8K/F+/mKvBliY5EUv22XSILH050ZJQu5YGI5E=;
        b=KAgFyEI3ThUM3MHNvvLlN0Dy40NjOHWCmmuQhMnUSoxz86hWSZfbPYOrBvBfcnyyKQ
         Ij63O4Gqgge+zuAad74Fo/2Srde9mSho6zLweZy4TC8LOFLj6WTJNyhabzV3looqryUl
         uqmuxSLAxUSVEDNl7ljjsFZMd4JQqTL9MfLVzF7QRPQjCZB/SqwFlQr1VRc5G0PjXMQr
         anOIDueLFqA3u2LjQgGaflUIOqXZc6EfdFfX5nScq0JxaM6D3VmK/AJBiy8Xl1wjYBp4
         TCJqS1cXR92gJPDViS+VHhJmx7ul5neAOmz0t/ik+FPC4PxGOQJiBFrQUChDSDmj2Fxd
         wPbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777369289; x=1777974089;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wnKHfK8K/F+/mKvBliY5EUv22XSILH050ZJQu5YGI5E=;
        b=NeIUcUVy7s0q3YnoHPdBo/orMHWe9xSWYspwUmdXq24KL9L/EU1oqMTRKJo05hfUHB
         j3wpjUSRuTRsWJQ3Qv7YoJuO77/d3lrsxVhaPqTGyA5ERWJJOeGHR4cE/lwANq/j2lgI
         +GEDG4/9olcyywJsUxHEcSoeB776Lu3rKCmDJjHgcxC2IpU0KWyGA8OWpXUPjpwgHfQe
         79RJwVt2B/n9XoGw8jwxMrYIZqy3THGVJcny1ML05rX2p79afIYvOKsRlyXSKPc+sI2Q
         7uIsxv7n1gHfO8bMSPuuTRBUGh6FSBJKzWfQ+jED6MNMTTBeX6IvwI40Nc/i65ZZUg0a
         BbJA==
X-Gm-Message-State: AOJu0Yyl/l5HunlET9O8jkxuuGfPqRpYe5PePuYYAAtchISZuq2Vl3zO
	4zXgIoJ61T8fl+1ziMfyZLdZVQmiz9VtBBbVo54rwqB1iUVCQyWte4i/jKN13MvIzFugHzspWMU
	hWugADWWllavS0HfchO1n4Ez3ut2fvx1I9q3qbkV1Foewd3OFPf+b3KvbMpeKo9EZQzdd
X-Gm-Gg: AeBDievIDCzZ1FmoznYuiAaqP6t0E1epFCoAooPrd8gpPrhxfTGCxQUzmxG6JOYMxaC
	L9Ij/ZSn+yQbMPRdm3v6jzyExV33GqO1RFlnM+K4tgqZsUVnFoXGCG2Ew36uayKa3ZE8seKavBF
	1wk7VWSV4EmYsY2IX525gE/eBzbK8sDNAtYdWJG7jVJdR4wX8kV6GpaaysdAqSALnB8cJSCnudW
	fVF7KSK6Ohj8N6hLSBJYv3eTE5cAk4Uh3feP5uwIpPuNeCgqZLpJdCj8TltKgHQ5W70v+T0Y7Mm
	ruRz7a14n6bsnpGg8lUxfq62+rstaR2s3ZkQ619d+48En1oPsmi5/aNFNNHCNp+0z/eAicsvqR6
	6/QSuqBjPbtjDeVzqCpVZVuM91lwZmFcUX2y4ePVDZDrNKvPri6I/Wi/KEI3HJFmtViJCFpColJ
	JIP8GU2d/CDoLiiQ==
X-Received: by 2002:a05:6214:5099:b0:8ac:afca:a68f with SMTP id 6a1803df08f44-8b3e284647emr26420646d6.1.1777369289023;
        Tue, 28 Apr 2026 02:41:29 -0700 (PDT)
X-Received: by 2002:a05:6214:5099:b0:8ac:afca:a68f with SMTP id 6a1803df08f44-8b3e284647emr26420426d6.1.1777369288549;
        Tue, 28 Apr 2026 02:41:28 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bb80c581f6esm74064366b.63.2026.04.28.02.41.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Apr 2026 02:41:27 -0700 (PDT)
Message-ID: <fc786276-6397-43c5-83aa-1352b4016f09@oss.qualcomm.com>
Date: Tue, 28 Apr 2026 11:41:25 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] soc: qcom: socinfo: Add SoC ID for Shikra IoT
 variants
To: Komal Bajaj <komal.bajaj@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260428-shikra-socid-v1-0-6ff16bad5ea2@oss.qualcomm.com>
 <20260428-shikra-socid-v1-2-6ff16bad5ea2@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260428-shikra-socid-v1-2-6ff16bad5ea2@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: A6AdOg-81kyv_k7GubCEv10qTXMT4fUX
X-Authority-Analysis: v=2.4 cv=R4gz39RX c=1 sm=1 tr=0 ts=69f080ca cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=vUAe5X8XSJDf5Ne0D5cA:9 a=QEXdDO2ut3YA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI4MDA4NCBTYWx0ZWRfX3ItmfNQw67vu
 SDPyjciWuEUfJN+lLqKQgiSlsG7COyiHxIczrO5vsGXoLqzlSvuG/HLDqMIl1BV1D4Ht5l0Eais
 aY2p4O7bDmDe/onM/YhddmI6VM57pZg+tjS2cUvvDOU+WZYiDfhilSIkfSOuBnhWBqLLJJi95em
 D89fmdRjHWMt5PVxACwm3tO/QE71Hsq82I4+fDtrbwJ35JuNoEMJuYipSd9dsdhDzu1S54aQHIi
 JEXSYK9Ry8/RajfjNhU0bM7EXCKxewI3FxWyFXPVA/82XZNw7CTSOybDPhcncYKmbIhsES2Qt1G
 PDlBMCafyAzvGtokv06jUa5brObe8qJYbrIuxHMJ0SuuH+QVVZW8a0NsrTWalyDp0wTXQP6bhqP
 3nxp5dcr9TBzYr3tINaHqqcQRhc8OmNsnj4ZWzE1vAxDP4N3BtZ1McJcTtIdkIa7W2oSgpwTN+P
 MaPXDDrdYaXrskcWiag==
X-Proofpoint-ORIG-GUID: A6AdOg-81kyv_k7GubCEv10qTXMT4fUX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-28_02,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 priorityscore=1501 malwarescore=0 clxscore=1015
 impostorscore=0 spamscore=0 adultscore=0 bulkscore=0 phishscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2604280084
X-Rspamd-Queue-Id: 6768E481D1B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-104945-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_COUNT_SEVEN(0.00)[7]

On 4/28/26 11:17 AM, Komal Bajaj wrote:
> Add SoC ID for Shikra IoT variants: CQ2390M, CQ2390S and IQ2390S.
> 
> Signed-off-by: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

