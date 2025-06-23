Return-Path: <linux-arm-msm+bounces-62028-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id EA81DAE3C00
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Jun 2025 12:16:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7B15F165EC4
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Jun 2025 10:16:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0CB9023BCED;
	Mon, 23 Jun 2025 10:16:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ikQ9z5DV"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F1EB1C8FB5
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Jun 2025 10:16:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750673796; cv=none; b=L2iQVdcFAFGVyRlufXg49NwvDzlwCdDFMGemTTbpOOFVENfuoZb7btcax7b68SMvxxhDQgN83EyFyMFJmgduK+9Ss6sJ7H4w/6Yir+RS5fpG8mogN23R3R5b3An96QXQoE7fHgYzbqmiU2wgPcRm9a31BqD6mj/LdkHCAX7ISl4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750673796; c=relaxed/simple;
	bh=sOYwnsD0J+xxTdJBrWtF62Dve/ltjAqoPZ0RC6eB3q0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=FehgRwLs0PFhW+HOlrx5jLJ07ENUtlqpyGxl3XxNnwJ3uZY4AbpeHY70VO16yDCQ+zULGXFspAp0oCIoELEdqgX7R68IokVR3fTqFXFC85sZXKaomoMQ3jtA/hicBFI98NJjXm6J9lTJtrb8RkE+H0W8r8pR5BOJt8VgVpNH0rA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ikQ9z5DV; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55N8qcTC021842
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Jun 2025 10:16:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	2SlDmKSsNzdYdPWzZxnDLI0jZ+Dr5yKFvIhxTvVVGIA=; b=ikQ9z5DV+jcVazYe
	5tQdq4rfIbPEbnAzNNnW6A3kHH3yjYVEAfgph0V9pZ9E2zwnVc3byGMWnbn3wXE9
	lAuxyMq8SweuFfjz+skgEsZH87vdGAjmoY8tHkSqri8xCffYHlscCa9Bq3G/t28a
	5SEPI1wblw0gc6eT6PBopFHfYGyF5q0OC20wjPL9kU4DPyFy/2aBmOlzx665VT5c
	EY8xyeQF+8KVZxECCTSDzpHPrbrYFAVABlULRkjeohpsvbq/yEYzLa5qyo+ge762
	N7Eq48dqrgeouCJcSjmLWGyaEA/6WbTMJs45nKmVcjlsegy3e4T+Zt1n9E5tWzj1
	8Pol3Q==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47eah7th2q-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Jun 2025 10:16:34 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-6fac0b29789so5137006d6.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 Jun 2025 03:16:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750673793; x=1751278593;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2SlDmKSsNzdYdPWzZxnDLI0jZ+Dr5yKFvIhxTvVVGIA=;
        b=ASyXPii+GaTYuGRFfj/MexM1HGF8ElipAKzj2sHcz410827Y00J7GKNDLYSeJozKK2
         7TnA/14YJRaUD/J0WwyupUG/OLFJZWPsynKBJse2A531hB3HfTlePs1L86bmZHca61ZN
         WcmKD2M4U4TWlpAzs8Q6w8FVIhqcbhqgH7mxvohOXzKDpI8/XByctWZHcHLIGdpu7jpF
         n1iOXQgn22040uvjLW+GbOMnlhDb0A+XfJolxGxuAHEWoFN3JKDCs7qytt03ZqbZ8tvT
         G8sfVWp7uLiSCqYvPESgdUaXIDfoi/y3L/GDEL2ODDm+NKYPx5UKgzLPSCpwyGUmFOBF
         1/fg==
X-Forwarded-Encrypted: i=1; AJvYcCWYhqMGjPCoGeSV66YYHNjV9W3Uy2ty/wG5V0R01SiGFUgvZ2pt25O5sQOVFa5/rVpVJdnlj5oHmpRB5Jlw@vger.kernel.org
X-Gm-Message-State: AOJu0Yx5DR2N6CrmkcDmUMKAasmrnSrsg3acJvYRwufa84SPgfP6OI8c
	mntpJqTicsRMaXizQC4SNLY//xXHGlwusnLghgJIrymblTminYMcFnf+HN36iy5OHCkJPSfDsJ8
	4LpQQCbsuAZ30xGM8ZuKdo1AnLzN0Bmvmk/kl0sxYYOSS9NfVcdSqPXMzqmQtLS5C2Tmu
X-Gm-Gg: ASbGncvyDsOYOkS//LQZo8mLRIrVu7q2s0PwXTev45cmWgNNGRSC5rZahkNTzQQVbKe
	9Zray4lHrlCMeSFh+ayXr3pQU3Ya6SpKOWjp/OVDGApaQkSOinyU4HR4ZF2ZtwFW6W8SA9r/A+I
	Ye0CHxmQZwsI4H+Iq6BXCGj+WGq7IdtgP3YZQiXZs4cGiSPSJKanvr4WlCt9q7pkOva0gOGXeJo
	k1Dz/gqubc7TpFK5LWfZDhIfg5SY1/g5VDHFthiD47KTOnVXiUdQsUmqwwfSk2Q8df5jo+AYyA/
	4RWaDq3c9zF1+4de0h6s+tQ6aOXGA8lRMFYYPxtE5Vyp4NU3vHKJXLrL/ZaCngsHowRePhG3ht6
	MWHc=
X-Received: by 2002:ac8:5fcd:0:b0:4a7:79e1:cd54 with SMTP id d75a77b69052e-4a77a1bccadmr56054031cf.6.1750673793576;
        Mon, 23 Jun 2025 03:16:33 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGgUfDzyPIwCHeQDEwA6qykj5CrocIwRAGCcAAOLEMk3iHjz6Ei/uX0xUXjX6QkfYbNoV4T2g==
X-Received: by 2002:ac8:5fcd:0:b0:4a7:79e1:cd54 with SMTP id d75a77b69052e-4a77a1bccadmr56053821cf.6.1750673793220;
        Mon, 23 Jun 2025 03:16:33 -0700 (PDT)
Received: from [192.168.143.225] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae0541b7438sm677772266b.125.2025.06.23.03.16.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Jun 2025 03:16:32 -0700 (PDT)
Message-ID: <85adb1bf-2624-4280-b1e2-1bd2aed141b7@oss.qualcomm.com>
Date: Mon, 23 Jun 2025 12:16:30 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 2/2] arm64: dts: qcom: x1-asus-zenbook: support sound
To: Aleksandrs Vinarskis <alex.vinarskis@gmail.com>,
        Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
References: <20250622134301.10403-1-alex.vinarskis@gmail.com>
 <20250622134301.10403-3-alex.vinarskis@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250622134301.10403-3-alex.vinarskis@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: MnXqy6EO2qx7rAam8VSmbAKTp9pd5qBV
X-Authority-Analysis: v=2.4 cv=PpWTbxM3 c=1 sm=1 tr=0 ts=68592982 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8
 a=jVxV0LTIGXaBgX6IzjgA:9 a=QEXdDO2ut3YA:10 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjIzMDA2MSBTYWx0ZWRfX1hOozgqAlERH
 afEKyZdPFRiBJUFEHPwUtOb7MhAPRn3/LxCjs0ul7vOe1n23XcNInB9LX22E/CHYKVIoRdDKoDp
 8nOs8EmQfH5pqXSYHahiZVUNzAglnGXa5vSgYWrH6QBHm+WudyLmjgiKBEt487siaHZjor/d0BR
 O6/ikcS+jYIY5M5c1U8YGR1WU/1FfPBWwzaBDrqdMV/9T75XCNIxMyMKLkYIFI75g1fHUV/J5Nd
 RFYPccJz21giuecWgghtHrFgAR9eWRF8xP4u4LLyktrcGfdhqjfXwOAYnC4So8trtNcrUCeb7CQ
 wH090EScZeS2XTXNv7jK0HpBOJSE0YvyPMwW42zmdGSSX+r8DxWrOkxRrlPqY6NVTkJvvZD0YhZ
 PvLlIYCCC1VMk3Z9ktzekm32tkJXGPIVxgrPf9B6OkTLccRqcSUEPBDYZBLObZPLpqQbFzLX
X-Proofpoint-GUID: MnXqy6EO2qx7rAam8VSmbAKTp9pd5qBV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-23_03,2025-06-23_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=905 clxscore=1015 adultscore=0 mlxscore=0 priorityscore=1501
 impostorscore=0 lowpriorityscore=0 suspectscore=0 malwarescore=0 spamscore=0
 bulkscore=0 phishscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506230061

On 6/22/25 3:40 PM, Aleksandrs Vinarskis wrote:
> Works:
> * Both speakers
> * Both MICs
> * Headphones jack, L/R channels
> * Headphones jack, MIC
> 
> Now working/untested:
> * Sound over DisplayPort
> * Sound over HDMI
> 
> Signed-off-by: Aleksandrs Vinarskis <alex.vinarskis@gmail.com>
> ---

[...]

> +		va-dai-link {
> +			link-name = "VA Capture";
> +
> +			cpu {
> +				sound-dai = <&q6apmbedai VA_CODEC_DMA_TX_0>;
> +			};
> +
> +			codec {

'co'dec < 'cp'u


with that

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

