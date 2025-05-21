Return-Path: <linux-arm-msm+bounces-58942-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id D4176ABF9CC
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 May 2025 17:45:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id ADE65502B8F
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 May 2025 15:41:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0039421D5A9;
	Wed, 21 May 2025 15:36:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="WElMuxbW"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBBD02116E0;
	Wed, 21 May 2025 15:36:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747841764; cv=none; b=Jwgz4GJ3DNrz+qI0Es3GjFPN7CkPyg1w0ns6oGcCy0bRftxbT3LeKlwA3YR6nEUrNnojsE6wh2Yh2gSA5dKxP7sFHsBSFW9kcjedICXp7//oakkyZkwqmwFeNVMQC4CVD6ULAd5dEewBk+45Fre2935rT3HDYUdvZAXuSiU/hsg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747841764; c=relaxed/simple;
	bh=26wb+TDgnXY1I32lA9INqrCPa0G4u0bmYgCus8cVMrM=;
	h=Date:From:To:CC:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oLeWANMX34/NLZ6OJhKicIzBXzR+/dRsUjZMy65EfNDoCkhWrZkAcfzcrPXEOa/jUS5icUTN+ashxl52FWlL+p5qlbnG5jfEjOGGIz1/50IlCRbOaWASQV6qiUUb6K6MaDzDIGPIlIbCwKUcauPRT5JiovFOgNLAEwZha/FfyGQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=WElMuxbW; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54L9XP9U020649;
	Wed, 21 May 2025 15:36:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=ZuOui4BxW9FpCP2rQp0G9IHS
	b2olLolGSfAgCHNr5I4=; b=WElMuxbWZkRDHOW6qKYsW3TdW0l/l/e1NquIp+e2
	KUiqTfLedi2rf1QNbV+KTOT3FL+UUgpWcepcoYdN3iH7gooKK3+ngbGy4V8p9MYo
	ijNwuT0TNDpdXRq9/k6iqeQmWPD01kTsTiDqQOGwP6JKKswYioV0HKK6dP/dQZnd
	yMqZxZ2wDZDaSgGjQUeBF9mm3rhHBxHdnbZSBGxmxan6R3gr05mxvobFMkkXuF3K
	YRrEOhrCT8z/TIuJn0fa0Pv4XrorUi3QzcZ0y2p5XIrwRjKSyhJT4mEo6X0ed9Py
	Jl4loM/5Bf/zF/DG9WcTyWXfb2AhnO1CWgPCr76MswjETA==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46s9pb1pjc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 21 May 2025 15:36:00 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 54LFZxHL013741
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 21 May 2025 15:35:59 GMT
Received: from hu-wasimn-hyd.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Wed, 21 May 2025 08:35:53 -0700
Date: Wed, 21 May 2025 21:05:44 +0530
From: Wasim Nazir <quic_wasimn@quicinc.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
CC: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio
	<konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski
	<krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <kernel@quicinc.com>, <kernel@oss.qualcomm.com>
Subject: Re: [PATCH v7 1/6] dt-bindings: arm: qcom: Add bindings for QCS9075
 SOC based board
Message-ID: <aC3y0PPA8qrvmobw@hu-wasimn-hyd.qualcomm.com>
References: <20250521140807.3837019-1-quic_wasimn@quicinc.com>
 <20250521140807.3837019-2-quic_wasimn@quicinc.com>
 <79eb2b17-06ee-42d4-9954-a78ada1ced29@kernel.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <79eb2b17-06ee-42d4-9954-a78ada1ced29@kernel.org>
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Authority-Analysis: v=2.4 cv=WJl/XmsR c=1 sm=1 tr=0 ts=682df2e0 cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=kj9zAlcOel0A:10 a=dt9VzEwgFbYA:10 a=COk6AnOGAAAA:8
 a=e9ZtyMsiHC7c2grmGewA:9 a=CjuIK1q_8ugA:10 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: ORI7hAserweXcsGTxF1qibhrIHmWthVo
X-Proofpoint-GUID: ORI7hAserweXcsGTxF1qibhrIHmWthVo
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTIxMDE1MiBTYWx0ZWRfX39MozWS6mI7w
 dzsA8WnS0sZ4lP31UMRZkClnInHqGYGWvsxyecWa/Rgi1bfRUeZVctzMc+zFc12VKpMcKpUHnvD
 RMmdZd9hCC3nbg8+GyMsenWDupxOZdKpiM5TDbSTHVg+68Ylpiyou5NTndEJd/XdNQWH67YU/XK
 k8uxhyspem/dxHiaJzirkmqzLhB+cTLnd/oq9i3VExbdjacLHE759bwR9sOjXkx8Fb4TE2jAam8
 So28uxUW4OU83Zr6G73tHaj+TV0DdkM+7bm26o5D03tsaN0DmGhSvkjbfPNGRa4/zs1oX7V+ckE
 0cIjI0nDeWVPEizWmmBNjuVi/z6poDYbwgY74DaRkUtHfae5UkWc1TaKN7iTkVgrYoBWsO/Ig+E
 OnUorufY5DXFDP1NL9OAJx9ybTp7+2KLmoItkzi7+iBA7j3Eys2YrySlBNNWx4Ipa/O5Cz9K
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-21_05,2025-05-20_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 clxscore=1015 suspectscore=0 bulkscore=0
 malwarescore=0 impostorscore=0 mlxscore=0 adultscore=0 phishscore=0
 mlxlogscore=958 priorityscore=1501 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505160000 definitions=main-2505210152

On Wed, May 21, 2025 at 04:20:53PM +0200, Krzysztof Kozlowski wrote:
> On 21/05/2025 16:08, Wasim Nazir wrote:
> > QCS9075 is compatible Industrial-IOT grade variant of SA8775p SOC.
> > Unlike QCS9100, it doesn't have safety monitoring feature of
> > Safety-Island(SAIL) subsystem, which affects thermal management.
> > 
> > qcs9075-iq-9075-evk board is based on QCS9075 SOC.
> > 
> > Signed-off-by: Wasim Nazir <quic_wasimn@quicinc.com>
> > ---
> >  Documentation/devicetree/bindings/arm/qcom.yaml | 7 +++++++
> >  1 file changed, 7 insertions(+)
> > 
> 
> This was already acked twice by two DT maintainers. Apparently we need
> the third one.

The previous acknowledgment has been removed due to changes in the code.
Since, here I have removed the som compatible so though of getting it
reviewed again. Som compatible is removed to make it align with other
sa8775p & its derivative targets which we are trying to refactor along with
Ride changes in other series.

> 
> Sorry folks, but I will wait for v20 and then review. Otherwise we are
> just doing pointless job here.
> 
> Best regards,
> Krzysztof

Regards,
Wasim

