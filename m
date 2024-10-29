Return-Path: <linux-arm-msm+bounces-36279-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 353AE9B47F3
	for <lists+linux-arm-msm@lfdr.de>; Tue, 29 Oct 2024 12:10:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DE5061F229DE
	for <lists+linux-arm-msm@lfdr.de>; Tue, 29 Oct 2024 11:10:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 801CA205E08;
	Tue, 29 Oct 2024 11:09:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="EaRolYrv"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 822F0205ACD;
	Tue, 29 Oct 2024 11:09:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730200152; cv=none; b=N764wX37mC47AuAVduReDOhXKmHTFodtevUzNbAt2KhtTwTXkY3b6f9htRH0UbyMepthkdxar1icAHrlep0Z6J7W5m8eouPIqstTrsQmio/XSF+4J1BcGHCGOPEUFYKKdSNdlljo1NIyc5dIOYwT1k0Cs5Tc5HneKY6ZE+HQPTE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730200152; c=relaxed/simple;
	bh=s0K5hE7SxRAb9GHUk5pDK14tF2iideIiRhKh53BBI0w=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=CEorFyPbDn91UqHcLi7OjgSjCJxOZkd3QY0Edk9A+eKtnjikxE52XaRv+PU78OuD43wZ/+i3Uc13C1pFH0VClZi7MwmdbFPcWpI1pnMNqdHvNfdhYNrss/EMedkZkYavAe0OkgfcjU3eIwtxr54oL5f2Bk2CPPocJcxVAdxfU8U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=EaRolYrv; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49T9k880007398;
	Tue, 29 Oct 2024 11:08:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	iJ3KTqYgpRAxzefUb7QTMrXyaz7ouGNSfEfdE26w/cg=; b=EaRolYrvS8yFS9gn
	cejKA3LWW41UDZOtcfsInz+My3OrnmBHQD2JI0l7Y0cxd71Y/ZdIbdu1U0TgsNG0
	I2haaRMDaWH08uZo4d6WYvCIhLAlfT+Nv6BtkTYJhWtWUGWhr+wJsfcYQ+sug09c
	kg1OlJrWidQp3cA3kR7Xz4KfL8G5khjN1XeLW1OkJVLedHKDavTDdCejodpRDhxI
	K/jaOaN+pWXbbqFjwiT/5oygPHZcv2owSQ1Jj/eAwm1Ne9KyT9Rk7LajrVSm4i6H
	huCcHsdsNsxmFziMvOJ8N+OrbAnfjksXREs67o/0ZASLLmwZQEbB+1SN9wdG00xq
	WsuIQA==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42gnsmrd6b-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 29 Oct 2024 11:08:48 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 49TB8loL032097
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 29 Oct 2024 11:08:47 GMT
Received: from [10.216.3.156] (10.80.80.8) by nalasex01b.na.qualcomm.com
 (10.47.209.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 29 Oct
 2024 04:08:40 -0700
Message-ID: <e57c93de-aa24-4b9a-a7fa-794ad8467915@quicinc.com>
Date: Tue, 29 Oct 2024 16:38:37 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V1 1/3] dt-bindings: ufs: qcom: Document ice configuration
 table
To: Eric Biggers <ebiggers@kernel.org>
CC: <manivannan.sadhasivam@linaro.org>, <alim.akhtar@samsung.com>,
        <avri.altman@wdc.com>, <bvanassche@acm.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>, <andersson@kernel.org>,
        <konrad.dybcio@linaro.org>, <James.Bottomley@hansenpartnership.com>,
        <martin.petersen@oracle.com>, <agross@kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <linux-scsi@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <quic_narepall@quicinc.com>, <quic_nitirawa@quicinc.com>
References: <20241005064307.18972-1-quic_rdwivedi@quicinc.com>
 <20241005064307.18972-2-quic_rdwivedi@quicinc.com>
 <20241005191555.GA10813@sol.localdomain>
Content-Language: en-US
From: Ram Kumar Dwivedi <quic_rdwivedi@quicinc.com>
In-Reply-To: <20241005191555.GA10813@sol.localdomain>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: SAMTR7UipQB9hsUWj1hyBMEol0-nrwfl
X-Proofpoint-GUID: SAMTR7UipQB9hsUWj1hyBMEol0-nrwfl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 suspectscore=0
 malwarescore=0 lowpriorityscore=0 impostorscore=0 clxscore=1011
 adultscore=0 priorityscore=1501 bulkscore=0 phishscore=0 spamscore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2410290086



On 06-Oct-24 12:45 AM, Eric Biggers wrote:
> On Sat, Oct 05, 2024 at 12:13:05PM +0530, Ram Kumar Dwivedi wrote:
>> There are three algorithms supported for inline crypto engine:
>> Floor based, Static and Instantaneous algorithm.
> 
> No.  The algorithms supported by ICE are AES-XTS, AES-ECB, AES-CBC, etc.  So I'm
> afraid this terminology is already taken.
> 
> This new thing seems to be about how work is distributed among different
> hardware cores, so calling these "ICE schedulers" or something might make sense.
> 
> - Eric

Hi Eric,
	I have rephrased patch commit description. Used terminology as ICE allocator instead of ICE algorithm.
Thanks,
Ram.

