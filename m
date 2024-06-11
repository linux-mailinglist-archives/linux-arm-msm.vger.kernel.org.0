Return-Path: <linux-arm-msm+bounces-22285-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id B308490389F
	for <lists+linux-arm-msm@lfdr.de>; Tue, 11 Jun 2024 12:16:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 39E4228294F
	for <lists+linux-arm-msm@lfdr.de>; Tue, 11 Jun 2024 10:16:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 14BF214F9EE;
	Tue, 11 Jun 2024 10:15:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="Isd5XYl8"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 777AE14E2FB;
	Tue, 11 Jun 2024 10:15:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718100919; cv=none; b=UZ3Uo+jVp9aCcRlvCiLOTvZhKZZpyKyo4lHBCv1RNWioxC+4wZalmhHutW+FDUy/yHO2FejrOdyN217n/E20fR0KNM+O3WMXDUBW8XJbQ4XFI/ziv1JBYoSvCqzc84GOCTDF5LHXBNJDQCCRZbR5ZpHnwg/URC1ZCFovGcpRYis=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718100919; c=relaxed/simple;
	bh=9PBC8dtpkA0NxkujAAkrVatDXA1eIo0A1dxmKF1hJY0=;
	h=Date:From:To:CC:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KwEc3Wr1d+jdXGxU9ZQFXdP1bUgSIk7hK7iTPzpjXevTeIi40saj4W8GbEF4BTl8ZsYV3jJA+EZfLmuuPpHcWGzof0pOsOMXSfCl6wv0po/yPcDB0uwiBXULfGsMQVHoSEp/D+1nc8GjWgjL0PRyKksGD1SMiB9rKj9G5WRhphA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=Isd5XYl8; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45B9g7oX018393;
	Tue, 11 Jun 2024 10:15:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=egs1P705ilN4nYwunxBmronV
	DiqBAzk8/Wo/S8j6VJ4=; b=Isd5XYl8/r8HmEdlHdsZL6oU5imD/tXChyme/hxO
	1Hi+kWsv61GeNXEkoV1FgCH6dIN7MEyeDwwECTC8C7qWnqZFlNLuCeKIdQtBHmPx
	vBZWj4mFw8+Oic9SkMZ3162RbO53OvbXLMojCVUQHtYF92kpbACerSGH1fcX4gOS
	GZEHuXDnEHS3eNftWxkTtUKjOrjTWzpeVhSYdR7VKwxF7A7mobNIp06f/5ZOgo+u
	lD0w0fu2nLsqK+gU+W3A1j6xpSB0D7DG8IbhL5M3UpU0OZdV1MYmN9/8yi34KsWr
	b05AO1q3suK+sbt7zCWbQN72LS0iihGGNU/hrbi+K0D87w==
Received: from nasanppmta05.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3ypm6b82eq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 11 Jun 2024 10:15:13 +0000 (GMT)
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com [10.45.79.139])
	by NASANPPMTA05.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 45BAFBG0009695
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 11 Jun 2024 10:15:11 GMT
Received: from hu-mojha-hyd.qualcomm.com (10.80.80.8) by
 nasanex01c.na.qualcomm.com (10.45.79.139) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Tue, 11 Jun 2024 03:15:08 -0700
Date: Tue, 11 Jun 2024 15:45:04 +0530
From: Mukesh Ojha <quic_mojha@quicinc.com>
To: Conor Dooley <conor@kernel.org>
CC: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Andy Gross
	<agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio
	<konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        "Krzysztof
 Kozlowski" <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley
	<conor+dt@kernel.org>,
        Komal Bajaj <quic_kbajaj@quicinc.com>, <linux-arm-msm@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] dt-bindings: cache: qcom,llcc: correct QDU1000 reg
 entries
Message-ID: <ZmgjqJdxzrxhnsw7@hu-mojha-hyd.qualcomm.com>
References: <20231107080436.16747-1-krzysztof.kozlowski@linaro.org>
 <0f76a5c1-14ce-cbfa-bbd9-b2826c4bbbdb@quicinc.com>
 <20231108-hurricane-carefully-d9d3c1348f8c@spud>
 <ec0bb93c-30a1-bcda-a842-8cbad6ceea62@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <ec0bb93c-30a1-bcda-a842-8cbad6ceea62@quicinc.com>
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01c.na.qualcomm.com (10.45.79.139)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: CBKtBblX114i5evQuP60gYW2S5pVOAob
X-Proofpoint-GUID: CBKtBblX114i5evQuP60gYW2S5pVOAob
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-11_06,2024-06-11_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1011 suspectscore=0
 mlxlogscore=869 impostorscore=0 spamscore=0 priorityscore=1501
 lowpriorityscore=0 adultscore=0 bulkscore=0 phishscore=0 mlxscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2405170001 definitions=main-2406110075

On Thu, Nov 09, 2023 at 02:10:41PM +0530, Mukesh Ojha wrote:
> 
> 
> On 11/8/2023 5:56 PM, Conor Dooley wrote:
> > On Tue, Nov 07, 2023 at 02:25:25PM +0530, Mukesh Ojha wrote:
> > > 
> > > 
> > > On 11/7/2023 1:34 PM, Krzysztof Kozlowski wrote:
> > > > Qualcomm QDU1000 DTSI comes with one LLCC0 base address as pointed by
> > > > dtbs_check:
> > > > 
> > > >     qdu1000-idp.dtb: system-cache-controller@19200000: reg-names:2: 'llcc2_base' was expected
> > > > 
> > > > Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> > > > 
> > > > ---
> > > > 
> > > > Recent LLCC patches were not tested on QDU1000 thus the LLCC is there
> > > > broken.  This patch at least tries to bring some sense according to
> > > > DTSI, but I have no clue what is here correct: driver, DTS or bindings.
> > > > ---
> > > >    Documentation/devicetree/bindings/cache/qcom,llcc.yaml | 2 +-
> > > >    1 file changed, 1 insertion(+), 1 deletion(-)
> > > > 
> > > > diff --git a/Documentation/devicetree/bindings/cache/qcom,llcc.yaml b/Documentation/devicetree/bindings/cache/qcom,llcc.yaml
> > > > index 580f9a97ddf7..d610b0be262c 100644
> > > > --- a/Documentation/devicetree/bindings/cache/qcom,llcc.yaml
> > > > +++ b/Documentation/devicetree/bindings/cache/qcom,llcc.yaml
> > > > @@ -64,6 +64,7 @@ allOf:
> > > >            compatible:
> > > >              contains:
> > > >                enum:
> > > > +              - qcom,qdu1000-llcc
> > > >                  - qcom,sc7180-llcc
> > > >                  - qcom,sm6350-llcc
> > > 
> > > Thanks, again.
> > > 
> > > Acked-by: Mukesh Ojha <quic_mojha@quicinc.com>
> > 
> > I'm assuming given your employer, this ack means that there is no
> > llcc2_base on the qdu1000.
> 
> Yes, not even have llcc1 , just llcc0.

Looks like i saw downstream usage and said LLCC has only one
instance for qdu1000, it looks refactor happened during the
same where each bank need to separately denoted in device tree.
Change was fine a/c to its usage in device tree.
Not an excuse, that is an ignorance from my side while acking
the change.

qdu1000 has 8 banks from llcc0-7 that need to corrected both
in its device tree and in the binding.

@komal will be sending patch for this.

-Mukesh

