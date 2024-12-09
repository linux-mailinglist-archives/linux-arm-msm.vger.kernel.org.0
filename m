Return-Path: <linux-arm-msm+bounces-41143-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 074EF9E9EBA
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Dec 2024 20:02:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1D95C1881C5C
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Dec 2024 19:02:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 79D6C1850AF;
	Mon,  9 Dec 2024 18:58:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="mDnsDU/T"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D664214E2CC;
	Mon,  9 Dec 2024 18:58:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733770703; cv=none; b=j3J4pjEKUKnOBSsm6Tohs+rcDdNNs2twJSwVy//IUByp4LeVyp0sn8XG4J46jvUND1UwZaWOAIcvDn86yTBfxjNrJugAZXlQJ9+YHnHjsPV3OXqlATYXcNFGKK74THOyrud/8s/j0Di5J9+Q/cE8UMLsMFIkcWUQ1yHKSlqiA9s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733770703; c=relaxed/simple;
	bh=6fyRIYXzVYT/2xfrAG34KVoTMbJUIWwoZm34h2OifCw=;
	h=Date:From:To:CC:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qLbQOWb7XaG23J0gSZUn6W9JSY0J/kKc9Pfd7hHgHYoxc1wegOBPybzfd06DXLhDDbXufECczbCeogRtDhqqgWcLcuvtCFuHLnVln3Bknv/CEFlEz3YgceNAlHuBXz+4aDx2X3usp7BqS6vqKEZQ3Sfpt36/6la08tJpnaUxorI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=mDnsDU/T; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4B9E6koP006932;
	Mon, 9 Dec 2024 18:58:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	OM0V8iFOdT6/r2UghGUlvODh6IPKgLd1ZfUAPKY+vhE=; b=mDnsDU/TShquRDV4
	hkklYIu10Mvv15pzruSAS8iY2ufoyKnhwzZKyo4qzBSA7sQnGn/eH3znWKgABKNa
	WYMqTrwkD3smLaBIFweztN7HCBIONet7eowDtzkwXZB8FaUpeoClC70ABdRd0aRp
	v+jddXpCln/WghmKMM0CF7qRW+r2oIznxONJr+iTsWvdGA371FhSj8bspdNHwOWy
	mdduztcPQrXeRyVzNC1lnySZkmb72GC6x2r2GPhN9/g7E9b4ZQXBJZjN+i33w9yY
	UlbNqFWU436t8gqAOOc8CkT4ByuytNDW7VJfAbokuRcxVSL82A3Bv8taAMxS3GY3
	sMK3uQ==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43e21bgvjg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 09 Dec 2024 18:58:18 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4B9IwILX029061
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 9 Dec 2024 18:58:18 GMT
Received: from hu-wasimn-hyd.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Mon, 9 Dec 2024 10:58:12 -0800
Date: Tue, 10 Dec 2024 00:28:08 +0530
From: Wasim Nazir <quic_wasimn@quicinc.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
CC: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bjorn Andersson
	<andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring
	<robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
	<conor+dt@kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <kernel@quicinc.com>
Subject: Re: [PATCH v3 5/5] arm64: dts: qcom: Add support for QCS9075 Ride &
 Ride-r3
Message-ID: <Z1c9wMxQ5xSqvPmf@hu-wasimn-hyd.qualcomm.com>
References: <20241119174954.1219002-1-quic_wasimn@quicinc.com>
 <20241119174954.1219002-6-quic_wasimn@quicinc.com>
 <9e351979-be01-4d38-9b94-cc23efac4c3f@kernel.org>
 <Z1LaN9nFr5msfq61@hu-wasimn-hyd.qualcomm.com>
 <cbed17c2-d839-42cb-8a33-b59538bfccf3@oss.qualcomm.com>
 <c639ca40-9e4f-4882-8441-57413e835422@kernel.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <c639ca40-9e4f-4882-8441-57413e835422@kernel.org>
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: JdIGhfQ1ZL2dmwIG6bcH-qTc6QRCZglU
X-Proofpoint-ORIG-GUID: JdIGhfQ1ZL2dmwIG6bcH-qTc6QRCZglU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 clxscore=1015
 malwarescore=0 lowpriorityscore=0 mlxlogscore=771 priorityscore=1501
 spamscore=0 impostorscore=0 adultscore=0 bulkscore=0 phishscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412090147

On Fri, Dec 06, 2024 at 01:49:51PM +0100, Krzysztof Kozlowski wrote:
> On 06/12/2024 13:14, Konrad Dybcio wrote:
> >>>> diff --git a/arch/arm64/boot/dts/qcom/qcs9075-ride-r3.dts b/arch/arm64/boot/dts/qcom/qcs9075-ride-r3.dts
> >>>> new file mode 100644
> >>>> index 000000000000..a04c8d1fa258
> >>>> --- /dev/null
> >>>> +++ b/arch/arm64/boot/dts/qcom/qcs9075-ride-r3.dts
> >>>> @@ -0,0 +1,12 @@
> >>>> +// SPDX-License-Identifier: BSD-3-Clause
> >>>> +/*
> >>>> + * Copyright (c) 2024, Qualcomm Innovation Center, Inc. All rights reserved.
> >>>> + */
> >>>> +/dts-v1/;
> >>>> +
> >>>> +#include "sa8775p-ride-r3.dts"
> >>> No guys, you are making these things up. This is EXACTLY the same as
> >>> qcs9100.
> >>
> >> 9100 & 9075 are different from “safe” perspective. They differ in
> >> changes related to thermal which will be added later in devicetree.
> > 
> > Since this can't be inferred from just looking at the changes, please
> > make sure to add that to the commit message
> 
> Any include of other DTS is clear sign something is odd here. Including
> multiple times without any added nodes is showing these are not real
> products/boards .

We're adding DTS to reuse the common board changes, with plans to
include the differences in upcoming patches. To provide more clarity, I
will include patches in this series to highlight the differences between
the 9100 and 9075 boards.

> Best regards,
> Krzysztof

Thanks & Regards,
Wasim

