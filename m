Return-Path: <linux-arm-msm+bounces-82431-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 7292FC6D565
	for <lists+linux-arm-msm@lfdr.de>; Wed, 19 Nov 2025 09:13:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 3BCA14F474E
	for <lists+linux-arm-msm@lfdr.de>; Wed, 19 Nov 2025 08:04:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 65FA132D455;
	Wed, 19 Nov 2025 07:59:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mDAoEjFH";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YbsJYjVk"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B513332D451
	for <linux-arm-msm@vger.kernel.org>; Wed, 19 Nov 2025 07:59:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763539153; cv=none; b=WGbvYU8xnPcO9T/y5H2LGgloZFyYF87JNm+v2xTJRiyXhuY2aZe11Zkl0r8rW7h8YZmh6S6CfaTIEKHnUkEkFP8XdMwsrGnvfaEcWwB83U6exX7JWuvln31LOKreAwLQqn3MKE8tTm4X6+l9hkzzeuzPCrCLXRsnU1H5Vi5iOQ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763539153; c=relaxed/simple;
	bh=dV3Q0DRa8tyN+wiG5YRkYxgt/oFeaoSIkYOJmzbNAqg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uHGQxhtW6DX6yuvQbA/oImlTPJeLOrd66+4DoBysauel/5GQGMX8cpWZh5IN4yqOCsCD/o0aLOF0zQaWzqoNQqf8gUVn9JpGd9IdIgZgLtoIuUgtcO8fkHqPE/iqGXd1XczpA4uOdX0NVf9uBfJB4OSJLByQsWUFeEo+OWcID9Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mDAoEjFH; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YbsJYjVk; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AJ12FdY3412656
	for <linux-arm-msm@vger.kernel.org>; Wed, 19 Nov 2025 07:59:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=44+KIwf2R3TeV89cdtUmgfWq
	aMXOew3MykEPItSc6d0=; b=mDAoEjFH3LiqB4Pp0QFiPTYuCZZwE81dG0ua7Ob1
	NJWts0WDIYOVWqJpJfEbBK7PoFnJXtgkr3b5vtD18AuhLowbdzUKfuA8L888/ZIP
	ycGOWRolhhocvJembD/5XDVMMFQl591yptUNorYDY61HYh1wJENS8Nxa3aOnUc5p
	aRzcdIftJ1LgIyS9sQvxtzPL1fj5YinVXdLIRe2xpIy1jqBsTteR8T8JggFq7Orm
	PWhbyVS6y9DP/7IISgiWQy10JzZxTiQZzcCz7TmUGYuo30xO7QDITlqEZqxTEDQO
	v/UWhOzI1mGJDRYLSpon6hSk6KkDqGqspBrX7+W3CPbbFA==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4agv0v2fj1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 19 Nov 2025 07:59:09 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4edad69b4e8so15068571cf.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 18 Nov 2025 23:59:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1763539148; x=1764143948; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=44+KIwf2R3TeV89cdtUmgfWqaMXOew3MykEPItSc6d0=;
        b=YbsJYjVkCVz1wknKit4Dx2YmGxBY2G8PjxKoi71uOD5pOj6bMt5/h1RGhBv7rVVEMC
         6beda5x1rMtFnzTzqSLsesio5mgyWBxx6GGo54q59uIMzRbZm9CMIextZH0QnhJM+rMn
         ISxNZLnu5rFz3dcAt0fCcszmT8zxbtpN/brFFV5KWoT4dvNEzsh2zMCoaMlD/uE4wghz
         nC2sfbSdOV2EZB0z6ypeaVySK05/CzGQiyGFjyZ2344xa/SYpf1lvO+VhYHQKiZPl6zH
         34UI/dW29bMeVuf164N9OGcM2n+ZQOOxAY+7f9GBhZte16oZzNbd9WLfNbv2aSpXEblm
         wKYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763539148; x=1764143948;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=44+KIwf2R3TeV89cdtUmgfWqaMXOew3MykEPItSc6d0=;
        b=bOCdmbsN2wjvSYiL6WvYTCDBKLk4ovCSDXSyLTIVqaD04uatXwPnp+79hBpP2S3q+P
         KPs8aLHTa1zfJzEfVGD/eR4jkEMXbAk6nU42oG+QmVgw7JqmWOUqSNPPAVzarMVNfRo5
         KlOvrlzKfKqk8wKZT58F+bjD87pAQjBMiiDvoKk5QAXnYOLaaC9zSeXRK03LKk490iGZ
         b0JoV4XhnNT5nTURCqO1iC/J7+L70p53fQccsQQ9qi21sGJc+wDwEx7BiZCVpN6Z9MyK
         3FYpZD+sLWtEB1DjUYeqU7bYc6xql32mdk8FPoxFqiT1o3uzLlorebchlYFzp2XcPSSy
         /Agw==
X-Forwarded-Encrypted: i=1; AJvYcCVw6drX21xiSlRtFL4yvThEPpaDbJ7mTcUuSEfMw85BSQ4W70mFqfWHFKxLiA/WUKDkjfg8obaMyzW6PcQK@vger.kernel.org
X-Gm-Message-State: AOJu0YzxEauQ/F8Jv6exXGTHP4sMoLh/b01eXGp2avprwrzyqbviRCwk
	WE0tHMzeFywvGktrn4sLwAgCYODuGF0O4jQtgZZ5ZPvEaKtSqLV3e74m/zQDcWKoyxJqULaTPxn
	TnA9X/Rs3NGKv8MCt53Bb3ieeKb+aEIbBqREV2mz11Fm0a9kpBaUM8DzaYqV3u+N0rq3n
X-Gm-Gg: ASbGncupe2ShE8xTm7AZaP2vWjndCKZCJY3/sMS6msq+CUpM8OGJqFF3Tg80aw4eJVw
	1NTcQvwABr7ojbCWWKJ4MhGvK39PWdf5x30oHX2O5W/QeebrAftexkx26KLnpWRGiUDEn/t5FUy
	OiyfBsgREEK0Ox8NbGQdapzC4SaVarQ8FfF+K0QRWF/ZU5aK+KrruhY2vOquoOc3/oIWe4bikbw
	pb/soA8aReaDLiNenvDNT8S8ymzwfJn3r2FkKY2CXZqU60CsGZpauHIykQRI/zfZNLMYj4maH2y
	5/7KRrm4PLqI/estYAX8la8wBkqiBSmi3UpybDGytLVx6mKDpwgkGDbs+WZuGzP/JMDeMbHq/wb
	o9pP00SCIh1u2d/Ys/zmRWsI+kMJFSp/yOUdbEpj4A25cPPGaISGctu/XejDiC9DitF3Rdffoxt
	O029JywFDNwX7lek7U7HurXvE=
X-Received: by 2002:a05:622a:553:b0:4ee:1ec6:aeda with SMTP id d75a77b69052e-4ee3feaf8e0mr17483671cf.34.1763539148431;
        Tue, 18 Nov 2025 23:59:08 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFQApdlupVqitt5HGqNbjJliqmLaffp2PONvxt3K6V35Eywo4YeyIe4ki3/9Q8VxUTrX7nb9Q==
X-Received: by 2002:a05:622a:553:b0:4ee:1ec6:aeda with SMTP id d75a77b69052e-4ee3feaf8e0mr17483371cf.34.1763539147874;
        Tue, 18 Nov 2025 23:59:07 -0800 (PST)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-595803ac919sm4545176e87.17.2025.11.18.23.59.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Nov 2025 23:59:07 -0800 (PST)
Date: Wed, 19 Nov 2025 09:59:05 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Shuai Zhang <shuai.zhang@oss.qualcomm.com>
Cc: Bartosz Golaszewski <brgl@bgdev.pl>, Marcel Holtmann <marcel@holtmann.org>,
        Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
        linux-arm-msm@vger.kernel.org, linux-bluetooth@vger.kernel.org,
        linux-kernel@vger.kernel.org, cheng.jiang@oss.qualcomm.com,
        quic_chezhou@quicinc.com, wei.deng@oss.qualcomm.com
Subject: Re: [PATCH v3 1/1] Bluetooth: btqca: Add WCN6855 firmware priority
 selection feature
Message-ID: <mtp3qxngbnlpzk2cdp45ndtecab2h56ocwm6cp5ia7butra55a@bevidj6vdwzj>
References: <20251117021645.712753-1-shuai.zhang@oss.qualcomm.com>
 <20251117021645.712753-2-shuai.zhang@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251117021645.712753-2-shuai.zhang@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE5MDA2MCBTYWx0ZWRfX3aVu16J64JVb
 C5/sQabssHo5Gx0zlc4zGr6I23OhqQbOJeum8uC+ZGpY4zm5F3m5YQJ0dGfK/pM6CNphJzT1ws0
 81hJCJtG3vJcsn7qmhAvIwgXK2LIj1zRRlXsHKqP6feuF1yLJXL8SaJTFitDJsvEJBvyaJYk82O
 w1pd3JviaSI3t/K//htCxUQGiiyBTanTAMRJvu0Rmcpy40q4GGT1a6RKxXmLfRmDbB2Y2T9pghX
 3LNpslaxOGdC3WLZ5PzB3MlEeol6pyoxrplPJqOIH17aM+vGp4+z3vpxsbSL47BIOI61wxItdsi
 NvyPE61WeKjLGaR07eoL2YNWNFdFbgeTNELUuvdObyMPUQ2FLi2vYSJwoX1SUxKHGsmqQJ81l/0
 yFTYOgpsLKbvorbCv8BgnHybSgPmPA==
X-Authority-Analysis: v=2.4 cv=S8XUAYsP c=1 sm=1 tr=0 ts=691d78cd cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=61MPlS98zIQgpKPuyUcA:9 a=CjuIK1q_8ugA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-ORIG-GUID: 6dhXu2q4Sv39wR59Hp5Lx6ryzOCrMwUm
X-Proofpoint-GUID: 6dhXu2q4Sv39wR59Hp5Lx6ryzOCrMwUm
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-19_02,2025-11-18_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 adultscore=0 suspectscore=0 bulkscore=0
 lowpriorityscore=0 priorityscore=1501 impostorscore=0 spamscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2511190060

On Mon, Nov 17, 2025 at 10:16:45AM +0800, Shuai Zhang wrote:
> Historically, WCN685x and QCA2066 shared the same firmware files.
> Now, changes are planned for the firmware that will make it incompatible
> with QCA2066, so a new firmware name is required for WCN685x.
> 
> Test Steps:
>  - Boot device
>  - Check the BTFW loading status via dmesg
> 
> Sanity pass and Test Log:
> QCA Downloading qca/wcnhpbftfw21.tlv
> Direct firmware load for qca/wcnhpbftfw21.tlv failed with error -2
> QCA Downloading qca/hpbftfw21.tlv
> 
> Signed-off-by: Shuai Zhang <shuai.zhang@oss.qualcomm.com>
> ---
>  drivers/bluetooth/btqca.c | 22 ++++++++++++++++++++--
>  1 file changed, 20 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/bluetooth/btqca.c b/drivers/bluetooth/btqca.c
> index 7c958d606..8e0004ef7 100644
> --- a/drivers/bluetooth/btqca.c
> +++ b/drivers/bluetooth/btqca.c
> @@ -847,8 +847,12 @@ int qca_uart_setup(struct hci_dev *hdev, uint8_t baudrate,
>  				 "qca/msbtfw%02x.mbn", rom_ver);
>  			break;
>  		case QCA_WCN6855:
> +			/* Due to historical reasons, WCN685x chip has been using firmware
> +			 * without the "wcn" prefix. The mapping between the chip and its
> +			 * corresponding firmware has now been corrected.
> +			 */
>  			snprintf(config.fwname, sizeof(config.fwname),
> -				 "qca/hpbtfw%02x.tlv", rom_ver);
> +				 "qca/wcnhpbtfw%02x.tlv", rom_ver);
>  			break;
>  		case QCA_WCN7850:
>  			snprintf(config.fwname, sizeof(config.fwname),
> @@ -861,6 +865,13 @@ int qca_uart_setup(struct hci_dev *hdev, uint8_t baudrate,
>  	}
>  
>  	err = qca_download_firmware(hdev, &config, soc_type, rom_ver);
> +
> +	if (!rampatch_name && err < 0 && soc_type == QCA_WCN6855) {
> +		snprintf(config.fwname, sizeof(config.fwname),
> +			 "qca/hpbtfw%02x.tlv", rom_ver);
> +		err = qca_download_firmware(hdev, &config, soc_type, rom_ver);
> +	}

Is there a reason for ignoring how it was done already for other cases when
we need a similar fallback? Please extend the existing code (or rewrite
it) instead of adding a similar hook at a completely different place.

> +
>  	if (err < 0) {
>  		bt_dev_err(hdev, "QCA Failed to download patch (%d)", err);
>  		return err;
> @@ -923,7 +934,7 @@ int qca_uart_setup(struct hci_dev *hdev, uint8_t baudrate,
>  		case QCA_WCN6855:
>  			qca_read_fw_board_id(hdev, &boardid);
>  			qca_get_nvm_name_by_board(config.fwname, sizeof(config.fwname),
> -						  "hpnv", soc_type, ver, rom_ver, boardid);
> +						  "wcnhpnv", soc_type, ver, rom_ver, boardid);
>  			break;
>  		case QCA_WCN7850:
>  			qca_get_nvm_name_by_board(config.fwname, sizeof(config.fwname),
> @@ -936,6 +947,13 @@ int qca_uart_setup(struct hci_dev *hdev, uint8_t baudrate,
>  	}
>  
>  	err = qca_download_firmware(hdev, &config, soc_type, rom_ver);
> +
> +	if (!firmware_name && err < 0 && soc_type == QCA_WCN6855) {
> +		qca_get_nvm_name_by_board(config.fwname, sizeof(config.fwname),
> +					  "hpnv", soc_type, ver, rom_ver, boardid);
> +		err = qca_download_firmware(hdev, &config, soc_type, rom_ver);
> +	}
> +
>  	if (err < 0) {
>  		bt_dev_err(hdev, "QCA Failed to download NVM (%d)", err);
>  		return err;
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry

