Return-Path: <linux-arm-msm+bounces-19950-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2057F8C7DA0
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 May 2024 22:14:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 8D3D2B21668
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 May 2024 20:14:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 23B89157A58;
	Thu, 16 May 2024 20:14:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="GnApNcL4"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7930B282E1;
	Thu, 16 May 2024 20:14:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715890489; cv=none; b=DkliHxIvbCCNdSB0gSdAIK44U0D7w4VZdaJNXp8WOQw3a5TIOapzz1/XMmV63wDcq1IPGfKg8QVxlc2JARoEs44atBnh8az+He8ojqOZMZ+cYcJFpV5Kw5o1IrXpuupLJH8T0cKNyjXv6Vz+rc/3pNUhoPESRxaobEuQ4nvPVgU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715890489; c=relaxed/simple;
	bh=D6iRVi4JPuH9/HOHG2e+AcJgspTLBrLEineuIE5waSI=;
	h=Date:From:To:CC:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BVBSIaT9rgxRPyONQubUZ3UX5buuiRbTQC8TG+bdxpN2BDPsNKxLnZ/FIIQMVnQJy4Gv6+mYovdKqtC1N1wFW/RJ5U73c1peMrnd4yd2nXfwp+1hbypdNUjQJF1ToI6IGmVmxABfb08mIWs6v7Ntg/lU2UZEIogOVBu6V+xUmD0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=GnApNcL4; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 44G8rqoc021411;
	Thu, 16 May 2024 20:14:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	date:from:to:cc:subject:message-id:references:mime-version
	:content-type:in-reply-to; s=qcppdkim1; bh=u5bbxZAgHSPgJVLlmjGZD
	xma0JdE2VBtUbo0rQDRJuU=; b=GnApNcL4aYt9ljcWhv+ZvMrFoLrsDezKipYDg
	jYg7jWZFw37PS2HPTk7CAm+8JX1b/Rrv4sA1Rn0plv0DR7d+gHPzMBlamz/58DyC
	6GMx2VxjXBxAts1/9n66lefogqIbhSitZp/sVU4CAGR9RgSMf+5psUpV89sClr6i
	Co+AV31HtXeWZ5UKPIM+6BkbzYhQqJ6sUQAm1MAz7fGNtrSj8QFGXqMibAHHdTwu
	YFV+3X33QBYnbBMJMD/plz1fkAaa7BD9jIuIkLZiotgPwi9wfzEpWihk6gHR/AXe
	ase0Bj/uT4lrvGfTQOLLdEYTjXQGJehbbOA0Sdbp38+LW9IkA==
Received: from nasanppmta01.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3y45vberk8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 16 May 2024 20:14:42 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 44GKEftN014427
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 16 May 2024 20:14:41 GMT
Received: from hu-eberman-lv.qualcomm.com (10.49.16.6) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Thu, 16 May 2024 13:14:41 -0700
Date: Thu, 16 May 2024 13:14:40 -0700
From: Elliot Berman <quic_eberman@quicinc.com>
To: Mukesh Ojha <quic_mojha@quicinc.com>
CC: <andersson@kernel.org>, <konrad.dybcio@linaro.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>, <robh@kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] arm64: dts: qcom: sm8650: Enable download mode register
 write
Message-ID: <20240516131346675-0700.eberman@hu-eberman-lv.qualcomm.com>
References: <1715888133-2810-1-git-send-email-quic_mojha@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <1715888133-2810-1-git-send-email-quic_mojha@quicinc.com>
X-ClientProxiedBy: nalasex01b.na.qualcomm.com (10.47.209.197) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: SVJxLjcwQFOvmlEFm89EGwf9TpsUcBRN
X-Proofpoint-ORIG-GUID: SVJxLjcwQFOvmlEFm89EGwf9TpsUcBRN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.11.176.26
 definitions=2024-05-16_07,2024-05-15_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 clxscore=1011 mlxscore=0 suspectscore=0 spamscore=0 malwarescore=0
 adultscore=0 mlxlogscore=824 phishscore=0 priorityscore=1501 bulkscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2405010000 definitions=main-2405160146

On Fri, May 17, 2024 at 01:05:33AM +0530, Mukesh Ojha wrote:
> Enable download mode setting for sm8650 which can help collect
> ramdump for this SoC.
> 
> Signed-off-by: Mukesh Ojha <quic_mojha@quicinc.com>

Reviewed-by: Elliot Berman <quic_eberman@quicinc.com>

> ---
>  arch/arm64/boot/dts/qcom/sm8650.dtsi | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sm8650.dtsi b/arch/arm64/boot/dts/qcom/sm8650.dtsi
> index 62a6e77730bc..eb0f20160822 100644
> --- a/arch/arm64/boot/dts/qcom/sm8650.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sm8650.dtsi
> @@ -371,6 +371,7 @@
>  	firmware {
>  		scm: scm {
>  			compatible = "qcom,scm-sm8650", "qcom,scm";
> +			qcom,dload-mode = <&tcsr 0x19000>;
>  			interconnects = <&aggre2_noc MASTER_CRYPTO QCOM_ICC_TAG_ALWAYS
>  					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
>  		};
> -- 
> 2.7.4
> 
> 

