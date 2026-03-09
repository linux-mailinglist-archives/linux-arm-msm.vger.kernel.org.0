Return-Path: <linux-arm-msm+bounces-96268-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eN58MeHDrmn2IgIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-96268-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 09 Mar 2026 13:58:09 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 721E52394E4
	for <lists+linux-arm-msm@lfdr.de>; Mon, 09 Mar 2026 13:58:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 3C9E8303A8CE
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Mar 2026 12:53:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D9EDE3A5E9D;
	Mon,  9 Mar 2026 12:53:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="c/ST1sZQ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bw6oxXO/"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B09132D3ED1
	for <linux-arm-msm@vger.kernel.org>; Mon,  9 Mar 2026 12:53:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773060834; cv=none; b=Thpv/hU4wKqUejc4Nh+4q92feM/Qc+fBd6KdnubKBXMyMqm/lGffZYgdF07TkymlMhv2Fuq2+sQYcq1KxE3rX6k8Iw2ziasSldzzizgOVk6TgaaiZ5VV3Teswls5F9clJaXXCBnu2mI+2CbRiH28just4gFtN/AMEnXYV6EIbQE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773060834; c=relaxed/simple;
	bh=d8fUD0GwNl3eQlx1UFx2hHaWYhidac1WTkAaDtJFttU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=c3eoy6OYyIFRIMhjIpknNVtEAvSO4kZ3piDa5psh4M2VdFZx9cGxjCA8vSvX5bdZQNycW1lGfjpTHBewRWMdQ1Har5IaOIelXvZ4yQy+R0xdv12Palvhwb7QTw5lxTJZsaI3oOVdCjOZHlH4ZipG2th1HD7L319qk7eLNxPJGTI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=c/ST1sZQ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bw6oxXO/; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 629AWbt31587275
	for <linux-arm-msm@vger.kernel.org>; Mon, 9 Mar 2026 12:53:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	H4lbYf0YIavx0jJvnEi2wW1bWsFrtVER0kzAV3sZcI0=; b=c/ST1sZQKL0tp4lE
	fiIoZ8eJcor8UDTkES0vyVybknPn5dXieJEAiDocQXWd14pbMXz7mxGeYChpNyQj
	v8Jw2X7NFoPuFOWXZRn3Z/M+NqzroeTrU1pLRyFMWhe0U3/tSEIHCJOz82OulN0W
	3q9aJMWbW0ZjCUZzq3mWA9akUD6evQYl7qwV6EsP+5Mx7xZSetGg3WvHujB8Y9t5
	zI/NPghLgPQENu694LlZNz5uG/snFg48j7e2Z9XOP/JMDxa0SJ2bTaDdu3Ej+nyk
	rMBEX4b6rvDZ+iR2IObQwAFi2A7AxDUpnhPIKCXX+l1LRQTDewvF6Sz48nlK0+6D
	zqZ+bg==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4csqcy9jgp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 09 Mar 2026 12:53:53 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8cd90210336so13684085a.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 09 Mar 2026 05:53:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773060832; x=1773665632; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=H4lbYf0YIavx0jJvnEi2wW1bWsFrtVER0kzAV3sZcI0=;
        b=bw6oxXO/LQuBx/JzoAaD+3JFqmAJf9RFAUoF4gCtxVEPcarjWsibZVydmWkO8tq8sz
         l7u9c/aG75l7vgJjYnTx84wko/5Pp7WvmqZ4WMgfd5YT2uM0TWMwuKvOI4Ww+KebBMcS
         uLAsF809creTnYSKZzWQYRbbtOsxNx/8uk7pLRfkg9uRvKnCcPejmlYeB0Vesdn2Kagm
         shLPq32NqcJWhOC7VHnAQdMnISfe+gVXBnUBF5xVXeNdjc9uH4euf/iLs/v23UGVGYE9
         IIxowS8LsDeuZfsDOEfpoFptuQZ7Vp+HzO+eHNJ/If/FAjek8P1gVNv7NQpX0JxvYUIY
         tQlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773060832; x=1773665632;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=H4lbYf0YIavx0jJvnEi2wW1bWsFrtVER0kzAV3sZcI0=;
        b=VKQtubLv1/bHPDaYHZFSgU5XFzfYkv2qtAoDhHbWo4JcNQ7zrd/V2xWaRghxZITvyL
         e+jQdGLJC7IpaKpPLoxYmKnjL59kDyuPNR4G8RDjCqHRkNo8C/vGPTDydvGP70Sf2uJ7
         lSY5TCUROJGQiE6qXQ9iXdAqx4y+1g76LIXnqn/zpu/RQCJTg3iiEUsOt7GOofF3CsGT
         lRsjJWWa2xokGwfV0w7ZkC7qAUHuBOLvv38x58tvFXSsl5E8QLj1eG8/cN7f4du7xmF7
         i7dE6YpjJQBnZwLwDhKZ2iTNmChsoPxDmF5+uGyN0dil29a4FnterUS/nTg5NSYzaHPt
         cncw==
X-Gm-Message-State: AOJu0YyJQW8ANE8S19tvLwkVh08YO8ueXEcIqjJH40Rt/tB2Wag5DZSQ
	4hJZQY8XoJOBXyJEUiZlKiwST2XBG304gCzyAO1bof1B7AhZU9uHLMBY480BTETTsgdUy33D/mL
	wH1ibMa6tBGL+jT7nd4J9LvAr6Pid1dLbm+wMPh5jEwPLehUb9qjBaJNEJxVvpWgw6La72vFHGL
	zL
X-Gm-Gg: ATEYQzxpAuzV1KXs1Gsv9dHBNEOmJQWnUWDQ/7GUCIephtxMzhglHdDhvqSfTQ5T6Ap
	maOOiJd8yqlKIteZl4sCbFwmBwsfyIqVpTVBt7WaZ+8STotFBIlnKobeWsLqlZNqeTaYYF+d3N4
	A+tSRYLh2bhRXHPkTa5qLeBXHhg9a/9bEr8OwTJ0sMm7l0c88pTmCLigvMmYB+6D81UnQpp9gJk
	Q+GbgbjVJsl26ASaGLQ4acmMN82OK7F62xCre+37y2tXeornqR/FXc+PDfNpQnrWpKgtWm0E/O0
	8TXX+Rp6vup2REfvk6AdoobHEk06hSuAD5KtNrkdU2ekXIaQ6Z2kMIDFT//w3SlknhAxsnHQptZ
	zgtx7sLUEY3jjTufMCk5JR2ro+hzrSKb6GFqPl8x2ocRPZXEdzDvCY3BdxjGqbRILfkmZrBTBPC
	b3QSo=
X-Received: by 2002:a05:620a:28c6:b0:8c7:1b40:d096 with SMTP id af79cd13be357-8cd6d4a4270mr1053858785a.9.1773060831966;
        Mon, 09 Mar 2026 05:53:51 -0700 (PDT)
X-Received: by 2002:a05:620a:28c6:b0:8c7:1b40:d096 with SMTP id af79cd13be357-8cd6d4a4270mr1053856185a.9.1773060831557;
        Mon, 09 Mar 2026 05:53:51 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b942f139e3dsm368349066b.36.2026.03.09.05.53.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Mar 2026 05:53:50 -0700 (PDT)
Message-ID: <07b552b4-ecdb-4877-8b45-fcaa6792aee4@oss.qualcomm.com>
Date: Mon, 9 Mar 2026 13:53:48 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/5] arm64: dts: qcom: Add Redmi Go
To: =?UTF-8?B?QmFybmFiw6FzIEN6w6ltw6Fu?= <barnabas.czeman@mainlining.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht,
        linux@mainlining.org, phone-devel@vger.kernel.org
References: <20260305-riva-common-v1-0-436f1f4b7399@mainlining.org>
 <20260305-riva-common-v1-5-436f1f4b7399@mainlining.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260305-riva-common-v1-5-436f1f4b7399@mainlining.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA5MDExOCBTYWx0ZWRfX/imSpBIaxuTr
 2JgnvL10hciflwezU7oiGuUIitxNZF6Iu/kCPyfS3AB+vpMyiVmeolwYIMNFZ83ApnT9xnQLIzR
 hCXiH7+AfbzhMbF+V0ko8QNRwnPTAyyhCdJp2nFZMRAEL9sqPKY0tz8wrarUe+MVLYiHrJ0Nyfg
 3kqPktVgmCWU7vdFjf06DOTw8uli+tmrxLw1+XyVRa1xM9wG5Dyr0Ma7o9/f3oK3IUg9y+l13WY
 nv5h+qWt+qroHJFbgxLGPlS3PyGOJAF9VM0dDZRvUizbZf08XGdV0cgWxEipsHoTCnwAw2fT08o
 xnrNYqASO0ZeX7qUgPsSeuC0yhsfEv+iNg7uUk9ZE/ifKe/dCAADDvVj/1qbyvEgW82cOcyKNAC
 Y4bM0ln0O6jIsTM7+0wf2/qjAva3zjR+8vZUCbx/qkGE3dmMYdzANQh4nvLW1qjUBaLHo5tbGeB
 xqbwHt9hdODOKYixaDg==
X-Authority-Analysis: v=2.4 cv=QJtlhwLL c=1 sm=1 tr=0 ts=69aec2e1 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=OuZLqq7tAAAA:8 a=UXQlu8LILUrf3dYBbyQA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22 a=AKGiAy9iJ-JzxKVHQNES:22
X-Proofpoint-ORIG-GUID: QTKzwbkmHU28OT3ZIv-vv6P6M0RpjXF6
X-Proofpoint-GUID: QTKzwbkmHU28OT3ZIv-vv6P6M0RpjXF6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-09_03,2026-03-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 adultscore=0 spamscore=0 phishscore=0
 lowpriorityscore=0 malwarescore=0 priorityscore=1501 bulkscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2602130000
 definitions=main-2603090118
X-Rspamd-Queue-Id: 721E52394E4
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[12];
	TAGGED_FROM(0.00)[bounces-96268-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,qualcomm.com:dkim,mainlining.org:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-0.943];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

On 3/5/26 6:28 PM, Barnabás Czémán wrote:
> Redmi Go (tiare) is like Redmi 5A with small differences like charging,
> fuel gauge and different speaker codec.
> 
> Signed-off-by: Barnabás Czémán <barnabas.czeman@mainlining.org>
> ---
>  arch/arm64/boot/dts/qcom/Makefile                 |  1 +
>  arch/arm64/boot/dts/qcom/msm8917-xiaomi-tiare.dts | 27 +++++++++++++++++++++++
>  2 files changed, 28 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
> index 20e161e843ed..a74598cf0b47 100644
> --- a/arch/arm64/boot/dts/qcom/Makefile
> +++ b/arch/arm64/boot/dts/qcom/Makefile
> @@ -83,6 +83,7 @@ dtb-$(CONFIG_ARCH_QCOM)	+= msm8916-wingtech-wt88047.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= msm8916-yiming-uz801v3.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= msm8917-xiaomi-riva.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= msm8917-xiaomi-rolex.dtb
> +dtb-$(CONFIG_ARCH_QCOM)	+= msm8917-xiaomi-tiare.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= msm8929-wingtech-wt82918hd.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= msm8937-xiaomi-land.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= msm8939-asus-z00t.dtb
> diff --git a/arch/arm64/boot/dts/qcom/msm8917-xiaomi-tiare.dts b/arch/arm64/boot/dts/qcom/msm8917-xiaomi-tiare.dts
> new file mode 100644
> index 000000000000..c3a74530c34c
> --- /dev/null
> +++ b/arch/arm64/boot/dts/qcom/msm8917-xiaomi-tiare.dts
> @@ -0,0 +1,27 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Copyright (c) 2026, Barnabas Czeman
> + */
> +
> +/dts-v1/;
> +
> +#include "msm8917-xiaomi-riva-common.dtsi"
> +
> +/ {
> +	model = "Xiaomi Redmi Go (tiare)";
> +	compatible = "xiaomi,tiare", "qcom,msm8917";
> +
> +	qcom,board-id = <0x1000b 1>;

Could you please double-check this? Riva and Rolex seem to have
properly different values there, but this one mimics one of the
values for Rolex.

FWIW these values are almost never properly fused so I wouldn't be
surprised if this was a fail.

Konrad

