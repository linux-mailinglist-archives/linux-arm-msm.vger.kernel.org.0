Return-Path: <linux-arm-msm+bounces-51608-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D015A64C82
	for <lists+linux-arm-msm@lfdr.de>; Mon, 17 Mar 2025 12:28:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id AEAAC7A2EC0
	for <lists+linux-arm-msm@lfdr.de>; Mon, 17 Mar 2025 11:26:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 36869236A84;
	Mon, 17 Mar 2025 11:27:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TwE+G+m9"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F0332356CE
	for <linux-arm-msm@vger.kernel.org>; Mon, 17 Mar 2025 11:27:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742210836; cv=none; b=jy8hORopUsZ7fXeyOqjGRSrHNjSstj+7ee/1wcaeRhmO8uanELrbyvIpZbHTf/23F8uO48i/2B2s7pDejyFsDX2mRO2pMyDnRzV32QA2NhG3YLNAnhFHsMK37LG2U1wo5KnLHqTkZyCGj1nWYtSR2G9W1DXfT2nr5JJWpdClFgU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742210836; c=relaxed/simple;
	bh=6UA2N1HycAzHdyBXj2hV0Vkl4hYOXqBQ8IHT1SkQ+8o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Z1VQ4Gz/aaosOuANnaw3+6msL/nOtrzbCkOYqvWj+MnDx6RrPOsfjI9oxIisPR4i6Gxli1bN0oKbEpkTdxU0nKN1BbOTU16kq2DzU27bGMPiuACJ6JsiL2mZ3W51/g43L1/1DOqolf3PhMWznDhaKjbTpM/hoxoWqlai6aP79wk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TwE+G+m9; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52HAEBYW006734
	for <linux-arm-msm@vger.kernel.org>; Mon, 17 Mar 2025 11:27:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=Xf6yYkUoom6JXgMS3bWVu0Y+
	wfVh+BbrIZCIrGujekA=; b=TwE+G+m9VUBMtiI1WzArZBSpve8xV4izfWSxTYTP
	Su5R0Op9Pcco0qbsf/0wlKhAIgy2StdarDwdA1QWiQK7nAu+JHeHAb5L+f5cHXCp
	Eekl4hZ4KZSc27ZQyb2HbFn2/Llb996Q0ppxghos6Z03Bf5XKHfn9w56tZpKCjBy
	ZL2tM3U4rrqpCGr6I7f0xnqC5JOUmIYnDBwA62BEkwmj7WJmb75Qg3nb0U0y7I2H
	V5iAnK7mQ9yT2CXjWG/7Hzut3/lWC+zjWXFkqg8J7fs5U8rMCL+Y1JPNtKH1yKFG
	PvM+6b6v1JsYnDCw8qBiJIbnSunRHzpVIjBq2eW365qDcw==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45d1t4mh6v-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 17 Mar 2025 11:27:13 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-6e8f99a9524so156122376d6.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 17 Mar 2025 04:27:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742210832; x=1742815632;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Xf6yYkUoom6JXgMS3bWVu0Y+wfVh+BbrIZCIrGujekA=;
        b=WjXQYZ4F2fZogFajbecj6H/NzdZov0ATxgASRyrgEXdTLljd03Xg8pOB7SfiezcGBw
         amUgipyfHwzEPHONezTyjCLU+J4Re2IonxamUYXepoHcsBq0fuFTcz3hEVctEGulLhVJ
         jp+Y02ZWKj4OG7WY0bxTmoGkMdKKbG276UOA4ssDrTQq0UERzU/nb3IQhPyumq8aT3J8
         aQjP5+91NbgniD7fiRmQFXsQgNQI1pDrHT9BrFxR3jd7/NiNhduYNJJZY2KcIkL4ssMT
         BZFtQeKS7Y5wAj2Z3PoPP8oxVIIfJgtxu7weJujMjILs/eP2ffoT2IZHGRHsWlHfcx8f
         q5Ew==
X-Forwarded-Encrypted: i=1; AJvYcCWFVp78jW6dHqcIyugGPrM3DqyCu3EM0bXW+gdOTyB320TdXsG0WZCWvLhqklrt9fL2+ZsibIgGMHxO9HOv@vger.kernel.org
X-Gm-Message-State: AOJu0YwSfkeUAV4MXjrjpX8ajwMSUFSd4/Un85sFkAIGR3FozFXIr+Y4
	uqMqTybimDrh+ON4RHe1YSEV/1Ho546Rd4efMDAYkCZqdVzXNCspqqvrLAP0d50Nje/bjE+UINs
	9YFvHSfyzllzsGGNPV38VwKmOv/SI1vmgnoZ/oABjJxEjG9TjKmEjPtpDyGRwwh18
X-Gm-Gg: ASbGncsy95ifB1YP8yYDzSi2F7TLLHwsPZXZDDI57cOAMLii3S9abAG8NTwEOLmkAAU
	5A+oJ4xsa2HOW053YMpZooQ7cudjeF/vkfuQvEi1wIk5ulEeI6jyehbFFCWrP/VPx5rju7edZDq
	PAO8nDR8AuvN3mGpJPNcony8cJQgMaJn4Y8z/HkamGLUDckmc7TdAwSxDK/S1GqxROs/QzuObCL
	HlXEz2o1WQxbEXWLkKB/8G9Uak3YW7dhBYt0ZC0Dc43L0bIZiy2i/a/wKrqhqhJncHYXB2Y7XpL
	XI/AiiwmMvM6MB11OzHgUzOoWHRn5SvnMZCC/9wX/K+VleXXzG6rFCdaxsi8AJclpTZYgYqRPod
	NPG0=
X-Received: by 2002:ad4:5aac:0:b0:6e6:6c18:3ab7 with SMTP id 6a1803df08f44-6eaeaa79941mr187578516d6.27.1742210832502;
        Mon, 17 Mar 2025 04:27:12 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEoLNZ+Ry/9fQ258pDNw/xw5XCzWAjsof6YNZ7L23EBqp0aDuy+yUy9BVnW3t9pBQNs7ZX+kw==
X-Received: by 2002:ad4:5aac:0:b0:6e6:6c18:3ab7 with SMTP id 6a1803df08f44-6eaeaa79941mr187578156d6.27.1742210832168;
        Mon, 17 Mar 2025 04:27:12 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-30c3f0e936fsm15484991fa.30.2025.03.17.04.27.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Mar 2025 04:27:10 -0700 (PDT)
Date: Mon, 17 Mar 2025 13:27:08 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Cc: Bjorn Helgaas <bhelgaas@google.com>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        chaitanya chundru <quic_krichai@quicinc.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        cros-qcom-dts-watchers@chromium.org, Jingoo Han <jingoohan1@gmail.com>,
        Bartosz Golaszewski <brgl@bgdev.pl>, quic_vbadigan@quicnic.com,
        amitk@kernel.org, dmitry.baryshkov@linaro.org,
        linux-pci@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        jorge.ramirez@oss.qualcomm.com
Subject: Re: [PATCH v4 02/10] arm64: dts: qcom: qcs6490-rb3gen2: Add TC956x
 PCIe switch node
Message-ID: <kao2wccsiflgrvq7vj22cffbxeessfz5lc2o2hml54kfuv2mpn@2bf2qkdozzjq>
References: <20250225-qps615_v4_1-v4-0-e08633a7bdf8@oss.qualcomm.com>
 <20250225-qps615_v4_1-v4-2-e08633a7bdf8@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250225-qps615_v4_1-v4-2-e08633a7bdf8@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=VLPdn8PX c=1 sm=1 tr=0 ts=67d80711 cx=c_pps a=oc9J++0uMp73DTRD5QyR2A==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=Vs1iUdzkB0EA:10 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8 a=HWuFypcHGqLN_zhzHr8A:9 a=CjuIK1q_8ugA:10
 a=iYH6xdkBrDN1Jqds4HTS:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: y0MmrKZ3C6C1KM3kzuJbeDjufvSPigx0
X-Proofpoint-GUID: y0MmrKZ3C6C1KM3kzuJbeDjufvSPigx0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-17_04,2025-03-17_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0
 priorityscore=1501 clxscore=1015 mlxscore=0 lowpriorityscore=0
 phishscore=0 mlxlogscore=999 impostorscore=0 suspectscore=0 malwarescore=0
 bulkscore=0 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2503170083

On Tue, Feb 25, 2025 at 03:03:59PM +0530, Krishna Chaitanya Chundru wrote:
> Add a node for the TC956x PCIe switch, which has three downstream ports.
> Two embedded Ethernet devices are present on one of the downstream ports.
> 
> Power to the TC956x is supplied through two LDO regulators, controlled by
> two GPIOs, which are added as fixed regulators. Configure the TC956x
> through I2C.
> 
> Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
> Reviewed-by: Bjorn Andersson <andersson@kernel.org>
> Acked-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> ---
>  arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts | 116 +++++++++++++++++++++++++++
>  arch/arm64/boot/dts/qcom/sc7280.dtsi         |   2 +-
>  2 files changed, 117 insertions(+), 1 deletion(-)
> 
> @@ -735,6 +760,75 @@ &pcie1_phy {
>  	status = "okay";
>  };
>  
> +&pcie1_port {
> +	pcie@0,0 {
> +		compatible = "pci1179,0623", "pciclass,0604";
> +		reg = <0x10000 0x0 0x0 0x0 0x0>;
> +		#address-cells = <3>;
> +		#size-cells = <2>;
> +
> +		device_type = "pci";
> +		ranges;
> +		bus-range = <0x2 0xff>;
> +
> +		vddc-supply = <&vdd_ntn_0p9>;
> +		vdd18-supply = <&vdd_ntn_1p8>;
> +		vdd09-supply = <&vdd_ntn_0p9>;
> +		vddio1-supply = <&vdd_ntn_1p8>;
> +		vddio2-supply = <&vdd_ntn_1p8>;
> +		vddio18-supply = <&vdd_ntn_1p8>;
> +
> +		i2c-parent = <&i2c0 0x77>;
> +
> +		reset-gpios = <&pm8350c_gpios 1 GPIO_ACTIVE_LOW>;
> +

I think I've responded here, but I'm not sure where the message went:
please add pinctrl entry for this pin.

-- 
With best wishes
Dmitry

