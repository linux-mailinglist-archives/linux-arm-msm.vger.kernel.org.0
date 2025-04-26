Return-Path: <linux-arm-msm+bounces-55810-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 21FDDA9DA05
	for <lists+linux-arm-msm@lfdr.de>; Sat, 26 Apr 2025 12:13:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 68754463288
	for <lists+linux-arm-msm@lfdr.de>; Sat, 26 Apr 2025 10:13:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C9203250C1B;
	Sat, 26 Apr 2025 10:12:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="oZmpxzfc"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 903BF225A23
	for <linux-arm-msm@vger.kernel.org>; Sat, 26 Apr 2025 10:12:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745662373; cv=none; b=jbTCzKqBC8ERLe+JRHkLUgln1QeHGKW+eMux8Wb7x5I8/z4JMd6SQGAUhkqF4XeSnlNMbjaJGwWKnyEA/jwLG2QX6328SSENB1l4bELbSDuGtzjcbtAsho2Nqk4La2gRDAHPTSqNq6mb2HCUIsu9qu7kCPiUtNt7pvhREE9QKvA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745662373; c=relaxed/simple;
	bh=gjox0lKDk+8GrLOG0y3vy7wN4+2GxQg7oT1RFX/OuXA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=W8RdVmqrUeYc/5CDzs0d7ydocze8iFo4cdNQvMzAEDQPnpuytF2DOSLT1sN2uyWeQeWjLURRgkF2DeLRljebqqM+Hx0JpawM+6oyqcUJj8H1JGPzIRr+R0ImqOyPmA/fMCGBJS+3XbOrnO9Hom4WpY+nPsy+qup+CQF0eEJF7yo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=oZmpxzfc; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53Q0hJxG023762
	for <linux-arm-msm@vger.kernel.org>; Sat, 26 Apr 2025 10:12:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	z+Qcn5tAPyhWCpf8v43q7uoVPaklSa31BM363czGaA8=; b=oZmpxzfcIwuDHd6x
	YFTkk4Bbz78gW2TDDdYmnCLQAXNjQluvpVi88EGFOaZJtKbauWpCBv4lVsGJQeBb
	/2AVCFWkEdU2z3NICrE0PRYq29GgqcJEORtQ+DwSwU0iLAknMFoh+Vmw0oyGNmVe
	DokPCAmSJIqruHu40xRrwDUF6jTDUlHu2oBhgXG1MFG+8lc2g538vAx1TT8BjDH5
	5bXYZGJ/TdWVJsC+di3D6tHkgRFXNc+nBTfMJpCgtxWnOI2IbIccMdQ3txiN2Gkm
	zNAL0CVYo7XomXG59rwbiuz+X5uMRL0OB9kvfgwqx3bZGkgmxfoZbxWPcTKUSgV2
	/R1+ZA==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 468n6j933q-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 26 Apr 2025 10:12:50 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4775bdbcdc3so7692301cf.2
        for <linux-arm-msm@vger.kernel.org>; Sat, 26 Apr 2025 03:12:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745662369; x=1746267169;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=z+Qcn5tAPyhWCpf8v43q7uoVPaklSa31BM363czGaA8=;
        b=q1TNqF3VjQGedztgCU/vVnSPxyZm2BDE3epBfI0+sLZh5khI77HsbkQ1qodnA6fCRL
         RrXMbSSlyf13Cv2AO3cnca3kPMMgItXMsH7Uuk+LpsWAy2cP0rtAZmmq9gPJH9HDnpB6
         G4dgaqXvAHFXuTIdtA/heaFyOskS0AwCPN43e7gw7icHjrQ9yny6b9HPe2VKYB2Oi3zF
         b72xdZ6NWYBFOxXwvCHaOLq+N+fufXefYuaiC4vh8Y7UWntZJ6n3Hko8CBx78TtY7tMD
         CQ5Rwbwt/tc8GdW0Yd7AdaLa3OPy5WPg+D6kOqCK9j73T6K/A27c9rQPHSECPG1zllaV
         XxnA==
X-Forwarded-Encrypted: i=1; AJvYcCUOYtAQr2b0Ix3Mp9ez8ZV7nqAWfFnfBhyfJHphZpFD4oe3auR1T4aa6AKWRhQxzip78NqlsMqNL5ctp5nU@vger.kernel.org
X-Gm-Message-State: AOJu0Yxw4IzDjwkbZm2Ne55wn43Z3C2bdcjbkFoOPvGAfp1yIzU0ZpuD
	bl7GSzVRTMiGPJRpNAUN9/ITeZUU70cqaHDPR8bGNPeh0aKTi2QwDBcIIYraGh6kYMknVpG+N/c
	S+3uSL/DiRP+jm4XGhfd7DT+6UJs8Rz1b95y7EBSvFvN3LDPyJ0lf1TasbO9Rw4hE
X-Gm-Gg: ASbGncufHZrtBCJaBrWm4gX24kzXZWrk+XLQr2GkJMTcI6iOdz37Yf+g4Px3IamtEXZ
	8PNiZzh/Nn0lT7RASZKxHfx2KGnQu4edi+Obg3rUhtR/3iRHG6DJfoAafOB/gdReYKwuJ9GwPxn
	AaliSg/HEwdrwaBzfRnQiOAPFl7mn4m5wEfqkgybvfNdOKL80dqVf935dj4IyaANTwIv+PnK+rY
	j3fDkjRHBJWpYG4KROvjCTTeLomr06EyY7LwE+NHB8LJqgsqEOicMMYPR+rlqLt7yX+BVJ/LB52
	w7fm5Qx+AiJzIJSm8D90dpKeD+Rjah876wgxEgOCiHVPOOE1JJAcV+vj+osnwvAPFcc=
X-Received: by 2002:a05:622a:1b90:b0:476:add4:d2b5 with SMTP id d75a77b69052e-4801c2c33bfmr32875361cf.2.1745662369525;
        Sat, 26 Apr 2025 03:12:49 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH8y2/2zXerVowv3WgwNFdVM4P6Z1IVdhvxEp0YRKkj25bC74sKgwxuOCG/XTskyzaDy0UV2g==
X-Received: by 2002:a05:622a:1b90:b0:476:add4:d2b5 with SMTP id d75a77b69052e-4801c2c33bfmr32875051cf.2.1745662369029;
        Sat, 26 Apr 2025 03:12:49 -0700 (PDT)
Received: from [192.168.65.154] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ace6edafbf0sm264090566b.168.2025.04.26.03.12.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 26 Apr 2025 03:12:48 -0700 (PDT)
Message-ID: <11e76323-db6b-428b-816f-e96fc9523fe5@oss.qualcomm.com>
Date: Sat, 26 Apr 2025 12:12:44 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 07/11] arm64: dts: qcom: sa8775p-ride: add anx7625 DSI
 to DP bridge nodes
To: Ayushi Makhija <quic_amakhija@quicinc.com>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: robdclark@gmail.com, dmitry.baryshkov@oss.qualcomm.com, sean@poorly.run,
        marijn.suijten@somainline.org, andersson@kernel.org, robh@kernel.org,
        robh+dt@kernel.org, krzk+dt@kernel.org, konradybcio@kernel.org,
        conor+dt@kernel.org, andrzej.hajda@intel.com,
        neil.armstrong@linaro.org, rfoss@kernel.org,
        Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
        jernej.skrabec@gmail.com, quic_abhinavk@quicinc.com,
        quic_rajeevny@quicinc.com, quic_vproddut@quicinc.com,
        quic_jesszhan@quicinc.com
References: <20250424062431.2040692-1-quic_amakhija@quicinc.com>
 <20250424062431.2040692-8-quic_amakhija@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250424062431.2040692-8-quic_amakhija@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI2MDA2OCBTYWx0ZWRfXyunmmKlwq6fm n+a/f3T1Q448veo41nJeTWXYobLHME+pAwqMDAq+22Q1rJGTnv693KTJ06sUH8Cig1094gVe8Fv UyAy7IxaMViOQfm0Y5jf5qfPmqURiX+oVKPlc0JPp6xJ+IJQlSAsjtqwZeKHu42GDtS/5YATQs+
 wNvQwEWEQUMqjdNO5jwY7bKpAN9BqbWsm/SKEezvrfxgnyBcbwd7515Pipw/oHRC3orrs74zFC6 VvTvRCA9dSr7ztfspx8QOhDvhozII9zbV6ugoBNl5gw/KoC3IVrgW6JW6vWNwuHwazoTNcq00ol OzQsRd/qZ123V1pz0Zp9rq/REBmOscjurxWgnttBKRNHrf3BiCQSFRg/H7+XNSt7Eqtc0jHA+oy
 7MXm199A9HGW/zCaJQfxrlNCX3xNKRP5RwuZgr//RZ3MHejAwOrQ4659Q45QxmOW/myJ4RwI
X-Proofpoint-GUID: b9Ziwl_XgAWOJ21lctkDasPkUPr5EuWx
X-Proofpoint-ORIG-GUID: b9Ziwl_XgAWOJ21lctkDasPkUPr5EuWx
X-Authority-Analysis: v=2.4 cv=C8fpyRP+ c=1 sm=1 tr=0 ts=680cb1a2 cx=c_pps a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=GLHRRWOWZVtnXAxWSSAA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-26_02,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 phishscore=0
 mlxlogscore=999 priorityscore=1501 clxscore=1015 spamscore=0 adultscore=0
 malwarescore=0 lowpriorityscore=0 suspectscore=0 bulkscore=0 mlxscore=0
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504260068

On 4/24/25 8:24 AM, Ayushi Makhija wrote:
> Add anx7625 DSI to DP bridge device nodes.
> 
> Signed-off-by: Ayushi Makhija <quic_amakhija@quicinc.com>
> ---
>  arch/arm64/boot/dts/qcom/sa8775p-ride.dtsi | 181 +++++++++++++++++++++
>  1 file changed, 181 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sa8775p-ride.dtsi b/arch/arm64/boot/dts/qcom/sa8775p-ride.dtsi
> index 175f8b1e3b2d..b8851faec271 100644
> --- a/arch/arm64/boot/dts/qcom/sa8775p-ride.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sa8775p-ride.dtsi
> @@ -28,6 +28,13 @@ chosen {
>  		stdout-path = "serial0:115200n8";
>  	};
>  
> +	vph_pwr: vph-pwr-regulator {
> +		compatible = "regulator-fixed";
> +		regulator-name = "vph_pwr";

Please provide a reference voltage for this one

otherwise

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

