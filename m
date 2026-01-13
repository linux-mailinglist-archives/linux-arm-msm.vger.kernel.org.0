Return-Path: <linux-arm-msm+bounces-88700-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 10DF0D1762C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 13 Jan 2026 09:52:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 51F553015AB1
	for <lists+linux-arm-msm@lfdr.de>; Tue, 13 Jan 2026 08:52:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F3137345CCD;
	Tue, 13 Jan 2026 08:52:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LjIkdpla";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dHkWHkU5"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58D5B366560
	for <linux-arm-msm@vger.kernel.org>; Tue, 13 Jan 2026 08:52:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768294339; cv=none; b=Fh1fUm5Qg6QjxFW05ba1/z0Xr6Jhe+bZ5bVc5iAP2oGdfweu9CO/38IalYOF+tAyQp9dRjF3euUByg6mxBYq1nYhVX6jfGiV0GjxGVTcWzVBlAT3CD2LvY+OEKGnUxcQzAtFIY88c7s+wHnvHMTPojjVIqSd4LkFcl9s5EsnKc0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768294339; c=relaxed/simple;
	bh=YzbNl+xbvpUyD5ayuMrcbo/apNH7bMHu6PHtHnLxoYk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ZWFLyUpo5OVl8tQ7ZyCetcSotR3IxUDq+p7K6vQwUnTEmRhKSS0z4JkN2c/nJ+ktrD8tnptKRLflZ18iCumA+wr6Ooev9FsSEX8b7RYyeHcBTutCAc01CHQLXeuvpqULDD0+dKm9kchkR+T/5WB21NHjKgfk4hcc0YtSgDgdpsQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LjIkdpla; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dHkWHkU5; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60D53WEX2868933
	for <linux-arm-msm@vger.kernel.org>; Tue, 13 Jan 2026 08:52:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	1lQXOd1KKTc9ZUkBgQZvbAmGnYcheIgsNLhqD8IWc+E=; b=LjIkdplarapmzQwz
	4Dwt73rSX22fVP32HBuAYLrmu9ts/KFyP3Oy9YIhTMqSLP8zUP3hUeb2pH4ES4GW
	sHaIJaCI7e/5uHPtaVCMQz0Otb1aGF469ALcM7yl7BnbxzBKs4MTIUF/Kxwo6qu2
	67yUCtAv8jel6qwAzRcxubuRA5TpUhJTDDvr+M48hOfVz9fiSNovUO5HyGcDqgbC
	b0NQba5BdV7kTCmmCT5jC4XZuFLmoK1P+U7yFO8mrs3bZ3ZgrpRSprBN5/ZZuOlP
	4emz4VOn5rytBfpEuA0ip2+iYlRQOArWmHF9YaZRiuD7HN8OjZEUaQv/PvVVsDzr
	oDtliw==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bnfjh8nk1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 13 Jan 2026 08:52:17 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4f1aba09639so19753931cf.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 13 Jan 2026 00:52:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768294337; x=1768899137; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=1lQXOd1KKTc9ZUkBgQZvbAmGnYcheIgsNLhqD8IWc+E=;
        b=dHkWHkU5O/EvIy105nAZgfjrwR71SnaKWJ3agVFwnL6NLFqkj/yWOAfFfQV3almPhd
         /SXzMTF3ANnhSm/wD30H3fJvJBvbrFF1UT0XTzSqum3cfW2OEnQl8mSMal/9Jrr/IQAx
         DKNNeMJBAWdUzetdotTb+zKb+itGCXKSDzTHtUQ7qXf7W25vHXBhCcYsHie+WiSnfZz8
         bGz6Gt9eidt+WlYQ+2fjE4CdeoYnMTs8QxERp3HiNIvQtj0nV7lg96W1d8elaKC6QI0B
         MDU0jQ8Ab6kBsCbXR4Cxzl0KafBR/L5RzFzWRqbUFw6dHchrLMpej6ujSY2LDvLjzn9b
         aVhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768294337; x=1768899137;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1lQXOd1KKTc9ZUkBgQZvbAmGnYcheIgsNLhqD8IWc+E=;
        b=HGqCCArOPEX3dXr7epS/VNR65mT2vT17lUwcRUeNwqBRUatg0fxZ/YdFQAGHvJeKlq
         vId4F7+E6g4VURa2rBDbzj6ZGTQMhQTUrSheFuG3ANtJlBkln8xIOLHqiyksw28MOtd+
         yzgk+MDd0WNSew4ipUPzurEmoWgHF9nK2xbjAzrEqyIFnqZk+l+bCZr62yTqvNEimTBx
         Zzqpuhn5ubv9xMqBksO8kVN2VN3AItbkJWAbrPrRXxiFU8wdugquWJ4TzovERDCx4au4
         74xtjHE95TdZEiyNE209s23Mk1Bvbbb82SRzcaG/9WwXWg7LkTDZ/rCJUMkBWfUZeijB
         V3hg==
X-Forwarded-Encrypted: i=1; AJvYcCVjIq6A8wwiJjfv2QHmewsLGGnaoSe8bKLX39FS+8oWx2rzoVzmf5CSSJs1SAwQHoAcrf4kDKDlOiMZ6tgu@vger.kernel.org
X-Gm-Message-State: AOJu0YwVX/rUGoUl0dMX1X/hkjFRW31gp4ziFgOZ0bPxkU+0LdCvNuAh
	5bCVNWwPfKaEzkqSho4bcIy+n3X98qjgpRwPLk31G8zRYynItFDdRi3+Luaw3XzQBRMXc/iUsql
	cPORXbhRLD9wec5Ds5NNFraDTwYfdTCxN2ZNi/I6ytBGT6nYOkLQodPDUYHibJmBfwplR
X-Gm-Gg: AY/fxX5gQ9bGYyIPDlQBndcAiVSSes1wL81eII4WFCHbLSYGNEkNV/0BKetDNQ1kd8d
	/5tFtoi0FMa7xtSsR0vbNEc/oApek4f4VArJlGb2Y50nkcNFPJYo+ggqMTdE9LkSopO/u3YSQl0
	xP3mNs5ktitkQ4B60ESGgJveDwcQhgVenPG916zjqH39rtZOZnJ3Rp4sigRgqBry1SW33t5TR9q
	9I5H4jjBCw1uO2shOsggKlepIN4/DFHiN2s6THBNwUUdm6xbuFVg0vcMXhnLz/eCURLlOKQPRD8
	L/6wvhDuOhfbCr+UxAmJlcrn9myECtwhJIR/2ZRPB+chEK/5ZB97kBpKgiQx2hh4LerfJHPMIbI
	sCppfu0I7+19SjlHtXVLWYOR/MeZxAdDfDVwHdRNtURP2zg/AKjSvH8dqK5dSMfYK91g=
X-Received: by 2002:a05:622a:211:b0:4ee:2580:9bc5 with SMTP id d75a77b69052e-4ffb47cfe1amr231896211cf.2.1768294336587;
        Tue, 13 Jan 2026 00:52:16 -0800 (PST)
X-Google-Smtp-Source: AGHT+IETc6GdkVdeaY5/4I3Jcs/tlWW0K4PJHocn3Se4hiY8tlHeYxeD0etiISmOVNLOKDw8XBRHhQ==
X-Received: by 2002:a05:622a:211:b0:4ee:2580:9bc5 with SMTP id d75a77b69052e-4ffb47cfe1amr231896101cf.2.1768294336208;
        Tue, 13 Jan 2026 00:52:16 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b842a4cfe76sm2137792366b.40.2026.01.13.00.52.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 Jan 2026 00:52:15 -0800 (PST)
Message-ID: <dc0d8efc-2cc4-4d37-832b-f4cb3c170722@oss.qualcomm.com>
Date: Tue, 13 Jan 2026 09:52:12 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 6/6] arm64: dts: qcom: Add Redmi Note 8T
To: barnabas.czeman@mainlining.org,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Gabriel Gonzales <semfault@disroot.org>, Kees Cook <kees@kernel.org>,
        Tony Luck <tony.luck@intel.com>,
        "Guilherme G. Piccoli" <gpiccoli@igalia.com>,
        Biswapriyo Nath <nathbappai@gmail.com>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-hardening@vger.kernel.org, phone-devel@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht, linux@mainlining.org
References: <20260112-xiaomi-willow-v1-0-8e4476897638@mainlining.org>
 <20260112-xiaomi-willow-v1-6-8e4476897638@mainlining.org>
 <3d2qboek2kzsnsjmn7rqi6xkfotfchc7vdmyeprivu27l3rw2b@i5lbwsvxfwdb>
 <aa8d5d6f9301d94b56af4580210ffc88@mainlining.org>
 <nrudictx64m24ydh265c4ma7txfdmmncjqfl4xq6zxvk75lkzq@wu6vnehc3dqu>
 <abd31188336b3322b9322f1e6791320e@mainlining.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <abd31188336b3322b9322f1e6791320e@mainlining.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTEzMDA3NCBTYWx0ZWRfX72QuTZwcNTem
 hY6kqqomoe8sEJrobCPvAhuP+RRZ248uhUQdak2lvPkMnHk8RSdKWOfoWE1OgGeQ4VztUZ6eFPS
 qhXLivdNlmFyNaFtEziXLYPzilRt+QAlfBMGN1ZcZ0W5duOp+/sQjDqQOeGXj737uB0pR5NHmIe
 oZ80EPdo4StEr2sDkktiCmidqr86BBZ25oNOcvpPnTTcjfiHiQG0q16K9jyLVdR0wb4JJA3QmJy
 xGp2c/ErY7hBnzrOBFKMeqObdx72z0Os3gHC+y99bb5hoxxa0c8mec00K/ASEw+CA/ThWwg+AAw
 CYPgp/YaPTqnLxLhD4sm2ncqVNhtEr1I8HiPF9dg7Is4oV0YQ224x/0vW2v7TVyWdIhZnJRjz/3
 smpcJEFEppMiY8WqSQdJKRLpQuoa8HQdV5JQkmM2xuyqiSFHOdztZQISoNYnAV3r0//h1Sw67l8
 DUKGwZYlKlQvcUgVvFA==
X-Proofpoint-GUID: utFaQa_C6o5KqIexn-sPMX1oQ6TNIW_W
X-Proofpoint-ORIG-GUID: utFaQa_C6o5KqIexn-sPMX1oQ6TNIW_W
X-Authority-Analysis: v=2.4 cv=XJQ9iAhE c=1 sm=1 tr=0 ts=696607c1 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=OuZLqq7tAAAA:8 a=LpNgXrTXAAAA:8
 a=dFmOiwFbY9cOzGFAODQA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22 a=AKGiAy9iJ-JzxKVHQNES:22 a=LqOpv0_-CX5VL_7kjZO3:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-13_01,2026-01-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 malwarescore=0 spamscore=0 phishscore=0
 priorityscore=1501 suspectscore=0 clxscore=1015 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601130074

On 1/13/26 1:49 AM, barnabas.czeman@mainlining.org wrote:
> On 2026-01-13 01:22, Dmitry Baryshkov wrote:
>> On Tue, Jan 13, 2026 at 12:41:43AM +0100, barnabas.czeman@mainlining.org wrote:
>>> On 2026-01-12 23:15, Dmitry Baryshkov wrote:
>>> > On Mon, Jan 12, 2026 at 09:13:29PM +0100, Barnabás Czémán wrote:
>>> > > Redmi Note 8T (willow) is very similar to Redmi Note 8 (ginkgo)
>>> > > the only difference is willow have NFC.
>>> > > Make a common base from ginkgo devicetree for both device.
>>> > >
>>> > > Signed-off-by: Barnabás Czémán <barnabas.czeman@mainlining.org>
>>> > > ---
>>> > >  arch/arm64/boot/dts/qcom/Makefile                  |   1 +
>>> > >  .../boot/dts/qcom/sm6125-xiaomi-ginkgo-common.dtsi | 302
>>> > > +++++++++++++++++++++
>>> > >  arch/arm64/boot/dts/qcom/sm6125-xiaomi-ginkgo.dts  | 296
>>> > > +-------------------
>>> > >  arch/arm64/boot/dts/qcom/sm6125-xiaomi-willow.dts  |  13 +
>>> > >  4 files changed, 318 insertions(+), 294 deletions(-)
>>> > >
>>> > > diff --git a/arch/arm64/boot/dts/qcom/sm6125-xiaomi-ginkgo.dts
>>> > > b/arch/arm64/boot/dts/qcom/sm6125-xiaomi-ginkgo.dts
>>> > > index 163ecdc7fd6c..70be19357d11 100644
>>> > > --- a/arch/arm64/boot/dts/qcom/sm6125-xiaomi-ginkgo.dts
>>> > > +++ b/arch/arm64/boot/dts/qcom/sm6125-xiaomi-ginkgo.dts
>>> > > @@ -1,304 +1,12 @@
>>> > >  // SPDX-License-Identifier: BSD-3-Clause
>>> > >  /*
>>> > > - * Copyright (c) 2025, Gabriel Gonzales <semfault@disroot.org>
>>> > > + * Copyright (c) 2026, Barnabas Czeman
>>> >
>>> > Hmm?
>>> Original file was renamed to sm6125-xiaomi-ginkgo-common.dtsi this is a new
>>> file just the file name is same.
>>
>> Following Konrad's advice:
>>
>> Would the following addition to .gitconfig help?
> No, only until i am not creating the sm6125-xiaomi-ginkgo.dts and adding it to the stage.

JFYI it works on my machine (tm), the part with just additions is turned
into:

copy arch/arm64/boot/dts/qcom/{sm6125-xiaomi-ginkgo.dts =>
	sm6125-xiaomi-ginkgo-common.dtsi} (98%)

I'm on git 2.52.0 if that helps

Konrad

