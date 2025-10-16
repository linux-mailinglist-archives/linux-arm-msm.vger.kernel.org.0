Return-Path: <linux-arm-msm+bounces-77525-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id E2B61BE1ECA
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 Oct 2025 09:29:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 989EE3A5FBE
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 Oct 2025 07:29:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EA44D2E62A4;
	Thu, 16 Oct 2025 07:29:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="pIF8MKaD"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7084D1DC985
	for <linux-arm-msm@vger.kernel.org>; Thu, 16 Oct 2025 07:29:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760599783; cv=none; b=UDvbdySrNizyBvkPGqnlNA9yoTRMHo2gTpMp8xbACO/aJ6YgFoeNE5qolPnpkkGCjcd+cUDxpH0dKeNRurSgE9o0uciPnNJyolEC9b2dTWChYdin5ZTKvACrhCd2DNYpgD0fVwS4gh98O+08YSaIwYkOYN6atEkrtLJH1PGO5kc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760599783; c=relaxed/simple;
	bh=vOWUD51lLgmsalGC6T8618w1NX1MikJVVjmSDLYiA2c=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=cf+ON/ASa1oJE1hWvQOhF0jr8oTMxtEz1SPo2PTts4O0mgjNu+XrneYuhwMUilL5upQ2sU9RApIRyaiUxNoC9zN9yIrdf2wl+NJ0R5bF/DzgyZdVsy4//E1C+1oJ9vsvi1q7PpUJvJRypsGpDBMMdc946VwQBXUv0mMoW+MOc7Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pIF8MKaD; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59FJPaVT004300
	for <linux-arm-msm@vger.kernel.org>; Thu, 16 Oct 2025 07:29:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	1Ul+cS2P/8sZ0yvovVHbSWbxCfkZYKO7WdKq0EttCbU=; b=pIF8MKaD73gBUnDN
	TvjBLzaC8dQG6jfnwYBSgUrb2uvvOeQczYw8pF/mK63VW1fJ6vQUMACQ/JEc82AR
	ZdtnL3HclhjJpwVrdyfIT8EtjfN1Cz/YkqAS4+lnIWR2LViDOk1fm5OZ4bU2/00C
	vCECIxtiqZGblaD+vHxzKauyyjzaoZQPO6VcPTSh1VB8v2ZNJOPTFAJrgJMoJW/9
	mI9cMOF/WSdELLFbzE+0/8z7Zazf+MmHAsMjbj1r/h6pHPhhLr7QBDxYxGPYXwtM
	K1/R1KR2VPSMte7KvLe96hPZEFqqUsDZ0yq2o5Ggr3vs2Qfwrc2cXIzQXz5m2tus
	1BvO+w==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49rw1akp6m-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 16 Oct 2025 07:29:41 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-88f3a065311so15525185a.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 16 Oct 2025 00:29:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760599780; x=1761204580;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1Ul+cS2P/8sZ0yvovVHbSWbxCfkZYKO7WdKq0EttCbU=;
        b=qP2CaL3qT+Hub/oid7AKJr2o4JPTnaMm0vCYOqMBsaHu5iMW6fOoifxHa5FpfZTPCs
         ESv/gzNz5ovq9HekKiZ+m2+JpMQK1HafdZtvfxeAaRWSlzmaO1rbdpzuKEANykNTz1TN
         NxskWLEcF6G5bdxOFXUu8zERL5ifxvmfUcAfw52glsVJ/KGI9608FWklgnkh/81Zlv5J
         C0awjLRNJtHDSisrI+vkSkdgpHhnv3IhFbAnpC6rFHp7eFv3e+feG89IswMIaSOtVE7z
         weuP1TJzMh48uhY6KVs8/YTRZ3xLNmYXvxxjMQCVsy3TTjTycydU0CIVB+rcK2frg6Ik
         K8Bw==
X-Gm-Message-State: AOJu0Yz55SGxxK7rkITd10Unm+rvIETlpNFp9fWa5lG/Kb7QO4ZRiySw
	xvBTkzO7oDNgs/aAumEiyy4AXCCbyfyggN5oJtkvfcZu84u1Wm/yYNf1AaUhOi+16Vzb1xPEIYO
	7cUjesI5OX9Gqp23cQlrbC6DpQYvOh5UOY4IXEFCYCPSyrvLLLQYRtP6+5e/uKElB8NiB
X-Gm-Gg: ASbGncsoBl4m2N6bEnzMQoF1EuXZwTgsRWGbjoxqZAMg8r1DR8wmTuicS6rTLhIS/3z
	1yB3gUKgJGXN3hXzJxciic5FOyCyOiX7cwB88fzlkRQfYzAzsDtEN2Qcf2h9sNwaGMK7y8PtT6I
	PeSsr6ZGbSzX7A5BYBHZVjFdp7asdcgZajgSFy7ZYyGtvKWm7aqyR3x+m4ufNfBEGIPmG9S7YuB
	Lf++DPZaYiqqVfdhuHh7L2eZJC1YKDSc2TlwJRh/aMKKFAho0aTBLFPhdzQPXz+IOgy7592Np++
	QV5H7pgnBhgOnXh5eyfOhwg4RGmAjqgPDGi9fJIi71b9n2m2NsAlDIErAIQX8AvPrUOOOpWlPnt
	MwKjeYA8zFIn1Jogc1LuDd9WJnpc9h6P2V5B5OzYgiWUpOXLxiqaRddw4
X-Received: by 2002:a05:622a:1aa5:b0:4e8:97b1:2f00 with SMTP id d75a77b69052e-4e897b155e2mr2758981cf.0.1760599780423;
        Thu, 16 Oct 2025 00:29:40 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEZPVvx/y5rXszJuqXQFALq9qWPHwXrn3tefhQ1e+HrqCDMb/uqpc5hc+tncqvs1nrxQRHx2A==
X-Received: by 2002:a05:622a:1aa5:b0:4e8:97b1:2f00 with SMTP id d75a77b69052e-4e897b155e2mr2758851cf.0.1760599779868;
        Thu, 16 Oct 2025 00:29:39 -0700 (PDT)
Received: from [192.168.119.202] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b5cba06c187sm431603466b.31.2025.10.16.00.29.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 16 Oct 2025 00:29:39 -0700 (PDT)
Message-ID: <80c71cfd-e12a-4707-ad03-e03b0ac48838@oss.qualcomm.com>
Date: Thu, 16 Oct 2025 09:29:36 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 1/4] arm64: dts: qcom: sm8750: Add USB support to
 SM8750 SoCs
To: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Arnd Bergmann <arnd@arndb.de>, Nishanth Menon <nm@ti.com>,
        Eric Biggers <ebiggers@kernel.org>, nfraprado@collabora.com,
        Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Wesley Cheng <quic_wcheng@quicinc.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Melody Olvera <melody.olvera@oss.qualcomm.com>
References: <20251015105231.2819727-1-krishna.kurapati@oss.qualcomm.com>
 <20251015105231.2819727-2-krishna.kurapati@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20251015105231.2819727-2-krishna.kurapati@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=K88v3iWI c=1 sm=1 tr=0 ts=68f09ee5 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8 a=f22nYxuSTbU4L-cX1K0A:9
 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22 a=TjNXssC_j7lpFel5tvFf:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: ja5_KSDA8toN2mzLHOqW-yEIlTG7_wHM
X-Proofpoint-ORIG-GUID: ja5_KSDA8toN2mzLHOqW-yEIlTG7_wHM
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDEzMDAzNSBTYWx0ZWRfX+BTbHSvMvlHr
 rcSJXSNGelnwo06mn6VIoBphh6Sf682vlKgvCzmJTlQiX+Fu7GHFUh9p+meKKoxpWH/yWWMDLmg
 zn4t3O3t7o17etBBsyNVdKz3+f9q7auF2uuTCNUoOiKz4nUr5CRMkNiv5L2vM6NWFJhhq1T4Dnx
 LctJ02dNhm7CQY2pHJ0kwAptMOQevqCApzxl7dStnkPa/Njz+qrmbDqtL96t/CRpxn9SMSfbgfk
 AxaySummgXkLr+kqQAYiiaYPl0TLnZO5b5Vm+q86p4PbJW8g200P3wqNKCm0INXzZIZjyjOL8ux
 dJaXSufIQljSFNwWGlARFPl6X0cHB/ovZBL1Bs9o6EmURwF+1FmIQSa72PXviraQhx5abnQIkXF
 ZYDE7cGbC12WGmzNs/IQU07Wya8r4A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-16_01,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 impostorscore=0 priorityscore=1501 phishscore=0
 adultscore=0 clxscore=1015 bulkscore=0 suspectscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510130035

On 10/15/25 12:52 PM, Krishna Kurapati wrote:
> From: Wesley Cheng <quic_wcheng@quicinc.com>
> 
> Add the base USB devicetree definitions for SM8750 platforms.  The overall
> chipset contains a single DWC3 USB3 controller (rev. 200a), SS QMP PHY
> (rev. v8) and M31 eUSB2 PHY.  The major difference for SM8750 is the
> transition to using the M31 eUSB2 PHY compared to previous SoCs.
> 
> Enable USB support on SM8750 MTP and QRD variants. SM8750 has a QMP combo
> PHY for the SSUSB path, and a M31 eUSB2 PHY for the HSUSB path.
> 
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Signed-off-by: Wesley Cheng <quic_wcheng@quicinc.com>
> Signed-off-by: Melody Olvera <melody.olvera@oss.qualcomm.com>
> Signed-off-by: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
> ---

[...]

> +		usb_1: usb@a6f8800 {
> +			compatible = "qcom,sm8750-dwc3", "qcom,dwc3";
> +			reg = <0x0 0x0a6f8800 0x0 0x400>;

Please resend this using the flattened model

Konrad


