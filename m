Return-Path: <linux-arm-msm+bounces-38076-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EFA859CF49B
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 Nov 2024 20:12:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B64FA287EB0
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 Nov 2024 19:12:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 472301D90CB;
	Fri, 15 Nov 2024 19:11:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Twyiu6vh"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF7F81D5148
	for <linux-arm-msm@vger.kernel.org>; Fri, 15 Nov 2024 19:11:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731697916; cv=none; b=sCL7TSbRzKbqOTJaIP+0sAKFBAMiNsZFX+htl2mSvzgGeTM/HzPfVauvOfXzzYS+H8nywxtK76109bve2rVi7bH+leE3szDbzzx5sBuLDhNY7IMBFcPrnvVjLAxEvgJGx98dZ+HlQy5bHFH4hf4Ovmskqd0x2xrpKjakEDUV8CI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731697916; c=relaxed/simple;
	bh=1Krt92pNvWCnlz4ziZBq35cten9mPKPpoYmUs7vYb0I=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=t+hBCFLY39r+dMBwAp8+ejp7CxEIgd2SkNyHTqeabq3zV+nS27WZkPQWev3Fw/fypE1Jjelb72qARDgyZLlesBVIKBQlmyb1NuG25OiVFWT37nV9hptDKbdWkjGLYXMLh+53jpehEKEvXzdPBjM/prcn0qXnHVd/rPQiZuOWFM0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=fail smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Twyiu6vh; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4AF91ks4023942
	for <linux-arm-msm@vger.kernel.org>; Fri, 15 Nov 2024 19:11:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	oNWqqLzGcGPWlxdHygK3rqDNf1gWjTRbW1EXE3/TxDA=; b=Twyiu6vhsr06RU3z
	2Vdf03X/OLVQALJcjwztkNLaaz4m6Z6B5UglV33OjAfN536yKZNCZ0k2cAB7kSLf
	GNx8iJ323WU2tEt7fMZeIJXuvrLlTtycrxyOY0/mJEWuuncsb3yjOkPRFUeh8qC9
	PFt4lBtUz+mH6FXqufn/8xsYR7fdLPaTOpQ8zYziIy8SdpwCwu94aUVCxzyFnwOF
	w+Jd7Il22B7n1x2EEa8gGiSw/nDSL1wSJ9WZ2Qzu76UPHnixydY3h6lcOyyUlN0f
	8kGzoRQaBgAyY517vJfXod+SzU6wiEYVASQ1hx4zeBEGlp4FpwLwuc63wpOi9mLU
	8+DMGA==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42x3achkn9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 15 Nov 2024 19:11:53 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4609c883bb6so4855821cf.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 15 Nov 2024 11:11:53 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731697913; x=1732302713;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=oNWqqLzGcGPWlxdHygK3rqDNf1gWjTRbW1EXE3/TxDA=;
        b=bx+gyCwv+rXkhBpdlNCNzYikwGitNPWSF9szVncgEHZjI9WEOwO03I2acpu9lOocS4
         4OruPR5dpWKE1cDEGS9fwvVe8tY3dIjFL/iHF1NHHVxJMsTFOJBji4BmvRhgczgme2kT
         iIMuzUaMWPNJUb7ZPPJMesZJB/A5oLh1lMioVCZrU0dYGS7Crz19bOwyIl/5yFdR+8zo
         5ByN/DNcehzDA/DJOrfLidoP80t9vZSw0JKuYim2hb9l21EtgqKuH6X7KZHjNKf32IY0
         SibZuAJHR2iuN8OS3woTPXbSjKb+wjL0BqOgHfsoUkEDnF2ZaZJgwqlgTZhWhRBBjpnC
         HErA==
X-Gm-Message-State: AOJu0YwjgFQK50Xmqg2O7qdsQk/S/Ip/9ae3OKvcefXle2iAw76mnXrc
	Y36AgNEi8ezVzoMGbME7zhnO77RubUSPQje1Tu7tadgrsxQ18N5UXdUUxdwK4Bv36ApdFeiKIjX
	Uhyv1EvJWE3L4ESD828dFbBbmod2QdbvbDXEfcWfDId7RlQnzbyy7h7Z0bP13iZDu
X-Gm-Gg: ASbGncvQHrsz+UbIsinDS8NqpAPQv66zkjBPdBmQBeVNTNTa6uGU4MopXeWnj1/nst4
	88BcHCM0kS36UEKQEHg/pfpzuH0s03fwATah9YcJnPAnhkGXv1R/UQ8H6x3ArPxMtXKhtBpFXVa
	jr8raGzOb1UrvLOlxf0PYfiFFB3M+3/YJWx1eULzo3GLDWogTKwHKMwMicq4vcPe7FlGHVjDIL1
	AJJ/JNHgqVgtUnipBcTxOFK+IGLZL39HwooyIK8LbUzLIK7Sdn4D4CQ92tofdQehGfCnB6x2ID8
	h1gzY0iZud+IU42/QUSOa8mcaHAQosw=
X-Received: by 2002:a05:622a:1442:b0:462:c24c:a3cd with SMTP id d75a77b69052e-46363de973fmr24011401cf.3.1731697912484;
        Fri, 15 Nov 2024 11:11:52 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHoJ6uiVG4NDBcbXVF7hLurg6c/ZatD58ZGlI56wghztdbwU8rJbTRjRniZqH2vAHFmNo+WGg==
X-Received: by 2002:a05:622a:1442:b0:462:c24c:a3cd with SMTP id d75a77b69052e-46363de973fmr24011081cf.3.1731697911951;
        Fri, 15 Nov 2024 11:11:51 -0800 (PST)
Received: from [192.168.212.120] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aa20df265bbsm207556866b.38.2024.11.15.11.11.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 15 Nov 2024 11:11:51 -0800 (PST)
Message-ID: <1e902d79-5dad-4d12-a80e-464dbcf851c3@oss.qualcomm.com>
Date: Fri, 15 Nov 2024 20:11:48 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] arm64: dts: qcom: qcs615: add ethernet node
To: Yijie Yang <quic_yijiyang@quicinc.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Richard Cochran <richardcochran@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
        quic_tingweiz@quicinc.com, quic_aiquny@quicinc.com
References: <20241010-dts_qcs615-v1-0-05f27f6ac4d3@quicinc.com>
 <20241010-dts_qcs615-v1-1-05f27f6ac4d3@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20241010-dts_qcs615-v1-1-05f27f6ac4d3@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: UFwKUPzznc9uNEd5G9RVFuVxLalLCHGK
X-Proofpoint-ORIG-GUID: UFwKUPzznc9uNEd5G9RVFuVxLalLCHGK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 suspectscore=0
 clxscore=1015 bulkscore=0 impostorscore=0 adultscore=0 malwarescore=0
 mlxlogscore=999 lowpriorityscore=0 spamscore=0 phishscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2411150162

On 10.10.2024 5:05 AM, Yijie Yang wrote:
> Add ethqos ethernet controller node for QCS615 SoC.
> 
> Signed-off-by: Yijie Yang <quic_yijiyang@quicinc.com>
> ---
>  arch/arm64/boot/dts/qcom/qcs615.dtsi | 27 +++++++++++++++++++++++++++
>  1 file changed, 27 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/qcs615.dtsi b/arch/arm64/boot/dts/qcom/qcs615.dtsi
> index 0d8fb557cf48..ba737cd89679 100644
> --- a/arch/arm64/boot/dts/qcom/qcs615.dtsi
> +++ b/arch/arm64/boot/dts/qcom/qcs615.dtsi
> @@ -420,6 +420,33 @@ soc: soc@0 {
>  		#address-cells = <2>;
>  		#size-cells = <2>;
>  
> +		ethernet: ethernet@20000 {
> +			compatible = "qcom,qcs615-ethqos", "qcom,sm8150-ethqos";
> +			reg = <0x0 0x20000 0x0 0x10000>,
> +			      <0x0 0x36000 0x0 0x100>;

Please pad the address part to 8 hex digits with leading zeroes

> +			reg-names = "stmmaceth", "rgmii";
> +
> +			clocks = <&gcc GCC_EMAC_AXI_CLK>,
> +			         <&gcc GCC_EMAC_SLV_AHB_CLK>,
> +			         <&gcc GCC_EMAC_PTP_CLK>,
> +			         <&gcc GCC_EMAC_RGMII_CLK>;
> +			clock-names = "stmmaceth", "pclk", "ptp_ref", "rgmii";

Please make this a vertical list, just like clocks

Konrad

