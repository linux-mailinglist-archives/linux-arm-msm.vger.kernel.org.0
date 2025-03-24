Return-Path: <linux-arm-msm+bounces-52360-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 19E73A6DF7D
	for <lists+linux-arm-msm@lfdr.de>; Mon, 24 Mar 2025 17:23:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D40E13B271A
	for <lists+linux-arm-msm@lfdr.de>; Mon, 24 Mar 2025 16:21:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4B38B263C61;
	Mon, 24 Mar 2025 16:21:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="AfgGXJRN"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB5062638B5
	for <linux-arm-msm@vger.kernel.org>; Mon, 24 Mar 2025 16:21:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742833264; cv=none; b=i3OyYLSb3CseU6kmUu72y0thCKQrWo0I5Wn0ffLm2hjgYnyf9tXWZIMErLoZMU+a9OLfwiJLwrsJfj9onJAslyhpqm4JDBhKaPNikL+UTyDPiaiakwWyE7HCEeHCCJwKnbqNzfDw9G/mgmqzJeR0EsA8pwC/mYwUy5jjLbJRA0o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742833264; c=relaxed/simple;
	bh=mvlXKpOvOxVDPVo8129a6GtRvc+hf+96Q7b9N63RQyk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VIlQZ/DKR/Hchqx+PsRBUhUzsSDDUY1i4tS/L4gHsilcH/TLk75mIruLu+NOU6TWsAVjd1Pcf4rbIzuUYlPislgj/hAnzEnHepnh6+RH8riQBx8jTGWqfBenwCjJ3CV3UNdNZbAcUPXMhdW6WUmDU/oUmeGcQ5gc+QcqehKD7kw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=AfgGXJRN; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52O9POiw022001
	for <linux-arm-msm@vger.kernel.org>; Mon, 24 Mar 2025 16:21:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=DESxgT+ffW3/smeI2/35e6vR
	oFwFfEnGK2BfvTVlQtI=; b=AfgGXJRNZ3385RpCLyN/Y9qgHkl9C3UJlkCS3Ey0
	lmW3cD2zhIEWsoT3gwLFbqOh1g/8mA7ygYvDPdLlaap7H90tq9XDZrMzsoVhd3Z/
	v5KN0uduxseS5+d9S7NYy6GNHjvOwBsY44vifwlua0AZIvPf9sCPbis0aD91xU9i
	QSaImjqimHknZquz0i68u6zAdSGBAGlAMiby/ooWd1aOWpVL3sKId7IAWmmCZoKJ
	edRncGsu3RP3QRwRXhFHIrwgpJe9NkrCT0U3liMlOyB/T8/3uoYZu8ht0eqcut+W
	fEIKEjtYz4WB0jCg35ejFMJB6XhUivD/1QHXKpkYG3tcVw==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45hpcp4t7m-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 24 Mar 2025 16:21:01 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-6e8f184b916so104594856d6.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 24 Mar 2025 09:21:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742833260; x=1743438060;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DESxgT+ffW3/smeI2/35e6vRoFwFfEnGK2BfvTVlQtI=;
        b=ApaMij6A6WFq+RFn/skMZUQt1U3Ihvs0d15vqy2y2WxWbL38PS5sZMLrReYiGEtyan
         cwGHa4U4BNWYzpoQtYVLlynV76UUfeygZksj5kQ4j/RwJR5P5W3O+5MBEkQ1l7dNRZtO
         iWhMsEs42A/mHR0EL0uAB1s2s6lFjdd+T9hio70vn2MgaicJZaY6z26wDDnn7ynLBo/I
         3TX1oTgScfDj8G3SiA+BDbFEXjGtd4geCHjsUkZvDpMGFHHXDH5cIK/LDTd43Zig49BA
         Kqj/3muF/bEsH8SGPMpcnaNk6yJEZUWEOdKWlNZV4illKHzvDoseJGml6i6RiO43uFeP
         91sg==
X-Forwarded-Encrypted: i=1; AJvYcCV5Cuhvcw6oGo04QVXUELHNAnwhwA+CMwQCSi21voFCIVvqO0tjsDtrNXEvYyGBgRdveZnGDVI3EQsqasJU@vger.kernel.org
X-Gm-Message-State: AOJu0Yy2zRqnjJkaJPPOi/07ym66/REiDLf5gyXu79bmSzfiNSgQMw+5
	E5nfxLMQvyaWRacxHqigSpD6UbZuzmFTDdceSG21rclrJgRSyNSODFpem2kSRlzBb2NjG/CwkVL
	P0eH6CatCeptx353pzMzAS7OrN8L5ReXQQyxQc7PNGbZ4llSkd2kvQ6oqpBGCbOT6
X-Gm-Gg: ASbGncsGBShREFpX6a8iePE1FtYHPYBZ26/8xa6vOqrNr65Su5S/8waFfOcsifWlOAj
	4PgAblbZFAr4HP8eonBqGg/DPPNYRBa0PLZpkJq3aYwR49BsvaTcnN9KaU+og9maMl1qsvwXFgB
	V2XbrQmWNznj9HjMOLoDxdv1La9QQ/56BuhmTg3uygmwaTonK3BQjCVMtViNW43Sf2kFjnDhoIR
	1NcvKY/8GMZc1Ry0mRAyNSeY1cgejOG6j5b8otAKnpCV/vj1Kd73vqPxQ5aHmlOfN5gKHRihuKz
	uTGvHUzQ2MMl5PBZIV7Mftnvg2Ao6lW4XySddY7QfF46P/UnxonJHZOraVFzDgiCTQE8DGTu3su
	tKvo=
X-Received: by 2002:a05:6214:1d02:b0:6e8:f3ec:5406 with SMTP id 6a1803df08f44-6eb3f2d741dmr241150826d6.19.1742833260417;
        Mon, 24 Mar 2025 09:21:00 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGIXFxLu7wPhGiMxnzDIocDYQf23jOzCwJusDnog6dKiEbH3AA09OyoaeIootoLWDes+CDFxQ==
X-Received: by 2002:a05:6214:1d02:b0:6e8:f3ec:5406 with SMTP id 6a1803df08f44-6eb3f2d741dmr241150156d6.19.1742833259869;
        Mon, 24 Mar 2025 09:20:59 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-30d7d7c1d8esm14328251fa.13.2025.03.24.09.20.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Mar 2025 09:20:58 -0700 (PDT)
Date: Mon, 24 Mar 2025 18:20:57 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Abel Vesa <abel.vesa@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Johan Hovold <johan@kernel.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: qcom: x1e001de-devkit: Add Wi-Fi and
 Bluetooth pwrseq
Message-ID: <5nfpid56okxibr4xzqtd6zf2hjcqo3rsfegq34bccwhetxtv66@f6qweweusn65>
References: <20250324-x1e001de-devkit-dts-pwrseq-v1-1-530f69b39a16@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250324-x1e001de-devkit-dts-pwrseq-v1-1-530f69b39a16@linaro.org>
X-Proofpoint-GUID: iFHOovhEJG4_L9fOp67BIYH91nDy_c_O
X-Proofpoint-ORIG-GUID: iFHOovhEJG4_L9fOp67BIYH91nDy_c_O
X-Authority-Analysis: v=2.4 cv=PLYP+eqC c=1 sm=1 tr=0 ts=67e1866e cx=c_pps a=oc9J++0uMp73DTRD5QyR2A==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=Vs1iUdzkB0EA:10 a=KKAkSRfTAAAA:8 a=B27XUFgWoi0L5bWDT0MA:9 a=CjuIK1q_8ugA:10 a=iYH6xdkBrDN1Jqds4HTS:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-24_04,2025-03-21_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 spamscore=0 suspectscore=0 mlxscore=0 impostorscore=0 priorityscore=1501
 phishscore=0 clxscore=1015 mlxlogscore=964 adultscore=0 malwarescore=0
 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2503240118

On Mon, Mar 24, 2025 at 04:24:01PM +0200, Abel Vesa wrote:
> The Qualcomm X Elite Devkit comes with a WCN7850 combo chip which provides
> Wi-fi and Bluetooth, similar to the CRD and QCP.
> 
> Describe the nodes for the Wi-Fi, Bluetooth, the related regulators and
> the PMU.
> 
> Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
> ---
>  arch/arm64/boot/dts/qcom/x1e001de-devkit.dts | 144 +++++++++++++++++++++++++++
>  1 file changed, 144 insertions(+)
> 
> @@ -979,6 +1075,23 @@ &pcie4_phy {
>  	status = "okay";
>  };
>  
> +&pcie4_port0 {
> +	wifi@0 {
> +		compatible = "pci17cb,1107";
> +		reg = <0x10000 0x0 0x0 0x0 0x0>;
> +
> +		vddaon-supply = <&vreg_pmu_aon_0p59>;
> +		vddwlcx-supply = <&vreg_pmu_wlcx_0p8>;
> +		vddwlmx-supply = <&vreg_pmu_wlmx_0p85>;
> +		vddrfacmn-supply = <&vreg_pmu_rfa_cmn>;
> +		vddrfa0p8-supply = <&vreg_pmu_rfa_0p8>;
> +		vddrfa1p2-supply = <&vreg_pmu_rfa_1p2>;
> +		vddrfa1p8-supply = <&vreg_pmu_rfa_1p8>;
> +		vddpcie0p9-supply = <&vreg_pmu_pcie_0p9>;
> +		vddpcie1p8-supply = <&vreg_pmu_pcie_1p8>;

Do we need calibration variant here or is it coming from SMI tables /
DMI data?

> +	};
> +};
> +
>  &pcie5 {
>  	perst-gpios = <&tlmm 149 GPIO_ACTIVE_LOW>;
>  	wake-gpios = <&tlmm 151 GPIO_ACTIVE_LOW>;

-- 
With best wishes
Dmitry

