Return-Path: <linux-arm-msm+bounces-60448-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D720ACFE24
	for <lists+linux-arm-msm@lfdr.de>; Fri,  6 Jun 2025 10:22:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C45AA3ACE96
	for <lists+linux-arm-msm@lfdr.de>; Fri,  6 Jun 2025 08:21:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7569227BF99;
	Fri,  6 Jun 2025 08:22:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="UM0Fuc8h"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B481C189F43;
	Fri,  6 Jun 2025 08:22:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749198134; cv=none; b=jQ0Dak4MxIj27H0HtvsWupf8GaON0jkJRnEB+IXBrIxD+5RUM4ACqnCUqVpb7YaPwLiPVdVBvEfPtr4yHP5xQiuj0ECvZ9eMVkASRVVkxJgIPihLPCNwELVENY0Xw4/Fa1EinJQJXdzp8ycy8NcSe7tA4Rb0fE/rkhibry/g6ts=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749198134; c=relaxed/simple;
	bh=KUGIQAd3jM9iInlALZiBHMUnVKHULmaAsWOPmbW4Rhw=;
	h=Date:From:To:CC:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bqrX9tckJyGng4zlw9LRgS3pZ/MfV1SVZkUfXQkXfx5mte73nUXKuBI58+74Bm501Hf2ajsXCgzmpgIQXCepf5tdgyUYD6KC3E6lmJthaUwm9mM1zKIebJ1qCKsnUz43YDguRrSTq4AIPxNrA2kFE54XqhLMR7eHtcBSia99Ei8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=UM0Fuc8h; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 555KSrN5027115;
	Fri, 6 Jun 2025 08:22:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=BFdjaTQyCsB4OaXb/L0yUQPh
	Xln/bFbHQQtQTApKxNU=; b=UM0Fuc8haNtSxC88LcxxgGXjr2JICWGWROmuoyYM
	2qNttOVEKFWeRONa4BhzENglsPrGTf0fFce67NUre4P2xePjQhNfPvF7UI1Ej7ye
	GmX0YxmnvPBebnRSIGYib2hLaG6H4n3WBiztN7X2q10xGjVj6U12XcXhnryovkVV
	9VEbK+TYPo/L6HmuzRgBJSi3K3OfKrZPdZtS3CaCp48JVhf5EY/cayLjZhD1BqfF
	6hf0YP7L7Cw/KpNlQ2uaEOx7hc2LenBLoups1YmKwCnQVawNdN+6a2JCmGBRfKKe
	gO+GUa/yax1D6mfGqQyDQpc9hlvjNZ7jNukYsR5A6doZdw==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 471g8nuw5h-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 06 Jun 2025 08:22:09 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 5568M9vS006183
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 6 Jun 2025 08:22:09 GMT
Received: from hu-wasimn-hyd.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Fri, 6 Jun 2025 01:22:02 -0700
Date: Fri, 6 Jun 2025 13:51:58 +0530
From: Wasim Nazir <quic_wasimn@quicinc.com>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
CC: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio
	<konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski
	<krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <kernel@quicinc.com>, <kernel@oss.qualcomm.com>
Subject: Re: [PATCH v9 3/4] arm64: dts: qcom: qcs9075: Introduce QCS9075 SOM
Message-ID: <aEKlJuoQTNs7swVl@hu-wasimn-hyd.qualcomm.com>
References: <20250530092850.631831-1-quic_wasimn@quicinc.com>
 <20250530092850.631831-4-quic_wasimn@quicinc.com>
 <kz7rdu643iw7y2x7t2kmaewfdhzlk53hylivybw7om53dseakf@g5a64rjnup5f>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <kz7rdu643iw7y2x7t2kmaewfdhzlk53hylivybw7om53dseakf@g5a64rjnup5f>
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: VHRglWU1GODgWIB1V15t3UWPSD3x5VwH
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjA2MDA3NiBTYWx0ZWRfXyrZD2QOW2WZf
 7w1Ti6CiDFeimZml0vJ/aOiloT8OPlVsEUkHiColshQzuPLbvbwEl8vCH4blxrd4OQWWIlSLpKC
 W5T2dOPqxFYoaAjpT7cnnLCPq9I2MIMVsuyCY8ExbWE1DPFveaMngUNhppp04tFS24TpZ2CvFoP
 iLiSovujf6RL6xok6lVT6C/iW+H5rNdBCs6RxOUIDTGDUVOXF9+OgUxb54HUEYtwZN8sb0SeED1
 u33liQI12RVmEMvtE2QUk8C+ELVCA1grvpXHvF2YpQPuRen0f7TCem0x/igzlHZ92gQtvNpG7ev
 32YMUHnd65wWSiu54s638xlg8xMXGA0gy3ySISnQ3nIcxwHTeJ3uGvHB/ycWqygO8it8fdVISpE
 QF0dn+xZk+Jo31fyE0MSikX2FPrzQgdMwlKrIQfEK86d/GWvFk0IOaAoMvWwjNrhhqIUvC/7
X-Proofpoint-ORIG-GUID: VHRglWU1GODgWIB1V15t3UWPSD3x5VwH
X-Authority-Analysis: v=2.4 cv=UphjN/wB c=1 sm=1 tr=0 ts=6842a531 cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=kj9zAlcOel0A:10 a=6IFa9wvqVegA:10 a=COk6AnOGAAAA:8
 a=e_47BRpi10H5czWX2-MA:9 a=CjuIK1q_8ugA:10 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-06_02,2025-06-05_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 impostorscore=0 lowpriorityscore=0
 phishscore=0 mlxlogscore=525 clxscore=1015 malwarescore=0 adultscore=0
 bulkscore=0 mlxscore=0 suspectscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506060076

On Mon, Jun 02, 2025 at 10:03:19AM +0300, Dmitry Baryshkov wrote:
> On Fri, May 30, 2025 at 02:58:46PM +0530, Wasim Nazir wrote:
> > QCS9075 is an IoT variant of SA8775P SOC, most notably without
> > safety monitoring feature of Safety Island(SAIL) subsystem.
> > Add qcs9075-som.dtsi to specifies QCS9075 based SOM having SOC,
> > PMICs, Memory-map updates.
> > Use this SOM for qcs9075-iq-9075-evk board.
> 
> No, you are not using the newly added SoM, you are just adding it. If
> you really want to use it for the EVK board, squash this commit into the
> next one.

Sure, will squash it.

> 
> > 
> > Signed-off-by: Wasim Nazir <quic_wasimn@quicinc.com>
> > ---
> >  arch/arm64/boot/dts/qcom/qcs9075-som.dtsi | 10 ++++++++++
> >  1 file changed, 10 insertions(+)
> >  create mode 100644 arch/arm64/boot/dts/qcom/qcs9075-som.dtsi
> > 
> > diff --git a/arch/arm64/boot/dts/qcom/qcs9075-som.dtsi b/arch/arm64/boot/dts/qcom/qcs9075-som.dtsi
> > new file mode 100644
> > index 000000000000..552e40c95e06
> > --- /dev/null
> > +++ b/arch/arm64/boot/dts/qcom/qcs9075-som.dtsi
> > @@ -0,0 +1,10 @@
> > +// SPDX-License-Identifier: BSD-3-Clause
> > +/*
> > + * Copyright (c) 2025, Qualcomm Innovation Center, Inc. All rights reserved.
> > + */
> > +
> > +/dts-v1/;
> > +
> > +#include "sa8775p.dtsi"
> > +#include "iq9-reserved-memory.dtsi"
> > +#include "sa8775p-pmics.dtsi"
> > --
> > 2.49.0
> > 
> 
> -- 
> With best wishes
> Dmitry

-- 
Regards,
Wasim

