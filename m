Return-Path: <linux-arm-msm+bounces-77159-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id E3551BD8BBE
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Oct 2025 12:22:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 7B5D74FD727
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Oct 2025 10:22:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E3B3B2F6598;
	Tue, 14 Oct 2025 10:21:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VOcEkjAA"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51F9A2F5A33
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Oct 2025 10:21:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760437318; cv=none; b=EBMyWTZBRJPnLRuJ+naa5SMYCJdbV6KhQujuNzRmEzdd4kIUoNfkvY8lxFhiWnktNEnNCNc0rJ5MaBbotiGuHZ2pgssjU5hTnbu3GcPCum/Qs19SlifJisYrNr7IPWrhjxFRPqAbQnNLUZmcYV5s2UmuQJzx7MEo+WRwGjU3YGs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760437318; c=relaxed/simple;
	bh=qzqeINd3TniuNVzah8+y5Pm00xrXr+NqqZ4nuDa0i34=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sZ3JJkdn76EC94ie01NnHzdyqbT3OPNFyRaqFPxram5D4dOysM7Hfx9E2cNiQCllwlsX+IDT8dYuch3t4kLws4n3/m8PGDry0Wa7EI2nvEa/mA2+9IuheGWZR8fvlKv89kOcGulU66oRzQDG+/ttxOmsmpeo6CpolyC3RKowf3E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VOcEkjAA; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59E87N1K001613
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Oct 2025 10:21:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=iNSQ6LRQ1Cbo1PkY0QhX/x6y
	YGsX22LMPrXlD4eZXtY=; b=VOcEkjAAYW3HxoXQJrAPoPRS1H0DpnKc1Ejl+suy
	45hI7iAXC+r1GPylGOksA/FHWeCB0X6xmINdZ2VDenqZooLgzv52c7zTi5xbWKoG
	cvbTgYI1NbSH4c5HkutAUJObwdEh+t5n/de+j+Xv8YaRjw0MvjDGOBjuHgw92uc9
	e6iDemj0fcTYqQw0lvNJfzoMYZDQELlqJ9Vqj+v95QJhasgsjK9luQjqsNhBBcB1
	9RxYv8WuhGvQ8HF4SllFM9pof2CaviPX+GHRZkPdhG5xtmFkK9hHPBf1sZwVQ2B9
	UrjDBDwLuHIFM9g8wVHZFCtFGCkSxg6ruESGA7LHVb0jTA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49qfdk81up-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Oct 2025 10:21:55 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-86df46fa013so3299729585a.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 14 Oct 2025 03:21:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760437314; x=1761042114;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iNSQ6LRQ1Cbo1PkY0QhX/x6yYGsX22LMPrXlD4eZXtY=;
        b=dibuNW2sfUgI8YKzft7rfLJpOFEU4xtIa38qObdYRS3wNtItsRjsWxjdAt32zeV8DA
         QZn1rjk9vb1OjlvzKX3R8US3roZtj3qFstDmPp8LamMu+y9lYsv7M2sJ5QXOo7Uq6UqW
         MzT4KWGk64iKFdmYnrSrgKWkEIcIuJtlu3+JJFeQVn82ta25a5evcxe4nWVrKL7cFvKJ
         jicoQoAdNJ+yH3aLnIS2jkwMxkdbKFwxhOwglb6puaMuOhi8hp6b93+lHmpDRMJQQmUA
         BZ5Z9QTNcud+ujBcPuOCQvKoOVRLuaKktQ8LJ6w8gmLTVe/2tzHRqImcoAhgUDcmsllu
         RhjQ==
X-Forwarded-Encrypted: i=1; AJvYcCVWeqvw/JgvRmoYSRs+VsfQD2O0IDKgmoS6IoLfGSpDUWBPwPXXZztAEPceA/BcT6B69pCxZEx78pqRG3NX@vger.kernel.org
X-Gm-Message-State: AOJu0YxIZVJSjR/AaLA84yFzJoTUkkc5sWGxJFmo0vfTJp0rScR68Veq
	tknZgTQALRm4571hySAfxRBaQalXlYiqrQf1gyULNMt06hdS7ass7wK4nlqbXYCUgD9RrCEPqII
	xAqe8CUMs5wuHsHYaY/hMTE+iTffxX4+3ItB4h54R4Yzf73UgBTsCkBb7U2sBRDuaOLCc
X-Gm-Gg: ASbGncvxcPPbZnkXB6bCbahQHzfqE14h4/fWgVHWTDXA/1qjfnhVXESXU5D2O69mOJ8
	U6WYvIRVugVe9xPB98W0SIjj3WS8MytwNKFcjSP5d/sIObGwKC4OuzeVAW9w8ZATCraF+Ddi95K
	WDLRuzUg8t4O8I8qb2Z5jlYPU/n2JjlRFtyOX8UoiFKu2UV+tUJXBzEURIpemurw6rU67l/4ej+
	f3begb5CmJrliyyga1yAyuM7NZdDr+h2zxPTIwvowqw92kb/LvzyPqRmlMa52xOTbY3UZuWwgUk
	5r8+tIjh9xnr1BivL0Drx6O4nehnntYJGDn3HAY1aLsj40L3kTnMCGTuft7nz1FjrtYurBmkXsZ
	hTgXlseeUVGqoJXtDcTHRdq6OhQcn8bVcFEXHQXF6NSfK7B68Vvj0
X-Received: by 2002:a05:620a:2981:b0:84a:f7cc:1eaf with SMTP id af79cd13be357-88350f575a5mr3980329685a.35.1760437314167;
        Tue, 14 Oct 2025 03:21:54 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGDMRw6EyVXSGprMYoPwa1DMLzUKICAtaPYbkxU2KjxKpjARAfamItqNhipppks0GQVOsrWYg==
X-Received: by 2002:a05:620a:2981:b0:84a:f7cc:1eaf with SMTP id af79cd13be357-88350f575a5mr3980327285a.35.1760437313692;
        Tue, 14 Oct 2025 03:21:53 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5908856e301sm5095511e87.93.2025.10.14.03.21.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Oct 2025 03:21:52 -0700 (PDT)
Date: Tue, 14 Oct 2025 13:21:51 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: xiangxu.yin@oss.qualcomm.com
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        fange.zhang@oss.qualcomm.com, yongxing.mou@oss.qualcomm.com,
        li.liu@oss.qualcomm.com
Subject: Re: [PATCH v2 3/3] arm64: dts: qcom: Enable DisplayPort on QCS615
 Ride platform
Message-ID: <kxwavurs7ebp5f22gxutvw4thwm24twqpahszhyxsodsikunja@7hl3y65ppqmo>
References: <20251014-add-displayport-support-to-qcs615-devicetree-v2-0-1209df74d410@oss.qualcomm.com>
 <20251014-add-displayport-support-to-qcs615-devicetree-v2-3-1209df74d410@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251014-add-displayport-support-to-qcs615-devicetree-v2-3-1209df74d410@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: Nx9yxubTJ_xtWx1c8i6GEnGkqZ-k02ob
X-Authority-Analysis: v=2.4 cv=MrNfKmae c=1 sm=1 tr=0 ts=68ee2443 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8
 a=552JS0bYzuNWtSTagGgA:9 a=CjuIK1q_8ugA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-GUID: Nx9yxubTJ_xtWx1c8i6GEnGkqZ-k02ob
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDExMDAxOCBTYWx0ZWRfXx1C00fCPt0zb
 zUgZdoxTZw0FjKXp2nK8usHJA8y4F39oKLe8km18KeLYGUddd7CoG9V1ZXWS76mgKbqNOvW8eBm
 P7Hq0KpJTXzzTOvx/G7/8LIdie20CobyCFHiDcPBNjJEH8t7Ikx+P4UDPPz9YDJTV3N/fXE6kkS
 vn2n9R+Jg0pTXUQj1Ac05xNgeIRU5QhwY7+seyBDa4T506EinEz4J6MuRYuaFV14T2yEWbDQatd
 2VAThz1WEU900ZXIUCwCPy+W/wBWkNtULi+p2CMdzrlOuf4tIRI2psKeeYhLbyNlL3ZA5lS1+Sa
 oChgB6pFoWupXsSopir2SyHE165yjBtWNHYVZqJQ+8WtgtyMZR32JNaKc0JAUr1sv3jQV/qgnFH
 vDKD9S5kD3HjW2380Uc6PXf5R2H42Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-14_02,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 clxscore=1015 adultscore=0 phishscore=0
 impostorscore=0 priorityscore=1501 malwarescore=0 lowpriorityscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2510020000
 definitions=main-2510110018

On Tue, Oct 14, 2025 at 05:42:12PM +0800, Xiangxu Yin via B4 Relay wrote:
> From: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
> 
> Add DP connector node and configure MDSS DisplayPort controller for
> QCS615 Ride platform. Include lane mapping and PHY supply settings
> to support DP output.
> 
> Signed-off-by: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/qcs615-ride.dts | 31 +++++++++++++++++++++++++++++++
>  1 file changed, 31 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/qcs615-ride.dts b/arch/arm64/boot/dts/qcom/qcs615-ride.dts
> index 9ac1dd3483b56f9d1652f8a38f62d759efa92b6a..0b8bcabdd90a0820b1f9c85e43b78e40eb8a9a38 100644
> --- a/arch/arm64/boot/dts/qcom/qcs615-ride.dts
> +++ b/arch/arm64/boot/dts/qcom/qcs615-ride.dts
> @@ -39,6 +39,20 @@ xo_board_clk: xo-board-clk {
>  		};
>  	};
>  
> +	dp0-connector {
> +		compatible = "dp-connector";
> +		label = "DP0";
> +		type = "mini";
> +
> +		hpd-gpios = <&io_expander 8 GPIO_ACTIVE_HIGH>;

Not the gpio102/ 103 / 104? Interesting.

> +
> +		port {
> +			dp0_connector_in: endpoint {
> +				remote-endpoint = <&mdss_dp0_out>;
> +			};
> +		};
> +	};
> +
>  	dp-dsi0-connector {
>  		compatible = "dp-connector";
>  		label = "DSI0";
> @@ -423,6 +437,16 @@ &mdss {
>  	status = "okay";
>  };
>  
> +&mdss_dp0 {
> +	status = "okay";
> +};
> +
> +&mdss_dp0_out {
> +	data-lanes = <3 2 0 1>;

It's not a board peculiarity. All QCS615 / SM6150 devices are affected
by this twist. Please move this to the SoC DT file.

> +	link-frequencies = /bits/ 64 <1620000000 2700000000 5400000000>;
> +	remote-endpoint = <&dp0_connector_in>;
> +};
> +
>  &mdss_dsi0 {
>  	vdda-supply = <&vreg_l11a>;
>  	status = "okay";
> @@ -623,6 +647,13 @@ &usb_qmpphy {
>  	status = "okay";
>  };
>  
> +&usb_qmpphy_2 {
> +	vdda-phy-supply = <&vreg_l5a>;
> +	vdda-pll-supply = <&vreg_l12a>;
> +
> +	status = "okay";
> +};
> +
>  &usb_1 {
>  	status = "okay";
>  };
> 
> -- 
> 2.34.1
> 
> 

-- 
With best wishes
Dmitry

