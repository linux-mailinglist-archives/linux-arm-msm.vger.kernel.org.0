Return-Path: <linux-arm-msm+bounces-84856-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A9FFCB1A7C
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Dec 2025 02:51:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 7A13D30056C4
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Dec 2025 01:51:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C926838F9C;
	Wed, 10 Dec 2025 01:51:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="aMFCwmN8";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="WsHBODSz"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE1B6244671
	for <linux-arm-msm@vger.kernel.org>; Wed, 10 Dec 2025 01:51:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765331483; cv=none; b=tWJg4L5VoeaVzX/aMYMM1h/0ryVi5ps7kU21g4SlSDBkj9ss4fri8pkPnvhBp4/STIIC28RWQrxzS3q160fn62qXoEOrLlQj3/jeSDojub60sv6Ct2vlgbd3iW/gONXR+FDEBpszI5Lk8oTApltDPqJSq6XVlUbv3sal1Qpciao=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765331483; c=relaxed/simple;
	bh=Zlg/Hp012kGo5BAhJ/R1EBEd7rcNl8kLBQJYHiXNXn4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OM88tw4qh7bEypKcgEU/1UvWW+l6e5v23AIO7ebyjiOQDgEUaPWmg1+BX/n2vA3OOHbdRUekzETpzGyb+1Xn0Na7Yx+4YhqXTQx65uGYJ9/mjYwlDrVFOU1a0dL76+61OAJvFi/5ZBJe2Qpmu6sJ9n8B6xPKLkwaoMGdfCna1dc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=aMFCwmN8; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WsHBODSz; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BA0O7BN311014
	for <linux-arm-msm@vger.kernel.org>; Wed, 10 Dec 2025 01:51:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=BN6Y3dRzDAB252tWRqYve+DU
	r56IWk9EkE0pgVLLGis=; b=aMFCwmN80io33E3/NmsQd0JF+gqa0aGe7UDu8wDZ
	SBQeLPhUVcysxYIEatZIcVjQ/eIWRdeNuGVs1f1OaYvMxezsn+r+i61Z2im3fE2u
	soMT5iFr4BfmBRSC9pUDq2YfmDYeUf0NJlDLNx2QZtV0JRghFLXy3idYJ3eTiqyt
	Xb0jaHVep9Fri/tlnCO9Q1FaGKN38Ra404HrbzHGn6OX7Rim69PNQhwfESxoSDgm
	wAsSpu14lDgK3X6Xknf7Cq1Bnfhqa054sanAhZPbnwXqGWIpK0aNukNcUBF9xjWQ
	gK2NlQNa6FuwuKjVUNgSt5gWGzZEGRMGOG7FtW1/cmanCA==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4axwbf0fj7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 10 Dec 2025 01:51:20 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4ee168a520bso128485961cf.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 09 Dec 2025 17:51:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1765331479; x=1765936279; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=BN6Y3dRzDAB252tWRqYve+DUr56IWk9EkE0pgVLLGis=;
        b=WsHBODSz/Wih6zAecbue6QzOvlTHl2YOCtF9aoxUW3lnwReaiKQ1O5qOZ+e1z1sxtn
         I+KBs+1sGPMZ8lJvMjDWwifKTz+sSYZNIinreREajfzyt2UcIAk2YrBAnFpyEd0W/sa7
         8psURkjyc6c5lzC+xgvl5b4RM4fISPunBUnvmPTbFj350HMtUBVrPrV5HWM3/T9v9U+L
         5EHGSjFDju8CAhtNdosvC+0MqwRqMN5ngyD5e9F71pnHk/QhzNIQoLnDafbIBmWHXHel
         14VK34qS6kPT0/UzIJuZabQa1MdL8r/chhX9NdrsfzV3xFi8oSZnlypOIODwHeTMVGeF
         rpXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765331479; x=1765936279;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BN6Y3dRzDAB252tWRqYve+DUr56IWk9EkE0pgVLLGis=;
        b=CDtrlhjPQLkRajH33HV5Tsftu4SUr0WgaCRGdtFHDFKhBY32JwSNrOCmiv0vgp9vZR
         lxK14u1XiFfNfBzF+F7vHq6WKTmsY7KOuPM7bU0NsyvvhZeHSMYm6PjLCZ2B0t1547lR
         Kzy5EMsQjQPerdFznwA3MUwFGXEqlFUvTLFCL4+npXcoh0LOXXNxNp7ZdcYOcr9PUnaq
         E9n9eFr0tknnbm9R8fme6FX6GFDGERBVj+MJTLl8NVn6zG3wYEMHgTtdzkF0aFPcB3hi
         t6s/zDHbwBkCX92VmNtZ+hIN+sZfneKMo20brlB103NpvaWOdA/fCzL7t8HnlWeSyTM4
         xDEQ==
X-Forwarded-Encrypted: i=1; AJvYcCWIQCdN83QmMgi6qGSbHxkM0aht3nyi3rMTomkIraloUTUS+2Y03ZPb6hdrYuDrSXiRVZ8yxsQUgNrCzREc@vger.kernel.org
X-Gm-Message-State: AOJu0YwWsiOT05qL6sgus8Yice0EFL9vTZdsYZsmnTIpPylnCAFgfhkw
	YD1gQKi1cAGHnXKHtOaB/vmEACsedufT1zrzoc5JWuD8gmhVwUJGOFdDhahnhnz18YnQSvpQv/y
	yHkE8Hc7Ca1yejlh23xvfjmom3RCP6SLEmWxSp/QwDWeMrNWzsHX3x+9Et/O0eKUf9nly
X-Gm-Gg: ASbGncvIu/2DEYKKf/dnviMj/zevXTvQbOzvPq9itapmda7+9sYhIhO/WhPwgt4h94u
	ESswNsOZr3JVETIXlFfItY58KF/KrcJs2FG4VbYHkP3paTZ6k6qxRueAShM4xabR+A2Kgrs/yt+
	koX8vylSxk9wbfy1k3BB4ftc3Ehx6bVzNFRK6zFC69ZrO7cT2Jv+/hhpU9x+daVw3PWZEBYcmQo
	xfkSd8aEgwN3UvLIg0fhA2pjUQ/bhwqYRuqCjyvvSrXP/kBETPs27wiRjtrllM5FXqgkrnfzKJC
	ffELv3nWjSQSQ3CO1V7bNH2PY2ayJP97666HgXOH6wW3YscaP5iTx1rjZARsihYfAr8FnWyUELt
	61P2DxtTE8MauVsCjtnl6+j1JuSMxfJGvpeEiXW/FmgcUvLgVjP7Il3ppT03S/knd1+p3PFWA1s
	Nbr5u+pPfM2W7zti0XVnawsqE=
X-Received: by 2002:ac8:5810:0:b0:4ee:5aa:9c28 with SMTP id d75a77b69052e-4f1b1ac9555mr11516561cf.70.1765331479397;
        Tue, 09 Dec 2025 17:51:19 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGKDZfAbJZWDgNFtvZu50UhNEANWHUxZjw1ARuiOSUMkTBFY/KeHIBYtgGNZZYv/UykqneyFA==
X-Received: by 2002:ac8:5810:0:b0:4ee:5aa:9c28 with SMTP id d75a77b69052e-4f1b1ac9555mr11516331cf.70.1765331478854;
        Tue, 09 Dec 2025 17:51:18 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-597d7b24907sm5807764e87.37.2025.12.09.17.51.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Dec 2025 17:51:17 -0800 (PST)
Date: Wed, 10 Dec 2025 03:51:15 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Qiang Yu <qiang.yu@oss.qualcomm.com>
Cc: Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@linaro.org>,
        Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v4 5/5] phy: qcom: qmp-pcie: add QMP PCIe PHY tables for
 Kaanapali
Message-ID: <mudq7gmqs62osuarvflmemt2a2gnuloywabtr4w5oyyddp4b7v@eynaurtfrnyt>
References: <20251124-kaanapali-pcie-phy-v4-0-d04ee9cca83b@oss.qualcomm.com>
 <20251124-kaanapali-pcie-phy-v4-5-d04ee9cca83b@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251124-kaanapali-pcie-phy-v4-5-d04ee9cca83b@oss.qualcomm.com>
X-Proofpoint-GUID: MLt9MJ38BjRSvdtMAn46570PqmhX7pqT
X-Proofpoint-ORIG-GUID: MLt9MJ38BjRSvdtMAn46570PqmhX7pqT
X-Authority-Analysis: v=2.4 cv=f/dFxeyM c=1 sm=1 tr=0 ts=6938d219 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=JfrnYn6hAAAA:8 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8 a=prjBgqm01r1IDouUtvIA:9
 a=CjuIK1q_8ugA:10 a=kacYvNCVWA4VmyqE58fU:22 a=1CNFftbPRP8L7MoqJWF3:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjEwMDAxNCBTYWx0ZWRfX4HxND/4MXEmj
 8r8zTSwT5PHYzaCmyc1xDp4LuPjHg8U+wkKM7oBWuVQirwG62ByySkQ2GEM55C5iBsxg9lq0KxX
 yeC0HETRdNJAVy+rwmUv0jLoOHITlsyJn7j4CKOHZBhHD8O0G02JoclYxv4lKeotbPNVOc9thrW
 YX+bEPec034dSVK1fnlrTexyHpZljJhEGiZoM23BK6ChumJLv8pK2Esl6hvfRUVlLSZUZmdeW+5
 Xo16mTsyrAt+i7Wc6SXMcpErmvslvirdalbu4PGFkLPLbtt44Gz40HWHSFvu5dxbBVVzi3mnoiS
 LZijsjXqiFhPrHRks5NMQHdQJ0JPrHR/9+X/A1YMlwxygob3bmE2gmYoj03xodqDRpX1Uzo5klb
 edKEmubmC5rKHP4DLDvUXhdNf0PXgw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-09_05,2025-12-09_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 bulkscore=0 spamscore=0 impostorscore=0
 phishscore=0 clxscore=1015 priorityscore=1501 adultscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512100014

On Mon, Nov 24, 2025 at 02:24:38AM -0800, Qiang Yu wrote:
> Add QMP PCIe PHY support for the Kaanapali platform.
> 
> Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
> Reviewed-by: Abel Vesa <abel.vesa@linaro.org>
> Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
> Signed-off-by: Qiang Yu <qiang.yu@oss.qualcomm.com>
> ---
>  drivers/phy/qualcomm/phy-qcom-qmp-pcie.c | 194 +++++++++++++++++++++++++++++++
>  1 file changed, 194 insertions(+)
> 
> @@ -3363,6 +3516,16 @@ static const struct qmp_pcie_offsets qmp_pcie_offsets_v6_30 = {
>  	.ln_shrd	= 0x8000,
>  };
>  
> +static const struct qmp_pcie_offsets qmp_pcie_offsets_v8_0 = {

Is it really 8.0 or 8.20?

> +	.serdes		= 0x1000,
> +	.pcs		= 0x1400,
> +	.pcs_misc	= 0x1800,
> +	.tx		= 0x0000,
> +	.rx		= 0x0200,
> +	.tx2		= 0x0800,
> +	.rx2		= 0x0a00,
> +};
> +
>  static const struct qmp_pcie_offsets qmp_pcie_offsets_v8_50 = {
>  	.serdes     = 0x8000,
>  	.pcs        = 0x9000,
> @@ -4425,6 +4588,34 @@ static const struct qmp_phy_cfg qmp_v6_gen4x4_pciephy_cfg = {
>  	.phy_status             = PHYSTATUS_4_20,
>  };
>  
> +static const struct qmp_phy_cfg qmp_v8_gen3x2_pciephy_cfg = {
> +	.lanes = 2,
> +
> +	.offsets		= &qmp_pcie_offsets_v8_0,
> +
> +	.tbls = {
> +		.serdes			= kaanapali_qmp_gen3x2_pcie_serdes_tbl,
> +		.serdes_num		= ARRAY_SIZE(kaanapali_qmp_gen3x2_pcie_serdes_tbl),
> +		.tx			= kaanapali_qmp_gen3x2_pcie_tx_tbl,
> +		.tx_num			= ARRAY_SIZE(kaanapali_qmp_gen3x2_pcie_tx_tbl),
> +		.rx			= kaanapali_qmp_gen3x2_pcie_rx_tbl,
> +		.rx_num			= ARRAY_SIZE(kaanapali_qmp_gen3x2_pcie_rx_tbl),
> +		.pcs			= kaanapali_qmp_gen3x2_pcie_pcs_tbl,
> +		.pcs_num		= ARRAY_SIZE(kaanapali_qmp_gen3x2_pcie_pcs_tbl),
> +		.pcs_misc		= kaanapali_qmp_gen3x2_pcie_pcs_misc_tbl,
> +		.pcs_misc_num		= ARRAY_SIZE(kaanapali_qmp_gen3x2_pcie_pcs_misc_tbl),
> +	},
> +
> +	.reset_list		= sdm845_pciephy_reset_l,
> +	.num_resets		= ARRAY_SIZE(sdm845_pciephy_reset_l),
> +	.vreg_list		= qmp_phy_vreg_l,
> +	.num_vregs		= ARRAY_SIZE(qmp_phy_vreg_l),
> +	.regs			= pciephy_v8_regs_layout,
> +
> +	.pwrdn_ctrl		= SW_PWRDN | REFCLK_DRV_DSBL,
> +	.phy_status		= PHYSTATUS_4_20,
> +};
> +
>  static const struct qmp_phy_cfg glymur_qmp_gen5x4_pciephy_cfg = {
>  	.lanes = 4,
>  
> @@ -5209,6 +5400,9 @@ static const struct of_device_id qmp_pcie_of_match_table[] = {
>  	}, {
>  		.compatible = "qcom,ipq9574-qmp-gen3x2-pcie-phy",
>  		.data = &ipq9574_gen3x2_pciephy_cfg,
> +	}, {
> +		.compatible = "qcom,kaanapali-qmp-gen3x2-pcie-phy",
> +		.data = &qmp_v8_gen3x2_pciephy_cfg,
>  	}, {
>  		.compatible = "qcom,msm8998-qmp-pcie-phy",
>  		.data = &msm8998_pciephy_cfg,
> 
> -- 
> 2.34.1
> 
> 
> -- 
> linux-phy mailing list
> linux-phy@lists.infradead.org
> https://lists.infradead.org/mailman/listinfo/linux-phy

-- 
With best wishes
Dmitry

