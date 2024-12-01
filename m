Return-Path: <linux-arm-msm+bounces-39762-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 47FF09DF4E9
	for <lists+linux-arm-msm@lfdr.de>; Sun,  1 Dec 2024 08:13:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id F18DB1629E3
	for <lists+linux-arm-msm@lfdr.de>; Sun,  1 Dec 2024 07:13:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D755E6A332;
	Sun,  1 Dec 2024 07:13:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="LYjZ7MW7"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0626014A84;
	Sun,  1 Dec 2024 07:13:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733037232; cv=none; b=T9P/K5pLHhUECy3ob4phchsYNyJvchf+E8T2+nAq8AJCPNEJpGTBs5KfkOMalCUA33K7ZZAdi3WreR7k41PuDV8//McmzR01+Uw/e+J6mGZtNDe2UDBbIjy9Nj6ZOUXHwwFhoPEiozTxMG6fYxhvY4tHC5fN9lA2Qub22aUDeHc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733037232; c=relaxed/simple;
	bh=eF7SwQDQq8X4sYZVBnIdTlRL5EJnGXcq1h+TUQPdAC8=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=Z0YQVJdQOKfdiNy9IsscUcayq3cwLRO/M+3K5+SJD+T72GY34wVyxzgctZ2ajHXeXqrJVeZ+mI0rcDtHDYNlabVlOYLwzGUl16NQPm0CKgIfQONw9XL365NwTWB+AvZ3orLeJ+QwhNIVXdIFsWyJGNENeIZc/sthH3E6Qz6zEcY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=LYjZ7MW7; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4B16FvWJ012825;
	Sun, 1 Dec 2024 07:13:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	5C/OYn75vUeGpVMKi1UlDtSYMsW9MJxYmqzuHkavfPQ=; b=LYjZ7MW7jpf4OglP
	UmhI4r8W3IGz/0r2uO0StPV7Jp7QQXJtOX5dcEBkbSOUI9FMaOi49gUh2pNv8rwT
	K8R83KEanIMx0uPU3SlpKvxkR+yYf6IJHsVr9WQ6bgPtvdfSmOaeeAvh2Nng5HMD
	Aq7e2C6pjEvNT+NKSHwj5MfjYka5UPQv7uu9ZZYslFZMXx8OC1t0RZYNnBE+YWc1
	HDVNPleSuzWTUwTV8eRskqd9v2BvQAfjqeebYJ6dJS7ImUyOVq10KJPEkQiFvZg1
	lcq1DmnjyhjwNB/LhDgacMoQP+FNYTO+hOcOkWa1e0saXdNpQ9nhODPKDlboQ7Tn
	zvjybA==
Received: from nasanppmta02.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 437u369w6e-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 01 Dec 2024 07:13:34 +0000 (GMT)
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com [10.45.79.139])
	by NASANPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4B17DXPC010545
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 1 Dec 2024 07:13:33 GMT
Received: from [10.231.207.28] (10.80.80.8) by nasanex01c.na.qualcomm.com
 (10.45.79.139) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Sat, 30 Nov
 2024 23:13:27 -0800
Message-ID: <c425b639-20a8-439c-9e9a-8b5095f8d3b0@quicinc.com>
Date: Sun, 1 Dec 2024 15:13:25 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/2] Adds SPMI bus, PMIC and peripherals for
 qcs8300-ride
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
CC: <quic_fenglinw@quicinc.com>, <quic_tingweiz@quicinc.com>,
        <kernel@quicinc.com>, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio
	<konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski
	<krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
References: <20241128-adds-spmi-pmic-peripherals-for-qcs8300-v2-0-001c0bed7c67@quicinc.com>
 <sxbjxywwjbep5rlndxoi5k62hqs24biryslkwbcxtvz3ilypvl@qi4omifueyqu>
Content-Language: en-US
From: Tingguo Cheng <quic_tingguoc@quicinc.com>
In-Reply-To: <sxbjxywwjbep5rlndxoi5k62hqs24biryslkwbcxtvz3ilypvl@qi4omifueyqu>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01c.na.qualcomm.com (10.45.79.139)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: R43pZ14axOHVs73jyCuiNvQNmuLpBXGD
X-Proofpoint-ORIG-GUID: R43pZ14axOHVs73jyCuiNvQNmuLpBXGD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 mlxscore=0
 clxscore=1015 bulkscore=0 adultscore=0 lowpriorityscore=0 impostorscore=0
 mlxlogscore=999 phishscore=0 suspectscore=0 spamscore=0 priorityscore=1501
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2411120000
 definitions=main-2412010056



On 11/28/2024 9:10 PM, Dmitry Baryshkov wrote:
> On Thu, Nov 28, 2024 at 05:40:15PM +0800, Tingguo Cheng wrote:
>> Enable SPMI bus, PMIC and PMIC peripherals for qcs8300-ride board. The
>> qcs8300-ride use 2 pmics(pmm8620au:0,pmm8650au:1) on the board, which
>> are variants of pmm8654au used on sa8775p/qcs9100 -ride(4x pmics).
>>
>> This patch series depends on the patch series:
>> https://lore.kernel.org/all/20240925-qcs8300_initial_dtsi-v2-0-494c40fa2a42@quicinc.com/
>>
>> Signed-off-by: Tingguo Cheng <quic_tingguoc@quicinc.com>
>> ---
>> Changes in v2:
>> - Fixed comments in community.
> 
> comments in community? What does that mean?
Comments given by the opensource community in the Email list. Sorry for 
not being clear about this.
> 
>> - Added arbiter version(5.2.0) in commit message.
>> - Link to v1: https://lore.kernel.org/r/20241126-adds-spmi-pmic-peripherals-for-qcs8300-v1-0-28af84cb86f8@quicinc.com
>>
>> ---
>> Tingguo Cheng (2):
>>        arm64: dts: qcom: qcs8300: Adds SPMI support
>>        arm64: dts: qcom: qcs8300-ride: Enable PMIC peripherals
>>
>>   arch/arm64/boot/dts/qcom/qcs8300-ride.dts | 23 +++++++++++++++++++++++
>>   arch/arm64/boot/dts/qcom/qcs8300.dtsi     | 22 ++++++++++++++++++++++
>>   2 files changed, 45 insertions(+)
>> ---
>> base-commit: decc701f41d07481893fdea942c0ac6b226e84cd
>> change-id: 20241122-adds-spmi-pmic-peripherals-for-qcs8300-0a3c4458cf7e
>> prerequisite-change-id: 20240925-qcs8300_initial_dtsi-ea614fe45341:v2
>> prerequisite-patch-id: 73c78f31fa1d504124d4a82b578a6a14126cccd8
>> prerequisite-patch-id: 5a01283c8654ae7c696d9c69cb21505b71c5ca27
>> prerequisite-patch-id: dc633d5aaac790776a8a213ea2faa4890a3f665d
>> prerequisite-patch-id: 9ecf4cb8b5842ac64e51d6baa0e6c1fbe449ee66
>>
>> Best regards,
>> -- 
>> Tingguo Cheng <quic_tingguoc@quicinc.com>
>>
> 

-- 
Thank you & BRs
Tingguo


