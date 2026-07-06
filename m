Return-Path: <linux-arm-msm+bounces-116778-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id D1SKCaKcS2rKWwEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-116778-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 06 Jul 2026 14:16:34 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FF84710636
	for <lists+linux-arm-msm@lfdr.de>; Mon, 06 Jul 2026 14:16:33 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=Ozq9EFv4;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=ijUrqeAv;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-116778-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-116778-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 96B47302865A
	for <lists+linux-arm-msm@lfdr.de>; Mon,  6 Jul 2026 12:07:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9CFBC399375;
	Mon,  6 Jul 2026 12:07:16 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42D3542378D
	for <linux-arm-msm@vger.kernel.org>; Mon,  6 Jul 2026 12:07:14 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783339636; cv=none; b=Y1F/agGmAiWH4QCrrbHJpp45XRk711PT4D331CtfvZxgJThS8M2n6ZGwjKDyJvFNfO54w116TPzuhTocwnPTGfwsvwX55vrsrY5vg6kB4aN1tfr+bNlThv42kXsZo7CsVfjk/uBAzwQ96Un4xLnP84d8/FF7xoU3/yA/lEJOCNA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783339636; c=relaxed/simple;
	bh=qWTjPqDLGc6UFeJaIHNML9p3hZ3NmfrLS1LYIRLfcw4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=rv049vxGAe/1XlGxrHSQmMUeVVXtNVG6tUfNn63u7LAsGTkIHjiDIz8BP1DC/7k4kp/mee5pp25t9pKQv3xiUOSj8aZ4lmyPHLetORsgq4v05oLcKua05C75UdQkwkoHDL0rbRTJaAEkpW4h7crgb2jzAhHfQNecF8vM85kiHBs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Ozq9EFv4; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ijUrqeAv; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 666AxJfE316462
	for <linux-arm-msm@vger.kernel.org>; Mon, 6 Jul 2026 12:07:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	rc55guwUAO7TOCB1xSuJbiUNgYsAUSIwtv+3EK0dT0w=; b=Ozq9EFv4nHOcKDUf
	CqObyb7p6KT4C56FDXh3dGzoMPhZf4ordV+J6wvdxaT1f8bzmvWIUyc07mgkQRmY
	BByd7MA97pMop2XZJkQagSxMjos1eM+C8dxFyrfH+JxISYLZoYEcElZdzj3kH3j+
	in0TMY+Y1w+XAkTZKPfWLogORp0egMHzebFiDQtJakRApCNkEZG2P8xn6qN+CLwT
	zr7Yg6qlFIGB6sQ906nIG1hbgcRRVxskawFnZF60Y7dVCNohP0SKPBDbbD1+ED8w
	GdJRgQjiRs0InRxwkGRajn6oFk3qnDpqfRA2uVHx9ASNYBB1nJkRa1nk2JTXKm6M
	nlfmhg==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f87q7h4qa-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 06 Jul 2026 12:07:13 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-51c2d2dd52eso1715991cf.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 06 Jul 2026 05:07:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783339633; x=1783944433; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rc55guwUAO7TOCB1xSuJbiUNgYsAUSIwtv+3EK0dT0w=;
        b=ijUrqeAvPxZbF/CHE3o3Y3eP2amC27cP21pemoSjHQBgPHDvsAf+jZqkaHlkW2ro1F
         Vcc4yMJ3OQCdZdO17YFRK+KU9oEEMSATsPqenqEqceIfY/4KUOkghWsvfy6yS9IiwzrG
         DTFlcmDJ8Yv0Q82kPx4YCcSnFWC9Ld7Q+Ha2B+FJIvuYGMxQVl0ZeA5tREAMb4sdvg85
         lsMUCmcp5HaUBPteC570AGCTByLhgId6pEbwSXYyyZq6IDQ+bswu0tYVYqQS8ISYm+yf
         r+MhNp578F3NMy2W0nRF7e8w3GjZE4TRT2+KInkB3YNilFCB7DjqUtD5oD0zNzKHFm5X
         KsBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783339633; x=1783944433;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rc55guwUAO7TOCB1xSuJbiUNgYsAUSIwtv+3EK0dT0w=;
        b=r/UL1TlcN52maKnZEz6R0KQazqw+DebZsh8vtvA9n5cxq+4uAg45HctvPbRs6aAjXQ
         CshpMgYBfjG7kmGkchLqIbONdbA0RdFXaYqyajfhRB1db9bwSuH3lLDpkDdAitz7PtMc
         C7Tbf+OYX8D6eRhDzIzEuRSt+VSS6Ig24RcEIWfpExKEwnAzKyUiDzIZGE4NX7FmUZ2/
         uzojhvjCLjzFngU1DVTbVNjRmFw7dlbKYVgsLidJ9yuwuIww+DMPZWfEBn8UBjlNncQq
         LNX4+7wBtb5JgRJTbmC8XLExpMRgG8X18is12+a4JiXg0NhM6umS2RSAp5loKTdF8mrK
         h2xw==
X-Forwarded-Encrypted: i=1; AHgh+Rq6OqNmS5HEoIwACWQT4QPXE4T+dhVb0HQu5Yh41q+k88ednx1IXJcYxmv9EqgJJliC236ZNLjydKrc7qTD@vger.kernel.org
X-Gm-Message-State: AOJu0Yx4vHGrnqIqjoXpE86dJ24F51NluPcW1bzCDoese8by3xPY6D2v
	3oJfI0PagYeAXf+Nbptlvj9AEoUjreQLjEFZy5oLRwMTODvOCeemFhJgoJmaodGSMH0aOjGBE5Y
	KDaUKh2wNLYSxoNrL8Grz8tGMXenlaia+PnEFGkUpLxdgt0F1PngSdEVSH4KxpmNzjjL350yIJh
	+M
X-Gm-Gg: AfdE7cnU5kL5/75ADRCCIYoM4wEI443qTnlZMUOz4LDSpQoq1C1RcQWFawCvBSZWsV9
	nA133RBSS5IP8atUvsV9WemsZMPFuIBe/ta5jVD6enk0LO2ylrXGXIUhE1ChuHcpsyOqw0usLgX
	5KHr/mB1/9OmzEtAgVq+16y3DLQJuLWnvvsM7cMXHVWPxy6FPjUFhSAloWfHkTeceRc+HIQ7GRJ
	atIJt1AtqRlGikcm1LQlepq+XLAOcUPcM5HGNIn5FfWZwDDTFmS3J9iw5sZxoZGZ/KK4vZmpxUO
	KE2xUybE42nfeeoKun6uOejIsd+XwCqksLi14CCLJ8mHHSOUAjR+L0/rkhwlwFsiAfm4pXZZpyn
	pUC+JsN2tBI75Yi5W4mggETrMWwWlrUNB51I=
X-Received: by 2002:ac8:58d2:0:b0:517:5e32:f3ac with SMTP id d75a77b69052e-51c4ba380f1mr84445271cf.0.1783339633237;
        Mon, 06 Jul 2026 05:07:13 -0700 (PDT)
X-Received: by 2002:a05:620a:4447:b0:92c:b769:ad1f with SMTP id af79cd13be357-92e9a091291mr945865585a.6.1783339219863;
        Mon, 06 Jul 2026 05:00:19 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c12b6095b7dsm726569366b.19.2026.07.06.05.00.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Jul 2026 05:00:18 -0700 (PDT)
Message-ID: <71e04eae-7826-4f51-bd6a-318ea1108c08@oss.qualcomm.com>
Date: Mon, 6 Jul 2026 14:00:16 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC 6/6] arm64: dts: qcom: sdm845-google: Add basic audio
 support
To: david@ixit.cz, Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        David Rhodes <david.rhodes@cirrus.com>,
        Richard Fitzgerald <rf@opensource.cirrus.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        David Rhodes <drhodes@opensource.cirrus.com>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, patches@opensource.cirrus.com,
        devicetree@vger.kernel.org, phone-devel@vger.kernel.org
References: <20260705-pixel3-audio-v1-0-3b66f33859f1@ixit.cz>
 <20260705-pixel3-audio-v1-6-3b66f33859f1@ixit.cz>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260705-pixel3-audio-v1-6-3b66f33859f1@ixit.cz>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA2MDEyMiBTYWx0ZWRfX5atDLXxJxa9I
 ZQXhJVmNxcANhRW7UGNbrdA0vVtxO+w9Nrtf22IcBOfqUJkDcG6ML6h+tcA1BAYfJovulxoS7oT
 I7BwV3bqlYcQnxK7wEkJxDkAMndsKdMSogh9Z6uERvoS6EcCTy1t2ZTWCee8Ghki6dy9qsqL625
 x5VCGXvHe4jHjhaLmszWYg2hiVGmqgB80vO+6Zevw6wxo+Zd593kzAsWiFMxVuz6KcO29TFrTKk
 zOaXyINt761ogX2DVfK6HKvO+e8X/OsDqaryQrB8ZPr5SAScNXSj23lThzPbix5ET35nObA8/R9
 REjJvRjGf2anztTZPjqvFCmc3wWf9h2QMbwNk6piY26auOFehbFH9OgPklT8wQpIYD7ge4pwNzK
 x6Ty74cvedaJtW0wJWFrO0bttlIhS6t2N1imxUAWf0aWP3iAx3g8zK0Ssn7JvGgx/0hla2kzbH5
 YjtA7hJVqIgUN9FTLdg==
X-Proofpoint-ORIG-GUID: f2irI3HR5DzL1mgQq4-AICI7PgnETK8f
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA2MDEyMiBTYWx0ZWRfXwk/FT0DBDeM+
 7tz1bud+N/hJhOAT9La5+UY3Ma4f4pr/7C3D0q1CkLrKbjXx7s9+nao+BUlA9NUTO6623Sf6PTz
 rx5N/qgs3FEsUnCQWMtqbzY6LOQnpRc=
X-Proofpoint-GUID: f2irI3HR5DzL1mgQq4-AICI7PgnETK8f
X-Authority-Analysis: v=2.4 cv=f9N4wuyM c=1 sm=1 tr=0 ts=6a4b9a71 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=1P2StzUqvI1H_hqdaE8A:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-06_01,2026-07-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 impostorscore=0 bulkscore=0 suspectscore=0
 clxscore=1015 spamscore=0 phishscore=0 priorityscore=1501 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607060122
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-116778-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[20];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_TO(0.00)[ixit.cz,kernel.org,gmail.com,perex.cz,suse.com,cirrus.com,opensource.cirrus.com];
	FORGED_RECIPIENTS(0.00)[m:david@ixit.cz,m:srini@kernel.org,m:lgirdwood@gmail.com,m:broonie@kernel.org,m:perex@perex.cz,m:tiwai@suse.com,m:david.rhodes@cirrus.com,m:rf@opensource.cirrus.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:drhodes@opensource.cirrus.com,m:conor+dt@kernel.org,m:linux-sound@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:patches@opensource.cirrus.com,m:devicetree@vger.kernel.org,m:phone-devel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ixit.cz:email,qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,vger.kernel.org:from_smtp,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 7FF84710636

On 7/5/26 10:06 PM, David Heidelberg via B4 Relay wrote:
> From: David Heidelberg <david@ixit.cz>
> 
> Introduce support for sound card and wire two CS35L36 audio codecs for
> top and bottom speakers.
> 
> Inspired by commit from Joel Selvaraj.
> 
> Signed-off-by: David Heidelberg <david@ixit.cz>
> ---

[...]

> +	/* CS35L36, Bottom Speaker */
> +	cs35l36_bottom: audio-codec@40 {
> +		compatible = "cirrus,cs35l36";
> +		reg = <0x40>;
> +		reset-gpios = <&tlmm 112 GPIO_ACTIVE_HIGH>;
> +		#sound-dai-cells = <0>;
> +		sound-name-prefix = "Right"; /* Bottom */

One comment's enough (either above the node or here)

[...]

> +	mm1-dai-link {
> +		link-name = "MultiMedia1";
> +
> +		cpu {
> +			sound-dai = <&q6asmdai MSM_FRONTEND_DAI_MULTIMEDIA1>;
> +		};
> +	};
> +
> +	cs35l36-dai-link {
> +		link-name = "Speaker Playback";
> +
> +		cpu {
> +			sound-dai = <&q6afedai QUATERNARY_TDM_RX_0>;
> +		};
> +
> +		platform {
> +			sound-dai = <&q6routing>;
> +		};
> +
> +		codec {
> +			sound-dai = <&cs35l36_bottom>, <&cs35l36_top>;
> +		};

nit: 'co'dec < 'cp'u < 'p'latform

also 'c's35l36-dai-link < `m`m1-dai-link

otherwise:

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
 
Konrad


