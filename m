Return-Path: <linux-arm-msm+bounces-114189-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id uXJMJ4JwOmo+9AcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-114189-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Jun 2026 13:39:46 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 999DB6B6C90
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Jun 2026 13:39:45 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=N5jUbw4W;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=iVW50ysg;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-114189-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 104.64.211.4 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-114189-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 77BCC301C193
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Jun 2026 11:38:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0B1A63CFF79;
	Tue, 23 Jun 2026 11:38:34 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B49833B42D3
	for <linux-arm-msm@vger.kernel.org>; Tue, 23 Jun 2026 11:38:32 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782214713; cv=none; b=PtTBis2gAc2CicfnWJCLYgK4y53SzTXvXuFGizuFhDdby7/gDM2/gvU9os1p5j3mVfVOIBmVILvhDW2QfDwT0j3092SlyuKyyURe812jsUCwpXIzH+MapmEsd6MSw+UE5sByFPq5o4VwIKwuyoHL/ocYH7HGjXOs1ZCEEZeZ6lA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782214713; c=relaxed/simple;
	bh=bdRZvFUFJ6YdCd3H1MQvxbtY6BSzx3TZaBhgZfRgU5s=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=U3tF7w64nwPB87L06n6MOTpeLWPf8KBQX4Qy7djnz15Rlwqt7WIFQTXuLwnpAi3E3X5r4JhNItnNZx5A+olZbN+A3KZq19rTgPuEcoBQQj+oHLYzkrbo+frjcOm1rIQGlDYJED25BGpN/+jEMq4K6yizOaLgq75G6Hl967wU/b8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=N5jUbw4W; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=iVW50ysg; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65NBavXt052567
	for <linux-arm-msm@vger.kernel.org>; Tue, 23 Jun 2026 11:38:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/F1/g2zzEa3MI7jpnvVCZoXih7VzPKL+dy50jsl4S8I=; b=N5jUbw4WTS1evJtv
	AC0MinG78L1rroW/BJGzj2HeFeVWoPNGPcFQ5shoGNl+P+i6EOUsSwm87yhIMbtB
	5nNQsg0cbdOjQ6BRLJJDTlC1zAy/63waclOwHmtqZ/EZxuBwjbgUq715+/T7yvvF
	AyTuZLN7BCME09ts/Idg01YgUsebNueD9nttXY2mv4cg7WfuvFYt4ZsvJAO+XDL3
	L4PzzXkldB6PY7me/pUjV7eFWe8l7XmNey7MfV7aP0fTXrmSa/Nu2k/8t/J7d7pq
	2DR9g1ckE4rQ7K2ZPYMTReIQqTtFHVleumkxOk1EHy9BpkFfCIxlEq7OPDgA/i5n
	Q9hQ+A==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ey5n44j4d-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 23 Jun 2026 11:38:31 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-51a15cef334so6267661cf.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 23 Jun 2026 04:38:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782214711; x=1782819511; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=/F1/g2zzEa3MI7jpnvVCZoXih7VzPKL+dy50jsl4S8I=;
        b=iVW50ysgJpmJxUvJntFCFcu9bNyfjEk78dYOzTnyGHOsGN1hj8OcmP+siLIA6XGe4h
         aFjU4OJNJrXnKD45Rznxt/f6LoJtIdhd7rt9mXWZ6HrDRlz0c4Uv6Ctk+uvxO5gK38vA
         5R9RCBY7bUaxq+rk4rVyG6PWOTbiv6pawWOJP9D3n+uCZrCYu/JFkVmL/B8WIOTYQwAU
         RPa1Tny2rUp12YGbgM7broDEiRG2tS42m8/NnEMrSG9Bg0PH00n7lFFQpJwEO5ulJyt3
         zKZXORtmaSNnq9FNlepplw4kh/KErMkmo4ZY9hD5xdzKg5TayRChSdHWjA+VnruZCua3
         EhxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782214711; x=1782819511;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/F1/g2zzEa3MI7jpnvVCZoXih7VzPKL+dy50jsl4S8I=;
        b=CpZCqQSX1d64Enmupyd4MOYXED85pJ0exLUrMlcc3aMYDFSje40hDVwlp1XXS7bsmO
         K/YoQ7he/uvidCOdxZ9o0yJ7esYkgM7wWXcdG5cXIV9LgmGshg6amQpcgxpcO0IstXQH
         OWBP99dlcpZGWP5Cwt1eQMNQgZynahuI+J7CvYKGZTyY+qUAetnKfLDyEIv4ckXdu5a2
         YwHNkPKYD4olXDr/yt4zmM5CefSzLxHQvhcjztyPsV3dnHx2eAT3nguR9e9eAHabeYkq
         d5aXEaOV9d8OxhE0ej3l+qbtlSQpvnKmAghSvyIHwFgXWVLV03Lwc69vEMPqcOMQH0Od
         b3HA==
X-Forwarded-Encrypted: i=1; AFNElJ/HWmTfKF5BKqaLmPgt28slHgwYyRL7BvZkQcLNiZfO1eSz6jqawTTJW4QNKq7EHabRDmGEnNjo9udQGjuY@vger.kernel.org
X-Gm-Message-State: AOJu0YzlQbFgVw2sI7JQPu0ORK6oFubKjJb0oK+OOiY+n2OgTv6hr1qh
	YmUuMY0LlJWaRZyZxGFvBKPq6VP9uQp6pXCZfD1hebKKQZ4bQx7EQF/wqOux1a0rFx8ngkGB4VY
	lTWl69gpQB14XxbOXyzL8Vr3cuJC6Bomp8YaLTPfyz/D7zfu5U7u6dU/Y7cVbmm4PfXhs
X-Gm-Gg: AfdE7ckgnOet9LXQXfQ+J67kPXkrld+1L9ipS/KXNit15KMAv8Vl9SAiZK30Pb93pcv
	JTlk2eZgo22N3AXPsa5qqxeI1T6QmEAHz0qZTtjdigPIvAvX15vCXG8P1aRhaZoFNlmQ08vEN2Y
	lby6wAEXlFeTuVx0Yj4AvLJKf+zUVe5sUC4Db1Kg9LS55iiDPPMwzreoxeAQouiXN996MEYTP8v
	8QDYyJTivsjqJCM1D70doIfF1D0J5719wFg0o3x5t4xhrkO80ckeqqmJ/yVOz/2B/2a6pyYhWIr
	cXHMEvfYNNwglqUNIqBCxCqsWIJ7st4e+F5QgzzCyjWJMy9ok4lqn2FABWqYldRxUbNS1ds/8yz
	+dE+hNGU4afryw2L7JdYi30uT3++5T0TRUBo=
X-Received: by 2002:a05:622a:650:b0:517:62f4:e3d1 with SMTP id d75a77b69052e-51a4f42cacbmr48709431cf.2.1782214710761;
        Tue, 23 Jun 2026 04:38:30 -0700 (PDT)
X-Received: by 2002:a05:622a:650:b0:517:62f4:e3d1 with SMTP id d75a77b69052e-51a4f42cacbmr48709111cf.2.1782214710160;
        Tue, 23 Jun 2026 04:38:30 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6977b86de31sm4344561a12.12.2026.06.23.04.38.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 23 Jun 2026 04:38:29 -0700 (PDT)
Message-ID: <be95b95b-dbcb-4b80-94dd-a7e97ef4c446@oss.qualcomm.com>
Date: Tue, 23 Jun 2026 13:38:27 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: eliza: Fix disp_cc_mdss_mdp_clk_src RCG
 stall on Eliza EVK
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260623112755.317180-2-krzysztof.kozlowski@oss.qualcomm.com>
 <de941d2d-df5d-44b6-b95a-437e35917cd5@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <de941d2d-df5d-44b6-b95a-437e35917cd5@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjIzMDA5NCBTYWx0ZWRfX1R8CPsLssvBq
 2t89cMWQctzn+6go9bVU48MF+dZaL4ViKOXu32ovvJh7N0eGtC9MOYJiYH7SP8ZSoINKJTuGuoD
 igs/6BUSjzKSE88mIcLIZ82w5UyCKiM=
X-Authority-Analysis: v=2.4 cv=R8Uz39RX c=1 sm=1 tr=0 ts=6a3a7037 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=Ktd-FhGVB0-9PFP5HxAA:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-ORIG-GUID: NNuF901X2QGrUw7ttaNScZycPyyEczGw
X-Proofpoint-GUID: NNuF901X2QGrUw7ttaNScZycPyyEczGw
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjIzMDA5NCBTYWx0ZWRfXwfoEsIczsO7S
 a59HSg333GlpdVDP25zzKWE01wMckmgS17UPVr0DXIGuifreABuHwKkpe5oTi6QZEwrOifyQx8e
 eGAyS0JPXyaHbE+NDa68r9edU+lG6Oic/cRI/Mk5PThbkl7n4rdjqlL8+VPr9fRsxkXcoAS7GPF
 xKcaBA+fjos3r+WDmeYWhcolcZSMCMs99Ue26OFLQUjiv12NG9dCEbGGXjA8/8OOKNXMZT2LB+O
 m8TSBXpgukYlC/Xs0J9JWtvJBG4gnWZXcQaVbCWk7iIQfF6HF8KTtDT5YVAhxAaSp86tZzTdc9D
 vYd5BS3ogIDNs6950I0h5aVCZlSDkoT6nv4dU05aefhI4CvIppt+dZgN+8q7Wm+v6IpEAaDKL8l
 s5KrOL70RC4jBKMmWFip8jA5zpv8zcbei5moEIvkGSqk+5hKC7gDtBcDqN0O/VwL441hu6o1/RS
 J2CUuVYFAznWnP35Baw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-23_03,2026-06-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015 impostorscore=0 priorityscore=1501
 lowpriorityscore=0 bulkscore=0 suspectscore=0 adultscore=0 malwarescore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2606230094
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-114189-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:krzysztof.kozlowski@oss.qualcomm.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,qualcomm.com:dkim,qualcomm.com:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 999DB6B6C90

On 6/23/26 1:31 PM, Krzysztof Kozlowski wrote:
> On 23/06/2026 13:27, Krzysztof Kozlowski wrote:
>> Eliza EVK (eliza-cqs-evk.dts) does not have display enabled, however its
>> Display Clock Controller is enabled and references parent clocks from
>> DSI PHYs.  Devices which in base DTSI do not have all required resources
>> available (e.g. because they are simply disabled), should not be enabled
>> in the first place.
>>
>> Having DISPCC enabled without DSI PHYs causes clock reparenting issues
>> and warning on Eliza EVK:
>>
>>   disp_cc_mdss_mdp_clk_src: rcg didn't update its configuration.
>>   WARNING: drivers/clk/qcom/clk-rcg2.c:136 at update_config+0xd4/0xe4, CPU#1: udevd/273
>>   ...
>>     update_config (drivers/clk/qcom/clk-rcg2.c:136 (discriminator 2)) (P)
>>     clk_rcg2_shared_disable (drivers/clk/qcom/clk-rcg2.c:1471)
>>     clk_rcg2_shared_init (drivers/clk/qcom/clk-rcg2.c:1540)
>>     __clk_register (drivers/clk/clk.c:3959 drivers/clk/clk.c:4368)
>>     devm_clk_hw_register (drivers/clk/clk.c:4448 (discriminator 1) drivers/clk/clk.c:4672 (discriminator 1))
>>     devm_clk_register_regmap (drivers/clk/qcom/clk-regmap.c:104)
>>     qcom_cc_really_probe (drivers/clk/qcom/common.c:418)
>>     qcom_cc_probe (drivers/clk/qcom/common.c:445)
>>     disp_cc_eliza_probe (dispcc-eliza.c:?) dispcc_eliza
>>     platform_probe (drivers/base/platform.c:1432)
>>
>> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
>> ---
>>  arch/arm64/boot/dts/qcom/eliza-mtp.dts | 4 ++++
>>  arch/arm64/boot/dts/qcom/eliza.dtsi    | 1 +
>>  2 files changed, 5 insertions(+)
> 
> 
> I should call it RFC, because this feels like a band-aid and should be
> fixed in clock drivers maybe. Eventually DISPCC should be enabled on
> Eliza EVK for HDMI, but DSI PHY will stay disabled.

I'd say all of that hardware should be kept enabled, if only to
make sure that it's parked safely

Konrad

