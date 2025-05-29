Return-Path: <linux-arm-msm+bounces-59792-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 27CECAC7A79
	for <lists+linux-arm-msm@lfdr.de>; Thu, 29 May 2025 10:56:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0929E1C01170
	for <lists+linux-arm-msm@lfdr.de>; Thu, 29 May 2025 08:56:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ACAD021A426;
	Thu, 29 May 2025 08:56:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="Cnsgw9Ej"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50C841474CC;
	Thu, 29 May 2025 08:56:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748508967; cv=none; b=hcue/xSszwwx2OdI9HIZpS52BbGn+KA8EXNJ7cGJl8KPer4yzYhzEMCN2565AlseweSTfKZZE/24mC47lIiZ9gI1zLLb/OZhnri2zfOfBJB6JADiwaL7K1SuOjT94zpelZGcPNWmPUU47rCZ68HkL2PKNDMSJQnsvL3Ndo8jnAE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748508967; c=relaxed/simple;
	bh=SARXCNTufuei1amKdyvTa+4VlPApBOHH2y8NPXkO6Gk=;
	h=Date:From:To:CC:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gDw172M6g1m1sYfZe0T+xd1rKQY7RJwbkgcTI0bZtWYt6JuctOB9IsXE7FBHMn0bRLb7KqhphmIYdOtYXmJGQteeTRh96EA87c8x4asHkqtyYmykWGGcb8Ur+p6gSGrNHwcpLYXdJ1V0Qh2m7mbTcVNnyl7vZJkDBbZeN/cHQ6o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=Cnsgw9Ej; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54T10vis007169;
	Thu, 29 May 2025 08:56:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=fwvJvURYk1NjdqWFUzLQ5m2u
	yNfgteE0KIGGLTM7qMU=; b=Cnsgw9EjWsyEhsA4h+mAXkr61+quHRHpwUlOlAPt
	sAGncfqDLUjsmAZsVDZT6yfcdEZAtTkOwKqbvCOlrq34JeTIXX1MJk/IO7zUsbJw
	SZgkA0RSbOaUTahtuny4rzMKzT6Q2XAjt3hU8M+tGhGtxnoIf1KrtuqVWNBDvGs5
	tB3WJB9zOJ5JrfZjJ0wkza17apqi43gb8y23kDh+T7EOvvvut7j9xwjFhD/N/VXK
	b3PgEWme6kP1fztXbDxIJnnFwySKrNzyVc1kTIc8diC6V8ymV8WsGq7Smx1t9Uax
	vz5ybcaqDAeq/553nkx2ilfS+GNPdA9c57OZfKNZuv6A1A==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46u549n1fm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 29 May 2025 08:56:01 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 54T8u0hJ012075
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 29 May 2025 08:56:00 GMT
Received: from hu-wasimn-hyd.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Thu, 29 May 2025 01:55:54 -0700
Date: Thu, 29 May 2025 14:25:50 +0530
From: Wasim Nazir <quic_wasimn@quicinc.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
CC: Rob Herring <robh@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Krzysztof Kozlowski
	<krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <kernel@quicinc.com>, <kernel@oss.qualcomm.com>
Subject: Re: [PATCH v8 1/4] dt-bindings: arm: qcom: Add bindings for QCS9075
 SOC based board
Message-ID: <aDghFmI30CGE66sm@hu-wasimn-hyd.qualcomm.com>
References: <20250528122753.3623570-1-quic_wasimn@quicinc.com>
 <20250528122753.3623570-2-quic_wasimn@quicinc.com>
 <20250528222056.GA907125-robh@kernel.org>
 <853418c8-5aae-440f-a28c-971cef20645f@kernel.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <853418c8-5aae-440f-a28c-971cef20645f@kernel.org>
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: BIi9E1QEiU1RxYxZwz2mXlOcjFqRLfe5
X-Authority-Analysis: v=2.4 cv=E9nNpbdl c=1 sm=1 tr=0 ts=68382121 cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=kj9zAlcOel0A:10 a=dt9VzEwgFbYA:10 a=COk6AnOGAAAA:8
 a=UMomnOuXBGTDzrUDtD0A:9 a=CjuIK1q_8ugA:10 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTI5MDA4NiBTYWx0ZWRfX9PimISNX/EnN
 qmAl+EUkDdA2bN0FsskPWe9noKPeTNiAnUWe+cHEIlzjNKLfLOIxGOFG6RVLW3IG+UPNYfkounY
 svfHLShS6nSncFHJlr+woCXcSL1WqiD0g2tRXwn0iSHN6G+dXUYMiwYYxvD34ePUXbbLy84LFBL
 W09KoqyClvWDeAP+MbiB41slxyqhF6QXnLGqXe6VqX4Ny2FviKw6/nHVyNBAZRdVy+egNDB0cbY
 Gs4+b9a3vWQBY7E34kymoqndNebMcAAg+G9+enta07qKKOMB24R9Yp1Bc2WQ3Be4HCNz4m8c7kx
 YCCbKpNo3E0yQf5ecK4fsFobfJJXjpc448UMp8/jKUxyxQcmv1E0shOi9WaPmNsCL4cRizQCgt5
 cy+h5VXJNAYWliNeJwSsO/rtN5aLyAWnaB5RXr8mI/UxsJ10qXBrVYFsbgFDsudYiltrTNUB
X-Proofpoint-ORIG-GUID: BIi9E1QEiU1RxYxZwz2mXlOcjFqRLfe5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-29_04,2025-05-29_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 mlxlogscore=999 spamscore=0 malwarescore=0 priorityscore=1501
 adultscore=0 phishscore=0 impostorscore=0 lowpriorityscore=0 suspectscore=0
 clxscore=1015 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505160000
 definitions=main-2505290086

On Thu, May 29, 2025 at 08:29:38AM +0200, Krzysztof Kozlowski wrote:
> On 29/05/2025 00:20, Rob Herring wrote:
> > On Wed, May 28, 2025 at 05:57:48PM +0530, Wasim Nazir wrote:
> >> QCS9075 is compatible Industrial-IOT grade variant of SA8775p SOC.
> >> Unlike QCS9100, it doesn't have safety monitoring feature of
> >> Safety-Island(SAIL) subsystem, which affects thermal management.
> >>
> >> qcs9075-iq-9075-evk board is based on QCS9075 SOC.
> >>
> >> Signed-off-by: Wasim Nazir <quic_wasimn@quicinc.com>
> > 
> > This is missing Krzysztof's ack.
> 
> ... and yours. This was acked twice but was changed more often then we
> were able to ack it, so I gave up.

I misunderstood it in our last conversation, I will add the tags in next
series.

> 
> Best regards,
> Krzysztof

Regards,
Wasim

