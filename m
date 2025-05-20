Return-Path: <linux-arm-msm+bounces-58608-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 28BA8ABCFD0
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 May 2025 08:48:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A0FA88A5CAC
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 May 2025 06:47:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 723EC25B693;
	Tue, 20 May 2025 06:47:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="kvQ/J8J7"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C54DC211710;
	Tue, 20 May 2025 06:47:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747723678; cv=none; b=WcQmYmNZuazRcikd8poQ2BKF/XOLoarCZD2NIthR0QQ6pze+EzBer8wpoDk6+x+g/bRZmW0Sclw5n9eWxJp2GEh/X5nv5VObeZxJdy5MljvbQkcKL5cwU/bpYcHf8M7tPemeiFBwGkDia4PWtuE3uI+W5DNPW9Z1yDOJcIdhwLY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747723678; c=relaxed/simple;
	bh=nmxhlZnT215RIC4vJiqcWFOXKo0rEiKjadtXHsw8O6w=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=Eitvm9BfHWl70D2w8TU6I7r55mwPUeDSTXKoaV9O3ylNq8n31Pk50eG0Csfwy0md/S9wKPc5H0QvAb4zK1uiG/8Yrvr3oSyQLQX5Pw73Q7hvFGtsVb1/PyQu1IArnVY4t18ZtQJOn9ITAH6304j+EsL8PDBgTuIDcrz+JQBmopo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=kvQ/J8J7; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54JJU7K6027074;
	Tue, 20 May 2025 06:47:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Rz99vmm5raphdJD90WubrzRPKriJZM2DYV/MKSPOsWI=; b=kvQ/J8J77CLz2//w
	Qe9khL+b0HVLNWeFOxLmoEuejt2Keca25WiOQRERGE1+auLHJ5Liok3NNvnWSZbn
	6AUjO+jG/glhORamP/6vhigohCFU5gSuWpdJOmyM/wZIuBjHVMF9vmfh8qbUzdv+
	Z9YTQd7nBnn26ftdvvvvp0+qcWT1VgA/wYCdiwwpcS+qRuzAaDUq2Ks57567qKRh
	DRiSjoLVe0yfggtY0sKX+v0KjwIn+hJXwdVtxSL9qtQzf1SVqQPRrM+qKXrcvvU1
	hM9Ji+mgmWYYkt+Xi3cdKZj5Me/lFIoZnjQKQ/h666TYvHO5dJIN460FeuFJ0c4l
	WPiO0w==
Received: from nasanppmta05.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46pju7esae-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 20 May 2025 06:47:52 +0000 (GMT)
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com [10.45.79.139])
	by NASANPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 54K6lpxk012288
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 20 May 2025 06:47:51 GMT
Received: from [10.239.29.49] (10.80.80.8) by nasanex01c.na.qualcomm.com
 (10.45.79.139) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 19 May
 2025 23:47:47 -0700
Message-ID: <70ffec25-17c9-4424-9d0b-da6560f7160d@quicinc.com>
Date: Tue, 20 May 2025 14:47:45 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/3] arm64: dts: qcom: sc7280: Add dma-coherent
 property for fastrpc nodes
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
CC: <cros-qcom-dts-watchers@chromium.org>, <andersson@kernel.org>,
        <konradybcio@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <ekansh.gupta@oss.qualcomm.com>
References: <20250516110029.1637270-1-quic_lxu5@quicinc.com>
 <20250516110029.1637270-4-quic_lxu5@quicinc.com>
 <isvo4c2taozzlovqwqvgfu2v2tbvntkaw4bdpzmiuir64avojl@3utwffmzmhq4>
Content-Language: en-US
From: Ling Xu <quic_lxu5@quicinc.com>
In-Reply-To: <isvo4c2taozzlovqwqvgfu2v2tbvntkaw4bdpzmiuir64avojl@3utwffmzmhq4>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01c.na.qualcomm.com (10.45.79.139)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Authority-Analysis: v=2.4 cv=XKEwSRhE c=1 sm=1 tr=0 ts=682c2598 cx=c_pps
 a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=COk6AnOGAAAA:8
 a=uAc4Gv8VY3djhvJMLTUA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: kJCKIAIyyW83v5VBxioFhTURYeSrPkEN
X-Proofpoint-GUID: kJCKIAIyyW83v5VBxioFhTURYeSrPkEN
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTIwMDA1NCBTYWx0ZWRfX91fsj2tlCpF5
 y2eGB4xiv4SdqiS7nH01b66baNepR/A5RS8t3jNnbpo3zmQUL1sfNxWhq53wrbrFG40lghNGCKT
 iYT3pqmdBKqVD382THLBcIzod0in8snZzL50tUPytPevLubwZe/Uo8dFBsz+xNTVeultNLo7fSU
 9ECRoGD5BVqUiXvOV+zkMWRQiISeXPXtezhyw2vyz4e2qR27z2NCofFObTZL3qKBRJLkbpbI6Um
 YxG5Is+4SS9M4Rs6UwI8014y6HsrZ7mRGHjZEgwgTg5lIxlGhn7TqSS8epXBZshV+xQh10bocOY
 ULkcJBQ0q1t61Qa49ZX6UnwQn8xCtub22C/O6dIQy2LbuYmQFbVrcMpKNPxcdhCO+WoNlsrCfQB
 StXP/2DLvJzFW5VdvWb5U7VKH2u8hBQ+PjXMR9l0pGY/lOTUifBCR2kz/uRzZZ4aORqgOA9U
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-20_03,2025-05-16_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 priorityscore=1501 impostorscore=0 clxscore=1015
 spamscore=0 suspectscore=0 malwarescore=0 adultscore=0 mlxscore=0
 mlxlogscore=736 phishscore=0 bulkscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505070000 definitions=main-2505200054

在 5/17/2025 5:48 AM, Dmitry Baryshkov 写道:
> On Fri, May 16, 2025 at 04:30:29PM +0530, Ling Xu wrote:
>> Add dma-cherent property to fastrpc context bank nodes to ensure that
>> the DMA operations for these nodes are coherent.
> 
> Does it apply to all firmware versions?

No, it's not applicable for all the firmwares, especifically for older one.
This is only applicable where IO coherency is enabled.
>>
>> Signed-off-by: Ling Xu <quic_lxu5@quicinc.com>
>> ---
>>  arch/arm64/boot/dts/qcom/sc7280.dtsi | 15 +++++++++++++++
>>  1 file changed, 15 insertions(+)
>>
> 

-- 
Thx and BRs,
Ling Xu


