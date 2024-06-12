Return-Path: <linux-arm-msm+bounces-22394-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 109FF904F10
	for <lists+linux-arm-msm@lfdr.de>; Wed, 12 Jun 2024 11:21:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8CE0E281CDB
	for <lists+linux-arm-msm@lfdr.de>; Wed, 12 Jun 2024 09:21:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CC4D616D9C0;
	Wed, 12 Jun 2024 09:21:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="oR9ID2QC"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A0C016B72E;
	Wed, 12 Jun 2024 09:21:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718184082; cv=none; b=upCour+BONAoD78oS7IVzfo22DpiAPv0Mse5iOpfI4I3lepD8IRKnsgJfuMWosN8oMJUnfe4X6XoElXTretahgRDOt/8kk7JTkNwkH9Y2/vGWZ2gEdcrWw6XODmzS8dKz3FtoVEryPN1767nJ+BzcMn6r6U5f0dTcx0YTPXA39g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718184082; c=relaxed/simple;
	bh=EsJGTO6GTs/SJhhsrjmi78vqJQP8kwuegjOox6ZFSPQ=;
	h=Date:From:To:CC:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GnWe0Gx49R3nBMJdrIOh8siIAv1XMuPNAWy4T7lX4F2cYX0iHJdPyzvaV9wQh9jUxXYgGwvPTG7I6ba4oL79jjwJoUK0ZSkIxUOA7kYLZut0lB997X0RqnlVKyQClTjc3aTYTbXc0LfDwc3iVqbWrhbqdwQeDv+e2cdt+I0hgxU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=oR9ID2QC; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45C8DqqC018413;
	Wed, 12 Jun 2024 09:21:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=xRrvXtowPvfK9lgsi7WMphP5
	miUwkL2U7ntiBaCwewY=; b=oR9ID2QCdZIzQD3/QaEFhZ+8DABB/ZG7/gGgA+8e
	CXr5TCSFGAvjYLCcq1RgcKVQhatCBr488V2aJ5ssGIEahH0snBcZnWWyzogFgY+6
	rGZaHonvgvY75LYvohargShjrHu6Qq7idQWLvOAbl6b5CkwNMCBQhclWdKjAqUkC
	w3DJTCcNGEKSSexDDBGAs7UgKWpO/WZO7OQefOswiOtHXcMJ+ejowgRZN9SgenFl
	+6OxprqVVqzuO3BesqeKKuFP/I06FJ+QbKmzQse9BXIF396IAHQiP0af4ecAAVnR
	OExWsLUsBjSHwHl31dlYUA6cNmg9aFSi8vDbaQEKocH6Qw==
Received: from nasanppmta02.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3ypm6bb0up-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 12 Jun 2024 09:21:17 +0000 (GMT)
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com [10.45.79.139])
	by NASANPPMTA02.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 45C9LGRf016236
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 12 Jun 2024 09:21:16 GMT
Received: from hu-mojha-hyd.qualcomm.com (10.80.80.8) by
 nasanex01c.na.qualcomm.com (10.45.79.139) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Wed, 12 Jun 2024 02:21:13 -0700
Date: Wed, 12 Jun 2024 14:51:09 +0530
From: Mukesh Ojha <quic_mojha@quicinc.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
CC: Komal Bajaj <quic_kbajaj@quicinc.com>,
        Bjorn Andersson
	<andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring
	<robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
	<conor+dt@kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 2/2] dt-bindings: cache: qcom,llcc: Fix QDU1000
 description
Message-ID: <ZmlohTUi6Ppl4k6f@hu-mojha-hyd.qualcomm.com>
References: <20240612062719.31724-1-quic_kbajaj@quicinc.com>
 <20240612062719.31724-3-quic_kbajaj@quicinc.com>
 <175bd8b0-83b8-45d0-99bd-1e9384fed3f7@kernel.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <175bd8b0-83b8-45d0-99bd-1e9384fed3f7@kernel.org>
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01c.na.qualcomm.com (10.45.79.139)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: -FPgc8fuaJdhcs7nza0EowJ3NumJrYYq
X-Proofpoint-GUID: -FPgc8fuaJdhcs7nza0EowJ3NumJrYYq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-12_05,2024-06-11_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1011 suspectscore=0
 mlxlogscore=999 impostorscore=0 spamscore=0 priorityscore=1501
 lowpriorityscore=0 adultscore=0 bulkscore=0 phishscore=0 mlxscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2405170001 definitions=main-2406120067

On Wed, Jun 12, 2024 at 09:58:50AM +0200, Krzysztof Kozlowski wrote:
> On 12/06/2024 08:27, Komal Bajaj wrote:
> > QDU1000 DTSI comes with one LLCC0-7 base addresses. Updating
> > dt-bindings accordingly.
> > 
> > Fixes: f0f99f371822 ("dt-bindings: cache: qcom,llcc: correct QDU1000 reg entries")
> 
> You are basically reverting without saying this is a revert and without
> explanation.
> 
> What's happening with QDU1000? Why it is such a mess that DTS was
> totally not matching bindings drivers and now suddenly we need to revert
> commits?

I think, this happened because of the refactoring happened in LLCC driver
and at the same time QDU1000 device tree change picked while other SoCs
change was made like 

e.g
https://lore.kernel.org/r/20230314080443.64635-11-manivannan.sadhasivam@linaro.org
https://lore.kernel.org/r/20230517-topic-kailua-llcc-v1-2-d57bd860c43e@linaro.org


However, this change missed for QDU1000, later f0f99f371822 ("dt-bindings: cache: qcom,llcc: correct QDU1000 reg entries")
happened and now realized the driver does not work anymore with current
binding and hence fixing was required.

-Mukesh

