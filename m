Return-Path: <linux-arm-msm+bounces-101287-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AN1mFo/szGk/XwYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-101287-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 01 Apr 2026 11:59:43 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id BC4C937820D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 01 Apr 2026 11:59:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C5BB33154C45
	for <lists+linux-arm-msm@lfdr.de>; Wed,  1 Apr 2026 09:44:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 738083DA7FD;
	Wed,  1 Apr 2026 09:42:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="eGS2mG+Q";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jB1eEOW4"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EAF23A8746
	for <linux-arm-msm@vger.kernel.org>; Wed,  1 Apr 2026 09:42:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775036527; cv=none; b=rGH8jcgDwTpJKTexiBQhwNCuVeKrMCeceuzHBKbs08GmJcSfLjrjLmF6pmcuLyM7Bjb9C8SbZhxE0tH2frTT3+mmOy99bMJjfdkzu0yzvvkYVC91ci+Q4N5dh5+n05Z3qVCuLqoItzEyeCRKvpvGAPj26r5JyeK9bNfjzXn5Pvo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775036527; c=relaxed/simple;
	bh=tg1PT8AF1SONRgj9jI7GaH6t47rBzv7fEW7a2CLtuD4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=QpRszuuvqPZpy5MWIm52Sj4IuhZcnU6JujaoN8gGnOFmiDdNY5ijs1Q9JOW/JFcO2sS42eNUTu1qAIYaNBsdrFgTH3Vt+dV5Jr+E0b9C0yjiCqtqNFvxC6q6mIfn6D4eYXXvLsUa/bt/5eUNw93NbRrWSaxUjUXdgp4ym+6JP7o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=eGS2mG+Q; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jB1eEOW4; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6314J5cX1579457
	for <linux-arm-msm@vger.kernel.org>; Wed, 1 Apr 2026 09:42:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ABlromq1XcHkwDAYOwDCB2ogPYAGGWQWyw7sZ9yDgTY=; b=eGS2mG+QFv/QNVS7
	jCsTQrSSby8L9UtyU8xFA4Wc3dO/2GbgHWIyRgxg6eK3q/XLYju1AbWm+cqUkaeO
	+1DzBX4VAgHhrBWVMK9Ktvger5Bx0d7rkEPBOLF5MXjYPnOn6E/quUWWqRxLC2jg
	nmVSohgyiGEsdDDD9iQUXt2SwHLcqr0hrnG1q7B04Ud8Tge0TssPftXZPD1P0qjF
	ojWU2J1cQ8OAqpY8rs/mNTfJyi+UY+0Dt1dHSjtMS0v8q57RxSyWhOcLIOuzWCiI
	iBxjk4h02DdmBNDRtQxwU8VRDyGh8JYfUlu2ep+UYw9z8MQ8f17q/VVOWJNorToV
	VOef+g==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d8mr2tv0n-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 01 Apr 2026 09:42:04 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-89e9d327913so18840676d6.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 01 Apr 2026 02:42:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775036523; x=1775641323; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ABlromq1XcHkwDAYOwDCB2ogPYAGGWQWyw7sZ9yDgTY=;
        b=jB1eEOW43rEZfg3D7pllj8ahORf+LZoA78eEScy1QkW7in7ju2meYTL6EcmDAgms0O
         rXbuJyi+c6x9kWFgsjG9WUbU9lj9b87m5OWMyc6biWhXOIJH4hX8tHMOJSktKGUi+IlP
         eGfApIj2wAiwbxEaoMHV2ZhVbWs9hkf0CaenfbOJH5+cOnKxZY2ZpmmGYd8p2ZT2NxU4
         CW/ysPklT5+2evAiO34GQl4mYTGnnxmgahfftsHnDEYdCbNe+uZrujb+jenaoGjmp2O5
         J5/+udC0ucBDK/yReaXrdX862JmYhigc0X1nubkL0/RAA4fcDbUSBAmTWMSNLuxdc2TI
         6X8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775036523; x=1775641323;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ABlromq1XcHkwDAYOwDCB2ogPYAGGWQWyw7sZ9yDgTY=;
        b=ZKvOxTf+jeo8TIN05KbwcBR5GU6jOI1wxIY1Mlr7K4N/T+m+H2kraPuPWgrxMrD8CP
         Kbj5falbuADHTVh2aQsEt6H2lL8lrwS56ARpT+9F4zD4v3eY9qb8bvainO83a98iz24c
         OtKLIo1h+11xRQJW81Q/VFv1SbZbhNws15AsrJ0qSCj+zURm6PCKU3KQ7P60yRd0ISQN
         sin0tiDRBQbkKhmCo+8N9U66tovpMgPoLfWb5gDl6huKSZnGm4NWKsIbE5Na481tEH5p
         /yRZcR2WeKcp0qBNWLosmb6WbQvlreS3wcB84Vcu1TIXP6t+igaHJT7C3B1d85nU4vkP
         Xf8Q==
X-Forwarded-Encrypted: i=1; AJvYcCWjXIdSK5VbnDA1lIX+Nc7vq9G0LuUA78okOo97k5JyYeoihLHUMvEl/mt2IAaVBd0mfhQAzcsuCbVttBIQ@vger.kernel.org
X-Gm-Message-State: AOJu0YyoaoXrjFCtb40bbBh1MeuM+aVkST6VIHN5mF0ynIO8MJ74dzJw
	Bta9H0xSzSfSDnET/Sa7ChwVZJKGvvJLRF8dVW2QKie1nqmm+rdyyHeYIx6uEyVu1OlyBjZjRPt
	/OWnEjTTLcmArBYwSD3GI7UT07cqcATgTXYgbxVXdF5ZQdB0MJ6RrLvPMYJoOPYfmc17D
X-Gm-Gg: ATEYQzz2jvB88NTNWn/TA3hdU/RmvdyOe74ondpPfQg7wzw+q6Dbr0kdefdrIo6fS2a
	D5nJiFH9IALERDdVAQrigUSeeih3i5E6t6h/4LDjPf5mIgix5SBTQEdI9OnK7HfBIgThOODIfqs
	cDlVyLKRSOsXgErmM8EDUpKTA0XN4/mw398AblyejarkBxaOOoopyW+zo7kpU5oYoHjS51sPuoq
	MA46L3CV41h70WWp78Y/UzA+vCdKmtddJLQOzpQpisRHuxw4tx6MM4rmGZoUUnnkDaybSVVBx3f
	O5gU3WFNPXFI//3klh8qkKSW8JUeYhtSGJuWeDzVAKkg4sbN+SnyRWRwxhDR0GtsHD5fC5+9UPJ
	YcIP4kl+aiU78gEhtnvNORww0tSRl08rnOY/sYvY0Ns2wmpNgVRBdSgR9VrCh/MKZaTgBnuFdSl
	TQouE=
X-Received: by 2002:a05:622a:428d:b0:509:d76:fe73 with SMTP id d75a77b69052e-50d3bcd6df8mr28201901cf.3.1775036523477;
        Wed, 01 Apr 2026 02:42:03 -0700 (PDT)
X-Received: by 2002:a05:622a:428d:b0:509:d76:fe73 with SMTP id d75a77b69052e-50d3bcd6df8mr28201701cf.3.1775036523087;
        Wed, 01 Apr 2026 02:42:03 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9bf9ebc755sm146600166b.3.2026.04.01.02.42.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 01 Apr 2026 02:42:01 -0700 (PDT)
Message-ID: <4f2086b0-dac5-4646-854b-8dcfcbd9f5ed@oss.qualcomm.com>
Date: Wed, 1 Apr 2026 11:41:59 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] arm64: dts: qcom: milos: Add qfprom efuse node
To: Alexander Koskovich <akoskovich@pm.me>,
        Srinivas Kandagatla <srini@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Luca Weiss <luca.weiss@fairphone.com>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260331-milos-qfprom-v1-0-36017cc642db@pm.me>
 <20260331-milos-qfprom-v1-2-36017cc642db@pm.me>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260331-milos-qfprom-v1-2-36017cc642db@pm.me>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=B+O0EetM c=1 sm=1 tr=0 ts=69cce86c cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=ukwwJ_iyby0_xtxX_Q4A:9 a=QEXdDO2ut3YA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-ORIG-GUID: WafEshPov4Po06lzL6aTLK4KuguDF2q_
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDAxMDA4NyBTYWx0ZWRfXx1M489Uv7raM
 S2fmQJkNQGb7AKanccQ7n/OV2ToAsKDpwIRAhvqf6bAYVKRIvqHCNmtQPvqdoE3wxp+0zDiIFy6
 YkC7XTR9sk3Bdn5d7CRc8Cxa9122CfGlSW3wC96OFskzWGyf3PUbB/8mkBuKutJh2AVEmxz2tqO
 xsRav3EvIGX6Z2YOFjSa8uhH8lCecA7M694hXJxLP56TMVFTbJmnPkr8UdkPBQcZOoF2eKPXOpO
 n3GTP/wTGFWgHAE8ah93S9Hg0aAzcjniNlVCdnPE2hzHeb44bbeAae1lvQbWdmeiOz45j0lu3BE
 MsK6arVraHCzQniph3d+R5bvIlP6gc2uxcYvGp9k8y1PX8ksnj6jGNE1HacSf5UnFoBNQHrZYpY
 5wDV9by7gbi4jeyqCDTqFuevmF+iuWVQ4tB5pCz6HJhivAAGez1wKT+pwRjNSiAuKGrTabYMdf1
 Z3BNyUA5AuDBtWF+gYQ==
X-Proofpoint-GUID: WafEshPov4Po06lzL6aTLK4KuguDF2q_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-01_03,2026-04-01_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 adultscore=0 malwarescore=0
 lowpriorityscore=0 spamscore=0 clxscore=1015 suspectscore=0 phishscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2604010087
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,pm.me:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-101287-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[11];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: BC4C937820D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 4/1/26 4:25 AM, Alexander Koskovich wrote:
> Add the qfprom efuse node and describe where the GPU speedbin fuse is
> located on Milos.
> 
> Note that for SM7635-AB at least, the value is "221", the max frequency
> for this is 1050MHz. There's another speedbin out there for 1150MHz but
> we do not know the value for it so just document in this commit.
> 
> Once the value is discovered we should add the speedbins to the A810
> Adreno entry and update devicetree.
> 
> Signed-off-by: Alexander Koskovich <akoskovich@pm.me>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

