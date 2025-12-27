Return-Path: <linux-arm-msm+bounces-86700-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id C1A6ECE030F
	for <lists+linux-arm-msm@lfdr.de>; Sun, 28 Dec 2025 00:34:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6AF7C300F9E0
	for <lists+linux-arm-msm@lfdr.de>; Sat, 27 Dec 2025 23:34:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 022861632C8;
	Sat, 27 Dec 2025 23:34:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NvSW/r6k";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Hy6LrM04"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B11C13790B
	for <linux-arm-msm@vger.kernel.org>; Sat, 27 Dec 2025 23:34:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766878473; cv=none; b=QiAGdxkbL4PWHQQvp9kxx53Uj/8Kk6p2pGzDJ4+yc82LaBdjjk6U3IDmqyNrO7Wrm/cIGYL96X2epPlv+ro1GsWl5x1iqYb5owVurW+KZshrEgM2gl3kQPTv842IwMuzJ31bXwOMWrsjp4apk1rEpFXD9MsuYXbInFatX00NVd8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766878473; c=relaxed/simple;
	bh=QK7X48ClXeMWixPFUaz+6tBo1VfO4ELn3XaVOTID9t4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XdGBfqJhluI7krPFjp/MfuEFUQZQ9TaOOHE23tP8SVw5LYBWmID8hiDTuhSbmHMzowqQgGcu4H0E7xsmcGprR9zGn/Mwoq//83a6kr8dHoXS1U76WEjVc19vt08XZtYtV4zs/ctPc34q+fultYTcs/cNHX4qvxTSR4MoPNtdS1w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NvSW/r6k; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Hy6LrM04; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BRDjnvs572362
	for <linux-arm-msm@vger.kernel.org>; Sat, 27 Dec 2025 23:34:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=tgGRjxRiqIJZJSRl1gc2nIa4
	FvuinSm8dT0o+sSvyuM=; b=NvSW/r6k7y22G3VBAVMG6Kv54xdi92cIM/f/jthT
	vDwRBIavRsZa6G4kJuw/cp2oKsGJjhqN4Ob9kgKAgGU46TF3GL9aNNj2DJNjTgdr
	JN0lpmjKaQRnjyul/iAHMqRkN7B/zK9+gjmIOj2/YvmwUk/Ga7CaHvglBePh7Lim
	mDRDLpO2VPnSCzZwN7YByVpByW4lQiEjKgK343wZ40EwsoRu81WLOcEflUBA6FJD
	F8FFgtVMvoL/bKOe5mKo4X9vBM55JFi3zq0sdNZVuaMtUrDSC+613zwkpWSQskoy
	fK9ist0DlQuo53hpGePYWl4YsOIL6UZTRWGb6GF/DAg0xg==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ba6f61b9c-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 27 Dec 2025 23:34:30 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-88a39993e5fso210745296d6.3
        for <linux-arm-msm@vger.kernel.org>; Sat, 27 Dec 2025 15:34:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766878470; x=1767483270; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=tgGRjxRiqIJZJSRl1gc2nIa4FvuinSm8dT0o+sSvyuM=;
        b=Hy6LrM04soE2L0nGd0QBS9d0yjKr5v0Si0ZvO55mEJPPCNfhXert38RuV17K26t0ac
         bUcE2oO0aR1XgB0Tt9VuC4y2CGm5SzY4A1MOjPuXe2xAa+PhdLSY5+5G+tkJu46MH5bM
         FQcqbypE/1LCvmaNQkzMHR8tTBcID5PYImKntktD4rM9Irtm/bobgrkC4U4IgUYrqyVH
         CU5EQS+Wp81OEjFnzbVKXzuzkV+Skkz2hGgdZ/OVkxaSnPM0hMUliky9XDUEaheAtc1a
         sxNeUIIrgosSlj2yYKvW7bi80msth6jQVROTE0Lk+UjI+89tGbb8pNME54JFUVLLSH2C
         lOxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766878470; x=1767483270;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tgGRjxRiqIJZJSRl1gc2nIa4FvuinSm8dT0o+sSvyuM=;
        b=Ttsb8mphksl6mafzgjHs5zBbmFu4cg9kM5mBX33yLx7RQ6CP45q9Mo+oJKLJMqknma
         ukESSLGoWMXlrphrshQZUpW2dNWUepOH461/jln93wTo02vCCp+S88f4TLK3Ysd8zx5L
         V5g/3I3wiMZ4MH/ZAxiiARflC4kV+em2sOpYiN+Un2S13CNMs66TXqWF8TameJOviNr/
         2Xw1O0iJOTl1SVSxxAJmUQFC/DUJsaB+8Uzrlu8Gs/wJ8zvzTBm+BFRUTezIOlkdqvuj
         xKqAyiqRwez3QyznuO9ex8ghotPa83qy2FsO8RC0JCs+dO86yxdHIp+GPPYoAKxR7Lsb
         +n2A==
X-Forwarded-Encrypted: i=1; AJvYcCVREIrSrzGncGOxYAGXfRcHDMQaxJEuLIFefEZ3OrWrqp7va93wV4N05G3zLLfCfApxohk09JjH3JlgEl8N@vger.kernel.org
X-Gm-Message-State: AOJu0YyBBg66B5FDvl/4JlJcdpqpKFvA86AD+/80L6Lb1dM3iAlzoDJB
	45MJj6gaxJ4ddwP6GreVeQ7fN8KQ+t5hK7n7NqYcJXlUWoqf/UYRxTWFOmObAOJGIGScJfJsLcH
	wl4BvtGsssdjFJehnQEmNW4do49fR/nJw/LfNHAyHJcSTVQj/AQP5IcVxLp1SIA3jsMO7
X-Gm-Gg: AY/fxX6ir5P6xLyQOfl/WfR5dalsMn09JBXCop8y0LJhJ8Y6yOY2vWdMUMP9coYOKbR
	ibh8PrYqcK6zSbhwKJd5UQra9d8oMxNr3ygaLOFxa+jGHhJ8uNPv0AsijrN7QQ3eGHI9qTVbNF6
	PGLmVJuesF0e6b+V1V3SAR+f6ymEB1Sjdv5zOxqEnSmUdhWVzUrQN/eaea+j8QcYZzZtiEZPb/P
	xSiEcZ3rCEcnl7kK5VS4ijUmrjYRjH54/FGfk0AACMVGwJrTSKM0JG63B6xkI4giISvP1MO205V
	L7/42xGCL48KkdTGk6ZfBkLp7wWXotSkwctU92saBfFS44A+bwB1B7j8pt++rqGRZNZrjbOFshu
	IyKQLnoEtZ+Q3DHTI5hIHQP/ysUIBekRdDISAtnLX8hB6MCgFmrheLDHqyL5dYUDewdcGvcIHKk
	dDJlrqPrFNkqW8uQV68jcgqBw=
X-Received: by 2002:a05:6214:20a2:b0:880:5279:98eb with SMTP id 6a1803df08f44-88d86290d80mr417407076d6.44.1766878470222;
        Sat, 27 Dec 2025 15:34:30 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFr7U6sbXnsmgzXGcvUBmTKWyN07bHNhKftYI+uQ8UCc6xdTNfiJGHcQQgcy/mbTxs1h3EfUg==
X-Received: by 2002:a05:6214:20a2:b0:880:5279:98eb with SMTP id 6a1803df08f44-88d86290d80mr417406916d6.44.1766878469748;
        Sat, 27 Dec 2025 15:34:29 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-381226809d5sm66091441fa.45.2025.12.27.15.34.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 27 Dec 2025 15:34:27 -0800 (PST)
Date: Sun, 28 Dec 2025 01:34:24 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Shuai Zhang <shuai.zhang@oss.qualcomm.com>
Cc: Bartosz Golaszewski <brgl@bgdev.pl>, Marcel Holtmann <marcel@holtmann.org>,
        Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
        linux-arm-msm@vger.kernel.org, linux-bluetooth@vger.kernel.org,
        linux-kernel@vger.kernel.org, cheng.jiang@oss.qualcomm.com,
        quic_chezhou@quicinc.com, wei.deng@oss.qualcomm.com,
        jinwang.li@oss.qualcomm.com, mengshi.wu@oss.qualcomm.com
Subject: Re: [PATCH v4 1/1] Bluetooth: btqca: Add WCN6855 firmware priority
 selection feature
Message-ID: <7kwwrrrjcpawhelmwnz5mebczre73lubjgl23sa2pc2skrlm4b@p3urdzakyhbv>
References: <20251226075621.3223336-1-shuai.zhang@oss.qualcomm.com>
 <20251226075621.3223336-2-shuai.zhang@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251226075621.3223336-2-shuai.zhang@oss.qualcomm.com>
X-Proofpoint-GUID: pvAtG50lAhL9cnPuFnktX6kftXO4KoOQ
X-Proofpoint-ORIG-GUID: pvAtG50lAhL9cnPuFnktX6kftXO4KoOQ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjI3MDIyNCBTYWx0ZWRfX/fuvYzqMByUn
 fmmTk0xI+X3bQql8J6Q7AeW1FBaapeonRNY8+YCbGhKYOXbi89LohRZhvlhsxV0KxXj2udP1Dtx
 cQQWrMyE8yhgd+3ivvklDbWTy3cnGr5LkQ+mnV1/yG8uMJRGuDX0CSP5m8RXgj+6ySWROYeImJw
 Vn+OUZYkaD/XLTUI7S4MlC3p/8MLxIDMh/Y8QowGEZJLTFATzENVYz50sc2zUx4fTjU5RXr4nFk
 Z2ukVAf98W/3GVMBuSti56Ug5zERaGCX5zhrM3Uxp8/PzCOOsOKz/MTLZ5lBGRllWHE51MD63eG
 jtnPp8IF4/79atgfSEpxre5Gy9RPW4kIroJVOX9Mb/jAMBj4h02DBVOo8IV0zowPoq90brtBjHH
 TwicklXjYxyWn+h6BD2aM7zsGr+tPtHcwQx0/nK/FZ4fUTZsBLHObj+NHEl7bncjqazdgtnRBQW
 ySe6lu5wI+1t5D9k5VQ==
X-Authority-Analysis: v=2.4 cv=YuEChoYX c=1 sm=1 tr=0 ts=69506d07 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=WMkWF6dcPmnm6l8C4LcA:9 a=CjuIK1q_8ugA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-27_06,2025-12-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 priorityscore=1501 malwarescore=0
 adultscore=0 phishscore=0 spamscore=0 clxscore=1015 impostorscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2512270224

On Fri, Dec 26, 2025 at 03:56:21PM +0800, Shuai Zhang wrote:
> Historically, WCN685x and QCA2066 shared the same firmware files.
> Now, changes are planned for the firmware that will make it incompatible
> with QCA2066, so a new firmware name is required for WCN685x.
> 
> To code uniformity, move WCN7850 workaround to the caller.
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
>  drivers/bluetooth/btqca.c | 62 +++++++++++++++++++++++----------------
>  1 file changed, 37 insertions(+), 25 deletions(-)
> 
> diff --git a/drivers/bluetooth/btqca.c b/drivers/bluetooth/btqca.c
> index 7c958d606..81b0208cf 100644
> --- a/drivers/bluetooth/btqca.c
> +++ b/drivers/bluetooth/btqca.c
> @@ -581,28 +581,11 @@ static int qca_download_firmware(struct hci_dev *hdev,
>  
>  	ret = request_firmware(&fw, config->fwname, &hdev->dev);
>  	if (ret) {
> -		/* For WCN6750, if mbn file is not present then check for
> -		 * tlv file.
> -		 */
> -		if (soc_type == QCA_WCN6750 && config->type == ELF_TYPE_PATCH) {
> -			bt_dev_dbg(hdev, "QCA Failed to request file: %s (%d)",
> -				   config->fwname, ret);
> -			config->type = TLV_TYPE_PATCH;
> -			snprintf(config->fwname, sizeof(config->fwname),
> -				 "qca/msbtfw%02x.tlv", rom_ver);
> -			bt_dev_info(hdev, "QCA Downloading %s", config->fwname);
> -			ret = request_firmware(&fw, config->fwname, &hdev->dev);
> -			if (ret) {
> -				bt_dev_err(hdev, "QCA Failed to request file: %s (%d)",
> -					   config->fwname, ret);
> -				return ret;
> -			}
> -		}

Separate commit, please. It's not related to WCN685x firmware name
change.

>  		/* If the board-specific file is missing, try loading the default
>  		 * one, unless that was attempted already.
>  		 */
> -		else if (config->type == TLV_TYPE_NVM &&
> -			 qca_get_alt_nvm_file(config->fwname, sizeof(config->fwname))) {
> +		if (config->type == TLV_TYPE_NVM &&
> +		    qca_get_alt_nvm_file(config->fwname, sizeof(config->fwname))) {
>  			bt_dev_info(hdev, "QCA Downloading %s", config->fwname);
>  			ret = request_firmware(&fw, config->fwname, &hdev->dev);
>  			if (ret) {
> @@ -847,8 +830,12 @@ int qca_uart_setup(struct hci_dev *hdev, uint8_t baudrate,
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
> @@ -862,8 +849,26 @@ int qca_uart_setup(struct hci_dev *hdev, uint8_t baudrate,
>  
>  	err = qca_download_firmware(hdev, &config, soc_type, rom_ver);
>  	if (err < 0) {
> -		bt_dev_err(hdev, "QCA Failed to download patch (%d)", err);
> -		return err;
> +		/* For WCN6750, if mbn file is not present then check for tlv file.*/
> +		if (soc_type == QCA_WCN6750 && config.type == ELF_TYPE_PATCH) {

If you scroll up, you will see that for WCN6750 at this point type
always is ELF_TYPE_PATCH, so the second part of the condition is
useless.

> +			bt_dev_dbg(hdev, "QCA Failed to request file: %s (%d)",
> +				   config.fwname, err);
> +			config.type = TLV_TYPE_PATCH;
> +			snprintf(config.fwname, sizeof(config.fwname),
> +				 "qca/msbtfw%02x.tlv", rom_ver);
> +			bt_dev_info(hdev, "QCA Downloading %s", config.fwname);
> +			err = qca_download_firmware(hdev, &config, soc_type, rom_ver);
> +		} else if (!rampatch_name && soc_type == QCA_WCN6855) {
> +			snprintf(config.fwname, sizeof(config.fwname),
> +				 "qca/hpbtfw%02x.tlv", rom_ver);
> +			err = qca_download_firmware(hdev, &config, soc_type, rom_ver);
> +		}
> +
> +		if (err) {
> +			bt_dev_err(hdev, "QCA Failed to request file: %s (%d)",
> +				   config.fwname, err);
> +			return err;
> +		}
>  	}
>  
>  	/* Give the controller some time to get ready to receive the NVM */
> @@ -923,7 +928,7 @@ int qca_uart_setup(struct hci_dev *hdev, uint8_t baudrate,
>  		case QCA_WCN6855:
>  			qca_read_fw_board_id(hdev, &boardid);
>  			qca_get_nvm_name_by_board(config.fwname, sizeof(config.fwname),
> -						  "hpnv", soc_type, ver, rom_ver, boardid);
> +						  "wcnhpnv", soc_type, ver, rom_ver, boardid);
>  			break;
>  		case QCA_WCN7850:
>  			qca_get_nvm_name_by_board(config.fwname, sizeof(config.fwname),
> @@ -937,8 +942,15 @@ int qca_uart_setup(struct hci_dev *hdev, uint8_t baudrate,
>  
>  	err = qca_download_firmware(hdev, &config, soc_type, rom_ver);
>  	if (err < 0) {
> -		bt_dev_err(hdev, "QCA Failed to download NVM (%d)", err);
> -		return err;
> +		if (!firmware_name && err < 0 && soc_type == QCA_WCN6855) {
> +			qca_get_nvm_name_by_board(config.fwname, sizeof(config.fwname),
> +						  "hpnv", soc_type, ver, rom_ver, boardid);
> +			err = qca_download_firmware(hdev, &config, soc_type, rom_ver);
> +			if (err < 0) {
> +				bt_dev_err(hdev, "QCA Failed to download NVM (%d)", err);
> +				return err;
> +			}
> +		}
>  	}
>  
>  	switch (soc_type) {
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry

