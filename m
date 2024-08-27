Return-Path: <linux-arm-msm+bounces-29647-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E854C961395
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 Aug 2024 18:05:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 23BE8B223D3
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 Aug 2024 16:05:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BC9821C86F0;
	Tue, 27 Aug 2024 16:04:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="YvecuaA+"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E62DC1C6F48;
	Tue, 27 Aug 2024 16:04:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724774694; cv=none; b=l+FMN+MnISbN+m6Lxx6h3lDYX27zLN2Vr0Za/sHhZ/R172d9IeB7gNKH9vIHQMZYsyMMqnzzwrbpXyMLny189c4sTn8NKazjaQS3aDNknroZNh7Qrw//kxBgwykIu+qzDe6qq0PVuXfyUCC/yqg2dvbMiG9522EOITO2ncwA0JM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724774694; c=relaxed/simple;
	bh=e46VkUMx+O9YtB2a77Mdsp+OyuWhfRtS3jV/UsDqPTQ=;
	h=Date:From:To:CC:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UdhCLTGisKKPNV6jJ5FANI8GlK+5eiqvQFpyZHEMPWV6+optB26wakBUhGncraRqBy0xWmxFPiHBdXdTE9TJJGtxCfaBHtg+sK4VNOgX9Qlq5oxNjfV+t88CwXqerZdismpTq0JvG4On2grW1fv+FhKuAFzAdl9zAUYaxZn+GEQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=YvecuaA+; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 47RFcJLR025767;
	Tue, 27 Aug 2024 16:04:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=qmxualgWirVB9VB+ifEsGQ5T
	J/kSK5dckP6lTNPJwb0=; b=YvecuaA+G6r+KSXhl4Ste/45KnpaC0Uv2T1/r3vb
	QOBukkeLcvWUS+xUzooXl2L6qipLkehkJOilCkeFxuR7J/bJRUpKEha7vZrXYZzM
	+kwl57icCDLUPsLcQqNmjw6AGhCD6T04sdQQxShJ6fGrMTS2/DBEYx8V7MV4gQP2
	deWNyU4E2vp3MnAtkA4MMad6uqiA9TYqTRo49xnCTC0Wx/LPYXUKH7ohT3tATxqH
	MkniNAL47K8kDZJrg1s0mv4Tn5adMNxDSjmGjeGrD9caqcyaXx2Rrhiwwmy17zMq
	4oFVRXRP3dqx3+X/4NRftgjqjpwe94WPoCpEUvifeq4F9w==
Received: from nasanppmta03.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4199s89khd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 27 Aug 2024 16:04:48 +0000 (GMT)
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com [10.45.79.139])
	by NASANPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 47RG4lrQ031027
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 27 Aug 2024 16:04:47 GMT
Received: from hu-mojha-hyd.qualcomm.com (10.80.80.8) by
 nasanex01c.na.qualcomm.com (10.45.79.139) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Tue, 27 Aug 2024 09:04:43 -0700
Date: Tue, 27 Aug 2024 21:34:35 +0530
From: Mukesh Ojha <quic_mojha@quicinc.com>
To: Tengfei Fan <quic_tengfan@quicinc.com>
CC: Krzysztof Kozlowski <krzk@kernel.org>, <lee@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>, <andersson@kernel.org>,
        <konrad.dybcio@linaro.org>, <linux-arm-msm@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        Tingwei <quic_tingweiz@quicinc.com>,
        "Aiqun(Maria) Yu" <quic_aiquny@quicinc.com>
Subject: Re: [PATCH 1/2] dt-bindings: mfd: qcom,tcsr: Add compatible for
 sa8775p
Message-ID: <Zs35Ez/xGIkcXXd+@hu-mojha-hyd.qualcomm.com>
References: <20240705153252.1571814-1-quic_mojha@quicinc.com>
 <3b16214b-4693-4754-b62a-fea2e070269c@kernel.org>
 <1f5c5be4-f864-489c-941d-aad4a914508e@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <1f5c5be4-f864-489c-941d-aad4a914508e@quicinc.com>
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01c.na.qualcomm.com (10.45.79.139)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: VMB5P-PHeUtTEYylM-1sk6A6aJMEwLqp
X-Proofpoint-GUID: VMB5P-PHeUtTEYylM-1sk6A6aJMEwLqp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-27_09,2024-08-27_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 malwarescore=0
 spamscore=0 adultscore=0 mlxscore=0 priorityscore=1501 phishscore=0
 suspectscore=0 lowpriorityscore=0 mlxlogscore=706 impostorscore=0
 clxscore=1011 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2407110000 definitions=main-2408270120

On Mon, Jul 29, 2024 at 06:48:51PM +0800, Tengfei Fan wrote:
> 
> 
> On 7/7/2024 8:46 PM, Krzysztof Kozlowski wrote:
> > On 05/07/2024 17:32, Mukesh Ojha wrote:
> > > Document the compatible for sa8775p SoC.
> > > 
> > > Signed-off-by: Mukesh Ojha <quic_mojha@quicinc.com>
> > 
> > Eh? SA8775p is going to be removed/changed... why adding this?
> > 
> > Best regards,
> > Krzysztof
> > 
> 
> After considering the feedback provided on the subject, We have decided
> to keep current SA8775p compatible and ABI compatibility in drivers.
> Therefore, this patch is still needed, please continue to review this
> patch.
> Thank you for your input.

Thanks Tengfei for the reply.

Can this series be considered now, it still applied fine on linux-next.

-Mukesh

> 
> -- 
> Thx and BRs,
> Tengfei Fan

