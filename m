Return-Path: <linux-arm-msm+bounces-67114-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id E8143B15E33
	for <lists+linux-arm-msm@lfdr.de>; Wed, 30 Jul 2025 12:31:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 09B7C3BE763
	for <lists+linux-arm-msm@lfdr.de>; Wed, 30 Jul 2025 10:30:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BC87726F462;
	Wed, 30 Jul 2025 10:31:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="ZDAqZU7W"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E85F7E0E4;
	Wed, 30 Jul 2025 10:31:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753871469; cv=none; b=tHHVcbSHdBiBZAUyHVsv9PYM37FetZYoz8uPBH8PRhI0UfyGxYn7KFCr8O7Y2qJz0PrszpLOZ52zX0j1bEqiDZfSVGg3rhPqQYS5qQH6FFPAnFZlNsGnvanN3l9UNQeFRj938jzVsfLJhoizcFt2qVvNOplNMxT9YKkXC4edtfQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753871469; c=relaxed/simple;
	bh=Wj6Wnx2sWzhyx4bQecfvZRebRBN4LRl9qY5cwtiXLBs=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=UoR4hy9Yvxn+pozjh/otMW/H8pedkoKtW4yD+NP9exm+BTSaoXzGIH1tp4+izn5BS7ztlnzw+e70Slk24XJQDtw6d+bO+oBdMnlaJyyhAKW27zJZ4EffGSEMCPzeIslYui+JZIp3MTRwuxNb8L/6sD3ieyNm21zaknQObKqzl7I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=ZDAqZU7W; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56U5bkp6027687;
	Wed, 30 Jul 2025 10:30:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	J4ToOZRboBSrW8N0k/DtdgMfDMbgGeL0feKV1DAO8co=; b=ZDAqZU7WNKkm7tSN
	viyC+OUT4+0FqSjuVy1CzQUu2I395B+QBzR1p/fpjRDlbHjcoGzDr1gpDfq8Caf3
	m7ZzE9m6szZzsHQtwmZBz2fOWiTIYrh3mAeOeHHCi/oTCv224vaBOEkDGA8oFzG5
	xuQSJG2ZojDQazhsKrrlXAFIB0vyFO/PexL/JNrPL8njSCfJEN6xfo2myy8YmPRZ
	Y3GBoS4UPn2PJ4tQ2aTo2AbBqhbFqUBDj8rFiZaTMu7C8DZzq/AO+ntJ4ujcc+SX
	4CsszWAgz+c+toTs+tSiAsL144QaSOUWiMsalSFqNa0B/4WxX0AQuxQ32f5iz1P1
	uAFqQw==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4860ep0qw9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 30 Jul 2025 10:30:57 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 56UAUuX0021581
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 30 Jul 2025 10:30:56 GMT
Received: from [10.218.4.141] (10.80.80.8) by nalasex01b.na.qualcomm.com
 (10.47.209.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.10; Wed, 30 Jul
 2025 03:30:52 -0700
Message-ID: <6580fe88-721a-4d78-baef-514de681d072@quicinc.com>
Date: Wed, 30 Jul 2025 16:00:49 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V1 2/3] arm64: dts: qcom: sm8650: Enable MCQ support for
 UFS controller
To: Krzysztof Kozlowski <krzk@kernel.org>, <mani@kernel.org>,
        <alim.akhtar@samsung.com>, <avri.altman@wdc.com>, <bvanassche@acm.org>,
        <robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
        <andersson@kernel.org>, <konradybcio@kernel.org>, <agross@kernel.org>
CC: <linux-arm-msm@vger.kernel.org>, <linux-scsi@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
References: <20250730082229.23475-1-quic_rdwivedi@quicinc.com>
 <20250730082229.23475-3-quic_rdwivedi@quicinc.com>
 <4f52b237-7380-46f3-9a26-bf3c11274523@kernel.org>
Content-Language: en-US
From: Ram Kumar Dwivedi <quic_rdwivedi@quicinc.com>
In-Reply-To: <4f52b237-7380-46f3-9a26-bf3c11274523@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: Mpx3EiDzVgQqSBJcA6Zjxb0IsqdyQszk
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzMwMDA3MiBTYWx0ZWRfX/H8pvYu3qWdz
 S1kRKFbTRcRYDsdxhy6x0Tl9OfPno+RYA9gLZ9HwTWrei6viW3ZtpNxx47Ca6F/N2ZU4zHZMpm/
 l101ku7NJ/EhBiCYqoE26Y7Uj7agbz79jLz9Yc3nz6o56Fl1bp7c0ffnN51YXp9qVgby2X8u7Q+
 A0eZQpw0OEFlRsbyomuvdllCIyPyuP//EZi+6P+yYDtzDkhRZ7XLCXAUxxNdcTlxgl5CrjGQMS3
 hnhGeChIGKsEzaAgEaupSGfOyOK/jABhO/W+UmTvNzCnADOyYgW75H8QnFfLC+boMz3Eorx4gzl
 4VxvKLe6b9FN3mhCPIcNNStFDMoATgiGdG6xvyVc6+irc/QM5eVuM7xoax1OuBBmpZfDYPstsXA
 gj3iaTzOmDdlDA97nEdn8oFgBiMaaGyWbiSpPavmqQH7oln7BE9y4pzItDXMSJIoxbQRbVSz
X-Authority-Analysis: v=2.4 cv=DIWP4zNb c=1 sm=1 tr=0 ts=6889f461 cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10
 a=pCQ47apHa_6Vw97M47QA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-ORIG-GUID: Mpx3EiDzVgQqSBJcA6Zjxb0IsqdyQszk
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-30_04,2025-07-30_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 bulkscore=0 mlxscore=0 mlxlogscore=999
 spamscore=0 impostorscore=0 suspectscore=0 malwarescore=0 priorityscore=1501
 adultscore=0 phishscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507300072



On 30-Jul-25 2:42 PM, Krzysztof Kozlowski wrote:
> On 30/07/2025 10:22, Ram Kumar Dwivedi wrote:
>> Enable Multi-Circular Queue (MCQ) support for the UFS host controller
>> on the Qualcomm SM8650 platform by updating the device tree node. This
>> includes adding new register regions and specifying the MSI parent
>> required for MCQ operation.
>>
>> MCQ is a modern queuing model for UFS that improves performance and
>> scalability by allowing multiple hardware queues. 
>>
>> Changes:
>> - Add reg entries for mcq_sqd and mcq_vs regions.
>> - Define reg-names for the new regions.
>> - Specify msi-parent for interrupt routing.
> 
> 
> We see that from the diff. Drop redundant description, your first
> paragraph already said this.
> 
> Best regards,
> Krzysztof


Hi Krzysztof,

I will update it in the next patchset.

Thanks,
Ram.

