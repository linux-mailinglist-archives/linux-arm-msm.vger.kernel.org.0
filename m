Return-Path: <linux-arm-msm+bounces-114695-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id tGW8Kl+ePmrGJAkAu9opvQ
	(envelope-from <linux-arm-msm+bounces-114695-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 26 Jun 2026 17:44:31 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 092E66CE9CB
	for <lists+linux-arm-msm@lfdr.de>; Fri, 26 Jun 2026 17:44:31 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=gNIrHKHI;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=kMzJvXjG;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-114695-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-114695-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6B16A3001CD4
	for <lists+linux-arm-msm@lfdr.de>; Fri, 26 Jun 2026 15:40:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E0B4E2F3C19;
	Fri, 26 Jun 2026 15:40:21 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A7BA3E0241
	for <linux-arm-msm@vger.kernel.org>; Fri, 26 Jun 2026 15:40:18 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782488421; cv=none; b=WPeXKjYN87n1+F7sjWPSSHI/nKfpxzTz6W82sJ/iYst0c/n6Gxphkywpn7PdflbVPA7LteMOj0sm3oly2uGXyYYQfxCQKWksNWhVDTG2LohM88Pb7Wxb8OzPxU/yB3x4FYVAMR5SGOK5b60q3VPYTALVy57sxjLZZp6eKd28PwQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782488421; c=relaxed/simple;
	bh=VPX+Y+I2zKqgUrK6npnDcblJdZdqqHQA/AWxPWZA95Q=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=NGOJfSb5oad5E71U815HQPnzx+ZdVniu7vpIqLlxI7HpCztf83X1h5JRxBT48AIvKLH0ExoTkavXGEnf52fy7K9ZUl443wdS65eOWjf5dScBSgB6mXH/ovLdtYLgJuN/njvP8uNP/TyNz/AaA8Gv0u3XoT5u0HJBW+U1qAWS+IA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gNIrHKHI; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=kMzJvXjG; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65QF3sn21086814
	for <linux-arm-msm@vger.kernel.org>; Fri, 26 Jun 2026 15:40:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	6/MnbH8+qXomOREAJjF5VA8g+RK45+UV5Cu1RHNLwxM=; b=gNIrHKHI6YoHyoW9
	kSMJXmAEdsowB5e12LE2FJvZzibpLEKz8JU9BjWrYttC0nLfbRHVfdFSN72JauhI
	wrnexHyHMsLuCUFQ7+Lg9tzbCTCpUgxHDYmlQcgpzeStoBupJwDNt1y04E1o8v3s
	h4k4MHNL6hO+yLBII8sBEjIMO3MQDNeKmnYsxQwBQ23fVQdmIUBPV1w9aDBRdn8k
	Sg7K19fsA2I1Uwy0TAnlyjSlKSIiI5LWxadbEOEe3g1SNjK5Sy2E/keS6PXGJIaH
	aoKCTVaiuqJeVHasHdigS3piTiuZVD2tvUE0p2Heij0PNozbLnvy9kM0g5c4nY3H
	aJKrow==
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com [209.85.217.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f1j1njmvs-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 26 Jun 2026 15:40:18 +0000 (GMT)
Received: by mail-vs1-f71.google.com with SMTP id ada2fe7eead31-734f7d8bb37so82220137.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 26 Jun 2026 08:40:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782488417; x=1783093217; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6/MnbH8+qXomOREAJjF5VA8g+RK45+UV5Cu1RHNLwxM=;
        b=kMzJvXjGERBQ3v77VwFVPzCXoCPmf2sFNe7VC/L6y/Vkugi30BKGJmD7WfCni1fomc
         WdX77RBfOZ7AbGy2bqQdWlziRoGuq24HwRO3W41D4zkar7zgU/QEE54pOKZh3GCBohds
         Qh6L4pT0fEHG38Fav8mdRRX7E8icwqn3paV6JnrTVXbOOzCaIlL78gxYsMEKMETlMP4U
         57IMtnPhCNn6OjDPQlj01Hn8DqIInAcmrp5fGDS/shveRlpAUs7tccF/9v8Jcjr7QgN7
         sc0hS2YKJGHWWi/AlC6zWZDwKLbwih20TUGTg73w9q9t4+p3rl4xAVgCtVCKa1PoeEFw
         IM1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782488417; x=1783093217;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6/MnbH8+qXomOREAJjF5VA8g+RK45+UV5Cu1RHNLwxM=;
        b=abNqE3V3OMc1p0C8heqbTQyznDrhaGsVkVS2CfHTZAw5Up25yR3rdxaY2JN7+Lqzz8
         2cWM4c5VS1pdnUuMk0XloKTCZlLEZqUJVS/fQXETCPITHKoYi0A5FQgL4r+9B262Exgu
         56Y5s1jIHEY9XI6MxhQZ2JPgE4cSso5WQv4usWqNE6rSC3G/enPWQ/qsGewMlTmoDDms
         ECwt5KwG+rFXr6dr4b2VtV3Ha3vFvFWc98yt/zb2CqHJUXA3N4a0co+e/8kEMPpeBNwo
         qMsD6j2AtvMdS3IQqOPXq3ENDc7c87ED//OOo9t7ROMQohIqECNJjdLhMoO0NsT7RnuD
         nIug==
X-Gm-Message-State: AOJu0YznX6yiy2kDVeuAKQROuPVCvc1gfSUwCXq2VROTSv5dd/YIB85Z
	OH5nRtbh5YNch4CreEjBRzT7topNYA5zpjG8J55K0K4w5vo2IkuHuF+21xd20pfNQNVpc+gJoc4
	L7we1DGQM9WScgcynHCXZmiZh6ujmopTXD+3R6A6LAA8C2AY9oVEYAlXzqJ8AF1giWPBf
X-Gm-Gg: AfdE7cnWaYAd5D/15VLt7f6XgGWapYnDuWigb8v7qxwu2m2zcjIBqq015LWkQSAcmDn
	uJWpXUmY9cuKwAQ1Ab070jvrBnuUXQ14AUOV+HTCuugOFyGN2ix0NWuZCohnVpXTUaRJKPRnWNv
	Lil2HWNigyUT3LyTbRKCusrnbmEnydD+Fvdv597CLkblYNu/HDSr9BBJnMd0jtDM9JVCKxc9l8a
	FGR37H8/bkVot8092dwo7j7I4PsDiEiT+Gap9pek9iLG8SyYmjzZovJB5QZldtbrIqc8zaeL3X3
	BQJl7oD4H+0mW4VuTF/F6Uc+tl/R3GD3mej1yeL63SxIImtSQ7wj4ImpqOMNlfXrjesTWMxdP9Y
	MbGCHWxPBEam/vNZFf93doUYiXt+LBrGd1OQ=
X-Received: by 2002:a05:6102:440f:b0:633:3bf6:977c with SMTP id ada2fe7eead31-73433e2e7a8mr1296512137.1.1782488417153;
        Fri, 26 Jun 2026 08:40:17 -0700 (PDT)
X-Received: by 2002:a05:6102:440f:b0:633:3bf6:977c with SMTP id ada2fe7eead31-73433e2e7a8mr1296500137.1.1782488416715;
        Fri, 26 Jun 2026 08:40:16 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-697f3ac4774sm3143421a12.3.2026.06.26.08.40.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 26 Jun 2026 08:40:15 -0700 (PDT)
Message-ID: <eecf152d-ec0c-42e7-beed-5a592661d9ac@oss.qualcomm.com>
Date: Fri, 26 Jun 2026 17:40:13 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] arm64: dts: qcom: glymur: Add label properties to
 CoreSight devices
To: Jie Gan <jie.gan@oss.qualcomm.com>,
        Bjorn Andersson
 <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260624-add-label-node-for-glymur-v2-1-e8420fd7025f@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260624-add-label-node-for-glymur-v2-1-e8420fd7025f@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: UOaRHNeqhggrKoa4Hv7QONZhpOBbbugJ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI2MDEyOSBTYWx0ZWRfX1EepXQl/ftW/
 U/caXEZGjmNHwRB3DXC2fSno8BO4SMZBAfw1aJsrVKmNauZ4uc+H1vK2DVgT9KL0KewW983Ba1F
 EkO4Jwr4rz4zhpv/dXl1q9yILea+ficwILAKZj6wAtIjvQGo8i8SZSLFiyn9U6pVswMqNB/dqrL
 aY+FKT40DSIdgj2n28VR8putwTLVW9nKneIfnv0vTmFT3ffT9SShpbS7PuZvqs9sKianfx+zU1J
 pFYqzttkWAcMRYTXCkNvZMahBj/9Ul+UQ9UPTuhY1DeHFtcRxzpgQdHET4AL5W11bb8ywXJzGJa
 WvM8rIU9e9Fn83x9sMqEu+DR5gjIL4KIL3+iJSuhwUCGTp40FZqlawmwHoWmsMnRNBsqIXk9hCk
 DLta6VcEmnhqI7Jlu/YLLHkz8w6mI6OMjFmLYTk3A098z0zQ+pDsWwE030tr0V3HYWoRRBoPWpU
 nYUZVb52CVjb/OS+X2w==
X-Authority-Analysis: v=2.4 cv=W+cIkxWk c=1 sm=1 tr=0 ts=6a3e9d62 cx=c_pps
 a=P2rfLEam3zuxRRdjJWA2cw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=eoqsAjppAhVGH4h0bNAA:9 a=QEXdDO2ut3YA:10
 a=ODZdjJIeia2B_SHc_B0f:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI2MDEyOSBTYWx0ZWRfX8Dt9Sj9VERI7
 inqlQFp8IcAebunUrbHM/OYH9vebsVOc9inRoUaMKf+OOOloq1SIThHVmBegMZu4owKsEecB4AS
 eRJzuczAlPqTVL+EWQplBqD57IYmRUg=
X-Proofpoint-ORIG-GUID: UOaRHNeqhggrKoa4Hv7QONZhpOBbbugJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-26_03,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 malwarescore=0 priorityscore=1501 spamscore=0
 bulkscore=0 phishscore=0 lowpriorityscore=0 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606260129
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-114695-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:jie.gan@oss.qualcomm.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:tingwei.zhang@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,vger.kernel.org:from_smtp,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 092E66CE9CB

On 6/24/26 2:38 PM, Jie Gan wrote:
> Add label properties to TPDM and CTI nodes in the glymur device tree to
> provide human-readable identifiers for each CoreSight device. These
> labels allow userspace tools and the CoreSight framework to identify
> devices by name rather than by base address.
> 
> Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

