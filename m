Return-Path: <linux-arm-msm+bounces-25394-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 684E8928D74
	for <lists+linux-arm-msm@lfdr.de>; Fri,  5 Jul 2024 20:21:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 208FA285876
	for <lists+linux-arm-msm@lfdr.de>; Fri,  5 Jul 2024 18:21:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 44ED213CFBC;
	Fri,  5 Jul 2024 18:21:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="aEJR7+pt"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60C815EE95;
	Fri,  5 Jul 2024 18:21:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720203710; cv=none; b=B+AqAs1bU+MXfNRP3anslqbUEqdJgJxiXJ84xUAZx2oCVT38K7vstzRpZUs1o187Xc+WM+r4UhqBKZVGGgfZylw+Gwp/7WbQMjff6vXUSVVS1YWwtiySJX1VDbbjwq1K4tJTM4N7RWNNOedXgnAGE+X+JL5GySlCVApx7KFv9po=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720203710; c=relaxed/simple;
	bh=qCJjzgjUbsnCs/HRLOKJMNumc4ai0xpatC4mn80F5QE=;
	h=Date:From:To:CC:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tpyShgEwrB0mfvguLwl+lTbrVGeHFDTKgOkvCwOR9Mivcl8EQOdmuPe5AYJYUDlP842M3JeJ4nCpBotTeY2VZcEjZPhJ4n9RSpIe9icJCbrL6nRw4RIfj1f50LRguw3WQx/AjrpmiI72hiwEqJKTKedsnJwwkmU3j2zQHL0i4gE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=aEJR7+pt; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 465AHdkX026719;
	Fri, 5 Jul 2024 18:21:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=6B6BZ6t/lq4bqMWQ7kg3wdAk
	pA0oyRGGvtYVGYdsSA4=; b=aEJR7+ptXUdncXInhZla9e4xmNSB8O6vMuDKPWcI
	OGlj1YKuzDlY60ZaHkMpSOUBKJ48zg8GqxmNujqeH/07NMxBk/53nXeSwGOzOXMU
	uo9NHuOa1EYTMxXnLM2wA8MXBRNfMWtY5MHz51yJUaENaE1HUVku12BE8B0jMowD
	cxkH7NwwVJ2/09YeiAE2uMrIZDpts8TCSqud6Tv2Uqm7oVHy9/UP4OrFTdeDfUBd
	VTd7wJ234XF3pl1Gi5+Zx0q0cmAyszoJ9uEEz+CTKO0RdvF/VUY48bQbCRF8tvD2
	+hBYEkjTD00mVjHkU3+svYewnAPXYpA9PN+uZad/LPCySA==
Received: from nasanppmta05.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 405dbe5b9w-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 05 Jul 2024 18:21:44 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA05.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 465ILgkW028478
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 5 Jul 2024 18:21:42 GMT
Received: from hu-eberman-lv.qualcomm.com (10.49.16.6) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Fri, 5 Jul 2024 11:21:42 -0700
Date: Fri, 5 Jul 2024 11:21:41 -0700
From: Elliot Berman <quic_eberman@quicinc.com>
To: Mukesh Ojha <quic_mojha@quicinc.com>
CC: <lee@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>, <andersson@kernel.org>,
        <konrad.dybcio@linaro.org>, <linux-arm-msm@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 1/2] dt-bindings: mfd: qcom,tcsr: Add compatible for
 sa8775p
Message-ID: <20240705112037690-0700.eberman@hu-eberman-lv.qualcomm.com>
References: <20240705153252.1571814-1-quic_mojha@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240705153252.1571814-1-quic_mojha@quicinc.com>
X-ClientProxiedBy: nalasex01a.na.qualcomm.com (10.47.209.196) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: 65AcdNtWAVT0ESxtonixVAyU_zOFrxfl
X-Proofpoint-GUID: 65AcdNtWAVT0ESxtonixVAyU_zOFrxfl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-05_13,2024-07-05_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 bulkscore=0 malwarescore=0 phishscore=0 clxscore=1011 suspectscore=0
 impostorscore=0 mlxlogscore=859 mlxscore=0 priorityscore=1501 adultscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2406140001 definitions=main-2407050134

On Fri, Jul 05, 2024 at 09:02:51PM +0530, Mukesh Ojha wrote:
> Document the compatible for sa8775p SoC.
> 
> Signed-off-by: Mukesh Ojha <quic_mojha@quicinc.com>

Reviewed-by: Elliot Berman <quic_eberman@quicinc.com>

> ---
>  Documentation/devicetree/bindings/mfd/qcom,tcsr.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/mfd/qcom,tcsr.yaml b/Documentation/devicetree/bindings/mfd/qcom,tcsr.yaml
> index c6bd14ec5aa0..7d0b0b403150 100644
> --- a/Documentation/devicetree/bindings/mfd/qcom,tcsr.yaml
> +++ b/Documentation/devicetree/bindings/mfd/qcom,tcsr.yaml
> @@ -21,6 +21,7 @@ properties:
>            - qcom,msm8998-tcsr
>            - qcom,qcm2290-tcsr
>            - qcom,qcs404-tcsr
> +          - qcom,sa8775p-tcsr
>            - qcom,sc7180-tcsr
>            - qcom,sc7280-tcsr
>            - qcom,sc8280xp-tcsr
> -- 
> 2.34.1
> 
> 

