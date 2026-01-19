Return-Path: <linux-arm-msm+bounces-89684-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BD10D3AAC1
	for <lists+linux-arm-msm@lfdr.de>; Mon, 19 Jan 2026 14:53:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id B6E913001811
	for <lists+linux-arm-msm@lfdr.de>; Mon, 19 Jan 2026 13:53:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 19F7B35A955;
	Mon, 19 Jan 2026 13:53:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DTM7aZ7n";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="aqyp2duZ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A350436C5B0
	for <linux-arm-msm@vger.kernel.org>; Mon, 19 Jan 2026 13:53:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768830826; cv=none; b=ckGk//DmWy8eZOq4jP6lvNNnU018MCYZL8MptI5aQWCOV2XoIK8mJFWg/B5mQpu8kBBuhAeoDxfh98/QqwBjmg1PN1lT7qp45CY3GHt654SP8oTbF4Xj+lZHnI3t6lNt7xnZSZTBGAsi7cpt4D7K3Begw3VvHGNyhJbXJ9v4n0o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768830826; c=relaxed/simple;
	bh=ShQXjAQSRW4TImY3jQkauw2XPRRphVibZy66yqk6oMo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=OwWfgzJ0p6VcpXytccUcoTeg+dGH2VFeK4V5ICNn2oeKk4W2nLSbkg4Rt7zxDfr7gbcVpdFO6DKHM/E34kIrP9C4z3tv5TT4UVEh+ZCrgsWudF7KqT/Z9QlNILVnhQeyuic77XsveoI49twrQbSgFoEiz0Rk0obVfSU9aso+7p8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DTM7aZ7n; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=aqyp2duZ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60J9nBA22965782
	for <linux-arm-msm@vger.kernel.org>; Mon, 19 Jan 2026 13:53:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	96KkDm/OsAmb2OEyU3TnTGZ2oetO25eIubHpM2+yfIM=; b=DTM7aZ7n+AjLMrCr
	APrjuUjJxMvYud6SrUbwISN8F7eZToLjWIIGDlgAWWuhc6A/yQVufjhcElSG/JVG
	tRlC05DXCkzsGQo0dcaYku0XPV1xoHN4i2Hz2Xit4wSVrIqr8l41yM6yUrFjIrNE
	X+iq6ernDYlU8tlBuFTlrJrfMVTFl+ckV6zTGdbL1oZHbcBIaioeA97ilOpFlslz
	nJ5ZvdCw1sWmifiHnysB83tPcb/ydshrDn8y3qgrOlg8glh9kUBps0/3fUVuCAuq
	887LKpuobQNVQa2neXcSyXeGCHSY7h1V2tTstNpSo143/c2FggNTl+e4nJkzp5s4
	1B3BVg==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bsjaa8ngb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 19 Jan 2026 13:53:43 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8c231297839so97743785a.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 19 Jan 2026 05:53:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768830823; x=1769435623; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=96KkDm/OsAmb2OEyU3TnTGZ2oetO25eIubHpM2+yfIM=;
        b=aqyp2duZWyJI4n93EfXxu0rkw6+Hqa8DDTVaQ8M8txY9xk15IZVhBl5KFB2qrp9AFK
         Kz2JXJ9TWrACFCl2hvbFPgJJmYOP2klUgqc2C4Ch5DVGKDtWboJAS3Lw7UTwOfFyvrzb
         gHOlQXxUhLDs1yiO6VDHDTEjnp+St16e1oP09YH0Rkx/JpAOJCuAnlN+6DJ+9I6EP5P3
         smxhYMoBKKhRXvGKRtq0vzYK30BrbTk0/wHsqgGgpEG0owukNSaKYsHBX2vUPIvxjt6J
         Yrd22zv0JjVFP58/7tepFpGLxaqWSlZKu+xClGlJfIw8+zB5/11XIrqSNHh8nnuCsjHE
         pusw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768830823; x=1769435623;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=96KkDm/OsAmb2OEyU3TnTGZ2oetO25eIubHpM2+yfIM=;
        b=QTFBFc/WU86mmx0aQNa8FL5LCMMkTx78kP0gWzIDKilb0F0x/IEa3hI296+qn2fyAV
         TKlv1C69HoaYxzlKONHTsFpNcXlRFgp+0xwE0fMXT/3vlvIYfcXPX/4NA/Sd9lKnRTxF
         YujBU7lmHn4832sGO6659ZjWeNoNMvGU0L0kfr6GquVel5fs5MiTz8wA8I8lgEtRDqc2
         QYv7PXUle5H49PEug5QmZOgINACKrC71etGz5A58mwGB08GJk8LGUM3LSuStGJ5aTUmG
         Wq2V0in4ZY9ha1cFbHJIDZk7+8LHOp07CW34+Q6VaandU2/8ytIQLmbAXYEx+R8jky7G
         B87g==
X-Gm-Message-State: AOJu0Yy0Idl2mbQx2g72xO1n4wQvYawRlUEQn6hHY0IjDaLP0tzfyZII
	jDd1/LPlZwBGH2HGAUi291/xZLAPLniAHxFI+ECy6F5KKICHbjZxT3FJcBfSH+MznHSakCTfFZA
	f/JByIYzr89A3WsVebBWrt6+vXDegijmM2j8aAhCgvwlXMg8zBd3Bl3Vvxkr82S5l28xw
X-Gm-Gg: AY/fxX6/WpYfpY/VoHURKzAn0k+1TC4ZrdRpHXPPwle9ziFznty2N6m5jAra+mFpB+Y
	y75U3DpZInb0S0uSjlm7PQC5qGp4xGhY69aYb1CDJMgvHjUycINTrcBKrdGMLNetY11cMDxcRw+
	/Zky2SrIQOuwqLxjsoeq9m2bgyN9I6Mb808OXAlj/QsU6seLkkSsbE0whEmYyMFbTzRGVg/cDcH
	J4Hywn/kAQVB/bprjqC8eBLlfMLe/g46KWsrY0i3ZHQ/BCtIsSL6UZ81rdkO2VC4I1fWSl2GWlq
	dmMmy9G0HftZUfUVClUiNOgTuF2XmWhhFGkv4tHZqEIN1wCZ17tFDN9C43dnEMaJAVaDuWGkFzx
	O6BGfpYkIWOH7xKf9z+yKUthOuL5oPK/Ng7qbKZBST8Q0vP297qa2SxMGaLMgdKehf9Q=
X-Received: by 2002:a05:620a:1911:b0:8a3:d644:6930 with SMTP id af79cd13be357-8c6a6716bedmr1231189685a.5.1768830822998;
        Mon, 19 Jan 2026 05:53:42 -0800 (PST)
X-Received: by 2002:a05:620a:1911:b0:8a3:d644:6930 with SMTP id af79cd13be357-8c6a6716bedmr1231187785a.5.1768830822528;
        Mon, 19 Jan 2026 05:53:42 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-654533cc543sm10171605a12.20.2026.01.19.05.53.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Jan 2026 05:53:42 -0800 (PST)
Message-ID: <060a29a8-6fe0-4981-9f1f-398eac8adbd0@oss.qualcomm.com>
Date: Mon, 19 Jan 2026 14:53:39 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 4/4] arm64: dts: qcom: Add base PURWA-IOT-EVK board
To: YijieYang <yijie.yang@oss.qualcomm.com>, andersson@kernel.org,
        konradybcio@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org
References: <20260116-purwa-v4-0-89b2adae9f09@oss.qualcomm.com>
 <20260116104136.2922032-4-yijie.yang@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260116104136.2922032-4-yijie.yang@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE5MDExNiBTYWx0ZWRfXyrZX6Syr1H2s
 h9+u/TSMyrafrMkOZRTRI9tRvBWX62N46gyU7ZLLbGemCjlzOYbnqGFW0BfnlFAsD9tS93wYiWh
 y0Nw6icyk3J5BdubYuGJo6z/q7WQeYZEuNzKy74nNWo6fgWlBBQvMyF+UI4tn/s0Xi2O3R/v3qk
 g2Uqem+/2Qx9nyTeMEpId/QDjIsmt6gBQTV4jZZ+2t1B2pK2jtJPbo5dFR2s4ThA1ou86idFNla
 K0oejeCUEnI4/+DNPkXthk/yoCLpmFVP4VemXjUm4cC1r959wbrN69R0ptoUAND06HOOMM9ZRXr
 aX0EyKBdNP9JogltHxepydESlCBxsZ7q6j5nOcc4qor8Kr8U5eM1uaMpqoOnFloPQBKvrdrs90R
 5eRnRKdO8tDsNiKUzsvehYC4x0W9GsYZOEgPjwokXyj2IQx+aEUiqbiqbsLoKdnaaN0Uvw7OUOR
 mv8MW2DJIt+lg6GRYqQ==
X-Proofpoint-ORIG-GUID: S7f2mMP71aA9UmNPh3yFHBkncUJPMEMA
X-Proofpoint-GUID: S7f2mMP71aA9UmNPh3yFHBkncUJPMEMA
X-Authority-Analysis: v=2.4 cv=L8gQguT8 c=1 sm=1 tr=0 ts=696e3767 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=Hyk3WD5DSplu-n_fqRAA:9
 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-19_03,2026-01-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 impostorscore=0 suspectscore=0 phishscore=0 spamscore=0
 clxscore=1015 priorityscore=1501 lowpriorityscore=0 bulkscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601190116

On 1/16/26 11:41 AM, YijieYang wrote:
> From: Yijie Yang <yijie.yang@oss.qualcomm.com>
> 
> The PURWA-IOT-EVK is an evaluation platform for IoT products, composed of
> the Purwa IoT SoM and a carrier board. Together, they form a complete
> embedded system capable of booting to UART.
> 
> PURWA-IOT-EVK uses the PS8833 as a retimer for USB0, unlike HAMOA-IOT-EVK.
> Meanwhile, USB0 bypasses the SBU selector FSUSB42.
> 
> Make the following peripherals on the carrier board enabled:
> - UART
> - On-board regulators
> - USB Type-C mux
> - Pinctrl
> - Embedded USB (EUSB) repeaters
> - NVMe
> - pmic-glink
> - USB DisplayPorts
> - Bluetooth
> - WLAN
> - Audio
> - PCIe ports for PCIe3 through PCIe6a
> - TPM
> 
> Signed-off-by: Yijie Yang <yijie.yang@oss.qualcomm.com>
> ---

[...]


> +&spi11 {
> +	status = "okay";
> +
> +	tpm@0 {
> +		compatible = "st,st33htpm-spi", "tcg,tpm_tis-spi";
> +		reg = <0>;
> +		spi-max-frequency = <20000000>;
> +	};
> +};
> +
>  &smb2360_0 {
>  	status = "okay";
>  };
> @@ -1171,16 +1217,6 @@ &smb2360_2_eusb2_repeater {
>  	vdd3-supply = <&vreg_l8b_3p0>;
>  };
>  
> -&spi11 {
> -	status = "okay";
> -
> -	tpm@0 {
> -		compatible = "st,st33htpm-spi", "tcg,tpm_tis-spi";
> -		reg = <0>;
> -		spi-max-frequency = <20000000>;
> -	};
> -};

Not sure if anyone commented on this already, please keep it where
it was (it was properly sorted in the original file), then we're just
left with the USB changes

Konrad

