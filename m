Return-Path: <linux-arm-msm+bounces-114095-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id bgevKawwOmrR3gcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-114095-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Jun 2026 09:07:24 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 46F5A6B4B41
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Jun 2026 09:07:24 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=D+2l+eLx;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=LfNaJaHr;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-114095-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-114095-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 3C7C93014115
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Jun 2026 07:06:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 093823BD64B;
	Tue, 23 Jun 2026 07:06:59 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B93D390C8C
	for <linux-arm-msm@vger.kernel.org>; Tue, 23 Jun 2026 07:06:56 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782198418; cv=none; b=L02MvFLS02vFc7/Z/QN3KtPLBaoJYzXyKt4zNR7le61sKCdHUajtj+Q6ekLGKztH3kDPvWkUsIv0cuGgE/HyGTvIvOm27l3g472oQJyA1RlPK20JrCLGJ57+1KIzHwISv8kES7pAYsGt3Dy7JKQzIPh3RENllwWYPXPqdJdAAWE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782198418; c=relaxed/simple;
	bh=ntmtQ0NOfdXPuqhAE7JL2TnPpPE5mcg+Phpyr8HOVCY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Dii9gb1Gaa5B7d6NMUb4A1jTh9tB0LvADJu8JyqlesBOoeV2tiunGxDlrcxa3j6AuUq/1MwpFRv6eAtqaW/BbaKGvxZGDR7y3BjjcKvxDIH9ejIK03KRdkzOZsk9P8jpq//S7PvFSAATCWNgJKg8NZgEMCtBEhFrDHa1sspViL0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=D+2l+eLx; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LfNaJaHr; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65N6cW663338335
	for <linux-arm-msm@vger.kernel.org>; Tue, 23 Jun 2026 07:06:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	V4oZvsT2Nk0+0HN92sI0UNWybZoEa1+GEhonQrC1CrM=; b=D+2l+eLxpiGVPgaJ
	jx/x2idHo/APehH50tD932IjyLFJaCiMHtZbvZm3QmLDO96x404+rghaXLqr//yq
	xkOF4btjJe9M3AfsDHFGoVbCH1xj8sF4UBzZ4qN/3iJIDTXpzKnN4rdXu/NU/0rr
	mKDqwGiowSenLZbN0C4BH6jskvzU6YNNiKBwSm31t6F2pxNxgmXocIFMtzViaLgQ
	HZNqOp6/TAu+wdOdMvI73lpzrRCmketJQZqVzL73gIkdl0iasixEDO8XCxumZjL+
	lUEOBFvcLXYxIbvy3KOESPQE/QnAUrAiHnl4m43sUX68Y94CmjpI1VwYluiQMADF
	G3sj+w==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eygkjh0wr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 23 Jun 2026 07:06:55 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-5178a632a12so1478311cf.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 23 Jun 2026 00:06:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782198415; x=1782803215; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=V4oZvsT2Nk0+0HN92sI0UNWybZoEa1+GEhonQrC1CrM=;
        b=LfNaJaHrj4sagUvK0ynDjG2QRu85qFuQbG41jL5JMnCAt8Xn1JH0IWJTXbkdmRoN2v
         anAgAiPCjeYvNb+fzGIHcQwQUMB4L+mRlsQdRf9PkxV4AU/iau0vQk1aA76+chmZX97c
         rWoaHHFN5FpsU0Bb4sK6h3zHUxKCDhdqgrDXRvAPbnUqDX27O+YYFPUC54p/SXXkeYID
         j7WMa0M2giD8Xnrg3pybpX7rNGOeAwnf2DhR4pH8FRV6KFvjepcAEoQy+kiK3kAR0wBy
         K6KampRrZVFXHRb38DlZZMz3STZ5s6u0TFRChV7JYzRw0v4spmPU1vqo7agGjG32hZJi
         Ae2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782198415; x=1782803215;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=V4oZvsT2Nk0+0HN92sI0UNWybZoEa1+GEhonQrC1CrM=;
        b=Jv6knZ0Hkv0MV43BdsyhcX+C8ju83QlHULStblhLgofoOjc6pTJczfvnCK4eY9LFLn
         CDpX1d/M8CgU7XC/Zx6P+S7vtb5Rcvu3nMDNSsTtpFLf3786Lyr+2jzrXf/WDnG1ts+E
         he6B6A8Yf4JsnETm5Zig1boi3gakFiLLa7svVcOBjTlkS4E+74+V9Z2ozuRo5bTVDjxD
         PF/CUDvLKl0MHBp72jM4zsB0SWIkvo4OnCECOZF+miSy0rXeTJ/Uv9yFfNcZT5huCwB1
         WNtlMrCR68vHPJe8X9bY0I55igErGHnvJ6f0r6o3xQZDxqqhk67eLiPGLxRQIsUokaLK
         b4oQ==
X-Gm-Message-State: AOJu0Yw3SQ88gElhXxAZBH005kb9wxIGJQjqHBORb1IpWKNet3P9jD2I
	pGs1MyIj1y0clbQCnFdI6FNPxyjZcRv5Qn1odBB0C7xqR0FXTYhCCzMusQizAzJfXoRJifz6oDZ
	91TKA7KTjOelVVwFV0v1zdkdi128m4H9Dcz9x9zZNX7cjVRLV1skd1oE2odyYwhQttFRF
X-Gm-Gg: AfdE7ckb+QbuvTH9cJg0xvLDS7+3lYamps+oPrtkIppKlEP14P/0Q7xB3HWWZhe+i5M
	NEkV3cJl2U1OJZJ0LNQjskySQ/M2wfvIjneKdNeweUv4dvivzX+bUCCUMTEkat3CGxGTZRtmBAX
	Xwi6hd396JT14+Aj1urDpBs2EEZSTsXJ4+kE4R0z6Soa5Y5zb2GYKBDM/kd0IgZrDIahqeV+sUJ
	f6WwqTm4Ee4Ay441ptxwMQiO/mkdzkd3YzNgy2MICXd44xPg3Cl+Fr2d/+vpDKEpTljruBr6ypN
	rJZtUWHnstbhBzJn6WYSy1bAjh5F//0laEZGgN9JEhxPgpkRDKZyKR+pJolA9O2mPb/PqQzsUtb
	cq3kdQEoCErTLqrDqnLEfhHFElfMDW1JKipA=
X-Received: by 2002:a05:620a:8808:b0:90f:7ce2:3019 with SMTP id af79cd13be357-92186ca0326mr1374830085a.7.1782198414734;
        Tue, 23 Jun 2026 00:06:54 -0700 (PDT)
X-Received: by 2002:a05:620a:8808:b0:90f:7ce2:3019 with SMTP id af79cd13be357-92186ca0326mr1374827985a.7.1782198414302;
        Tue, 23 Jun 2026 00:06:54 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c0c5e4987d8sm466707366b.9.2026.06.23.00.06.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 23 Jun 2026 00:06:53 -0700 (PDT)
Message-ID: <fcb6579a-4e5e-47ef-b9a5-009dd761e4de@oss.qualcomm.com>
Date: Tue, 23 Jun 2026 09:06:51 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] arm64: dts: qcom: glymur: Add Asus Zenbook A14
 (UX3407NA)
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
References: <20260623-zenbook-dts-v1-0-3f80f680381d@oss.qualcomm.com>
 <20260623-zenbook-dts-v1-2-3f80f680381d@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260623-zenbook-dts-v1-2-3f80f680381d@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjIzMDA1NSBTYWx0ZWRfX3+RSCXaeau6j
 FZkAx2t3TmDFxENTIyVjmIQmWXpEQdznJUsj+f7yo0CkqzdkHUSJKK+WgcsigXpc//kkrMINHdo
 7GnPyjvl8IosiiktQqJw0KOahMhBv+gONDWQ96fA0w4EdoCTSZTJ21HAjiTyLgUZRgoF0slfWoD
 yJUtv9YheF/3S9eYR++mHS0IwKSyF4dJyx26OhO4Nxv/P9/t4mLPlPh2LCfXfl3q1pASCNfSlAm
 gmEGxa5LROZaebAtz4lB929c+c+JVXVLOujQldX4dA7kLlvHE5KE/RHNgLljV2pqHNDi4mTIoev
 QNwVodSMQkV4nmsBmwnhqf0iF9hc7GKWXgQH8Mc6qKbKM3vjcI9SYUI7iyR7i6fv0yEW7FZ5RUL
 mELMt3VPA21jjc8PlE9Dt5IspWlWobRFdAAisjqye4QVGGhWxaB3eHMONA5WaUUSKE3wKAxZykB
 8AgVER4GTf8sV7Vlb3w==
X-Proofpoint-GUID: 4bvFyYh6_s0ZeH1WWXCC4Z7ahATAVUZN
X-Authority-Analysis: v=2.4 cv=SoKgLvO0 c=1 sm=1 tr=0 ts=6a3a308f cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=Omn3S6Sier9Mzsz8H4wA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjIzMDA1NSBTYWx0ZWRfX+7Kg9yWWFbJw
 pIjahCTAs4eLe54MdbinAcgELAKEZSiZ7x9LXiecrdzGbSEdg6i0bj6uDA9wCUhbRFYOtIg+ohb
 tAr9vou0j7F5TCJd3mBaoJXspXQPQR8=
X-Proofpoint-ORIG-GUID: 4bvFyYh6_s0ZeH1WWXCC4Z7ahATAVUZN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-23_02,2026-06-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 suspectscore=0 spamscore=0 malwarescore=0
 priorityscore=1501 bulkscore=0 clxscore=1015 adultscore=0 phishscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2606230055
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
	TAGGED_FROM(0.00)[bounces-114095-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:bjorn.andersson@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,vger.kernel.org:from_smtp,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 46F5A6B4B41

On 6/23/26 3:31 AM, Bjorn Andersson wrote:
> From: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
> 
> UX3407NA is a variant of the Asus Zenbook A14 built on the Qualcomm
> Glymur platform. It comes with an 18-core X2 Elite SoC, 32GB DDR, and
> the other typical Glymur platform capabilities.
> 
> The Asus Zenbook uses &pcie3b for NVMe storage, the screen is WUXGA
> OLED, it has two USB Type-C ports, one USB Type-A, and one HDMI port.
> 
> Signed-off-by: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
> ---

[...]

> +/ {
> +	compatible = "asus,zenbook-a14-ux3407na", "qcom,glymur";
> +	model = "ASUS Zenbook A14 (UX3407NA)";

unusual order!

> +
> +	aliases {
> +		i2c0 = &i2c0;
> +		i2c8 = &i2c8;
> +		i2c10 = &i2c10;
> +		i2c19 = &i2c19;
> +		serial0 = &uart14;
> +	};
> +
> +	chosen {
> +	};

Do we need this node?

[...]

> +&i2c10 {
> +	clock-frequency = <400000>;
> +
> +	status = "okay";
> +
> +	hid@17 {

We've already got touchscreen, touchpad, the keyboard's below - what's
this one?

[...]

> +&tlmm {
> +	gpio-reserved-ranges = <4 4>, /* EC Secure */
> +			       <10 2>, /* OOB UART */
> +			       <44 4>, /* TPM */
> +			       <90 2>; /* TPM */

Is there no EC reset pin? I wouldn't want others to have to open up
a laptop after trying to find out what it does..

[...]

> +	ts_default: ts-default-state {
> +		reset-n-pins {
> +			pins = "gpio48";
> +			function = "gpio";
> +			bias-disable;
> +			output-high;

You can drop this property

[...]

> +&uart21 {
> +	status = "disabled";

hm?

Konrad

