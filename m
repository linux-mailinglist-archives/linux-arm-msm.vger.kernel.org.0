Return-Path: <linux-arm-msm+bounces-28370-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 075DB95046D
	for <lists+linux-arm-msm@lfdr.de>; Tue, 13 Aug 2024 14:07:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B9F2C28832C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 13 Aug 2024 12:07:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9AB2D1990A2;
	Tue, 13 Aug 2024 12:07:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="O68Hqbk9"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 039552262B;
	Tue, 13 Aug 2024 12:07:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723550823; cv=none; b=dosWMhYhV16HYbIB+dnsioVwGQGpiBc5rQq+z1W5SkQeen7VWyCuJLDzd5L74esG3z7/WSnIEfnzjb4yI3HeoGnvjsr82jx2UnvmGT493ZOUNI9BcjwdXfhbJ4ziEl2i8OpWLi1WEQvOal4s0Il9ss22rQQk4DzxeJe9Nq8rQDw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723550823; c=relaxed/simple;
	bh=HFXqsgfkGh2i63MLKdDhs7xSwlr9jFR8Gx45hNBwkXQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=JX2Zap4a791sEGpABZrnN5xzntzqHeQgD2Kbu9IV+aEonY3UWdAFVow2yQ6TOATb0I678rzhfqGnHYcTf8XoGmswWlL6t6Phi6Tn2CS+xqZSqrsUngAyyLslLNDsbDSvDC4Y4XiwxxcVN/0E/gabSL2MZLfpOuVAixW/PLhZscQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=O68Hqbk9; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 47D5LCVZ005635;
	Tue, 13 Aug 2024 12:06:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	CYyOx8obdom0b/vBXVrrjfaT8/6mGblM1Ij0bv6hbto=; b=O68Hqbk9SozddwHJ
	rC/5lEfiebZKRjP6HZBZBMW7jQloSqnD8yA5xuEzqpMG0GE14QBtP10cwWgsRzSM
	nC4tMrT6nKo4yM6jG7blceswhnJOLTd1NFoQuXkEPHpyVqD457x7Ws5TMck7ZhBr
	QAAzOhxuqJZ2Z1Qv/YL01EK+4/bjTfiquEZOjIDkilbqJdBgXazLcm/iAWsCw/zA
	i9Dt6bffvZxc089KHBcJsnm1QrPhsuN+z0RM92z3o1x/xIkGp0wMiCx1UL7aB2oy
	ajG3VP3ffQvqV55rrwurDg7thn1djsgEXx3+nJ28otQIpL78jLNAAnTFPfUf4rWA
	fl1txA==
Received: from nasanppmta03.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 40x18xyjbw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 13 Aug 2024 12:06:46 +0000 (GMT)
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 47DC6jtp027343
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 13 Aug 2024 12:06:45 GMT
Received: from [10.133.1.196] (10.80.80.8) by nasanex01a.na.qualcomm.com
 (10.52.223.231) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 13 Aug
 2024 05:06:42 -0700
Message-ID: <3cb1da06-88e3-4dd2-b56c-e0ab725ef6b2@quicinc.com>
Date: Tue, 13 Aug 2024 15:06:23 +0300
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/1] iommu/arm-smmu-qcom: remove runtime pm enabling for
 TBU driver
To: Zhenhua Huang <quic_zhenhuah@quicinc.com>,
        Pranjal Shrivastava
	<praan@google.com>
CC: <robdclark@gmail.com>, <will@kernel.org>, <robin.murphy@arm.com>,
        <joro@8bytes.org>, <iommu@lists.linux.dev>,
        <linux-arm-msm@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        <dmitry.baryshkov@linaro.org>, Georgi Djakov <djakov@kernel.org>
References: <1722335443-30080-1-git-send-email-quic_zhenhuah@quicinc.com>
 <ZroNUGkKuC1L7Qfr@google.com>
 <cca690c3-916e-43b6-b2a5-eca4f2eb838e@quicinc.com>
 <ZrsJLqTnq6tG2xp4@google.com>
 <dee2f394-c9c5-4099-8e05-ce0c8756887b@quicinc.com>
Content-Language: en-US
From: Georgi Djakov <quic_c_gdjako@quicinc.com>
In-Reply-To: <dee2f394-c9c5-4099-8e05-ce0c8756887b@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: 33E62etIps3z33ArWAoTcMfQb0k2iyOH
X-Proofpoint-ORIG-GUID: 33E62etIps3z33ArWAoTcMfQb0k2iyOH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-13_04,2024-08-13_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 mlxlogscore=710
 suspectscore=0 phishscore=0 malwarescore=0 mlxscore=0 spamscore=0
 lowpriorityscore=0 impostorscore=0 clxscore=1011 priorityscore=1501
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2407110000 definitions=main-2408130088

Hi Zhenhua,

On 8/13/2024 10:56 AM, Zhenhua Huang wrote:
> 
> On 2024/8/13 15:20, Pranjal Shrivastava wrote:
>> On Tue, Aug 13, 2024 at 10:37:33AM +0800, Zhenhua Huang wrote:
>>>
>>> On 2024/8/12 21:25, Pranjal Shrivastava wrote:
>>>> On Tue, Jul 30, 2024 at 06:30:43PM +0800, Zhenhua Huang wrote:
>>>>> TBU driver has no runtime pm support now, adding pm_runtime_enable()
>>>>> seems to be useless. Remove it.
>>>>>
>>>>> Signed-off-by: Zhenhua Huang <quic_zhenhuah@quicinc.com>
[..]
>> I agree that there are no pm_runtime_suspend/resume calls within the TBU
>> driver. I'm just trying to understand why was pm_runtime enabled here
>> earlier (since it's not implemented) in order to ensure that removing it
>> doesn't cause further troubles?
> 
> See above my assumption, need Georgi to comment but.

Thank you for looking at the code! Your assumptions are mostly correct,
but if you try this patch on a real sdm845 device you will notice some
issues. So it's actually needed to re-configure the power-domains, three
of which (MMNOC GDSCs) are requiring this because of a HW bug. I should
have put a comment in the code to avoid confusion, but it took me some
time to confirm it.

I have sent a patch to handle this more cleanly:
https://lore.kernel.org/lkml/20240813120015.3242787-1-quic_c_gdjako@quicinc.com

So we should not remove the runtime pm calls until some version of the
above patch gets merged.

Thanks,
Georgi

>> I see Georgi added it as a part of
>> https://lore.kernel.org/all/20240704010759.507798-1-quic_c_gdjako@quicinc.com/
>>
>> But I'm unsure why was it required to fix that bug?
> 
> I'm just thinking it is dead code and want to see if my understanding is correct.



