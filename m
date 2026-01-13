Return-Path: <linux-arm-msm+bounces-88783-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A115D19126
	for <lists+linux-arm-msm@lfdr.de>; Tue, 13 Jan 2026 14:18:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0039630062FA
	for <lists+linux-arm-msm@lfdr.de>; Tue, 13 Jan 2026 13:13:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 99D5172610;
	Tue, 13 Jan 2026 13:13:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="THginQgt";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="P8RZB2FN"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D1F038FF19
	for <linux-arm-msm@vger.kernel.org>; Tue, 13 Jan 2026 13:13:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768310020; cv=none; b=hQCzOiNhsQO2HNmZ7zXJndK/3Z+c4/dhKMxDDCcSymGxz9NJ42Z9gJBsHu5i/YA2K3pfZxMXG94qGnjRoPAgg0pSl1ezoCVQ+SpH+92Q+bWtZbbsLV8FjSKTJIccCQdlEmE76Nnc8tXVL2xKHN6T49qP99LDrl9pOJpJjb0PKAM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768310020; c=relaxed/simple;
	bh=dk5jbImLcB2x8AUb5RmXedSgI5VU/00aSHRlIsFQACE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jb9PAgkRbKhKymPiak6B/SzZgFRrZdoG3oSM/4MEjegB47ebKPWeGJM2ptkC2RFPjbEBunwoVXojfSIIfSCVTKtgB1thRzG3fHI/cTfzspElVXhOHaU4UnnSiUvyC7sCbtdjJsrCROF67zO4Lg1jKB60x+iEnsNK8Uxsqedg7as=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=THginQgt; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=P8RZB2FN; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60DCEijo3810630
	for <linux-arm-msm@vger.kernel.org>; Tue, 13 Jan 2026 13:13:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	0bwgBAmS/C+0L1XuQ0SYs4qvA/Tw0QYyfHwE2EwIuVs=; b=THginQgtkhUQiSel
	ux3m7OHK2wyaIn7UdCvPp9UZZ1CkuJB94IKAf8QN43Hv6/SPe31DUBVU8L9jPp64
	4ss9W67pMYLJSQXrclEMgRilReHQCs/VCtMUzOgrTOLVNCiRE9ub2yWnLJBiDlJN
	vqIGjWrgCLKxOF/ayTYm7jqLAzzQB1HI/hPou5TiLHUROxgxjNNGbAJvZxvS0yYQ
	s19dRCvaBO6QpXdCFYmf6rbFqkY9t5SiHSW0ZzsIDTVTTKkYQNzcPBjaJOMTwWR7
	MjY1NxYPMgzJkUyu2XbbOfn62vNGecSZtYhMbs2xbwKmfRBAwA+YA8+cCs0Ove9T
	tulawg==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bng55sdfx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 13 Jan 2026 13:13:38 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4f1e17aa706so40012531cf.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 13 Jan 2026 05:13:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768310017; x=1768914817; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=0bwgBAmS/C+0L1XuQ0SYs4qvA/Tw0QYyfHwE2EwIuVs=;
        b=P8RZB2FNeS9xea/z6HWJF8tt7jWNSwDV4lkyergRnm+DQn5uWBFpeSPdJ9YcPF+vvh
         ljq/y/epzQxcyhcL7uUXb5CB5FW5UQD+R/qVbGuN1v/7t3lxtHI3A5j8GZqO+rrjNbvq
         OvM7Ljrs7A2embMs6NKdFv70ygQJw+oo9VqCFMpyspaBnrgahSdC0vXNMTGeNbSbWUeW
         9Y/5dT/WoIelkCjMoH2eY0bNx6zPpsyK/O9ngSlCBR4qQgbpvoa0tCD+OmVrUcx+dYh7
         f3Pce5avhPr+c06aTTbCw7/WctSnfv84/0HYTAGHObrunL+ka6hA4/lS5RI5STalrMR/
         PKgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768310017; x=1768914817;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0bwgBAmS/C+0L1XuQ0SYs4qvA/Tw0QYyfHwE2EwIuVs=;
        b=FtIKnMwZUOFGe7dbQBLIugrj1izzbofb3LtHVugN2LgfztE2PEpUvky1Fx8Px5lQm8
         PEfneH9kOwScL4vz7k4kfS2+j8/HZIwOBLxTWhTuS9uzGEmvdREnniZatqV2cxBOrNSC
         eY2ukBjMzyqyZAZY79IY+/k4gwQcWTGW5dx7RJ070OZijRUEl7au0dFslwq3KS8sFD0z
         FUIwuvRg73FHXedtNFLCcJbcdjAx4E/TIYsauWh3Xagos/PiiFpAwTI7OJRVtL1IRUsh
         MkLfTvW5KQJnkzBRS4AKhUsZhA9qh7T0vqI163KSiX7lvEfk3kFYCfGnZpNiB7t1Fu2q
         U/LA==
X-Forwarded-Encrypted: i=1; AJvYcCVOD5FZ3TPgs0Kj3DK0AKAtMdwHLjKAVGZCVd15eQXFvYnngmaaDc06ah78oibREKS5F9/gA7mXIG2sBBpT@vger.kernel.org
X-Gm-Message-State: AOJu0Yy+CnvUQ2ANVKC770vtBGYDdIBPOshQPO8hVkMPH+0LSxsbU8JF
	e3xso9mM/ceZZAEXhZOfrcxjNQuXUvY/gGSZjkfPXxXYxSDIEbRO1Qt+wG6+YiCxxnGujvgobev
	RsjvqlMmYc/mGc/ygQcqWs/xQYvHjXmACW1HWK20odqU6I2aEnanZbllOPwSr/Ga/QL1o
X-Gm-Gg: AY/fxX5q9ri6EFnftMpwgm+MNuxs+x83J7VPGGeM+1oRt5NQk0k8QDUN0Ew0dLekj2K
	S5hcNw2IF9jURmsPV81ZTUPFUaXQus4k6CCecudiuJQOLiu9YuQUK+qCAJBm11vfDwqkUbHkvzO
	gmwTDtTkSCnD7jUloIFekFrSF1FObAO92+nsDdy3bChuWhWjLHJhd3ZIbNTCZpKQUDcRFSJcK86
	TG3KswEy1O6aVZtXxa06RLB23xFxz1cmpou0TA9PWNtJojSbCuzbBfKQkhCgOzsMgkCN+IGLaxP
	DNyJIdTiDX5WSYysSbvtR5BUZwjxe/L4WzqIjm20M1fFYS7ENKZwcvqHO/fLBoAQtEYiynOFBcS
	HR4FE7KggBMoudTxXLcr41R9AZ4DHEBK3DypuOca0uOUleZKnLI63zIetlqXB3jrQaxA=
X-Received: by 2002:ac8:5d4d:0:b0:4ed:b409:ca27 with SMTP id d75a77b69052e-4ffb4a3c298mr254101121cf.10.1768310016930;
        Tue, 13 Jan 2026 05:13:36 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGMnv/lcUVT4eP4KfERHWUj9va04jydi2ZLUZKaGU1BHKtNSsfG/3e9UddbuRq0n628WO/yaw==
X-Received: by 2002:ac8:5d4d:0:b0:4ed:b409:ca27 with SMTP id d75a77b69052e-4ffb4a3c298mr254100671cf.10.1768310016477;
        Tue, 13 Jan 2026 05:13:36 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8720e090dasm514513566b.9.2026.01.13.05.13.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 Jan 2026 05:13:35 -0800 (PST)
Message-ID: <01de4054-eebf-4ef3-ad74-c806b208a848@oss.qualcomm.com>
Date: Tue, 13 Jan 2026 14:13:32 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFT 2/3] arm64: dts: qcom: glymur: Add USB related nodes
To: Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>
Cc: Pankaj Patil <pankaj.patil@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
        Wesley Cheng <wesley.cheng@oss.qualcomm.com>
References: <20260113-dts-qcom-glymur-add-usb-support-v1-0-98d6d387df01@oss.qualcomm.com>
 <20260113-dts-qcom-glymur-add-usb-support-v1-2-98d6d387df01@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260113-dts-qcom-glymur-add-usb-support-v1-2-98d6d387df01@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: TnwrXZFWtB1BVa-2Kzsseca-pIq8PEE3
X-Proofpoint-ORIG-GUID: TnwrXZFWtB1BVa-2Kzsseca-pIq8PEE3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTEzMDExMSBTYWx0ZWRfX6nim7VsAPRwC
 h0dOFMTvhnF75ce04XjqAhOSuSJ74lzxyyqcpBZ+K1K4zTAEcZj8CFH4Nfwj4UwZZZgJuYHicS/
 xvKRNF5utwy3Ig4+wZU/0ET2ZZCC1U4GtyF32PZ9ozBCA1p7k6sssO64WImuO7dnM3rHiF2MkmK
 QChezwuI3wtebpOj+IWxKBjjD2bh0n9MXS2FE7sT+b/+M6837eS6TBd/EtBWCnEesTLEbFuyKYK
 5bRLWGAcrwq21Uei3+HkQLweT7H7kR7poujOw5MKoo/OICDENE9VbGDTe1ScvhJTjY1Q15bZybo
 mkZ+6tdZXs5Cgy8VDaTMJFUtHbGM2sIDOxJMUQK/yIP8tc474fKrRjTLt/w4UJLFTYGdBx0unlF
 mp+/hssM7ELKsoUAjUTzf6/njKC26rCLeO4O9WAaRfvjs0ZdCY/9NwnTS0lNnWDRm7iFXmUWnl0
 en6ilSMXxeZW1kkH5Kw==
X-Authority-Analysis: v=2.4 cv=IIsPywvG c=1 sm=1 tr=0 ts=69664502 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=sYW25ZiEPLqq09AedJsA:9
 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-13_03,2026-01-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 adultscore=0 clxscore=1015 bulkscore=0
 phishscore=0 priorityscore=1501 suspectscore=0 spamscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601130111

On 1/13/26 1:33 PM, Abel Vesa wrote:
> From: Wesley Cheng <wesley.cheng@oss.qualcomm.com>
> 
> The Glymur USB system contains 3 USB type C ports, 1 USB multiport
> controller and a USB 2.0 only controller. This encompasses 5 SS USB QMP
> PHYs (3 combo and 2 uni) and 6 M31 eUSB2 PHYs. All controllers are SNPS
> DWC3 based, so describe them as flattened DWC3 QCOM nodes.
> 
> Signed-off-by: Wesley Cheng <wesley.cheng@oss.qualcomm.com>
> Co-developed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> ---

[...]

>  
> +		usb_mp_hsphy0: phy@fa1000 {
> +			compatible = "qcom,glymur-m31-eusb2-phy",
> +				     "qcom,sm8750-m31-eusb2-phy";
> +
> +			reg = <0 0x00fa1000 0 0x29c>;
> +			#phy-cells = <0>;
> +
> +			clocks = <&tcsr TCSR_USB2_1_CLKREF_EN>;
> +			clock-names = "ref";
> +
> +			resets = <&gcc GCC_QUSB2PHY_HS0_MP_BCR>;
> +
> +			status = "disabled";
> +		};
> +
> +		usb_mp_hsphy1: phy@fa2000  {
> +			compatible = "qcom,glymur-m31-eusb2-phy",
> +				     "qcom,sm8750-m31-eusb2-phy";
> +
> +			reg = <0 0x00fa2000 0 0x29c>;
> +			#phy-cells = <0>;
> +
> +			clocks = <&tcsr TCSR_USB2_2_CLKREF_EN>;
> +			clock-names = "ref";
> +
> +			resets = <&gcc GCC_QUSB2PHY_HS1_MP_BCR>;
> +
> +			status = "disabled";
> +		};


[...]

> +		usb1_ss0_hsphy: phy@fd3000 {

Let's not repeat the mess introduced in hamoa..

Perhaps let's fall back to usb_0 etc.?

[...]


> +			snps,dis_u2_susphy_quirk;
> +			snps,dis_enblslpm_quirk;
> +			snps,dis_u3_susphy_quirk;
> +			snps,usb2-lpm-disable;

Other SoCs have a list that's much longer, please consult Wesley if
this list is enough

Konrad

