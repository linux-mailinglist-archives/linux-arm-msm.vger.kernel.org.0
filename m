Return-Path: <linux-arm-msm+bounces-87914-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id AAFE3CFE362
	for <lists+linux-arm-msm@lfdr.de>; Wed, 07 Jan 2026 15:14:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B8A5D3031943
	for <lists+linux-arm-msm@lfdr.de>; Wed,  7 Jan 2026 14:08:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 723F12D8DDB;
	Wed,  7 Jan 2026 14:08:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="UBmKmXa8";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NkOEhDSK"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF88430EF71
	for <linux-arm-msm@vger.kernel.org>; Wed,  7 Jan 2026 14:08:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767794891; cv=none; b=osDE5BwHeq/41HY3tB5MbNifY/Ceb8Bcz+cpKFbbxeOpCZPk519C7ned0kl/WDn8RsMT1fZxSP7mai9u/2xRzVQ7OwRsYxoJrCPO1ZrRQS/bAsdMV7nhLJgrWVpxRqBlES7CgsznW0I4XU8PIhtR9q4tdpdAWVG9GJCTu5UkF9g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767794891; c=relaxed/simple;
	bh=mCbn5kuKUVOa7StqdNfdgtoPVjIvEhpYuWWE9PJhHbI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=N2T6FC+TXMlh8Xsyd5RRX9X4VYHWHUgxHF1+CYVtkVJcCb5n4UFb9RXOnZ1zYyXqjYAcWK43dRsoIG4JTmLKu3WPqmwUpZsexHVCYn7+1y+p4C6veDp4PU3HlB9ITTRPFdwweLF2BIqtaZp+kya4rRgcDldCvjfRL4d8I9IeSWk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UBmKmXa8; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NkOEhDSK; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6078YXTo1979485
	for <linux-arm-msm@vger.kernel.org>; Wed, 7 Jan 2026 14:08:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	mCbn5kuKUVOa7StqdNfdgtoPVjIvEhpYuWWE9PJhHbI=; b=UBmKmXa8lJdanWPk
	9kQMooo71A92HE7SGebPQ9STM8M+9pq6NRg8hbacBluETQb8u+OeIvIxmi5QV1Jr
	PPJdfU+cqC24l9Ui5QXrV8HaJWZmBMNoge3SDtRbrJNE4HUPdYuKhXIEComH/kSZ
	ZnhYEQ7tTCAp6G+VtP/I5N7zVGPQ9+bew655fML/x62frlELdJzEj/T7Y7Pr8W4j
	+6BtDdiCIzQzxFA77rKgy/Wm1hyR48d4HPmcPVkRzJGwjpMmxbFcMLvd8YLzLmPQ
	3nm0I42bAyVexV9CKB79GExN/2KYdHL/O9gl4baTg83yDBqG04DgH+YNuoCP39+I
	A+qYtw==
Received: from mail-yx1-f71.google.com (mail-yx1-f71.google.com [74.125.224.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bhdavja52-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 07 Jan 2026 14:08:08 +0000 (GMT)
Received: by mail-yx1-f71.google.com with SMTP id 956f58d0204a3-6455321ccc7so387807d50.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 07 Jan 2026 06:08:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767794888; x=1768399688; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=mCbn5kuKUVOa7StqdNfdgtoPVjIvEhpYuWWE9PJhHbI=;
        b=NkOEhDSKta21OHf6Ejf5UQXtSiR7lSkd0De4rUEE2GSlULWXNqaZNenOVoJFbAqh7+
         YXXaTli55uq7Raysvais9CwIhv45iBdV1Vv970fqxvzRfIkO3y4PGC5Q5ijNnQs6cSoX
         BNm5W6y7CZBSZiRxDPENQMQWYhIl2C1Z1SdxgCto4roePMkRuQXLS9iMlpk1qGkA2aK2
         jmmizSKLkDUCN7ETd1l/9GxX5NRfSzwxlEYMAZSF7KUoppXG2E3cU2JT6AGQ7qSHEc0x
         JOoELehuUkm5JJq/O7uygGMcO25SHnXJGUjmllyMiFvzC2jSVNou37lN8mQL9Msq7Or7
         eRBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767794888; x=1768399688;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mCbn5kuKUVOa7StqdNfdgtoPVjIvEhpYuWWE9PJhHbI=;
        b=Sjpj8Ix1SWRLiqehlABhcH6DRudFDkIXQ5o9Non55VXiAJwNYXssONaiJ2rx17uWWt
         VVdKZVTVlC4l3NuhN3nFoRIccxLKfY6BPO9ptoM1xrG4qayaCZ+LdB70uDXxi0PPQX1L
         RuYi/KLK5RvuMyYSwJ4dNuXOinHK7F/FKia94cAGpYvGRWdk4SsolGsfj0HlH448OpRP
         ca1wDS9NGxZYnRdXmij8W8zqw0l8mamvaYbROamSDp82bRYVMAE/4ASsrB7vT7LpNTfz
         Es3ym4z2czqdjnhYQe3L+kMdrJemRcC8CO5jMIg1kNmC6Hx8ICkZpf2LCG0DRHz3rEo5
         jM0A==
X-Forwarded-Encrypted: i=1; AJvYcCVA9Ar4EOuy9Tp0pKCUwRV6S7Rq/aFBaFQb9odm4ATGEAvsTUcT5TkKcgkJesbwNqbClqhkrorvyfSu69Hz@vger.kernel.org
X-Gm-Message-State: AOJu0YytxLYI8rSAjbj2qvU4nKKg6XIa8aDnyg5UZQStHMSP4JYgnqTY
	341MeJ31ehoHewA9VJtlcQK9VbCSCj+8h3O57rYBuLdow1lYd8JaBHYixabqKFQN0JsN/JaDDOR
	xkJDQc04+9svjzzPb5u1IKgD0YN8udyDE36aVFPke4uVsHz/a6ZSlQzbFX8M5FfyD78I4
X-Gm-Gg: AY/fxX7zkbLPOmAuE+5oFKow3hSmVUkmFvjKnXHbifutyyUxPgJTa4iaT4wYMGsPwIl
	tads2v85NeHEzKGLbd8/0d9zXVyrkMLnpZ/gPGcnFhAgn7NtQtKUbQMfrfWe61TvoU59LnqsCVb
	YgkNQzFpTKUpEHLy3HFM8G5xwBzRr5YSzzlnKH2tjv9fKC27sG0qbhQbPR0AzyHyX8RtiZzZyN9
	7rXri+O1ovvmD8004+L1Csy+46/+V2tJlK7LusfdqAzRFpS9HCJN+sGCsV9Nx1fuvylg5hr/nc1
	oD2Pjn53x4tXhXD0+o3SV5wPxrMjIbwgifLbIXo3dCB9lPhIEzVJ63qZhjqHWKtGnfny5Kwsw9+
	NopThaU4sGx2a3hq5q0vjf5B8/9XS2P3DitwrNSrRF6UVKT7TNNyy2JknGWRnSNkXK5g=
X-Received: by 2002:a05:690c:9:b0:78c:2c4d:3df9 with SMTP id 00721157ae682-790b54b5af8mr27270527b3.0.1767794888338;
        Wed, 07 Jan 2026 06:08:08 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHyUpA3k3b3g5qtKWK7Tl1X2D7wG2aBAVLD35CZGCs0GMhgDfMQ+H933I+o6Rq2dV0QTyPUnQ==
X-Received: by 2002:a05:690c:9:b0:78c:2c4d:3df9 with SMTP id 00721157ae682-790b54b5af8mr27270177b3.0.1767794887752;
        Wed, 07 Jan 2026 06:08:07 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b842a56962esm529552466b.66.2026.01.07.06.08.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 07 Jan 2026 06:08:07 -0800 (PST)
Message-ID: <09a4642a-3552-44e7-97bd-b26e6937ad8b@oss.qualcomm.com>
Date: Wed, 7 Jan 2026 15:08:04 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/5] arm64: dts: qcom: msm8953-xiaomi-vince: correct wled
 ovp value
To: =?UTF-8?B?QmFybmFiw6FzIEN6w6ltw6Fu?= <barnabas.czeman@mainlining.org>,
        Lee Jones <lee@kernel.org>, Daniel Thompson <danielt@kernel.org>,
        Jingoo Han <jingoohan1@gmail.com>, Pavel Machek <pavel@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Kiran Gunda <quic_kgunda@quicinc.com>, Helge Deller <deller@gmx.de>,
        Luca Weiss <luca@lucaweiss.eu>, Konrad Dybcio <konradybcio@kernel.org>,
        Eugene Lepshy <fekz115@gmail.com>,
        Gianluca Boiano <morf3089@gmail.com>,
        Alejandro Tafalla <atafalla@dnyon.com>
Cc: dri-devel@lists.freedesktop.org, linux-leds@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Daniel Thompson <daniel.thompson@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-fbdev@vger.kernel.org
References: <20260107-pmi8950-wled-v1-0-5e52f5caa39c@mainlining.org>
 <20260107-pmi8950-wled-v1-3-5e52f5caa39c@mainlining.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260107-pmi8950-wled-v1-3-5e52f5caa39c@mainlining.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA3MDEwOSBTYWx0ZWRfXwyWv79nXU5Pa
 JLoLx8IR7K7Ot/Jwc9IpR1h8mXs8mpXfeMmY7Cx+7M0IdkLxYJox9frBzh+P3tOZJ0zr005TJeO
 pKl4P6sG9LVaCNpFBUAbeliIbXKLYLPl7yVUZXUCGHesDK4VEcbT3mijGmsBeI3hpEhx1TgOPrp
 bF2v3t6loOu+aF4hd9Dp28bBUt5U6CFyXDR4+relD6Z5qqylTYd3cpKVCBryIYR4fgrX4O87nJo
 7R9oUL6KzO4OuIgQSrc8WNvzR1meMRNHM1y0keGdAfXzhPnzXVWrS1moeuOji7utr38a1K86Usk
 r9D/ndklXsWMPKNkGJwLYUOlczN8I93spWsz0MDvcRpYQwTMX2Vbv2yNCo49FMx89pEe5DvrqgM
 XeNNuWrsQ0EOW59DwMjxdeQ/lJjdlOWAsXyd+g4hJdtIO4bXuMAkN9fZjsAYfmzZMGU6E1JkifN
 VF65RIJ/d9PZVptLlMg==
X-Proofpoint-ORIG-GUID: ZfKIinQCwMXAYca3p3cPkud2g1L7jqgL
X-Authority-Analysis: v=2.4 cv=comWUl4i c=1 sm=1 tr=0 ts=695e68c8 cx=c_pps
 a=ngMg22mHWrP7m7pwYf9JkA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=cwWn7d2NfpHSwl1uxIYA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=yHXA93iunegOHmWoMUFd:22
X-Proofpoint-GUID: ZfKIinQCwMXAYca3p3cPkud2g1L7jqgL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-07_02,2026-01-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 adultscore=0 priorityscore=1501
 phishscore=0 malwarescore=0 bulkscore=0 clxscore=1015 spamscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2601070109

On 1/7/26 2:31 PM, Barnabás Czémán wrote:
> Correct wled ovp value from 29600 to 29500.

This tells us what the fix is, but not why the fix needs to be made.
We can infer the former from the patch contents, but it's really
important that the next reader, perhaps in 5 years, can find out the
reason it was made.

How about:

"""
PMI8950 doesn't actually support setting an OVP threshold value of
29.6 V. The closest allowed value is 29.5 V. Set that instead.
"""

With this or similar commit message:

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad


