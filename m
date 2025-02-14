Return-Path: <linux-arm-msm+bounces-48062-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CF98A364E0
	for <lists+linux-arm-msm@lfdr.de>; Fri, 14 Feb 2025 18:42:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DE937172234
	for <lists+linux-arm-msm@lfdr.de>; Fri, 14 Feb 2025 17:41:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 967422686A8;
	Fri, 14 Feb 2025 17:41:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="Pv+deL1i"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C389B264A80;
	Fri, 14 Feb 2025 17:41:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739554913; cv=none; b=kjbKJ6+YDX8ju6VgrujzxLLXZuJKpLsGwf8WmDLDv7WxqmL+AtJBKtcriM2d0gYGl0/MMwuQxUOu4TXCYub2sKOB8frj6ryke9jV4t36MexsgfZZY0PfFmpkAW3ENCscRfPwsD0Mgg2gfmH6VkxzbUYjlv0UO9HE7YXSbkGRWvs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739554913; c=relaxed/simple;
	bh=PyCF8acZykkGWijBMum6n4OttI25s1n/XS/r9fl0np0=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=BW5X3kW5sQjsbW96T3WD/ZRyIxzua6wcF8TNUSZW7SAolB+qTdJBrCyt/aQ269OcREBD9T33urp87/TElP9h0Tz/0ZHrbJagGMsJ1L5HzYJvQP1JdRg2pp/dhTRFRfYZZ8MnMNrrK1ZlK/TURxGVJ6p7bdYkhcIZgTTAhxGtLw8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=Pv+deL1i; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51E9JNUP032747;
	Fri, 14 Feb 2025 17:41:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	hZSLNz22LKvLiQ/OADVV5inCh0xMUwKjcIOfDJ08xJE=; b=Pv+deL1iwy3DDyD+
	mBTx2edjVYd3sYK/5qlqYAugqt/xCbq+0iwxmwLrHPBLfsrOadlsmyJDEto0l/pV
	Ncy4l4gG2QqVMJ9qof+NvSEJHNuppRV1waMf1cGwkrTsYhOFpx3pYKvVmbaegorr
	/K5V1yMGzQk1wtrsH2hvqqwu7uGLTKRyBjj5H/xsBOJwS86DavVKs3RQPdtnFI+V
	odReU7ERqrl0xoHjv4wuJmsYYETjBQ2+EOa8ic4xqPVRMI+nXBBaWy+eg4LvjdIC
	Kj9bLl9HOQ6YClQWDXGnFuuX5Cvb7qjjW0CfxrX/ZNPPBILXI/MoljXJE858T+tW
	3tHbEw==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44seq049wv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 14 Feb 2025 17:41:43 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 51EHfgdJ024816
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 14 Feb 2025 17:41:42 GMT
Received: from [10.226.59.182] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Fri, 14 Feb
 2025 09:41:41 -0800
Message-ID: <c45d8a41-72a9-3685-384b-bd8c2c2766f7@quicinc.com>
Date: Fri, 14 Feb 2025 10:41:41 -0700
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.0
Subject: Re: [PATCH] bus: mhi: host: Avoid possible uninitialized fw_load_type
Content-Language: en-US
To: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
CC: <quic_carlv@quicinc.com>, <quic_yabdulra@quicinc.com>,
        <quic_mattleun@quicinc.com>, <quic_thanson@quicinc.com>,
        <dan.carpenter@linaro.org>, <ogabbay@kernel.org>, <lizhi.hou@amd.com>,
        <jacek.lawrynowicz@linux.intel.com>, <linux-arm-msm@vger.kernel.org>,
        <mhi@lists.linux.dev>, <dri-devel@lists.freedesktop.org>
References: <20250214162109.3555300-1-quic_jhugo@quicinc.com>
 <20250214173416.b6y7o6tqsnkuzkbh@thinkpad>
From: Jeffrey Hugo <quic_jhugo@quicinc.com>
In-Reply-To: <20250214173416.b6y7o6tqsnkuzkbh@thinkpad>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: FA-E0WTdUlx1y-qstC6TxP-VMKNHdPVx
X-Proofpoint-ORIG-GUID: FA-E0WTdUlx1y-qstC6TxP-VMKNHdPVx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-14_07,2025-02-13_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0
 impostorscore=0 bulkscore=0 clxscore=1015 priorityscore=1501 adultscore=0
 mlxscore=0 malwarescore=0 phishscore=0 spamscore=0 lowpriorityscore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2501170000 definitions=main-2502140122

On 2/14/2025 10:34 AM, Manivannan Sadhasivam wrote:
> On Fri, Feb 14, 2025 at 09:21:09AM -0700, Jeffrey Hugo wrote:
>> If mhi_fw_load_handler() bails out early because the EE is not capable
>> of loading firmware, we may reference fw_load_type in cleanup which is
>> uninitialized at this point. The cleanup code checks fw_load_type as a
>> proxy for knowing if fbc_image was allocated and needs to be freed, but
>> we can directly test for that. This avoids the possible uninitialized
>> access and appears to be clearer code.
>>
>> Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
>> Closes: https://lore.kernel.org/all/e3148ac4-7bb8-422d-ae0f-18a8eb15e269@stanley.mountain/
>> Fixes: f88f1d0998ea ("bus: mhi: host: Add a policy to enable image transfer via BHIe in PBL")
> 
> The best thing would be to squash this fix into the offending commit as the
> fixes tag would become meaningless once merged upstream.

I see your point, however the offending commit is already part of a pull 
request. I think we've missed the window for squashing.

Thank you for the very quick review.

-Jeff

