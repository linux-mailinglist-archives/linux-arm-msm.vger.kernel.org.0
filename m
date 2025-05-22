Return-Path: <linux-arm-msm+bounces-59096-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id DA51EAC1330
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 May 2025 20:21:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3DB161BC3AF9
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 May 2025 18:21:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3710E198E75;
	Thu, 22 May 2025 18:21:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="SPYSdpMf"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89D41208AD;
	Thu, 22 May 2025 18:21:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747938062; cv=none; b=plGFV9hTBOsqC5WLoRwdIgV6Mqdy3gK60vM2NNwVVpORLsSBIkKqvVx7fQvs5KADr/YVLabtuc+7W98xesP3WZyEA2uuVGLWtrldUwrJliJ/P9rCWUG7RUfd3JTKnBFjZqZlojdL0prs32NyPEtzgBsSJ1uVix5aGoJsCc2bA+s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747938062; c=relaxed/simple;
	bh=lxv1mrz27uBYXTf8K3NOoJWG7c0aDCWYEZb6JCimCME=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=N8g/ZD8YHo0tmlK+OzntWMfptoutrkwdfE94yeCSyXPyL+nBndFOwqrztAZMNd5MD62JYLfqeAQXPmxB426typiFEjzDVjxHMecHdpfVbIMQvp5SZmt02rmc5UvJ0qIS5lFRo40xSzKPKLK5v0/VK6jBultQmOBnCR8GwGku8tk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=SPYSdpMf; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54MAjqbd029481;
	Thu, 22 May 2025 18:19:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	3YXR8er64i8TNQwCGsGTIh45J5+aN82cu97cDgSI07o=; b=SPYSdpMfVMCx5Ce4
	QcsKWUC53mMheSmcBNvdA4sEJgaJakpBaIFPMowv5wCEg0gRGq8zzQt4KA257t6R
	EiZv77Dy29zWmlFm0DXl17fwLKj90JYmc0oXkTBR7GUPg12J6U2OoJnNbhLsdp0x
	0v/2o0D67KOXpRLCyWdQADFijggE74s7omNW5kP2LXrnhjNPiwrW+seoes1oFqSd
	NRX6WPYU97+KxNwxuDJAv0w2YcUhz0YTpM216eXcxrJ+RXoDBYYZCQgu8O+So7u2
	/SIx8/qoUzuOLpjAcXNlJDuQdn1cih1gR0weh9DDiH8Ih7qFRvoVMZ+wVr/b6UCJ
	SoLPNQ==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46rwf47dpt-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 22 May 2025 18:19:58 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 54MIJvc6018539
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 22 May 2025 18:19:57 GMT
Received: from [10.134.71.247] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Thu, 22 May
 2025 11:19:55 -0700
Message-ID: <a5571512-d931-46ce-8cbe-f1118681c6d1@quicinc.com>
Date: Thu, 22 May 2025 11:19:53 -0700
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 00/45] drm/msm/dp: Add MST support for MSM chipsets
To: Jens Glathe <jens.glathe@oldschoolsolutions.biz>,
        Rob Clark
	<robdclark@gmail.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        "Sean
 Paul" <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        "David Airlie" <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Stephen
 Boyd <swboyd@chromium.org>,
        Chandan Uddaraju <chandanu@codeaurora.org>,
        "Guenter Roeck" <groeck@chromium.org>,
        Kuogee Hsieh
	<quic_khsieh@quicinc.com>,
        "Bjorn Andersson" <andersson@kernel.org>,
        Konrad
 Dybcio <konradybcio@kernel.org>,
        "Rob Herring" <robh@kernel.org>,
        Krzysztof
 Kozlowski <krzk+dt@kernel.org>,
        "Conor Dooley" <conor+dt@kernel.org>
CC: Vara Reddy <quic_varar@quicinc.com>, Rob Clark <robdclark@chromium.org>,
        Tanmay Shah <tanmay@codeaurora.org>, <linux-arm-msm@vger.kernel.org>,
        <dri-devel@lists.freedesktop.org>, <freedreno@lists.freedesktop.org>,
        <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
        Jessica Zhang
	<quic_jesszhan@quicinc.com>,
        Laurent Pinchart
	<laurent.pinchart@ideasonboard.com>,
        Yongxing Mou <quic_yongmou@quicinc.com>
References: <20241205-dp_mst-v1-0-f8618d42a99a@quicinc.com>
 <aeb8c8d5-9ce5-410d-8021-df30081697af@oldschoolsolutions.biz>
Content-Language: en-US
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <aeb8c8d5-9ce5-410d-8021-df30081697af@oldschoolsolutions.biz>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTIyMDE4NSBTYWx0ZWRfX61owZbJTwSAl
 BCRuIK7tNLqrGOb+8WZuixy20nYGrMVgpqV54UoxvKW//1k52e9WVT5+IZw4o/qEF4Zyfab8oPO
 8Cev6Wj03FTaK3g5IAOu7OHSDlWb9+YXy7A9XXmt/LXgd/6upyYefNoj2P30INg6wye4hY+GGve
 YavP8mKvZKnqVFysDgP4o3NTy33Eqklj9laI555nBale0jIYXAOGZlUQkZtwNmUCXLAx9o2aJkP
 s0axsMZIBZYNyO028fHGWRBhr+GcJ7uNMAKD+bxve4+as5wk9o04jb4jNH+brAAmOHvgmSdBqa5
 PtGJee32vH0z3f36YNGuUbMilQD/CYMLaTGPRATplKkk2xhQIQfZyvrT7r2H33eCu+dc+NRQOav
 wPh53yYwqzQdA3mFZeYLvPnKy/0wIc7Sbz5jkFvg7r6VqCWuTpHLVMNElMHVDDUV2vL0HFl1
X-Proofpoint-GUID: X9VmTCzSYb66XkSQQZ7axkdsjXISaY8w
X-Authority-Analysis: v=2.4 cv=Ws8rMcfv c=1 sm=1 tr=0 ts=682f6ace cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10
 a=42cjtDgYKixFzRowy9kA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-ORIG-GUID: X9VmTCzSYb66XkSQQZ7axkdsjXISaY8w
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-22_08,2025-05-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 malwarescore=0 clxscore=1011 suspectscore=0 mlxscore=0
 bulkscore=0 phishscore=0 priorityscore=1501 impostorscore=0
 lowpriorityscore=0 mlxlogscore=999 adultscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505160000 definitions=main-2505220185

Hi Jens

On 5/10/2025 5:12 AM, Jens Glathe wrote:
> On 06.12.24 05:31, Abhinav Kumar wrote:
>> base-commit: b166256c1e6ce356fa1404d4c8531830e6f100a8
> 
> Hi Abhinav,
> 
> I would like to test / play around with this patchset, unfortunately 
> this base commit is not easy to find. Trying to apply without gives lots 
> of conflicts. Can you please rebase?
> 
> with best regards
> 
> Jens
> 
> 

We will post a rebased version of this series with the review comments 
addressed within the next 3-4 weeks.

Thanks

Abhinav

