Return-Path: <linux-arm-msm+bounces-50153-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 90776A4D984
	for <lists+linux-arm-msm@lfdr.de>; Tue,  4 Mar 2025 10:59:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BEBFE16ABA0
	for <lists+linux-arm-msm@lfdr.de>; Tue,  4 Mar 2025 09:59:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 17A0D1FCFC2;
	Tue,  4 Mar 2025 09:59:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="I/ucUq7m"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9DE31F4E38;
	Tue,  4 Mar 2025 09:58:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741082340; cv=none; b=gT7UAreoX+9qkTRNkFqc07Gf4F7UrhcMhAThD9sXPPnpzR3JYMixszojqPnoJ3tgul8lz3kP3zs/rWPQCgSNKWLeHcqU7mz6wgguYGvIa6U6mdDHEjOnxZs2x1W4d8NtrFJpQesEBRmudH/HZKYKaJyNV2q0sT2XT/0nVdC8hqU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741082340; c=relaxed/simple;
	bh=PAtPy/wt2rCEh7ng3mCcrXdrycMnjRtf1qS6olDHhzs=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=fB2RKA41m1eFrHLrbHDxNl3lmUA2qrmU2+ZW3GeNtnCDiJgMEjTYJqQrc2OkkGAkIq/feeesRKt2CEFgNX7aVe7bPHm94F1YTXgKumHkPe4g854j0dtCBSZUDGejeZwc3iuNY1OW4an4SEShdSdj/xfYgUJ1BEGLkjt6cG0bqGE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=I/ucUq7m; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5249t5o8017322;
	Tue, 4 Mar 2025 09:58:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	XaKME3qV1Kg76zd5EjKy7antbBVtuWC78krGEB2xPew=; b=I/ucUq7mZ944MWww
	BpyPu8dTBxf5y+OtaELtGgPuWew02t76dUCd0z9A4YJtpuR/ucvCoLR81tJ6Y9pe
	C1NNIN0Q9IJakVPyzXO0jFksXxZj0SgP+uswcTfL+znIZs2K6WkuhcoJcnJPBqJg
	INIuOjkgd/AzEAHG5lI6k5WJ82sWGsrGqK7d7i+m1QsbVtIU5cbgI0/YILMOpwqY
	Tl3ul9dnkOE+TJrLJ4cSIIpGfNxYnbPdIWy1CocKnNufRvJ0pnlP3N8kU8cEZHRQ
	xAY+gkJ9v3BjyGT60LG+hpmqiakcIPNbEa5OkO9dHznuIX/0Gi7rtOKmX2viEO/9
	FSyPJw==
Received: from nasanppmta04.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 455p6thfkq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 04 Mar 2025 09:58:43 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 5249wgBG017419
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 4 Mar 2025 09:58:42 GMT
Received: from [10.204.66.137] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 4 Mar 2025
 01:58:35 -0800
Message-ID: <963915a3-819f-46f7-88eb-f3420d9660d5@quicinc.com>
Date: Tue, 4 Mar 2025 15:28:32 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 07/11] arm64: dts: qcom: sa8775p-ride: add anx7625 DSI to
 DP bridge nodes
To: Krzysztof Kozlowski <krzk@kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <dri-devel@lists.freedesktop.org>, <freedreno@lists.freedesktop.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
CC: <robdclark@gmail.com>, <dmitry.baryshkov@linaro.org>, <sean@poorly.run>,
        <marijn.suijten@somainline.org>, <andersson@kernel.org>,
        <robh@kernel.org>, <robh+dt@kernel.org>, <krzk+dt@kernel.org>,
        <konradybcio@kernel.org>, <conor+dt@kernel.org>,
        <andrzej.hajda@intel.com>, <neil.armstrong@linaro.org>,
        <rfoss@kernel.org>, <Laurent.pinchart@ideasonboard.com>,
        <jonas@kwiboo.se>, <jernej.skrabec@gmail.com>,
        <quic_abhinavk@quicinc.com>, <quic_rajeevny@quicinc.com>,
        <quic_vproddut@quicinc.com>, <quic_jesszhan@quicinc.com>
References: <20250225121824.3869719-1-quic_amakhija@quicinc.com>
 <20250225121824.3869719-8-quic_amakhija@quicinc.com>
 <ecdc2230-1ce1-4d70-a352-180f6cd29e61@kernel.org>
 <20250226-futuristic-messy-rook-e9f85c@krzk-bin>
Content-Language: en-US
From: Ayushi Makhija <quic_amakhija@quicinc.com>
In-Reply-To: <20250226-futuristic-messy-rook-e9f85c@krzk-bin>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Authority-Analysis: v=2.4 cv=PMb1+eqC c=1 sm=1 tr=0 ts=67c6ced3 cx=c_pps a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=Vs1iUdzkB0EA:10 a=Oh48bqpFvL8qWIr0kS4A:9 a=QEXdDO2ut3YA:10
X-Proofpoint-ORIG-GUID: kLHL-FOeG01MCscaXHFCJbfQsm80sH-m
X-Proofpoint-GUID: kLHL-FOeG01MCscaXHFCJbfQsm80sH-m
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-04_04,2025-03-03_04,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 mlxlogscore=999
 phishscore=0 lowpriorityscore=0 malwarescore=0 priorityscore=1501
 mlxscore=0 adultscore=0 spamscore=0 suspectscore=0 impostorscore=0
 clxscore=1011 classifier=spam authscore=0 adjust=0 reason=mlx scancount=1
 engine=8.19.0-2502100000 definitions=main-2503040084

On 2/26/2025 2:05 PM, Krzysztof Kozlowski wrote:
> On Tue, Feb 25, 2025 at 02:31:05PM +0100, Krzysztof Kozlowski wrote:
>> On 25/02/2025 13:18, Ayushi Makhija wrote:
>>> +		pinctrl-0 = <&dsi0_int_pin>,
>>> +				<&dsi0_cbl_det_pin>,
>>> +				<&dsi1_int_pin>,
>>> +				<&dsi1_cbl_det_pin>;
>>> +		pinctrl-names = "default";
>>> +
>>> +		dsi0_int_pin: gpio2_cfg {
>>
>>
>> No underscores, see DTS coding style.
> 
> And as Rob's bot pointed out: insufficient testing. :(
> 
> Please be 100% sure everything is tested before you post new version.
> You shouldn't use reviewers for the job of tools, that's quite waste of
> our time.
> 
> Best regards,
> Krzysztof

Hi Krzysztof,

Thanks, for the review.

Sorry for the mistake. I will post the clean patch in my next patchset.

Thank,
Ayushi



