Return-Path: <linux-arm-msm+bounces-104300-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yJVoIKkD6mk/rQIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-104300-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Apr 2026 13:34:01 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 20215451511
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Apr 2026 13:34:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 6234F30098B4
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Apr 2026 11:34:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 557CD3E92A7;
	Thu, 23 Apr 2026 11:33:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="eSg12e4m";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Jw/yVxz3"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0718337B3FD
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Apr 2026 11:33:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776944037; cv=none; b=dQoUr9nCJSVRO1WM3E1+mQsst6N6FkKHwDj6J3iF8uf/1MU6QVRHwNMn+WkzgTzoxlk5gzeaavsbnOGtTOF42rFobnTdIv+CfxenpoZQ2Y//mfY2WeXmM5gzrrvcIYgItWdhnKEpAjC/93WaMOHyN3s+rMvueGF/ONqciFNdIjQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776944037; c=relaxed/simple;
	bh=xPkBnI2wgGNOydM8rQ/yy+jiFReNyjAZLlORe4qET9A=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=rEq0+sD0GOBMUTNBk6xc22alMdP4vvDIL/0lgK6AivJDf3h53JrHvU4ZLrLpRVRn/HB6AOsSBXZrJCecRhu+ab90OufRVmnFCHm9jva21S2RE/MV2poTYv3gnekS4WgnfQGyh4b9YSiRhwURaJtIZbGLd/nN5AgbQVO1MS1T/UE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=eSg12e4m; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Jw/yVxz3; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63N8uEtW3044044
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Apr 2026 11:33:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	0JzILOHEjMNOT4SKDrr0FqziKlNV5iNAFkS/CvFGT1o=; b=eSg12e4m79bxHhLJ
	Zqks9qdFV0C2Md1tFHxjyrYvbYXCpAuunJm1UCOoEl0ks7P9pkhX4Y8mw2LiPiC4
	kXinl2dJzLyZhOpr/BJVDWzKBDtHS/2tdu4WQeU0F5HiS5o3S3zbWUOiql0glnCb
	TnEeDanu7is6I+JF/sLQcaFRAHElsyHjfNa0Obt6CbKdnaO4e9xOQcRqFVJ1Vh59
	nxSKT91vsU30omP3z+fMJB5m1FHidAcYR1rqnJydps2FcpmbdJ6ntPFjjCxxjg1X
	iBTdpq0ABOLAdtizxG+QQhFa5HdSmjY2JiNvHMWnyKKajiC0SGQUg/qUGStZbIOc
	1KwCOQ==
Received: from mail-ua1-f71.google.com (mail-ua1-f71.google.com [209.85.222.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dq1jh3mhy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Apr 2026 11:33:55 +0000 (GMT)
Received: by mail-ua1-f71.google.com with SMTP id a1e0cc1a2514c-94de248f59eso362701241.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 23 Apr 2026 04:33:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776944034; x=1777548834; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=0JzILOHEjMNOT4SKDrr0FqziKlNV5iNAFkS/CvFGT1o=;
        b=Jw/yVxz3EclFHbMyHCqr6AATNfA54Ygl/pDj3iPZ+qseUSH4cZg88RleDhoELhAhaD
         whKRVliY4FqO99pRElsHhonwusab8wdTkN3twVAVS+B4jFskaji1TyGj8EHL5jaQNWtX
         NZ6hacCRmSYtWXxC6NQdRbsnKboZT6eq9so2ObV1sdFcw0yI1VrlavSSo7p+sCKAQWOM
         WUgCeDBIVQ7UdkgKvERSv7y8s07BU6BRovAULFVKpsU0eVuEUn9DerUfYKnr1kCRTXyn
         XYQp9+uvA7mUwpETp+7Ms8erUkjlEhybgGBK1GG5f7+gfA3WrLE0y92M39YwJnMgJcQv
         1lZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776944034; x=1777548834;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0JzILOHEjMNOT4SKDrr0FqziKlNV5iNAFkS/CvFGT1o=;
        b=T3ERv/3se9tOMKdoXjIhLxTBNtB361JCYaE0dmJ70k62nCw9YwkyR5yhDwv+GvYjjj
         UdXZvtg79Xhdq+DWSNSSvTJ5aG78RyDmEgd7200JklKjU5oXoyjZBqVppXzStie7borx
         l0a/EusDjUqDEbK31c7YQnqtHPhQTmNO+dYYfxfVdk5OG0eqNZi/rDjZked46X7BheyR
         GoQPQbCtp09NSZW7spavE3GFdaFue5YAHIaukDlRsA0lXrJPhuxTxPc9Iuvg5p8j3g/0
         g8YFHcG0hZcVdYKOL08M9G5IBwcFJj1F15kyqbXmktyE6SUmTJfnZZL2GAttdYoPqLyx
         p6bw==
X-Gm-Message-State: AOJu0Yz2lIdwHsZiaisPbHiQmqzjQAWN3L3co9HMPcXzlhoYrNt3ed+A
	ncNnwnq7DlrgoG1+Cf9U1wU5BYHB+GlgN89fJyIHuNVOIgLQOVacjA9bKLPewiRiW3g9xuPCyfu
	wfrW1NxBTvF09jBR5hMcHJPDsCpN+TH5V8N7kYzb7Zor0WvqN6Ebetumd4TgfqTYFckbI
X-Gm-Gg: AeBDievkORymwqToFT8apsTHWKD9lYYCDgdltXQlG69xBwWCO2EjyG7wIU1zIpkuYuh
	VNX16TVc6IAmTtwKBfDHEXN9Zj8mp+oDzRVYiTr0qKQ5h8D8v/eJPFUtR36upDgTbOUAhI650Ch
	Ba5dVk7J3yLFIgsJ456l+u/yXi08xiN5RA+nXNA+cMePMABbepjVh0eY+34uwku6VApS7pdKBsR
	RWWs2yhBnguwX/P7KwsD1+cqmwxBRNxYg2wBWEqYPqDIv/9M4w/6fdrKoslulOnuFt2lCGHLYjV
	xGKT/FeHgQt0s/lKnAkPgMsMzY6aTcC+DtLTDCO8bxa3jtBY7b3lHEA6o10H7YfVIOVA066kUZj
	od4ROmMKtWpnIvTHaiV3OdmTe2O4qwixr6UaZ5ROvoG6eA8gVk4+VfvaTaUu3qqljowvOcNaF/O
	y8XBjxer9xAl8dsQ==
X-Received: by 2002:a05:6102:26cc:b0:604:f71f:9f0a with SMTP id ada2fe7eead31-616f70f6114mr4619786137.6.1776944034379;
        Thu, 23 Apr 2026 04:33:54 -0700 (PDT)
X-Received: by 2002:a05:6102:26cc:b0:604:f71f:9f0a with SMTP id ada2fe7eead31-616f70f6114mr4619781137.6.1776944033997;
        Thu, 23 Apr 2026 04:33:53 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38ecb5f66besm43901711fa.13.2026.04.23.04.33.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 23 Apr 2026 04:33:53 -0700 (PDT)
Message-ID: <b86f2bef-206d-4399-94cd-70f7a6859605@oss.qualcomm.com>
Date: Thu, 23 Apr 2026 13:33:50 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: talos: Add passive polling-delay to
 gpu-thermal zone
To: haritha.k@oss.qualcomm.com, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, manaf.pallikunhi@oss.qualcomm.com,
        gaurav.kohli@oss.qualcomm.com
References: <20260422-qcs615_gpu_cooling-v1-1-d5a984ac29e3@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260422-qcs615_gpu_cooling-v1-1-d5a984ac29e3@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIzMDExNCBTYWx0ZWRfX8WN5p5sTHvHv
 q1fR3UCH4G6g0binOmVoeEuQy8n2NNUFmbviVYbPZwPks2BwPiMImlQAtprrvsBEA1NkJj3MocT
 h8nqZBOKojAdr50dI0aEzdlVcuhmipHBw/EXs+N5IqiYxqM6Lbjno4iKKMTkTcafrRUqLUMrAtJ
 UuBkke1eS5O3Mo1Sc62Icf/Yg5t96fhoh+fJSNlituO2L9BTm2k+QOEJYSqS0IM6m5ZOFmQcnvf
 RxXZP1+8ulVlAt1c27WN/1lnUSRl0j/brK46TC4TwKgTpQPdzWWnIu2/AUtJP/MIgBk3++oLoJO
 v5PYixyIQhhI1y5z2A7ed1Y4oqasI9pNSlEbthpJgQ5umpS7S8KK0VjH6ChdZDbQ4dYxRJJf0iW
 41fdW0eNGZDjJ1OACCfJvCl7xtDnUcPbxPE32LRmrnYhCd3I7Twm12RL3UINgNlZmrjUkClOl8R
 l3ZaQfvfRw10G9AJ10Q==
X-Authority-Analysis: v=2.4 cv=OeyoyBTY c=1 sm=1 tr=0 ts=69ea03a3 cx=c_pps
 a=KB4UBwrhAZV1kjiGHFQexw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=75JJAfU0c98d6Js1ZXYA:9 a=QEXdDO2ut3YA:10
 a=o1xkdb1NAhiiM49bd1HK:22
X-Proofpoint-GUID: sJlWfaEQ6_VL0l39vYCrJ8s7Zs253l4k
X-Proofpoint-ORIG-GUID: sJlWfaEQ6_VL0l39vYCrJ8s7Zs253l4k
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-23_03,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 adultscore=0 suspectscore=0 phishscore=0
 clxscore=1015 spamscore=0 lowpriorityscore=0 malwarescore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2604230114
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-104300-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
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
X-Rspamd-Queue-Id: 20215451511
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 4/22/26 3:45 PM, Haritha S K via B4 Relay wrote:
> From: Haritha S K <haritha.k@oss.qualcomm.com>
> 
> Add a passive polling-delay to the gpu-thermal thermal zone on Talos
> to ensure periodic temperature monitoring while in passive mode.

I feel like the "why" part is missing, i.e. the commit message should
state why that's desired

Konrad

