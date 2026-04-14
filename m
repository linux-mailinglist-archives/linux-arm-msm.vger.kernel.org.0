Return-Path: <linux-arm-msm+bounces-103110-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CKN2M+wU3mlBmwkAu9opvQ
	(envelope-from <linux-arm-msm+bounces-103110-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Apr 2026 12:20:28 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E00F3F8946
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Apr 2026 12:20:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7FE58303D330
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Apr 2026 10:19:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E508339902E;
	Tue, 14 Apr 2026 10:19:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Cjwg3l82";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="WkPsZMiF"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95B8439658D
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Apr 2026 10:19:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776161948; cv=none; b=nFxrYs65sVvsfLneR7S2NGblL6gxiBoPaExDIgOe4GLWKiO+z6kHoUj3izJDqPKyexvc2KGqB6qV6L6GubYNPWuolC6tEGXoUSEEHbQsVQkoMbzKxfyhy988kSqfPUbIw/G4ybVpdtmvm1JlxaobQxVNRLd5Np+pOO+IZSKPm0I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776161948; c=relaxed/simple;
	bh=vHpNUdCQGHAaZNdSG+mvjt0jTKa8gfvBh1rwe8/TOWA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=mxcC7SJf5biKZri7wbgXJ+C7HR69alhfm108QrASfb/Bu9v3FcO8ZDWQyw/1bnL04CcOPyXmUFuY1JGRyb0Sdm2APoZ2TDK5nWm4zSS55IiSdQ7dAMBQknQJEpJH0Bqq7Yzsr5TA6dab8JoMTFip1KxRP+IiVrQWEguKGwDcS8A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Cjwg3l82; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WkPsZMiF; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63E6VNK43157277
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Apr 2026 10:19:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	zsIx2znvs+AjtREQEwKslkZcBJGZR0bgCFbyOd4+ICE=; b=Cjwg3l828OoUJkU9
	b8tyfPSKQJiNyLKHeURk3WQLOOWUJVs7M/wSb9LCQDkUb5oGTU7d8ZPiuu2Qrwrk
	gH49fC7IZfTseEXR7pyaxtLSmO1xqz+y7XS/KPHVJRiFnG7Hhgi/GG1vpLWFz7n6
	ETYEA0rt7Y3qaG07SB0rHzpLDCZ/xwAm8sU88pAFFKI4g+y3s0rWJKMlktUA4aoO
	6jdO42M/JplMouEWuDhjx196BE0OZgGg/vp8g3u87aNYxBkY5o8aFn/KPSTlKVT8
	KIMiYRXQ/3shM9bmD7Qjc95+Z2nokMGYMmTEzcJLuCjJwz7vVr8zpwDwV0s1JBqB
	AmJfQA==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dh86ba8au-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Apr 2026 10:19:06 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-8acb3741d12so4931586d6.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 14 Apr 2026 03:19:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776161946; x=1776766746; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=zsIx2znvs+AjtREQEwKslkZcBJGZR0bgCFbyOd4+ICE=;
        b=WkPsZMiFW28Tr76NiaTklbTVywTFlmnWq51XYONya7uGYUejFVPUjCbPN2vtb1gJ/q
         omFBR64HRKaE0j+gFA38LMzvBXvqxwEe2iKrHGCRJVGJvNk7ptW9NE/F3ovjWyAKK2K+
         Z/GD7Jr5CxJ6nsidDzArcvma6zdcRSNH6rUcmOmgckBT6e3IX60Gx/2uoZqJGeW3DYaD
         OrObUAptsv5xBwu0uDSjQOQjSjUCMq2+1YwSA7VbnXs4J2VSkyBk99UqUVs/wc8WfZPt
         WWMMD5bkPrLeIGtErdBockPtz+OvKJrMf25t5UAI/PFXT8tDNb3zooBYIPdhXmeqfGU8
         Awrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776161946; x=1776766746;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zsIx2znvs+AjtREQEwKslkZcBJGZR0bgCFbyOd4+ICE=;
        b=BeGIQP6qbnG8ug28a2M2LMklPobFrwTkzcIDj9moA9km5nsAOkJF+gISn3vym0mgW1
         acwruP9yMEq6elOsJ+t2AqZSuTEQDtp8EaJsb1hmQPAi2DV8v1AtAoFxD9oQJELnSh3w
         3pe+q+IBK+h3ynalWhbOQtpUKQAspCDjsM1Ekf+0R6M7kTkszxUaO/pPL7sD7dFzAx2k
         K8kJaD0ZdyId6b2UNITkdtcSdXxaPOiYRY8lObLgn7vdx4Kq+q+b/fG0LniirL0rz31T
         ELO/s8P15EK1h54LNldd+ot3873waKg7FLHV5e5mxs3apZZkIXISn8Yo7tSKIBmcEY5I
         tKzQ==
X-Gm-Message-State: AOJu0YzoCDT76I36TofYOgqaPuxgA1UVTqvRSS6cYkWsuK9BrLnImNsb
	a8B2eGKCJmY5/0orBOVVTCaII4ZjaBeWRY9LFLJzgS2DhsxRXsQJs9hGqp6+hWS0xgGwhHYQwrm
	CaKmFP18Yweip73AzAY5sAoFDkmjMjOhA9PqXJYpTqUGO7mbBj+cjuBQYFGMkuDaWFWCR
X-Gm-Gg: AeBDietFd5xvMHdalQTwduYNRMhj9kwHBqyKNJmrCS7GdNYoUYyWOAmewook1my5C9G
	nHX5HNMuAWJ55Q45Rznk9AGhelT9Z6fT7mOkaJ7Bv5RaimEsXzHQFg2urwgQ+5wWb0XS5wTAY6k
	ijFkr1+lmP1CVw2FFOKZUHYT2CKgWHc9xSP1ylTim10m+Hpz5ssAONnZlcTWflngpqJl/4Jo8z2
	56l1pobTKwMVq8Ja3XGblyBIte0BEPZ+YPq2bdG88VhMmt/4gJznpL4Xqhf2Y2DSQDUuWelWm71
	bp8YFVsPfdujrKlqyoZ30vALJGPSDxGI93/22PQdA2Lf17g3SIVRWYnSHoOUtPY0gdyOLi/qt35
	dHsNhPb0yJmvEcblH04/pz6JRlyw5OFiWtY4UQpEP/SsplWVthaKNDEkP0qn53y6bIxRh+S1cdC
	PXPDhI1XLt5h2ipQ==
X-Received: by 2002:a05:6214:3211:b0:8ac:a0f4:5aa0 with SMTP id 6a1803df08f44-8aca0f45e30mr113540556d6.8.1776161945824;
        Tue, 14 Apr 2026 03:19:05 -0700 (PDT)
X-Received: by 2002:a05:6214:3211:b0:8ac:a0f4:5aa0 with SMTP id 6a1803df08f44-8aca0f45e30mr113540266d6.8.1776161945415;
        Tue, 14 Apr 2026 03:19:05 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9d6de97e43sm401628566b.13.2026.04.14.03.19.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 Apr 2026 03:19:04 -0700 (PDT)
Message-ID: <6187fa72-d14c-40a1-bc03-ba43860d0e27@oss.qualcomm.com>
Date: Tue, 14 Apr 2026 12:19:02 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 6/7] arm64: dts: qcom: sm8750: Add label properties to
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
References: <20260410-add-label-to-coresight-device-v1-0-d71a6759dbc2@oss.qualcomm.com>
 <20260410-add-label-to-coresight-device-v1-6-d71a6759dbc2@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260410-add-label-to-coresight-device-v1-6-d71a6759dbc2@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDE0MDA5NiBTYWx0ZWRfX2OO7EKg/umkF
 1OmU755az5y/SXiap93lOPbxXHvqW+5EseulfkUCHlNGXz7TI0iEO37wcS5SNZtApoe5pYhADbs
 ep+W1SVrxBuXSPVy7mHkhcef2xaUySoNeWASon1yPH5I9WnFjHOyz2SU++SYmM6MNq7AmryzRAl
 uzmjHGYl/aeAO9OiIIMrQ0qXi1iWJkWjYeVQo0ikbuAVL+TUIvIZO44J/OD8xohyvSZYD7By+jW
 uJuSz2+G+P34XWI4MQhmgsBXzcLFOUWxND9c4sArbG7PVSECf5V+uwDPuWLzJ4ZEvLDWgaZJa3t
 /zHT6AWBuKdPLaCg2noBiMWANEucE6j5R9Shqqy7CdxE3Qvx5XpG2qodfbPmt4XZaMkp9wgXTT9
 h9oLdSzwDnbao6P+xRMhgSHfryTHu0+5RSiAoeLOD7p8lRVfIdQiZAJiQRJbeEBXNuPe50ZSxZu
 MJyi4/SVvlvJoBB2D0g==
X-Authority-Analysis: v=2.4 cv=MahcfZ/f c=1 sm=1 tr=0 ts=69de149a cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=uGyuuOI-cJ-b_BVNecgA:9 a=QEXdDO2ut3YA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-ORIG-GUID: S96cLkOUZzcAeTFlrze__oAHEGd5VnkB
X-Proofpoint-GUID: S96cLkOUZzcAeTFlrze__oAHEGd5VnkB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-14_02,2026-04-13_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 lowpriorityscore=0 adultscore=0 impostorscore=0
 priorityscore=1501 phishscore=0 suspectscore=0 malwarescore=0 spamscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604070000
 definitions=main-2604140096
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-103110-lists,linux-arm-msm=lfdr.de];
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
X-Rspamd-Queue-Id: 2E00F3F8946
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 4/10/26 5:08 AM, Jie Gan wrote:
> Add label properties to TPDM and CTI nodes in the sm8750 device tree to
> provide human-readable identifiers for each CoreSight device. These
> labels allow userspace tools and the CoreSight framework to identify
> devices by name rather than by base address.
> 
> Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
> ---

[...]

>  	tpdm-cdsp-llm {
>  		compatible = "qcom,coresight-static-tpdm";
> +			label = "tpdm_cdsp_llm";
>  		qcom,cmb-element-bits = <32>;
>  
>  		out-ports {
> @@ -6814,6 +6839,7 @@ tpdm_cdsp_llm_out: endpoint {
>  
>  	tpdm-cdsp-llm2 {
>  		compatible = "qcom,coresight-static-tpdm";
> +			label = "tpdm_cdsp_llm2";
>  		qcom,cmb-element-bits = <32>;
>  
>  		out-ports {
> @@ -6827,6 +6853,7 @@ tpdm_cdsp_llm2_out: endpoint {
>  
>  	tpdm-modem1 {
>  		compatible = "qcom,coresight-static-tpdm";
> +			label = "tpdm_modem_1";

Please fix the extra \t

Konrad

