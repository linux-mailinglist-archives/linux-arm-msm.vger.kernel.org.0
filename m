Return-Path: <linux-arm-msm+bounces-90753-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aMgGHhCpeGnJrwEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-90753-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 Jan 2026 13:01:20 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C06393F4C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 Jan 2026 13:01:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 0A5363017270
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 Jan 2026 12:01:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 90DB8309F1B;
	Tue, 27 Jan 2026 12:01:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dK7+b+Qi";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="IGipvFaP"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52E972264CF
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 Jan 2026 12:01:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769515272; cv=none; b=dO6gHqzHQwolIF+a0nmNxq44QfODZoYbmxx6SBTSIdGbOqcnFB+dfwikdXYU25CHlSC+NyujqtfsHmWkBTep23AJ02hJ6Oo5EZa/+qVn/2mn8bx4SNIyd5mpamsafH+XoztLXF2YFyloa9ZXZ23+EdCPvGEZ8+tKmBe+XFxB6Ns=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769515272; c=relaxed/simple;
	bh=59jZC3zVM0ODzHrMCPvgBuMQDB3OwB67FU4fWRwKHGQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=m552FsnAchJ0ZpkLk2PC/iM+A9L6mTw0o/h7JbP3E/GksvkcZxCdVT3KMOoWSzxgDK8mTxQgqVuk7AoW0st4qBx0DxXh9A3SWqyT38JPboc17cDl0FeyiiCo7fO95BXTCGcPmEqtiKGdxBsEgO4NWzPiTq1BAJftry0bcAZg3Ac=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dK7+b+Qi; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=IGipvFaP; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60R9qZ2K171364
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 Jan 2026 12:01:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	zoZb2MS7iH8UWFdtI0bG1tG2Hg+LVF5otZHfxHqr3mU=; b=dK7+b+Qi4tE7j2zc
	tsVzwmAQTaQryCovB5979t1lkteqtjSlYu740iqhZy/olDqRR9r0Kzy16fA1v8yC
	vdyPqRJuSd8EX+Nr4qs8p9iL+AZW7BIQW+NSiiKvPoFRUWx2cGIZhrVsPoOfrHnd
	iur+rHLYOLdAu/Nk2e7llsjqyxwzwJ0REa8250QEehuqBob/t8IXQhEIOAtGjZaR
	3jmB0+OcAEKOZaa1rTWxEmARKHh3MFySbGRuUktN4HiGcmAIPHG4imcfe+cwN96T
	aMWNEpgIPH0rNI2QcV00yDpMsLRdh2Iqo3vGH1/DEYXhzwkYQ6QDNyiFBljySDSi
	UZo0XA==
Received: from mail-ua1-f71.google.com (mail-ua1-f71.google.com [209.85.222.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bxf3a2q2e-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 Jan 2026 12:01:10 +0000 (GMT)
Received: by mail-ua1-f71.google.com with SMTP id a1e0cc1a2514c-9480edbce57so871422241.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 27 Jan 2026 04:01:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769515269; x=1770120069; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=zoZb2MS7iH8UWFdtI0bG1tG2Hg+LVF5otZHfxHqr3mU=;
        b=IGipvFaPfVAKHtqYMZ+6WFn8B+4ubjw9ePiedpsVaPo+d5mzll7T42KobjLYrBOTlP
         4jwz6dZE9n+PoBXAGNf2e+gtg2QJura5tubZVJPqC73CdjFhdG+g1FjqF7BioQdfloDk
         cp5mUm9oNdDdeTTFNxhwbQfYVrMcH7cL8Fqfozn40I2AmYQh84VqBzuD+IYqFaAEKUAF
         c8O3a39xqe692aFI0lo++6Ch/C+Sa6R+PnVBfQSYJafunLdkFk5+3ls0XVsFLF8HHFIV
         ClNyUdSzXDLWZ1j8R+z0AzwxHxDTD+Z6tbPEETrNow5KthPwp5LG/3ulIZiDrQz8gOHk
         qlOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769515269; x=1770120069;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zoZb2MS7iH8UWFdtI0bG1tG2Hg+LVF5otZHfxHqr3mU=;
        b=E/e6z21SA1cDVA6VVol4BkcBCieGJ8qdTFOIEi2p43w1Qc0NIfJQVdJZCnrFXoWCuA
         dsbGDNPrEVFTxww0UG6FzYjF9xQUjRH2Pz271Z/1hEOTqOO+nSUedGWJ0BaCc+bDa4oJ
         1B6aDguBGP5AevtGxeOYAZ9wOK/+tAIDrY7pceBfkDfrFvu1Xc5vbDuZJbZ2yTlicPk2
         wLUVKYB2hQGoAG+Uoq/WpPCbnX5mGpFHc6llmUhqwhRxLcKt3n2dZ5r5ZdFxNfZWT2nk
         xrCLx8Df9R07d8YMnr+ORfWKdNer96FJIQ/8R7GIeLYGKgXJvSITCCRVjKsHYBXwWF7y
         aCYA==
X-Gm-Message-State: AOJu0YwLzi/33hXFYUZe0ja+2P4v61Z12rTtLUmGz1H6H6WeZNAAIuYZ
	IjmANhQKs/Gukiiwbbv8jwhOn2IBNEf1nRIACTdjOSSna/9TpkwSQZcD67RP721pQfYfPTZubk5
	fPDMVzN0TIbyj9e5+69/V+Tr+d7vFFB2hE75c1bnxD0hD55rXpHlVcEVClCfnhoc9zPgL
X-Gm-Gg: AZuq6aJX2DFuQYFSjQ2hbzsYXjc9c2eJYIAgoUuSd0Tpxi8jvsl14pHbIQt8KX2rySs
	Hc9qpMtawiYaDO4g4wxgKG1QVG/Oqpv+TxfL8v8I68H7ogDDKLvjrC7BLD8xjTlmwMsKy2JERpz
	FH5bqgsW7ymacpRjLmNOHPauvu5VUY3c4ykKrTWb3I/VOHwTlZeFFYIJZFsA/ov3S3dUnpGkwNd
	GH/GcyXbHgkv4X6DyFGDOTHozdjeSr2wHBafecUK850R6L9rgTjnYGGUCZLpd2fJYQe+BhgycZs
	vwl4bDWc5IUjqGPk8yhxUTJ9Ivx024/5yJdpv+FVs7OfJG+oSaj8NoZEGg4HsyDYhxG/5y4BIQD
	x4KeY90i7BcYzLmtdDeKrkI9XwEdEUwx0TLTwylfnidXyVIOP1yagUyTw5ojZMcCGd4w=
X-Received: by 2002:ac5:c752:0:b0:563:3eb4:74de with SMTP id 71dfb90a1353d-5667935b563mr172589e0c.0.1769515269103;
        Tue, 27 Jan 2026 04:01:09 -0800 (PST)
X-Received: by 2002:ac5:c752:0:b0:563:3eb4:74de with SMTP id 71dfb90a1353d-5667935b563mr172568e0c.0.1769515267987;
        Tue, 27 Jan 2026 04:01:07 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b885b3dac6esm810273266b.7.2026.01.27.04.01.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 27 Jan 2026 04:01:07 -0800 (PST)
Message-ID: <c01b5b95-2aac-482e-80d0-89cc1599bc1b@oss.qualcomm.com>
Date: Tue, 27 Jan 2026 13:01:05 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] interconnect: qcom: glymur: Add Mahua SoC support
To: Raviteja Laggyshetty <raviteja.laggyshetty@oss.qualcomm.com>,
        Georgi Djakov <djakov@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Mike Tipton <mike.tipton@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Odelu Kukatla <odelu.kukatla@oss.qualcomm.com>
References: <20260127-mahua_icc-v2-0-f0d8ddf7afca@oss.qualcomm.com>
 <20260127-mahua_icc-v2-2-f0d8ddf7afca@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260127-mahua_icc-v2-2-f0d8ddf7afca@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTI3MDA5OCBTYWx0ZWRfX7zr0c/XAWfr3
 jikc0M2wczw9HxKtlHMHaMmutWttBoPvTDN0PrRKN1br8yRm4Y6iw6L5gEaif4dvnG5f2nl2EjQ
 E0JcP/b7d5RRk1UHQ0u1O8GlERR2oQ8a0XLwuvJ8JsPTW64AzEJSY0It7q9zjWB91T+1ZMrSHvf
 ihHQAInNI4uThqjHkYWCQsCImNfPqUIV3rCTEr7pkObW1iSfINRfNbgEG5+ihCeqUMu2GCDB90u
 lT2V+WggPkrtKEpUt2tUkxMcTsadhWfqbtlzcDIrM3/+wJYaDUNNr5XcSvS8SLshmeYbVKFa9bY
 lDtTwHHKiQgEjwXP/ENK78JT+mBg1yheJ+2xqPLLzdJTnszmr5pydUfyo83rzk5tSQEGMptAQzu
 kRi3KkST+krXwsykyP8/HWx9KZEKcQDwlmwHMHXfdoZB3CUPcov98agBCwuB1dZHKammq7k+fMA
 DtJ2pMkzMnsdrCnAhrw==
X-Proofpoint-ORIG-GUID: V8bKzSDYhqPJnyr4rWfQaE3h5oqV-xV1
X-Proofpoint-GUID: V8bKzSDYhqPJnyr4rWfQaE3h5oqV-xV1
X-Authority-Analysis: v=2.4 cv=a6k9NESF c=1 sm=1 tr=0 ts=6978a906 cx=c_pps
 a=KB4UBwrhAZV1kjiGHFQexw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=GtF0_HNWVELJq49vNZ0A:9
 a=QEXdDO2ut3YA:10 a=o1xkdb1NAhiiM49bd1HK:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-01-27_02,2026-01-27_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 phishscore=0 lowpriorityscore=0 adultscore=0
 priorityscore=1501 bulkscore=0 suspectscore=0 clxscore=1015 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601270098
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-90753-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RSPAMD_EMAILBL_FAIL(0.00)[raviteja.laggyshetty.oss.qualcomm.com:query timed out];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[11];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 3C06393F4C
X-Rspamd-Action: no action

On 1/27/26 4:22 AM, Raviteja Laggyshetty wrote:
> Mahua is a derivative of the Glymur SoC. Extend the
> Glymur driver to support Mahua by:
> 
>   1. Adding new node definitions for interconnects that differ from Glymur
>      (Config NoC, High-Speed Coherent NoC, PCIe West ANOC/Slave NoC).
>   2. Reusing existing Glymur definitions for identical NoCs.
>   3. Overriding the channel and buswidth, with Mahua specific values for
>      the differing NoCs
> 
> Co-developed-by: Odelu Kukatla <odelu.kukatla@oss.qualcomm.com>
> Signed-off-by: Odelu Kukatla <odelu.kukatla@oss.qualcomm.com>
> Signed-off-by: Raviteja Laggyshetty <raviteja.laggyshetty@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

