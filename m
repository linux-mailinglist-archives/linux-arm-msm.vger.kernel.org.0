Return-Path: <linux-arm-msm+bounces-35961-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id CD5F89B0DB8
	for <lists+linux-arm-msm@lfdr.de>; Fri, 25 Oct 2024 20:49:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id F0A1D1C218FD
	for <lists+linux-arm-msm@lfdr.de>; Fri, 25 Oct 2024 18:49:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2D47120BB58;
	Fri, 25 Oct 2024 18:49:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ktaqYIdY"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D4FA1DFD8
	for <linux-arm-msm@vger.kernel.org>; Fri, 25 Oct 2024 18:49:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729882145; cv=none; b=QMzOTjwEppe8tMt02wCb9f6yNSetfv9P4Yv6b3rxW7SWVZ0NeOGqH91b1bRg6PLATK+L2kYAfHpBc2AuUsVban3N2c0zl1Tpsiux2GP030RwTx8BvVFfxQuo2F0zgzl7Y7TrwlWeQjVl0aLVLjka5qA8Ty59SOCCzHiK5ZsfdNs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729882145; c=relaxed/simple;
	bh=1e4QZ/PUFOOSBcANS1rgp/gSszfy5I4/YP+hrdVJQlE=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=AbbeD3IrR/YcCRbPynJvpjBqpnS+Us9ZMtvNQWmlqu+Snfo+7kxe/Q8oyLAHF+NOiyapHv0HgOF3bQpVIRiojt+W8VTQH10DIwXvpMGWMOyl0Ebw3N8KqiF7X4occLxyhHZX99vHhZjhrD2Rr+3/wPBUupACDxtWbMmzDP/2e/k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=fail smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ktaqYIdY; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49PAfqvh007551
	for <linux-arm-msm@vger.kernel.org>; Fri, 25 Oct 2024 18:49:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	0dRXIoZRyz7BX4rjRO0hxUatsl7ImMO+PcbNbU30XTc=; b=ktaqYIdYyBz5m34s
	vnbAdS5GqzVKBc4FGLeGuEcalijtkVjkJg+Zv6KvZYffknJUSs3X6atD/ovY/5Ok
	MgSvfiriZpK8gnf6N4lqf9ZwQ96ow/8tSq+27z1u0jB+QhGCuJC07MnFZc7FZa4M
	QfTa2PGixfqJEbfr4KGXfxHnuzU/3MMhMsTxNmeMaZNRe0pKGbV7Lv39FbTb9b8t
	Z4FOcdWSxh2cn+DfuUte8AtLoIjRnqMHwlxkfK0bixmtuEwjnKXe+SzR3AWLt5Nc
	VoHLyPTHAxVnPnyBppVT9Uxz8c8ab0VPjl+M7AkGPBjRU2ZYCBBTF44JdxMOSr5T
	Oxq11w==
Received: from mail-ot1-f69.google.com (mail-ot1-f69.google.com [209.85.210.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42fk52n111-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 25 Oct 2024 18:49:02 +0000 (GMT)
Received: by mail-ot1-f69.google.com with SMTP id 46e09a7af769-718076f51e6so473682a34.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 25 Oct 2024 11:49:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729882141; x=1730486941;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0dRXIoZRyz7BX4rjRO0hxUatsl7ImMO+PcbNbU30XTc=;
        b=rcnpn/r6Vr1W2sLs4Y8CVwvP1fvL5NPimqdV4PdTaE8J7sS/NUl8VR0GrRmLT/FauX
         vepOHYJnL3x+eCXdAYy+aklSYMgjrQo2VcOWhHHNSYf29jxMX7mU5R/wJV0cWUT3NLRg
         yC32imKryJdJVycrjjK/h5+Khhzkhv/LlneaaTFQbMP/u/y0fgbCRt4KGzc3LYz0f/jg
         WsNVhBVRAPFyUx+/fUAEzR4PK0VuTravoAEgeqIXqQlSMIYz4Ip6gZXW1/zqo/gIlJCc
         1dTCCb3u6XPn4vQDTI1gMh6qAMZRptgr7GYa26lPcLozVbYqUNu0iU+pP+WJ4QwJ845/
         qEhQ==
X-Forwarded-Encrypted: i=1; AJvYcCXQDFipXYgRVQ70/VvzJD5Ls6wfh8sY1LJexLM0MHEsSxAl2GuepQcfGonI47zsIDNpFgEsztt2v5KiOjHA@vger.kernel.org
X-Gm-Message-State: AOJu0Yz54J6vUIDd5F67Q9AJ9dNPiMNxZf10emCpnn5SJyiDl5V0ir15
	lQuSBL7TkYWUioLDRLwyr+DbcPXQRvgnxYXNYHHOjSTl4jH1mp6b13nOkXV3hzmgRfWozh3M+5q
	5mHBpBamiMGtMJwvGBS+tBEdIrpZmGWDH2mMh+mHG8DdGvj4JALR7ZEW566A3YnWS
X-Received: by 2002:a05:6830:2b11:b0:718:441b:d4b2 with SMTP id 46e09a7af769-71867e662afmr187873a34.0.1729882141504;
        Fri, 25 Oct 2024 11:49:01 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGBOtJHjP6vBeR6dZ2mAieltA5knGghyYXY97vdIOQ6hJNu7Y4lOvaQ31Y9M0odcsMFI3l5BA==
X-Received: by 2002:a05:6830:2b11:b0:718:441b:d4b2 with SMTP id 46e09a7af769-71867e662afmr187853a34.0.1729882140990;
        Fri, 25 Oct 2024 11:49:00 -0700 (PDT)
Received: from [192.168.212.120] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9b1f0298cfsm97396166b.74.2024.10.25.11.48.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 25 Oct 2024 11:48:59 -0700 (PDT)
Message-ID: <8fb9af47-b675-4fbf-bf66-5a273dd20261@oss.qualcomm.com>
Date: Fri, 25 Oct 2024 20:48:56 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/4] dma: gpi: Add Lock and Unlock TRE support to
 access SE exclusively
To: Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>,
        konrad.dybcio@linaro.org, andersson@kernel.org, andi.shyti@kernel.org,
        linux-arm-msm@vger.kernel.org, dmaengine@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org,
        conor+dt@kernel.org, agross@kernel.org, devicetree@vger.kernel.org,
        vkoul@kernel.org, linux@treblig.org, dan.carpenter@linaro.org,
        Frank.Li@nxp.com, konradybcio@kernel.org, bryan.odonoghue@linaro.org,
        krzk+dt@kernel.org, robh@kernel.org
References: <20240927063108.2773304-1-quic_msavaliy@quicinc.com>
 <20240927063108.2773304-3-quic_msavaliy@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20240927063108.2773304-3-quic_msavaliy@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 8Nbeu0ee41TW7bcQbxvvdmNbiR1Me8gA
X-Proofpoint-ORIG-GUID: 8Nbeu0ee41TW7bcQbxvvdmNbiR1Me8gA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 mlxscore=0
 lowpriorityscore=0 malwarescore=0 impostorscore=0 phishscore=0
 adultscore=0 mlxlogscore=999 priorityscore=1501 spamscore=0 bulkscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2410250144

On 27.09.2024 8:31 AM, Mukesh Kumar Savaliya wrote:
> GSI DMA provides specific TREs namely Lock and Unlock TRE, which
> provides mutual exclusive access to SE from any of the subsystem
> (E.g. Apps, TZ, ADSP etc). Lock prevents other subsystems from
> concurrently performing DMA transfers and avoids disturbance to
> data path. Basically for shared SE usecase, lock the SE for
> particular subsystem, complete the transfer, unlock the SE.
> 
> Apply Lock TRE for the first transfer of shared SE and Apply Unlock
> TRE for the last transfer.
> 
> Also change MAX_TRE macro to 5 from 3 because of the two additional TREs.
> 
> TRE = Transfer Ring Element, refers to the queued descriptor.
> SE = Serial Engine
> SS = Subsystems (Apps processor, TZ, ADSP, Modem)
> 
> Signed-off-by: Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>
> ---
>  drivers/dma/qcom/gpi.c           | 37 +++++++++++++++++++++++++++++++-
>  include/linux/dma/qcom-gpi-dma.h |  6 ++++++
>  2 files changed, 42 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/dma/qcom/gpi.c b/drivers/dma/qcom/gpi.c
> index 52a7c8f2498f..120d91234442 100644
> --- a/drivers/dma/qcom/gpi.c
> +++ b/drivers/dma/qcom/gpi.c
> @@ -2,6 +2,7 @@
>  /*
>   * Copyright (c) 2017-2020, The Linux Foundation. All rights reserved.
>   * Copyright (c) 2020, Linaro Limited
> + * Copyright (c) 2024 Qualcomm Innovation Center, Inc. All rights reserved.
>   */
>  
>  #include <dt-bindings/dma/qcom-gpi.h>
> @@ -65,6 +66,14 @@
>  /* DMA TRE */
>  #define TRE_DMA_LEN		GENMASK(23, 0)
>  
> +/* Lock TRE */
> +#define TRE_I2C_LOCK		BIT(0)
> +#define TRE_MINOR_TYPE		GENMASK(19, 16)
> +#define TRE_MAJOR_TYPE		GENMASK(23, 20)

Is this solely I2C specific?

Konrad

