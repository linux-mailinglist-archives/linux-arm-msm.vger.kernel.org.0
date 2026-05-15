Return-Path: <linux-arm-msm+bounces-107784-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yOZYFhD6BmoKqQIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-107784-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 May 2026 12:48:48 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id EBFBA54DAB6
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 May 2026 12:48:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 3993031DC4D0
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 May 2026 10:29:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D68E93E9F98;
	Fri, 15 May 2026 10:29:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="f4O24kUA";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="BUQBS6St"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B6C63D34B7
	for <linux-arm-msm@vger.kernel.org>; Fri, 15 May 2026 10:28:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778840940; cv=none; b=dYNp4nWEeqIrnrP/4T+SrIA1yfcOQ4xlmmC16XFkwRUiNnsOthFJGJ7Q/eoaqbb+Ho9UYcEBz5ExNf+1S/kKm87hdQHkE6d/ySTdJ4vjeYEl9D75/JHoi/6P9wsgPgrymQRVE/CuEaGI4+FhIcid4uPQhYeainZj5ywmcMm4efM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778840940; c=relaxed/simple;
	bh=1Yz/EcUmW9zfWne8Xzd09ymy+W7uXt8JQ3e5p3N3gFg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Iir6a2FLuu493joWupZSNmv30iQqeXFAzhPkwvHtC8AA5yXS265hUEybJNc38uE/Nx88AGD8iww6V4GtmFMaD/eBCzgx1jfbbrDTUmyDhfTgYvx6AL+FK6xW3dxmTSFbMO3R1W3MyXbLTkbK/XfYrD74sO5CQrUGavI6fD/xrjQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=f4O24kUA; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BUQBS6St; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64F4vbbY3513635
	for <linux-arm-msm@vger.kernel.org>; Fri, 15 May 2026 10:28:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	79VlzIrGeomGTJq0ibBMeq77VXZ65QnBt/A7OAjU0As=; b=f4O24kUA34Vv7HOK
	RcRvTPqIziAR3TczZDBVZvIoVjJfDfjMQwX+3oc/9Q7mlNXg9frsIBZmcY/N+aZ9
	pzLmEhbWjAo49/b4dODJtzDGdt5gcOmsWFC7HZ//1I2LIcg2EVJwN/d6t7oCVr08
	0dIHF5m1Bb747di1bvKknY91SHo1gU4aFvYfHpDGMTqww8LGVqDhzYYmzzaOOTDH
	L5HXB/839pOiZlLgRTCiDg5KvYRbNV4h1JvGzq16YFxc/GRhvRcMlF7n3sWH3Ofe
	CIJcRmB9yMou5F4YzRv4dgmOuIkLv3mrD+UOSmDYPC5L2Q0+fy0i0Bt1BF7Ue7FE
	s/gxZg==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e5m1vau7r-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 15 May 2026 10:28:58 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2bd5b20aaa6so19911465ad.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 15 May 2026 03:28:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778840937; x=1779445737; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=79VlzIrGeomGTJq0ibBMeq77VXZ65QnBt/A7OAjU0As=;
        b=BUQBS6St+38pOFAxSOGIPtd5V3d5lJzMiM7KIyVb4FzG2rBtt69Yl9yQegAo5UlV7r
         b4jvPw+EFxt32gT9C23kXaVYo4zB8wx8RRcQxxrVcPvEKJaA4QFrosHHr6tYPZ7CfmcW
         GM/8hFTnsUdAWG2MdPd4HidsNUyOafjNNvRpnKY7QT/9fXbq1k9u/L/ml534Dakt+8Jb
         XPViAFBfoFB55vB9ghTtXtLZOvtlbNfc52o7rg+mSogNtoGs7cr40wdgJKZLM4QPc3RZ
         MUfa1yEjmXqdpa0y4R0iaYck2ZmMUJyKeLwsiJ8Gnq5Z+nWvGTd2QAgxceuFNdMl9wpM
         NOFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778840937; x=1779445737;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=79VlzIrGeomGTJq0ibBMeq77VXZ65QnBt/A7OAjU0As=;
        b=oYGJ4vQCEE9uHNSlu9U9HjbvwORosVO+zkXtuAX81kfcYXX7+tjEH6axqHqflm6wMJ
         K2fsNz/q+9FRg/bsS0KDEn3crKNPnJQaqn+rIlRpRh9oRes1IHQNBaSl0N/H8WYKj1u4
         z3DEiLIjrPos4szKR/1fP73qoXTQSKfqIQlit0GdJjRBsaLgqCwnrq/RNbptcWGzbjHa
         vG4kTYd+BdY8eYQIdoHuZ61Ol/QLlt1Bd1l06xwLnUX3Za7vmP8F6UTkNXTsqT7hApnf
         dcNRlNaKnvZFJKx0fOdZ+fOnP3mhhOnNpYJrOa4Sn+002CqoXicNkCfAMzd4pwg47Ah3
         JyjQ==
X-Gm-Message-State: AOJu0YxrDTsHzWDwZ7t67rJtX8Swe0zjVnus8xe0+MClUpaR9BUv5/aT
	jKMJ2N/vONAGXva+lIjTiVYCf/tz/rfyzYaiGl3tTm9ELZFQXuX9k8z7ameXz20TCRsKbt/l7XM
	LQ6TM4mIAilpa0UYmCtg0JDDQSWvsHQK7MvOmtN7dXNBZtkqA/ia68ygk8Vik9kwzetPv
X-Gm-Gg: Acq92OHWmEVvpnlp3t3Gmvv5+Hi5TZAjOZUCO1sOml26VeaB754+JmPAdLAcdlpJixL
	uteQIF+1XOyALDuPjJYieuFC6rfjUzhiK+alw/wv+5NlXpc5Pxh1ugOkWSm6oTqV5BH+aSEVWAu
	juFrEifDtA3yrS5IMFPFWtFwgBToXvA/wno1hTcEq3Z8rAOfakiMofGSY/G0iyJpFsWYmo5K/74
	gJJ1kjj2U3DGHex8Y5nv1wa0YidyEmy5pH/VmbHxBHo6P8uQXN0+u3qD5J8uJcN3tb+CaFd0ogW
	vCkG4rtRHA7eOiMA4A6iQ0qO2FwDoMcv+Q5nYdf7hAgu8ut3sRem9naeRXcJIHAszRVW9O1Lq5A
	kXWmAaor4C5UxrsBwMlafxUZ+g8sJlxpcbsGSjpEBWwknGK05sgYIF6FqHrIKQeI=
X-Received: by 2002:a05:6a20:918a:b0:39b:e321:67ea with SMTP id adf61e73a8af0-3b22ecac1eemr3942676637.45.1778840937362;
        Fri, 15 May 2026 03:28:57 -0700 (PDT)
X-Received: by 2002:a05:6a20:918a:b0:39b:e321:67ea with SMTP id adf61e73a8af0-3b22ecac1eemr3942638637.45.1778840936857;
        Fri, 15 May 2026 03:28:56 -0700 (PDT)
Received: from [10.217.222.91] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c82bb062941sm6648770a12.2.2026.05.15.03.28.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 15 May 2026 03:28:56 -0700 (PDT)
Message-ID: <54fbc2bd-811b-4b35-987a-1dd5e6ea447c@oss.qualcomm.com>
Date: Fri, 15 May 2026 15:58:50 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] arm64: dts: qcom: shikra: Enable ice support
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-crypto@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260515-shikra_ice_ufs-v1-0-b1b6ced70559@oss.qualcomm.com>
 <20260515-shikra_ice_ufs-v1-2-b1b6ced70559@oss.qualcomm.com>
 <8ed6604f-f959-4b20-8b23-ded130426f36@oss.qualcomm.com>
Content-Language: en-US
From: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
In-Reply-To: <8ed6604f-f959-4b20-8b23-ded130426f36@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE1MDEwNSBTYWx0ZWRfX29sUqz4bY8rG
 PxKlQakI1tgmX7yf10qfcBEiH6A0oK9BUTFKCtSlbyKQX8p1DXknfgEG54dhc7HJWKtVkr99bYh
 5mJuceMEQXhxZtKRy/z3o3y6v3ngQcYODqYO8FD2mTlObk5vWv0Y8zxqnMniV1IUrYOrG4+Lpuy
 gQDVYw4Xcp//4DvnYY88RS+zENwrZ3A2hWl4XSDrsZCcqmHLP5JY7P8cfwFfkzHo7C5C+88DWlJ
 i+1rI3TEBCOrtmxtTt/RENn4ibC5T0CqV9jncAjUJcE57TP758JsS4sBii9EAJe1ORuf9iBaa7h
 pNXjh5ry2zfaDn7omBLZEcgH8TKZk4isSUFQq5ec1Vs0fURJoSYBPeqfsuirF6kBt8wYhv9iIUC
 2XZX0I4SI9Tj1Ew2ktH9SF3wJO3UyoF5GS4gHyguMzjIno4BkPv4T8evvv6GUSYkelFr+UMs0co
 OjsK1Lp9D/BH06N7snQ==
X-Proofpoint-GUID: 5f8wyDwo0NLcED2t97T6vXUBDfw_n4FK
X-Proofpoint-ORIG-GUID: 5f8wyDwo0NLcED2t97T6vXUBDfw_n4FK
X-Authority-Analysis: v=2.4 cv=BvqtB4X5 c=1 sm=1 tr=0 ts=6a06f56a cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=iVyd5dlQVcev7GM2eQkA:9 a=QEXdDO2ut3YA:10 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-15_02,2026-05-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 phishscore=0 clxscore=1015 priorityscore=1501
 spamscore=0 malwarescore=0 bulkscore=0 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605150105
X-Rspamd-Queue-Id: EBFBA54DAB6
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-107784-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[kuldeep.singh@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

On 15-05-2026 15:54, Konrad Dybcio wrote:
> On 5/14/26 10:30 PM, Kuldeep Singh wrote:
>> Add UFS inline crypto engine(ICE) support for shikra.
> 
> s/ufs/SDCC

My bad! Thanks for pointing.
I leveraged commit message and made this mistake.

Will send v2 with updated commit message.

-- 
Regards
Kuldeep


