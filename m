Return-Path: <linux-arm-msm+bounces-58956-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BE9CABFD4C
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 May 2025 21:29:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E13DA9E7202
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 May 2025 19:29:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4804D28F924;
	Wed, 21 May 2025 19:29:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="GB+efAut"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFECA21E082;
	Wed, 21 May 2025 19:29:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747855790; cv=none; b=ZN3Um3HPoIBY2+YzM7VE42FqZSDeuUbh2X1RLqmvXGAEYzwOFoZmt8NcWYSptEtCZw0wJgruLGNeUvtNa89VD5dUtiS9D5eXmrl9ZiIVruC6KU8+xybzXsR+XK87hOgSWO9Nsr1nDykEzooSSDCPetGNHxuC0ubcUbQcjAgwW6Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747855790; c=relaxed/simple;
	bh=6Si74kOQLLzphPiJW/CEcu2dBkIBSgSw9ej8JwTKC0k=;
	h=Date:From:To:CC:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ISY/gTA3nNzD0MmuVpKaZHy8EQVdR3aQvUr6lNq0AxYGjsOLMtCEpW1zx+a4OmgnGiMkND8okQeN9oVUfx4pVdBSPvKmVKLsFuN9PMGxJsp0UWdIT3I193sT+i+uHc51StS3LKas+eXOZDF085g6eFIOnrNKGbJaA7ggGpO9GIo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=GB+efAut; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54LI81CX006647;
	Wed, 21 May 2025 19:29:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=KqyTUZn2LTlnFot12B2jQVct
	SAruIabNXa1waF5TVUA=; b=GB+efAutLMxYjePt54TjTJgOIsfe9c/ZoOSU8UtP
	zPu6CykstlSkIB1odiF0t5JlOul4eW6wUhmDpWkrKg/ezD3wGJIvLN1YWcHfGqC3
	DNOFZEe58jbUKgWBiTdUHxh+M6+cxjcw4D4x8iio9Jjd2tXzo85PhOltZhxJcwrv
	Ddm4LkrhSz3pqr5EvNTCufE+fNbuiPnGpyakzdlPkEiNveZ3yqqWKgPc8dKjVc/c
	a9p2xAI0DGLtKQodi+B2aG/OnDAyZziV/IxBOon/K0XDW91DUMEOXHtrPq3Lj430
	L+OeQ3EzXuBwj4B9WaepaRa3yUkfJpmZQEzIR7Q/JS0n3g==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46rwf0m306-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 21 May 2025 19:29:45 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 54LJTj73013503
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 21 May 2025 19:29:45 GMT
Received: from hu-wasimn-hyd.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Wed, 21 May 2025 12:29:39 -0700
Date: Thu, 22 May 2025 00:59:35 +0530
From: Wasim Nazir <quic_wasimn@quicinc.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
CC: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio
	<konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski
	<krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <kernel@quicinc.com>, <kernel@oss.qualcomm.com>
Subject: Re: [PATCH v7 4/6] arm64: dts: qcom: Add support for qcs9075
 IQ-9075-EVK
Message-ID: <aC4pnz6XgT/RqfLU@hu-wasimn-hyd.qualcomm.com>
References: <20250521140807.3837019-1-quic_wasimn@quicinc.com>
 <20250521140807.3837019-5-quic_wasimn@quicinc.com>
 <3f3d8c46-e7f3-42d1-a186-29a034d509be@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <3f3d8c46-e7f3-42d1-a186-29a034d509be@oss.qualcomm.com>
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: 2yq_xZo_T2LpwsW2DoQkxLpQi1xtXqMV
X-Authority-Analysis: v=2.4 cv=J/Sq7BnS c=1 sm=1 tr=0 ts=682e29a9 cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=kj9zAlcOel0A:10 a=dt9VzEwgFbYA:10 a=COk6AnOGAAAA:8
 a=smROnvcLH1czrS76FVkA:9 a=CjuIK1q_8ugA:10 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: 2yq_xZo_T2LpwsW2DoQkxLpQi1xtXqMV
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTIxMDE5MiBTYWx0ZWRfX3HTWNHH96Akh
 pp5FPEl+Tpl6F1exP5r7EJZ74wku1zyUiEl5AbIpWQUw2cVTaGE2hUyGhdzpDHOYUxMeNktggLZ
 i2mMLvs2XxSLW+wDD2pAOTPN8rMQFCyNPjx0gImQnbGAHKMjJT8dHzyEJplSHNEhO5l5MfhnOOu
 CtQImh7qlWWAlZ6a/mcDhS8WzMPjP63JvV6GNReGMYgqi3Dcuy5Y7xK8cptJTJZedpaBGTe+2no
 S0pEfRXQv+zzhWLREYdZX1vq7SOPiJcusfzhRqjWJX3AEk/YZEDbpz7+jlBcKG9BK3bF9pCGfoS
 xqb6ELjvEC54Dyl7tJqAka69qwlsqDb+QMPcImstCYbARnddkpdIwk3u6Wzr9zplTyqaCP8gmHz
 8sXQ9jYrIEqpNACMVvhZ/YZzAqGj854H6l4r53uMJuD7uHKXELE44+wALtLkq+PjbdOhWArW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-21_06,2025-05-20_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 clxscore=1015 mlxlogscore=781 suspectscore=0 spamscore=0
 priorityscore=1501 bulkscore=0 phishscore=0 impostorscore=0
 lowpriorityscore=0 malwarescore=0 adultscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505160000 definitions=main-2505210192

On Wed, May 21, 2025 at 06:57:03PM +0200, Konrad Dybcio wrote:
> On 5/21/25 4:08 PM, Wasim Nazir wrote:
> > Add initial device tree support for IQ-9075-EVK board,
> > based on Qualcomm's QCS9075 SOC.
> > 
> > Implement basic changes to enable boot to shell.
> > 
> > Signed-off-by: Wasim Nazir <quic_wasimn@quicinc.com>
> > ---
> 
> [...]
> 
> two nits:
> 
> > +&tlmm {
> > +	qup_uart10_default: qup-uart10-state {
> > +		pins = "gpio46", "gpio47";
> > +		function = "qup1_se3";
> > +	};
> 
> Feel free to move it over to sa8775p.dtsi

Thanks for pointing it out. Will move this to SOC file.

> 
> > +};
> > +
> > +&uart10 {
> > +	compatible = "qcom,geni-debug-uart";
> > +	pinctrl-0 = <&qup_uart10_default>;
> > +	pinctrl-names = "default";
> > +	status = "okay";
> 
> Please keep a newline before 'status'

Sure.

> 
> Konrad

Regards,
Wasim

