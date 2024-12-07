Return-Path: <linux-arm-msm+bounces-40855-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 026369E8080
	for <lists+linux-arm-msm@lfdr.de>; Sat,  7 Dec 2024 16:58:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9CC66188423A
	for <lists+linux-arm-msm@lfdr.de>; Sat,  7 Dec 2024 15:58:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EB1281474A9;
	Sat,  7 Dec 2024 15:58:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="WfwYER6y"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C97A41E4BE;
	Sat,  7 Dec 2024 15:58:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733587086; cv=none; b=WVEvrc9/QTBOMoVenNrHIZ74XojR64nRb5xKD7AntdPgD84U7hKDThk678SqcBBtVnk69KYNx6P+SAhmMRPnq9cNz7yETin8J6ZtgKQwxGbzSTI6/kdwLKB3vtsAKDo+OKzt7t2lbENsGrFi+2pAixkCIKlw0TP761X86rdNQcM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733587086; c=relaxed/simple;
	bh=1MzOEiTqomiP0+Qd2CQIBE5l6drKje65N+HIRSp886Y=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=joIsm0C9oAgUlkgUeR55WeggJF05S7lWvq0Lr7VIWdhYE5zvRLVwTbQkOs+KhVM6B2FFcpiGA5Bp4gaPEjdp9wSUROENYUT0NFr3QFVg2NHfIQOIn9EKCmNOzwVoC0LUB4K3DL5hgTUfsAH2vTl63r2V56PwIQ7JQaLAq49sCwQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=WfwYER6y; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4B7EJlUt025698;
	Sat, 7 Dec 2024 15:58:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	h+JwaMLqriEtjjSkTLpNHyzDUUHvFRo5kkfsH2Izqls=; b=WfwYER6ykXAxoA7+
	wUfJlp2xs7Vh8gGJO80dZ+iBi/Q4oQePdYVYvIs8fpJdqXZgkSePqc/C+D9Y603z
	wsMmWenEFj0gMpG4qVsOCMLWdYmcFnx0rlKp/B9L9q8mLxvtvKSsOyP4UHXr0WZO
	s+rbIsdCWLoHSwVmHr6lhiSP3nzx8RjLOdWSvKZ7pPgbFkhLwQZD6S8fctSb5Vw6
	Pg6mYoGVdw1zDNT6z85QpABbsa++C/XIY53XMcy68fmDWqa8QHFqyprAX21V6j8u
	rg6nnInwtqaOkUdjEC7rmUcDBnQ2mZhsIuphWfqLcN4n3gCAFpS9YERmwXL5X3OO
	y6wIjA==
Received: from nasanppmta03.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43cek1ruhw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 07 Dec 2024 15:58:00 +0000 (GMT)
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4B7FvxPm032070
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 7 Dec 2024 15:57:59 GMT
Received: from [10.239.132.150] (10.80.80.8) by nasanex01a.na.qualcomm.com
 (10.52.223.231) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Sat, 7 Dec 2024
 07:57:57 -0800
Message-ID: <01d0b807-6201-43fb-8286-df04d722610f@quicinc.com>
Date: Sat, 7 Dec 2024 23:57:54 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: x1e80100-pmics: Enable all SMB2360
 separately
To: Stephan Gerhold <stephan.gerhold@linaro.org>,
        Bjorn Andersson
	<andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
CC: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        Abel Vesa
	<abel.vesa@linaro.org>, Johan Hovold <johan@kernel.org>
References: <20241203-x1e80100-disable-smb2360-v1-1-80942b7f73da@linaro.org>
From: "Aiqun Yu (Maria)" <quic_aiquny@quicinc.com>
Content-Language: en-US
In-Reply-To: <20241203-x1e80100-disable-smb2360-v1-1-80942b7f73da@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: MhJrAcKsOHnyqQF34hAo7qvlEjHfWGKG
X-Proofpoint-ORIG-GUID: MhJrAcKsOHnyqQF34hAo7qvlEjHfWGKG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 impostorscore=0
 mlxscore=0 adultscore=0 clxscore=1011 malwarescore=0 phishscore=0
 spamscore=0 mlxlogscore=766 lowpriorityscore=0 priorityscore=1501
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412070134



On 12/4/2024 12:27 AM, Stephan Gerhold wrote:
> At the moment, x1e80100-pmics.dtsi enables two of the SMB2360 PMICs by
> default and only leaves the third disabled. This was introduced in commit

One correction: it’s not only the third PMIC that is disabled. Both the
third (smb2360_2) and fourth (smb2360_3) are disabled. This information
is verified from link[1]:
[1]https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/tree/arch/arm64/boot/dts/qcom/x1e80100-pmics.dtsi

> a237b8da413c ("arm64: dts: qcom: x1e80100: Disable SMB2360_2 by default").
> This is inconsistent and confusing. Some laptops will even need SMB2360_1
> disabled by default if they just have a single USB-C port.
> 
> Make this consistent by keeping all SMB2360 disabled in x1e80100-pmics.dtsi
> and enable them separately for all boards where needed. That way it is
> always clear which ones are available and avoids accidentally trying to
> read/write from missing chips when some of the PMICs are not present.
> 
> Signed-off-by: Stephan Gerhold <stephan.gerhold@linaro.org>
> ---
>  arch/arm64/boot/dts/qcom/x1e001de-devkit.dts               | 8 ++++++++
>  arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dts | 8 ++++++++
>  arch/arm64/boot/dts/qcom/x1e80100-asus-vivobook-s15.dts    | 8 ++++++++
>  arch/arm64/boot/dts/qcom/x1e80100-crd.dts                  | 8 ++++++++
>  arch/arm64/boot/dts/qcom/x1e80100-dell-xps13-9345.dts      | 8 ++++++++
>  arch/arm64/boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dts   | 8 ++++++++
>  arch/arm64/boot/dts/qcom/x1e80100-microsoft-romulus.dtsi   | 8 ++++++++
>  arch/arm64/boot/dts/qcom/x1e80100-pmics.dtsi               | 4 ++++
>  arch/arm64/boot/dts/qcom/x1e80100-qcp.dts                  | 8 ++++++++
>  9 files changed, 68 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/x1e001de-devkit.dts b/arch/arm64/boot/dts/qcom/x1e001de-devkit.dts
> index c9db6298d528ed505bae08e91bf4da02faef7d76..c3ec0bb2c42dfed9f5e9f56f18874b4ae6c0632c 100644
> --- a/arch/arm64/boot/dts/qcom/x1e001de-devkit.dts
> +++ b/arch/arm64/boot/dts/qcom/x1e001de-devkit.dts
> @@ -1062,11 +1062,19 @@ &remoteproc_cdsp {
>  	status = "okay";
>  };
>  
> +&smb2360_0 {
> +	status = "okay";
> +};
> +
>  &smb2360_0_eusb2_repeater {
>  	vdd18-supply = <&vreg_l3d_1p8>;
>  	vdd3-supply = <&vreg_l2b_3p0>;
>  };
>  
> +&smb2360_1 {
> +	status = "okay";
> +};
> +
>  &smb2360_1_eusb2_repeater {
>  	vdd18-supply = <&vreg_l3d_1p8>;
>  	vdd3-supply = <&vreg_l14b_3p0>;
> diff --git a/arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dts b/arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dts
> index 975550139e1024420ed335a2a46e4d54df7ee423..4097d2677285757ce67eef76d8d17669c7130001 100644
> --- a/arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dts
> +++ b/arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dts
> @@ -635,11 +635,19 @@ &remoteproc_cdsp {
>  	status = "okay";
>  };
>  
> +&smb2360_0 {
> +	status = "okay";
> +};
> +
>  &smb2360_0_eusb2_repeater {
>  	vdd18-supply = <&vreg_l3d_1p8>;
>  	vdd3-supply = <&vreg_l2b_3p0>;
>  };
>  
> +&smb2360_1 {
> +	status = "okay";
> +};
> +
>  &smb2360_1_eusb2_repeater {
>  	vdd18-supply = <&vreg_l3d_1p8>;
>  	vdd3-supply = <&vreg_l14b_3p0>;
> diff --git a/arch/arm64/boot/dts/qcom/x1e80100-asus-vivobook-s15.dts b/arch/arm64/boot/dts/qcom/x1e80100-asus-vivobook-s15.dts
> index f25991b887de3fca0092c5f81c881c5d8bd71aac..10f140ed08f47f2cd96e953d4ad3c75f3aad002a 100644
> --- a/arch/arm64/boot/dts/qcom/x1e80100-asus-vivobook-s15.dts
> +++ b/arch/arm64/boot/dts/qcom/x1e80100-asus-vivobook-s15.dts
> @@ -501,11 +501,19 @@ &remoteproc_cdsp {
>  	status = "okay";
>  };
>  
> +&smb2360_0 {
> +	status = "okay";
> +};
> +
>  &smb2360_0_eusb2_repeater {
>  	vdd18-supply = <&vreg_l3d_1p8>;
>  	vdd3-supply = <&vreg_l2b_3p0>;
>  };
>  
> +&smb2360_1 {
> +	status = "okay";
> +};
> +
>  &smb2360_1_eusb2_repeater {
>  	vdd18-supply = <&vreg_l3d_1p8>;
>  	vdd3-supply = <&vreg_l14b_3p0>;
> diff --git a/arch/arm64/boot/dts/qcom/x1e80100-crd.dts b/arch/arm64/boot/dts/qcom/x1e80100-crd.dts
> index 39f9d9cdc10d8e79824b72288e2529536144fa9e..81c519e690f325f2d4d36c4a99061649da65ec87 100644
> --- a/arch/arm64/boot/dts/qcom/x1e80100-crd.dts
> +++ b/arch/arm64/boot/dts/qcom/x1e80100-crd.dts
> @@ -932,11 +932,19 @@ &remoteproc_cdsp {
>  	status = "okay";
>  };
>  
> +&smb2360_0 {
> +	status = "okay";
> +};
> +
>  &smb2360_0_eusb2_repeater {
>  	vdd18-supply = <&vreg_l3d_1p8>;
>  	vdd3-supply = <&vreg_l2b_3p0>;
>  };
>  
> +&smb2360_1 {
> +	status = "okay";
> +};
> +
>  &smb2360_1_eusb2_repeater {
>  	vdd18-supply = <&vreg_l3d_1p8>;
>  	vdd3-supply = <&vreg_l14b_3p0>;
> diff --git a/arch/arm64/boot/dts/qcom/x1e80100-dell-xps13-9345.dts b/arch/arm64/boot/dts/qcom/x1e80100-dell-xps13-9345.dts
> index b112092fbb9fd955adca1ae8a76294c776fa2d1e..288e818961670be0d25b696730e7186a8d61b56e 100644
> --- a/arch/arm64/boot/dts/qcom/x1e80100-dell-xps13-9345.dts
> +++ b/arch/arm64/boot/dts/qcom/x1e80100-dell-xps13-9345.dts
> @@ -905,11 +905,19 @@ &remoteproc_cdsp {
>  	status = "okay";
>  };
>  
> +&smb2360_0 {
> +	status = "okay";
> +};
> +
>  &smb2360_0_eusb2_repeater {
>  	vdd18-supply = <&vreg_l3d_1p8>;
>  	vdd3-supply = <&vreg_l2b_3p0>;
>  };
>  
> +&smb2360_1 {
> +	status = "okay";
> +};
> +
>  &smb2360_1_eusb2_repeater {
>  	vdd18-supply = <&vreg_l3d_1p8>;
>  	vdd3-supply = <&vreg_l14b_3p0>;
> diff --git a/arch/arm64/boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dts b/arch/arm64/boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dts
> index ca5a808f2c7df66a861a933df407fd4bdaea3fe1..3d7e0230dc0381a2c2a3b0c5b766f5b854777937 100644
> --- a/arch/arm64/boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dts
> +++ b/arch/arm64/boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dts
> @@ -717,11 +717,19 @@ &remoteproc_cdsp {
>  	status = "okay";
>  };
>  
> +&smb2360_0 {
> +	status = "okay";
> +};
> +
>  &smb2360_0_eusb2_repeater {
>  	vdd18-supply = <&vreg_l3d_1p8>;
>  	vdd3-supply = <&vreg_l2b_3p0>;
>  };
>  
> +&smb2360_1 {
> +	status = "okay";
> +};
> +
>  &smb2360_1_eusb2_repeater {
>  	vdd18-supply = <&vreg_l3d_1p8>;
>  	vdd3-supply = <&vreg_l14b_3p0>;
> diff --git a/arch/arm64/boot/dts/qcom/x1e80100-microsoft-romulus.dtsi b/arch/arm64/boot/dts/qcom/x1e80100-microsoft-romulus.dtsi
> index 6835fdeef3aec10206e8b2839d23e4f3494afe1e..6941945b2f9a7e7b11598705fa22d3a6f2cc01c7 100644
> --- a/arch/arm64/boot/dts/qcom/x1e80100-microsoft-romulus.dtsi
> +++ b/arch/arm64/boot/dts/qcom/x1e80100-microsoft-romulus.dtsi
> @@ -718,11 +718,19 @@ &remoteproc_cdsp {
>  	status = "okay";
>  };
>  
> +&smb2360_0 {
> +	status = "okay";
> +};
> +
>  &smb2360_0_eusb2_repeater {
>  	vdd18-supply = <&vreg_l3d>;
>  	vdd3-supply = <&vreg_l2b>;
>  };
>  
> +&smb2360_1 {
> +	status = "okay";
> +};
> +
>  &smb2360_1_eusb2_repeater {
>  	vdd18-supply = <&vreg_l3d>;
>  	vdd3-supply = <&vreg_l14b>;
> diff --git a/arch/arm64/boot/dts/qcom/x1e80100-pmics.dtsi b/arch/arm64/boot/dts/qcom/x1e80100-pmics.dtsi
> index 5b54ee79f048e3208cbcd6f91e0cec073420fe63..d7a2a2b8fc6c30bdb10df81eac7d92306998838f 100644
> --- a/arch/arm64/boot/dts/qcom/x1e80100-pmics.dtsi
> +++ b/arch/arm64/boot/dts/qcom/x1e80100-pmics.dtsi
> @@ -491,6 +491,8 @@ smb2360_0: pmic@7 {
>  		#address-cells = <1>;
>  		#size-cells = <0>;
>  
> +		status = "disabled";
> +
>  		smb2360_0_eusb2_repeater: phy@fd00 {
>  			compatible = "qcom,smb2360-eusb2-repeater";
>  			reg = <0xfd00>;
> @@ -504,6 +506,8 @@ smb2360_1: pmic@a {
>  		#address-cells = <1>;
>  		#size-cells = <0>;
>  
> +		status = "disabled";
> +
>  		smb2360_1_eusb2_repeater: phy@fd00 {
>  			compatible = "qcom,smb2360-eusb2-repeater";
>  			reg = <0xfd00>;
> diff --git a/arch/arm64/boot/dts/qcom/x1e80100-qcp.dts b/arch/arm64/boot/dts/qcom/x1e80100-qcp.dts
> index 5ef030c60abe2998d093ee60a6754a90cd5aaf72..ffd28fd8059895ec345f4ee8fe6a2c37e7989747 100644
> --- a/arch/arm64/boot/dts/qcom/x1e80100-qcp.dts
> +++ b/arch/arm64/boot/dts/qcom/x1e80100-qcp.dts
> @@ -731,11 +731,19 @@ &remoteproc_cdsp {
>  	status = "okay";
>  };
>  
> +&smb2360_0 {
> +	status = "okay";
> +};
> +
>  &smb2360_0_eusb2_repeater {
>  	vdd18-supply = <&vreg_l3d_1p8>;
>  	vdd3-supply = <&vreg_l2b_3p0>;
>  };
>  
> +&smb2360_1 {
> +	status = "okay";
> +};
> +
>  &smb2360_1_eusb2_repeater {
>  	vdd18-supply = <&vreg_l3d_1p8>;
>  	vdd3-supply = <&vreg_l14b_3p0>;
> 
> ---
> base-commit: 12b080aaf4275c579c91106ed926044b4d5df0af
> change-id: 20241129-x1e80100-disable-smb2360-20cec1656411
> 
> Best regards,

-- 
Thx and BRs,
Aiqun(Maria) Yu


