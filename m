Return-Path: <linux-arm-msm+bounces-51793-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id D71E5A67A30
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Mar 2025 18:01:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7437C3B35D9
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Mar 2025 17:00:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B0EAB2116FD;
	Tue, 18 Mar 2025 17:01:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="IgrPoCcP"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23863211464
	for <linux-arm-msm@vger.kernel.org>; Tue, 18 Mar 2025 17:01:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742317269; cv=none; b=olgcPBCJKwNT3ifUyyFkCaS746NrPFoY7VYEYsQs4TbWlKLXNVEx31Uizs2GMrut6XaSDt4tWBKvLulu3GqWBCJn93YFySHeJlD408pi3z8bV4CI1FzbVm8hwdHytkGF6wqVgI9TbIQO4VXU+XsieBUkVZ7Asaeiuy3ShDXj/Vo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742317269; c=relaxed/simple;
	bh=5YRH59i3/B7xwBfGl0fAC2tOhBLqq9TfHRpTHq8NO1c=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=K9F0H0WcexMhZN0YQrySucUTrvLKJXdNwKdw8bpMcRXjuSfIXgm994AwHGerIzvUl6nNYcwOE+vTJe7htZ6DX0+L70zOjglq5xW5wqR9r5PrA46rn19Ec2E5qpcP9LRpIpBU6c5+YRYepCv0Yv7vTMKomkkvLEMdxoijL+Xxfqk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=IgrPoCcP; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52IAGuiC028624
	for <linux-arm-msm@vger.kernel.org>; Tue, 18 Mar 2025 17:01:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=StafdzDurWimpaN7Jmu0PfeK
	ZDx8G4OwDsbuc8PNM9E=; b=IgrPoCcPYnheQSaGKkKIGiLW/xDjOFUsu2fmXJV6
	Eeg5lfM7fwxSJnPvlRthkilps+xbGSX8V66vhRQfXeQE6+eoOIrHe8IWnyRpzg9w
	/00ZFNZtxF3jtF79/l0N7xQzjfAqZWpIV/8KCMHPU1OU/0n05jpNfJPBJfOaT4G+
	qWL/CirAMECuZjnzcA7GI2zt0S3QPfI+s4Bdlh2YeW7KOEOUj722wag3/+My6UK5
	GqObDARGRTm0D7aQf8qa6FSNV6Z7VzN2+2hD6vzk1jBhHwoVZSTIEaYqEULXRLeP
	uqEzKY7qvd9MN2dgiSTzJ2jel5q91z+naqvbVz225h8JWw==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45d1sy0y5v-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 18 Mar 2025 17:01:06 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-2ff64898e2aso5012546a91.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 18 Mar 2025 10:01:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742317265; x=1742922065;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=StafdzDurWimpaN7Jmu0PfeKZDx8G4OwDsbuc8PNM9E=;
        b=TGnIplNoNlw9LPpMIFHzf0DjCfOtZPu8jE697Qj7XI+qDRa3/DOrrh/Bmivhr87tK/
         5X4FwJsumzTW6yiSl2jH90YnlierSXm15novlvLIEqqJjTZnWGaPgPBb0KVLudBdTQWm
         KO0pg3pBArO1/Xa5T9DLvb3EvWO+4i+FPjsBiSWI3a4MnVy9X0Np/uoXtjO90G4Yua/k
         pcQ0RH2wHr2ox9/F5W6KjRVnFKuAY7F5HvwuhcATBZqUvG0hQRty2maV3Gk7GA8g2NdO
         D2YM/+5NqjK5kpZjg9Vr6lOEzAb5Tl5wS2GKq5Zk4KBQN1nU7LDyJmUPKJIUenODGDeL
         l/WA==
X-Forwarded-Encrypted: i=1; AJvYcCVEJh5/CzG9B86/po/eCSwJ7KwmWogXaQZfb339FvW9Xlrt9Q1jZneGKNp8gHEl9wFqOWpYf/7e67JKPD3U@vger.kernel.org
X-Gm-Message-State: AOJu0Yzh2hOtZM8cC+igvnh0lupwOqvOXJ/in5PoSKc9LW9hcrvBZppU
	AG06LXdsSunD0Ajpa5dHP7Fu0QEbgsrW8wQ4e9sn+SFh5V4dbpkw2nBbo7g3LLZKrUiflnZjEDL
	rzeqCLKmMUl0NIMSMW+RX1GJHU/oIj2qdEUy2pgO9MRkX9bpyJT43+7Eq6989ytu37nKat0z9CS
	BdfnKDVCauRGL3Ku2OjAQm1kiosYsFCrhWOOPJAjs=
X-Gm-Gg: ASbGncsHi1Gn41bvJfGj6/IVLTRgZrzJwS+VdT8b5Ffr4f9YAfT9jCbis13Z5PGykHL
	54E07wL2lBKeUU2PdITpr1S/Iuj3+M8cMolzFiO865F1fQPKHmAr+kRlZs4quIYFwCthUa9VYUv
	VEhi96s8CROjgO2Z3aIY42vn2t6AY=
X-Received: by 2002:a17:90a:e7c4:b0:2ff:53d6:2b82 with SMTP id 98e67ed59e1d1-301a5bde7f8mr4505559a91.11.1742317263925;
        Tue, 18 Mar 2025 10:01:03 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG2mM99w8Yif66L5megEI3tCN8I1is5NdBdBjhAmcSxNUnHnOXDld02TDvQk6YE8NcQBxnvweP7i88nDW0PPE8=
X-Received: by 2002:a17:90a:e7c4:b0:2ff:53d6:2b82 with SMTP id
 98e67ed59e1d1-301a5bde7f8mr4505503a91.11.1742317263432; Tue, 18 Mar 2025
 10:01:03 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250225-qps615_v4_1-v4-0-e08633a7bdf8@oss.qualcomm.com>
 <20250225-qps615_v4_1-v4-2-e08633a7bdf8@oss.qualcomm.com> <kao2wccsiflgrvq7vj22cffbxeessfz5lc2o2hml54kfuv2mpn@2bf2qkdozzjq>
 <8a2bce29-95dc-53b0-0516-25a380d94532@oss.qualcomm.com>
In-Reply-To: <8a2bce29-95dc-53b0-0516-25a380d94532@oss.qualcomm.com>
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Tue, 18 Mar 2025 19:00:51 +0200
X-Gm-Features: AQ5f1JqVmcNBPDgEyh5aAISGonCmVLn-AMt1AX9j-2qGS6_UgHA5JMDqMgl1I_k
Message-ID: <CAO9ioeW6-KgRmFO93Ouhyx9uQcdaPoX3=mjpz_2SPHKiHh3RkQ@mail.gmail.com>
Subject: Re: [PATCH v4 02/10] arm64: dts: qcom: qcs6490-rb3gen2: Add TC956x
 PCIe switch node
To: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Cc: Bjorn Helgaas <bhelgaas@google.com>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kw@linux.com>,
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
Content-Type: text/plain; charset="UTF-8"
X-Proofpoint-GUID: t63R0-Q5OLLXYKM3UU_DhbCCDaWU9XWm
X-Proofpoint-ORIG-GUID: t63R0-Q5OLLXYKM3UU_DhbCCDaWU9XWm
X-Authority-Analysis: v=2.4 cv=XKcwSRhE c=1 sm=1 tr=0 ts=67d9a6d2 cx=c_pps a=vVfyC5vLCtgYJKYeQD43oA==:117 a=IkcTkHD0fZMA:10 a=Vs1iUdzkB0EA:10 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8 a=ccs1Irad_oSE8X62F2EA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-18_08,2025-03-17_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 mlxlogscore=999 priorityscore=1501 clxscore=1015 phishscore=0
 impostorscore=0 adultscore=0 mlxscore=0 malwarescore=0 suspectscore=0
 spamscore=0 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2503180125

On Tue, 18 Mar 2025 at 18:11, Krishna Chaitanya Chundru
<krishna.chundru@oss.qualcomm.com> wrote:
>
>
>
> On 3/17/2025 4:57 PM, Dmitry Baryshkov wrote:
> > On Tue, Feb 25, 2025 at 03:03:59PM +0530, Krishna Chaitanya Chundru wrote:
> >> Add a node for the TC956x PCIe switch, which has three downstream ports.
> >> Two embedded Ethernet devices are present on one of the downstream ports.
> >>
> >> Power to the TC956x is supplied through two LDO regulators, controlled by
> >> two GPIOs, which are added as fixed regulators. Configure the TC956x
> >> through I2C.
> >>
> >> Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
> >> Reviewed-by: Bjorn Andersson <andersson@kernel.org>
> >> Acked-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> >> ---
> >>   arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts | 116 +++++++++++++++++++++++++++
> >>   arch/arm64/boot/dts/qcom/sc7280.dtsi         |   2 +-
> >>   2 files changed, 117 insertions(+), 1 deletion(-)
> >>
> >> @@ -735,6 +760,75 @@ &pcie1_phy {
> >>      status = "okay";
> >>   };
> >>
> >> +&pcie1_port {
> >> +    pcie@0,0 {
> >> +            compatible = "pci1179,0623", "pciclass,0604";
> >> +            reg = <0x10000 0x0 0x0 0x0 0x0>;
> >> +            #address-cells = <3>;
> >> +            #size-cells = <2>;
> >> +
> >> +            device_type = "pci";
> >> +            ranges;
> >> +            bus-range = <0x2 0xff>;
> >> +
> >> +            vddc-supply = <&vdd_ntn_0p9>;
> >> +            vdd18-supply = <&vdd_ntn_1p8>;
> >> +            vdd09-supply = <&vdd_ntn_0p9>;
> >> +            vddio1-supply = <&vdd_ntn_1p8>;
> >> +            vddio2-supply = <&vdd_ntn_1p8>;
> >> +            vddio18-supply = <&vdd_ntn_1p8>;
> >> +
> >> +            i2c-parent = <&i2c0 0x77>;
> >> +
> >> +            reset-gpios = <&pm8350c_gpios 1 GPIO_ACTIVE_LOW>;
> >> +
> >
> > I think I've responded here, but I'm not sure where the message went:
> > please add pinctrl entry for this pin.
> >
> Do we need to also add pinctrl property for this node and refer the
> pinctrl entry for this pin?

I think that is what I've asked for, was that not?

-- 
With best wishes
Dmitry

