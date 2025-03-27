Return-Path: <linux-arm-msm+bounces-52657-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 24F57A7340D
	for <lists+linux-arm-msm@lfdr.de>; Thu, 27 Mar 2025 15:14:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 24A7B17CB95
	for <lists+linux-arm-msm@lfdr.de>; Thu, 27 Mar 2025 14:13:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 51F26217F33;
	Thu, 27 Mar 2025 14:12:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="EIW1Xca/"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1F88217734
	for <linux-arm-msm@vger.kernel.org>; Thu, 27 Mar 2025 14:12:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743084745; cv=none; b=tb366ZwDCCPeb8r0V1SJeBtbE8pIwEkuZjqOr0h06foCO8D67pD7hmiD+a+0OVQCd+6PviqKdO3FC9mJh7Bx4UM2EPUmPn9rvwu8+xoUC/pwYFM9kF3wrvf/CJcfTZAVnQZB0VZYLxQLl2mP7fHzTpXXvuQ9Va31s4lSzP3dBtc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743084745; c=relaxed/simple;
	bh=7CH7Q6O3JSFwKpON5PQPAnAXG0bbHeve2wlnWMw1pNk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VqJ+Mp6PtxqWOdD2ffaA37wyUJFvXBc2YLGW8UNtK0eiWvzX1/JLfl5dmvNOpo/hEdKZZj/38h5B4b01vtZ3tCD0PUd3GA1+uClGZcVv0nlvFtV4lEY4bNlgJNvP+cW+4zxLcylIaeSWfKvEBVibiYbdGdbshluhc6mi3ZsajYk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=EIW1Xca/; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52R5ll1d027640
	for <linux-arm-msm@vger.kernel.org>; Thu, 27 Mar 2025 14:12:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=N4QswrYUV3RTG9GPyKC8dQvZ
	FQFrSEYy4NaWiQ2/bw8=; b=EIW1Xca/pTuzuoCk+YcwpVSVRwveASpsNoqUl8Rb
	H6Pd/0PEEP1i4o6i9dnCn1eIvsXNiS/pNoTmKOus3t0z6CmemqyrEWQWzRLc3Rsz
	wbX/v7jKmEKaFvyIsu7c+nXYFPrO4DFxHpn98mKS9AGOUB0LIoy6KVu9aqgB5Z5T
	XpgAKNg6AkQtOlevXtt/eUmLBXT+7M+XegzlBDHJ0SjxmQ8IVdMCkVoHhBjG0LRg
	XQQxmNJHIViLMM0LQSM6DsL8go8i2aaVD/k2Y3ljUKjzuNZyqHroJNRflYf6qTNf
	6dGNNkBY4uU2yQyfJ9t+JDP1BhkNE+Tz34KLYg6q8hQMPQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45kmd4rrqm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 27 Mar 2025 14:12:22 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-7c09f73873fso148661785a.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 27 Mar 2025 07:12:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743084741; x=1743689541;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=N4QswrYUV3RTG9GPyKC8dQvZFQFrSEYy4NaWiQ2/bw8=;
        b=KDR2kwXLjiuF3Y0QyUrjClGshxgAryH43tYwZbt/jVvm5A7rMMMnSfJjLkJldj0wFK
         QfW+ry73Y6RJ8AJJV5ZU8hX6ayF4V9/uG4L1Dvgf6vu3vGAaW94ij5I+l2zIiviLGQ0m
         FQ/Zfh3Lf84l2kHNPttQ8yC5SQ+zaRnlRgXQdMxpuffwRcrm24aVjAYWrWurgCddeIjL
         prB+p7Z/l0A8AmHq0pCjMIz/ED/K5m3TM8YmZGR7300rbGdlkdZxgQ4WS7eArIL6UOd2
         BMgK/HRKEBhVlJhrDUtDX2zIUFYwnecUrcYL1xMuVIGovMAMmuc+AhYCQNVh8ZJvgeAA
         be8A==
X-Forwarded-Encrypted: i=1; AJvYcCUUQp/TcJnbSSTgGZMfE8lnt8zyPzb0tYP1fMhYJwW5M0yCGstoPkc4DoAEjq/AifM6Pn9XQsX1YV+WP2zb@vger.kernel.org
X-Gm-Message-State: AOJu0YyUuKHiFaetHXhh8P1Q0lD/l/tiIVvRL64cOHdOskhwp8hyh/4Z
	zhaCd1woNSiLRFPsO7jhNjPrLZViIgVuK+umu6w7gAcpgiukwYN67Xckb+vgvxMR3lzN7yWsWJR
	Fq1qfeK82qgSP1lcMtnMTIgmFSLu1Vt7nVcpputEqNUXoOqI4sJHeeF9P0oene349Cu16mzll
X-Gm-Gg: ASbGncuV2TnhgjB4OI/ZQp7Xi/Xioqp95TDmCKROXXbajDPn47k+UW5W+U0GQRjcAR7
	cwxoRjxFFB0KDS3/UIdUR/CzHakuzMgWsFn9qnl6crRY9+U6hh0qqq/rN6sryJ3b0bb8TFelBXm
	0qN8VTlPfWfQzmfwvpmuiYcwdZoFAMFIKCSqAa8lF6guHXGyX/0A9VV4z4VBCryTy/7k8SRLgno
	/n1YqJUVAwliif9T4Qg2xHxc+SlQP4bIJhW/e5jav7D8BH14Tqxv81PTyXwKnswfChptIyI+oIE
	/BW1MYQkcHY1OVMsOosyEPjZ4XApUuWaumfhR9/BOp/3+tZ4N5DF2ga1cTFiG4aYP/TtxTL+IJX
	Jg8g=
X-Received: by 2002:a05:620a:4692:b0:7c5:3ae8:4d6 with SMTP id af79cd13be357-7c5eda852cfmr516578085a.51.1743084740837;
        Thu, 27 Mar 2025 07:12:20 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGaDnIyMisDNt/IMzJqGhZ316o8YifRrhjCXW1eC3YaF5GflhzvB1roO/YCVnm6c3SEcUv+YA==
X-Received: by 2002:a05:620a:4692:b0:7c5:3ae8:4d6 with SMTP id af79cd13be357-7c5eda852cfmr516573185a.51.1743084740354;
        Thu, 27 Mar 2025 07:12:20 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54ad650839asm2156336e87.190.2025.03.27.07.12.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Mar 2025 07:12:19 -0700 (PDT)
Date: Thu, 27 Mar 2025 16:12:16 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Prasad Kumpatla <quic_pkumpatl@quicinc.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        cros-qcom-dts-watchers@chromium.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        kernel@oss.qualcomm.com, Mohammad Rafi Shaik <quic_mohs@quicinc.com>
Subject: Re: [PATCH v1 2/8] arm64: dts: qcom: sc7280: Add WSA SoundWire and
 LPASS support
Message-ID: <xwspvzrzzhqqhpt5ix2a6itwizmgc7lcazxba2mteccg5d72tp@wrzcr3wflvlp>
References: <20250317054151.6095-1-quic_pkumpatl@quicinc.com>
 <20250317054151.6095-3-quic_pkumpatl@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250317054151.6095-3-quic_pkumpatl@quicinc.com>
X-Proofpoint-ORIG-GUID: dO7ViKLhoE7kxd0fsO5DVjXxAXnNKXaA
X-Proofpoint-GUID: dO7ViKLhoE7kxd0fsO5DVjXxAXnNKXaA
X-Authority-Analysis: v=2.4 cv=QLZoRhLL c=1 sm=1 tr=0 ts=67e55cc6 cx=c_pps a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=Vs1iUdzkB0EA:10 a=COk6AnOGAAAA:8 a=ReR21a_A8SWDzpTlyHwA:9 a=CjuIK1q_8ugA:10 a=IoWCM6iH3mJn3m4BftBB:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-27_01,2025-03-26_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 priorityscore=1501 adultscore=0 malwarescore=0 phishscore=0
 mlxlogscore=915 mlxscore=0 clxscore=1015 lowpriorityscore=0 suspectscore=0
 bulkscore=0 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2503270097

On Mon, Mar 17, 2025 at 11:11:45AM +0530, Prasad Kumpatla wrote:
> From: Mohammad Rafi Shaik <quic_mohs@quicinc.com>
> 
> Add WSA macroLPASS Codecs along with SoundWire controller.
> 
> Signed-off-by: Mohammad Rafi Shaik <quic_mohs@quicinc.com>
> Co-developed-by: Prasad Kumpatla <quic_pkumpatl@quicinc.com>
> Signed-off-by: Prasad Kumpatla <quic_pkumpatl@quicinc.com>
> ---
>  arch/arm64/boot/dts/qcom/sc7280.dtsi | 68 ++++++++++++++++++++++++++++
>  1 file changed, 68 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sc7280.dtsi b/arch/arm64/boot/dts/qcom/sc7280.dtsi
> index 39fbd3c40e47..90b2f6e2b7c0 100644
> --- a/arch/arm64/boot/dts/qcom/sc7280.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sc7280.dtsi
> @@ -2602,6 +2602,64 @@ swr1: soundwire@3230000 {
>  			status = "disabled";
>  		};
>  
> +		lpass_wsa_macro: codec@3240000 {
> +			compatible = "qcom,sc7280-lpass-wsa-macro";
> +			reg = <0x0 0x03240000 0x0 0x1000>;
> +
> +			pinctrl-names = "default";
> +			pinctrl-0 = <&lpass_wsa_swr_clk>, <&lpass_wsa_swr_data>;

pinctrl-N
pinctrl-names

> +
> +			clocks = <&lpass_aon LPASS_AON_CC_TX_MCLK_CLK>,
> +				 <&lpass_aon LPASS_AON_CC_TX_MCLK_2X_CLK>,
> +				 <&lpass_va_macro>;
> +			clock-names = "mclk", "npl", "fsgen";
> +

-- 
With best wishes
Dmitry

