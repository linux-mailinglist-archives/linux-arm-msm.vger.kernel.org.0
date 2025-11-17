Return-Path: <linux-arm-msm+bounces-82096-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id B3CEFC64292
	for <lists+linux-arm-msm@lfdr.de>; Mon, 17 Nov 2025 13:48:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id ECC703ABE19
	for <lists+linux-arm-msm@lfdr.de>; Mon, 17 Nov 2025 12:47:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 22E0A32C321;
	Mon, 17 Nov 2025 12:40:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Nza+9LbK";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="W6JtRHqG"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6886632C93C
	for <linux-arm-msm@vger.kernel.org>; Mon, 17 Nov 2025 12:40:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763383237; cv=none; b=mFlOYbMqKy+JEmzUp7fRYcjO5s44ZyExB+Nbq+J94HYjhMfQ+N8qqzU+XmI31pHAyr7wr+aA3Dl9PwiQ64zy1+02ZkFSgpW86+jAWnRkN0HRQp6nlZLYNDU/qfJ9v85KZHZl/ssleDtGZi76tU5nWowzUDV73Rdtk78eH9S4CKk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763383237; c=relaxed/simple;
	bh=qOZJF+TF3+BuDvg/qnCQ4xpZJPRscxHIB7SeQ5jLxEE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=rq2F4h4sdK0n88yNmQlkMzJbq6OM5ApSAZS6uIg6JVDd7qfhc84n9tj80OWJqF1o1blWsGjhS9bvSxki33mFtmV8PXGIACK5eULhoinpzuTojxGnoB4GpzUfYoheyZ8B2anjIiJOwXYnVWGsEfTcGa8CeTc2jfXt6nrB/D3vqDw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Nza+9LbK; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=W6JtRHqG; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AHB2WK03916568
	for <linux-arm-msm@vger.kernel.org>; Mon, 17 Nov 2025 12:40:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	TMqWzpjJBLhN7aSXKykFWj6dqZupU4VaGr/5mEoMJwM=; b=Nza+9LbKw1hpf40o
	oT8K2lKeH4fB3uBS9xFnHnJzdCwR8kVUzWgGk7uibhXFBqDBB4PbNs/E3jZfEo6Q
	Kfgv/rd7MXxwLMn9GJYz3BXdNA3+ttXQ9i7Sk/MMLrl1w+xAC4K9dlJskosVcMth
	iej3bv+Zjo3SlxLFbkAwANhBb/yGl8aCWMqnc6g0yJ87xzFWWIunk3owr8q18rIr
	BxN9B6E4eqtAQDtol9zkXNYBAyKt79vMzO/Eih2Txl8w/tVzNFkn5aZZkmC2xn3y
	pU005yjptFiFQlsbWaWedY3emV86Rnhc37dtkZQfpgaAIMYzyOLjHNormptGa1aY
	jfVRXQ==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ag2fx8950-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 17 Nov 2025 12:40:34 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-88057e35c5bso12936066d6.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 17 Nov 2025 04:40:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1763383234; x=1763988034; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=TMqWzpjJBLhN7aSXKykFWj6dqZupU4VaGr/5mEoMJwM=;
        b=W6JtRHqG6rhaLg5yj/FFTc9s23P0YY2mfyLw5ah7ZXlPLK5AZSvBDGzAS2FXzkZpj7
         ePXcXGGDWtdA9IXBxxcxYlTfwA6OKddohGX0EjbVdyH616CUKz9tTh9SKw2VUSr//OMf
         Sq+Z+t0SPe1axRWnlWB8jytWwophxCVbqV2HDpZy9rOGt4XveK3w9MYN9UYu4MXmzVHe
         rAXH56t859vA4WHbmBJYqMRaGdW+9JTYUiIPTbXy7oYbGrQw3KEPCF+HdOhkO9W+3YOn
         eYg5p9tLJnPQFs5ysIAtweb33gP5BgIWjHlbDF+CQXqQkUhi5wLOAlGptsvm7isEY0LO
         14gA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763383234; x=1763988034;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TMqWzpjJBLhN7aSXKykFWj6dqZupU4VaGr/5mEoMJwM=;
        b=aI8VjSSKkaWYsuAXmCRo4j727d+kVjr+1wdgEYR2dtvXbdE1RyMfLR706IfajFmkcu
         WOZW8ZS+5nzeGJjv7fJO9HabLY8DpdNedmOvhg/jdQ3rSOV1yeO78flQdJ1yCxVuBF2/
         VRhAhaxNr2QDlThx39O3/kd8/RFdHYoVT1FfEdXA3+yx1/HRcVzINgEO6mULl6K04fkB
         6PFjl8TXUMsqNUpu90U4xIfzjy7KBl8vd0blgrCMu/i1fh4huH2p86NEMR1M9IJ651op
         py3KmlxcxtmUAxf5MItInuUTDefdnweeIbXIWzZ+YwmHUXbIPgepqzHD/Cs+qNxM9RDx
         /xTA==
X-Gm-Message-State: AOJu0YzjpZBSdmZlIr5wmyuJe3tED4awEd9vCu8/gD1iSgRUSTiA7qi9
	8CYSdRN6IIddo2C11kTHZT6pge42ThZpGQ778AKUnCgFlknph8ObPoEUQ1/Bygh6b6Bu1lwJGIx
	zJ+R4+CXNOLA7pyrifOVwXF5ZcGPJQaA/BQS8KzpuWpS/F1JtBtXzRZklrVWA7crK1PTg
X-Gm-Gg: ASbGncvTFxKt1Le74AFbpHej2aewkY71fDY3acrFaZ2H77Ud0BxkZkAXqI2NbTyQS17
	WyJg54bT4KqhYi2QLmO0vaL93nbele1O1cX3cuc9LA6eyrL9TfFajoJYufTWhXu/BPPde4zCMBy
	ZueOHFLoFB0qomDJiakew68SAPOy3R2qI9DecgIMToAyxvMmlyuJkfpwG70xWcEaQHyyEu3D2+6
	q8IVJlgwpevVmKa1rZTjTFPtAVY3rgMuSanYBSUFfaj8gJMcg+0xF81+wr0y9bvGe7hlB0Ov3CR
	HIgYMCOLX3QOqlfnIw5TEvvUgC5FCM9yvNT0Ps3RSqmrVR4k0tU6Lh+xg9apUeKmiDVVNPTn1AW
	TbZ1MRR1NkDvbx/K/vsb+ygELxKWAX5uIMHzMkOsFqDmV/o1hT7ci2Pwv
X-Received: by 2002:ac8:58d1:0:b0:4ee:1f0c:c19d with SMTP id d75a77b69052e-4ee1f0cc6acmr31678141cf.0.1763383233608;
        Mon, 17 Nov 2025 04:40:33 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHK94OwN6PicgAHosly/8/eoaFb3uwdwO/NeN1Y+NwRIScBrBLzLlHlY5QDTIwCeCx1OgG1Gg==
X-Received: by 2002:ac8:58d1:0:b0:4ee:1f0c:c19d with SMTP id d75a77b69052e-4ee1f0cc6acmr31677811cf.0.1763383233092;
        Mon, 17 Nov 2025 04:40:33 -0800 (PST)
Received: from [192.168.119.202] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b734fedb2eesm1066812766b.68.2025.11.17.04.40.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 17 Nov 2025 04:40:32 -0800 (PST)
Message-ID: <ee2123ee-c500-4db6-bc9a-2e5fcbeb8ae6@oss.qualcomm.com>
Date: Mon, 17 Nov 2025 13:40:29 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/4] clk: qcom: gcc: Add support for Global Clock
 controller found on SDM439
To: =?UTF-8?B?QmFybmFiw6FzIEN6w6ltw6Fu?= <barnabas.czeman@mainlining.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Adam Skladowski <a_skl39@protonmail.com>,
        Sireesh Kodali <sireeshkodali@protonmail.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Lanik <daniilt971@gmail.com>
References: <20251116-gcc-msm8940-sdm439-v1-0-7c0dc89c922c@mainlining.org>
 <20251116-gcc-msm8940-sdm439-v1-4-7c0dc89c922c@mainlining.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20251116-gcc-msm8940-sdm439-v1-4-7c0dc89c922c@mainlining.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: NZXKhmAg_Vu677C09a7WVozuYZZLDmOr
X-Authority-Analysis: v=2.4 cv=EIELElZC c=1 sm=1 tr=0 ts=691b17c2 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=pGLkceISAAAA:8 a=xjdICbAXnItIs3Mpx1cA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-GUID: NZXKhmAg_Vu677C09a7WVozuYZZLDmOr
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE3MDEwNyBTYWx0ZWRfX1cuC79TCP7aS
 0cs4rcIqoPI+K/uQELL5imtLL3GcccNaLp7Xes05n5EuWkrehPb8eNL7YyK+k4+DFSAvI1pi0BU
 HGCkrkss9qt6qt/Qn5Yu4e2SFU92T/qZuRGBpSRgJYcJIr6/CWGQOPaCwd/QZxiTyo0nKVacqSp
 OxENWRkSqwwPospZ7fsJPyiolERZ5xKZJSTsQ/ge+zRwnEt2siHG/i8z12y2aLIpediNVtJkYpS
 p4zSJ6J5hAAittT53GvvCYdCRx4hggDGSHCtHtDzA7kPT0DpGwDJTgl/iTOPIU02NKkJ3gPRsJ8
 RRHdrixjychsnLovC7XRtsREgPH/du8byPaUkeJ14cUmU7L2k/8tgBcPpbr72FdcMNnBYn93Px4
 wT7+hrD7L9iMD6pPQKWL25UtlKuwpw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-17_03,2025-11-13_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 spamscore=0 bulkscore=0 clxscore=1015
 lowpriorityscore=0 phishscore=0 impostorscore=0 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511170107

On 11/16/25 10:35 PM, Barnabás Czémán wrote:
> From: Lanik <daniilt971@gmail.com>
> 
> Modify existing MSM8917 driver to support SDM439 SoC. SDM439 SoC has the
> same changes as MSM8937 SoC, but with different gpll3 vco rate and
> different GFX3D clock frequency table.
> 
> Signed-off-by: Lanik <daniilt971@gmail.com>

This doesn't seem like a proper full name, please fix up your git
config

[...]

> +static void sdm439_clock_override(void)
> +{
> +	/*
> +	 * Set below clocks for use specific sdm439 parent map.
> +	 */
> +	vcodec0_clk_src.parent_map = gcc_cpp_map;
> +	vcodec0_clk_src.clkr.hw.init = &vcodec0_clk_src_init_msm8937;
> +
> +	/*
> +	 * Set below clocks for use specific sdm439 freq table.
> +	 */

These comments are rather self-explanatory, you can drop them

Konrad


