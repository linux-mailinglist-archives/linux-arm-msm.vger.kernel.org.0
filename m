Return-Path: <linux-arm-msm+bounces-45212-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 45835A13417
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 Jan 2025 08:44:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 881157A1EDC
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 Jan 2025 07:44:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 83DAA158520;
	Thu, 16 Jan 2025 07:44:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="jPuZIjHj"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E605E33DB;
	Thu, 16 Jan 2025 07:44:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737013472; cv=none; b=d48L2EIGEnwXbYVHYHZrujffhB+E8xz+lhtIaoLc4dUT5iXDhuDTYGyjhK8IW/elM4Vje50eZoLeDQINLM0ThA4Tkvc5We0M9FG4fA34CJ7MAwcbkqFc1J9QoY4mcTw4OaQ8jGkLLM8ZxyFsT8POjGLynnWh/mW4gfgg+RV1yKQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737013472; c=relaxed/simple;
	bh=u0pEFk5ZbdQv2p4GnQGAJ73STlfusScOVsi4lPw2DGc=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=Z9gDyPXBJ8Cu+fPnDLKIdso0/5v713Ms8P24QrjRnHr/au4bditIqpPwTSq7zf2B58dF48//BaPQwa7fheaj1nhkF2npweIDF6wKYApnlmZaKTex77Tj9UPivU+RWGg0ZiMV4//9cCbzhB8cMAwfhit0Brz9WcOAwclManGbFJE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=jPuZIjHj; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50G2ub1g027694;
	Thu, 16 Jan 2025 07:44:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	SPQSBpTezuTC6GNyTafDqCjSZQOrr8oGrbGpFC8wW7g=; b=jPuZIjHjLoxiqao5
	HvOebr/pvX61PflQK0B0bEqI86fJHt4bYqAqaOGBupPhDaMuFHexAO92GmB3oFKu
	ptQ908t3ITrtHufXdAPxGNpxsHAnz74466STPDBX2PMGlSgrPRQIVpgfOPwBmgm5
	dzEOWKTresfClvN+Cw97l3E9Str2IN/+8iRAHxm1jrntodFmKwXrpiBOi+0ukZBz
	zZBWzMjk4jQxrLRn4SOlhAAsq3fJJuSNOzxb6GUd/g3G2JDFqR55ZVIpYK3QD7js
	OKvdr1d6hgt34NYWW2/CjjyDss2nLHdxTo3I4KZxKu0weobMtZCzU035IUqHGelg
	JEDauA==
Received: from nasanppmta04.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 446ss88kxq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 16 Jan 2025 07:44:25 +0000 (GMT)
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com [10.45.79.139])
	by NASANPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 50G7iO4M030992
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 16 Jan 2025 07:44:24 GMT
Received: from [10.231.207.28] (10.80.80.8) by nasanex01c.na.qualcomm.com
 (10.45.79.139) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 15 Jan
 2025 23:44:19 -0800
Message-ID: <4e11416f-8099-45e5-aa1d-881c4d383211@quicinc.com>
Date: Thu, 16 Jan 2025 15:44:17 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: sa8775p: pmic: enable rtc
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
CC: <andersson@kernel.org>, <konradybcio@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <kernel@quicinc.com>,
        <quic_kotarake@quicinc.com>, <quic_kamalw@quicinc.com>,
        <quic_skakitap@quicinc.com>, <quic_fenglinw@quicinc.com>
References: <20240902104302.3959670-1-quic_tingguoc@quicinc.com>
 <4gwmrfnzqqlawgkgjd4fj3t4nkpulnxuzsc756v6uxz4dlq6mm@dhv2aqkdx7du>
Content-Language: en-US
From: Tingguo Cheng <quic_tingguoc@quicinc.com>
In-Reply-To: <4gwmrfnzqqlawgkgjd4fj3t4nkpulnxuzsc756v6uxz4dlq6mm@dhv2aqkdx7du>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01c.na.qualcomm.com (10.45.79.139)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: s14hZK-egUrg2a7SHJD6Rjf49JJ1W60P
X-Proofpoint-ORIG-GUID: s14hZK-egUrg2a7SHJD6Rjf49JJ1W60P
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-16_03,2025-01-15_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015
 priorityscore=1501 lowpriorityscore=0 spamscore=0 impostorscore=0
 mlxlogscore=605 bulkscore=0 malwarescore=0 mlxscore=0 suspectscore=0
 adultscore=0 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2501160055



On 11/22/2024 7:00 PM, Dmitry Baryshkov wrote:
> On Mon, Sep 02, 2024 at 06:43:02PM +0800, Tingguo Cheng wrote:
>> Add RTC node, the RTC is controlled by PMIC device via spmi bus.
>>
>> Signed-off-by: Tingguo Cheng <quic_tingguoc@quicinc.com>
>> ---
>>   arch/arm64/boot/dts/qcom/sa8775p-pmics.dtsi | 8 ++++++++
>>   1 file changed, 8 insertions(+)
>>
> 
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> 
Could you please help apply this patch?

-- 
Thank you & BRs
Tingguo


