Return-Path: <linux-arm-msm+bounces-107739-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6KXTAgfhBmrLogIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-107739-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 May 2026 11:01:59 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 7ED2354BEA5
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 May 2026 11:01:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 2A5BE30A964D
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 May 2026 08:53:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6E8C2421F1D;
	Fri, 15 May 2026 08:53:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="aCtwK+5e";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="D9yaoV5O"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF3E2421EE2
	for <linux-arm-msm@vger.kernel.org>; Fri, 15 May 2026 08:53:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778835222; cv=none; b=fOnsmBMNHi8m+JgX5T+yXAO3Q1BOvULlTYgndcEx3i+bohoJuKfNMJAqk1HNQJADDArejRefip1nDOcM2NgsqSzrM0qEvltXWmdrFL4YxxxiVofbCX7Qnp2fJ0JsGy5GoQy0uoL0O80FbU7OAZw46bq3NgLorv1XK/ZW7v0iklY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778835222; c=relaxed/simple;
	bh=Vu/zUiuQtSz0qzX1sPZPdPeJG0v+/EfU8BrqUjfe6hE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=RRfiRqBzfiPrY3hlcfHDaNpUf8LiWZ8eJn/Uj6y0OeW2538H53C8WRXhopWJgXVeEH3asgBDkMdU5MZF+TxbiZmx8Ff9qwxArKk+8TegOf754rX7kBCjU59RRVRyFbjxnI2z9EZWrM8OixKpPcGB4KpQIQECwDfvtuYXPkOYk+w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=aCtwK+5e; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=D9yaoV5O; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64F50NIv3671196
	for <linux-arm-msm@vger.kernel.org>; Fri, 15 May 2026 08:53:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	tH2KVZjWsrVlDUo1bDYgkQP/brqgWYGNDeftetOYBH0=; b=aCtwK+5eQdOW519g
	C+ciCGSGioEVKu7PEssJSkrXzNF87eRwrVP8qmR7JxwARIb3llVx4KbEXi9UUpIV
	s0ni8CX/P7Uf8ct/2pvgCC1VNo9v7VpVLhYVi1vgsYRVV3/tXLeO6gM9ziMzBEpp
	LM3XIft7n/cNgmrtECX4lxJMlyULEjt7Yy7IroM7BYzb2YiFHeQadVo724VIt0c/
	TWtbtGedLKVbsNIqDnGh/uGtGiun7fR7KfMCQz5EZ83K2Xme9tA+WaDC+8JR8no8
	mMK1PGd9adc4+wy1Fi8sCm0dfdcFt17eCE68wlhgSmXkPD6eXeClD4lb4rw7e1Y0
	RtsoFw==
Received: from mail-ua1-f69.google.com (mail-ua1-f69.google.com [209.85.222.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e5m1s2h8c-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 15 May 2026 08:53:39 +0000 (GMT)
Received: by mail-ua1-f69.google.com with SMTP id a1e0cc1a2514c-95cd67d9a7dso370618241.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 15 May 2026 01:53:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778835218; x=1779440018; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=tH2KVZjWsrVlDUo1bDYgkQP/brqgWYGNDeftetOYBH0=;
        b=D9yaoV5OA1o+EjoaOoT914DfN8TfbH24PeqK9s9FX1GPLQlPqjejPOWEP8OouShD8a
         VWa3hS+iPwrVxJR5iiV/mVKJAMui9M/8ZiEy27zbIdaeES5mHjIiWJ2M8p2rY3QITHwH
         FnZ8nXZXVDEIsH0WnqU/7hb0jULnIFbZnO3jBu6rH1vSXJI0W40MXeY4ov2LlReIF1zM
         UC3kdPHXdXCj/AALpCUZtkqsBCZP72cKMZtSuFgdLhTj4dirL4jKkGl+dMOXXMyD/qd1
         Txd7f5YM46ljIDa3Gr/pku59SN6M2f5R3pfigBbxaU6dSQ69W3R9evodqG5El/fnF9Gx
         KksA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778835218; x=1779440018;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tH2KVZjWsrVlDUo1bDYgkQP/brqgWYGNDeftetOYBH0=;
        b=Mpz7rpWeUJ+llMrLnAbZNbOjuRsq18odwR4dZtV3Eh21DLO8VKmuWh7CvzBLZfgp+X
         gAH6RKIP0nUsqsiUgP/zY/sQT1m9AZl4eeOh/hfGFpKNw76qkOSloGkjXg1mB94A+mzI
         wPg+AV6ulkK9LduPulpR2SuMzNkS1kcdWnpcF2sRLLXJlFQHRrtR1FAy/ng8Osst7UTA
         ZwXXJjpfmUu/kU/vTfCOX+0gYk/JEJL4Y6902a3S7PVFQwI9QP5nJADKmRufcDYVD0O/
         4NqtRIbLKoeVIvEZXXqlanzgEhLjWCQ7KKbX/XI6zYXX0eDzacTtxMPnpahVIrrH9nSY
         ArNA==
X-Gm-Message-State: AOJu0YyK6K52D27p1IQd/NP5rDdUl+NuDTs16C5m3JL6YhNNcaXgnPgw
	km1TusVRsiCsGcwZGavo0zm9lHqhSbiOIDRZy1P8DbUPkV2zGNkt1st3tVyILI0dgL5Eu+yyEcN
	U+G7bT1BsJYUJZfjaYwEpQyCliolNkcjzG3N+JAgsFAlNr9euKu4e3XsHXRIbduPA0nM4
X-Gm-Gg: Acq92OG4o+dJ/2iuXdsQxqvpam92rBLIqiXcRvzMLIJMN1b+13r2cyc5DwB0SRYXaLE
	KhSLchi6tYo1GdeWi8IC6hwttYxDgcgc/EV4uMKe91Yovyh9pu5MiCZvz6v02NHJr/5fkUd4MaD
	NiawCnf5bVaGy97nq3rPt0c6gjcasjh9+BW03mEO4rl+r2XgQTsoxV4ZFEahM9whLRRAbQIu9ZB
	wFkBWnzlcsbtxpbSb6EwJdaqnjAfFvyei38nV25Yu8F8p+sx388wtSedtIbqNu+9TdmX7pDNG/T
	Htx39dU0g0D/z4jZeGdsgKM5gDcSZJI21PspNp+V0JyxnNYRb9WdoorEGnmf/mEDLqM22lmtZaV
	yiFlG5eVqce0OO4VYIwwE+qJMrUSqYNNyJujxiPAid9Ym65RYWQ+/YeM8pJSKMCfhG+Jjb7z7YR
	eUgNI=
X-Received: by 2002:a05:6102:1148:b0:631:2a09:94c0 with SMTP id ada2fe7eead31-63a3cc0ccdfmr363788137.2.1778835218279;
        Fri, 15 May 2026 01:53:38 -0700 (PDT)
X-Received: by 2002:a05:6102:1148:b0:631:2a09:94c0 with SMTP id ada2fe7eead31-63a3cc0ccdfmr363773137.2.1778835217880;
        Fri, 15 May 2026 01:53:37 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bd4f4bd2f5csm195204766b.3.2026.05.15.01.53.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 15 May 2026 01:53:36 -0700 (PDT)
Message-ID: <90398d50-6674-40ed-8ace-a2edc3acca97@oss.qualcomm.com>
Date: Fri, 15 May 2026 10:53:34 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] arm64: dts: qcom: shikra: Add TRNG support
To: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-crypto@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260514-shikra_rng-v1-0-4ea721a1429a@oss.qualcomm.com>
 <20260514-shikra_rng-v1-2-4ea721a1429a@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260514-shikra_rng-v1-2-4ea721a1429a@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE1MDA4OSBTYWx0ZWRfX5PF8zliqW/oZ
 S+eyAvD6YRD4Bh5mCVSOGwhjyScAF8x54J7Ci9xYKOH2Xzjt0B68M/q2SC7baMDnoiFgCHTUnRC
 dUI0fbM8vEARqnWDq9DApmdwzYWhvlK14BNJZskqwfVjDr0vs4zSvhaBybB6vTIrUw6Jz6LB4hO
 XFxzWDkElZz+UoVU2hUdVN6JlOjmtzXoIPZC4zQQEeFSc4Gmnbs2HOYjNiWYChn4Z9jhiKvznhU
 ykCV8WdkbY4GL50MujxnUQ9r1eRVlF9nm7fd0+wmURKSsnGzEQ3oOQiP+RpiqJXkYsYqz1feOXy
 snjyT0y8GcxD6RBEiCqWtbDMLrgPSN05WSvgXIG3Q0Cc2Yg/qmKF7zPIOHZ9z21j2U4usO8GXdf
 NEf0WmFMoLxJNRaCAR1ZBal7tVZc404ffmlX2RwsAXl2+UpmWXsN4t4wsI0MZiiTz/rOmkxeOQL
 6Nv4Lyi6NsOBWXvH6Mg==
X-Authority-Analysis: v=2.4 cv=Md5cfZ/f c=1 sm=1 tr=0 ts=6a06df13 cx=c_pps
 a=UbhLPJ621ZpgOD2l3yZY1w==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=ziO0MC-R6CyBOfdU2qsA:9 a=QEXdDO2ut3YA:10
 a=TOPH6uDL9cOC6tEoww4z:22
X-Proofpoint-GUID: CUCMK2UdF4143k2wBNcV7AJxuHvz8CcZ
X-Proofpoint-ORIG-GUID: CUCMK2UdF4143k2wBNcV7AJxuHvz8CcZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-15_02,2026-05-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 bulkscore=0 priorityscore=1501
 impostorscore=0 malwarescore=0 adultscore=0 phishscore=0 spamscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605150089
X-Rspamd-Queue-Id: 7ED2354BEA5
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-107739-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

On 5/14/26 3:16 PM, Kuldeep Singh wrote:
> Add True Random Number Generator(TRNG) node for shikra.
> 
> Signed-off-by: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

