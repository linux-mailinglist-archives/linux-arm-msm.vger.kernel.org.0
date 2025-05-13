Return-Path: <linux-arm-msm+bounces-57654-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A387AB48E8
	for <lists+linux-arm-msm@lfdr.de>; Tue, 13 May 2025 03:44:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DEF4619E7B5D
	for <lists+linux-arm-msm@lfdr.de>; Tue, 13 May 2025 01:44:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0834618DB1D;
	Tue, 13 May 2025 01:44:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="ff8j3LIJ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C0DC2914;
	Tue, 13 May 2025 01:44:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747100657; cv=none; b=gkx8JXXK19PhHmP3Cp3WGgXBblAYGrEOW0nS3ZIdGq6NTUZ/3T7y1F5wLhDi+Ssc467AzXsnuwn5xj8MMF9RWPPsV6Vt6g2uWZN8SRwC+OMaBbGWIoOBe66llFTavFemVNNYIOdIez5cIof02/s3WfS10eQYkkPaZwyrsdDKm5Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747100657; c=relaxed/simple;
	bh=9JGhPdUpXl8ADAyMohofxH2KtUhEsDCGN0mxnH3hrPE=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=SstRdwX2xfz8cAJO5+VqdjSe0pWPrczGqdrfUpLSLnLrwSFBv8WJ8W+nAImXRkkFW36RMfRor+qKKiKGyxFUzlN1KqY4c8YKs9XCvj4a0TcooHRu+kFh36l2XCHmCJlCEGsx6W4cwlZqJP8TIEgGshR1yjyodLWn/qpopY1Ap0M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=ff8j3LIJ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54CIWSut023824;
	Tue, 13 May 2025 01:44:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	7tc48vhKzQImoMCcMcIFiq/P4xq1XXIMH3wo3nqsKb0=; b=ff8j3LIJGufORR0D
	TntLRo6218NIgkpIlWXiNq3h21Cmg27W2cehkNl7RrPuNdB5fzbwrpY+VGkMI2WC
	r8O5a22UwFpzb5jyMCXhTdjHCCHwOgHtBP5f31LMVXocViRIdJNfbVnnSJhyJ+VJ
	iQ7wmsR7uFkkvXwM7XXzTh2cTRsONAnN64RO0Q/65qlE83R3tAl31pSRR+vRhU4Z
	obi+qDgG3TKEgeb6YL2xwiBUzBI+6/RK1Bs9SsAXztSia4yt0KaJAhwDAvvZvcQh
	ZMYTEZtuWsJgvP0us5GjLAbP09PqEbCkjqDn4B8ATmR3fHBDuaKSbDkAAw/8JyWA
	vV31wQ==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46hx4k63e4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 13 May 2025 01:44:02 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 54D1i1IO018306
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 13 May 2025 01:44:01 GMT
Received: from [10.231.195.67] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 12 May
 2025 18:43:59 -0700
Message-ID: <5a90a869-8bc6-4fc5-a02a-58579f24dac5@quicinc.com>
Date: Tue, 13 May 2025 09:43:56 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] bus: mhi: host: Allocate entire MHI control config
 once
To: Jeff Hugo <jeff.hugo@oss.qualcomm.com>, <quic_carlv@quicinc.com>,
        <quic_thanson@quicinc.com>, <manivannan.sadhasivam@linaro.org>
CC: <mhi@lists.linux.dev>, <linux-arm-msm@vger.kernel.org>,
        <ath11k@lists.infradead.org>, <jjohnson@kernel.org>,
        "Pranjal Ramajor Asha
 Kanojiya" <quic_pkanojiy@quicinc.com>
References: <20250425170431.921656-1-jeff.hugo@oss.qualcomm.com>
 <1f2a8c11-214b-43c6-8b3a-9e44094f949a@quicinc.com>
 <d97c900d-c899-4f2c-821b-53991ecfd86e@oss.qualcomm.com>
Content-Language: en-US
From: Baochen Qiang <quic_bqiang@quicinc.com>
In-Reply-To: <d97c900d-c899-4f2c-821b-53991ecfd86e@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Authority-Analysis: v=2.4 cv=ReqQC0tv c=1 sm=1 tr=0 ts=6822a3e2 cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=COk6AnOGAAAA:8
 a=oPY1zYEqk9kjLPOFep0A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: MfYiPvMrt1pA17fcZMssjIlEPsYemLt5
X-Proofpoint-ORIG-GUID: MfYiPvMrt1pA17fcZMssjIlEPsYemLt5
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTEzMDAxNCBTYWx0ZWRfX6VzH1Qcr4Ju4
 z9bqvHZ+eQN6rvDilkxGGEWxLpNWOXQ0/EQiLyLv1cbTOEVIr2MG+K88Nm3StdOI7yy95PPblMN
 nIByGRKvQRpUFPkGr/9wZhYqylX8cfJMGFYUpmnmAhyfMPzCDvFTeHPGtns6Ibn30tMpcMqYicE
 ifvX2+mgLQBWiXIUpoTPVtqGlCe8RvKyhMDury2Grudmn7nfLNWirDx7C3Se1gMu/kT9gAxARJ9
 fQlTrKGZzQWjTPdbLXqgd4n/YTrzv5g9L/RAo5ck000DEA5svFlU3hb+Z1KcDGEvIpgnrB6yRp+
 YHw82kAC6xvQRAphuGM3rCFme595UvkYg1PJdQcy6NQeMRMHt7YFptXXZij2gQ0aT/YpzTfFP7w
 2kJOnhjZfBBRkUXbI7fxhm8MueeU+Tmp5Pb9VOQSqOzusosPSjUIEfSV6BdaR0/yUYPYWzDi
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-12_07,2025-05-09_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 mlxscore=0 mlxlogscore=999 phishscore=0 suspectscore=0
 spamscore=0 priorityscore=1501 impostorscore=0 bulkscore=0 clxscore=1015
 adultscore=0 malwarescore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2505130014



On 5/13/2025 2:31 AM, Jeff Hugo wrote:
> On 4/27/2025 7:57 PM, Baochen Qiang wrote:
>>
>>
>> On 4/26/2025 1:04 AM, Jeff Hugo wrote:
>>> From: Pranjal Ramajor Asha Kanojiya <quic_pkanojiy@quicinc.com>
>>>   int mhi_init_mmio(struct mhi_controller *mhi_cntrl)
>>> @@ -475,6 +497,7 @@ int mhi_init_mmio(struct mhi_controller *mhi_cntrl)
>>>       struct mhi_event *mhi_event;
>>>       void __iomem *base = mhi_cntrl->regs;
>>>       struct device *dev = &mhi_cntrl->mhi_dev->dev;
>>> +    dma_addr_t mhi_ctrl_limit = mhi_cntrl->ctrl_config_dma + mhi_cntrl-
>>> >ctrl_config_size - 1;
>>
>> but the range [ctrl_config_dma, mhi_ctrl_limit] could still be possbile to cross the 4GB
>> boundary, no?
> 
> Its possible, yes.  From a practical standpoint, that seems to be unlikely as the control
> area is not terribly large on supported platforms.

although unlikely, we need to handle it, right?

IMO a possible solution is that you allocate (2 * ctrl_config_size  - 1) bytes and take
either the former half or the latter half, depending on which one does not cross the boundary.


