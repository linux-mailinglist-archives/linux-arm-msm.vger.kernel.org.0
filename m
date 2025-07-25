Return-Path: <linux-arm-msm+bounces-66697-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id F0911B11CF5
	for <lists+linux-arm-msm@lfdr.de>; Fri, 25 Jul 2025 12:58:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BB9424E7758
	for <lists+linux-arm-msm@lfdr.de>; Fri, 25 Jul 2025 10:58:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8EAC214A4F9;
	Fri, 25 Jul 2025 10:58:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OTFs5W29"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAFFB2E5419
	for <linux-arm-msm@vger.kernel.org>; Fri, 25 Jul 2025 10:58:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753441134; cv=none; b=drYwGu2mZdR6OuYXm+WPRxpkqwzTVi/CcbwOyZY41z8sN66mDSHbBw8pHas8KTJfmQD+vJp0X+YqMF+maAZgs7RRQ2YMFjGUjVUDnux+rvVtewOPzxlJFmduIi+SKLeRXwY/GuS46AvzxnjwO+wotPyiVFkQNGqap9vf6nek4GM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753441134; c=relaxed/simple;
	bh=JSdqNAliPMTeWFGkFGa7l9KyEsQZmwUCxwW/WKeui2E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gtNaqkeIQ34CDPgaL1tLjyVMn/6Ly+5BufYwMTP6gNZcB0yMo2s1IHoqbdusDJnMro3IWbk1hcurIoUWnqJu4PAhb/5+iO+gh/Gkcju8pbpZzrVs6uycj3dekXDpxTK+8Kz7eZfkEiPM946cETJLlq5sZ+QSgLCTSnwQ/4gY0Ec=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OTFs5W29; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56P2vFcU011175
	for <linux-arm-msm@vger.kernel.org>; Fri, 25 Jul 2025 10:58:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=fc+K/K09v6Pjm1qZcv9s4rQ5
	4FX/fpzKyJJ8Ta7tUJg=; b=OTFs5W298655IRqNBfEvRrC85pWtP0sXQhL2XMkk
	uOdiFToErD/MaVJnbUdkClnMMMPJSb48o7eO20T932kWcTAShk2b/tL2rrkQzkxn
	ftsNOCGsxKeuUas8YznoMQzHxEzEzFELSmd91xspTj4pfBdYHsi89fCV+9w4fZ1p
	CSZDCa5k0JshLeXI3tasgxfUlUz0pEP5RdEuD3S9DTOYrKLPLQI4/8gfThcj27y/
	Rv0uraMOGZ7JVR8rJF7c+tkOh2bP5fRM5uGEiBlqHT+6EpdrR3gd/e7aShdIClrF
	sjCCYkNgTOq866Bk4Zvu0yLit9vS110zck4WTwbgUzXbNw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 483w30ssfh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 25 Jul 2025 10:58:51 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-7e36a64211eso361902585a.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 25 Jul 2025 03:58:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753441131; x=1754045931;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fc+K/K09v6Pjm1qZcv9s4rQ54FX/fpzKyJJ8Ta7tUJg=;
        b=cycfXogbZc2Qc0kLsJiDbNWi0KS6kwXZ6tuUuZwoEehNI8a1S6TyhAxxc18z7dt/4V
         8wGCbZHlsbbnyoTIUVUfA3M8wRwauvDpH2e42QiV+dioDw1W6/MFpJDt7Xorr/q12G4d
         wj+s/Wzs3moTwaxYLatU+zEMVbpJdQLiZKZ79nPRFJECchYXQQKo9qoE6t97zHpj+o6e
         gWbU3hvwi1MXddwo8yp+aTFqjriZwlgpZ1u7/UYRaylbgsKa04bJzw9fV2LJGKxCakYx
         MmLK7hhvibGPg9l5KIx4u9bu4EZvc+rpFl5QQb2pWLNoCuoJ/zeoXCKAMpWO60KQqL5O
         EjEQ==
X-Forwarded-Encrypted: i=1; AJvYcCVERNkrkITWJek3XuPQG8BETolnKYJ1979eXwriDS4+EFH1fGDuMq4t79oeMSx5xwEmDl3AFxyGg7cY2cga@vger.kernel.org
X-Gm-Message-State: AOJu0YxDJVsvms6hWpTao9IJVWGua2RLgNkThDegWSE/5hnHYpVGPgCC
	SmQ7Y2zQ5K6PGcTEQMpEG3UbYw+1DjYdi3kqteZLSk35w9nHfc1sJbczx6Uj3U94ttBL76vZjUR
	u7LGDbjBiXWmzQ6J1rjZG+f/lput/5z+2lHwEKNr0FMoYBKoWmfRhbBJFMJHC0KBlkFTg
X-Gm-Gg: ASbGncs4BzWrZlljA6ms8Jb5Zuu7YsGJfv69goSK797TSFyy/Fw4aaQrsPAc6xkrQS6
	pr9I9I+wmfWN25VYwgRgaIQMEPl3T0NmnNuGM9mYTGiLK2L5VGZbdaOJez2U565UKJxTjum3CH3
	uOe++yrBuaYGCgExA7yAZT6SND1oIvXCj9HOF5LLJgRrnZOR16ZN/dShyALmXlO2U+01HgvyYIg
	af5cmzesbNClpC31S0SMtgwnNUawyVJhMfe/zM7AdLpCRjEawNKVkOwnrgOQGN6df5Q1T4p2cQb
	V734VDAKBh4BjdEhE26Vt/nCsfTJ9yPvSB/lHXM93j6tsHqPEVB8aQba+ZiRMS56O39nsv8W0ZT
	pKI1Inu3EQhIDYyTQsXIihA/rZo5RAXJgoUegTJuV4YhPXVD42Avt
X-Received: by 2002:a05:620a:d88:b0:7e3:4fcb:4f2a with SMTP id af79cd13be357-7e63bf51e5dmr124512885a.8.1753441130737;
        Fri, 25 Jul 2025 03:58:50 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH2ENeOxfOJSO5X9K0+/zLWicSxsuTWZSbLuZMJbscME2E/vfnxmZs2kgSjs4iFhOgNTo3Viw==
X-Received: by 2002:a05:620a:d88:b0:7e3:4fcb:4f2a with SMTP id af79cd13be357-7e63bf51e5dmr124509885a.8.1753441130266;
        Fri, 25 Jul 2025 03:58:50 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-55b53c715b3sm860234e87.84.2025.07.25.03.58.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Jul 2025 03:58:49 -0700 (PDT)
Date: Fri, 25 Jul 2025 13:58:47 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        cros-qcom-dts-watchers@chromium.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] arm64: dts: qcom: sc7280: Flatten primary usb
 controller node
Message-ID: <bqfmhif5fksohr7iichslnyocaxcz3o7fp75wuv2576pnkndhw@l2lttn4opps6>
References: <20250725050216.526327-1-krishna.kurapati@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250725050216.526327-1-krishna.kurapati@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=WtArMcfv c=1 sm=1 tr=0 ts=6883636b cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Wb1JkmetP80A:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=xNPlZoMqyQeERECHpiUA:9
 a=CjuIK1q_8ugA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-GUID: D05STjNslM0qabJvAbcorZSfhYGD3jp2
X-Proofpoint-ORIG-GUID: D05STjNslM0qabJvAbcorZSfhYGD3jp2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzI1MDA5MyBTYWx0ZWRfXyHf1gJnW21gJ
 mKakNsSIBVgg7ZhzPQoF0rOjyJ42ALM9hEDIVgw/l0rVbpmVZMqxxqHhEIBdjxfkcTapV/q/Hx+
 GeJRvhbZSh2jTb22v1FJMOP4hTEyPHV35QUmopvD0xLCwD0rroshciDg33LwOAEdzgk7lvy0/86
 tt3jkxzMeqXZg9ltQUymPGsf/VDiVUPfuQNMpizBFJ97vJ4vhw27FPRDUh2k1lx8a1MfE4sYNlz
 33JmvshT+nuPW+7HdjZNYiY0D6VEXRbix6HLxmKbXmeIaqRFFHiRl5j7Y8F0+4AjobbDE/lxTLi
 kdcUa22FvccE+yR7wOGBKAsCQ1FByzNX7rpGOhIEw0aYg336mE+6+P63b9bleeSmqjPgCE2rs1x
 imstAAWz38d8A1ZWPsN4q4ZeZAgDvhYsP2gNCpFpmCt3V5+pcGy+8mSN53HK5DKVPgpshKOe
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-25_03,2025-07-24_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 adultscore=0 priorityscore=1501 lowpriorityscore=0
 mlxscore=0 clxscore=1015 mlxlogscore=972 suspectscore=0 malwarescore=0
 spamscore=0 impostorscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507250093

On Fri, Jul 25, 2025 at 10:32:16AM +0530, Krishna Kurapati wrote:
> Flatten primary usb controller node and update to using latest
> bindings and flattened driver approach.
> 
> Signed-off-by: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
> ---
> Link to RFC:
> https://lore.kernel.org/all/20250720072125.1514823-1-krishna.kurapati@oss.qualcomm.com/
> 
> Changes in v2:
> Fixed base address.
> 
>  .../boot/dts/qcom/qcm6490-fairphone-fp5.dts   |  6 +-
>  arch/arm64/boot/dts/qcom/qcm6490-idp.dts      |  7 +--
>  .../boot/dts/qcom/qcm6490-shift-otter.dts     |  6 +-
>  arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts  |  6 +-
>  .../arm64/boot/dts/qcom/sc7280-herobrine.dtsi |  6 +-
>  arch/arm64/boot/dts/qcom/sc7280-idp.dts       |  6 +-
>  arch/arm64/boot/dts/qcom/sc7280-idp.dtsi      |  6 +-
>  arch/arm64/boot/dts/qcom/sc7280.dtsi          | 59 ++++++++-----------
>  .../boot/dts/qcom/sm7325-nothing-spacewar.dts |  6 +-
>  9 files changed, 42 insertions(+), 66 deletions(-)
> 

> diff --git a/arch/arm64/boot/dts/qcom/sc7280.dtsi b/arch/arm64/boot/dts/qcom/sc7280.dtsi
> index 64a2abd30100..6fd502df9c7a 100644
> --- a/arch/arm64/boot/dts/qcom/sc7280.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sc7280.dtsi
> @@ -4253,13 +4253,9 @@ compute-cb@14 {
>  		};
>  
>  		usb_1: usb@a6f8800 {
> -			compatible = "qcom,sc7280-dwc3", "qcom,dwc3";
> -			reg = <0 0x0a6f8800 0 0x400>;
> +			compatible = "qcom,sc7280-dwc3", "qcom,snps-dwc3";
> +			reg = <0 0x0a600000 0 0xfc100>;

This should have triggered a warning. It should be usb@a600000 now.

>  			status = "disabled";
> -			#address-cells = <2>;
> -			#size-cells = <2>;
> -			ranges;
> -			dma-ranges;
>  
>  			clocks = <&gcc GCC_CFG_NOC_USB3_PRIM_AXI_CLK>,
>  				 <&gcc GCC_USB30_PRIM_MASTER_CLK>,

-- 
With best wishes
Dmitry

