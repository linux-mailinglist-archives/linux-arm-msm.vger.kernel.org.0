Return-Path: <linux-arm-msm+bounces-79402-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 70304C1973F
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Oct 2025 10:46:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BAB0D560C34
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Oct 2025 09:42:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B135332E15A;
	Wed, 29 Oct 2025 09:41:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="T4aFPGi+";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hbSelOga"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C6653233F5
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Oct 2025 09:41:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761730914; cv=none; b=n5L795iat8MZejTSEU48Fo0wj9pXVKY6gymU+63Ky9d/3WbTe1FIAEVFKzMEqifqjFHDWPPvzLYb8K1HNyq+8FmAB3JRCZB5QieF8AFmEpLILR5k24h/GaH3FqDdY4pSnn+OWrJPg0eNrV2gueI9jSMgA6utCNevZOHi+rKHv18=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761730914; c=relaxed/simple;
	bh=ZOi5+PRldexpSha7keeTtkH0mo4OUbEhwxCztfxGWKE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=iRE9C+6ScflxDCttq26M2cs9OR5+RWuw/Zkhp6Vk3h5bzl2UFYhO5uOAf+14Xu6hBg1ms3DawVmsKJtQdEQdMj4NCiZjFwM4v9yYPtyiJK8XkBlriRox3Vl4jzDNdJDxyIOjI5ct37zR+bLgiVxL/o+KK4tFJhRdQ2eORIkdEm4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=T4aFPGi+; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hbSelOga; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 59T8TTZd4135357
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Oct 2025 09:41:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	QqjyF8y2mKsBJXQTQYPPr2zee4Q5OaRzaCjvfgZqcXM=; b=T4aFPGi+rg6S0BUi
	k6aIQdp7INIz/pj+TNof9mXgULrS1+krgjimZ9BADkHntmwICuFb7+MKbF7Cel/8
	GSqE/8RmTGJFh2Fkjnzrjhje4y+4xx1IKUrxIjxseWhCuxjq15jzN/EbeBxHlVQ7
	jwIzLBuutb09lR+i3OeMfpsn6J5gH+2mnyxzT38i0av0TNSPI8jyfW/+tLAjmAAj
	MGhANOt8XhwWZL1Zdsi1XTD4twYYYkA9e7BzLUBAqiiso8dUEAsz07TNqLAN8tve
	iz7jfCWP3kjtJX56PAo83ITNQ2RjsfbUAjfUPNNzR7QmbaFECDc2D983ioj6CLG5
	5t5feA==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a3ff9r7f4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Oct 2025 09:41:52 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-87c19c8393dso19451416d6.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 29 Oct 2025 02:41:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1761730911; x=1762335711; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=QqjyF8y2mKsBJXQTQYPPr2zee4Q5OaRzaCjvfgZqcXM=;
        b=hbSelOgabU7HzfJrFG3Vf55Q7oxlryl4FfWBngG4gIzLEA2gtf+Ik8JgDLx3h8A7mv
         pm4d3cLwxVwsuanjSyiCdQTkJ44VLIMB8fNbLE7KVMbQsIHWfwgTnukfCR9y4toeBgwn
         Y4RE0YWTdX1Y/dD2G+74ijR3l8Zaftodu199u7wOfCc2yrALxAAqLm84fdRlFfuH+cRF
         9w23MYU4wU3n+HnFQC6YbJ/fhZ8MKSc8puG1QWQTQM1c7OI6AKLN7TgILFtbrxVYnWGX
         U1r6IV94lXpA0+OoqS5ktk0amiM8X6tg4OG5kbgqjSS34rymR0tt55byjt+ugowqnALE
         RuYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761730911; x=1762335711;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=QqjyF8y2mKsBJXQTQYPPr2zee4Q5OaRzaCjvfgZqcXM=;
        b=wEsT7mcudYBae7bZbquVX1gcaBLgRPP9q2HvUznjS28N/XPOtzsk9qxBOtYX+6GzEs
         BQJtByr8ym1EeIbzvjXO4WZDl6TZhNrnZGYqgghzMYV+Ag8mSg+/3+WW+5xRqxoOR9ch
         zhdPeSgG3wG4O//vHKJDWy4UAqOYWc9J/rT6WnG0jwZ9we2gMVxMfQuP1a7qVn0tT5ZP
         O2rt1hc7J1q+rYhaSesmFEB6Cn25D3BQTRfxNtkHAU33rdBjTB19pS8a5X6GdfBWhFzy
         pXRA/fkxGus3fv1fsBwkZeVDg4XUNfSswaTQiSTCruX2u9xMPxBdjwugmV8UNRoT8bsO
         nV0g==
X-Forwarded-Encrypted: i=1; AJvYcCUwj0S3ecGV7pmUpHCBTa3NJaIEqXURojwsjvpDyKox617I+nhHJg5gEPvdAxBosEvge8Gb0oUc9VlVKLTv@vger.kernel.org
X-Gm-Message-State: AOJu0YxvxtrXwt2f2N8z2/jXlqlBevhj10IFj3fHxUozcYqqsFuCmDv3
	lTXJ0DkTXIsjs3ACuFRP90M3g4DpMcYNxmwAgZvBrcXLKYfVp46yHJkNdB7YCBcCftPgNG8xV0d
	CKbc2uL2fmaZyRYv910VWQDPglGJ/eDS9HpKVeC7tMYc45o9q0szAOHs8RAiOVOH96tpD
X-Gm-Gg: ASbGnctPViHbmjbj1Un6wqd/YMhGtNR/ob9f3R0EfrG/Nb82CcHp+f9cXkU8qpBXq71
	gWtWE5P6/cE9Ge9YEcMcB+pmfmIXQ9ej3lNyMi17kcYr1Rds4uKET9CLRacR4qNsikXoQsH6aRK
	qa/JMMgiWTsz8fSfMb2r2ptvtEhPjKkIFj5hatdvg2S/lSoY/u7qjeQ7RXMZKi2O7IBkfxI1NeP
	Wk8hhtgC0WtCI0pApVffzTzvTj+IEF1bUuJySrxSNjaLhAjxBu8zye68nTkA7TN1GxQVnr81BSG
	HmMdzpjdpy+NjW50AgnMY0HWtZAj6VTnPnDYUhAhWRKKLI9U1WDRg6Ljz/x2LVTa8dgfZZtxKAa
	/yo45mfWxK1lqZZrQodqlXFV3JMNhPKicB18j8MnOGNMqajjzBGT9WoTD
X-Received: by 2002:a05:622a:48:b0:4eb:a0f9:628e with SMTP id d75a77b69052e-4ed15c05fddmr18502351cf.8.1761730911158;
        Wed, 29 Oct 2025 02:41:51 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEirvGmsZylTV9U2HOR76rZ/Vmr4UWRyqd+KI4uycauBNB1qqXAgzUpmQy9dJI5ECemHbmBVQ==
X-Received: by 2002:a05:622a:48:b0:4eb:a0f9:628e with SMTP id d75a77b69052e-4ed15c05fddmr18502181cf.8.1761730910742;
        Wed, 29 Oct 2025 02:41:50 -0700 (PDT)
Received: from [192.168.119.202] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b6d85369675sm1376051666b.28.2025.10.29.02.41.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Oct 2025 02:41:50 -0700 (PDT)
Message-ID: <a41e45b2-6e50-4236-a71d-ec3fbaccc2b1@oss.qualcomm.com>
Date: Wed, 29 Oct 2025 10:41:48 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/3] crypto: qce: fix version check
To: Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Thara Gopinath <thara.gopinath@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: aiqun.yu@oss.qualcomm.com, tingwei.zhang@oss.qualcomm.com,
        trilok.soni@oss.qualcomm.com, yijie.yang@oss.qualcomm.com,
        linux-arm-msm@vger.kernel.org, linux-crypto@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Gaurav Kashyap <gaurav.kashyap@oss.qualcomm.com>
References: <20251029-knp-crypto-v2-0-b109a22da4f7@oss.qualcomm.com>
 <20251029-knp-crypto-v2-3-b109a22da4f7@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20251029-knp-crypto-v2-3-b109a22da4f7@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: 2CVqP7W8ZGq_9hWYttpEAM5heKZJCyz-
X-Proofpoint-GUID: 2CVqP7W8ZGq_9hWYttpEAM5heKZJCyz-
X-Authority-Analysis: v=2.4 cv=Cf4FJbrl c=1 sm=1 tr=0 ts=6901e160 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=ostB5tDCqmNsE4DHYKIA:9
 a=QEXdDO2ut3YA:10 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDI5MDA3MiBTYWx0ZWRfX62x8Mb23DnEq
 DXZZtfaFRs5zyoQES78z1T4R/hfxTurWTlgwv8b6+zQVuScmE8dUnnMlUFrdy25+PHD1X16PgT1
 1Jj8/Y0uaOTbKlsIVBvso5/SV8ZoDTdkRP76o8j50fifDjM4Exp8mgb2VUBzhzZzOChKW4t94uR
 yjZpiOeZLkR/IzqoNH/AsGwFFB8ZivSARr8O5TXF56cNqbblZAFnTyQJa6v1bm+GY8XlVr3OMPn
 jVVd5k9H7GjG19Kv1gAuvUOpW3dM2LkQxz5603LtIqJA4ZdxzuowPGcp3XMocC06o2kSiW2irAk
 MapAn45gO5B+FXC/SiMyRavibquN5FW6hKu2PTZGJ5Z98EF5foetK2YgUpCy/q2iY3LucXh09Yv
 JWUczTeIwYUuxJ4h4CwReF/2PKge4Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-29_04,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 suspectscore=0 phishscore=0 malwarescore=0 impostorscore=0
 clxscore=1015 priorityscore=1501 lowpriorityscore=0 spamscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2510290072

On 10/29/25 9:25 AM, Jingyi Wang wrote:
> From: Gaurav Kashyap <gaurav.kashyap@oss.qualcomm.com>
> 
> The previous version check made it difficult to support newer major
> versions (e.g., v6.0) without adding extra checks/macros. Update the
> logic to only reject v5.0 and allow future versions without additional
> changes.
> 
> Signed-off-by: Gaurav Kashyap <gaurav.kashyap@oss.qualcomm.com>
> Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
> ---
>  drivers/crypto/qce/core.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/drivers/crypto/qce/core.c b/drivers/crypto/qce/core.c
> index e95e84486d9a..b966f3365b7d 100644
> --- a/drivers/crypto/qce/core.c
> +++ b/drivers/crypto/qce/core.c
> @@ -21,7 +21,6 @@
>  #include "sha.h"
>  #include "aead.h"
>  
> -#define QCE_MAJOR_VERSION5	0x05
>  #define QCE_QUEUE_LENGTH	1
>  
>  #define QCE_DEFAULT_MEM_BANDWIDTH	393600
> @@ -161,7 +160,7 @@ static int qce_check_version(struct qce_device *qce)
>  	 * the driver does not support v5 with minor 0 because it has special
>  	 * alignment requirements.
>  	 */
> -	if (major != QCE_MAJOR_VERSION5 || minor == 0)
> +	if (major == 5 && minor == 0)
>  		return -ENODEV;

This also allows major < 5, should we add a second check to reject that?

Konrad

