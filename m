Return-Path: <linux-arm-msm+bounces-104110-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mAI+E5C56GkHPgIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-104110-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Apr 2026 14:05:36 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6619B445AF0
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Apr 2026 14:05:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 35097303C012
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Apr 2026 12:05:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F09E83D2FF5;
	Wed, 22 Apr 2026 12:04:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ecjlMuZg";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Cs1DhOKZ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A764134A76B
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Apr 2026 12:04:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776859497; cv=none; b=AnOExZhSr8JZlLO/1qdYlkrduyNfeYlsogUrA6fNVq7m//5G58fe2qX743GATH/mTeVUmvJomqVqh6cfkiBz1VwtGnpqOA1F2EFUdsnfTCyt252sEJJLc962V0yJnzJ6+tyaciYHM8X4JfTfLJqygRrkkldPItKllD1GOU7q6JQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776859497; c=relaxed/simple;
	bh=idjlWeUhNdX/k77A2WmRf7vhEF+hmm3TROSvAzIm7kM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=fLRlOToFRSSrRZe9qOTGKzNIZg5SPcQhG6DlfM85u5mXhffOKNJPipccJ1KUrebtThCwUD63ZYtE7P9L80D8irdLlEIpWNotYEoKdY2vBNxJDpGmnWT/vprHaecEslKsC3G6i7YFkVQavEDQk9oFZp8y7FyBFHpB2FLLcF2kahM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ecjlMuZg; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Cs1DhOKZ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63M99FFG4118735
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Apr 2026 12:04:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	c8liTbH7EF5TWwLcShnnzAb4AWRQSogCfCpBFLO8lVI=; b=ecjlMuZgnNCSKNzT
	ypKF03rH/a/D43MbigX0cLJxhy9Jp10XfJCnH1h9k9EyWZ9SVZZmY/5HIhxtA6uR
	oFsdxJ//ulTq7te9DsK1TZHETWn3pn6ewe3ylWObokplf14Kpc+ylldEXZZ4QUiD
	P86E4LUaOzotFaobksCKIrvqtSf149TLN+0l3ScjNgC883e5nJGYhST9NZtqWD28
	zTtcq8rK5WWlkXDqr5Mbp1VfBhY8arCYg+OzWUCQwqhgqGyUQnNDtntj8N1jwusg
	Laau2ZeiLICbsAbSBUmzSQwVKc24jDttIqrDH/IvXa3/AigXyxa6DR1CLHnyarh3
	iSh+Tg==
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com [209.85.217.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dpengb7p6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Apr 2026 12:04:55 +0000 (GMT)
Received: by mail-vs1-f71.google.com with SMTP id ada2fe7eead31-6055c46b2c8so366283137.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 22 Apr 2026 05:04:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776859495; x=1777464295; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=c8liTbH7EF5TWwLcShnnzAb4AWRQSogCfCpBFLO8lVI=;
        b=Cs1DhOKZehjihK2/MfzBF5RcBFKCyeg4AuEvuJEqr1El0ypvnyfjuWhN93afGz1QVg
         scYMzRqZ/kKWUotwdorcXBYAHiii7U4aXwGjuaiJk4yZKMZjwAJv4MxIXoFpEI7LEHgU
         y5B2FlWu38biY0exkrtupuQBaA3ftuaUvElsS5Mt7dNPUAZObGyK6HcZpoxsFyYNZ53D
         TDfRYa40ttjJYN8b3q6a+Sg7nZLSnpzhPuYdsKsNRwlEdYb+2uhHkVUkW/Z+wb93GFkR
         VVkv/gGLx7V+fCaEv2iAZU81RNvBg6S0vQQko4xyj7mqNqlnYg28eZc/6T9QQ4GKy4Kc
         1ecw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776859495; x=1777464295;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=c8liTbH7EF5TWwLcShnnzAb4AWRQSogCfCpBFLO8lVI=;
        b=U3zKSyqCKOYU0I17yaAt0VoHiKOcRl7OaqEi+qcg+E7xXVpThjWGOWWnRXMit/qg0k
         DdpNq5d1F+XTI4W4pZdZLvdpEG5sZeDDHmXWV6bVDolX6SbSQ6Sp+1SV0Hn7bkEUO+7D
         oYTGY9dF2x2TBq/FaPAEdSNnygZVGz12jHNzYjXtCLRcFEEKp1XMg3T75vV31mcjBOe9
         q+PTk6RMDhljtFj7JcUdW9lu/5M/mzX4kLPAsP5I8Adln3QAKsmNeg4QoOFF+lQ8YAqV
         P250IKyiNd2L0fh5fNg8dGUeswot/RFu36ia08DTAjK0smXr6IZHPJjD1gn3jFdzFpIh
         ucCw==
X-Forwarded-Encrypted: i=1; AFNElJ8wWSd0xUMwNdE7LrUJh3gLa44JzsPt5agsbcGbaLjoBZgZ3jxWzgygOXYpjbCkJJFx4BlvmEdnyfSrifcI@vger.kernel.org
X-Gm-Message-State: AOJu0YzZ6cFHw+ptmE3ObWX7y2pIeVhC2YuqueW9wyITEOUpveuZo63z
	xn9H7C4HML0ojw8f9uBJwpOU65bUyJMXH91m5mJ5lBdoxoJE2tVTo+8U6QIm2sPx56r/gMhI/at
	cTl3o3NLnvgx3doFGcRuu3RSJR0KfPyw45HOYjWQDqtZQxNHBb4AWRe9wjVk9gtpgFrXh
X-Gm-Gg: AeBDiesDtrWXESu7edTVPpcpWlBO1/KXUwkYMQWKhFMNrFVkRVUPr/+VFFD6sA6rVRf
	WY5JHkkYn1+KN/L7bFerP+xMa0oTGv/zb66YMy4SW2xGz6LaLwPhpuNsBAlMxWgQVV96OehKgTp
	gaptHjXTmA+7GXHYxHU4cVyS/VgjBAcPI8MXFAkdllQ5V1LtC4DAZEfJ3L3vaTN87fxQ1T0G8aE
	65G7r+3d9a4sV2pZuQaM9LjxtgU2gXgS2Ke7LdV20jdeGrGf/BqVmMarqi4H8HRIpQRA4NbKlmZ
	wkcY8htkOebP1gnK19MixXRnMgvC+J/OoH9YHEF6uKFe1kkmOhIYH/iHSuoQgxyyvtFkvWfuENW
	h06P/YGs9wBciCwtNVhVROd8WybfwPukppnMHIfHrGXkCweIAF5eV475L/i3c3X6aOjH5TPjMJT
	eAdvyikOERqKhaQw==
X-Received: by 2002:a05:6102:3708:b0:611:7722:a6a7 with SMTP id ada2fe7eead31-616f8072a0dmr4350087137.8.1776859495107;
        Wed, 22 Apr 2026 05:04:55 -0700 (PDT)
X-Received: by 2002:a05:6102:3708:b0:611:7722:a6a7 with SMTP id ada2fe7eead31-616f8072a0dmr4350040137.8.1776859494571;
        Wed, 22 Apr 2026 05:04:54 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ba455045652sm537299666b.51.2026.04.22.05.04.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Apr 2026 05:04:53 -0700 (PDT)
Message-ID: <2ae66b85-8ee1-488b-adbc-0fa3afdf3e08@oss.qualcomm.com>
Date: Wed, 22 Apr 2026 14:04:52 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: hamoa: add audio PD remote heap region
To: ekansh.gupta@oss.qualcomm.com, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: Bharath Kumar <quic_bkumar@quicinc.com>,
        Chenna Kesava Raju <quic_chennak@quicinc.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260418-hamoaaudio-v1-1-a92866f744a6@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260418-hamoaaudio-v1-1-a92866f744a6@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIyMDExNSBTYWx0ZWRfX3yphg89to1Ed
 EJ1obbljZu2KSAwk8b/xK4IxSHL/M5+zpmnsvidDSo9gwrtumRWtGWkMDyhtzseiOa26hM23ax+
 8c0zfZAkAxDvpVYbmjUNS4GgB13n6AZszsjboXvcVsXGg2UMEnjD10xaARLE82AgPZ2A3sCCIl5
 cnUl7ZRG7AgSOYRp6ZiGTAo/WHZbAY3uMSNk3U4rg/OCOzYdE+eYr65ColYLOiSKDamZ/TjccaJ
 nne77/XsJP1yZ5X8bDTdMnDgYCm0riFi1SvpbWOhrlxuzQe/x7FnYtYWlf+5AWFPwdwz/gnMzzS
 aoyMQ7rXAHTmCT37qStdqOFixgDaZMWTgvWqO/M8rWEmHu8DUUkAON5zcK8WTfuS91785e1QllS
 usKMaaojgFRBz5usIcjqPDrgNA2TOrJvhzt/YKdP67+BAro/N0JC7rBUV77IkCqbgH6fES6mAzQ
 qoyNzLg0nhPPIRN9g4Q==
X-Proofpoint-ORIG-GUID: bXk6k432w5AqBih4--964y_SmfOAE4lM
X-Authority-Analysis: v=2.4 cv=RYygzVtv c=1 sm=1 tr=0 ts=69e8b967 cx=c_pps
 a=P2rfLEam3zuxRRdjJWA2cw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=f6Jk6cNHx7HiOWrMovoA:9 a=QEXdDO2ut3YA:10
 a=ODZdjJIeia2B_SHc_B0f:22
X-Proofpoint-GUID: bXk6k432w5AqBih4--964y_SmfOAE4lM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-22_01,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 adultscore=0 phishscore=0 malwarescore=0
 suspectscore=0 bulkscore=0 clxscore=1015 priorityscore=1501 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604220115
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-104110-lists,linux-arm-msm=lfdr.de];
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
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 6619B445AF0
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 4/18/26 8:08 AM, Ekansh Gupta via B4 Relay wrote:
> From: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
> 
> Reference the reserved memory region for audio PD dynamic loading
> and remote heap requirements. Add the required VMID list for memory
> ownership transfers.
> 
> Signed-off-by: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

