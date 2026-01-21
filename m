Return-Path: <linux-arm-msm+bounces-90003-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oMOBJBK/cGkRZgAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-90003-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 Jan 2026 12:57:06 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 035A956600
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 Jan 2026 12:57:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id DEF1A90B138
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 Jan 2026 11:39:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ECD2533DEF9;
	Wed, 21 Jan 2026 11:39:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="eefXYH+m";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="g/6nJ9r9"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69C0C2D6401
	for <linux-arm-msm@vger.kernel.org>; Wed, 21 Jan 2026 11:39:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768995576; cv=none; b=twIGeFAAg0xA9pq7nUyJNuwpRKlybLXGMrBpVlu2uwIsljQJtjtZDj2I89tbAxMPrymXxuqawdZ1du3XfBZ20k68MMWIKl27PdAP/LhkGK6dBzOrNOyYk8ghsINo8COqLlWI3Vh4gGZCcBm22j3x2yETfxTIQvWpVQC9bPXgMRw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768995576; c=relaxed/simple;
	bh=C3AuM6OlMCXL0GH6v1baiVoxcEikaQ64Uxk+D6jO7RI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=JtYHysSfbo6zkEkK/jYyJsAlyfREOlmk0x14O93foLVtllo/OwKVhBGqCQ1yR5EwSvIiKYpt+AZin37gElFOcpk4Azp7u27gShnwgxgbhFSaKmRYM7zfYJHRXrvQW89qMbvQcn3d13pf/3pMikV3PniYAEkx+OHATycp2LeZ4rg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=eefXYH+m; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=g/6nJ9r9; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60LAeO7v2817066
	for <linux-arm-msm@vger.kernel.org>; Wed, 21 Jan 2026 11:39:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	PI5WjoN6WRRm+sMw8sYJtYcPNwFg57e6M1Ef3SvecmU=; b=eefXYH+mA2bY8wVm
	HU2LQb/J+S90yIdIG/h9dOtRckpnons+WTIlCbHvfymT7QNIAUN0foSNsWcmLM+4
	7D4uYLXR6Pd5qh/yLG3iXyjWPn3a1o1OS8FQ/lAPJriS2mxD0tbw7Fi22lx9Zcap
	HmDCUXonDH/kQlZOcyd8LCWMoC9TDZwDOVnxLutA8yCbCWs4xOFZhtC4+ODVhQpz
	fPs2N56exp+7jX1E4itcxXXNpBjZWwzVGzJzkfUWO1sqVHfpBroIIyOwaYUB4bUt
	lS/C9U1JpttPJQhHoheREgxUD2D5X61uH5/VkndhgJwOmDfSbsuiNWwqaptMO3uY
	XCUKlA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4btw8kg720-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 21 Jan 2026 11:39:32 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8c536c9d2f7so231335585a.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 21 Jan 2026 03:39:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768995572; x=1769600372; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=PI5WjoN6WRRm+sMw8sYJtYcPNwFg57e6M1Ef3SvecmU=;
        b=g/6nJ9r9lT9Da8ks8l0Pp2gOu/af0ao5JVJT/Qbu1OfNbbyA5NZ0ruIeMB+zBLzsD+
         dU4z50jKjtuW+6LP+f0nmT6l9GrmRH81e9iGOFv/kmcpSzgLjQ6Lr51lCgGiSRpmhG/c
         uvekJlAtBffgUSyOgqfCRtHgySYXdqngQGwv/5/OTqY6VKfdIHwNLlFFC1mlK2zzQLBD
         wXZdU4nLa1wXB59/m5wSTHjTvgh+SaFP2F9YULbzPojHIa5cEQRgQCLRmJCseQuaovvv
         0fimSn9jzFerkcLh6g+mcHkXw9tDCuhdhbMrSTxVMeb2HqLvl4OKVyPz8qpoPll9B6J6
         w1rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768995572; x=1769600372;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PI5WjoN6WRRm+sMw8sYJtYcPNwFg57e6M1Ef3SvecmU=;
        b=BcaqbKgytOHHEaw/QT2hR9uN5npZjafWNpV7Ra3SE/gJZN8JQxHGza63gCGkeU4aK7
         iDC0tX1CVdkniWtBP/uJ486waWiU7Rv7t+JzGC//6sraqKqdY9SHaEcvU8u/ZxGSTDo5
         b9P6D8PVwIj8d7RjNHzctb4olkeDcEs7g9jYpaI+DGvHtZe8JSFy0USapYs4pa3TB5g0
         Huqh6IyC8q4/+4RLCbIknGQFMjYG11qdQRNNaKRh+Z08oV26l3v7dUGddQ548X5d2Qv0
         NJDvpLvy+oJX7w8aSvtST9P1SoErL3cJuZ7PtKfE0QWYl6oVSht43i4Jwnif6oiXExR2
         ymoQ==
X-Forwarded-Encrypted: i=1; AJvYcCX6DmwrorNtYcJtreoFWIonKi8s0LOQDWFKn3xmtYHUGK99rhecCBqvypr1otOIvgHyV75h3vXBU7NUDDjA@vger.kernel.org
X-Gm-Message-State: AOJu0YxrxoH6xY2scgBn/ZS0cncewjk4nYMl8yvk2sb3PvNChlnickl6
	hWfzqoXzHMO2xbQ4Jmq4CzNTfWzuCoul+ct3vujO3N7cB3yO0TkH/nB+J3O1vwpxggfSE4MtunE
	SkaeO6SJimYw1rhhuGTm/z4KwL6HP0QSKrYHhrTPnPshoXv8EaHdu9EPE99dvnObGP9Wh
X-Gm-Gg: AZuq6aKkJt023VJp9sPi8kFUzIg5kia2fakagmh5Zm5aHOJ4DJSVtVBjgbW2/XzYhJ6
	Zc+exAc+72HZz4/tDWRTVIQ/KhHCW0cR2pae5ux9K+9K8KAywh5TVTl0BCCxdMEid6EBWYLzbGq
	EfoSaxpNihYlkrs9VFvwpC42OfiAyUkX7+9q8wbhVg/bxgxAqletN1Oq3wKS+IuNDF2cZ8K8o2R
	4tMrTvufbfa06FbvMlZKyIl9vonH45bik+3rs4BdVssbzSDwYQh0rWKzqRqI5OqGgmDRfAYcFBq
	mQKbd+K0B0KNzBLfOgOgVAe2OTT9O2b6TGMqeyyQyhRL9qtEw99rUzK5blV9QD7idbAtGuIWzJf
	32WNIHSfZG7VAqqOdaux0Kf10nC7VdbBer2mPKMUQlXWEhIN7bIVh1mcUMtFn8ebeFu4=
X-Received: by 2002:a05:620a:e05:b0:8c6:af70:22bb with SMTP id af79cd13be357-8c6af702446mr1261655985a.5.1768995571821;
        Wed, 21 Jan 2026 03:39:31 -0800 (PST)
X-Received: by 2002:a05:620a:e05:b0:8c6:af70:22bb with SMTP id af79cd13be357-8c6af702446mr1261654785a.5.1768995571452;
        Wed, 21 Jan 2026 03:39:31 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-65816ab4144sm637133a12.33.2026.01.21.03.39.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 Jan 2026 03:39:30 -0800 (PST)
Message-ID: <5ff927b4-8596-467b-bece-00364a00324b@oss.qualcomm.com>
Date: Wed, 21 Jan 2026 12:39:28 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: sdm630: add SPI7 interface
To: Gianluca Boiano <morf3089@gmail.com>, andersson@kernel.org
Cc: konradybcio@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260120193634.1089688-1-morf3089@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260120193634.1089688-1-morf3089@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTIxMDA5NyBTYWx0ZWRfXxhU7EEyM8G2+
 TrR5Cw1HsbbQzplcjoh31lb8phWPbjD3DEH6B0ynxIrQ59JEsDfeRIal1ihY6PV12MMqbXv2qWf
 5wueF7oYXIiWG9pY9OR1/+qOYkhnPTWyZjKp8jv5Z6d7QkpmrAHVjOQC03n4T2Sws3HUxhWHxAG
 ipXP5eLmLr0ntjdKpCYsmUbPQZ6OvOvQFSdn/uUHjDAV1pbXZYSwHXCpd2pAMcM0Wc2/dWGTucZ
 0/6lwFuUUHI/hk0gK8agBqvOgetoPKk8E27EmEeBKhsS4xAsc8ysvMZhTVbSiBwyHTJKNV6rSxh
 zp5EYw2gF4Vd4+vUsdQij4aY0mbVHqLHqTtbkUn6sbOwlGzPyK27QfBAYMn5czKNAv1J2UFbbvv
 +vexcvaY7AhFobISzuvQrr/3uyV6tfkETTrYTVHps4WjMMMuCsD/QCaMKId1SH4djvvoMiUj+b2
 0Lpplwe1WKKqaczH2YA==
X-Proofpoint-GUID: ovt5iE9PcWuOkyfhEetOgaVePgFcGDA7
X-Authority-Analysis: v=2.4 cv=BPW+bVQG c=1 sm=1 tr=0 ts=6970baf4 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8
 a=m2sNn94M0xWKcIwpXWYA:9 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-ORIG-GUID: ovt5iE9PcWuOkyfhEetOgaVePgFcGDA7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-21_01,2026-01-20_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 phishscore=0 bulkscore=0 malwarescore=0
 suspectscore=0 clxscore=1015 priorityscore=1501 adultscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2601210097
X-Spamd-Result: default: False [-1.96 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DMARC_POLICY_ALLOW(0.00)[qualcomm.com,reject];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FREEMAIL_TO(0.00)[gmail.com,kernel.org];
	TAGGED_FROM(0.00)[bounces-90003-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[dfw.mirrors.kernel.org:rdns,dfw.mirrors.kernel.org:helo,qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:7979, ipnet:2605:f480::/32, country:US];
	R_SPF_SOFTFAIL(0.00)[~all:c];
	RCPT_COUNT_SEVEN(0.00)[9];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 035A956600
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 1/20/26 8:36 PM, Gianluca Boiano wrote:
> Add spi7 interface to SDM630 device tree.
> 
> Signed-off-by: Gianluca Boiano <morf3089@gmail.com>
> ---
>  arch/arm64/boot/dts/qcom/sdm630.dtsi | 34 ++++++++++++++++++++++++++++
>  1 file changed, 34 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sdm630.dtsi b/arch/arm64/boot/dts/qcom/sdm630.dtsi
> index 8b1a45a4e56e..92afb5428e3c 100644
> --- a/arch/arm64/boot/dts/qcom/sdm630.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sdm630.dtsi
> @@ -1013,6 +1013,20 @@ data-pins {
>  					drive-strength = <2>;
>  				};
>  			};
> +
> +			spi7_default: spi7-default-state {
> +				pins = "gpio24", "gpio25", "gpio26", "gpio27";
> +				function = "blsp_spi7";
> +				drive-strength = <6>;
> +				bias-disable;
> +			};
> +
> +			spi7_sleep: spi7-sleep-state {
> +				pins = "gpio24", "gpio25", "gpio26", "gpio27";
> +				function = "blsp_spi7";
> +				drive-strength = <6>;
> +				bias-disable;
> +			};

Since they're identical, you can define it once and reference 
twice

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad


