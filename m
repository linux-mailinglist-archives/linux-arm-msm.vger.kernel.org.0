Return-Path: <linux-arm-msm+bounces-60762-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id D11FAAD3495
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Jun 2025 13:09:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A119E3A9A71
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Jun 2025 11:08:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3C27828DF39;
	Tue, 10 Jun 2025 11:09:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TTvxENWB"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DEB828DF18
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Jun 2025 11:09:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749553745; cv=none; b=i/QTnd3MArniPzw1NiMbOUC1rW5qbJQQ/8Lc/1YXzloFEA8go4ElDvdqseEgZ7rgqwuUOupt5QRVtpIscAh1qUE3Yv218XtcWLX/P68ps0oSvAOiCHogsj5TS3rZmLQ9p1oKyUhqehq2c66LjyKJ3vanWyzwNWEH2RzpMKlpcnw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749553745; c=relaxed/simple;
	bh=OuxlYYpKRxD7usymkX2lfps+kKcWWYmdxYcWmu919Dg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GgtP8JGigNzkbZ20f1R2AU434AcdsOvOmnae67Xtk5U3SDn/O3N1BL+pFfLDY2der9jXjzVp9LZMc4RQ6NK2QyiJp6k0Yn3UrNnGW6RZeYrrmeB5mDTFwR/hb0sn7Umtr8e4TcHCHJm6PRy+50LQaQsiQsPka41Z303T3NbiaHc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TTvxENWB; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55A9XDRE022679
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Jun 2025 11:09:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=RRO1LVjJx/5BoAejkQrBHrD0
	HlTmpBzY0jUVoVo8gL4=; b=TTvxENWBt4wSO+/DbmHuJHde6djttEoNq+xx3FA5
	P+QbNGaCN9hZJcQDdYuUXMJohNAZ/M3yKraGfltPGp4Wa1tW5vCL4CtXFTWS86gP
	gG9vr58ZON6PNO55ym34wl2uQrGNQEkTfZ8XTqmHYmUtWX3UHYauflMsR5ItbTDF
	TYeO3p99IozZkHWlC9WUwXRG1o4cw8iFGfWpsDjo/C5ivuLD8K30Th0+y/NPI6yj
	a/gbq0c3TWWwX6qfvqjlzzKZsIlOFH4ggZ5WeOTPqdfR37rjD9bK1YSsSjU03iR+
	GgpKE0PS0tAREJevLQshnrIiReVSboWdF4Lhnwql9nzHuQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 474ekprwmk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Jun 2025 11:09:01 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7d097fd7b32so1288882085a.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 10 Jun 2025 04:09:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749553740; x=1750158540;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RRO1LVjJx/5BoAejkQrBHrD0HlTmpBzY0jUVoVo8gL4=;
        b=ed3haEoPRYy6Eq2c8zHrZ+DABHepB/9VOrnMHOpFEgfoNGJFhbrn7rpVMqy53MD9QZ
         nN9epCTO9pevgQ9dzSDoeXP/uS5BKkVMmIRspxF3IkZDwpgxw4/2MJlJkrhjNr1dGgk+
         aspTbz0yvy6YLozDmX9mgULrbLdbtKbODJrKw0z/wldHmfqPQfEKO88z3Hc2oeXgkRzp
         4hzqP5kQF5N6mFcqCKLG4qLGuFJ1BsaiL+ZWOhPpERnTT68m3naFoq5t6iRuSQL8VJcd
         iAP84WncFPJdZjSjFRlmpOMaq3Qe0zUgWOZM1rmJMUNZioTr74i36VdaTuBR3v7SdZ6+
         OiUw==
X-Forwarded-Encrypted: i=1; AJvYcCVsqkX3L3TBxzbZGrAt9NGMOxDumTWgiUZ/BJO9lQDYgej1vYkiSf0zCfRLBp0ZPU+QuKxY4ZVzWFIDQhXq@vger.kernel.org
X-Gm-Message-State: AOJu0YzMKJRdijnbP3mF4qCuXJpBlJ2d/cO5at9ATkJ7eEYW271KBe7N
	XW5QfnRPir6U71eTcj8ikL786kLp6LZp2k6ZI2l+MnETbjX+zrht7RxtwUNhGee66fclEkLxN4f
	xliE0v8mGyl5PX/fdl3kFbUEUyeGmwath4a1tSPV67SAMqp79Zmp7bphBk2T/BGM7vlwr
X-Gm-Gg: ASbGncuqIH0s8XE+1kqz7y2SSJP/daapZAzn9Y/iqosdwNwS2bROzmA4V6kkM+NniM8
	HXCwaw5rrYOOlZ4UW8OGgXErMej68Cfa9oBhOQ9K1OZATLNf/Ive+9Q65lchuShwed2vmffnAJz
	bc8JTlzhjT0E0+HmF/hVjjN7Kn5xEvMGcy/Qm5hLEp8KqeTsEVzkPl2Cems93cXVrPp7+4d2ukd
	b7u2n1VnzS/Z4uXWFUTT0mL4M/5+gZEe9HeXhhEu+6OfKFT90Ml/FE0Q2fv4UuRdUDd85KpaFjo
	6IQlHPWCivww5bHeTEe/a9rlCPZrrnw1LrYV4JLtzAqyXPJxR6RATXbHoQfxtowusc2O5E0sWpS
	XtPRC8UUCZa1WDy6LXqFqg4BmSmN5DvmJH/Y=
X-Received: by 2002:a05:620a:1a03:b0:7d0:a243:d5c5 with SMTP id af79cd13be357-7d229863013mr2388360085a.5.1749553740406;
        Tue, 10 Jun 2025 04:09:00 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFf2S/Xw7rHK+GuKet0+88mZ8uKvvupXT9KiOLqZgjzbbHszn9+Ms80XTWb/7xwX2+AEhOHdg==
X-Received: by 2002:a05:620a:1a03:b0:7d0:a243:d5c5 with SMTP id af79cd13be357-7d229863013mr2388357385a.5.1749553740038;
        Tue, 10 Jun 2025 04:09:00 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-55367733280sm1516525e87.240.2025.06.10.04.08.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Jun 2025 04:08:59 -0700 (PDT)
Date: Tue, 10 Jun 2025 14:08:56 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>, Rob Herring <robh@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH v2 2/2] arm64: dts: qcom: sm8450-qrd: Flatten usb
 controller node
Message-ID: <20250610110856.g5lv3p6engqwc6jk@umbar.lan>
References: <20250610091805.2997546-1-krishna.kurapati@oss.qualcomm.com>
 <20250610091805.2997546-3-krishna.kurapati@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250610091805.2997546-3-krishna.kurapati@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=JcO8rVKV c=1 sm=1 tr=0 ts=6848124d cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=6IFa9wvqVegA:10 a=EUspDBNiAAAA:8 a=07EEn82W8vC_Pu74Ip0A:9 a=CjuIK1q_8ugA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjEwMDA4NiBTYWx0ZWRfX8YBCiJUhxLzY
 RRh36+XsiGf64fNjUp9MYsN7ivHcInHo79GdIF5tcTHCactCUG6XxCbb8CvQaFAxOU+DKhIgjiK
 5hZUI9Q6zylS0GhjZeKiqB80O06Zo5Z8Ggpe1il1c0uUMBY3zSQeYe031vSMGylQzZrgw4hyyqx
 Gj9ZLIqJP8ODzObim38qPh72uCq/antylKrcbocQFLV/FwXiTmVp4nSF+t3TqoEZcmv+pgKzkc5
 kQuOxs/6pRQ3EbdBUgDB1NQp6NITO3CQNtpESpjqiDDPFimELIA5Ujz0ecz2hEDHhqEYqqevoxe
 WbXnz63Pmka3GzhSNbQxnNnTsP1IvSyYraIsAKZCsO5D0zhlBIaOy38l294OgSO6ugoR2BILfwc
 WkJdbxJVCszBHJhgS2Ec6Ir/MVekmop2dq+BdaqQt5+u/PuYlYK45pO99nSyMPxP8uO7NKbK
X-Proofpoint-GUID: qQzljSASkMmrC2PFf95vHQX1llhedNFd
X-Proofpoint-ORIG-GUID: qQzljSASkMmrC2PFf95vHQX1llhedNFd
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-10_04,2025-06-09_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=704 bulkscore=0 spamscore=0 impostorscore=0 phishscore=0
 priorityscore=1501 mlxscore=0 adultscore=0 clxscore=1015 malwarescore=0
 suspectscore=0 lowpriorityscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506100086

On Tue, Jun 10, 2025 at 02:48:05PM +0530, Krishna Kurapati wrote:
> Flatten usb controller node and update to using latest bindings
> and flattened driver approach.
> 
> Signed-off-by: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/sm8450-qrd.dts | 60 +++++++++++++++++++++++--
>  1 file changed, 57 insertions(+), 3 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sm8450-qrd.dts b/arch/arm64/boot/dts/qcom/sm8450-qrd.dts
> index 0580408485eb..bd6cb895b65b 100644
> --- a/arch/arm64/boot/dts/qcom/sm8450-qrd.dts
> +++ b/arch/arm64/boot/dts/qcom/sm8450-qrd.dts
> @@ -500,19 +500,73 @@ &ufs_mem_phy {
>  	vdda-pll-supply = <&vreg_l6b_1p2>;
>  };
>  
> +/delete-node/ &usb_1_dwc3;
> +
>  &usb_1 {
> -	status = "okay";
> -};
> +	compatible = "qcom,sm8450-dwc3", "qcom,snps-dwc3";
> +	reg = <0x0 0x0a600000 0x0 0x10000>;

All these properties should go to the sm8450.dtsi rather than rewriting
them in the board file.

> +
> +	/delete-property/ ranges;
> +	#address-cells = <1>;
> +	#size-cells = <0>;
> +
> +	interrupts-extended = <&intc GIC_SPI 133 IRQ_TYPE_LEVEL_HIGH>,
> +			      <&intc GIC_SPI 130 IRQ_TYPE_LEVEL_HIGH>,
> +			      <&intc GIC_SPI 131 IRQ_TYPE_LEVEL_HIGH>,
> +			      <&pdc 14 IRQ_TYPE_LEVEL_HIGH>,
> +			      <&pdc 15 IRQ_TYPE_EDGE_BOTH>,
> +			      <&pdc 17 IRQ_TYPE_EDGE_BOTH>;
> +	interrupt-names = "dwc_usb3",
> +			  "pwr_event",
> +			  "hs_phy_irq",
> +			  "dp_hs_phy_irq",
> +			  "dm_hs_phy_irq",
> +			  "ss_phy_irq";
> +
> +	iommus = <&apps_smmu 0x0 0x0>;
> +
> +	maximum-speed = "super-speed-plus";
> +
> +	phys = <&usb_1_hsphy>, <&usb_1_qmpphy QMP_USB43DP_USB3_PHY>;
> +	phy-names = "usb2-phy", "usb3-phy";
> +
> +	snps,dis_u2_susphy_quirk;
> +	snps,dis_enblslpm_quirk;
> +	snps,dis-u1-entry-quirk;
> +	snps,dis-u2-entry-quirk;
>  
> -&usb_1_dwc3 {
>  	dr_mode = "otg";
>  	usb-role-switch;
> +	wakeup-source;
> +
> +	status = "okay";
> +
> +	ports {
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +
> +		port@0 {
> +			reg = <0>;
> +			usb_1_dwc3_hs: endpoint {
> +			};
> +		};
> +
> +		port@1 {
> +			reg = <1>;
> +			usb_1_dwc3_ss: endpoint {
> +			};
> +		};
> +	};
>  };
>  
>  &usb_1_dwc3_hs {
>  	remote-endpoint = <&pmic_glink_hs_in>;
>  };
>  
> +&usb_1_dwc3_ss {
> +	remote-endpoint = <&usb_1_qmpphy_usb_ss_in>;

This is a part of the SoC routing, so it should go to sm8450.dtsi too.

> +};
> +
>  &usb_1_hsphy {
>  	status = "okay";
>  
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry

