Return-Path: <linux-arm-msm+bounces-82319-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 38ACEC69A79
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Nov 2025 14:45:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id D5754347EA3
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Nov 2025 13:45:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1545B35581F;
	Tue, 18 Nov 2025 13:45:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WZKjXymQ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NTOe76Bk"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38662353889
	for <linux-arm-msm@vger.kernel.org>; Tue, 18 Nov 2025 13:45:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763473508; cv=none; b=ZG3DOvpWvJJUtj8rg+83eJv35lWUI6VH0F+0TecX6DrIhQqNzvFF9L+3GPS/sxCM03BJOxcLR9XrA4Rod9d5qaxqM11wbvil01wCKzzc3FIl+8DnjKyqxPKQhM1QC/RbGGBcgDVr9rb/FAVdi5tHFK6mEeYm5onk/BIjiNNFxP4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763473508; c=relaxed/simple;
	bh=aClZuHcSb9Uhnv2j+qNn5O+e/8TzQ6va/JR7DCbHMQA=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=NrPkWYBxZLlaIdWzD0RrWUl6lRuodqKEnKotEWAHAspDmARqvBrL16841sJuCCLwOMBqk8kVxoanSBjYD5FULIkpFQ/W6QCojgNzLuGL7gRKxv/a+YXlClQJ9miO5x15ZTv6bWh8KH+5G4rGDA+vpjgIqzfkQLhZ+S6wTWxU7Pk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WZKjXymQ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NTOe76Bk; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AI6SxBO386625
	for <linux-arm-msm@vger.kernel.org>; Tue, 18 Nov 2025 13:45:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	03mXH2egLzCuH4ma2sa+Fb+8aa+ix6ARFLQH5PW+zhw=; b=WZKjXymQpK2hrkE1
	W9FgV6Rfv2AJsNd8h0TmkNeeSeLPbeBJkCiLvyX5CN0Q2Ph1rUOque+/ElSFysdR
	X5CmxFqnwCLjkvaMZaET3rjkWx1c+0bPFU37Jk3T/pMivPEcaCaKTaXYN2BPz7aU
	eYd/fzbt6UGlRJAW618FZ2dj13C322PUfmQzEvG46p0Oiy+I34kge0/sHCA7uAeB
	+IzorHNAaJXR2pPHHwRMfA2B/yrtikAZ+VCx0CxdufYdazKW0Y6dLQBRSeZ8PZpc
	9nCgJJuHNops+PmOaQh2IzdFe/IKK1V8OAUqZf3omiTPuvEhzt9HQVM5CtPoPCiT
	2a5C1Q==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4agag8jma9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 18 Nov 2025 13:45:05 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-3438744f12fso16683255a91.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 18 Nov 2025 05:45:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1763473505; x=1764078305; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=03mXH2egLzCuH4ma2sa+Fb+8aa+ix6ARFLQH5PW+zhw=;
        b=NTOe76BkATuxw1wcupHIJEAJVnnM6li++WV18eBy3qorOcmbtuvDh9VYlYOqZ8zg2c
         HvgM9XbjR+dfdQf9MkhAgDPMxTeXHAb4jlRyWOHwI93qez7Eol7f6JL0EsHqpE535lN3
         3gMXYXgZ1Tdm+E5Re2LQVY2vzFrDXIxN2UYD7M+OJmz2VCK9TMqy51KG8fYNUBVPAtXU
         KZNyNDBLMas8UrE/W1bYRfpiw8KETA/exYIlsHMGGzpwLP3INmCtb0AwNh0S/TpOS563
         YXvJ1e/ZHckP0DkNlHdPTXAFSDzUxJxDdQ7ULOGAybv+ZtlJlG5/iAawD1Jm61bME3Si
         ZBAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763473505; x=1764078305;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=03mXH2egLzCuH4ma2sa+Fb+8aa+ix6ARFLQH5PW+zhw=;
        b=WfZeMCnnUk5PPkIQYMMF3IHojT+74m2WMSCz1o6uWJiwGYuUGG7QA/iID2pwqhRiXQ
         /42Ik2DQfCN38Fl12m3aezmC4gxPEpi1/m/Ff+hejaioCfnCrmvyAfRZ1Zcbls0mMZjy
         v+SJdt+pHwCMoGckpZUza/mPZA+8+p7SggBCEOYghfTZm9u82Y3pAdntC35qmBKE8Sy/
         RU+c/K28Fcpct0u1ZSAB+2ThwSSXozEXln+/akqV5wjRp/EoIVcUaLHErL7VhlSHLNjK
         AP973eXdsJBsDsAiVq8fc0C8Hc5h0Q2isBHaRdIvp4SdZMgaRV1TnAaymDU1k6Q2esSI
         cFcA==
X-Gm-Message-State: AOJu0Yxkawcny/iSXOPemLvChE8w3BqrZXIju/cbOlxXXfTjunDrSx+F
	z667Jp3bEdEw+aUJ5+57N/jp/AcddqgLsqB19JsuqPVt1QxMxMwVDwbdw0tTyhXUloM3a6kz+rW
	oaOtogdFsPmtNYIenPEl3zb9/GqOxsMPuCc4K+FI3weAR9mHvCPwe9l7LVRO+TtiB9iAkqF2UC1
	PA4VlD/Q==
X-Gm-Gg: ASbGnctlhJVEWWQ95zoojQF1w86AIwkeg/Gwmhu2N7VuYJHRfAspnBGsNLSIme4OSbS
	FjYYi5zwQaFnhVhMprOV5VbEUxKdyp9qPWmRSWIH4H0AQsQNlUulzuTOk7b/IJzvFNW6ODdXwsQ
	gum4PiV/hYE00R/xlCbf5ChFHn9dd38gaQlx6QV4SZATEV8KKa0F4YtTx4R1BaSbDkxis/Q1jMh
	iHT3FqVY4aJqq665R1d3DxVfd5dqgkDySY/+N+Q7mWsXnYEJt4ArosT65zz+wrJp39rK6wTZY7l
	USUXdR+iOWIJeQPXeiApC1C/WOExSSbQmDIUtMrQbGQYWPpzP9tzu79BhHixt1txNmz8UqjrLDq
	970WLioNHxh3J/+qJhvbrm0F56JuAPz3qATkJLlfR5MjgE7CLtjeF2GttS/d7Rgj94w==
X-Received: by 2002:a17:90b:1dc9:b0:330:84c8:92d0 with SMTP id 98e67ed59e1d1-343fa52bd92mr18759454a91.24.1763473504782;
        Tue, 18 Nov 2025 05:45:04 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHqJn4PqsJV/rc1vAoylUumkDkSJ61qLBRTKe/MRB06FrArotHhlndxnoK/QPxamBdfEmWSrA==
X-Received: by 2002:a17:90b:1dc9:b0:330:84c8:92d0 with SMTP id 98e67ed59e1d1-343fa52bd92mr18759427a91.24.1763473504295;
        Tue, 18 Nov 2025 05:45:04 -0800 (PST)
Received: from [10.110.92.187] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3456513d0b4sm13133199a91.5.2025.11.18.05.45.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 18 Nov 2025 05:45:03 -0800 (PST)
Message-ID: <76edfe9c-1302-4e63-8bcd-ee7dd55a128d@oss.qualcomm.com>
Date: Tue, 18 Nov 2025 21:44:57 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Shuai Zhang <shuai.zhang@oss.qualcomm.com>
Subject: Re: [PATCH v3 1/1] Bluetooth: btqca: Add WCN6855 firmware priority
 selection feature
To: Bartosz Golaszewski <brgl@bgdev.pl>,
        Marcel Holtmann
 <marcel@holtmann.org>,
        Luiz Augusto von Dentz <luiz.dentz@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, linux-bluetooth@vger.kernel.org,
        linux-kernel@vger.kernel.org, cheng.jiang@oss.qualcomm.com,
        quic_chezhou@quicinc.com, wei.deng@oss.qualcomm.com
References: <20251117021645.712753-1-shuai.zhang@oss.qualcomm.com>
 <20251117021645.712753-2-shuai.zhang@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20251117021645.712753-2-shuai.zhang@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: gmxMFhc3d4Sp8yYgEGJBEciMfSw7qiPs
X-Proofpoint-ORIG-GUID: gmxMFhc3d4Sp8yYgEGJBEciMfSw7qiPs
X-Authority-Analysis: v=2.4 cv=G6sR0tk5 c=1 sm=1 tr=0 ts=691c7861 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=UPmepWTotxaAIdI3lfQA:9
 a=QEXdDO2ut3YA:10 a=mQ_c8vxmzFEMiUWkPHU9:22 a=HhbK4dLum7pmb74im6QT:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE4MDExMCBTYWx0ZWRfXzKlxEpxpRQf0
 /JylX2TQ4IRDwIwvcXnF3FtCTu/M7jw94soXWjq4LZCapzy3eqAH1vhkMrVyIpzP16ST1L91B1q
 JPli6A/nWuKAtqjsKF0JOD7pl7ZiggVQDiclr8PPXBA7UAwLSXClqaQnk+bATwk/VSXI7SQfb/z
 pTxuyVuxfsp+Qsg/8/dgWPpMgs6SLViobh+r0aGsSYdItqD26l0/ZtcLJI3ELNhWgDsC+0XiK1J
 3INoQwdEOpxdD+cxfBDhsnIt2dsJc9auYfj4ocgS77HhpRLrDH7v5z0tFsA5OIcKZovvFOom5Xf
 O2tOUoBt9HpEu9cX0yU+zSaJaBKOAOdTE3VJyESFdCwIty1eX891eK0/gxUkTDc/DiSnJSPzYqc
 jw80ooIY6M9/+qIfjwghEYJ/ax3D4A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-17_04,2025-11-18_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 impostorscore=0 lowpriorityscore=0
 clxscore=1015 bulkscore=0 malwarescore=0 adultscore=0 spamscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2511180110

Dear

On 11/17/2025 10:16 AM, Shuai Zhang wrote:
> Historically, WCN685x and QCA2066 shared the same firmware files.
> Now, changes are planned for the firmware that will make it incompatible
> with QCA2066, so a new firmware name is required for WCN685x.
>
> Test Steps:
>   - Boot device
>   - Check the BTFW loading status via dmesg
>
> Sanity pass and Test Log:
> QCA Downloading qca/wcnhpbftfw21.tlv
> Direct firmware load for qca/wcnhpbftfw21.tlv failed with error -2
> QCA Downloading qca/hpbftfw21.tlv
>
> Signed-off-by: Shuai Zhang <shuai.zhang@oss.qualcomm.com>
> ---
>   drivers/bluetooth/btqca.c | 22 ++++++++++++++++++++--
>   1 file changed, 20 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/bluetooth/btqca.c b/drivers/bluetooth/btqca.c
> index 7c958d606..8e0004ef7 100644
> --- a/drivers/bluetooth/btqca.c
> +++ b/drivers/bluetooth/btqca.c
> @@ -847,8 +847,12 @@ int qca_uart_setup(struct hci_dev *hdev, uint8_t baudrate,
>   				 "qca/msbtfw%02x.mbn", rom_ver);
>   			break;
>   		case QCA_WCN6855:
> +			/* Due to historical reasons, WCN685x chip has been using firmware
> +			 * without the "wcn" prefix. The mapping between the chip and its
> +			 * corresponding firmware has now been corrected.
> +			 */
>   			snprintf(config.fwname, sizeof(config.fwname),
> -				 "qca/hpbtfw%02x.tlv", rom_ver);
> +				 "qca/wcnhpbtfw%02x.tlv", rom_ver);
>   			break;
>   		case QCA_WCN7850:
>   			snprintf(config.fwname, sizeof(config.fwname),
> @@ -861,6 +865,13 @@ int qca_uart_setup(struct hci_dev *hdev, uint8_t baudrate,
>   	}
>   
>   	err = qca_download_firmware(hdev, &config, soc_type, rom_ver);
> +
> +	if (!rampatch_name && err < 0 && soc_type == QCA_WCN6855) {
> +		snprintf(config.fwname, sizeof(config.fwname),
> +			 "qca/hpbtfw%02x.tlv", rom_ver);
> +		err = qca_download_firmware(hdev, &config, soc_type, rom_ver);
> +	}
> +
>   	if (err < 0) {
>   		bt_dev_err(hdev, "QCA Failed to download patch (%d)", err);
>   		return err;
> @@ -923,7 +934,7 @@ int qca_uart_setup(struct hci_dev *hdev, uint8_t baudrate,
>   		case QCA_WCN6855:
>   			qca_read_fw_board_id(hdev, &boardid);
>   			qca_get_nvm_name_by_board(config.fwname, sizeof(config.fwname),
> -						  "hpnv", soc_type, ver, rom_ver, boardid);
> +						  "wcnhpnv", soc_type, ver, rom_ver, boardid);
>   			break;
>   		case QCA_WCN7850:
>   			qca_get_nvm_name_by_board(config.fwname, sizeof(config.fwname),
> @@ -936,6 +947,13 @@ int qca_uart_setup(struct hci_dev *hdev, uint8_t baudrate,
>   	}
>   
>   	err = qca_download_firmware(hdev, &config, soc_type, rom_ver);
> +
> +	if (!firmware_name && err < 0 && soc_type == QCA_WCN6855) {
> +		qca_get_nvm_name_by_board(config.fwname, sizeof(config.fwname),
> +					  "hpnv", soc_type, ver, rom_ver, boardid);
> +		err = qca_download_firmware(hdev, &config, soc_type, rom_ver);
> +	}
> +
>   	if (err < 0) {
>   		bt_dev_err(hdev, "QCA Failed to download NVM (%d)", err);
>   		return err;

Could you confirm if it has already been accepted?


Kindly,regard

Shuai



