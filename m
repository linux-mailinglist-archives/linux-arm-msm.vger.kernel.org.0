Return-Path: <linux-arm-msm+bounces-39153-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id A4B979D90AB
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 Nov 2024 04:14:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6B1FD288617
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 Nov 2024 03:14:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 67E6844360;
	Tue, 26 Nov 2024 03:14:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="nGD81mL1"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEF1628E3F;
	Tue, 26 Nov 2024 03:14:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732590879; cv=none; b=nreGn/7qxTHrHrweoUqiArO5U474s4gEOoOHpMefys7aCZNtZGzGqQ2rbITDWu7Y2ookvKOjSrjG5/dJXwv320w/wAKg8r79QOCsDlaJVyEc3wsI5bDV+vHEb7yt5twWUJRv9NAwdK0Pd79rTmWrw3OFUCCow4/u1VXV8+6BnSI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732590879; c=relaxed/simple;
	bh=Sk9kkwCuCy8PUE33oshNHfMfKY7r0BCRIeH31kF8TLI=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=EDJwOVAUevDIbFBqo+sx1L4HRdEGxvM1NYLp3sjp+cEHlmEcWna1u3hHWycnnmSSkFJ6FEWoD+kd+7ru4Cxlq0M3nu0pa6/KSoubwNp0xIJqV7Hqo8vjG/ecZ5rOyunuuXnOpOPRZQx/Cpy8xxduRapRgLkFE4rX8dSXWd+yUzs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=nGD81mL1; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4AQ3DMWb010309;
	Tue, 26 Nov 2024 03:14:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	5Co7QXRqtHi1nYPU4uviM4aDdYR7Kosy6nTvXKt1uu8=; b=nGD81mL1eRmVMvy/
	qrfKbRoFn9Uczvzr3B1yvlK7HhBqDY5bF+ezYGs0F26TTOoyIvXJHw2rM2yInGgt
	aaUwctUfSXwMcVbzsFE/DOdfnRw2elG0rDNRhUW9szZwmba2REfMFzltPJsg8o0V
	0OazVgryeRJZWKeE9p5uQ7rzDiaoxqrYCrWlZxGsHXPahnmSocNQa1LGnqPwxAQn
	OmO+Wp01ew9pz1ioEkb/BpEQ9poFTI80xs/CI4Kw0DK0p0VZs05cHF8Mrydu1sit
	lZrwPb7fLcJxERyXZUltUJ8L3NLBZvG7fIL7Foi0x4AyvRCb6E/uUIkZHHctgSRu
	2nKNTA==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 434sw99tp4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 26 Nov 2024 03:14:34 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4AQ3EXTC012414
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 26 Nov 2024 03:14:33 GMT
Received: from [10.64.68.72] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 25 Nov
 2024 19:14:27 -0800
Message-ID: <c77d69d3-d809-4996-b203-e9496e169a8f@quicinc.com>
Date: Tue, 26 Nov 2024 11:14:25 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/3] arm64: dts: qcom: qcs8300-ride: Add watchdog node
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
CC: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio
	<konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski
	<krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <kernel@quicinc.com>, <quic_jiegan@quicinc.com>,
        <quic_aiquny@quicinc.com>, <quic_tingweiz@quicinc.com>
References: <20241125093503.1162412-1-quic_liuxin@quicinc.com>
 <20241125093503.1162412-4-quic_liuxin@quicinc.com>
 <wty3opxcapeesat2bnai6ntbk4utwxk2hf56w4hymwjxj57ora@6f7f2lwtdcpo>
From: Xin Liu <quic_liuxin@quicinc.com>
In-Reply-To: <wty3opxcapeesat2bnai6ntbk4utwxk2hf56w4hymwjxj57ora@6f7f2lwtdcpo>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: 74L2HVY5EriYyKUuj4CBFEbctOnxFFdy
X-Proofpoint-ORIG-GUID: 74L2HVY5EriYyKUuj4CBFEbctOnxFFdy
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0
 mlxlogscore=633 adultscore=0 spamscore=0 impostorscore=0
 priorityscore=1501 phishscore=0 clxscore=1015 mlxscore=0
 lowpriorityscore=0 bulkscore=0 malwarescore=0 classifier=spam adjust=0
 reason=mlx scancount=1 engine=8.19.0-2409260000
 definitions=main-2411260025



在 2024/11/26 0:45, Dmitry Baryshkov 写道:
> I'd really prefer to have this in the SoC dtsi. It's not a part that can
> change between boards.

I think you're right, this clock won't change because of the board The 
reason for placing it on the board is that sleep_clk is defined on the 
board. The following link is the suggestion you once provided:
https://lore.kernel.org/all/4kopdkvbkrpcpzwteezm427ml5putqvzsnfkpmg76spsple7l5@mg7v3ihwxnit/


