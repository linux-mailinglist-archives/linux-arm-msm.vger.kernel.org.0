Return-Path: <linux-arm-msm+bounces-87646-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 81267CF73C1
	for <lists+linux-arm-msm@lfdr.de>; Tue, 06 Jan 2026 09:11:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id ACF953003517
	for <lists+linux-arm-msm@lfdr.de>; Tue,  6 Jan 2026 08:11:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 38F923128B2;
	Tue,  6 Jan 2026 08:06:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lY4Bdotd";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="AaGtXGHG"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C687A3101A8
	for <linux-arm-msm@vger.kernel.org>; Tue,  6 Jan 2026 08:06:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767686776; cv=none; b=iXaqUwNxQP9BhY3Fcqqe0Y89s7JVFNjW7T1Bsnoux7WwQF4PVwoqHCnWWTzW41hbgTA8fE5gYlaapaaFfpMfZxHVBeAzdHYAxn183TK6VbCiiljfVUph/qwr6a8Szvxdzg3R/drwLX/b9LD6YKjMoW1S6JcXNcdUV7flQQ4MISE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767686776; c=relaxed/simple;
	bh=JliHDsyED+nvyuQdO2GfM/Iwne0NQIQy5a33rxLtIJw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=G960mJR/ezVrtWLqyhIRcVUwDjz9aCu8rK3RxpA46bRcn/HiqvXc5ANIc25DsBYmlS+Q33mpRgkVwXoXim2NszY89UXCwbfBbmiTd6unZGQ9IPCkqkJZxMJ/M4rlDldM1tWaha+8d+l4gBwCyIcUhsXYFmjrSdh8ghs8KhQJPfE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lY4Bdotd; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=AaGtXGHG; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6063QYUh2923098
	for <linux-arm-msm@vger.kernel.org>; Tue, 6 Jan 2026 08:06:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	fBLvYbjia7Zx15toxuviBzFdghPbIpWd7juKJdfiCV8=; b=lY4BdotdIPWJvDRN
	qhx5ZUs9w9vfsvZEI/1BVeFOeDYdcph4nMFD1RUuv60XQ7Gn2e0UYIbkY6FtLXU5
	PwPXRGsUowDTu+R+sDPweINeto3DBjiATDi1dzqADdESSlS84bUxTJa7eCB3BwmE
	CL0ejNjraD+CDNUZV8DI7pUTcy5kyoKEkseF5Rdo3x33zQFAokS6f3Gj0TYgs9W/
	CUuIwpss27V5wjtHZASCh2NPKO3FIKJjZH1dOOA5I9qi6ByQSya5C7EQ6djn6GQm
	Dq85OgjS4CBi8IATqyTTfZCL/ugd0FNSOEVs5K0Jv6D4bRcY/p0F50Nz0V5SDkL5
	AXLzrg==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bgscy8wcn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 06 Jan 2026 08:06:13 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-7f66686710fso2263099b3a.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 06 Jan 2026 00:06:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767686773; x=1768291573; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=fBLvYbjia7Zx15toxuviBzFdghPbIpWd7juKJdfiCV8=;
        b=AaGtXGHG/5IfSKS5ta+I/ekUoyQ+yJLoTl9vUc9LGkb1BeT9ebZKfEqv3ODDosH6L4
         FoQWSx9j1/x4Ez/a9tWzIL/QxcxeHBVAg5C9Cl49U6gc+StL+tPWdXcAsaxbwQEz9pV5
         sa1QnbfqEGU5ltcZvqUEkzphtWqtZs6qoZ49oC3jecj7aZfwPaDPKlxBilyUFd4T0tD/
         uGhirzvOOtv4MFroV94Gd5gS40jNDatEhCTIAhb0455pn4wD+yDtVVjaAoLn0pHXG2ZZ
         5PLJEEoz5AA96xhKZ1ucfhLhg6RfRP9G9mg+yDuIwu0vBywSaIObgiknSORR21h4Y3Ef
         X+5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767686773; x=1768291573;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=fBLvYbjia7Zx15toxuviBzFdghPbIpWd7juKJdfiCV8=;
        b=PZV1iwr3zKRgRM2aacBt8Np+YimQjbfBsvqKdhvD+/NC+iRMvDXsOntdD3atUpYiZP
         /XqemE4UYGBaW3kQLgJFcolQoa+x0USglyD7qjKNaCMqfYTsdFOJjc1+LX6YP1IV3rkY
         uoPE5l+ZmtUexuEDxijVs7H6O7CdpEwgY3hHn3b1sEBUA8EmBzcg/RFC6lT6BwIKH8T0
         BkLAOxrgBQFYGlhUo45X8lgAq9cyT3xQH6ZUP6KiGXbbW02+ItdQxYHNYXo0QU+aQHlW
         Lmi2DH9++mHeWNHMDWcFFbor6R2CDMTl4hS/FOfFXVgfF2wHCe9HmBv4uU9fShnqzwQm
         3U3Q==
X-Forwarded-Encrypted: i=1; AJvYcCX8fxhUitNUsl7/BOABpHDbUSpg1g5tS839R2wA5lMA9EOznBzCd2Bik613/KEjGptJuqKW2REAnJvVyk8u@vger.kernel.org
X-Gm-Message-State: AOJu0YxPFvOKZBvB6R0R0XMvV/k9oY5hKGwJY9hcREvjLbDD2Lyv42Dl
	+gOIkFpAoVQ+7JR+cWSzO1jrjVWKSpOmxdlwfGlrCM6qXSjtVKFNhSaEWisCuFxdUsIXe15N+1/
	tnDnMxi1IyB3GMplOeV31dhWSEHMo3b+eZFxBM54aMf0TFZTRLoPuUBHJVMVBrLZEu2I5
X-Gm-Gg: AY/fxX6zmBrQOQ2ctpqLLkEYgWTKOL3TW2kZ5nFutDDhqGKfX9SfDOLTDpznD4tu8pQ
	J+cPNebbfd1Fe9RxdWBdnW6m/635KNsCqz8jz8LKZCydMvCG1+bCgp4htL9a5Kuwh/2Gdyv2ps9
	mLNuRJGhDoP6jZ1D7k5KcsHpG/5NKfybcXc1/2pbCOjlG8Abm1ZL5IYftNzlNJ9XCsMbE/XgPUT
	5xdM3upO8otybJVysAtrDX2tgASQIAneczxrE4lYtjP54YHWFsjs5cWi8XaPLagvdLaF4c6gqBA
	8/H1eRwbckk9KZs5PAO1FGK1kwICHgseNCycMZD+DrktgNsMoH2VrFE65DrKPZI5dAiEjjZETfl
	wSGSSJcdMGOPrp4HAWvLpVKeb
X-Received: by 2002:a05:6a00:4aca:b0:7ab:5e68:e204 with SMTP id d2e1a72fcca58-81881c1cbe5mr2106309b3a.29.1767686773348;
        Tue, 06 Jan 2026 00:06:13 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHnIvU+mez27fS+2D8szOamRUo7e/Jgvc5qiA358vWvyrCdGSG0aUyAo1P8uI6IzXwYa5/Wxg==
X-Received: by 2002:a05:6a00:4aca:b0:7ab:5e68:e204 with SMTP id d2e1a72fcca58-81881c1cbe5mr2106283b3a.29.1767686772845;
        Tue, 06 Jan 2026 00:06:12 -0800 (PST)
Received: from work ([120.60.56.175])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-819c5adf1cfsm1310881b3a.57.2026.01.06.00.06.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Jan 2026 00:06:12 -0800 (PST)
Date: Tue, 6 Jan 2026 13:36:06 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
To: Pradeep P V K <pradeep.pragallapati@oss.qualcomm.com>
Cc: vkoul@kernel.org, neil.armstrong@linaro.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, martin.petersen@oracle.com,
        andersson@kernel.org, konradybcio@kernel.org,
        taniya.das@oss.qualcomm.com, dmitry.baryshkov@oss.qualcomm.com,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-scsi@vger.kernel.org, nitin.rawat@oss.qualcomm.com,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
Subject: Re: [PATCH V3 3/4] arm64: dts: qcom: hamoa: Add UFS nodes for
 x1e80100 SoC
Message-ID: <7gi7sh5psh5v4y5mrbgln6j2cjeu5mogdw2n3a6znjtqyjcyuk@kxpe566v57p3>
References: <20260105144643.669344-1-pradeep.pragallapati@oss.qualcomm.com>
 <20260105144643.669344-4-pradeep.pragallapati@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260105144643.669344-4-pradeep.pragallapati@oss.qualcomm.com>
X-Proofpoint-GUID: MLSOVAiHj4pRNP1Vg2wQj6oCTgUiY4mT
X-Authority-Analysis: v=2.4 cv=fOw0HJae c=1 sm=1 tr=0 ts=695cc275 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=JR4DBjdY6jk8CmbmB73bTw==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=Xq6n2yl2rRB09oYrCm4A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-ORIG-GUID: MLSOVAiHj4pRNP1Vg2wQj6oCTgUiY4mT
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA2MDA2OCBTYWx0ZWRfX85qT+I6US++2
 wD4piZeMovrR1PTnNGqjp81Z7yfBHV/hZnffAClUI6I5Dznm0tTS9qXyMrdWUYb4/maKB1H+PR/
 ehGCeuueLGELwsytxMO6qDI2Q2CfmtvnO8I/45VZ1fanTicRCPGL1VVsJbuxUH7oyKHQqU9WbHu
 1F6uJTlv/BQvU8ZV06HxbhPh+c9xaDMwY3Ocfbm9+o5H0ENcJ6FfYx5/x4XNgcqd178YEK2C9Xn
 whJaLeFomrn0ubmAAsUqgGJBAas+l4myZOaCoEoaIX4cEUyfO/QtJWzakM5ohNqaO1379xxo25a
 1S0XETHBvsE0qFsPYwT3YytJiw07dACmMtKFthLrLHfwUagE51lndwxYpIffm4d8DVr/MCKyIte
 8USFmdD6E/my9sIFOQI98E1l6NCqCNjQgWecgQV+5cqYq8RcvRv6CHCImUWST+4dPX5bpaoFlVy
 pnSPCo6Xl7jAoHvfBaw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-05_02,2026-01-05_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 suspectscore=0 bulkscore=0 malwarescore=0
 lowpriorityscore=0 adultscore=0 phishscore=0 spamscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601060068

On Mon, Jan 05, 2026 at 08:16:42PM +0530, Pradeep P V K wrote:
> Add UFS host controller and PHY nodes for x1e80100 SoC.
> 

Minor nits below. With those fixed,

Reviewed-by: Manivannan Sadhasivam <mani@kernel.org>

> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> Reviewed-by: Taniya Das <taniya.das@oss.qualcomm.com>
> Signed-off-by: Pradeep P V K <pradeep.pragallapati@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/hamoa.dtsi | 123 +++++++++++++++++++++++++++-
>  1 file changed, 120 insertions(+), 3 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/hamoa.dtsi b/arch/arm64/boot/dts/qcom/hamoa.dtsi
> index f7d71793bc77..33899fa06aa4 100644
> --- a/arch/arm64/boot/dts/qcom/hamoa.dtsi
> +++ b/arch/arm64/boot/dts/qcom/hamoa.dtsi
> @@ -835,9 +835,9 @@ gcc: clock-controller@100000 {
>  				 <0>,
>  				 <0>,
>  				 <0>,
> -				 <0>,
> -				 <0>,
> -				 <0>;
> +				 <&ufs_mem_phy 0>,
> +				 <&ufs_mem_phy 1>,
> +				 <&ufs_mem_phy 2>;
>  
>  			power-domains = <&rpmhpd RPMHPD_CX>;
>  			#clock-cells = <1>;
> @@ -3848,6 +3848,123 @@ pcie4_phy: phy@1c0e000 {
>  			status = "disabled";
>  		};
>  
> +		ufs_mem_phy: phy@1d80000 {
> +			compatible = "qcom,x1e80100-qmp-ufs-phy",
> +				     "qcom,sm8550-qmp-ufs-phy";
> +			reg = <0x0 0x01d80000 0x0 0x2000>;
> +
> +			clocks = <&rpmhcc RPMH_CXO_CLK>,
> +				 <&gcc GCC_UFS_PHY_PHY_AUX_CLK>,
> +				 <&tcsr TCSR_UFS_PHY_CLKREF_EN>;
> +
> +			clock-names = "ref",
> +				      "ref_aux",
> +				      "qref";
> +			resets = <&ufs_mem_hc 0>;
> +			reset-names = "ufsphy";
> +
> +			power-domains = <&gcc GCC_UFS_MEM_PHY_GDSC>;
> +
> +			#clock-cells = <1>;
> +			#phy-cells = <0>;
> +
> +			status = "disabled";
> +		};
> +
> +		ufs_mem_hc: ufs@1d84000 {

ufshc@

> +			compatible = "qcom,x1e80100-ufshc",
> +				     "qcom,sm8550-ufshc",
> +				     "qcom,ufshc",
> +				     "jedec,ufs-2.0";

Drop jedec compatible as Qcom UFS controller cannot fallback to generic ufshc
driver.

- Mani

-- 
மணிவண்ணன் சதாசிவம்

