Return-Path: <linux-arm-msm+bounces-65548-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id EB204B095C5
	for <lists+linux-arm-msm@lfdr.de>; Thu, 17 Jul 2025 22:34:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5257F1AA5486
	for <lists+linux-arm-msm@lfdr.de>; Thu, 17 Jul 2025 20:35:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E621F223DE8;
	Thu, 17 Jul 2025 20:34:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cqYJL4ES"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A87220A5DD
	for <linux-arm-msm@vger.kernel.org>; Thu, 17 Jul 2025 20:34:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752784480; cv=none; b=bfBY/BnXOowjQoAuCZwOe5NaNAmqMtfAKwu0HQyhJjeALYuDiGDTLZfdRI9+RTs/TLy3clVjnwQbxfalUzlgDFnfYlxO4har5nyC0L96SQcVXYWFbCLrLgn+dB7OKsSBKGtMw/1vgTsG9A5/ixyPbWhhKddQ4HXKdkdaaZ92KP0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752784480; c=relaxed/simple;
	bh=hGJR3V/1tcHMB31VvpC4R8Zsvg2CwbMItsyk5iZAxy8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=JJUM/0i7T6zr+iz6EiPV/gFR0OV3rsIrFRvOu4gvUsx3M35p4ezoBKziRtg8JNJH0rI26MQbawBC+Ly/x+ToTaL4tHqR9fAgXDYOPvd3YEWGCnZRiGhZLhCs3ORfPxpfQ4GCsVR/w4RCGgn4iaq2xqPXrR1BuFe6Hoittzaz/NU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cqYJL4ES; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56HCoOqG007234
	for <linux-arm-msm@vger.kernel.org>; Thu, 17 Jul 2025 20:34:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	6kgP0d9tIR6NHctzVbidbhSLAjPMVFzktI4gkLXeKhY=; b=cqYJL4ESt1MD9auM
	Nrg42kIguegh6DhejQY0DnvxiAmqQzzhVtWUht+pNUGbe0C6SQcwPwf1ZzVM4rbE
	VlEIHpHPsYPwaAuPKBQ1QDjfAza5LT9R/pPT9TFRB4W3784Cq/qCuFlxbHTUVVIc
	kmrMI/ry8lDEyK4pOKBMI1ofO+fWqNKAaJPH0EOsZzPPdjMdNm7404nvC3duQ7nN
	fkG2Om5sqq3YOieAWk5LDh8xrw24vgVbHZpPsb9t8TIrH7aSaTbmgTwtZFD6QVuK
	7wsWZSARXvYXbwsEQXYTi7dmozJBtZ3dkLFY1OtVrVDQt2Dg8S9M1GRN7WqdE5TO
	T53f6A==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47wfcaa9ej-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 17 Jul 2025 20:34:38 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-6facbe71504so3166966d6.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 17 Jul 2025 13:34:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752784477; x=1753389277;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6kgP0d9tIR6NHctzVbidbhSLAjPMVFzktI4gkLXeKhY=;
        b=G4j0xqPtaGh23Kn0NDSPZdlbz/um8/iRL6slRL5Ho1/FqbMgGOGHrB9DrrecgdQ89x
         76TxmdsLvi2IkU0XnKybYP+yyUr5ckPJqF6H9b+e/wGzXLcZURk4bk3hTckNCSUtlkzk
         gm8GhWAB8mwnYJ/i0cshc3kSTPZgg2mqUuavfVGND9PPD2IpvAIXrXUTsBHMQ53hPYgB
         gkEZNGG05ivM8nUwg2HYAQQYCGZyxe41KD9IFuYeq6peLJJTsncx+CiOOqJjnqfdow2X
         qw6i/d4kb2ROCD5W8yREyezlTbHDTnH2FW6C8It12OV2mHdYFSHpdbHcOLMwSLJziYn6
         9ZeQ==
X-Forwarded-Encrypted: i=1; AJvYcCUrJ+E9MBq3Ssh0pUU6PbhREGYaO1WgXQ/YmMenLcJEyVY1P5DRMb9aLdP0vd9zvx6LRuzA7YlQCixPGqGA@vger.kernel.org
X-Gm-Message-State: AOJu0YzDB/PCua4DeKZfJsU23has9GFHcE6wZkTiHfIowR4aVjIXDTau
	7fgiIMBeCvUxaMo0K5KV9pVo5VyGFx2tIebDlWODg6LYLVDI4tel53cD6hAsgnigZ7uMQfYT//n
	KeECEXU5wm8/eonFa2nS7eQnuok0HJmBLdnzCylve+gXnfTCxZwbJ3L+zM64Lh3lJWkrC
X-Gm-Gg: ASbGncvzMfrVDE43xpYnPmZuf6qkA0NZQAbPNJVo0eP3Mv3Q4NpIkxZP3mJGmiwW4l7
	lt43+3a+xhG9yxP+vdap16U8tdeIfTt0g4oF7JzNNdiMFvniSzgSFT2Xk4I8B1n2gP77zGdtoC7
	T5rl1KjKSdJsFgD5drwDhhmhWVTTCs1yayGsofecoY2RbyxXzMVQcEhN6bUIP0zT8PB8U8Q99zj
	XpHlTkzLEQyiaN64b4iwaOZI6fwxb4NzZYkNBvc3zoI6Iur7aMPhp1Mg9KWbgZbHnnMNuUW3qNH
	tWdg7TNrDazcJSWwYuHIgxufMv4Di1rFw51T9qScBXqKg+HKMf0Z+tjVe6Vca2QozV3X283JeWB
	sqei3Uq+sZHTy3YQKnjSx
X-Received: by 2002:a05:620a:2b49:b0:7e3:3419:90d with SMTP id af79cd13be357-7e342adfc02mr465486785a.7.1752784477313;
        Thu, 17 Jul 2025 13:34:37 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEupMN70iJ4oocSBV5jSP32Z5K9i0re731zgAYdP0kVX56HgTG8n+/PmtNQbmI3Nu0wihezSw==
X-Received: by 2002:a05:620a:2b49:b0:7e3:3419:90d with SMTP id af79cd13be357-7e342adfc02mr465484885a.7.1752784476917;
        Thu, 17 Jul 2025 13:34:36 -0700 (PDT)
Received: from [192.168.143.225] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae6e8264fbcsm1437115666b.75.2025.07.17.13.34.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 17 Jul 2025 13:34:36 -0700 (PDT)
Message-ID: <27e4a27d-6e91-4e91-b55f-d6aa4a5be800@oss.qualcomm.com>
Date: Thu, 17 Jul 2025 22:34:33 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 08/15] arm64: dts: qcom: x1e80100: Add MIPI CSI PHY
 nodes
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Robert Foss <rfoss@kernel.org>,
        Todor Tomov <todor.too@gmail.com>,
        Mauro Carvalho Chehab
 <mchehab@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org
References: <20250711-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v7-0-0bc5da82f526@linaro.org>
 <20250711-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v7-8-0bc5da82f526@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250711-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v7-8-0bc5da82f526@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzE3MDE4MSBTYWx0ZWRfX6lAXucYV2qDo
 1lX/1AMGD4rU6ahi59J3FXkG1jLywwFQOrIv0KzIuSMZNfIg/FvQI2q5k1k94LGmlsGhJXFLzw0
 rL+OJ5KkpOW002Eg1vfxgIgk6774RjPX1hA+VGm9VWN1xEnRH1vM+Mn7QQN+wJcG6mZIlDVt2el
 dwha1MdTS49LL1QhBYPQjes120MhRw/XmwjbGHobTrhOEtLOgoyr+UH1yChu/K2KqBlRKa0kH2w
 iaiudRC4cPLy1/mYp67rD1V607bYOb70ANxwhFtRPDq09PZFttBxo8gD8ST74trEvdSS9yXDehX
 6HuANKBg+dMBLeus0IGK0DXiU444LIAZn8Ifgrqvu5xjKDtSqyuGWvRwVyS86Mhgj/ovHd9Jtxc
 i9GmX7z5MQRHeFc5iPv/exs4PDBsCDY+Z37fkve9gGubWUROUAkh8hLFeHSKghfsryKP7wTc
X-Proofpoint-GUID: 0aHXT9m5QkBHSzfwI0Owd-4MA9EEzmzx
X-Authority-Analysis: v=2.4 cv=SeX3duRu c=1 sm=1 tr=0 ts=68795e5e cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=KKAkSRfTAAAA:8 a=jM4f9QFlUBkeW2BXBzcA:9
 a=QEXdDO2ut3YA:10 a=OIgjcC2v60KrkQgK7BGD:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: 0aHXT9m5QkBHSzfwI0Owd-4MA9EEzmzx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-17_03,2025-07-17_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 mlxscore=0 priorityscore=1501 bulkscore=0 phishscore=0
 lowpriorityscore=0 mlxlogscore=999 impostorscore=0 clxscore=1015 adultscore=0
 suspectscore=0 malwarescore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507170181

On 7/11/25 2:58 PM, Bryan O'Donoghue wrote:
> Add csiphy nodes for
> 
> - csiphy0
> - csiphy1
> - csiphy2
> - csiphy4
> 
> The irregular naming of the PHYs comes directly from the hardware which for
> whatever reason skipped csiphy3.
> 
> Separating the nodes from CAMSS as we have done with the sensor I2C bus aka
> the CCI interface is justified since the CSIPHYs have their own pinouts and
> voltage rails.
> 
> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> ---
>  arch/arm64/boot/dts/qcom/x1e80100.dtsi | 88 ++++++++++++++++++++++++++++++++++
>  1 file changed, 88 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/x1e80100.dtsi b/arch/arm64/boot/dts/qcom/x1e80100.dtsi
> index 41245e8592f78edf141141f2f5b7c5b841318f46..e385d6f329616360e089ba352be450c9eca6aab6 100644
> --- a/arch/arm64/boot/dts/qcom/x1e80100.dtsi
> +++ b/arch/arm64/boot/dts/qcom/x1e80100.dtsi
> @@ -5244,6 +5244,94 @@ cci1_i2c1: i2c-bus@1 {
>  			};
>  		};
>  
> +		csiphy0: csiphy@ace4000 {
> +			compatible = "qcom,x1e80100-mipi-csi2-combo-phy";
> +			reg = <0 0x0ace4000 0 0x2000>;
> +
> +			clocks = <&camcc CAM_CC_CAMNOC_AXI_RT_CLK>,
> +				 <&camcc CAM_CC_CPAS_AHB_CLK>,
> +				 <&camcc CAM_CC_CSIPHY0_CLK>,
> +				 <&camcc CAM_CC_CSI0PHYTIMER_CLK>;
> +			clock-names = "camnoc_axi",
> +				      "cpas_ahb",
> +				      "csiphy",
> +				      "csiphy_timer";
> +
> +			interrupts = <GIC_SPI 477 IRQ_TYPE_EDGE_RISING>;
> +
> +			power-domains = <&camcc CAM_CC_TITAN_TOP_GDSC>;

I realize it may not be easy to test their functionality without the
rest of CAMSS being enabled, but are the CSIPHY's registers accessible
without the TOP GDSC being enabled?

Konrad

