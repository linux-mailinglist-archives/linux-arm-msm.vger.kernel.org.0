Return-Path: <linux-arm-msm+bounces-103143-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gNbyC4VN3mndqAkAu9opvQ
	(envelope-from <linux-arm-msm+bounces-103143-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Apr 2026 16:21:57 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 882793FB130
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Apr 2026 16:21:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id DFCE7304D730
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Apr 2026 14:15:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4F74934CFDD;
	Tue, 14 Apr 2026 14:15:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TikPlKnk";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="GvcmasCw"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B5D530C630
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Apr 2026 14:15:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776176154; cv=none; b=bsRMEyDy4BVm+944GJLDn9E08hk6O9cCxxjZjlfGjYO88YAwyzU2sCdnVpdFihkbsMdiyspETcEsvQKw7VE5jUIeQhy876ILzOuomAvmBU0pCQVn1pjLDnaFyTGVbGhj7166bJf9AqDMOy9GAGvX/KwRsSHQTXmsq19yH0ygU3Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776176154; c=relaxed/simple;
	bh=Q8K2JZDt+sO0CClm4/rVIlM7ktFn4GpWofwVDkYPZn8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=IkN4oaN0EtcNwwsbGqCTHggVuI9Zh0VPetc0slXavjic6y0NI5tDrQZsCDiJRAJ7iDn8Fo/7SirCWUEicUPqQ6rkZQl6yWHhsgPwGFF8oW8NxcYzK3A7hXiAHur6Tgod4soEXFMgN8w02UKXnt4ypGlHDmuQ1NGgpGjWz+nP6IM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TikPlKnk; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GvcmasCw; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63EBPv9d362035
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Apr 2026 14:15:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	1uRMEoih+r45aOBffP43wZDGR9c/DoTnGgL0tCnr/A8=; b=TikPlKnk8m50HHkv
	B7lmviyhIoAPAAfYTHWrgnQHj01HPgEw/yRW3tauzxDuO14R80J5QdUi3P8mkSaf
	mmYZr66H0eSBPsb5AvuKu6SWvsDIPB8qhFg3IVWPH2dos4jkAQ2WHBx3Nh9kShXu
	GGCemk8oiZpfHdZVu8jPQSlR4YEgLWKpnOpM9jZogMEZckAhPKdwuCnya+wwGn3Q
	7Ab7gNtZyeGacw+iSuiMPMFwQ6ktoFT5vrzNcrF97PWM7/VvU9pmZQYJsuqC3xOO
	UAiGG8Y7/40kcSBOPSMG1bEEP2x3Tnc3mmH+PJMcHULfo/8dIqdzsUIp5njy1k1D
	RHgbow==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dh870u1t2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Apr 2026 14:15:52 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-50dec198720so8744351cf.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 14 Apr 2026 07:15:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776176151; x=1776780951; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=1uRMEoih+r45aOBffP43wZDGR9c/DoTnGgL0tCnr/A8=;
        b=GvcmasCwODEIALsYpgP7JOUAwbK0SrEv2oE2WpkjNj5X2jKgopJQAnYB05w87Gr4Ds
         s6Eg2vjCYJKxu5TaTG2bzNq5KCuGWuagkRMP3sC39doN1Anp/YSBzlvu6cqsIPyFKBdA
         18Dqbt+bfIZpv1Yk+7D2cEtWn6tyuzaF9/YxCiHID8tEBv+0W31sxjs+7iqqAXVN2IMR
         xWbDoUHZ/yX1lvnApIXPsgS5NNneMYO6mIe+okBRQwX0rmK1Yhr1iU1vebJXs5nSGD9H
         37nQlA4U/7pZJ8HOCWYCxPhfEoC4Qzz6EaxoxJPs1Dwyd7aUMy7s2NyKC22i+VgyJRXz
         nsHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776176151; x=1776780951;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1uRMEoih+r45aOBffP43wZDGR9c/DoTnGgL0tCnr/A8=;
        b=mdZBoro1b2TEPjKQtyQKMV7k9ToS9InXeFBJC3jXEhyPkrFFE0ohsGCIqV1c1c7mh4
         53vCJNUFi5AthcyUEpphkHoquVxU/OHQb8v3e/l0dmx/u2RHqnbmHcbNP9G8PBf2zwBM
         8yC3qcu7Ll4T8ZyR0spc5VN5BcBgrdIOFV3K8L7Zc6/upS3q33hyfBgRzvBqlFq8O6WD
         Cha9IOk5mWmQCV7bAAyJ+gQNNYow+nkmOW88B/UAcAoGpMjuj5+8tSCfj5pvE1SXtQFc
         LnGKtMWjj0MFCIeYHD0V1mTcNddF/85BHrATUGsg5C1bsUTF9fBATGHDofDJe/aQTY34
         2GTg==
X-Forwarded-Encrypted: i=1; AFNElJ+Xl2sYfnB+gryWXqo9LtcD9GQxvr/LFVuM9jk/s6VC42HvnqmLpA3hnn3MUZD4qlNsuBDDE+eY32cryyHg@vger.kernel.org
X-Gm-Message-State: AOJu0YyYD9NmfzMlH58srU85hAqbn5gKlqHnWRJQl5e8mY1tNHvrBtA5
	Pt+H62HoseT/R0WBRu6fmpH2TdhGLmmvsNY8ZNMZF5naM/21ARMqmO6aeZ+POp26074zVIGE7O0
	pk2jiWQqJypVB848FjdUDBGaLlfs/2vIjhFKVFaTs+rfaZLlbB7CwduA6J9As8TcEyVcK
X-Gm-Gg: AeBDieuPzq1++tyK61cQSV5poEReKdtpiDUrAgoKffCGAML7kvYeeb2AjNBO43TsPjX
	z72ZOKbm9GMirWI4BRx1jLrq5fHJ/1eP/ICFyLBQbyTlsgDRJF3xr2SBdOy1eEwpy+KtZKxD9uG
	ozaEl3ECfnp2NcCv0sAxNLLaYJx90/i65/zg4OZTUsODKP17sxuPPpgFendoM7Cm7gELFaNJcgG
	UtDjVwS9imT50kMhD256S9mBkapN7Srtnswj3bXqfkPOji7tCaJbe8LzWpX7wTkteQTTMq4FOyY
	j0+RK7UTkqD82W7XqCneQrNFOhAxDcd1I1KkssyPm+NhIhGMFaCxUr/+VpMmJHUjLEc+hFHNjo+
	E4a7d0K4Znvg6+8zv/bwO1SuADinbA2OzfeAkXOvHeHiTrB0hTZ9C6O8wRGCfkZr3kliddTRAth
	q5XQttAomTL2CYPg==
X-Received: by 2002:ad4:5767:0:b0:8ae:6380:8fae with SMTP id 6a1803df08f44-8ae63809759mr12532396d6.3.1776176151218;
        Tue, 14 Apr 2026 07:15:51 -0700 (PDT)
X-Received: by 2002:ad4:5767:0:b0:8ae:6380:8fae with SMTP id 6a1803df08f44-8ae63809759mr12531916d6.3.1776176150584;
        Tue, 14 Apr 2026 07:15:50 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9d6dedef0dsm404627066b.14.2026.04.14.07.15.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 Apr 2026 07:15:49 -0700 (PDT)
Message-ID: <fb7ce90c-a7bc-48d7-b87a-640c7ee0b6eb@oss.qualcomm.com>
Date: Tue, 14 Apr 2026 16:15:47 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] arm64: dts: qcom: x1e80100-dell-xps13-9345: enable
 onboard accelerometers
To: Aleksandrs Vinarskis <alex@vinarskis.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: laurentiu.tudor1@dell.com, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
References: <20260331-dell-xps-9345-accel-v2-1-7dacbd24b43d@vinarskis.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260331-dell-xps-9345-accel-v2-1-7dacbd24b43d@vinarskis.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=C9vZDwP+ c=1 sm=1 tr=0 ts=69de4c18 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=I76Qk8w-AAAA:8 a=EUspDBNiAAAA:8 a=brg3RTsmiy1XP5ZoLEsA:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22 a=vUPM0Wvl0xcrLs4nqPIT:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDE0MDEzNCBTYWx0ZWRfX0Cg+F7oM1FK2
 l2E/aJmGi0SeeiUuoF4iS7yqbaCfUdMLXugfKJlxwrYPEsnKOH556pOylAgQPwLWcbdLjyqJ6LQ
 0K3sgsTvROrLUaQl8mFqlaNX4l/fpkhMrMV3gHpD5rU51FHOma0r6MAF/ygOsk5JSmOh6Yn3t4g
 PJD2PM3rA5TZC6pgLzdoBgufqlld8JsJbsifQ8iCZcmQD0k/kFNBL6IXiPwLb6wNw6K0HDvsJjm
 8iPyu7gOnGesxJF6FaeAS82Y0QYWC42gmeIawXEbo/wrE7CFvM2BM//SjDSsYWzGyV73a5kUEKP
 5oUevplGquZ06LaqAMjcnRuIMEfB3RI8l+qjHYFoxccVpvQpjh6CMS5xOzFTwOAzy701AaKqyfq
 Sy6K/B8xXol0G48cM4JhXi1tsyNu6+CXYZbvnD3ovS7soYKUy09SEwyvbXOx5AiAONItJ0nQgNW
 xK3BeGCVe0qizKT+YsQ==
X-Proofpoint-GUID: _fWd7s8u35KkUYL5OV4TeqqxwEQDpaWI
X-Proofpoint-ORIG-GUID: _fWd7s8u35KkUYL5OV4TeqqxwEQDpaWI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-14_03,2026-04-13_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 clxscore=1015 malwarescore=0
 lowpriorityscore=0 phishscore=0 bulkscore=0 spamscore=0 impostorscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604070000
 definitions=main-2604140134
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,vinarskis.com:email];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-103143-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[11];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 882793FB130
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 3/31/26 3:36 PM, Aleksandrs Vinarskis wrote:
> Particular laptop comes with two sets of sensors:
> 1. Motherboard: accelerometer
> 2. Display/Camera module: accelerometer, ambient ligth (and more)
>    sensor
> 
> Both i2c busses are bound to Snapdragon Sensor Core (SSC) and are
> typically controlled by (A)DSP thus allowing for great power
> efficiency. This however requires DSP libraries matching ADSP firmware,
> sensors descriptions (must be extracted from Windows) and other
> potentially closed-source libraries. Opensource tooling includes
> `libssc` and `hexagonrpcd`, but they were not verified to be working.
> 
> Until SSC support for X1E lands, bitbang both i2c busses to enable
> accelerometer functionality. In the future if/when sensors on this
> platform can be used from DSP directly, this commit can be reverted.
> 
> Both accelerometers were tested individually via `monitor-sensor`.
> Display accelerometer is defined first, as it appears automatic
> screen rotation tools simply pick the 1st iio device.
> 
> Signed-off-by: Aleksandrs Vinarskis <alex@vinarskis.com>
> ---

Acked-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

