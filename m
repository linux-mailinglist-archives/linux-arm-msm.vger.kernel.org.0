Return-Path: <linux-arm-msm+bounces-68973-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 21ED8B24883
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 Aug 2025 13:34:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 877AD3AA99D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 Aug 2025 11:32:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8B1272F7442;
	Wed, 13 Aug 2025 11:32:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ifG0z+Y7"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4B602F5467
	for <linux-arm-msm@vger.kernel.org>; Wed, 13 Aug 2025 11:32:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755084748; cv=none; b=i5Xp/K1YLJmNI5SqgQUAZm766OkZww0DsxIjcoZ9vQT+rIMoEt6z+/a3fipiGEE88VExgyuFjtzEmcDG6/3XVnF4tQJWkDNyRFilb9CIGQC8nvpBad7wUlfcyMqy6iF18twQBu/cUZPygjWe/JWpvUjpsLwz6RZtSvU9YNguR24=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755084748; c=relaxed/simple;
	bh=kRpkUjEHh+mveb2bs3Tp9AcZmSD68sinrjNRQO2gQpw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=lkodp1h4lyBp3XG4ZQS9/STMQJKxvv29MJZnd1Z/0SwW2u2SgVqXwpChbFKD2j/riur1j5q4L0Gh8MYXyPP5XPLBmJxBoV19uTl1A6K4c7+Djb4VJm0CXLyuslgwhly26iRRw0Sz6SeLTGmWgn7/v5sg0cHMxa6dLCicJqMUkpw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ifG0z+Y7; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57DBLgQD012543
	for <linux-arm-msm@vger.kernel.org>; Wed, 13 Aug 2025 11:32:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	rjVZidOdjDRebLgVIpzz+zvbQWyC0jDD/g5NDXaHcRc=; b=ifG0z+Y7EQjfHETx
	wMQO6J6Ab6VYi4Yld5QZdL+gwbT9THXSLW0W/rDF8SBy2OYhz2lxxQkgTH3Q1HLv
	ebKs85DMDWV78OrOS0WDdWyfnLG0zSsYJLVv5+nvFGtD7sjJ4SyBqyxqJjQlKNVG
	t32VVDBc4FJbNpJGYU8DDH3RAGmFIB0XjWzYm4OYMgiflSMBXTaa4oRiA5NtOchC
	CYo+099+xrFmDeO2KWHfMxkQ7lAMB7TulNB20a/c+rbJnkp7pqk96ltEU8jc/+Hl
	aWpJcGZPFdsRQEdY4d5zXGkIvNYpPCRdWUAqDrFtfAli2LlV6mSjdQcgJLnLLyx9
	j/veKg==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48eqhx9r2n-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 13 Aug 2025 11:32:25 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4b06ad8dadeso16507291cf.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 13 Aug 2025 04:32:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755084744; x=1755689544;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=rjVZidOdjDRebLgVIpzz+zvbQWyC0jDD/g5NDXaHcRc=;
        b=T+KvvMN+bcBEctkPirNzB7VloiypPi1vR8yIuvhMccbiD4/uGovBTnTyXov2RLU0V8
         pdzWPUGJHOmjl41b1N7zmQTOj5vRrvarIWU4QCtsjH9/LE+STRkDRw9Fv2YPBv19SA22
         7H70ZfRaOA4ye+p3io6JfCnETj+YIf+ZWWS6dC9VW+FCuMakKmK33w6WWazfBPbcdSde
         /+dM/bcd96tgV9EW62DnHU6m/nxQmcXosxNOEMGALSZXS6BxrdSxIU4BTVuwKdxfJGcy
         gfQSWF46HhDhib+YmFiFBiLfjhpu89cCSyTmbLG20i9AlFnGRJKJdh6m27hYa6Aze7fX
         rRag==
X-Forwarded-Encrypted: i=1; AJvYcCVaTMQiQKvVbvSMgmw5OXH5wnShL2+t+N9b5sVLyQKW3aAMG6RDzhLj8MTSLFpEVxiojnHUBbXwVqwKa4z4@vger.kernel.org
X-Gm-Message-State: AOJu0Yyd3hiy8BbJbPim6vUVx2x0//MB9M5dv6WVg/xJq/olyk/iTif3
	QuMfdqz6OF3+fC9iyVycK4OqDnIibTh4vOo8jJ/HHcl2Ssm9QHvGuorCDEsuXDqMzL/RQFfZtmq
	BtYXppXBg7mU8CDYrGbAAqOvkUXBgr+4hw3UHtGux6WrWPCFINrlalaxw9KjF0HmeQelQ
X-Gm-Gg: ASbGncsBuAcuqo2WrEsyMb4mqfizy+uffjOyVLQ0kQbdSgrtiv+b0FZm/s+cFX5NEJv
	0RNGndnk0r7rQ13fTuP+1g5vqHj4U3uiJT9S5e/Ttaw1Aa7uNkZDxnhE0FLLWmFPvpbhy2KsGCJ
	3Dum84+8ZF8lPz8qJrQo+VotvJVJ/DpNQ0oPUSNH7M9T5I9JY5Zj4DKvkfCv5JRXS1a/A6EpWTV
	B4lMqDcKmq+FGyV/pYOinyyqe78SYfKyqAdlvKJo+2gDmwPlHsUuT99On79xxAPAsaDRm9cEXhk
	gVTMZ3/Y+ZI9FnmHMiVlMRwhpyV5JiaQcHwHdpwLJ7RAwgiBNipm7hRZFQRvEYUidpvvWThjEYO
	gHCDBUElONZjICXr1Wg==
X-Received: by 2002:a05:622a:43:b0:4ab:5c58:bb25 with SMTP id d75a77b69052e-4b0fc68ba3amr14426531cf.1.1755084744073;
        Wed, 13 Aug 2025 04:32:24 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEq0Aur4OMFrqMwkB9SaTqBRiff+d+TLLYRjRQr9B/aNZsuDsLG+6/BcDX/aVTr8EKoadGaEw==
X-Received: by 2002:a05:622a:43:b0:4ab:5c58:bb25 with SMTP id d75a77b69052e-4b0fc68ba3amr14426271cf.1.1755084743438;
        Wed, 13 Aug 2025 04:32:23 -0700 (PDT)
Received: from [192.168.43.16] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-af91a0761f2sm2392951866b.11.2025.08.13.04.32.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 13 Aug 2025 04:32:22 -0700 (PDT)
Message-ID: <c48906a9-4de0-453c-a827-5b45d3a6ed0a@oss.qualcomm.com>
Date: Wed, 13 Aug 2025 13:32:21 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] spi: spi-qpic-snand: handle 'use_ecc' parameter of
 qcom_spi_config_cw_read()
To: Gabor Juhos <j4g8y7@gmail.com>, Mark Brown <broonie@kernel.org>
Cc: Md Sadre Alam <quic_mdalam@quicinc.com>,
        Varadarajan Narayanan <quic_varada@quicinc.com>,
        Sricharan Ramabadhran <quic_srichara@quicinc.com>,
        linux-spi@vger.kernel.org, linux-mtd@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250808-qpic-snand-handle-use_ecc-v1-1-67289fbb5e2f@gmail.com>
 <3e790d99-5c6c-4148-85f5-0023a621afeb@oss.qualcomm.com>
 <e5b981f8-9b6b-42c6-b432-537d23f7fd58@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <e5b981f8-9b6b-42c6-b432-537d23f7fd58@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODEwMDA1NyBTYWx0ZWRfXzIv2xAnOs0Od
 VVt1Fs67qJZkNMStZLjEtLCwGLnOu8wt+yyvHjTjqVXo4eAf6g1xmTjZvROs6jDY0dYBu5uZsFs
 ACZrVzaKFP09c5SbaLbuiypZl4Zd8gQqDBrdc5nv+neyh8D0cq906mMuv+MlptAF1Z24EK6VVvZ
 Xbjl99aA0YROdziOZoLzxjr42eZqA91T/9fV8z4MJicNFyjRJDYrK0u4OMfspCb2c9h9uifHvo3
 5OJbvDvVlyAaafzZogD3sTt1/OhkC4IcW9gEFkLzZpjbd7lAGjNwGC+M60RF96qULd1BPODpm+E
 SaFWgTAs/roAvw0EnzN+zb6wU3nng0cnD7yuDgboIzh1euLqZMxPzuWlU/dfZoBipOrWzCyaGEg
 ntiLIk9G
X-Proofpoint-GUID: xKjkwFO9b0BZi3v3t9MUqNl96xe7UzTm
X-Authority-Analysis: v=2.4 cv=aYNhnQot c=1 sm=1 tr=0 ts=689c77c9 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8
 a=LMlhJLrcAiEsyVNmZoIA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-ORIG-GUID: xKjkwFO9b0BZi3v3t9MUqNl96xe7UzTm
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-13_01,2025-08-11_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 priorityscore=1501 suspectscore=0 phishscore=0
 impostorscore=0 bulkscore=0 malwarescore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508100057

On 8/12/25 1:06 PM, Gabor Juhos wrote:
> 2025. 08. 12. 11:55 keltezéssel, Konrad Dybcio írta:
>> On 8/8/25 7:15 PM, Gabor Juhos wrote:
>>> During raw read, neither the status of the ECC correction nor the erased
>>> state of the codeword gets checked by the qcom_spi_read_cw_raw() function,
>>> so in case of raw access reading the corresponding registers via DMA is
>>> superfluous.
>>>
>>> Extend the qcom_spi_config_cw_read() function to evaluate the existing
>>> (but actually unused) 'use_ecc' parameter, and configure reading only
>>> the flash status register when ECC is not used.
>>>
>>> With the change, the code gets in line with the corresponding part of
>>> the config_nand_cw_read() function in the qcom_nandc driver.
>>>
>>> Signed-off-by: Gabor Juhos <j4g8y7@gmail.com>
>>> ---
>>>  drivers/spi/spi-qpic-snand.c | 11 ++++++++---
>>>  1 file changed, 8 insertions(+), 3 deletions(-)
>>>
>>> diff --git a/drivers/spi/spi-qpic-snand.c b/drivers/spi/spi-qpic-snand.c
>>> index 7b76d2c82a5287df13ee6fcebc4abbe58ca861ee..119003c4784890458a41c67fa8bc17d721030b0d 100644
>>> --- a/drivers/spi/spi-qpic-snand.c
>>> +++ b/drivers/spi/spi-qpic-snand.c
>>> @@ -494,9 +494,14 @@ qcom_spi_config_cw_read(struct qcom_nand_controller *snandc, bool use_ecc, int c
>>>  	qcom_write_reg_dma(snandc, &snandc->regs->cmd, NAND_FLASH_CMD, 1, NAND_BAM_NEXT_SGL);
>>>  	qcom_write_reg_dma(snandc, &snandc->regs->exec, NAND_EXEC_CMD, 1, NAND_BAM_NEXT_SGL);
>>>  
>>> -	qcom_read_reg_dma(snandc, NAND_FLASH_STATUS, 2, 0);
>>> -	qcom_read_reg_dma(snandc, NAND_ERASED_CW_DETECT_STATUS, 1,
>>> -			  NAND_BAM_NEXT_SGL);
>>> +	if (use_ecc) {
>>> +		qcom_read_reg_dma(snandc, NAND_FLASH_STATUS, 2, 0);
>>
>> Why are we reading 2 registers (the 2 in the func call) here, ...
> 
> Because when ECC is used, we need the status of the ECC correction from the
> NAND_BUFFER_STATUS register which is placed right after the NAND_FLASH_STATUS.
> 
> Here are the relevant definitions from the 'nand-qpic-common.h' header for
> reference:
> 
> #define	NAND_FLASH_STATUS		0x14
> #define	NAND_BUFFER_STATUS		0x18
> 
> So the two registers can be read with a single DMA operation.
> 
>> ... but 1 everywhere else?
> 
> When ECC is not used, we only need the value from the NAND_FLASH_STATUS
> register, so we don't have to read two registers.

OK yeah I can see that

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad


