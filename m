Return-Path: <linux-arm-msm+bounces-57637-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 44456AB459E
	for <lists+linux-arm-msm@lfdr.de>; Mon, 12 May 2025 22:48:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B8154461D37
	for <lists+linux-arm-msm@lfdr.de>; Mon, 12 May 2025 20:48:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 038B6296FA0;
	Mon, 12 May 2025 20:48:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NmdosR2w"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26A621DFDE
	for <linux-arm-msm@vger.kernel.org>; Mon, 12 May 2025 20:48:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747082897; cv=none; b=Sa6ET7z0DEE5WTOx74maC/zxCOJWs1ONwCdjnSGHCo0IqVLKzzERF0yE9KIX1cU0I8L13qPmGMPxWDz8c4O4FNQqnDtDL2mUjZ72lWN+r7MbU1IG5ic+0jzyowkcuiU9l+YZZIGPDp7Fn98A0ojmo0jJavKHEkIqEbIHL8YTzUQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747082897; c=relaxed/simple;
	bh=wetSk7KQyPe93VuWtTaariuwT9d+FE4GY1/B0UWkXGQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=IP7FrILPo3yqS+af5m27nlEjUoB4BRSjHeVuze7NS7EBrcqdX9dkXmGHlZIAY2sxxe1kD21IF9st6m6zrTi/9PBtVHzOZ/nMsdBSQEag/yfy8MQ4zVdCShYiM8zJpuX2MPxUouu63HwHjsPRFUNxrmgRGE6X5gpDn2eDILPrxOQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NmdosR2w; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54CINuxY028882
	for <linux-arm-msm@vger.kernel.org>; Mon, 12 May 2025 20:48:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	kMEGDGWDes2oQel40VYHijcONjInO+gIQOaXNYTja7g=; b=NmdosR2wzeX82hjX
	R7xfQNChr9s2zZRwEvXdMAMePnYf+JdmCSvMKpmtM5pHAPB4WbzC6UqF0byemHgR
	na4kT9knRJBd7KBRH+oezlf+aLo2y57Zunnb1BalfmDQyzkc7FYiIQcxwUbep/gP
	Wk1B9DC2Lp2f2elSVqOc+XwWzF/D3Nn1U8hCQkxXEIPOHQGt3ht9PMPbdUXq3S2c
	A181Ik3scTCZwoGH8aDUvACinXDjr6UcxqJZp395tB9PG+DG5dBn9DC1LAltrbcK
	eQIaPFbJqQK4v411v6qFvUGzyg30gbwDaTMMPz0H0iLw//4NwUUV5nI1jiSfI5gt
	aKUpSQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46hv5qdub0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 12 May 2025 20:48:13 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7c547ab8273so53362885a.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 12 May 2025 13:48:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747082893; x=1747687693;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=kMEGDGWDes2oQel40VYHijcONjInO+gIQOaXNYTja7g=;
        b=Yfq1hHxzC35f04JGIqw8K3Pr50Y0qR2zgcDNfR+DOcOmgR7V8crgTDORzIAVaqzf24
         Xv8L4jSybBG4yiLzrze/tlH9XJV9Cli6X37LUDA6xS9scRgTqwo9sGXEwgAN5RCLEU/Z
         bsyyJMEUgAmJRf3qOzzE+68jz9MV8eE2abPVC5BiHFn4DgLVxqoET/JB6LuAUo8MHYyx
         AGTjPtWNNWwIwAS1PNjyM0miA2VBB1Y7WhnYAmV594yimseQLbxmxT6CA412Tu6NMqbq
         DfChWm8j5XMThdY3fHN7Q07cAzD3uL8X4rvPXHk4VXGaZeQ8mw6X1nJfkci2nf4KI1wb
         iitA==
X-Gm-Message-State: AOJu0YzcvUX5wbtXt2lCZOqI3fyBpVqY4x9YC3aP4DXuDAJ+ARGG0aWS
	BXgIz3Kovq+adjnkoaxe9l7AsXzUjVck9Q5ZHm85Gabgsd+mTh0sckZEsWLrDiIJoByKhE/Opp/
	oTjRPXeVutemZSs5FSWZ30UtvDpJVDLAAXrBsQXro8xNqZLX0tVf5RA8jmOf4APlD
X-Gm-Gg: ASbGncuzYGczu92ug2b3W+uuFjijuq4WX2DxlDJ7Kasnhhj2qqHmHMfI7ALftrzBIUQ
	fVjcZnmAPSEExJrsM/fBcJ6wf3Oia113W2MomfMoCJZoGRC/gG8d8S8WtdbsvkLXPQDUsctz59v
	CD0kgvnzfrbCq0dnTKkjWjZGDvoyhtZpa6Wfn1lYfaHgtqlqLBG8b82DGLrNeC1Vti7QyyIjzoN
	iu47+UfrcstCbl8zPbF2nRyNw8zJg8dTTh66iFVUYeIlV5EKPXWUiiQbnrJbPEsGyhGDi7L8NBk
	fngUBq96mPJ1Pg5nCWtWNOjWlrEIpT3xFvLx3Ri0fRhMzVEMXhzYKX6bjkCcpCQq0cs=
X-Received: by 2002:a05:620a:2723:b0:7ca:d38c:5d8b with SMTP id af79cd13be357-7cd01044e2amr926155485a.0.1747082892967;
        Mon, 12 May 2025 13:48:12 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF1PFEnie7QK9hvQDnRlsXVbaR2Eq3M0V2Jui8DCrhPHVSNfmueMAmpx3G3g/iNJeK6Yme+lA==
X-Received: by 2002:a05:620a:2723:b0:7ca:d38c:5d8b with SMTP id af79cd13be357-7cd01044e2amr926151285a.0.1747082892344;
        Mon, 12 May 2025 13:48:12 -0700 (PDT)
Received: from [192.168.65.222] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad23eafca8bsm428846266b.87.2025.05.12.13.48.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 May 2025 13:48:11 -0700 (PDT)
Message-ID: <24173d3b-272d-4cfd-8519-ad5c9cf7c555@oss.qualcomm.com>
Date: Mon, 12 May 2025 22:48:08 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/3] arm64: dts: qcom: qcs8300: Add gpu and gmu nodes
To: Akhil P Oommen <quic_akhilpo@quicinc.com>,
        Rob Clark
 <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, Jie Zhang <quic_jiezh@quicinc.com>
References: <20250509-a623-gpu-support-v4-0-d4da14600501@quicinc.com>
 <20250509-a623-gpu-support-v4-2-d4da14600501@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250509-a623-gpu-support-v4-2-d4da14600501@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=DqtW+H/+ c=1 sm=1 tr=0 ts=68225e8d cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8
 a=NWoSzSQ9CBVd_tIZLS8A:9 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: jyLTKWfeGv2ts-7S8RWSMu-GSqTFZmYv
X-Proofpoint-GUID: jyLTKWfeGv2ts-7S8RWSMu-GSqTFZmYv
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTEyMDIxMyBTYWx0ZWRfX4VlCTeo/Jt+Y
 vGLeSrJ4QNcWJVPyxv8uzNh7YnhN2g4qddVClqNO8EjhfV5OgTS3aaf9iczS0WOZv2kPXI/VbCl
 K41+10CWo/4qHU5zHD2L10oukPNhqhcqy+BSQzghBkl6sNRdfjrrajUFDmXQF14vyuEX2QCOAVV
 oSNyRzqeJZt/thAU/Hs9HfWfuZdeA5md++kkj2/DGA7tM907DP4nlY9PfjcM6VpEPaWBcG5X0Lx
 NazuZo6ELWZ1IgZV88knVxjCQYL9YM3PxYxFMs23vWTMl4l5iEnP1I1+KALI/yU9avA96N62hHx
 V0YcjRpExGvmyVQcMVGJrzFT7pPJ+EeUZrqzknHO/fOFdDuWFWMr4a2pOI4SFOJVRzKWWOwbmMt
 YNIFlEyo0QZr6ELm2FvgclMqlWh0ozx72kU+UrODNEb8F+v2M+2x0kaeiSXQCeS9NBiagjpB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-12_07,2025-05-09_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 bulkscore=0 phishscore=0 clxscore=1015 adultscore=0
 lowpriorityscore=0 impostorscore=0 spamscore=0 mlxlogscore=999 malwarescore=0
 suspectscore=0 priorityscore=1501 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2504070000 definitions=main-2505120213

On 5/9/25 9:21 AM, Akhil P Oommen wrote:
> From: Jie Zhang <quic_jiezh@quicinc.com>
> 
> Add gpu and gmu nodes for qcs8300 chipset.
> 
> Signed-off-by: Jie Zhang <quic_jiezh@quicinc.com>
> Signed-off-by: Akhil P Oommen <quic_akhilpo@quicinc.com>
> ---


>  arch/arm64/boot/dts/qcom/qcs8300.dtsi | 91 +++++++++++++++++++++++++++++++++++
>  1 file changed, 91 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/qcs8300.dtsi b/arch/arm64/boot/dts/qcom/qcs8300.dtsi
> index 40771b062e8d7010dd93d7cc7b3db73cfa16bfdb..1dbccb9a0c75366aa6986b6adb4feb6164ee8845 100644
> --- a/arch/arm64/boot/dts/qcom/qcs8300.dtsi
> +++ b/arch/arm64/boot/dts/qcom/qcs8300.dtsi
> @@ -2660,6 +2660,97 @@ serdes0: phy@8909000 {
>  			status = "disabled";
>  		};
>  
> +		gpu: gpu@3d00000 {
> +			compatible = "qcom,adreno-623.0", "qcom,adreno";
> +			reg = <0x0 0x03d00000 0x0 0x40000>,

I haven't noticed it up until now.. this should be moved up in the file
to sort the nodes by unit address (the serdes node above is 0x089.., gpu
is 0x03d..)

Otherwise, please check if there are freq fuses on this platform, if not,
feel free to add:

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

