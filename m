Return-Path: <linux-arm-msm+bounces-56765-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id E1741AA8FE9
	for <lists+linux-arm-msm@lfdr.de>; Mon,  5 May 2025 11:45:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C39961897448
	for <lists+linux-arm-msm@lfdr.de>; Mon,  5 May 2025 09:45:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4A4011FF61E;
	Mon,  5 May 2025 09:44:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="MyUihy/s"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84A681FF1BE;
	Mon,  5 May 2025 09:44:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746438264; cv=none; b=iMsEcDrG1MAse/A2bKgX/uzba3fWA+aeMOanzoBLZWW89e20STsaU6NvtrV6BNc+L1ftGw00EOauPA+t/JFuwZ0eRLFGSOV6JzzxUtd59VX5qKYj6GNlJSuN8/mjdtLxdHSUHg/TY9lrxF5Np4jI0Ejsz7qsWBmwX71W5mPHSO0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746438264; c=relaxed/simple;
	bh=Frbq4cPe0x/+jpeA6S7WejfJcKj5TTENq4qwSrroGLY=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=WqgPmdOQoRHyvYI318WpxsqC0P6SXApWotfiv1IzyvRIFM0VJjCc56GNo8ClxULNPN0dnLSEmsQBDtp6cwDvpbZKCksYtqB1m/IZ4fpRPOETmIFqgQocglM0A9sbBMiVHN3ZoPtJD8IvHzBKlvfA5Y1SJ1hwNMv4nxkePks/qpk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=MyUihy/s; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 544MkHHN027324;
	Mon, 5 May 2025 09:44:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	eV11AjXMMtZoS2Y6USX+Gkg7RRJfhPfdI55iayZ7H08=; b=MyUihy/s1GB7FE22
	9JXyN03XE5VBagauL7pI+LBr9UUGI/HyW54sk7qv8O3CGLqodtukJhOsTf4TsBNy
	XCA/S5hKFOAdTKHP9wtflpatFk2TWIY50+/NQWZD/DLwB9oIAxieUvA8Zm0Paxau
	dMI+G/DYSYUNzIRsCgJud9i9veGJfCBizTWLgK30IECCUvQR+Tu2tJZEg1A28PfF
	Vy/HOx7gDcvrK/X8LIx7iSD2B9bsgWJaB/GsGYvr3AW+gRFd02GOm7Kg9yAuqI6Y
	8EYGqrFt+pEUZCwwQD2LtH4jIVDRV54n4UtkRlyOqh6nc+xIpQ8tefMgV/bMYht6
	4TjHFQ==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46d9ep3sv9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 05 May 2025 09:44:18 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 5459iHLN003098
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 5 May 2025 09:44:17 GMT
Received: from [10.218.23.250] (10.80.80.8) by nalasex01c.na.qualcomm.com
 (10.47.97.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 5 May 2025
 02:44:11 -0700
Message-ID: <86dce0f3-6a2a-49a2-86c3-bfbaafafca03@quicinc.com>
Date: Mon, 5 May 2025 15:14:04 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/4] clk: qcom: camcc-sc8180x: Add SC8180X camera clock
 controller driver
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
CC: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette
	<mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring
	<robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
	<conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Ajit Pandey
	<quic_ajipan@quicinc.com>,
        Imran Shaik <quic_imrashai@quicinc.com>,
        "Taniya
 Das" <quic_tdas@quicinc.com>,
        Jagadeesh Kona <quic_jkona@quicinc.com>,
        <linux-arm-msm@vger.kernel.org>, <linux-clk@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        "Vladimir
 Zapolskiy" <vladimir.zapolskiy@linaro.org>
References: <20250430-sc8180x-camcc-support-v2-0-6bbb514f467c@quicinc.com>
 <20250430-sc8180x-camcc-support-v2-3-6bbb514f467c@quicinc.com>
 <xyvuctx5w2cr6pi2ddjd5m5xqnirloflwkewpg2bcfn2neipe3@mzkis6iklj7o>
Content-Language: en-US
From: Satya Priya Kakitapalli <quic_skakitap@quicinc.com>
In-Reply-To: <xyvuctx5w2cr6pi2ddjd5m5xqnirloflwkewpg2bcfn2neipe3@mzkis6iklj7o>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Authority-Analysis: v=2.4 cv=EOUG00ZC c=1 sm=1 tr=0 ts=68188872 cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=KKAkSRfTAAAA:8
 a=EUspDBNiAAAA:8 a=COk6AnOGAAAA:8 a=9Knu2lq_Co-DWJ-xtoYA:9 a=QEXdDO2ut3YA:10
 a=cvBusfyB2V15izCimMoJ:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: kNC2lAMCO3FYQpWAzfXJA1t2_jFYXMzH
X-Proofpoint-GUID: kNC2lAMCO3FYQpWAzfXJA1t2_jFYXMzH
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTA1MDA5MCBTYWx0ZWRfX2Z1qqbcs6JRu
 /r8gcg85azo0Ow22VDdnmzUL6NvqnKUiNT37oNoFv+k65aEDdWCG9RwPw+INBk21KgOR9sGfG8U
 sEe7v+ykY0Qmcw5wbLd4yHAUh/xBczPUzSUAybdERXloBfTEvgn0jOEgTTFLGK/vlWGGB7nAdZc
 5wcqYjfOeQU08vkL+g01ICiE/8CkRGH1C81hEZXdwFoAa/S1Z3l9x8sctClME+4piT/c4ro6DKi
 Qyp86K9Wj9o63zmNN4sdHE2LC8ydWSuCkLt6mBg7ciQ/nQDOpqUnjCbUzt2BQFJJhAlQVfcsNx2
 63MnLtyMTD6VqGO8oXiC8B+Le5dSqhnA56tpZh3VbtpeKZBt3mYJuyj4DDjc39dh5cQR7Meqmop
 jJU/ckO2Q7ZlZ2K7W+abD6PzwKl/2WKkFgbU7smQ6wVYX2FZksuUIJsph3eikUvbFx0SfcOg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-05_04,2025-04-30_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 impostorscore=0 spamscore=0 lowpriorityscore=0
 bulkscore=0 phishscore=0 suspectscore=0 mlxlogscore=795 mlxscore=0
 priorityscore=1501 malwarescore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2504070000 definitions=main-2505050090


On 5/3/2025 4:05 AM, Dmitry Baryshkov wrote:
> On Wed, Apr 30, 2025 at 04:08:57PM +0530, Satya Priya Kakitapalli wrote:
>> Add support for the camera clock controller for camera clients to
>> be able to request for camcc clocks on SC8180X platform.
>>
>> Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
>> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
>> Signed-off-by: Satya Priya Kakitapalli <quic_skakitap@quicinc.com>
>> ---
> Would it make sense to merge this driver with the camcc-sm8150.c? It
> seems that the blocks are pretty similar.


Earlier I have evaluated the delta between sm8150 and sc8180x camcc and 
found there is significant delta w.r.t clock frequency plan. Hence it is 
better to use a separate driver for this.


>>   drivers/clk/qcom/Kconfig         |   10 +
>>   drivers/clk/qcom/Makefile        |    1 +
>>   drivers/clk/qcom/camcc-sc8180x.c | 2897 ++++++++++++++++++++++++++++++++++++++
>>   3 files changed, 2908 insertions(+)
>>

