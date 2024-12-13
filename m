Return-Path: <linux-arm-msm+bounces-41996-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id B058B9F0B42
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Dec 2024 12:35:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1579B188ABFB
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Dec 2024 11:34:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 647D31DFDA3;
	Fri, 13 Dec 2024 11:33:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="khzazzgB"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 873DC1DF73E;
	Fri, 13 Dec 2024 11:33:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734089604; cv=none; b=h1sxRl3O8CjiHTL5kdGiCagSdm1Nlf40zKAhVSk1XxdHcCMeVDeaJcE2fCxkRiuO7dRnhiLPW4q0R3cBy9pwDX7cpINw0ma49mvaeI3MfSSW4335/zLPRZPbP4E3gqaCmGEeqsDwgwIKB0xuAvOlT2mK3bCdCVez0qTcz0M+37E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734089604; c=relaxed/simple;
	bh=MLMEOAeqD8IEUkGSEWY7TkOiucHmzMnYso5eUsbRofA=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=Ys/uxJQHPS4n3LH0zMdBuSe4glcPl3CfOpeY+6Kl+yxZB0RZ83LBkRbkKcmxWV/kNjAa6yZ2NybBpo/q1LYckdUE/WAlKnZbvTYukRx3DdveMhmszG612sYtvksYp+wqwO/RS0tyfVr4v88bkxUkLBv+0Knur6lNeYVFwFCWcUc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=khzazzgB; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BDBThRr001370;
	Fri, 13 Dec 2024 11:33:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	BIgbwr4YWRO5BTx9mcS9BRDtQqI3IxHVQ2bwLnBizJU=; b=khzazzgBeT6/lgTn
	ZivKMMSC6/GGRf0PhcxMAQUXiw8jApy/VWBZtXQx97/RsRRgqDZi5ygcH7OL0NS5
	Jc8QrM2W3FvDK5c7kof9Sav80QMMvO6u/E5Ia1t4jo27XHgYA5xD6rmVKfvrMdGu
	e3EvYkpUyhl+6IYbDLrY/peLenzREXvWujwVROK2XEd/6SEUNkTL5cNmwbaYg5LZ
	DxGzLNMaaGmA2f8HdwijKyhdHQVIvUVz1rzvF9EYaovQiV7UIcJ5505Ec6S3Aic1
	fpyFKiOEutDb4U/WbnTP+2E6YdbSwc95vMe/mMXJT47Hpw75LEQZYivv4Zyitzdj
	21y3FQ==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43gm3s00d0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 13 Dec 2024 11:33:07 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4BDBX6W8018120
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 13 Dec 2024 11:33:06 GMT
Received: from [10.204.101.130] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Fri, 13 Dec
 2024 03:33:00 -0800
Message-ID: <db8f433c-1a2e-4a46-8b46-3a8e09c080bd@quicinc.com>
Date: Fri, 13 Dec 2024 17:02:56 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RESEND v2 01/26] dt-bindings: qcom,pdc: document QCS615
 Power Domain Controller
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        "Konrad
 Dybcio" <konradybcio@kernel.org>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Marijn Suijten
	<marijn.suijten@somainline.org>,
        Maarten Lankhorst
	<maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Rob Herring <robh@kernel.org>,
        "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        "Bjorn
 Andersson" <andersson@kernel.org>
CC: <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
        <freedreno@lists.freedesktop.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, Lijuan Gao <quic_lijuang@quicinc.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
References: <20241213-qcs615-gpu-dt-v2-0-64751d9c3748@quicinc.com>
 <20241213-qcs615-gpu-dt-v2-1-64751d9c3748@quicinc.com>
Content-Language: en-US
From: Akhil P Oommen <quic_akhilpo@quicinc.com>
In-Reply-To: <20241213-qcs615-gpu-dt-v2-1-64751d9c3748@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: pWkbnSZTquiH9fP4kc8J36NSkjJOD3z0
X-Proofpoint-GUID: pWkbnSZTquiH9fP4kc8J36NSkjJOD3z0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 adultscore=0 impostorscore=0 phishscore=0 mlxscore=0 bulkscore=0
 spamscore=0 clxscore=1015 suspectscore=0 priorityscore=1501 malwarescore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412130080

On 12/13/2024 4:54 PM, Akhil P Oommen wrote:
> From: Lijuan Gao <quic_lijuang@quicinc.com>
> 
> Add a compatible for the Power Domain Controller on QCS615 platform.
> 
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Signed-off-by: Lijuan Gao <quic_lijuang@quicinc.com>
> ---
>  Documentation/devicetree/bindings/interrupt-controller/qcom,pdc.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/interrupt-controller/qcom,pdc.yaml b/Documentation/devicetree/bindings/interrupt-controller/qcom,pdc.yaml
> index b1ea08a41bb0c369985c5f2d5b4c4644367a88dd..ac7ccd98944157d2b914b04753ed7e4ab08c5187 100644
> --- a/Documentation/devicetree/bindings/interrupt-controller/qcom,pdc.yaml
> +++ b/Documentation/devicetree/bindings/interrupt-controller/qcom,pdc.yaml
> @@ -26,6 +26,7 @@ properties:
>    compatible:
>      items:
>        - enum:
> +          - qcom,qcs615-pdc
>            - qcom,qdu1000-pdc
>            - qcom,sa8255p-pdc
>            - qcom,sa8775p-pdc
> 

Please ignore this mail.

-Akhil.


