Return-Path: <linux-arm-msm+bounces-114186-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id OTkJGK9uOmqs8wcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-114186-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Jun 2026 13:31:59 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id ADCC16B6BBB
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Jun 2026 13:31:58 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=ZAdqmWk7;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=QNg6OEd+;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-114186-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-114186-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7E1163056514
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Jun 2026 11:31:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EEE5236402A;
	Tue, 23 Jun 2026 11:31:56 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9F3F35200A
	for <linux-arm-msm@vger.kernel.org>; Tue, 23 Jun 2026 11:31:55 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782214316; cv=none; b=SbJGlBZAnbDZznhfWcUFePgGb6OzpnyrSLjUTtAiEpZvyamFiJG2h6R8R2uG+7oRvWSwQP+GOHhOflDuX1v1c6Fwfox2dC9S9xQuDG2S1BSeCsOSNVD3oddUYNebXm/FsHQYJNkAWAB5Q/NIhzbYZXZ+AGYG1eXwwhiI87K1koY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782214316; c=relaxed/simple;
	bh=1bRuAxubTp1oa3c5PbjGwQxf40xJs2oOmi2fOgTZr74=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=GHkkvN62GBnDjRJU3qMgrVAfmBspWKESD8BM3ByHa+hoCu06Bfq+/J4C/V7WY15b9synskYQ9NIOf4FUzV9ZZ9UHwq3EL//tzGRL2qznM6onsEcf9lMlr3vHb337MOx2huvwddeA9ON/rWsaD8lpNF9yOyg0+3IXZvBVNL7ELs4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZAdqmWk7; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=QNg6OEd+; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65NAsk7i4152326
	for <linux-arm-msm@vger.kernel.org>; Tue, 23 Jun 2026 11:31:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	cBj5btd9lTLA6Ue9MEFblXr0NGN6kaTZJJqXH2m+DHk=; b=ZAdqmWk76vOgXAuw
	AvhITsoWOfnJfQVoHVDgmW3s6HKESt9PazuywBHl7ITpJ8ox9fp/vkjslfy9prw0
	7lRhuG7nABXUoMcmpHYKdDo4Hkc5/CY7V6SRxJuESmj1qGd7e5hfyOmBBdjL1Hgl
	sG+z8xfOVu/0axsYHzBgrJ8Tzbsufc8dFjV5nRBqZUCFnqH99fKBRGVMXb6j8eG8
	13MMerSGIO5CuxU3ovtGc6X3Xs5lPjpNZe0u1ojq5GNOGWW7H6LmqSmAZCFvO5Gs
	pgIpvASj6pBirsDBfGjh8cRrYBKlgHH0tiJQDqfzIYhZG9yO5QUsorsBh8kIr5wl
	ptMjYw==
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com [209.85.217.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ey5n44hj1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 23 Jun 2026 11:31:54 +0000 (GMT)
Received: by mail-vs1-f71.google.com with SMTP id ada2fe7eead31-72a42fa7ba3so2468025137.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 23 Jun 2026 04:31:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782214314; x=1782819114; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=cBj5btd9lTLA6Ue9MEFblXr0NGN6kaTZJJqXH2m+DHk=;
        b=QNg6OEd+VlUkx8b5ERdSa8O9/gJPe6HrKJW7gMp9II0PNT+ECQJeuWQEk7N+UeFewE
         LwNmfIZolCHf0MsYw60DRW4lqj5eL0Jc45IsJJjB6rwI8Sajf0U/SDZGPt8BPKjzr6+/
         U3xzJPen+572eAyj9f1JE/4X6u1m09HFgQiMsmm2IYWBaYKKxfkoRCZqdnXWxH8d+Cfn
         NKEf6ULSu8ifDPv5FMOQTUtw54RESaaIk0OPXvD6TXvY3wjwK90Re3crZ4kN+2vLmoqZ
         z1qC1EUSw+cF8QQACbb2aZV90fHX+YBjU0DIlNPsfcGh9pdG3v5Htokq+i03SrSakyNi
         K5Sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782214314; x=1782819114;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cBj5btd9lTLA6Ue9MEFblXr0NGN6kaTZJJqXH2m+DHk=;
        b=eqLxyfdgvZ3bye8uycdeb5oSpvOoR+xr4S0TU8+0LWYNT8QnFZMNgTXFmWQT9QpoNW
         4VEOskidA3V7f1TjH8yjhBi/mQU+hkcNtfRuWSYsEyVzvzeWsGZVQ46ay22raEcZ4N/9
         U42yZSWQQOtAg/tL86lJDeYDmAVSEsx2Q/xV1gIJEj9RNKJrK5+d8e6NiX0jBI11L03F
         ZShjg1A2c2/OXfJJBhguWF1MwfivTG3zuEoBNf3aA4aAOKZkOGMH92k0Y9goWegsUR0W
         aBDszkXk7rmGvofnP2aBy/CgshpylHDve6t+LtYzIFEaht4Qw/UTm8ievMuPkT3jPUvV
         T8cA==
X-Forwarded-Encrypted: i=1; AFNElJ/gt0N1YNXXgkwvMk2plamtaabrDsa/u910ObuAFNcDJbiufmZxZkgZ1i+YJ0U6buJfYyw1ozkAjzPuWSkE@vger.kernel.org
X-Gm-Message-State: AOJu0Yy9Z2Cj9YQSJ5PmOx1VcA/00VM4CenHaafUGa7MsMlaOjcvNP0u
	MWAteVnaJs2vVcjtootLaHtGhN8LvwxgPp2i6kRuk9lzjNqmke05Le4mFkgtHO/cA0IXcwc8zax
	kbD087aofjKezZEs3U/k2Q7GIfMxrn8pnTuwR53maE0nWv3qL9sc1mLAeOjG6Z9lQyDNGEsOJQH
	2/
X-Gm-Gg: AfdE7cmSPqTHQ0vj6pUFA6DzzOtVAi/pouw87cpudwLzfRbYk9sexCvRf1kUzNmeQRe
	VddSvu499lNeXUg6zKzmITbXJl+/6lZGJO/e+lF+y8xtgCkbo5fgcI/P1KqubN1pjCcZHQpVhcR
	AtQQCZ9H0vByUHmIYGRHE72LoOyw7NCrco/d8TMiy7loMFhg+wYKhQM5OyhGjC44AB0x+zO0U37
	rpIuv9TPKY0VtfASf4hKkC9pzVj2N2FNuVIm8TULt4GUtVqjqLxnKsWb6njOLKmpQiTaODzEYgV
	AghtESD8H9Z/x9f9o+P8f4wR2Wqir3059V3hrKvbZTwZkVW+CvnT0eLbM/LjTe6DYwRC3gTkKZu
	ZfUQvQynomv3TpeFA8mpydNPgbfLOg4+pmWSWWkjg
X-Received: by 2002:a05:6102:dcd:b0:631:2dc6:2f5c with SMTP id ada2fe7eead31-72a19f9bac9mr10458304137.0.1782214313729;
        Tue, 23 Jun 2026 04:31:53 -0700 (PDT)
X-Received: by 2002:a05:6102:dcd:b0:631:2dc6:2f5c with SMTP id ada2fe7eead31-72a19f9bac9mr10458247137.0.1782214313240;
        Tue, 23 Jun 2026 04:31:53 -0700 (PDT)
Received: from [192.168.1.110] ([178.197.218.240])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49249238bfbsm309629475e9.5.2026.06.23.04.31.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 23 Jun 2026 04:31:52 -0700 (PDT)
Message-ID: <de941d2d-df5d-44b6-b95a-437e35917cd5@oss.qualcomm.com>
Date: Tue, 23 Jun 2026 13:31:49 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: eliza: Fix disp_cc_mdss_mdp_clk_src RCG
 stall on Eliza EVK
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260623112755.317180-2-krzysztof.kozlowski@oss.qualcomm.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260623112755.317180-2-krzysztof.kozlowski@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjIzMDA5NCBTYWx0ZWRfX87UEVdtdtlGT
 kQkiJEOIsyHW3io+aWHBlHczk8LCcnqxBfV82vugAjtoRn1WDAfFdJwOkM0LoPAN0Vxxjdm6681
 UVipwNAJBdPgKxPe972geHMidm/Mk1I=
X-Authority-Analysis: v=2.4 cv=R8Uz39RX c=1 sm=1 tr=0 ts=6a3a6eaa cx=c_pps
 a=P2rfLEam3zuxRRdjJWA2cw==:117 a=qMZSjPy+XpteAuilWfML4g==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=pX4Y2oqsHS_uD1ZpdeUA:9 a=QEXdDO2ut3YA:10
 a=ODZdjJIeia2B_SHc_B0f:22
X-Proofpoint-ORIG-GUID: jSfIlyMis3TU17gdGcouKUX7qxXbXcUR
X-Proofpoint-GUID: jSfIlyMis3TU17gdGcouKUX7qxXbXcUR
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjIzMDA5NCBTYWx0ZWRfX/VIEQahj/zMS
 cepW33rrKVG2wlymcjaMt8T3ixSs/SZFzQOnsGPi9WVEXJe6XKStUUvpNeDBMMDk0h4thGGq8nw
 2A5BtZiIzfC9cCiunYpPSm6q1nmB/a3OcAH8Pgq5LJSeICc8Q9zgiD27nyv3As2AycXL7u98uHD
 AA9t0PiW1QOAjRVdG112du2KLsIgC7F2gZIoCEJeCMu9VNU0ZrAd26VLEg5Q2rtlLPKaVoUC3Ko
 K05KiGegS7Ny3zijrXL3zMbeALZUOc55RM2JNNgiZYW9nU8hvSlhBV3O3o3qGDqJAXXjHe4ObNC
 2a8QUqJ7YgCJYGz/qX8gX9HwxPexieVLOYAa1hawZxt8dJj/uEjaYZH2Fm9FCs6ALFrdxgB7VuB
 0TGKQDFPOdruXkZ1gr84eHsUeA9qUjhwbtfc8dTEPeUYakvvFDMP5mxreN7URxzF3C4Ctf3pmdI
 nckXz3vWzLMDOyT1tsg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-23_02,2026-06-23_01,2025-10-01_01
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-114186-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[krzysztof.kozlowski@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,vger.kernel.org:from_smtp,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzysztof.kozlowski@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: ADCC16B6BBB

On 23/06/2026 13:27, Krzysztof Kozlowski wrote:
> Eliza EVK (eliza-cqs-evk.dts) does not have display enabled, however its
> Display Clock Controller is enabled and references parent clocks from
> DSI PHYs.  Devices which in base DTSI do not have all required resources
> available (e.g. because they are simply disabled), should not be enabled
> in the first place.
> 
> Having DISPCC enabled without DSI PHYs causes clock reparenting issues
> and warning on Eliza EVK:
> 
>   disp_cc_mdss_mdp_clk_src: rcg didn't update its configuration.
>   WARNING: drivers/clk/qcom/clk-rcg2.c:136 at update_config+0xd4/0xe4, CPU#1: udevd/273
>   ...
>     update_config (drivers/clk/qcom/clk-rcg2.c:136 (discriminator 2)) (P)
>     clk_rcg2_shared_disable (drivers/clk/qcom/clk-rcg2.c:1471)
>     clk_rcg2_shared_init (drivers/clk/qcom/clk-rcg2.c:1540)
>     __clk_register (drivers/clk/clk.c:3959 drivers/clk/clk.c:4368)
>     devm_clk_hw_register (drivers/clk/clk.c:4448 (discriminator 1) drivers/clk/clk.c:4672 (discriminator 1))
>     devm_clk_register_regmap (drivers/clk/qcom/clk-regmap.c:104)
>     qcom_cc_really_probe (drivers/clk/qcom/common.c:418)
>     qcom_cc_probe (drivers/clk/qcom/common.c:445)
>     disp_cc_eliza_probe (dispcc-eliza.c:?) dispcc_eliza
>     platform_probe (drivers/base/platform.c:1432)
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/eliza-mtp.dts | 4 ++++
>  arch/arm64/boot/dts/qcom/eliza.dtsi    | 1 +
>  2 files changed, 5 insertions(+)


I should call it RFC, because this feels like a band-aid and should be
fixed in clock drivers maybe. Eventually DISPCC should be enabled on
Eliza EVK for HDMI, but DSI PHY will stay disabled.

Best regards,
Krzysztof

