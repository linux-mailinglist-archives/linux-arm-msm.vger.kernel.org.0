Return-Path: <linux-arm-msm+bounces-83954-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 10E0DC97320
	for <lists+linux-arm-msm@lfdr.de>; Mon, 01 Dec 2025 13:18:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 7363B4E1600
	for <lists+linux-arm-msm@lfdr.de>; Mon,  1 Dec 2025 12:18:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6C0E930B522;
	Mon,  1 Dec 2025 12:18:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="HfgBPhBC";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="eYL0WXfo"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE7E02DA76C
	for <linux-arm-msm@vger.kernel.org>; Mon,  1 Dec 2025 12:18:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764591504; cv=none; b=q+9DlYYq/NHEIu7ptVFL/wZjnK+egDOMNW6QWh5CuFnH05a2Gravp/z4W1Nnl8GwQgtBCznMCdks21APdmPMsk4xV+wGADZOov8aJc3LXo1iQfWSS5dGieUFWY6cPLwOlKCjTirZ9J9O1HwRji04R0MyGyxRl5BrtJuPZm8BkII=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764591504; c=relaxed/simple;
	bh=AAYaNa4GQ8Ez3/aLfbHSgfhXobH7Rm4Rp7YXEtlVYUY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qhlRdZaaTceBFPWoUX+iF8Y7mrxI+XDgYMKOe4itn2U71OOioiRMle5Br93mu20pxixuCQSZGvPTCvJOoPIfH8+Q8ANprXLzQQmTMwQo/p2b3ujJAN8eOyciDVhIz52syL3bh9klwz2oJBDQj8OADsUZ1qb0hKRp2Oti7f9sg4k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HfgBPhBC; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=eYL0WXfo; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5B1AxRRF349136
	for <linux-arm-msm@vger.kernel.org>; Mon, 1 Dec 2025 12:18:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	S7x/5lDJpG9MLNGER0uMlUs9xddlh9rKN8rkCt8nLcU=; b=HfgBPhBCXNALgN5S
	LYVVrg3Q0krv4BCSbaviNJodIg6xNfQHXUCrSbT1t9dIzem5uK9UDw2399Oche+g
	2tWUrI7cIZkP7D2x9bpY/6ar8wGTXiSkN0bDdDn/VYu4pFOoCj04ftoJsq0/HK8w
	CsUDy6Qpe1NE09nTxhjSn/SEW+noIAaJshmecVwipW3gAWj92awSGb+701hS8Y/s
	mNwF4G1H/tZ0sbPnb14Qf1CyrOxJ582ZHSsAegv7lDCFhOj2nD9iKCrMUzOHy1Ar
	CIsFBL9w8KfhOkol39ytotuF0Zbr+kCltbk3+OgEleQdd4w9p3NQle65+PgqbBL3
	ywnCmw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4as9re06h4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 01 Dec 2025 12:18:20 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8b1d8f56e24so978264785a.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 01 Dec 2025 04:18:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764591500; x=1765196300; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=S7x/5lDJpG9MLNGER0uMlUs9xddlh9rKN8rkCt8nLcU=;
        b=eYL0WXfowwb8P9ZVsQkFC++ujluiIhPP+qf72GmT3Uqmn5JLKKzXE30s12ZIVnWnrt
         vO+3aK8wenalFoBLymMNNJhY/XfzksgXJ33oYtwEUBN3oSRTpg2OYseRNQ47P7+jc5+W
         ZNCCyEU6eew/5McENHKxjJ4WWWt2T2xZlHaf7m9KS9EhlJGk+J/GlBfnYVmgST+IAsMj
         BGbX2vl7Di/ImlhCoPySaeVS6lxP0NFr8XhX0VCESob9yIPvekNBk/QAHt/5TaLpXNjj
         ocRbl0QUSGUkY4mnh4jy7zH2zU+r3MmxGpWzfUbkfZdx5zHMcyAfLSmJHEU5LL5ngbXq
         xhag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764591500; x=1765196300;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=S7x/5lDJpG9MLNGER0uMlUs9xddlh9rKN8rkCt8nLcU=;
        b=Oic912X3vONVCoWMG4EdXvUdPVzU354ZUoQuOmB1V5m9pHSTZUZBui8HFvMO/C1gvs
         kYm0IKmz4fEIqof+IC6ijBdYNEPNerX/CYWV5xsaeXryL+acQ2agxvvPeiAR+rP9O80K
         iFCBTHuUQH3EdV6/azHEr/lBrW0XeNDyme3f7I4C8x5M0+J7NVTbb7bmhWtpblT4+0oF
         FSn4hnTMze2i//P7QAkVz25qpQYw1iupnEuVY57/oiu0H7dFlAhFMQ7RFK5Qc1o6uu4H
         A76KUD/3Vr1dn/VRjNunXN5q8NeRyw0cN4kWBQkwHr835XtVimtE5qDc5OB3gq+2ugsH
         hLEw==
X-Forwarded-Encrypted: i=1; AJvYcCX0ZoCSqZarsgThz4/0d53t4N7PKl0AzPpRdJlNww4x8s8B1SwN8JleFP5YxQMgUcQET9rGH8k3YQzqAyRO@vger.kernel.org
X-Gm-Message-State: AOJu0Yxmy8fEuT/sZR12pLhxYKoIMkVSHG0zQ4JzlS1/M3xfTEEJx3PA
	8KLqnJlbVAVXvS76owrrzCwkd1XVAsaW8I1lQY8NoTkbh1yvQnIsd5x+ejheJc5ky3rTs0W2OwF
	pRzK3ub+tLLmis8SP+ry8Nj6kezNQVhVYeAjc6DQh0txAj6/Z6QSmBMTENSOBw8taNRBL
X-Gm-Gg: ASbGncsuYSEEybXPwRZq2Y+3alRqHybnZAVwhctIFpJpXOaKrWqtmAaYhzEy5OuqxOL
	WRzrkNP8Vd6sMc4dkv0Nee59ec5IF5WZcUtchvatQBV+O24SGQxb9Lz03el5kIY3ohEeZohI5F1
	pvBzbGcAH9tb9sgV2JMsb0Z0K6U7YVDdc8HqrkB9aBBZRQzyZP9CRSijKnpfTEOq6Ykb78VMSVv
	K5oMcjL2WmSmicE4wC1KEDFLWeBeGeMebP/Nyl4efTp7Dx0O3S4SuhcmCoGBMEzRjV2D+BpQ5xt
	5Msl7j67lkQd6Gp6R25wqUABLE+yrxjwxrwxaPoh0WbP+wBHd1B7y7UMizrN6o5DPLuQQzyvMTU
	wHQinnJT5/UgzuCUUwBpZ9b0fA+RSbvjrwKJD
X-Received: by 2002:a05:620a:4629:b0:8b2:e533:66f7 with SMTP id af79cd13be357-8b4ebd567ccmr3486883085a.10.1764591500188;
        Mon, 01 Dec 2025 04:18:20 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHR4G7h21uepjoqGj+HTnF9EXrnBkONdATlsyVgmaOwHgYnZY5PX5j8yfp1NqPWxk8IfOgLMQ==
X-Received: by 2002:a05:620a:4629:b0:8b2:e533:66f7 with SMTP id af79cd13be357-8b4ebd567ccmr3486877185a.10.1764591499741;
        Mon, 01 Dec 2025 04:18:19 -0800 (PST)
Received: from [192.168.68.121] ([5.133.47.210])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-42e1c5d6133sm27682614f8f.16.2025.12.01.04.18.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 01 Dec 2025 04:18:19 -0800 (PST)
Message-ID: <88b63ab9-85bc-4af1-a802-e2e2f332254f@oss.qualcomm.com>
Date: Mon, 1 Dec 2025 12:18:18 +0000
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/3] ASoC: codecs: wcd93xx: fix OF node leaks on probe
 failure
To: Johan Hovold <johan@kernel.org>, Srinivas Kandagatla <srini@kernel.org>,
        Mark Brown <broonie@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>, linux-sound@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20251201093419.24474-1-johan@kernel.org>
Content-Language: en-US
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
In-Reply-To: <20251201093419.24474-1-johan@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjAxMDEwMCBTYWx0ZWRfX4anySw75P4Nj
 KPlVUtuboHucFNZm3pkGSLBjnj9TT4ziztCrlhkGpX6CHaPoppIp7oR4+uOWXGfAD7Oxe+49DoI
 zgM94XSWEt7Sx0ExttcsbuXK0iwJCtMUs/AZtnZY03j++DQxk5Cpm6sBre6vcGXRbnkFsC52U62
 tybR0lN32eFa+FPcas2aX8/fVpzNKkutz6mqUwk5jGtETgcHCfQiZkiNJWrYuv1/ZRWIwGIJx6v
 6UFgTHXrbKKnK1vEfZ83/aOoqr5TGshQEHl1P1tzUXJE1n3Msp1xhv5xaYFrVoy6x/OqoYJdqmw
 lmg+04+ob5bYTqtTDsmtByKezsRiDhxard/euycnUHPLlhITleWxy5ZImESvnFQ1S/2f8i3GTY8
 bOffOz2TIua6m/3halnlHYCtYYpPmQ==
X-Authority-Analysis: v=2.4 cv=MNptWcZl c=1 sm=1 tr=0 ts=692d878c cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=MVHWC56zHThdgQPXUUYA:9
 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: ez9ns1NJKgEqQsxmzpyrxgZ-E0hP944h
X-Proofpoint-GUID: ez9ns1NJKgEqQsxmzpyrxgZ-E0hP944h
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-28_08,2025-11-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 adultscore=0 impostorscore=0
 priorityscore=1501 phishscore=0 spamscore=0 malwarescore=0 clxscore=1015
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2512010100



On 12/1/25 9:34 AM, Johan Hovold wrote:
> The original wcd938x driver has a couple of OF node reference leaks
> which have been reproduced in the two later added drivers.
> 
> Johan
> 

Thanks for the patches,

Yes, of_parse_phandle() already gets a node refcount, another refcount
is redundant and will leak.

LGTM

Reviewed-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>

--srini>
> Johan Hovold (3):
>   ASoC: codecs: wcd937x: fix OF node leaks on probe failure
>   ASoC: codecs: wcd938x: fix OF node leaks on probe failure
>   ASoC: codecs: wcd939x: fix OF node leaks on probe failure
> 
>  sound/soc/codecs/wcd937x.c | 4 ++--
>  sound/soc/codecs/wcd938x.c | 3 +--
>  sound/soc/codecs/wcd939x.c | 3 +--
>  3 files changed, 4 insertions(+), 6 deletions(-)
> 



