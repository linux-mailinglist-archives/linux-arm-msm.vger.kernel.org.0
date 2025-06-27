Return-Path: <linux-arm-msm+bounces-62816-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 77BF7AEBB72
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Jun 2025 17:15:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0856E1C46757
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Jun 2025 15:13:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 32B5B2E8E05;
	Fri, 27 Jun 2025 15:12:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GkKRSkss"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A16552E9746
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Jun 2025 15:12:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751037166; cv=none; b=XWgW18dh6Y8+wpZvnP3iaNVg7vfLbpCMkLzaWZYzy3qRV/mIA7YjTBS5Afw3ZYbmtLMQsjGv5CCTWJ2inH9wMKYAMj60ZRnTb3AQa0m5ocRgBhzpjC+BF0wwwmxPOOYtBVBMEAiENotIJiCMVDARmh7soX67vU/bRCwzsFxsWp8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751037166; c=relaxed/simple;
	bh=ZvUhDINxNAiascznXAJsY4SnRs0y1OpkC51/1Pwt7EQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hHEIuwZeYa44xhh0J4AE0jJrgbtZbk9vWB5oy9h5e2E2HFXSXUPbVtT+E4D6uz2/7quruqJpQkicPU8UnarrCthsTeT2JsQXEQggNp+O299wo6rIDBnjbTAxz0ydVku7Qar0gSBSF+2NuWU3ie7vof2JNS4hLU9Na2ohAlaPqFY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GkKRSkss; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55RCFxjU032644
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Jun 2025 15:12:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	RIoYRSmaGzXOqnEzOL/B5Q1z9cDXwbAoMqevw2KwgyM=; b=GkKRSkssG0OmDcFW
	UoG0lMW07UrdPewDYEm8L3LUdaxPaICQHfNngqRb9NLsgqF8hdwtCYcFTe74qeTh
	fplDV0U0dV4uCLPzaSc5Nw02PGdJ0ZLeB913+1Oj/Tdo2XFieMjd38EoIkMzA9Vu
	sWYz3p6iERBLS/RvDd3Wz0L737kFD0Yxw8swNe8u7LYsquF9NDF0ZWoPVjAWzjc2
	QuElmeBFSd6mKkhzkRw376AVnCDdcNKVbrw8rVf5TpsWlEiwDlymPyGIuwNEtto5
	sevVeIIf+bCwSTcKsR0Ehv6ooSsUCC0gNN1thp35sKCpWQSct0aXoEjGJEQHF34i
	glhKPg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47g7tdh976-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Jun 2025 15:12:43 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7d094e04aa4so54651485a.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 27 Jun 2025 08:12:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751037162; x=1751641962;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=RIoYRSmaGzXOqnEzOL/B5Q1z9cDXwbAoMqevw2KwgyM=;
        b=fqCkRZebc1ausgFm84SXYLNuEGZN+x+IqMr71iqZxllgSgkkhY22DklrjhC1i66/5q
         jy6m1zgKY4rrmAbKM93coGxWxxUib1jAiyh23txrHpNrUrCpHkkHJ3sfMgySPvV2TrEG
         xa5je+liWrMO5D7P545I8HBERT5ygaKfdSUm7vQTmc1+TPsjf0+GK5156zEZEN5fLLLP
         ura7n/QD1OiPWX8mPI24CF8Xx0BxZPHVesCmXXDwMlQTFy8ArEblOYX+Y6rEXX483Nwp
         SUtBZXGO0mNp2XNHhwkiBkYmtG6tjMdc9QeSZ83sihSGa4h/TuBJjK/thdF8dnusEfsg
         f4WA==
X-Forwarded-Encrypted: i=1; AJvYcCXqs+0hEki8F1R3juX6MBq0Rta3XNVIv75bZRPqA6clcefTz+Zcs2uIKZWdZgwjAzbw9m71mm8T2oWKyy2j@vger.kernel.org
X-Gm-Message-State: AOJu0YzfaOuOh9JBfU0I3qVmS7rmcWSJWMel9IRgPfRuneVi3DI6/t6I
	aOOzPX+1p/NfLLhNtQSTZbJ+NujSiz+KOVpcptUBs1wr237n7+7/BVSPt7uor9YXC2ycqwo1M9W
	ukoqUTlBYzWtvSGjdZ6QarB63i3lShIxz+jkKAZoedfkMyyhsUgzXFprviaL9QKYDdMnh
X-Gm-Gg: ASbGncujPSJb+Q/DKS2qPA70rqD+/xx1CySlKVAM35+i8Ib0mWp5K/R9eGHtI9a7q+V
	fetSl8vTLpEYpKujGIjARZrpSzgXMvqVPv4/ZYhipkrLsg/TOCtGHzAg1HLsPo1G3zC+o2Aw/fA
	U7Yxv/BRZpxD7HeJZ5ZE0bFrF7Gf6rAZTv81iUQ53I7PEfo+NpfIPxT0RlHrSPPBdNm1kyjiHNH
	QMjHb4Rah0Q9IyH8m9JJ6deQ+ekLtSZ9GIj6fvdHYsxGyEkiPkMFjqA6PP1Wjd71BkTxETx/pUn
	EzkG8WtnRYfW8TG8+GjWw9YklyyzLcZozTyw+zyplr6wcU25j125ECbEvUEesf2KKPzsGWCB3/E
	xSuU=
X-Received: by 2002:a05:620a:c4a:b0:7d4:1ecb:dc36 with SMTP id af79cd13be357-7d4439349c5mr194101585a.3.1751037162234;
        Fri, 27 Jun 2025 08:12:42 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEAa6Nt6lvKcUWICIuULsHahpspj6k3wDamoAEPH0/kd+3Bw6XkFerAIUGmzFJfDxdsVjE5YA==
X-Received: by 2002:a05:620a:c4a:b0:7d4:1ecb:dc36 with SMTP id af79cd13be357-7d4439349c5mr194100185a.3.1751037161591;
        Fri, 27 Jun 2025 08:12:41 -0700 (PDT)
Received: from [192.168.143.225] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae353659e06sm136750066b.44.2025.06.27.08.12.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Jun 2025 08:12:41 -0700 (PDT)
Message-ID: <b487b8f1-906b-401d-ae6b-fe8707b7a063@oss.qualcomm.com>
Date: Fri, 27 Jun 2025 17:12:38 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 2/2] arm64: dts: qcom: qcs615: Enable TSENS support for
 QCS615 SoC
To: Gaurav Kohli <quic_gkohli@quicinc.com>, amitk@kernel.org,
        daniel.lezcano@linaro.org, rui.zhang@intel.com, lukasz.luba@arm.com,
        robh@kernel.org, krzk+dt@kernel.org, andersson@kernel.org,
        konradybcio@kernel.org
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, quic_manafm@quicinc.com
References: <20250625043626.2743155-1-quic_gkohli@quicinc.com>
 <20250625043626.2743155-3-quic_gkohli@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250625043626.2743155-3-quic_gkohli@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=CPYqXQrD c=1 sm=1 tr=0 ts=685eb4eb cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8
 a=VuxlMRAdqVenG9OKrt8A:9 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI3MDEyNCBTYWx0ZWRfX5c3iITsPbIx7
 KUCSEDb43gWAmQX6+UxaUFL/QPQ0V4CVljc5DjPBdcaO43fITCRNoRua3xMJ+XvrP3uoLxusFDr
 ui90Wiu5NohG9jM1oaZIonAHLvLCH4/dkQkb9tgh+iz4nX0mlFM+nWV111sGk8juuR6Q8F8/fLW
 xmBREo/5fZ/ygwKtVexA1jEw4yAye9OY8jSE3jWIrjmNYpASSCRsGSCu/0HG1vT7WMbOW+KoET1
 /Ga7IYlAcpO3yOwHz/4DaknyPlSAciBQt0+JYmdO1rp4Yl3rNo4FxsWOOEH0WdUtllFWysgqgP1
 ZFqpro5OpX6CUU3HkcmszDmqyt7JNYaZyzR84Ho+iROUPX+5PIkC10PmsS5OZRTDGKwcm9PFRC2
 +vxCBmT+q9ePbKidZB5sr3eDaham2GkjwPIFrBCY9NX2uhh5qWocEq4BYUqpAB2Koq/vOFMt
X-Proofpoint-GUID: dO8LcolDz03oolh2_Y00UCL5diMDx-Vv
X-Proofpoint-ORIG-GUID: dO8LcolDz03oolh2_Y00UCL5diMDx-Vv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-27_04,2025-06-26_05,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 phishscore=0 mlxlogscore=832 lowpriorityscore=0 malwarescore=0
 impostorscore=0 suspectscore=0 clxscore=1015 spamscore=0 priorityscore=1501
 adultscore=0 mlxscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506270124

On 6/25/25 6:36 AM, Gaurav Kohli wrote:
> Add TSENS and thermal devicetree node for QCS615 SoC.
> 
> Signed-off-by: Gaurav Kohli <quic_gkohli@quicinc.com>
> ---
>  arch/arm64/boot/dts/qcom/qcs615.dtsi | 205 +++++++++++++++++++++++++++
>  1 file changed, 205 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/qcs615.dtsi b/arch/arm64/boot/dts/qcom/qcs615.dtsi
> index bb8b6c3ebd03..c20e98f8399f 100644
> --- a/arch/arm64/boot/dts/qcom/qcs615.dtsi
> +++ b/arch/arm64/boot/dts/qcom/qcs615.dtsi
> @@ -3692,6 +3692,17 @@ usb_2_dwc3: usb@a800000 {
>  				maximum-speed = "high-speed";
>  			};
>  		};
> +
> +		tsens0: thermal-sensor@c222000 {
> +			compatible = "qcom,qcs615-tsens", "qcom,tsens-v2";
> +			reg = <0x0 0x0c263000 0x0 0x1ff>,
> +				<0x0 0x0c222000 0x0 0x8>;

These '<'s are unaligned, please make sure your editor's tab width
is set to 8, do the maximum amount of tabs before it goes overboard
and fill the rest with spaces

With that:

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

