Return-Path: <linux-arm-msm+bounces-65450-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E117FB08C18
	for <lists+linux-arm-msm@lfdr.de>; Thu, 17 Jul 2025 13:54:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9C35DA62CD7
	for <lists+linux-arm-msm@lfdr.de>; Thu, 17 Jul 2025 11:53:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A93DD2BD5BF;
	Thu, 17 Jul 2025 11:52:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jAt0LGkS"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDD492BD034
	for <linux-arm-msm@vger.kernel.org>; Thu, 17 Jul 2025 11:52:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752753153; cv=none; b=uK3p0UMmkp+Vc1YNOgoefDdJEmqOQHZ/pcKJ48CGrFstDJvE41wE/mIZs8B+rTqvhwRzmAbhkVB2uSKruJgw+7YKg4ARU5DMYZ+8DkhgyiCphiyy3NGE0b5gb4Qr4TKU0JNtDfCj2exAHZoIRlc5bdLyfaL1i1G3GIubqRxnUW0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752753153; c=relaxed/simple;
	bh=JhYxfdlFBrgBJs/tk2SA7Oedtf+sGKDg3q3NMifzV6c=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=PbT6wcWiRzSaxd6kSU6rrvk5NJWdgnZZlVkI1ZI4MeW1o7tlkKOylyp9n/KlDPUXANldisZHl1YT0v2Xzh4fC5u4Q0k/YNZcexLCR/fIgrUQA/qWpO+oiE1k7FNT77iWtCx4LKP2n+4pTD8dfDswuV5sUK8QIfZTHZJTvaI/esI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jAt0LGkS; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56H5DnA1032408
	for <linux-arm-msm@vger.kernel.org>; Thu, 17 Jul 2025 11:52:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	WZVGQnL5TZo99a4mnnswTTOdpwcB5rmoTJT1t4G0z/I=; b=jAt0LGkSBPvwMg3V
	FvC9NZYuq2vosfYQDNrxR9Y7DZPBHxBFTmPd/UBx/Td2R8TKg1jwg8gOMIwOx+MU
	A3h1+Fj5rymhZ5wKlwJ0BRIMoqB01E5jXC996ekTd9mupCtAfVWgh9gxG2iQaqtV
	FW5lADnuCsAKof2+kQ6JJ80/0M1yNbQWj0D1gTY37+64By3DgGvLpy9XUlHy4eeF
	+OxsIMYUoMlDyov8+/le1F/rL5Z4uX8eXWSvjdi03Qb6w5zvPDYjKUwJUETJyN1T
	CS4K+XcpeOQSg/XNZk51Wp1Y41sh8N7am3UgY6Oh3j5bxgAxvTfw/cvtowWoZUam
	sout6Q==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47ug387kk1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 17 Jul 2025 11:52:30 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4ab5e4f4600so1571651cf.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 17 Jul 2025 04:52:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752753150; x=1753357950;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=WZVGQnL5TZo99a4mnnswTTOdpwcB5rmoTJT1t4G0z/I=;
        b=kWoYfLJ8ZJ4DvX8vEn1lDuGy7twBcRmvuv1J6QIPWcNxqejV5Ke1YStrCrtyHO+G+/
         khBX7Z5twOTHpog/hN3FMP1MhJw39bSnZlAmhElzvWv7i0NJXWzzjG5id5vLKRh/LV9e
         fRqDA3MGuac1zSp3tUOseDsfwIv+ji1QmIOQk9UiZJ4Hly92MHPxKPL727kYFH0zAVwY
         1K5sLrpEK7xw80jpaHu+kKM/sPsod+n5dA5he+XdSvws5XCp9DCkPF8laH+VKoydWVNr
         Im26ol56UpeXfwUNOdorJvWIc8pEZ53V6ydMM7+j3KqhAaAEqhJIWSCCwI2RKzn4HRDA
         8WtQ==
X-Gm-Message-State: AOJu0YwsrTfSfq/a0FwKdV0ONeRg3ovXy92CnJtxCpes7YzxCRhtjjXr
	7+FSc187ncgEtSlfzOFbGfDeNLsPZmewReDJsTi3Vyb/q6EbFLAuiawa0VPfpyiS0Id30kNvkip
	RTNc3etc7WwJcZYAzUIs8iuptHQF5K+x/G063Ov1yCRBqv+PNrU4mqrKklXMscLg7jWve
X-Gm-Gg: ASbGnct/ZtpBhclKfVJlq2pKR5AFD29gGE0diaG8DrzP1XOYxxaSNlOV9jJP7odUMZq
	F9P8cg/PIOF8Vgq6TBvHSBMQPoYIWdLR4mtxtLm6JuYZU49+dOf114AUEA7O1Q7AxymFHllTXIa
	MjyGlsvCoUc4hMWGBJ6VtyEoteR1LRHU6UFdWcG/K0Hy1O37NPk9J6JvxPhSdyRe+q3roWFvgsz
	2IdwmnrtL+LfoH0VctVJSd9GtpM6b2+mc3AwO1vlZ5J6u5Q5tC8Pgvh2sJFkxohGkENhE9cPxC6
	21cjHu1/4TI3iH8vwnEyDk+GqlJ8NB/wkbylpTxRqC1B9wpk1D9mPin7S6hvbzsMIQ6dRyRhGED
	609I/FkIzJ2zXGBQBX7+F
X-Received: by 2002:a05:622a:1889:b0:4ab:76d2:1981 with SMTP id d75a77b69052e-4ab90a4e458mr45118471cf.5.1752753149741;
        Thu, 17 Jul 2025 04:52:29 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEuOt8ES7BujIafZFzB0IDxfkg7AjYigc52yOQaSQVHFHTLySwxQnQewjoSqSZcB6Uo+8EkFA==
X-Received: by 2002:a05:622a:1889:b0:4ab:76d2:1981 with SMTP id d75a77b69052e-4ab90a4e458mr45118231cf.5.1752753149235;
        Thu, 17 Jul 2025 04:52:29 -0700 (PDT)
Received: from [192.168.143.225] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-611c9734069sm10024385a12.48.2025.07.17.04.52.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 17 Jul 2025 04:52:28 -0700 (PDT)
Message-ID: <e69e6128-3f50-4bd3-89bb-09d7b237a568@oss.qualcomm.com>
Date: Thu, 17 Jul 2025 13:52:26 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] pinctrl: qcom: Add glymur pinctrl driver
To: Pankaj Patil <pankaj.patil@oss.qualcomm.com>, andersson@kernel.org,
        linus.walleij@linaro.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, quic_rjendra@quicinc.com
Cc: linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250716150822.4039250-1-pankaj.patil@oss.qualcomm.com>
 <20250716150822.4039250-3-pankaj.patil@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250716150822.4039250-3-pankaj.patil@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzE3MDEwMyBTYWx0ZWRfX44TU/8ToiaZv
 0R2SrsjL+rJqSyhsp2cvladdVwSGu2CCRiNzR4BdFQBTgI7sJksDANhja1RzCgiP1+MXDgB/okC
 eSZ4lfT45INmkIM2MUQZGaDMSyQVcPMS5ekIIdPi7Jp1+1j8LAmUcA0bbmovZJ5N9wlOIIocV23
 9uG6kjNmvV+octs+sjUNgXHjaXUVW7wU3XG32KGOW5gvRMpx+9UwoHD2fF+hwIW1JEVECD9pddR
 8x9JLfVr8pOMNcAQXHUzCEvgdEpabawQA8VB0xXbpvLmkV+iqA4H+gIG6a4GmfRQa+yuL6hRcFZ
 u6t21LiQTzRiMDmcvxogkMYjlchtSsRla8lpyx6CqceHfVmtGfvAyGreqr/fyXttLLJ76QrPN3t
 IGhXDwPplnMEg4jvcZCGxd+BFZjeATlDK3FhoK7P+AnEUtMJWhI2UYKB8mnwC3UnEexkRs1x
X-Proofpoint-GUID: _jDpI4h5Qdf2qPS5H18eDLinKU0uTWQf
X-Authority-Analysis: v=2.4 cv=SZT3duRu c=1 sm=1 tr=0 ts=6878e3fe cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=-TUSC38FYRssDIeIjfMA:9
 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-ORIG-GUID: _jDpI4h5Qdf2qPS5H18eDLinKU0uTWQf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-17_01,2025-07-17_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 mlxlogscore=999 mlxscore=0 priorityscore=1501
 lowpriorityscore=0 bulkscore=0 adultscore=0 impostorscore=0 malwarescore=0
 phishscore=0 spamscore=0 suspectscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507170103

On 7/16/25 5:08 PM, Pankaj Patil wrote:
> Add TLMM pinctrl driver to support pin configuration with pinctrl
> framework for Glymur SoC.
> 
> Signed-off-by: Pankaj Patil <pankaj.patil@oss.qualcomm.com>
> ---

[...]

> +	[249] = PINGROUP(249, pmc_oca_n, _, _, _, _, _, _, _, _, _, _),
> +	[250] = UFS_RESET(ufs_reset, 0x104004),

You'll need to borrow the #define from 8750 pinctrl

and then:

UFS_RESET(ufs_reset, 0x104004, 0x105000),

> +	[251] = SDC_QDSD_PINGROUP(sdc2_clk, 0xff000, 14, 6),
> +	[252] = SDC_QDSD_PINGROUP(sdc2_cmd, 0xff000, 11, 3),
> +	[253] = SDC_QDSD_PINGROUP(sdc2_data, 0xff000, 9, 0),
> +};
> +

[...]

> +static const struct msm_pinctrl_soc_data glymur_tlmm = {
> +	.pins = glymur_pins,
> +	.npins = ARRAY_SIZE(glymur_pins),
> +	.functions = glymur_functions,
> +	.nfunctions = ARRAY_SIZE(glymur_functions),
> +	.groups = glymur_groups,
> +	.ngroups = ARRAY_SIZE(glymur_groups),
> +	.ngpios = 250,

251 (0..=250, incl. ufs reset)

Konrad

