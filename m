Return-Path: <linux-arm-msm+bounces-50718-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 454AFA57C9F
	for <lists+linux-arm-msm@lfdr.de>; Sat,  8 Mar 2025 19:06:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6F9BB16D23A
	for <lists+linux-arm-msm@lfdr.de>; Sat,  8 Mar 2025 18:06:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7B85E1E51EC;
	Sat,  8 Mar 2025 18:06:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="T2+J0Nuc"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28B2A1598F4
	for <linux-arm-msm@vger.kernel.org>; Sat,  8 Mar 2025 18:06:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741457174; cv=none; b=A8010pAMSAd+VHmjRB3CCb6b1gqswDyn5i/9Kf/CcUtAAFYgXoOpfxefijUyjn7HG9pJEqafXk0+kKi2yAlhEkFXXujQMaGkgiRSXFffn6L2A9uSc9zIT/gfYPg7jTfKgaHrG1hGbXzy7wHtXFPlN4CI4QhT4oXn/q7HEPNbDxc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741457174; c=relaxed/simple;
	bh=0ccMwBeStGy4Ma7W+jN1i/KRXrV5Or0BGZ7xHh3TqYE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Xcq7V1s2XttVMiNplQYCoj8UN4bienO+9FFjl+icVw4aMR9u8sI7TWL18QgI4y7pmsI49ArxgwqoHT2eIju0RTrBaITwj9oThwqUXxLDNCrs4eQbHQSjB0hfXtvNWPt21fIBOzodxKieFnXTS/DQypRTlt6NPEj6U0z0op4mCVs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=T2+J0Nuc; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5288o16h001384
	for <linux-arm-msm@vger.kernel.org>; Sat, 8 Mar 2025 18:06:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	LK+VWm8KVqF+/ZSN/J31md9ZAvpKwgVVPmIdig4/bew=; b=T2+J0NucwnuITXs/
	hUvBMBivCZF7G7+/gR8KOl2verCrWDMIq4P1BgMlmhcuSqpOKa2lNiXNWRNrBDcJ
	WQwwxAeIotz9H/XTxbVBSfBzxoRX/pdrh/iSkoZKGRD6EYGWVPlczVBfcE6T2SV6
	vx1NasBEgjn7iz/v93EqSbGR9KEgh4af1FGFRsBguIR6g2CHWrppBSAZ81u2PQJU
	gsClnEme3cPErJiAwX57KTSMxzPnNqZ0geVB7XT5gQvUus6WgzPh/c3Rz1dnhv3q
	W+vK75bKQGB3h+DiAxaip/A5Z3oiYxBjX4hTmc/xRVrYuGni/G3Y9g7yxgFhsX1z
	21SZHw==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 458ex0ry51-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 08 Mar 2025 18:06:09 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-6e422f1ceadso5406026d6.0
        for <linux-arm-msm@vger.kernel.org>; Sat, 08 Mar 2025 10:06:09 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741457169; x=1742061969;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=LK+VWm8KVqF+/ZSN/J31md9ZAvpKwgVVPmIdig4/bew=;
        b=Wgk9CAfoawJWHZT3BUWpDwWQR8so0qVpOQ/JkPheUyQHysS4KOJYjLXjEDBHj1ut0u
         89Dk1p59Q8WswzkRyv2+1fEjMFXn+2vPcFhfJnSxrMaGs6XgOViMedcEk12eMCpysA/A
         md5+yZvuUh+81uZyOjTPpr/cKkHAaj18Z8n5i3mvRS69V/oMBKNhf54yZOVNTv3VAN/7
         8r5kX3SxLWSQleTfUyVVmsqLZNcR0x/7e0vG3kDaeQz4dvH5HnWu+kBcvmQmr90UoAKp
         7mj7ykvR/3EMwbJZ3rfJxnjiox++Fo6j+9rXFJX8F8JMkj8pp4ugzJhmEJ1jdDN3i5e6
         MUdw==
X-Forwarded-Encrypted: i=1; AJvYcCUzE8Vcmex/5w/uzDh7n0E3J365BqA0L541TbCa7sdVV56g48FTy7HuN+FIPOR5TFqU+dRXIjcHGm7zLRkE@vger.kernel.org
X-Gm-Message-State: AOJu0Yzq23rqMqU9TI+yE1hZVq6+j5dap5NUbjOk9RA4ElofBrJKaEBe
	p/0eDEa+MFj4KTOOX6kHZwniJfBJrJo5HKbXXmbOBmOQ3NIVU0s9LIXUZDsGRexE1E3FptmpysG
	RIYZBl1WQMamKR+ug6tx5gHZLdbfl9r0z27r0zjfiUA6gdrfUp03URy8bQTX/vHA8
X-Gm-Gg: ASbGncsCbmfMwfVnw2ROk3P38q7il3CZLGuA0rlkJ0352pu0OiYq3nNIbu1+KbDasD4
	qS0J1B/lDApQCdVK5VhNpCEnnP8Z5L/f8cZnZU2cOZfU9HOwBfk5lZidIInCC05XBlc0zD27HtO
	Hh27BeTykYA26/+r68ue6DbX7swAQAUKE+O9qlmP8R/SpfNJEWu5lYSsp0AYOUYbAejyOR6QK4F
	sPIVyM9TpJpBn0tc35Blui1inw+DiIRaPPtaVlNHbKRt/lwnWN5i5W+kMsbuirRU5wCxGUzOtTm
	xMGRLnYSxkA/GC6nHvmo/uNF1leY6l6XPlRlb7xo0x1wSXQegw+3FVi4/oPgsBT3Ni6yiQ==
X-Received: by 2002:a05:6214:501b:b0:6e4:4034:5ae8 with SMTP id 6a1803df08f44-6e908cceab1mr19640386d6.5.1741457169107;
        Sat, 08 Mar 2025 10:06:09 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHMQkvbQh1rjRfG86SAdJJ5ORJCPHMqxLeQ9DLm77nL0J1hbYTt5Bzvldd0S5aoDLn5Aq+8SQ==
X-Received: by 2002:a05:6214:501b:b0:6e4:4034:5ae8 with SMTP id 6a1803df08f44-6e908cceab1mr19640106d6.5.1741457168728;
        Sat, 08 Mar 2025 10:06:08 -0800 (PST)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac2394fd5b8sm464847666b.79.2025.03.08.10.06.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 08 Mar 2025 10:06:08 -0800 (PST)
Message-ID: <58f46660-a17a-4e20-981a-53cad7320e5a@oss.qualcomm.com>
Date: Sat, 8 Mar 2025 19:06:04 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 6/9] soc: qcom: geni-se: Add support to load QUP SE
 Firmware via Linux subsystem
To: Viken Dadhaniya <quic_vdadhani@quicinc.com>, andi.shyti@kernel.org,
        robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        gregkh@linuxfoundation.org, jirislaby@kernel.org, broonie@kernel.or,
        andersson@kernel.org, konradybcio@kernel.org, johan+linaro@kernel.org,
        dianders@chromium.org, agross@kernel.org,
        linux-arm-msm@vger.kernel.org, linux-i2c@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-serial@vger.kernel.org, linux-spi@vger.kernel.org
Cc: quic_msavaliy@quicinc.com, quic_anupkulk@quicinc.com
References: <20250303124349.3474185-1-quic_vdadhani@quicinc.com>
 <20250303124349.3474185-7-quic_vdadhani@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250303124349.3474185-7-quic_vdadhani@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: U0fiSuTVxgGtiI9_BqsA3SSvEVtfC9SS
X-Authority-Analysis: v=2.4 cv=f/qyBPyM c=1 sm=1 tr=0 ts=67cc8711 cx=c_pps a=UgVkIMxJMSkC9lv97toC5g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17 a=IkcTkHD0fZMA:10 a=Vs1iUdzkB0EA:10 a=COk6AnOGAAAA:8 a=Gn0hrFsMAShasAEqVYMA:9 a=QEXdDO2ut3YA:10
 a=1HOtulTD9v-eNWfpl4qZ:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: U0fiSuTVxgGtiI9_BqsA3SSvEVtfC9SS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-08_07,2025-03-07_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 spamscore=0
 bulkscore=0 phishscore=0 lowpriorityscore=0 mlxlogscore=999 clxscore=1015
 priorityscore=1501 malwarescore=0 adultscore=0 suspectscore=0 mlxscore=0
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2502100000
 definitions=main-2503080139

On 3.03.2025 1:43 PM, Viken Dadhaniya wrote:
> Load the firmware to QUP SE based on the 'firmware-name' property specified
> in devicetree. Populate Serial engine and base address details in the probe
> function of the protocol driver and pass to firmware load routine.
> 
> Skip the firmware loading if the firmware is already loaded in Serial
> Engine's firmware memory area.
> 
> Co-developed-by: Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>
> Signed-off-by: Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>
> Signed-off-by: Viken Dadhaniya <quic_vdadhani@quicinc.com>
> ---

[...]

> +static bool elf_phdr_valid(const struct elf32_phdr *phdr)
> +{
> +	if (phdr->p_type != PT_LOAD || !phdr->p_memsz)
> +		return false;
> +
> +	if (MI_PBT_PAGE_MODE_VALUE(phdr->p_flags) == MI_PBT_NON_PAGED_SEGMENT &&
> +	    MI_PBT_SEGMENT_TYPE_VALUE(phdr->p_flags) != MI_PBT_HASH_SEGMENT &&
> +	    MI_PBT_ACCESS_TYPE_VALUE(phdr->p_flags) != MI_PBT_NOTUSED_SEGMENT &&
> +	    MI_PBT_ACCESS_TYPE_VALUE(phdr->p_flags) != MI_PBT_SHARED_SEGMENT)
> +		return true;
> +
> +	return false;

return (contents of the if condition)

> +}
> +
> +/**
> + * valid_seg_size() - Validate the segment size.
> + * @pelfseg: Pointer to the ELF header.
> + * @p_filesz: Pointer to the file size.
> + *
> + * Validate the ELF segment size by comparing the file size.
> + *
> + * Return: true if the segment is valid, false if the segment is invalid.
> + */
> +static bool valid_seg_size(struct elf_se_hdr *pelfseg, Elf32_Word p_filesz)
> +{
> +	if (p_filesz >= pelfseg->fw_offset + pelfseg->fw_size_in_items * sizeof(u32) &&
> +	    p_filesz >= pelfseg->cfg_idx_offset + pelfseg->cfg_size_in_items * sizeof(u8) &&
> +	    p_filesz >= pelfseg->cfg_val_offset + pelfseg->cfg_size_in_items * sizeof(u32))
> +		return true;
> +	return false;
> +}

same here

[...]

> +static int geni_configure_xfer_mode(struct qup_se_rsc *rsc)
> +{
> +	/* Configure SE FIFO, DMA or GSI mode. */
> +	switch (rsc->mode) {
> +	case GENI_GPI_DMA:
> +		setbits32(rsc->se->base + QUPV3_SE_GENI_DMA_MODE_EN,
> +			  GENI_DMA_MODE_EN_GENI_DMA_MODE_EN_BMSK);
> +		writel_relaxed(0x0, rsc->se->base + SE_IRQ_EN);
> +		writel_relaxed(SE_GSI_EVENT_EN_BMSK, rsc->se->base + SE_GSI_EVENT_EN);
> +		break;
> +
> +	case GENI_SE_FIFO:
> +		clrbits32(rsc->se->base + QUPV3_SE_GENI_DMA_MODE_EN,
> +			  GENI_DMA_MODE_EN_GENI_DMA_MODE_EN_BMSK);
> +		writel_relaxed(SE_IRQ_EN_RMSK, rsc->se->base + SE_IRQ_EN);
> +		writel_relaxed(0x0, rsc->se->base + SE_GSI_EVENT_EN);
> +		break;
> +
> +	case GENI_SE_DMA:
> +		setbits32(rsc->se->base + QUPV3_SE_GENI_DMA_MODE_EN,
> +			  GENI_DMA_MODE_EN_GENI_DMA_MODE_EN_BMSK);

This write is common across all 3 modes

> +		writel_relaxed(SE_IRQ_EN_RMSK, rsc->se->base + SE_IRQ_EN);
> +		writel_relaxed(0x0, rsc->se->base + SE_GSI_EVENT_EN);

These two writes are common across !GPI_DMA

> +		break;
> +
> +	default:
> +		dev_err(rsc->se->dev, "invalid se mode: %d\n", rsc->mode);
> +		return -EINVAL;

I wouldn't expect this to ever fail..

> +	}
> +	return 0;
> +}
> +
> +/**
> + * geni_enable_interrupts() Enable interrupts.
> + * @rsc: Pointer to a structure representing SE-related resources.
> + *
> + * Enable the required interrupts during the firmware load process.
> + *
> + * Return: None.
> + */
> +static void geni_enable_interrupts(struct qup_se_rsc *rsc)
> +{
> +	u32 reg_value;
> +
> +	/* Enable required interrupts. */
> +	writel_relaxed(M_COMMON_GENI_M_IRQ_EN, rsc->se->base + GENI_M_IRQ_ENABLE);
> +
> +	reg_value = S_CMD_OVERRUN_EN | S_ILLEGAL_CMD_EN |
> +				S_CMD_CANCEL_EN | S_CMD_ABORT_EN |
> +				S_GP_IRQ_0_EN | S_GP_IRQ_1_EN |
> +				S_GP_IRQ_2_EN | S_GP_IRQ_3_EN |
> +				S_RX_FIFO_WR_ERR_EN | S_RX_FIFO_RD_ERR_EN;

The S-es should be aligned, similarly for other additions in this patch

[...]

> +	/* Flash firmware revision register. */
> +	reg_value = (hdr->serial_protocol << FW_REV_PROTOCOL_SHFT) |
> +		    (hdr->fw_version & 0xFF << FW_REV_VERSION_SHFT);

Use FIELD_PREP and GENMASK to denote bitfields

> +	writel_relaxed(reg_value, rsc->se->base + SE_GENI_FW_REVISION);
> +
> +	reg_value = (hdr->serial_protocol << FW_REV_PROTOCOL_SHFT) |
> +		    (hdr->fw_version & 0xFF << FW_REV_VERSION_SHFT);
> +
> +	writel_relaxed(reg_value, rsc->se->base + SE_S_FW_REVISION);
> +}

Konrad

