Return-Path: <linux-arm-msm+bounces-70453-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id B51D4B321C4
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 Aug 2025 19:51:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 827845A377E
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 Aug 2025 17:50:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1D853285CB5;
	Fri, 22 Aug 2025 17:50:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="A2KAcRL3"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D93A20296C;
	Fri, 22 Aug 2025 17:50:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755885018; cv=none; b=sI95UbijGD9H0S49SZFeQHQDllpYKkMVBBGL2d1ILkep1xCKUyChBTj4/hFwzK/DL537pBZl3EbKLnkScsb+ru3u66NIxJnayFUbx9CN4zSqAH+G+wJwiPT5AAbidafOxip0Bp0WXR9zDFGnnTXLubprGO0pqZSxaAJES1sJgA0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755885018; c=relaxed/simple;
	bh=crlFXTtPOCRSODeADxqFBsqvA33SprWic8ysA0jIVTU=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=CNmvupMODMcZLAqj8Nr9xkXE8lw9Ma1CPQXB+XEi1aigU3D6qyCcEuxlZi8Au98Q7BvDi9+MSGAly/9QpNWElSv5oXZuLpDgw1KxfnXay4gIJtR9jr2wg5UiZD4GLMW5tY8N24PseFmeVnNY15tJd8iwKKVVWxHLdzirYDyqun0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=A2KAcRL3; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57MHVBn0027462;
	Fri, 22 Aug 2025 17:50:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	SseLQ8AT+W4NgEjzst/ukb/WLq/b5dpMpdoRkCRc3Lo=; b=A2KAcRL3jXXAntPj
	hPgIvCFgeprGqjCcV3NDn0zBnom9fA1yjqK+8quuXrp9Y6PVtzLa2UExUVn1flAC
	R8AyPXMSvr6QjyfypEZJ0jDuUu1VEXw7YvDzbMrfubaBdVjAnua6ALTT4zjw751Q
	6+sc4+HadjSYyF0M57QOpd3WC6vBNYiO04IOOiYhAucgZnxwC8zyBagPYdeD4yUk
	o7TqF0bEYhgoWhJzdVss/UePDb2+vmlNFuU1yHdaFP287VFEi0pN37aT+13CVAr3
	AQq4QUdO+CXgNJ7UWCUJUivrnXQ6hfKoHWBvCgioIDYgKpErTgqNRX1euZv8QbYR
	2byV4Q==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48pw108203-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 22 Aug 2025 17:50:10 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 57MHo9Gs032106
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 22 Aug 2025 17:50:09 GMT
Received: from [10.216.23.81] (10.80.80.8) by nalasex01b.na.qualcomm.com
 (10.47.209.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.24; Fri, 22 Aug
 2025 10:50:05 -0700
Message-ID: <096260bb-a016-4099-b23c-ae76b0c6d472@quicinc.com>
Date: Fri, 22 Aug 2025 23:19:56 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V3 2/5] ufs: ufs-qcom: Refactor MCQ register dump logic
To: Manivannan Sadhasivam <mani@kernel.org>
CC: <andersson@kernel.org>, <konradybcio@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
        <James.Bottomley@hansenpartnership.com>, <martin.petersen@oracle.com>,
        <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-scsi@vger.kernel.org>
References: <20250821112403.12078-1-quic_rdwivedi@quicinc.com>
 <20250821112403.12078-3-quic_rdwivedi@quicinc.com>
 <3dp7gqh3lflz3y6vj4ya4lv35llmttte7oilsptei2m3yp6efm@h3wncsrgxztv>
Content-Language: en-US
From: Ram Kumar Dwivedi <quic_rdwivedi@quicinc.com>
In-Reply-To: <3dp7gqh3lflz3y6vj4ya4lv35llmttte7oilsptei2m3yp6efm@h3wncsrgxztv>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: AOP4GgLJRocAbqd3m2Tge2pHfn--lJqX
X-Authority-Analysis: v=2.4 cv=Z+fsHGRA c=1 sm=1 tr=0 ts=68a8add2 cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=COk6AnOGAAAA:8
 a=xFLw_cd-ZLVkc5SjNV0A:9 a=QEXdDO2ut3YA:10 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIyMDE2MCBTYWx0ZWRfX3PsZ+VlN9a2d
 8E20PbEKCynzxwU8b0By0W2I0+N1uWTVyb+MR+br9LMI0iwN/+uW6ENKWRnTMRV6LSHYiXmMH0n
 gFZTY1gQIX352KA+5lc+g240ccYaNL/3LHJc0MPLO5OtVZ/OVsVQz+J0PCJXfakZ+6LP3jS2Dnf
 2aqykhoXcinaNFVS4KelxwD+fmWgEFmvlDOCWuGFeOS/R+lHtwzUqcQN7veAvWhWHi3pImIugv9
 CaPorG8a6gLyKKlzuUBpjkETCIygYOdQD+lc0OF+EPolXYCl3k9aJsRqA/vp+Ipy8dcJTbdxxS5
 5da+5dwMJ3Flc3wfAJVViUKZlkObQy68gspc43D6q5LO7VnFt57wqBhcWJFn4YL+6h+2EN5Q0MT
 awJzznua
X-Proofpoint-ORIG-GUID: AOP4GgLJRocAbqd3m2Tge2pHfn--lJqX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-22_04,2025-08-20_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 spamscore=0 priorityscore=1501 bulkscore=0
 adultscore=0 malwarescore=0 phishscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508220160



On 22-Aug-25 2:38 PM, Manivannan Sadhasivam wrote:
> On Thu, Aug 21, 2025 at 04:54:00PM GMT, Ram Kumar Dwivedi wrote:
>> From: Nitin Rawat <quic_nitirawa@quicinc.com>
>>
>> Refactor MCQ register dump to align with the new resource mapping.
>> As part of refactor, below changes are done:
>>
>> - Update ufs_qcom_dump_regs() function signature to accept direct
>>   base address instead of resource ID enum
>> - Modify ufs_qcom_dump_mcq_hci_regs() to use hba->mcq_base and
>>   calculated addresses from MCQ operation info
>> - Replace enum ufshcd_res with direct memory-mapped I/O addresses
>>
>> Signed-off-by: Nitin Rawat <quic_nitirawa@quicinc.com>
> 
> Missing your s-o-b tag. Please spare some time to check these rudimentary rules
> before submitting.
Hi Mani,

sure, I will take care of this going forward.

Thanks,
Ram.

> 
> - Mani
> 


