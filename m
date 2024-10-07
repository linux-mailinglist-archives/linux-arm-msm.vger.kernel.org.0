Return-Path: <linux-arm-msm+bounces-33325-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 44896992540
	for <lists+linux-arm-msm@lfdr.de>; Mon,  7 Oct 2024 09:00:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E22941F228C6
	for <lists+linux-arm-msm@lfdr.de>; Mon,  7 Oct 2024 07:00:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C21A416132A;
	Mon,  7 Oct 2024 07:00:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="pxe17ntV"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43535165EE6;
	Mon,  7 Oct 2024 07:00:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728284431; cv=none; b=ULJnXc8PvHfrLHiNWKFsFaVLSecZvjgMVHtNOwGnJ2KxkKzTYv9yzzfQ/pTsyq6a0Di+zuQdWV//HwNEqJOPt7S918yjestYkpeLRWX+yrkdh61EiiO5gbd53n532CYTX04d+XE7J85JcLnecJBCKtETW6lx6RjzDgTx0UDUst4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728284431; c=relaxed/simple;
	bh=yDgTqPlwj1aRQAu2Ausc7DMOcMAhUVxmyAer1SiD+Js=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=n8yJFHgqD81bWVaJh5A11Va+F11sfUqYR7sMU/urOc4P3FyQnR5Gc5kSE33T4aezRTaTqqUvuZmnABpjW9DH/e9EbWujlbbUlvKkSf0TU+FcqQJsYYvGmW0QvVm3y/oeMkjofGbZ52+XNL6zvHCWreDm2pKT6xcJm1zbZeIwzco=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=pxe17ntV; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4974SpaV019025;
	Mon, 7 Oct 2024 07:00:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	eRgKxSHvK/yyRGDKHCmlGu4mzr05SryI6lGl/+T31uA=; b=pxe17ntVqaO0IOqr
	Ee8/rve15dm8Rs7kOXmrsX6rhAm8zKu3m6YmgpSm+BEIx92Ulb1lH4PkFHFUzhIw
	BKLMaF0XzdiIgclBpFVnBKl1JNELq7MTjoKjZw6nh0tnq+DQrPz8ahqlhOh50LIG
	NJl/GidCYXXgfQxm4zXaxUNjBXtviHsLtnUQIUrDIe0pLpzgSl5li4mK3tBFssYs
	sprsX0M/BIP7NAr6mVw+wYn6Qq3rTdN8SZOAHgw5a2QlS+mdArbDeePVrJuLKbYk
	zirx+vSezNmAxGuOeMa3rItLxLIS3AVX+DkiNWTD7xPKMGU2FXvu46+8aMLWLzeh
	2LCtaQ==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 422xsn39kr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 07 Oct 2024 07:00:21 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 49770Kcc010435
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 7 Oct 2024 07:00:20 GMT
Received: from [10.131.33.37] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 7 Oct 2024
 00:00:17 -0700
Message-ID: <53d929a2-2f54-ac97-3184-861442e8622b@quicinc.com>
Date: Mon, 7 Oct 2024 12:30:14 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH V2 2/2] firmware: arm_scmi: Skip adding bad duplicates
Content-Language: en-US
To: Cristian Marussi <cristian.marussi@arm.com>
CC: <sudeep.holla@arm.com>, <linux-kernel@vger.kernel.org>,
        <arm-scmi@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        <linux-arm-msm@vger.kernel.org>, <johan@kernel.org>,
        <konradybcio@kernel.org>
References: <20240904031324.2901114-1-quic_sibis@quicinc.com>
 <20240904031324.2901114-3-quic_sibis@quicinc.com> <Zth7DZmkpOieSZEr@pluto>
 <Zth9EMydkwvJ30T0@pluto>
From: Sibi Sankar <quic_sibis@quicinc.com>
In-Reply-To: <Zth9EMydkwvJ30T0@pluto>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: _Su-IhBRgV_JaukqNuiQ6df87WN_pWta
X-Proofpoint-GUID: _Su-IhBRgV_JaukqNuiQ6df87WN_pWta
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 mlxlogscore=844
 malwarescore=0 spamscore=0 impostorscore=0 suspectscore=0
 lowpriorityscore=0 bulkscore=0 adultscore=0 clxscore=1015
 priorityscore=1501 phishscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2409260000 definitions=main-2410070048



On 9/4/24 21:00, Cristian Marussi wrote:
> On Wed, Sep 04, 2024 at 04:21:49PM +0100, Cristian Marussi wrote:
>> On Wed, Sep 04, 2024 at 08:43:24AM +0530, Sibi Sankar wrote:
>>> Ensure that the bad duplicates reported by the platform firmware doesn't
>>> get added to the opp-tables.
>>>
>>
>> Hi Sibi,
>>
>> so if the idea is to make the code more robust when FW sends BAD
>> duplicates, you necessarily need to properly drop opps in opp_count too.
>>
>> One other option would be to just loop with xa_for_each BUT opp_count is
>> used in a number of places...so first of all let's try drop count properly.
>>
>> Can you try this patch down below, instead of your patch.
>> If it solves, I will send a patch (after testing it a bit more :D)
> 
> Hold on... I sent you a diff that does not apply probably on your tree due
> to some uncomitted local work of mine...my bad...let me resend.

Hey Cristian,
Thanks for taking time to send out the diff. I thought this would be
enough but there will still be a disconnect between opp_count and idx
of the opp we populate. Consider a case were we get to have a valid
opp just after duplicate opp. The opp_count will still limit us on what
levels we are allowed to see.

-Sibi

> 
> Thanks,
> Cristian

