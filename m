Return-Path: <linux-arm-msm+bounces-73456-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E268B56D3E
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Sep 2025 02:20:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id D835E7ABDC5
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Sep 2025 00:18:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 85C301F5E6;
	Mon, 15 Sep 2025 00:19:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GPInVoiF"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E85ABCA4E
	for <linux-arm-msm@vger.kernel.org>; Mon, 15 Sep 2025 00:19:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757895595; cv=none; b=caPrQtD1F5zqtitVgJuwveVCBxRJE2bMiUPBaYRjMAO6Uzu45ss51Zx7qFkYjZRGMgQl4OJfkGQQk/2EMs3u6Al9KdC/InbxBWqr38K3gRUgdKPGmQdwWlnwhjSTWlYYgpHcPhigdrjbXwBuv+DJZSGI3Os4Omk2f6DqBkODG7s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757895595; c=relaxed/simple;
	bh=Mt0agHXYjcgJbC62txGxd9j3OcLaiV9jsFfBZlS07lk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=o40KXPdqftUanHOixwECbu/6XeMarqg+Swu4rDzVQY8qfAR2bQfy18n/36/hcOgkCfjTKupijMISzmQ3cbBJt24WyvtfBwi67UPphhwa/m5M65//gQRgKnq2PF/IRnJ3jtCebElKmhKeFi9V1kcp3K2V+qFY2khWUSvvY8Ylpmw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GPInVoiF; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58EMuHB4026714
	for <linux-arm-msm@vger.kernel.org>; Mon, 15 Sep 2025 00:19:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=p6RUAlaocnqnR7wsuVRgu77e
	RMC9aNnV4DXxPUYw8Hw=; b=GPInVoiFYQo2OarqZGwbhvWQaGWsLSYZOl4meVGs
	28ZgxCyb1L5B+upgUtVCAjNW0FLH415LGRVTsolIk1wybeoBT0PPXUNL+0rlISCH
	FIWZYWCYvcjLywfZkwsxxNu375rXKpJ+ban/cxZagC9G7QHJ3+SDdac+y/oxdJPo
	Ixo0bQ0lB74G3wX1sDHkcb3gebvJZbTRrww9BbQfs9/OCBQ0s9MHRrVIgaV3VIPN
	/0IskUzMHpZPR6tbEbGqSuPbrjeg6INOUlwFDlm7qtMxYxvHpfAdbWne+12coDGa
	1tscG+ldHfFEMypEXxARNKd9KaiSkIT5UMsqbyozkIYXrg==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 494wyr367t-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 15 Sep 2025 00:19:52 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4b345aff439so102879241cf.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 14 Sep 2025 17:19:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757895592; x=1758500392;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=p6RUAlaocnqnR7wsuVRgu77eRMC9aNnV4DXxPUYw8Hw=;
        b=HqYHl73Do0VmEY1dMZALfhO8MX+SVLPrJ8ANwINPA5YpGEplj81oq3sRcXN6j7sUqn
         Wb0g/1oQFwpQeiJQCY4XZrcLRUGWQ24x62VLd7r9dc0wrDZnwoXlQzO8swS4Xn67JTTq
         JQ1WTvcIOZMRvFUiL86qeMyKKxm+jVywupXL6rd86jGXZuFUFtA7LOtN00TWKwOCbNJ9
         jxnxDKKIYZFAaFvFGe3Gs/oAUB5/D8FFj1t8AyBNkgaFKQE6ebvcW2+8tAullld8f1bl
         vOGpxTOHnYYNbn2qT7GBuleMwHMZULJvvmFy5seJAQnUWTEDGc+s/l5iXpbY31pPZWmk
         RGrw==
X-Forwarded-Encrypted: i=1; AJvYcCWNNn40l+hFJnvyVIJCw5kK5gMWDFegarT7acUFzXhICGV8D8aBL8Sj6jnZBBkNsKb+cqx8v+yrLgDrCxda@vger.kernel.org
X-Gm-Message-State: AOJu0YwrJcLwOTL5NIjv177WtErkHt0JZOVDQeZoszTHTmh6PJLSwraf
	UmczWFDOF9hqU5d4Ud8KLCZyQCPhdf+/zcaOhaNqLldnA9mliMSmC+rnqgLQVlCojb9wH1QjOHp
	+tYKFaN2U6NkS6snCXJL7wq20c3rw+2d4B8IfXZA5Mz3xDzN7U/L1RFuFdK4VlA4CD+yw
X-Gm-Gg: ASbGncsh3uObkMDzm285P+Ew3scJJvbxNFphV/RfUr2d7fUFWGoAMonsaJo5nOWC6gL
	hMy8uGsSfobw0OYJ0yv3D7ewMUL7Y5NZ6Yv8rCe3zuRSriPr2+ZTxyWm++h49yGLg7RDxRFKego
	4bWb/rk7A8ACWGbaYMb8ALQgxwdIzRQP6xMInNCspcUd0+YcUDG6bbgmlMinxyGsZmbK/Gy62S7
	2d/B76IVxh9RWDssAJSsujZrY75FWDVaXVTd2/4ofBtQA1AyjiH9ge/2D/yEJmag0MQ0e9UCqXT
	2w+6rnXXwfr4hCpJx1pTjz8551KzC/qUf1JDEPQlkr4/aoRMDs+yL6jB2T+yxvTKpRHpsxSCWWD
	/YUFWgrrRSdc8Pr4P2XEJ2ozQitBMAtp2g8HU+nd/p67BKdwnsIqb
X-Received: by 2002:a05:622a:4ac6:b0:4b7:9c5e:84ad with SMTP id d75a77b69052e-4b79c5e87d4mr42864631cf.15.1757895591850;
        Sun, 14 Sep 2025 17:19:51 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFCj4N70HdgyI43enSOIyoMIAg7MrsmXC9QaxOnHUaJ1JBgSkPZ0ERy+ZvYMZzZpA1N70rzng==
X-Received: by 2002:a05:622a:4ac6:b0:4b7:9c5e:84ad with SMTP id d75a77b69052e-4b79c5e87d4mr42864371cf.15.1757895591374;
        Sun, 14 Sep 2025 17:19:51 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-34f163f400esm25360971fa.23.2025.09.14.17.19.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Sep 2025 17:19:50 -0700 (PDT)
Date: Mon, 15 Sep 2025 03:19:47 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Paul Sajna <sajattack@postmarketos.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, David Heidelberg <david@ixit.cz>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Amir Dahan <system64fumo@protonmail.com>,
        Christopher Brown <crispybrown@gmail.com>
Subject: Re: [PATCH 01/11] arm64: dts: qcom: sdm845-lg-common: Add uarts and
 Bluetooth
Message-ID: <djduil6xb65qxmjp5qrxliskjii2nbijnd4w4rwsz4d7nmpo4f@crut3ib4hu6y>
References: <20250913-judyln-dts-v1-0-23b4b7790dce@postmarketos.org>
 <20250913-judyln-dts-v1-1-23b4b7790dce@postmarketos.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250913-judyln-dts-v1-1-23b4b7790dce@postmarketos.org>
X-Proofpoint-ORIG-GUID: dBTTRW-WD6rBXLq6OG3nLRz5ztI10JjO
X-Authority-Analysis: v=2.4 cv=SouQ6OO0 c=1 sm=1 tr=0 ts=68c75ba8 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=yJojWOMRYYMA:10 a=Gbw9aFdXAAAA:8 a=zNG7vcL9-tlF-_c_ef4A:9 a=CjuIK1q_8ugA:10
 a=kacYvNCVWA4VmyqE58fU:22 a=9vIz8raoGPyDa4jBFAYH:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTEzMDAwMCBTYWx0ZWRfX71KfZaihMcIL
 6KrNnJCWk9cs/2tKZNbugZEwO0gu+GMLXsHRyjD/gXF3FUNWv3UzSBKcbjYKcxq9tDWPSkMgZ1b
 l1yyLKPq9C+GPopZryz75l9LZn9dUdVqeKWXSqtjwiydwfWj1YO44HxUb57Pw2s10pcRjQFcQq0
 b+nL176qarSFwOXIo9OClxgLCe2VANh1ZvtQvPxoBaJ8haHDue1s7IqsK4VqpNLLdHn++TXkJRZ
 wn1Ye4kMeJGYeJZY+8secNiSfEbrkxpt6eugwhEWqHZpmOo5572Ek/JC6Imp80+DtugO6QrTVL5
 hqqXPpVIC3u8gucno11dG35sKWVJx7/K1Yb9cLmNM/Ux8vdc4eNXuElAhx8MuMbIlncUP1s/GL+
 lGn31QsN
X-Proofpoint-GUID: dBTTRW-WD6rBXLq6OG3nLRz5ztI10JjO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-14_08,2025-09-12_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 phishscore=0 adultscore=0 suspectscore=0
 priorityscore=1501 malwarescore=0 bulkscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509130000

On Sat, Sep 13, 2025 at 04:56:34PM -0700, Paul Sajna wrote:
> uart9 is debug serial on USB SBU1/2
> uart6 is bluetooth
> 
> Signed-off-by: Paul Sajna <sajattack@postmarketos.org>
> ---
>  arch/arm64/boot/dts/qcom/sdm845-lg-common.dtsi | 47 ++++++++++++++++++++++++++
>  arch/arm64/boot/dts/qcom/sdm845-lg-judyln.dts  | 10 ++++++
>  2 files changed, 57 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sdm845-lg-common.dtsi b/arch/arm64/boot/dts/qcom/sdm845-lg-common.dtsi
> index 99dafc6716e76e25aad0755e6004dc952779689f..1acc418b943443f3ba4f8a8a1cfe2c575da11876 100644
> --- a/arch/arm64/boot/dts/qcom/sdm845-lg-common.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sdm845-lg-common.dtsi
> @@ -31,6 +31,8 @@ chosen {
>  		#address-cells = <2>;
>  		#size-cells = <2>;
>  		ranges;
> +
> +		stdout-path = "serial0:115200n8";
>  	};
>  
>  	reserved-memory {
> @@ -159,6 +161,11 @@ vreg_s4a_1p8: pm8998-smps4-regulator {
>  
>  		vin-supply = <&vph_pwr>;
>  	};
> +
> +	aliases {

Please keep the file sorted. 'aliases' < 'chosen', etc.

> +		serial0 = &uart9;
> +		serial1 = &uart6;
> +	};
>  };
>  
>  &adsp_pas {
> @@ -595,3 +602,43 @@ vol_up_pin_a: vol-up-active-state {
>  		qcom,drive-strength = <PMIC_GPIO_STRENGTH_NO>;
>  	};
>  };
> +
> +&qupv3_id_0 {
> +	status = "okay";
> +};
> +
> +&qupv3_id_1 {
> +	status = "okay";
> +};
> +
> +&qup_uart9_rx {
> +	drive-strength = <2>;
> +	bias-pull-up;
> +};
> +
> +&qup_uart9_tx {
> +	drive-strength = <2>;
> +	bias-disable;
> +};
> +
> +&uart6 {
> +	pinctrl-0 = <&qup_uart6_4pin>;
> +
> +	status = "okay";
> +
> +	bluetooth {
> +		compatible = "qcom,wcn3990-bt";
> +
> +		vddio-supply = <&vreg_s4a_1p8>;
> +		vddxo-supply = <&vreg_l7a_1p8>;
> +		vddrf-supply = <&vreg_l17a_1p3>;
> +		vddch0-supply = <&vreg_l25a_3p3>;
> +		max-speed = <3200000>;
> +	};
> +};
> +
> +&uart9 {
> +	label = "LS-UART1";
> +
> +	status = "okay";
> +};
> diff --git a/arch/arm64/boot/dts/qcom/sdm845-lg-judyln.dts b/arch/arm64/boot/dts/qcom/sdm845-lg-judyln.dts
> index a12723310c8b630a4961de671ea8b60f1f8b512b..49225e4fa80e5f45a36964d5d733dc238e4413f8 100644
> --- a/arch/arm64/boot/dts/qcom/sdm845-lg-judyln.dts
> +++ b/arch/arm64/boot/dts/qcom/sdm845-lg-judyln.dts
> @@ -66,3 +66,13 @@ thinq_key_default: thinq-key-default-state {
>  		bias-pull-up;
>  	};
>  };
> +
> +&uart6 {
> +	bluetooth {
> +		/*
> +		 * This path is relative to the qca/
> +		 * subdir under lib/firmware.

Why do you need a special NV file? Please include BT information into
the commit message. Also, if qca_read_fw_board_id() returns a sensible
information on this board, it would be better to fix btqca driver to
apply board ID on WCN399x boards too.

> +		 */
> +		firmware-name = "judyln/crnv21.bin";
> +	};
> +};
> 
> -- 
> 2.51.0
> 

-- 
With best wishes
Dmitry

