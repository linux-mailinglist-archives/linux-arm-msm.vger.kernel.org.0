Return-Path: <linux-arm-msm+bounces-41253-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B3FC9EABE0
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Dec 2024 10:24:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 33DDC163EA3
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Dec 2024 09:24:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3D6A7233D75;
	Tue, 10 Dec 2024 09:24:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="LLqFsB0A"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83A352327BD;
	Tue, 10 Dec 2024 09:24:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733822685; cv=none; b=bnaGekPEGOT6+Q1VQfE//41Jzc0BC5HgIsh5XESHl4IdnxpG8Br4onSZ7OL1kGJrFfY0pvVtpB1s6wX967T+0gPXVIfW4m+3dRoUuKq/AZDLzWtf1fwwBjIfamdrXynkwID9Po5yStVdYTGSGH7MuSWRR5KO5p0S4uPRUcjbLUU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733822685; c=relaxed/simple;
	bh=Bld1RYwFPgcAVNG09chT8LEMCMyY+cirvfjtjyHOHgE=;
	h=Date:From:To:CC:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bou6wJj+PwJMZ8zwHRZH8wLLrgedLoQPop+afLszxjJugSLfxI/8ry4Ld3VegjAbFUDFdfdB2PAotOeZRpl2eu8JeYyetTGuzKjk8qFUmRIwHOUaWs+FkBOw25ZWDxKBZPvMelbZIOs3TPvtbQcQmtLxPfuRsSAe8eKFm4TnBJs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=LLqFsB0A; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BA7rowa002485;
	Tue, 10 Dec 2024 09:24:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	bMguorV0nYqmE3rzkK2Y78lQNVVtcEmW+iqDqJDT4wQ=; b=LLqFsB0AhrVmz3X8
	Yyr1elm6cagmq531ChjsQYBAJhtlqaY5Nl4gBC3NmjRU7Q9OV8Aa2QrnT5FTvR1B
	72MCVn1fCzCT5QQtyKB3au/62xwq6fPOFp3DZcZzToWWSLcr20+6Qz279vj1t40g
	0+Nrk1Jyd9l5BB+jSNgTi/mVudpLrFkqkiSd2cIQUKj1RHJZjhsjMAObwnPpBrvz
	6BkboaF4k6kHiLVAvrc5CXDyVkIJfxAACOH0NWdu+BY6YGXDS3O1bZkOI0Hh7ep4
	NWBLcKqiT9SnVxrM1sRMRYP6jbJXth0gR9AhOJaO8LwZhnS9saCO9MA4DKohtqFp
	w4mvjA==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43dxw43jtw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 10 Dec 2024 09:24:39 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4BA9ObmM028576
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 10 Dec 2024 09:24:37 GMT
Received: from hu-wasimn-hyd.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Tue, 10 Dec 2024 01:24:30 -0800
Date: Tue, 10 Dec 2024 14:54:22 +0530
From: Wasim Nazir <quic_wasimn@quicinc.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
CC: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Konrad Dybcio
	<konrad.dybcio@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <kernel@quicinc.com>
Subject: Re: [PATCH v3 5/5] arm64: dts: qcom: Add support for QCS9075 Ride &
 Ride-r3
Message-ID: <Z1gIsrWAT3QftC4c@hu-wasimn-hyd.qualcomm.com>
References: <20241119174954.1219002-1-quic_wasimn@quicinc.com>
 <20241119174954.1219002-6-quic_wasimn@quicinc.com>
 <9e351979-be01-4d38-9b94-cc23efac4c3f@kernel.org>
 <Z1LaN9nFr5msfq61@hu-wasimn-hyd.qualcomm.com>
 <cbed17c2-d839-42cb-8a33-b59538bfccf3@oss.qualcomm.com>
 <c639ca40-9e4f-4882-8441-57413e835422@kernel.org>
 <Z1c9wMxQ5xSqvPmf@hu-wasimn-hyd.qualcomm.com>
 <8cf9edc0-a0cb-4fd0-b10e-2138784dfba3@kernel.org>
 <iu6ssjczkdfkhfy2n6vxf3f3c2pepsepslzvnh5z4susxgxgqa@engwsvhu533x>
 <5782d7c6-1a75-4f15-8942-387742e0ae09@kernel.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <5782d7c6-1a75-4f15-8942-387742e0ae09@kernel.org>
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: 9rMVKJ6zcSB1_APun9m_PZObBHhyzWVl
X-Proofpoint-GUID: 9rMVKJ6zcSB1_APun9m_PZObBHhyzWVl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 bulkscore=0
 suspectscore=0 priorityscore=1501 adultscore=0 mlxlogscore=644
 clxscore=1015 spamscore=0 mlxscore=0 lowpriorityscore=0 phishscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412100069

On Tue, Dec 10, 2024 at 08:25:34AM +0100, Krzysztof Kozlowski wrote:
> On 10/12/2024 00:25, Dmitry Baryshkov wrote:
> >>>>>> 9100 & 9075 are different from “safe” perspective. They differ in
> >>>>>> changes related to thermal which will be added later in devicetree.
> >>>>>
> >>>>> Since this can't be inferred from just looking at the changes, please
> >>>>> make sure to add that to the commit message
> >>>>
> >>>> Any include of other DTS is clear sign something is odd here. Including
> >>>> multiple times without any added nodes is showing these are not real
> >>>> products/boards .
> >>>
> >>> We're adding DTS to reuse the common board changes, with plans to
> >>> include the differences in upcoming patches. To provide more clarity, I
> >>> will include patches in this series to highlight the differences between
> >>> the 9100 and 9075 boards.
> >>
> >> Sure, still do not include DTS. Just like C files don't include C files.
> > 
> > So, is the solution simple, rename .dts to .dtsi and include it from
> > both .dts files?
> 
> For example. This leads to more questions - what is common here? We do
> not create shared DTSI files just because someone wants, but to really
> note shared components or shared designs.
> 

We can reuse the common dtsi for ride boards, i.e., sa8775p-ride.dtsi,
and then add board-specific changes in the corresponding files.

If this approach is acceptable, I can proceed with sending the
next patch series. I hope this will help clarify things further.

> Best regards,
> Krzysztof

Thanks & Regards,
Wasim

