Return-Path: <linux-arm-msm+bounces-113599-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id ostiAdZ8Mmrb0gUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-113599-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Jun 2026 12:54:14 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D7D5E698B19
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Jun 2026 12:54:13 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=JsGkc56E;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=IQr5IZmO;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-113599-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-113599-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id EE58730F9AE9
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Jun 2026 10:47:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7756544A725;
	Wed, 17 Jun 2026 10:41:47 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8119F407598
	for <linux-arm-msm@vger.kernel.org>; Wed, 17 Jun 2026 10:41:45 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781692907; cv=none; b=l0WWY5yiqmlyetnbUPsrYk5rPKvzPgLMVW1FL0GmmjEFDZpWR8cLD3E67ErSyJSq+VZJYfHcksWJUTD4mXvpIpwoJCyKY1/JiFmwmG1AyUMETjUh/yTKDyYuouWQza3eqMNEbmxtdr/YbgTjpHU83n8ukkNL6kpwsQYUul6a7d8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781692907; c=relaxed/simple;
	bh=EUSlZUwLWMvoVEDQr9/idc0e5nOVqqbWV2y/4x7vcOQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=QUB+URzjhp8UuFJvW5i4Co55iQUQ+Yjp/bcL3HCk/iHbNH2PtA939l7q4OGJhtLisg6KkZ3viVhGlBKWEIw05OQ/VOFLASbK8QZuGmJFAs/1wvdlG7aSSvNAtJyciMHhCNShkmfXDFFO7VY9St5YRCpu2guYxekaXK3jzNIjdko=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JsGkc56E; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=IQr5IZmO; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65H8Uj6d2220000
	for <linux-arm-msm@vger.kernel.org>; Wed, 17 Jun 2026 10:41:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Oru800u1N5Baz11FyB0glT1J3RCvxYRPqHUptIb7xPc=; b=JsGkc56Er/VFUAZg
	i6UFvOqOoiTsMPKtsbi+WGz3aMNetqsFhB9IgbOgfHJYMWdHaICW+coxUXzaxVkG
	dZaM7W1N/TWvODuftfLYGblHbT0N0DCTQQDaoOyf+4axqy5T2Irs8muA3uUc6VIU
	pxMmPFpqLDhVdAF+xWa3HxyIWs5kFTQ3IdLFVAvorlyvZv7siJqsKTW2Eb5DjKIG
	3gi+nF8eMCUvhCR9e1doXAyxoqKPmF0+chCCfbAcyAnKrMYxVD0Wsm1Ipvo7Kkr2
	l4OIPE2olOyEBhahKHnYNNWAQRYgXjOQVtiCwbB/Q3EafEZx6b3Lpc7xpgXG01Oy
	AIut+g==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eueeraqya-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 17 Jun 2026 10:41:44 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-8ccd69b9a10so11520446d6.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 17 Jun 2026 03:41:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781692904; x=1782297704; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Oru800u1N5Baz11FyB0glT1J3RCvxYRPqHUptIb7xPc=;
        b=IQr5IZmOzWBLp5FSdfMVvYKpKuBbzz6GTX6cTixJaQ8nAzL7bnlbkxuF9X94YF67tk
         QLm7dTZgCrfL3l5uEtuhaOQCYnUQK8Oq6YuChhWSIcUHZfi7uM4QGpFDHvyhxm3Gflc5
         6lbAe0wzP0EHdeakWDio2qF+3+B1SRzLn5RmtjKUkbZ1kNsyff9lbEKznWz06BetQpOo
         GXRo8AQt0zgAsWEgx+p4kNwVlVwWkTbr+3wArdN0GpkxAWFEJg3KubWlRwcFBkD+5aVt
         B01jCA6YkqoML7iRAkPgJStRSvMZcBrwtF5oegEHCI1ODEIEPlZ1swJVjxqufUnQhyfQ
         7hnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781692904; x=1782297704;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Oru800u1N5Baz11FyB0glT1J3RCvxYRPqHUptIb7xPc=;
        b=LyncnXOXa0kYN/vapY1hgSU3ssjrTu5EvGCmgxursTZ8usQyVAWW/g6VTO0O4f63vQ
         4guwVkh4wKca/xaaIMHk2DpnTFw/x0awKnyvYX58M1AC17JsF9MphGH1hHtOVjo5677s
         XaJ/usYvjDnzMe/6zfhMb99GLNYRY9wM6aeeAIHlL5OvacX0aHXCUDBpLX2hTIk3wAqc
         PZhtc24EdUPWDV0OVFjJg4B+8Gh2jgN7ZJDg9pr6mz+wEzU00IF4wmz9xnC0AzRtOk/0
         OZmvselaAJo74OBSEs0+WSFGA69QRrQojtrNl/HCB8TfNu6Wyszx9CG9baw4SXmtyGpe
         ABLQ==
X-Gm-Message-State: AOJu0YyyY/U+XzvZNYgio+b+96TF/5+UbWKqg9aDDmxfIjqJ4aBnKwJi
	rj/0MnnlS0qmjHz9sZ4/gHPxk9TtF335OVLJVkd8BMjjY3yw9diFbplffWxUrEDaa9mhZlY4R6C
	LfHcAaaIGL/PGIntmilwR4rb3HWHDkldkCQkxWXBztHgyLiL6ZxA+mNuzQjL1O7aHsIm6
X-Gm-Gg: Acq92OHNO89ilEQvjSUXVm50ztlbbysYavqNY+XKh3UDBjQ6GWsLP0ULKHz7TrE94F7
	xjyc3W74lO1y9qdAzNlmdjB4IBYH3ovJ0pkgkCWGL7Hh/ae6ePh6Bd3B/P/BSm/w5r6erAmz8fr
	lJpNw/5zAqm2K26sR6RPb6eE8k6byQrla98tD9dg87lNB11a4ImC92YcllT8MEvbkxD3q7rRjtC
	EInLzEp7H4i0wf6bDW5hslxvJQbMLDgmCWY9ZBXfoYbAOWwYFvJXPyhhlV2cU014fZ+uV8OmcMC
	uYAi3XDJgzTASzimC+ZhZDI8y2vIfMZjbXUaghUXBfEXu/lDKHO0SJjq4AY8nNSgGoi3m/bpfgZ
	JUXGvB5AcFfZSK/gN4T7wHSQS/K6pGLPTgpo=
X-Received: by 2002:a05:620a:4408:b0:8ee:e440:fae2 with SMTP id af79cd13be357-91dbc52bf48mr248046285a.5.1781692903786;
        Wed, 17 Jun 2026 03:41:43 -0700 (PDT)
X-Received: by 2002:a05:620a:4408:b0:8ee:e440:fae2 with SMTP id af79cd13be357-91dbc52bf48mr248044885a.5.1781692903311;
        Wed, 17 Jun 2026 03:41:43 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bfdb7b6dbbcsm800392166b.32.2026.06.17.03.41.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 17 Jun 2026 03:41:42 -0700 (PDT)
Message-ID: <eddd77cc-fabc-4a2e-aff9-602895495ad1@oss.qualcomm.com>
Date: Wed, 17 Jun 2026 12:41:40 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: sm8750: add cpu OPP table with DDR and
 LLCC bandwidths
To: webgeek1234@gmail.com, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260605-sm8750-ddr-bw-scaling-v1-1-f39f918c95a7@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260605-sm8750-ddr-bw-scaling-v1-1-f39f918c95a7@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE3MDEwMCBTYWx0ZWRfX3fHucVj+2Q1y
 spJ5HUbBJc12RKrCBTOFAF30je6HMr2zy8T6mq8G0umzdisMSGI9ocffBEqafQxueLRi1VD1Ifr
 jGHN4neXt+RLUtBonGPU2FInG4C2pe4=
X-Proofpoint-GUID: VhX-U4DDOIJZ7iMBEdRwyDH9jyNUm1m3
X-Authority-Analysis: v=2.4 cv=d4fFDxjE c=1 sm=1 tr=0 ts=6a3279e8 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=pGLkceISAAAA:8 a=SpO0_8FnA-QHqli_aE4A:9 a=QEXdDO2ut3YA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE3MDEwMCBTYWx0ZWRfX4sSzUSQXtZy/
 dljwfNFI+uAcDCFeEPLFu/yBsH+HuvukE7QeSFQBAgH9aAluugiA8nRqf5fdV1WcXDBD8k9WVw+
 s+FtUde4aULtTgch38vVGiy7xO9svtUnjt2YpFpJumwv2rUTnEd/PhjvgjBhRf6ztqroJBDDc2E
 rxs3qgRLKE/bL8T2TIQY1ym6pNyIl3NZpZ6oKQGur9hH+tVkN5a7ODE108Y9NjNnZA8WB9WACHT
 tVpL+KUMLAb4IIR/0Hcpq7yZi0aSE3mOk+byRpdo7fYb+ywlLp9ngtQX/lHa8afWsKt2IOZcxsr
 MRXKUDKuoY4lcEvlBjYfMlGyxDaFeDSZDYoNUy3W/xB0ghk9f8fdBq8HVF/18gUIzff9aquqEPW
 We2I6T2B2rG9HaioQas0HVXIHJzW4P0uDTITIPG0QxWvCdQYzT+J4nlHy4CQGTXGxYLb7BAFcsv
 Gi0Y2hOo8uk+bHGyiPw==
X-Proofpoint-ORIG-GUID: VhX-U4DDOIJZ7iMBEdRwyDH9jyNUm1m3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-17_01,2026-06-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 malwarescore=0 lowpriorityscore=0
 phishscore=0 bulkscore=0 clxscore=1015 adultscore=0 spamscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2606170100
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-113599-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:webgeek1234@gmail.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,qualcomm.com:dkim];
	FREEMAIL_TO(0.00)[gmail.com,kernel.org];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: D7D5E698B19

On 6/6/26 12:36 AM, Aaron Kling via B4 Relay wrote:
> From: Aaron Kling <webgeek1234@gmail.com>
> 
> Add the OPP tables for each CPU cluster (cpu0-1-2-3-4-5 & cpu6-7) to
> permit scaling the Last Level Cache Controller (LLCC) and DDR frequency
> by aggregating bandwidth requests of all CPU core with reference to the
> current OPP they are configured in by the hardware.
> 
> The effect is proper caches & DDR frequency scaling when CPU cores
> change frequency.
> 
> The OPP tables were built using the downstream memlat ddr & llcc tables
> for each cluster types with the actual cpufreq LUT tables from running a
> CQ8725S device.
> 
> Also add the interconnect entry for each cpu, with 2 different paths:
> - CPU to Last Level Cache Controller (LLCC)
> - Last Level Cache Controller (LLCC) to DDR
> 
> Signed-off-by: Aaron Kling <webgeek1234@gmail.com>
> ---
> arm64: dts: qcom: sm8750: add cpu OPP table with DDR and LLCC bandwidths
> ---

[...]

> +	cpu6_opp_table: opp-table-cpu6 {
> +		compatible = "operating-points-v2";
> +		opp-shared;
> +
> +		opp-1017600000 {
> +			opp-hz = /bits/ 64 <1017600000>;
> +			opp-peak-kBps = <(1353000 * 16) (350000 * 4)>;

I think this should be * 4 in both cases since the interconnect driver
ignores the channel count for a node in peak voting. We may have a bug
in all other DTs here.

BTW, are there no lower OPPs for the fast cores?

Konrad

