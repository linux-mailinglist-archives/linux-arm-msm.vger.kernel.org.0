Return-Path: <linux-arm-msm+bounces-73545-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DF35B57628
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Sep 2025 12:20:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 433A47A3D9B
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Sep 2025 10:18:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 39CB4278170;
	Mon, 15 Sep 2025 10:20:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="E4RCjceu"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEA342D2488
	for <linux-arm-msm@vger.kernel.org>; Mon, 15 Sep 2025 10:20:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757931632; cv=none; b=sY0AvX1L8wJVI2DprCdrkCoUq7oBV9qsRljvCnMGrMOaXl39NfJ7AIghmnI5gGUoHna7qQi9LTWhbvmn1eqVRX+mRwrsn5+IedqTlHIU8XB4Vr3Qvet+7WCFIIHsA/2AsTkQ8neG4O1m4Y/rbcrnTxHnHwp9Prnd8KToOqEVcbI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757931632; c=relaxed/simple;
	bh=bUNuwE669bXdBGZ1MzmOAYXT/EucREWOdEjUe5wgwgQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KzLcTsDBQaTnMa6rgNKkkT2nNPhM5+RZj+0M/9gGj/eshp8kgxjYuTm3ADT6LzpV36e9U/WIENUsy2NTtJI5P7hqjAau7i9KuE+aJi3oCIIIcvM3dAlc9D+ovw/3NA4XdKWeDYxH5LST25fWisYqhYfagB0RmJZ8QHygXnoRV9c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=E4RCjceu; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58F8FgZc005694
	for <linux-arm-msm@vger.kernel.org>; Mon, 15 Sep 2025 10:20:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=RGYbORxiyAr6c96vlWyAJgN2
	Z36YAZvrHJKPyVLUETk=; b=E4RCjceuFjWsbeoW71o7Gi2o9Qwx9dCDHrhUEuzG
	cazBLKeTmU2MkLNrfYz2Y4SeLeABqUBt3K+ye5c8V43Nr0aVGAtpUOfbsrJ8fP0+
	hDARsTh4t7+fETwJLLiODO2LNRUIG6wWbwtea1bDCrLL4oXQqEPBM/2UD5Z3kAPu
	9Trq3hB2XZ3xf2L6fjosW7c+aqISWJncf6OJmryXpxQX7KA6ZArqpAg9qbxK+hbp
	cqV7Lhgj+FzfJtAfIGdRFyjGK/N8lFcp39j/ssVlQlGIMMrgXBoXHDMXsnIOrhbp
	ylV5cIiWmfru6FFKXC/5tM8OfAZ3CT4btFxEQ92zY31xkg==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4951snmc39-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 15 Sep 2025 10:20:30 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4b5e303fe1cso87831851cf.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 15 Sep 2025 03:20:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757931629; x=1758536429;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RGYbORxiyAr6c96vlWyAJgN2Z36YAZvrHJKPyVLUETk=;
        b=oIKmwAs9NBCcj3mq7CRdq48Ex+rFwStOoKBQjdnE2fXL+JAexiY4SrVErZlaen2vdb
         Wqcbmig89LEWw8vt3J35+W6e6yDooWFSoGlcicsJp/LfLbHD4ROwSNXywDC/zo/9Xl87
         Qhj4NKcnX/Lh3Eu6ZkdgsYwF8AsLdiFO5bCRbYyXLK7VRo0N/s7MrB8N8YTzEZnPKp9F
         DkG1CemD13sNRe2ajM4E31eZyo8N5t37Jh6Q8pv8TlYNKj0mLG+Sr4h+/LVtQ3S1goNc
         T9SSI+0zrM3/XHPR6Gt9uoJhKrAP+896VrOHD8laqZ0raKOTo338h2BnyQjriCUPS3FK
         G3zg==
X-Forwarded-Encrypted: i=1; AJvYcCXckduwvutTfu0n8273Yi+6AYTXUxRnlzyJpTNUjBjvP0t8O4JgnuOdAKBlDViLxSciNmxCucXOctM2ycE2@vger.kernel.org
X-Gm-Message-State: AOJu0YwtkPu+LkNWuAuDSz5q8Ka4SzJkzhmJXZUfE8qE29aVdugIQ19D
	nreYM9ovqPEoPC9hY9D32qdAXfJIhJRcfUgEc9Ra6Ela3zrIho0Y3yLqhdi45XNgU75yiY0hSp7
	fQpukTK4CTtzDOKF+F0iAONfSK8OnhT6atHuXMZZyPxAIExvZy5jo7D3b4Fs46cpvU2tX
X-Gm-Gg: ASbGncuEtlhCHooFHFXDz5DwFL7n9CqgE2GRmrGwemAeZtT1IlIAUb+Qu+V6owZ+/IR
	McljCY8JdxWSa8tXHG83JztPdRcuuRSSHRR+h3NgZ8BlVLOXfSjiLXCLjECbkLrAH/ufb8rYC51
	ki6poxVqEkZoKz9mucnpVOvect4dp21WeNh+PB5yN/+oOeFvKk3op3HMZvjocQSfVqNtQjS2myA
	8KZn+kItLOfiDVnGOL/wflK7G+INEMc1+tBOMibEE44JPxnCpd9wd6c9/1D9hjO1nvs55k5Ld5Z
	Q6qy8VYj9VRwyFUvdKJf4U1aYLkdk6DOrrhsfvrQF+60WsNwciemvZ6W52lJG7EmpJQyy+8+nI1
	K7TCZB1GY6Wo3JfvHLM3L8bIoEisT+UQMFtqICQ3Va/KrO831fa/o
X-Received: by 2002:a05:622a:5e05:b0:4b7:81df:95e2 with SMTP id d75a77b69052e-4b781df97a2mr99062071cf.40.1757931628738;
        Mon, 15 Sep 2025 03:20:28 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHYwTHXV4KtjY7Dwk60uIzpz5mR+OcC0Kr5EGu4MjShIIx+gN3rPddQUBAx2RB7YbhW+OgitQ==
X-Received: by 2002:a05:622a:5e05:b0:4b7:81df:95e2 with SMTP id d75a77b69052e-4b781df97a2mr99061901cf.40.1757931628303;
        Mon, 15 Sep 2025 03:20:28 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-573c8330eb9sm1049638e87.60.2025.09.15.03.20.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Sep 2025 03:20:27 -0700 (PDT)
Date: Mon, 15 Sep 2025 13:20:25 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: fenglin.wu@oss.qualcomm.com
Cc: Sebastian Reichel <sre@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Subbaraman Narayanamurthy <subbaraman.narayanamurthy@oss.qualcomm.com>,
        David Collins <david.collins@oss.qualcomm.com>,
        =?utf-8?Q?Gy=C3=B6rgy?= Kurucz <me@kuruczgy.com>,
        linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, kernel@oss.qualcomm.com,
        devicetree@vger.kernel.org, linux-usb@vger.kernel.org,
        Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v4 8/8] arm64: dts: qcom: x1e80100-crd: Add charge limit
 nvmem
Message-ID: <vezlbc5onvmg3wd6tdr3cxhlvtmp24ca2e3vp6inqeegjhm7eu@viuurujdofvn>
References: <20250915-qcom_battmgr_update-v4-0-6f6464a41afe@oss.qualcomm.com>
 <20250915-qcom_battmgr_update-v4-8-6f6464a41afe@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250915-qcom_battmgr_update-v4-8-6f6464a41afe@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=JO87s9Kb c=1 sm=1 tr=0 ts=68c7e86e cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8 a=2ejD7e4gGTxI7fIsllgA:9
 a=CjuIK1q_8ugA:10 a=dawVfQjAaf238kedN5IG:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: 70myKBWpnjQl4ZL5-KVZu0cJN37ZMmLi
X-Proofpoint-GUID: 70myKBWpnjQl4ZL5-KVZu0cJN37ZMmLi
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTEzMDA0MCBTYWx0ZWRfX+1rlguwTXikE
 pz1rPbRIVgLM43yGXOsF9hs3k18v3+YJyJPv0nIayqHt+JC+9bGfRCeuwllBzKAH8dXWswrRX/4
 VzxeAVye61KYLmezOwBpqZ611gJ88fIjAWk+eEcID2VRBtGrwYc7kzYbDSVYm03SfLMNB/XkUgM
 sLlxGdlpTpR+oz7GgSi3VfrLCcnL48RKH1P82GOWvb5RorjRoZ5Gf5Rxlf+Q5DPRRFQGNenBKng
 lofqB748Tjh0ld0RM+Mc2aIQVb0zV5p219q4bLY0ELj8kPr7sYgeDUD6ofZB/w+xMC55kCqqdO1
 3yzOb0UVC0poLlhT1nNfP2OBAwGOws0a3Kdqzy+VzYKU0qqzuSatAMLCj5E8G+CtbOSn2cs04hm
 CynDIT69
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-15_04,2025-09-12_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 spamscore=0 clxscore=1015 adultscore=0
 malwarescore=0 priorityscore=1501 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509130040

On Mon, Sep 15, 2025 at 04:50:00PM +0800, Fenglin Wu via B4 Relay wrote:
> From: Fenglin Wu <fenglin.wu@oss.qualcomm.com>
> 
> Add nvmem cells for getting charge control thresholds if they have
> been set previously.
> 
> Tested-by: Neil Armstrong <neil.armstrong@linaro.org> # on Thinkpad T14S OLED
> Signed-off-by: Fenglin Wu <fenglin.wu@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/x1-crd.dtsi         |  3 +++
>  arch/arm64/boot/dts/qcom/x1e80100-pmics.dtsi | 20 ++++++++++++++++++++
>  2 files changed, 23 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/x1-crd.dtsi b/arch/arm64/boot/dts/qcom/x1-crd.dtsi
> index c9f0d505267081af66b0973fe6c1e33832a2c86b..fee65391653ae9c2ee23f9f3954d9ed018c9aecd 100644
> --- a/arch/arm64/boot/dts/qcom/x1-crd.dtsi
> +++ b/arch/arm64/boot/dts/qcom/x1-crd.dtsi
> @@ -82,6 +82,9 @@ pmic-glink {
>  				    <&tlmm 123 GPIO_ACTIVE_HIGH>,
>  				    <&tlmm 125 GPIO_ACTIVE_HIGH>;
>  
> +		nvmem-cells = <&charge_limit_en>, <&charge_limit_end>, <&charge_limit_delta>;

One item per line, please.

> +		nvmem-cell-names = "charge_limit_en", "charge_limit_end", "charge_limit_delta";

And here too.

> +
>  		/* Left-side rear port */
>  		connector@0 {
>  			compatible = "usb-c-connector";

-- 
With best wishes
Dmitry

