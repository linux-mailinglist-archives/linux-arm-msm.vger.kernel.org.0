Return-Path: <linux-arm-msm+bounces-107478-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aN8QNMvjBGoNQQIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-107478-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 May 2026 22:49:15 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id D40FF53AAAC
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 May 2026 22:49:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id B28A2301D823
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 May 2026 20:49:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 957603822B9;
	Wed, 13 May 2026 20:49:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="h0hyRA4L";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="VAHKZ3r+"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 163CA379C2A
	for <linux-arm-msm@vger.kernel.org>; Wed, 13 May 2026 20:49:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778705345; cv=none; b=FNbQxKdZUe8nXGcn5CeauwbcA14PkYjrbGgGHvvkFZgiKnim81vjL2qjdeFk4WxrnYFxaX3HxEnBHN4g9P4sN/tQ7rbUQpvrL03EBc8Gbbk67yhwFGs+zDpEesBtMo/xY6q3pzKGFhTbDjjfNiUlFDbslZyWn+Rcz0vNNwMxNpc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778705345; c=relaxed/simple;
	bh=6wH2OTj0HYJsPJbcjxhwsoqqOLFXkmHk3AYWmHF52H8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lLpdvHOSiRZjXqqBsDOeBM1t7IHAJMh5NalWMnF2roRdahaA39pO02eCSmoQf1FaWazueOkXHtQADx1QfJ//sgO82bnX+AddhZbVgEDrbQFdTrudjKw8JazCZ0J+uA7r2oP/Qj8IIInIfMSCI4NqwmjB0apkzRHLRyoV98xbA98=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=h0hyRA4L; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VAHKZ3r+; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64DH4fQV3430126
	for <linux-arm-msm@vger.kernel.org>; Wed, 13 May 2026 20:49:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=Dhsegu5qtxwn6TgrVOys3Q1N
	IKw+osXSP8fGclK8A64=; b=h0hyRA4LAm2s7fFWaw/+oT58zLK6UIwllFaLZNho
	S7VdWvxK4MjUB9YwaN27Nmf2Im6R53Km4VwZOLc7MtCnPG5Mp16n7wQ0GNDNn9DA
	W2SP0bNVjQ9aDkKn8gX1vpkvct0jQeLVUYQ+198eMQFObvIcpFe1XO59HuuIsjzh
	oHoAl+q1GsoTwoh1EBJUPKJlQvNjHGQfH70y6FiLj0BymHecJ7JUADTijYo7Cj1E
	aYvkemIJWwtFnJDPt8z4N3xkxTto1SiaOEtXuWj8uhgJ6iXjdO+cRMvSnnPcrHoD
	fY8MLPXgkoJjM5Ii+ZvPY/XwIZ62k/7OmrXkr0EyJZRJkg==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e4qmcjf3m-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 13 May 2026 20:49:02 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-515224a8aa0so60296451cf.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 13 May 2026 13:49:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778705342; x=1779310142; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Dhsegu5qtxwn6TgrVOys3Q1NIKw+osXSP8fGclK8A64=;
        b=VAHKZ3r+7Bgh6P7xMxijFsEzgOwxxwAlCSOaASII54plXHbGrU64uXTTzd7EtStFy8
         u37QVMdcmIIHdVLSAeMex6MM+W//mb4fnQMALjOjpFFbZINEisis9fDOFxvrE2FUv7c9
         jhafIYPL+66U+sAfYCgchKlVfEt8tVV3LULBaETQAvrR1xsJ0OhSCDd2qZGo8MQRegrm
         1JW01OmlAop7GOYUrFWnxl9bwLA2vEBTxlOIxtCWJr7gy61EkJZHrSlcRHMBD46XHLXX
         9sfHfnQLODwyPaipzVCVgWAW850esPdn941xycj8p2orv2L+7P6r9+LaI3ni+Gaw+ket
         Q8VQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778705342; x=1779310142;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Dhsegu5qtxwn6TgrVOys3Q1NIKw+osXSP8fGclK8A64=;
        b=kaNMg4HKCtwh5jmYx8KhFTb3I1C3cljwyQJUAyqt8U8/ZrQQxxMvBQYXs0J6ETZGou
         XE2KiWvbuQCDcY2NKjhI2bSlllQsjMGcfMdcA8PIgeNcwhoAj/yrXRcaEgOdHP3DFe1E
         8yQ1umJshIh4tYYpGWIDz/4NqTEeYCUCxOjn8E8nb8tqrCIrL9UKO4ebF9mnFE6vZMjX
         1Kz/6A3+qNWx5z4sGigvtxmDXVIDx9ehybXhyGZ0Cz/2j4ZLRIJsln16xoQ+Ex3+sVBU
         K0Sdfcta2PosE7JvdRfyGF4krQo1hdHuf5bd7VnznvMD8P3YjAGKOlTUN4ayrhAeV1o+
         u4Mw==
X-Forwarded-Encrypted: i=1; AFNElJ+7HvZCnSMKVnmfgWdszOrQ1joAPA7fHoRbufmIHftE37tYzMjVdSCQyVLIN736Bc+yFtBCYk9MIa2eVxcx@vger.kernel.org
X-Gm-Message-State: AOJu0YzSklpMhq0Vj/T6AbAynkv7YfxhwqJYSPay6KZgdqvN8K0Y1cl9
	TUO/VXKAI3/PCbgSTtx5Q7LgfO18UjLyz7jTt8RM6slQBoMt0V7/WUDp9CAXO5xflbc58VMqe2p
	Gq36qSF6w5bxZTHH0ZubBQI6cEnuT5CofPPFVZ/Y56N48HLHNVcOI3Ak2DxNGkQW8kO7i
X-Gm-Gg: Acq92OEHtW2Ui9OWK1+lDTioZA4YGIr1EqPewLCzm/D/PszSDT9z44ORp2OpSuLTqTS
	tQD7VyYkuThg70nnX/ls09zVlhbtit6NWW/Eg/KDu6SuK3vhO3Bd/eBmGrzZ2LqiLxr8qMu7+3T
	ihh1DK4xB2Cb07guI48loNaqZxqM8RVDrl/q3vciQO+gpfOt70TSNYqdT2nOdG44yiLuaczMr0m
	EF3u4QDY8lCxCZsyptjRfn3rmXa5i625nVU+4WpC3rNUJ4RGQ9w7pZ2NGnEMQ6PqDRQVePc4ruD
	vEglTXFFL+MP/NzfzSCS98p+mzzg+Cb5KhNNiX1aXkL7BcEwIxXCYCqJxusiOU1cCxPwsztwQRU
	ajoy9IvRwg1Xs57l3wn5bxxWcc4vFJGnUcstN1aVQ0IRFb1x6X191s4zVaWduEr5ZfATsj78Mzv
	OUCwl2NeqwImjhpCoYR/V3iBl2bzxs7I8I9y0=
X-Received: by 2002:ac8:7fc1:0:b0:50e:6054:ba with SMTP id d75a77b69052e-5162f43fbb9mr68221731cf.9.1778705341857;
        Wed, 13 May 2026 13:49:01 -0700 (PDT)
X-Received: by 2002:ac8:7fc1:0:b0:50e:6054:ba with SMTP id d75a77b69052e-5162f43fbb9mr68221291cf.9.1778705341325;
        Wed, 13 May 2026 13:49:01 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a90f10cac1sm39233e87.2.2026.05.13.13.48.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 May 2026 13:49:00 -0700 (PDT)
Date: Wed, 13 May 2026 23:48:58 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
Cc: Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] usb: dwc3: qcom: Modify interrupt handling for eUSB2
 Phy targets
Message-ID: <y4b3qbt4xhnahtfmfw2qx3lazlnogcp5dfrpd2wyicevoc57p5@puqv4wjzcijn>
References: <20260511094422.3561509-1-krishna.kurapati@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260511094422.3561509-1-krishna.kurapati@oss.qualcomm.com>
X-Proofpoint-GUID: LDEfhi4oA6PBJcmy95e6XbVmn7l9nSnB
X-Authority-Analysis: v=2.4 cv=Hu5G3UTS c=1 sm=1 tr=0 ts=6a04e3be cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=YMjfxpUAHe4-pisfumMA:9 a=CjuIK1q_8ugA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTEzMDIwNSBTYWx0ZWRfXzxSgjpQXNElP
 BZRd7hYUvNFnxLG630F462s0c0jnRmT7tqBSBVYrZw6/Lm+Os6s+qBCf9lQqc/BC9DFfOtMmbFD
 xAYxC112ohefybiOoTsYnEJw7q8sE8BQH9VmusSaXwQsPN1Ms4ZYXEu5yI42jzCuX5p682qp2k9
 kzSjJJYmVOENSdKxA6/12Xee7RSIgaaMIFMFSU1Rqun9Rbd9BM6Ct2oapBZK1VKSxA3+AOjuQUD
 7WyBHdTXhhhdE8FydyAF0PLUBx5mwXBK6wRrW+P7kHZ/+FeQO5cBpoCpbw2SgA7MUjRT817mKNY
 OPhU8JgORF1AjBXLZRLf7A7XbBVazf98ou5spXgWm6Wr4QxPnURdfO5LEuYiVPAMtaZRKrAV/DD
 13ABdVDwDetcxrKoHZTG8MO1LY4QW00AEhJrG2l1pRB6viFwBZRJjrOpFPcIt/BR516pZIXAukd
 nKs5t2yKYjiSB34CXiA==
X-Proofpoint-ORIG-GUID: LDEfhi4oA6PBJcmy95e6XbVmn7l9nSnB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-13_02,2026-05-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 impostorscore=0 priorityscore=1501 spamscore=0
 clxscore=1015 bulkscore=0 suspectscore=0 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605050000 definitions=main-2605130205
X-Rspamd-Queue-Id: D40FF53AAAC
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-107478-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:dkim,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	MISSING_XM_UA(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCPT_COUNT_FIVE(0.00)[6];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

On Mon, May 11, 2026 at 03:14:22PM +0530, Krishna Kurapati wrote:
> eUSB2 targets handle wakeup interrupts differently depending on device
> speed when operating in host mode.
> 
> According to the eUSB2 specification, remote wakeup signaling in host
> mode is detected via different data-line assertions based on the
> connected device speed.
> 
> When a low-speed device is connected, the host repeater drives eD+ to
> logic '1' upon detecting a K-state on the USB lines during remote wakeup
> (eUSB2 specification, Section 5.5.14).
> 
> When a full-speed or high-speed device is connected, the host repeater
> drives eD- to logic '1' upon detecting a K-state on the USB line during
> remote wakeup (eUSB2 specification, Sections 5.5.15 and 5.5.18).
> 
> Since the eUSB2 PHY's "DP" and "DM" interrupt lines monitor the eD+ and
> eD- line states, configure the wakeup interrupts accordingly
> 
> Signed-off-by: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
> ---
> Changes in v3:
> - Removed multiple glymur-dwc3-mp pdata entries
> - Replaced use of ternary operators with if-else
> 
> Link to v2:
> https://lore.kernel.org/all/20260505194242.1947891-1-krishna.kurapati@oss.qualcomm.com/
> 
> Changes in v2:
> - Updated commit message
> - added supported eUSB2 targets
> 
> Link to v1:
> https://lore.kernel.org/all/20260502095616.666938-1-krishna.kurapati@oss.qualcomm.com/
> 
> This patch was tested on Glymur.
> 
>  drivers/usb/dwc3/dwc3-qcom.c | 94 +++++++++++++++++++++++++++++++-----
>  1 file changed, 83 insertions(+), 11 deletions(-)

> @@ -838,8 +866,52 @@ static const struct dev_pm_ops dwc3_qcom_dev_pm_ops = {
>  	.prepare = pm_sleep_ptr(dwc3_qcom_prepare),
>  };
>  
> +static const struct dwc3_qcom_platform_data dwc3_qcom_glymur_pdata = {
> +	.uses_eusb2_phy = true,
> +};

There is nothing _glymur_ in this pdata. Please name it accordingly.

> +
>  static const struct of_device_id dwc3_qcom_of_match[] = {
> -	{ .compatible = "qcom,snps-dwc3" },
> +	{ .compatible = "qcom,snps-dwc3", },
> +	{
> +		.compatible = "qcom,eliza-dwc3",
> +		.data = &dwc3_qcom_glymur_pdata,
> +	},
> +	{
> +		.compatible = "qcom,glymur-dwc3",
> +		.data = &dwc3_qcom_glymur_pdata,
> +	},
> +	{
> +		.compatible = "qcom,glymur-dwc3-mp",
> +		.data = &dwc3_qcom_glymur_pdata,
> +	},
> +	{
> +		.compatible = "qcom,kaanapali-dwc3",
> +		.data = &dwc3_qcom_glymur_pdata,
> +	},
> +	{
> +		.compatible = "qcom,milos-dwc3",
> +		.data = &dwc3_qcom_glymur_pdata,
> +	},
> +	{
> +		.compatible = "qcom,sm8550-dwc3",
> +		.data = &dwc3_qcom_glymur_pdata,
> +	},
> +	{
> +		.compatible = "qcom,sm8650-dwc3",
> +		.data = &dwc3_qcom_glymur_pdata,
> +	},
> +	{
> +		.compatible = "qcom,sm8750-dwc3",
> +		.data = &dwc3_qcom_glymur_pdata,
> +	},
> +	{
> +		.compatible = "qcom,x1e80100-dwc3",
> +		.data = &dwc3_qcom_glymur_pdata,
> +	},
> +	{
> +		.compatible = "qcom,x1e80100-dwc3-mp",
> +		.data = &dwc3_qcom_glymur_pdata,

This would result in the list of the platforms keeping on growing.
Would you mind instead detecting eUSB2 by checking that HS PHY has its
own phys property?

> +	},
>  	{ }
>  };
>  MODULE_DEVICE_TABLE(of, dwc3_qcom_of_match);
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry

