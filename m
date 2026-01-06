Return-Path: <linux-arm-msm+bounces-87576-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id AF3A1CF611E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 06 Jan 2026 01:21:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7EBEC303C9A0
	for <lists+linux-arm-msm@lfdr.de>; Tue,  6 Jan 2026 00:21:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D52BD45948;
	Tue,  6 Jan 2026 00:21:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZXfn0iOW";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="O2nlL3Wi"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3716324B28
	for <linux-arm-msm@vger.kernel.org>; Tue,  6 Jan 2026 00:21:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767658878; cv=none; b=CDi2BALeAG6FwSYwvefuVvNHl4p1kTjeTALD3rBWvTq7ymxClr9ZbTao2+KFWejmBy+ltjSTkdPq2k6HpgZypb7ubaCeKM5tXcIV8XMKEt+VitPv6PmLExKogZ4r9rE12DwSLb6a3mgCRz4cVbxcHMobK6941RkOJGtKLsK5rkg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767658878; c=relaxed/simple;
	bh=/6tOsjbSdrxCxA9fdKgxEKPUZ4gCWaZmudLZmPjVY0Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AV7yrlI8X3iQ7KaJR9nYovWDwIyMhYVQ8XGnD26nng0JjzGon1dnWxFhlozyIMUQwvDq27MNJycW0zu52Ugb9QZcei1qPXCSzogdSw+PKn82m+Sz48wdodOkhJcg62GEF67PKbllWgl2t3lv0a9syNrvVxfX2w7tgWHEh85c8Q0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZXfn0iOW; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=O2nlL3Wi; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 605HHI0q594513
	for <linux-arm-msm@vger.kernel.org>; Tue, 6 Jan 2026 00:21:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=EzuV7g0zm+rCLd4H1Fv2n7o4
	R4BytZPVQ7BdI5Trbx4=; b=ZXfn0iOWZNNNQpJumZYQBWRcr/hztKpQz1mKpNpS
	vzk7Ttrd0sMJitNSHe3fLWTE3A6r1ZGc+PItNL2q+TYvYG+Svmqinlp491biwdft
	v5Aj7MzyqN9D1a5ViyK1uSHzuEXpCnrJnQbPAVcm3HmzToyrhcx4qaU6+t/XnUch
	D8cdShEgpnIptwV/RkMLNn4bxm+urMB9n1E0Ljttce+vofvjIzT6Avjz+41yOsHw
	R9bEXv4EUcU6V/OCcUf1NK16RX2V4oVqfwACClrpBVFYsY2tfjV5iTMQezQJz83R
	4PvqmB880QH2QfFGIoAHH1HWcEuAzWoNz2Ajo9U2AXUeKw==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bga8pjc9v-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 06 Jan 2026 00:21:16 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4ee1b7293e7so15806641cf.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 05 Jan 2026 16:21:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767658875; x=1768263675; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=EzuV7g0zm+rCLd4H1Fv2n7o4R4BytZPVQ7BdI5Trbx4=;
        b=O2nlL3Wi1Loe5E3WD/jjG/Ubkxp5kGBFHkzCK6KGcwpiOHz/PKZzCyKFfLYj5ipuJC
         brNqaNw9uVq5SeBrXxEv/oulhgk2m0s973cb6wFidE3oATMIv9GLTyTPfIgluNe9VPvv
         OXRNPV4r3JkpNJ95cAkUzDp2jvmZLiUs7puvrGQuVYH2FqgrX6fdsOYHzlJJjXew89Fq
         OTPgMfU7KxpO4ovOnwH5gLQ5/RyEF0V5dH/otWo6hXGSXX+NbEwA0sefFx7UD3EGvL//
         qEYz+3qiPHzrx7kipMRKuXFIf6U5LM/zqiG2PUDs9D214qA2VR9bOcMvpH5PThAqwEZR
         C5Yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767658875; x=1768263675;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EzuV7g0zm+rCLd4H1Fv2n7o4R4BytZPVQ7BdI5Trbx4=;
        b=KGXsHAMEqjYSnOhmVvsyo6TUmeJBdgIWmRMAD1WB/UMld8NiHB85hhNjNGRtUFGKu4
         wge4cna+HBtjRe+it4klS0U6YrK2ZhIdp4WUEu8Br2zPN6oWzFeQvvM4dHpX2Q4KxDco
         A0EsvvaECW7iLGuOWdeH09dnpjQXEdHUwZnAMYfdJjZTL/wwWL2Xps72fC4NHssR0jdu
         XpywIDRFOGVEe3hjSd7QcrlalHEvC+IqRRmMn7+GxrGnJuK/rSj9S2qEmTiaAOV0jqI4
         FsxSHFzt7oIhfJDIWSq2U7v7qwRcDGUDHkCrfWZq7NKzkfFE0iW16KkgaHE2rAP2D+G0
         04Ww==
X-Forwarded-Encrypted: i=1; AJvYcCWZJWemyDPoRKoZFIjbvL39adivuKK5Gyk8dC13c91amDtbET+VkMHNPS+g+U+fYzqNX5pQG87GISLHcqDJ@vger.kernel.org
X-Gm-Message-State: AOJu0YzZGIcuCKJqNQPqHQZA2R39+CFj/qoiKn7eJhhz9TEUc2+eIjZF
	dNc8rrxeLbVza46e0BXg+PER97uSJSURlSjI5pli/HXLjyABMtx0Ls6RQ4EcfOdv5OEEyAvhmJO
	omSr9PNjyHaBGsIPjZ25lYMNseSbRFC6gto462cRHEL5G3nXjNRGRzD26tQ1Jhhaz49B3
X-Gm-Gg: AY/fxX5tOsDry4+zAOxPsIrS4LSzeLy859clh3ZdumhIfAFA/g8f/ozcSNCCBtS9oLx
	ORVjP+iwYzYrsgEDczERz70PSCFY/EVRVKare5MHEtksEactPVT7OGK5MPIdEJ5qNLOeV2I4YlE
	+mCieRTdnz35yF1Y1825XSL6W320ZZDuBHsmeWzGa61BboC/EMASngxLMDn1Jm0dzgWddxxU4fZ
	B6hew0EnJQUCg/5yhxPsQI9dauQ2nHUPVbsn/SWETXgDlWOQ4XrFO/688DdUYKRcPo/IIr2x6BR
	IvKgKz67AcmzbkBZuNHlC8ylkMjrs0ULDbdaxHr5yCUYq/y7S2/pdHTGon9e4llJ0DJVxAS7+Sw
	eLoLFogH3LQM6Ar0vzX+iyPYXdK5PNwD8F8gMGpWBfa9cMsLXt8dGsyFtIwW1hp2Q0CYlOla+Eh
	M3nGScweWKl6YmrAgweBIGNZc=
X-Received: by 2002:a05:622a:60f:b0:4f1:def3:cc00 with SMTP id d75a77b69052e-4ffa7852ffbmr16943741cf.82.1767658875278;
        Mon, 05 Jan 2026 16:21:15 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHvrSlieeyyPCeFIBpUE1Via3KuuAQBzCk3ns+cr1h0EDqjg6qU0unOLswiIde5+Swy2cyTXQ==
X-Received: by 2002:a05:622a:60f:b0:4f1:def3:cc00 with SMTP id d75a77b69052e-4ffa7852ffbmr16943611cf.82.1767658874927;
        Mon, 05 Jan 2026 16:21:14 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-382eb7c708fsm1662701fa.21.2026.01.05.16.21.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Jan 2026 16:21:12 -0800 (PST)
Date: Tue, 6 Jan 2026 02:21:09 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Shuai Zhang <shuai.zhang@oss.qualcomm.com>
Cc: Bartosz Golaszewski <brgl@kernel.org>,
        Marcel Holtmann <marcel@holtmann.org>,
        Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
        linux-arm-msm@vger.kernel.org, linux-bluetooth@vger.kernel.org,
        linux-kernel@vger.kernel.org, cheng.jiang@oss.qualcomm.com,
        quic_chezhou@quicinc.com, wei.deng@oss.qualcomm.com,
        jinwang.li@oss.qualcomm.com, mengshi.wu@oss.qualcomm.com
Subject: Re: [PATCH v6 1/2] Bluetooth: btqca: move WCN7850 workaround to the
 caller
Message-ID: <tzul6msdqknv57jgw672bl5xvavmnkrrwbajpc3xh3sto6sm2t@v4nvhsa7zoel>
References: <20260105055646.3816296-1-shuai.zhang@oss.qualcomm.com>
 <20260105055646.3816296-2-shuai.zhang@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260105055646.3816296-2-shuai.zhang@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA2MDAwMSBTYWx0ZWRfX9ubGokiq/4Ez
 vBTpELwX2EJaUIx7c82D7Oz6tgLT0MgYTVnHneI/SclazMQW4O/8xlDNvUZwxpcHyzWpVlM0COB
 xCxafI+6jeBCJMoWtOLVaETX/Wvz+hGXOWaHlP99oMypUbOI01H+XsKY+sOMXhX901Rz8Zxt55L
 w/ufYR9v5ORF1jL9abbayyhMY0Rf6EQZI6NsO+NiPel5PvPxxjWxxF7KeXjZ4UUK/QDWRtkPv3C
 +/CvdlVXp1HDnB5JyCTEmdvh0/jNtT96xkb76t+L3GzGFj9L6kDgO6W8mdSQLSF66XG0jqwnVCP
 4Oz6gz7Ze1DxLaK1BpK7N9dnuJyDAM8LwWkFn63abiZesDajvnN4d28PbdybzNG4BI/CPShb2MQ
 Ec9QZwJXq31iCyf68yn8d1/Y4gctzGVtmPTBR7ED6lGQXcyMIVOAH4qcMvAGJ0p7XxkAXVbmqot
 tNdV7cWObUDOA73LqfQ==
X-Authority-Analysis: v=2.4 cv=JfWxbEKV c=1 sm=1 tr=0 ts=695c557c cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=C05YURWSzReu-qnAg9gA:9 a=CjuIK1q_8ugA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-ORIG-GUID: 0SdqJfga9h63gZJ97QsZXp0-gxkMQVqb
X-Proofpoint-GUID: 0SdqJfga9h63gZJ97QsZXp0-gxkMQVqb
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-05_02,2026-01-05_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 suspectscore=0 clxscore=1015 priorityscore=1501
 malwarescore=0 lowpriorityscore=0 spamscore=0 impostorscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601060001

On Mon, Jan 05, 2026 at 01:56:45PM +0800, Shuai Zhang wrote:
> WCN7850 will first attempt to use ELF_TYPE_PATCH,
> and if that fails, it will fall back to TLV_TYPE_PATCH.
> 
> To code uniformity, move WCN7850 workaround to the caller.
> 
> Signed-off-by: Shuai Zhang <shuai.zhang@oss.qualcomm.com>
> ---
>  drivers/bluetooth/btqca.c | 39 ++++++++++++++++++---------------------
>  1 file changed, 18 insertions(+), 21 deletions(-)
> 
> diff --git a/drivers/bluetooth/btqca.c b/drivers/bluetooth/btqca.c
> index 7c958d606..561e51fa9 100644
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
> @@ -861,8 +844,22 @@ int qca_uart_setup(struct hci_dev *hdev, uint8_t baudrate,
>  	}
>  
>  	err = qca_download_firmware(hdev, &config, soc_type, rom_ver);
> -	if (err < 0) {
> -		bt_dev_err(hdev, "QCA Failed to download patch (%d)", err);
> +	/* For WCN6750, if mbn file is not present then check for
> +	 * tlv file.
> +	 */
> +	if (err < 0 && soc_type == QCA_WCN6750) {
> +		bt_dev_dbg(hdev, "QCA Failed to request file: %s (%d)",
> +			   config.fwname, err);
> +		config.type = TLV_TYPE_PATCH;
> +		snprintf(config.fwname, sizeof(config.fwname),
> +			 "qca/msbtfw%02x.tlv", rom_ver);
> +		bt_dev_info(hdev, "QCA Downloading %s", config.fwname);
> +		err = qca_download_firmware(hdev, &config, soc_type, rom_ver);
> +	}
> +
> +	if (err) {

You can keep the `if (err < 0) {` here.

> +		bt_dev_err(hdev, "QCA Failed to request file: %s (%d)",
> +			   config.fwname, err);
>  		return err;
>  	}
>  
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry

