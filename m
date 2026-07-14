Return-Path: <linux-arm-msm+bounces-118971-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 8WQPHyviVWrwugAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-118971-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Jul 2026 09:15:55 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id CD10A751C44
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Jul 2026 09:15:54 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=jGBahuQg;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=EZUx+8+d;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-118971-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-118971-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6A64E3045ED2
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Jul 2026 07:13:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EFDE73ED3A6;
	Tue, 14 Jul 2026 07:13:43 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 999523ECBD2
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Jul 2026 07:13:42 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784013223; cv=none; b=TU+ffycjfvBpZMhMvKRjvkYqm7HRQ6EmpMVBhYjIF7K2iyfbSWBfO1x05XcOw0dEKjUyDpeMQkpNPIAeAVLksstY/1Ng1qxgEpNtiw6jRVVuI2/eqN/dC4Aa2dPXobGzCbo6n8h/lbQW6KBmStS/ECr6/Gdr9RTgdaueoL3pS2g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784013223; c=relaxed/simple;
	bh=10PpcB6hMbBy/TqJvOjI3AXK8sik4AAVgaMK/mryWok=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=YIbcuHBMK6OtH6Sb2M3+/sggR1PqrpDOFRIx47jPGXZAIrVuMCkP/s8CCoo4jCp3Y70NH5QCRmxKw3SVf9jyV8kY0oQHJzPyrwNUd75AHq6bmOdK0gRzbM6xzCKryIdbcltmk0bRPn0lbEAidt7dxGU9cb6rGVEAaApRoLrwfUk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jGBahuQg; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=EZUx+8+d; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66E6SNmB3718200
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Jul 2026 07:13:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	hEuXaptqgexcqhUclIgAyN67jw7nwpql9tUfRxxjufc=; b=jGBahuQgH0POE8Qd
	GKNqLLEdWgBN+XJr5C7J8OVKfGw+kHVZ4G0Stzlsi+YtFdathHj3HTLL8RVoFuzH
	FiJPc86m2BQBafWWmUlkHgFGrERjK9yExejjyHCeCHghtb80L+5rx0tUkwp+hCwT
	C9liWCCQmzXr64svBmS4GOagwqqHoMLS0yYewe/O5ZWIiEgVTLwP0ThNaVvXVH5q
	2CagVzwlzWfLAQ87xUWAn/Rvci2GT9TMsrz0FdsnqPknIqAkNf3yMW1TGqAcLt4x
	5k2h/NW496FfZR4Ze4pBctdgsMx7oSe7a2uYorP3vH5tnIxPjIkY6VSpwaudHbso
	s8nu2w==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fd7gvhs2y-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Jul 2026 07:13:41 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-92e6cb57d25so83633285a.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 14 Jul 2026 00:13:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784013221; x=1784618021; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=hEuXaptqgexcqhUclIgAyN67jw7nwpql9tUfRxxjufc=;
        b=EZUx+8+dFqqsr6NoHhBSMZ1Kp99ZzCIxdNWHrNukyz2jg5K69/L7gCFousLd7xPTiC
         1hhQM6FZZm+gamNGfDPke3ZGgwl4C8O8jwjfv22dJiJL343b9j9DIumzveHS4pgoL5qT
         FKBn/5C/VUR40VeqLzJpd0rFe/wWRHCiv1lXRXg67QitrOHfClc4ZmI7nAD4TdccCbaY
         3y736l6lQS8a+hqgEfT7Zg+kROB16VN5fsT9vxmS/Em81DxUbfwcTabje1ZG8AOOxiLx
         Vtk2h1hOa5fnAz8uRrZpuAylyMlci/eBvRcBiXILfOgDGhaTvUpxrZAqYFyrF9OmzA6D
         2EtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784013221; x=1784618021;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hEuXaptqgexcqhUclIgAyN67jw7nwpql9tUfRxxjufc=;
        b=UFOIGc0vsMCdbZXwXOI0EDZHBpsa1Pe3xzATbDIBspSx+RDQKkkkllvGDiYQE+opf3
         IkEG6EI37yRzyXemYVS2Eu7SSg4LPsk+nvANC/FL72GqilIdTc1nM1UvCI4BtErVOyFD
         bbEpC0pECXC5eH8SlJHnzpdnAhNopfL2skrprK0g7CvxfVyXqEyO77V9O8J3q/KjLBCN
         ZRSbQUUoIttIzIOoWDYPGGGq5dOOeQ6wsFXKldKDtt+I5ypSKNZMMp8d7P+G79uJUQjm
         FTAzsEsGNG6/vXbQIxLQ4w5lRxhZNptGimGu/3+8eJkvOXW4+i3kd1frYfdnKg2NjVfL
         jm8g==
X-Forwarded-Encrypted: i=1; AHgh+RrL0y0xQOULWeINkLcObxIki0Zk1s/mWcaUb0HNIrTGKtfSixA5vdiUoEn2K3J7Ah8jjzbs03LkpX5brxmm@vger.kernel.org
X-Gm-Message-State: AOJu0YzeZHhaQ387x7ZPhC2kuOuNOTVeN0z0RhWoDiowKw8OxBU43nRk
	DDHieeTcGC8WkLOsIHJ3xyNWRpovomgrCZDdUdsgKOacVtYeXji+O0aHQnvAtmW/Qklgq3bZWeE
	RDO90dy17T2C6WtH5eG5R+GjsZAok4fimCH4Do+K0dUCdQcwO4ppkz+zU+Q1uJKEOx2bB
X-Gm-Gg: AfdE7cm0FF4Bxv/VFCovL1H/MonRXHtAqey6CStc8RfP7XR4EWEuJwc4yvcLAJAVQZ3
	4+Ma9HQY5m7EfsgoAJ6BRnsB4hHsBWYlhmOcgPm5tmdKQmJhPBRlqMBkihHM8yNl1S7atvieYMG
	kSkT80SsQmNd9Y2DR3uz/unmppnpkki3HxFeAJlfBjVjwwMlmqkuv8wtUIrcswddd8Pt55CDbz6
	stl6hIp7ND0GOtdlqmJFWaT1DtVAkcgH/dAmNjVAMDp/zDS1u6O5HjSq6ykFDFoq1cKw3F/DSzk
	95L77W6jeL4PlPYMRV5cjlyk/nvLTBcZRFiwmRJnpOCMehNA0Uxt25vY6XXg5ap5zuehNRwdAom
	SD9SYfKzxWPzdREBQhlG28P4DY4XxwA/tAyQ=
X-Received: by 2002:a05:620a:6403:b0:92a:228:1bfc with SMTP id af79cd13be357-92ef2af24fbmr918752285a.2.1784013220923;
        Tue, 14 Jul 2026 00:13:40 -0700 (PDT)
X-Received: by 2002:a05:620a:6403:b0:92a:228:1bfc with SMTP id af79cd13be357-92ef2af24fbmr918751085a.2.1784013220521;
        Tue, 14 Jul 2026 00:13:40 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c166608c3f1sm47370866b.0.2026.07.14.00.13.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 Jul 2026 00:13:39 -0700 (PDT)
Message-ID: <197cef00-cfed-4819-b956-1a94335e1423@oss.qualcomm.com>
Date: Tue, 14 Jul 2026 09:13:37 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: eliza: Fix DSI1 phy reference clock
 rate
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260713125837.727632-2-krzysztof.kozlowski@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260713125837.727632-2-krzysztof.kozlowski@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE0MDA3NCBTYWx0ZWRfX5Ad+6tj6lxFW
 hLOjj9P4rz7pU8OoR/p0hzAlvxsmrpq99ks8TLqm+RJjmEOo0igAaYqoY1ZPbAn9jgD7gTujn06
 SYKMHTspuv7V50cARUE67YtYOE9Ou6JCXUtt5ydV4AyOm1yxAhZpVO7M2i5QxV11p9kfejfXojS
 2TBj2u4dnBD8AWnCr4UMz3+yDL2++4HGZetc+Yi4A5MrJTRJQob09QNl8YhLmJYHyi8aCuCLlBr
 X84JVlx4awkyJiYKtmh77xa/E4r16olrAaIMXZUKcJ8YN4Q4xyr1fOL6OVdUhrfbxO68aBI0Mr9
 9wtH8NFKAWo4CfGcxZ3Lx5f2k35Fp1rDL9vp4TmywBsSosZbUbSVcyR3y3RkgZYva2jDPAmDU70
 u47A8yRlkjqeUMmGd9qSio4gUsu0XFGGrK68ImaraaAgJlirfy6I0i7ViKv4DoZc0A9u5/DzGNr
 a5lpZqF3uKYsEwL8Vig==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE0MDA3NCBTYWx0ZWRfX7CZEkBEo/VAL
 K3k4GFuKR6+DmFHktNuGAqcz0E05jhUeo7SP5iH4+dHuFuFQ536kBiyah1nBQVCBCoDcVx7vQzi
 goVcNTFP1ftN1FrEoGpJ7K62imC4XeI=
X-Proofpoint-GUID: HF3DNJWARMU4_IpNAvF-vfjMGuUxTl-3
X-Proofpoint-ORIG-GUID: HF3DNJWARMU4_IpNAvF-vfjMGuUxTl-3
X-Authority-Analysis: v=2.4 cv=NYjWEWD4 c=1 sm=1 tr=0 ts=6a55e1a5 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=m4qzsdtWhx_JNS0JMQoA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-14_02,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 spamscore=0 suspectscore=0 clxscore=1015
 malwarescore=0 impostorscore=0 phishscore=0 lowpriorityscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607140074
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-118971-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:krzysztof.kozlowski@oss.qualcomm.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:dmitry.baryshkov@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,vger.kernel.org:from_smtp,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
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
X-Rspamd-Queue-Id: CD10A751C44

On 7/13/26 2:58 PM, Krzysztof Kozlowski wrote:
> The DSI PHY CXO clock input is the SoC CXO divided by two.  DSI0 already
> uses correct one, but DSI1 got copy-paste from SM8750, which had same
> problem and copy-pasted code from SM8650.  Wrong clock parent will cause
> incorrect DSI1 PHY PLL frequencies to be used making the DSI panel
> non-working, although there is no upstream user of DSI1.
> 
> Fixes: 159d252ed800 ("arm64: dts: qcom: eliza: Add display (MDSS) with Display CC")
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> 
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

