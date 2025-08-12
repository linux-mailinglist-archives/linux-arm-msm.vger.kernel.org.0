Return-Path: <linux-arm-msm+bounces-68728-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 166E1B223C8
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 Aug 2025 11:56:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 71B15168041
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 Aug 2025 09:56:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ABFE02E974D;
	Tue, 12 Aug 2025 09:55:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KUexjIeE"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C02F2D3748
	for <linux-arm-msm@vger.kernel.org>; Tue, 12 Aug 2025 09:55:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754992559; cv=none; b=asOJF8KL46vW/TtdPuBhufMCV3xY7LYwm8pQmTfiodL1Xgu3M0TBbllh43/7fEq7TIYGwYmInGvFuMhvGucYs9vldSPdBsWdiHgQJMy7eelRXvW2tJ3oDv+FB4VxLLwUrko6+VQ+VJVBBcBwn5fpsgx4IULq+iA4aF3gYfo4q9s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754992559; c=relaxed/simple;
	bh=dQYFIBmr1qRbEzprHryh0LnUcSKHlaB+KrZ4fdJoJn4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Msyp0n+F8gLw/OLQluwJjoZTSTtRA+RnDUYl+tVXQZHSBKmth30yuVEhCrFTZJvH+9pAh5mkTIKjldK7euWSYJCzBhKOaMdT75jFyfx2qwVq/KTY5kh8HkmABCn6B/sQNZYs+TldM0/XXm/fKUJckoeh3Zv0Mvz5mrbmaXjl7Fg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KUexjIeE; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57C5XeDv029426
	for <linux-arm-msm@vger.kernel.org>; Tue, 12 Aug 2025 09:55:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	fy5zAaN1Le8gwkS5f3ejrtBssrUSdwA0NqZDJMsJ1vI=; b=KUexjIeE4/ARZQ7n
	sTm74lM/Gn3RugLldjBpvUw/0ZmVxw2LPmp8TmsugDwKlt5t5tvgyvboPd02tNVM
	sxqvgpYxMDx/BGvnIvUEzu8QhD9xahE1IY7zP2Y5ZrAN9w8mAuPBxiQFe/ZTSIw1
	nvOPeTBXTO5Kc2Py5QktGzGLXdgpWGIp95u+wQipuW74qNywSsQE6veRmel3OU5h
	+jUVsovCHqA9Ch3xFyPqdHwkhlyoWmcpTS+KPFoDqS5L7gkuKybYhK7bKFAHV+Ik
	WAopAZJ2Zd8E8pkHC3JwrnXz5HFpSyRic1/IRco55Kmwyn0C2DtcURtX3m+h3VQh
	T44bTw==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48dw9squax-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 12 Aug 2025 09:55:57 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4b06ad8dadeso13522041cf.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 12 Aug 2025 02:55:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754992555; x=1755597355;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=fy5zAaN1Le8gwkS5f3ejrtBssrUSdwA0NqZDJMsJ1vI=;
        b=V9X1agiIin1mO+g9MlIi9HwrKwdcnDu3WA45OykldC4WDA3i57ZkxxTbg/Ractz9U4
         fGU4ImxUm09WQDeSUD5EWFLBOPKC0MRpI4bzbCFE2bPAUxLnoyGaVE0rK3iIUqMOsuBo
         Eqozxt1I+7y4cljmIqtSL0fnop39TczhISQ25+2vpSwixPxzRKe4FWdCRQg82KPmM++Q
         pOTjGsrKua+5F8RHEr6T2wcKeXjXaJ+I4MuL+eTubZuH7KGwtYC7vvT7vq1ZJSA/LATt
         QKrc3w2uR8hYkY2g4od0kqSqAvucszMEIdzVnhw1EkR6d+YpI1DIleBYZ3BB1yuPh1R8
         Ni+A==
X-Forwarded-Encrypted: i=1; AJvYcCWgWkTeA5IIjfl+lS2ZHPbcB9OT8L5jGn5AwtGYDUHBysC56X3CE1dgoZB4ISb8lxHa89Sfyo5aof36jG4P@vger.kernel.org
X-Gm-Message-State: AOJu0YyQbUN+NYJIZLtbeSyQbADFmx1kXW/VKTEjxbaxrcOZROrEp+u6
	xjGPnxVjfPAHfyKSZ/DMi/Ko1qU1v5rM4PyVvoCkc3j3mRWULP7U8bsAWlti0SWrPZ4gd90Y/jR
	GSQjQTddWq0hsL3n9dcYh6LHZJ/OyFUTLd8XAgze4PbwvrCipLRPJNd8cGs8sbeMGyt5m
X-Gm-Gg: ASbGnctzXiD+k1z42DEkv9T7Nldg7vm7S0200GdoG42W8+xuxvxd/ChZ0W7AwsjrEp4
	jS54dMrnP0hLj3vMtJEPfieDK0ke6OSIeZRhqi1/dh6C0ScZ4l3WWk8yQ48EU/AMc0ZgHyb2Rcr
	UZ+Urmc97/cSBFrcToY0HjtA+Pzl1xn8hOY9l5wg2pLdVqKwkcT6IDYcqTw031xszwGDTYH5rOC
	WCMUedntfJDnT7+CjP5RaAmw5MwXmkAA97BbvLypDc8wLRmN6Z8c0HLOIDY6fzrtVFXL3OAjUmM
	pX7bawTR/zSO4uANYtR2LY2jHPREI8XZiI36EDoC39/Zivr7+8vD2uFANSEiE3vfCfpInTR6ENU
	eshsV/3Mi+V2MsA6++Q==
X-Received: by 2002:a05:622a:189f:b0:4b0:8cfa:a507 with SMTP id d75a77b69052e-4b0f4ccd933mr2855721cf.10.1754992555239;
        Tue, 12 Aug 2025 02:55:55 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEReLnphOGEbNWWWfSrjX8K9aTE+4skbxwGcSBRQDYN+gOwpLRpbaZJOvyvPh88HdyWT+9wag==
X-Received: by 2002:a05:622a:189f:b0:4b0:8cfa:a507 with SMTP id d75a77b69052e-4b0f4ccd933mr2855621cf.10.1754992554790;
        Tue, 12 Aug 2025 02:55:54 -0700 (PDT)
Received: from [192.168.43.16] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-af91a0def2esm2146839666b.61.2025.08.12.02.55.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 12 Aug 2025 02:55:54 -0700 (PDT)
Message-ID: <3e790d99-5c6c-4148-85f5-0023a621afeb@oss.qualcomm.com>
Date: Tue, 12 Aug 2025 11:55:52 +0200
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
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250808-qpic-snand-handle-use_ecc-v1-1-67289fbb5e2f@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=J+Wq7BnS c=1 sm=1 tr=0 ts=689b0fad cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=pGLkceISAAAA:8 a=5qz9QPgusZpkEaXBDdAA:9
 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-ORIG-GUID: Hkz9U6ZZlPz8C8J4anYenIrl2LIn3p7R
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA5MDAxNSBTYWx0ZWRfX7Dik69fHz+kK
 2P8g98HMOHP+V3B5lNzutWyqgA1FwkylKY1og4MLqFtPkpOOGjO2wN6Yhkx1TMd6937RL1huXBN
 MrU9v8YF0v9yEFBpFfUdM4kvPUuRN/RmHglqpPcI7issMVQ5nisKUC3MFH7EKIc0CkZUt2Hf8fy
 SkK07vVRI/EeHQ4G3NMYx81rqT6eS0GqIQLcTDCh7XDzXDk15G6oAq7tK4uHDnjJmiylOBVWds4
 Vxbx13DYqmGvu7ppXoO/wVFMoQu+TLYxRnHHdhTIlShzBIJuWBrc38r6XwE+ktQ3memoR38LSl6
 QrwGOHPrQz4c5DiQBxb1yuMcB/YmF7ScsqP8hAJNK4X4I1vIMiu9q92VNTeJ6BvFTsMcLVC6Tov
 aCTSXsJs
X-Proofpoint-GUID: Hkz9U6ZZlPz8C8J4anYenIrl2LIn3p7R
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-12_04,2025-08-11_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 malwarescore=0 impostorscore=0 bulkscore=0
 phishscore=0 suspectscore=0 spamscore=0 clxscore=1015 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508090015

On 8/8/25 7:15 PM, Gabor Juhos wrote:
> During raw read, neither the status of the ECC correction nor the erased
> state of the codeword gets checked by the qcom_spi_read_cw_raw() function,
> so in case of raw access reading the corresponding registers via DMA is
> superfluous.
> 
> Extend the qcom_spi_config_cw_read() function to evaluate the existing
> (but actually unused) 'use_ecc' parameter, and configure reading only
> the flash status register when ECC is not used.
> 
> With the change, the code gets in line with the corresponding part of
> the config_nand_cw_read() function in the qcom_nandc driver.
> 
> Signed-off-by: Gabor Juhos <j4g8y7@gmail.com>
> ---
>  drivers/spi/spi-qpic-snand.c | 11 ++++++++---
>  1 file changed, 8 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/spi/spi-qpic-snand.c b/drivers/spi/spi-qpic-snand.c
> index 7b76d2c82a5287df13ee6fcebc4abbe58ca861ee..119003c4784890458a41c67fa8bc17d721030b0d 100644
> --- a/drivers/spi/spi-qpic-snand.c
> +++ b/drivers/spi/spi-qpic-snand.c
> @@ -494,9 +494,14 @@ qcom_spi_config_cw_read(struct qcom_nand_controller *snandc, bool use_ecc, int c
>  	qcom_write_reg_dma(snandc, &snandc->regs->cmd, NAND_FLASH_CMD, 1, NAND_BAM_NEXT_SGL);
>  	qcom_write_reg_dma(snandc, &snandc->regs->exec, NAND_EXEC_CMD, 1, NAND_BAM_NEXT_SGL);
>  
> -	qcom_read_reg_dma(snandc, NAND_FLASH_STATUS, 2, 0);
> -	qcom_read_reg_dma(snandc, NAND_ERASED_CW_DETECT_STATUS, 1,
> -			  NAND_BAM_NEXT_SGL);
> +	if (use_ecc) {
> +		qcom_read_reg_dma(snandc, NAND_FLASH_STATUS, 2, 0);

Why are we reading 2 registers (the 2 in the func call) here, but 1 everywhere
else?

Konrad

> +		qcom_read_reg_dma(snandc, NAND_ERASED_CW_DETECT_STATUS, 1,
> +				  NAND_BAM_NEXT_SGL);
> +	} else {
> +		qcom_read_reg_dma(snandc, NAND_FLASH_STATUS, 1,
> +				  NAND_BAM_NEXT_SGL);
> +	}
>  }
>  
>  static int qcom_spi_block_erase(struct qcom_nand_controller *snandc)
> 
> ---
> base-commit: 13d0fe84a214658254a7412b2b46ec1507dc51f0
> change-id: 20250805-qpic-snand-handle-use_ecc-de929376d50b
> 
> Best regards,

