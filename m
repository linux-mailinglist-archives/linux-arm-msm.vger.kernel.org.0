Return-Path: <linux-arm-msm+bounces-78008-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 73E1FBF15A6
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Oct 2025 14:53:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 472864E0695
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Oct 2025 12:53:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 967473126B1;
	Mon, 20 Oct 2025 12:53:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dgo10asf"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CABDF2FB621
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Oct 2025 12:53:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760964800; cv=none; b=JE6CMSQR8jnKeph8P46c7CDG5JOrtXhiUW1PpuVJbjM80XnZI1BcW3IQVdPB9PJzas4CffQpHWfbPzfxGHAug0we3zflHSSCOcugZyy2G+xlzR485rlzZuWekYHcyV3tsxnvqTL5GCXTIG6k91iZ1JTJOuh/JV0QA0a0tQOtoAM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760964800; c=relaxed/simple;
	bh=b1Ho41wPbtTkT4EBGbCu60ljlAVIsBmQU8YjFD4CUz0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ClVkkM7L/2LYiZcNII34r7TMQck127MYiTdoKAiw4coeeZpuoHppmk3UMvRtDRuAcbPpDXwNLSg8ZeIjACGAivhkaRZGcCaXyC4JjCBz3RCdUfEpD71qaJfJokE1jdUZGi3U9Q1TrgmdG0WRvfuFaQs0p34VoNXNXvG+15DY67k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dgo10asf; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59KBArbP021970
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Oct 2025 12:53:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	EF+mB/bpa3oyIOPYc2W7+74/IY9ayvbAnqsJ0d+UfCQ=; b=dgo10asfv6ehTpQ6
	GPUZA00FWZy3SY8YQRLCV0DCmGaJMBlgNSkjdK4gs5z9fXW6YwDWUhiiZQeW/joQ
	//TSDT3sFm7j69wh/ga7DGp8WXjRg/wVxWQYEaOc2/F2CACObQL6Pc9PRFC6eLpB
	ZrlQB0EN7wIzAs6sEpsJkf2Fvki87uZfquFfpkamW6qVW2s6dEmSHkOGA2r5SSdp
	b7++T0eKWDVGaAU5OtwYBFzOxVSuJjyohD64EeaLS1MaxZIO3oSn4hXyYpZE/5WU
	r+VAtIzVn+G5L1SAlN85yIUtQooplbnd20CKBywLkdcV6oe+ELsW8a4lu5tyCY+l
	Smv43A==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49v343vsb1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Oct 2025 12:53:17 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-88fcdbdb598so192109885a.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 20 Oct 2025 05:53:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760964796; x=1761569596;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=EF+mB/bpa3oyIOPYc2W7+74/IY9ayvbAnqsJ0d+UfCQ=;
        b=RsRuefKsf3p7OkL83YlWSHF5EH+bxmvLHqBnaho5kM1uE91SkK687fHY2Zvaz21VE0
         ZtH+ITypgNQzw8FSi+5u12aelcebp+OcSckjBwdGTYg5fCnnPy60XNthkUA1V0GYC94l
         er6G0idTHrhfjHDzUgzas4vsnEj/WLNsxXR5DLLvNT+g6YuHjfUJBSMEmEq1tCiq9vRk
         RZT+j9M+/XDh1VLFgXOMr50dbITIVUC+JYA0o8dsZ9zc+pz9PnsDGN6q1UWvoaac99kb
         NVDkEqDSSw0eAPI5Y2nQNKtO5Ws1CSnKBIzsLnNk9Ly4lrCcxXh1nuFnmL7emeb06Br6
         V58w==
X-Forwarded-Encrypted: i=1; AJvYcCWry/45xxMaiXgoCAk0MtgE2McrI0r8/kBvqEV0wn1jTYrDbO0+kkXU97nzTf/MbudDu88dwiM9ir8xUxYJ@vger.kernel.org
X-Gm-Message-State: AOJu0YxB+P06mdQI67LxCQbIHFTvOLHAlbjr3kbwJhCl9EDVPkYLp8bG
	ZEqPxBfXbH2Yq4iRH+dQrK1mEPJHHQXhoeFQmorLU1rjbgYIqrLvAf+PMdfTS1E101BYIePmTSJ
	6QOX8BTVgvT7Om35EUhej2FuZDow8vmlnLceBn+NI7lEFZMsfo5Lina3ZxvvC2Z80DkRR
X-Gm-Gg: ASbGncuDpIwbmfYbwWlS4zoFKu+1Afv05Ou1lpUHMycQzraU0KIJF5ajRCGULCSZVbM
	IR8CxF4ES5QdJBCF+z3IfyJdB2oPdjE1cH8vAjhvfhr9OJvfcTk3UdMLd3ciZrnVjf8XWhuaKLi
	vi+CMw5WmODj4EZklDYdoF/ROzwAnzcCWvfKouQdkCfVHvvrbeSPj3yNZ8YX7S7TsSwuSO0qAwz
	la7ouhzwKFA0Bf+9DD7ullJ1Qgq+RA/c8ug3n8ErYKOxs/BWUD7pOBhADE8FavTwLFsu08T1ffl
	OMB0c9jmA//b1n0OBVew8v+BZzNbymsNQCMs9kJgZcpLaFkQhg33wAu3Ehn0PNmHeJBr5S12Db3
	x+YQ7Y+4wAlyEM7Hbc8IcvM4qjc6b0AwDe/a2T3p5rd2Eu+KW2uQAP4hT
X-Received: by 2002:ac8:7f88:0:b0:4b5:a0fb:59a4 with SMTP id d75a77b69052e-4e89d204a5amr104645531cf.1.1760964796362;
        Mon, 20 Oct 2025 05:53:16 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGMUijr7zh7WDC9Ju5q9CPUNhL99y4KT2cXZBubsxI6OQ3z4vNYFwHW90nzecqKoXWsctT9TQ==
X-Received: by 2002:ac8:7f88:0:b0:4b5:a0fb:59a4 with SMTP id d75a77b69052e-4e89d204a5amr104645301cf.1.1760964795892;
        Mon, 20 Oct 2025 05:53:15 -0700 (PDT)
Received: from [192.168.119.202] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b65eb9523a7sm802235066b.71.2025.10.20.05.53.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 20 Oct 2025 05:53:15 -0700 (PDT)
Message-ID: <9631ca0a-9944-4322-ab05-25b46ed27c07@oss.qualcomm.com>
Date: Mon, 20 Oct 2025 14:53:13 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 1/3] media: qcom: camss: Add common TPG support
To: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>,
        Robert Foss
 <rfoss@kernel.org>, Todor Tomov <todor.too@gmail.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
References: <20251017-camss_tpg-v5-0-cafe3ad42163@oss.qualcomm.com>
 <20251017-camss_tpg-v5-1-cafe3ad42163@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20251017-camss_tpg-v5-1-cafe3ad42163@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 0A8GWhZ1mL79i_9Pd8wq10fGjfkDNy1G
X-Proofpoint-ORIG-GUID: 0A8GWhZ1mL79i_9Pd8wq10fGjfkDNy1G
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDE4MDAyMyBTYWx0ZWRfX7unhB/kUUcXJ
 7vGl9RJaQ2MbQ9bSgxik2QQ5qgWS21RNRPZ4M5GSNChyhqDV8Z0pMqCIW8cMe1W1HPPTQECtVic
 NidaxsR/pfxcCRYsqfojD3WEIec5eWEiea+S7Z2N/QhA6hlc35PZTIHWtKEFDVk6s2lYRwTrwTy
 H3xYNp0XT/kSk/ZEA7dCI2d7PYi/XVUgT0hXwNhF40XpDFocPgRzfEDbajzYSg2yE2Ggh2YaVAE
 wiojw2VMCM0Vp166hadHSCM38bNRC4uPA5uGzKTPuH7pI1hCEPGX4aZKxIcqXFpd9+57v3if7J5
 IaE0vtqp2qLQSkuaFNqG739pdDC9HuaI2gCiumFwz1GMT8KjgzMC1i55BX7e7/jQN7CCpfDYvct
 9C0M/oQMAOiWyLIHhECN7Z8Lso+h4g==
X-Authority-Analysis: v=2.4 cv=E/vAZKdl c=1 sm=1 tr=0 ts=68f630bd cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=Hdz6Az-7eOjHTHoZ_0EA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-20_04,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 priorityscore=1501 bulkscore=0 suspectscore=0
 lowpriorityscore=0 clxscore=1015 adultscore=0 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510180023

On 10/17/25 7:06 AM, Wenmeng Liu wrote:
> Introduce a new common Test Pattern Generator (TPG) implementation for
> Qualcomm CAMSS. This module provides a generic interface for pattern
> generation that can be reused by multiple platforms.
> 
> Unlike CSID-integrated TPG, this TPG acts as a standalone block
> that emulates both CSIPHY and sensor behavior, enabling flexible test
> patterns without external hardware.
> 
> Signed-off-by: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
> ---

[...]

> +const struct tpg_format_info *tpg_get_fmt_entry(struct tpg_device *tpg,
> +						const struct tpg_format_info *formats,
> +						unsigned int nformats,
> +						u32 code)
> +{
> +	struct device *dev = tpg->camss->dev;
> +	size_t i;
> +
> +	for (i = 0; i < nformats; i++)
> +		if (code == formats[i].code)
> +			return &formats[i];
> +
> +	dev_warn_once(dev, "Unknown format\n");

It would probably be useful to denote which format is invalid (i.e.
print its code or so), and _once doesn't seem like a right choice,
because the user may choose 2 different invalid formats and only
the first one would cause a descriptive warning

Konrad

