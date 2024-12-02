Return-Path: <linux-arm-msm+bounces-39791-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A1FB9DFB6C
	for <lists+linux-arm-msm@lfdr.de>; Mon,  2 Dec 2024 08:47:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 2B242B20E33
	for <lists+linux-arm-msm@lfdr.de>; Mon,  2 Dec 2024 07:47:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D41151D6DA5;
	Mon,  2 Dec 2024 07:47:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="KDrpA75P"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D568A94A;
	Mon,  2 Dec 2024 07:47:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733125654; cv=none; b=R1Y62EhdfNv/EkBpU483bMYrTvXq/vzNzFyhZoL73d5TQJ/yG0WuznU9QewGjxsZzfFbWlm7nB/sG9Cz16JGMytHFDJfhcZP2m4nCH2Cb0pVufbKszHz22LbkTI67SSHrWcr2vUSka0hWm64E9l2QBPFeH/k4wcwE6gA2M3dLyc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733125654; c=relaxed/simple;
	bh=V3+ExgtmweLO/coaoU7q85SpQI/Vs0k3/NzqZ0VpHSk=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=g+Re+kjSCmnUSFnDVYTuRHQc6aXluU1sCJeAPGJdqvUzXUJ9qwkVYvUOcW+B7M+J+O2VDjFzeni/BYa/rS1b4qQNHEODlnuYkDguUFSFE4q0zQ2M+mSdITvrXctduwvdiR1Ad3sxDGtHpCjvWlPrzp9HTmdl09o1bSCggDqgXq4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=KDrpA75P; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4B1Lbjtr025612;
	Mon, 2 Dec 2024 07:47:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	f0W/rDjyjHlxzM1amNJDYsLryAgzcsCVJntHAAqv1Ec=; b=KDrpA75PORYysNP1
	qL5mOJKMGT9YCgkjGZ8yD6nnpeYruPJZRIb+LUCx6/N3cshnTSDn0J2zOr9/nWWl
	4if0YzrbAk4bMdC3cUXU1OXfcNXnFDSsKxkl9BXT2i2hO92RSdwZFLCa+NHYV1Gv
	OJzy+Y1JVAYbG/1fDYB/qpKaBncpHwIUWt69KDF9LfsG2HaxDov9gLbhRaN1eLYr
	Vq5NloOJQ90RcqrRyLgLCHFg1Sfk6Jl0T/9iabY9JWhr67GRoU7E33jXbwiD++8M
	ejc2toJ6gj/tmzFa+0uexy85LJ6bPi3SEpwsrftzELrB/lb8gzmSC1p3tdc/dBlC
	ZBNpwQ==
Received: from nasanppmta05.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 437ufe3sfp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 02 Dec 2024 07:47:29 +0000 (GMT)
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com [10.45.79.139])
	by NASANPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4B27lT4C028914
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 2 Dec 2024 07:47:29 GMT
Received: from [10.231.207.28] (10.80.80.8) by nasanex01c.na.qualcomm.com
 (10.45.79.139) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Sun, 1 Dec 2024
 23:47:23 -0800
Message-ID: <6b351054-6670-4723-ae3a-1a3ddbd05beb@quicinc.com>
Date: Mon, 2 Dec 2024 15:47:21 +0800
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
 <c425b639-20a8-439c-9e9a-8b5095f8d3b0@quicinc.com>
 <CAA8EJpqyQ32TNr-_0owXqbCzbwRcr7enmUV2TYoX3yWHz-Vn4A@mail.gmail.com>
Content-Language: en-US
From: Tingguo Cheng <quic_tingguoc@quicinc.com>
In-Reply-To: <CAA8EJpqyQ32TNr-_0owXqbCzbwRcr7enmUV2TYoX3yWHz-Vn4A@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01c.na.qualcomm.com (10.45.79.139)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: ymcQ7TaaBIgaBPUjpEj4PHnr-wPGNo0i
X-Proofpoint-GUID: ymcQ7TaaBIgaBPUjpEj4PHnr-wPGNo0i
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 suspectscore=0
 spamscore=0 impostorscore=0 lowpriorityscore=0 priorityscore=1501
 mlxlogscore=999 clxscore=1015 adultscore=0 bulkscore=0 mlxscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412020068



On 12/1/2024 4:08 PM, Dmitry Baryshkov wrote:
> On Sun, 1 Dec 2024 at 09:13, Tingguo Cheng <quic_tingguoc@quicinc.com> wrote:
>>
>>
>>
>> On 11/28/2024 9:10 PM, Dmitry Baryshkov wrote:
>>> On Thu, Nov 28, 2024 at 05:40:15PM +0800, Tingguo Cheng wrote:
>>>> Enable SPMI bus, PMIC and PMIC peripherals for qcs8300-ride board. The
>>>> qcs8300-ride use 2 pmics(pmm8620au:0,pmm8650au:1) on the board, which
>>>> are variants of pmm8654au used on sa8775p/qcs9100 -ride(4x pmics).
>>>>
>>>> This patch series depends on the patch series:
>>>> https://lore.kernel.org/all/20240925-qcs8300_initial_dtsi-v2-0-494c40fa2a42@quicinc.com/
>>>>
>>>> Signed-off-by: Tingguo Cheng <quic_tingguoc@quicinc.com>
>>>> ---
>>>> Changes in v2:
>>>> - Fixed comments in community.
>>>
>>> comments in community? What does that mean?
>> Comments given by the opensource community in the Email list. Sorry for
>> not being clear about this.
> 
> Please in future describe your changes in changelog. Saying 'fixed
> review comments' is not enough, as it's hard to tell, what was
> actually changed and what wasn't.
Got it, thanks Dmitry. I will make those details in changelog.
> 
>>>
>>>> - Added arbiter version(5.2.0) in commit message.
>>>> - Link to v1: https://lore.kernel.org/r/20241126-adds-spmi-pmic-peripherals-for-qcs8300-v1-0-28af84cb86f8@quicinc.com
>>>>
>>>> ---
>>>> Tingguo Cheng (2):
>>>>         arm64: dts: qcom: qcs8300: Adds SPMI support
>>>>         arm64: dts: qcom: qcs8300-ride: Enable PMIC peripherals
>>>>
>>>>    arch/arm64/boot/dts/qcom/qcs8300-ride.dts | 23 +++++++++++++++++++++++
>>>>    arch/arm64/boot/dts/qcom/qcs8300.dtsi     | 22 ++++++++++++++++++++++
>>>>    2 files changed, 45 insertions(+)
>>>> ---
>>>> base-commit: decc701f41d07481893fdea942c0ac6b226e84cd
>>>> change-id: 20241122-adds-spmi-pmic-peripherals-for-qcs8300-0a3c4458cf7e
>>>> prerequisite-change-id: 20240925-qcs8300_initial_dtsi-ea614fe45341:v2
>>>> prerequisite-patch-id: 73c78f31fa1d504124d4a82b578a6a14126cccd8
>>>> prerequisite-patch-id: 5a01283c8654ae7c696d9c69cb21505b71c5ca27
>>>> prerequisite-patch-id: dc633d5aaac790776a8a213ea2faa4890a3f665d
>>>> prerequisite-patch-id: 9ecf4cb8b5842ac64e51d6baa0e6c1fbe449ee66
>>>>
>>>> Best regards,
>>>> --
>>>> Tingguo Cheng <quic_tingguoc@quicinc.com>
>>>>
>>>
>>
>> --
>> Thank you & BRs
>> Tingguo
>>
> 
> 

-- 
Thank you & BRs
Tingguo


