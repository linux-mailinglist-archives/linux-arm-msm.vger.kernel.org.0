Return-Path: <linux-arm-msm+bounces-21370-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AF0C8D6B2C
	for <lists+linux-arm-msm@lfdr.de>; Fri, 31 May 2024 23:06:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 7E39EB21CDC
	for <lists+linux-arm-msm@lfdr.de>; Fri, 31 May 2024 21:05:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8293A219FD;
	Fri, 31 May 2024 21:05:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="Ya2NF/vA"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95A15200B7;
	Fri, 31 May 2024 21:05:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717189554; cv=none; b=VtI5HfgQdVktPVYTx3O+FDcZoynikCM3+Vsnq/35wQy0OPqq0PZjDkL/XjX8gHMjIDEP0R4vj2ysgVnqlWy0PE9jh/ejFhdp/oRjrmwWIVsUPREFi/YRJ1eAwRp+7VqsxbtKC/4ZhUQzRm6gwP5r9LekrujrOj35HnE4ey/K2iw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717189554; c=relaxed/simple;
	bh=xvQzkBSWipn5BTguZl2ZxrNRJ+QHLeFOQPAwf48u15Q=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=TT0ZnR4MUYviRceoJD5iIgv6yk1Ci50nX9IS7eqpzpJcpkb2Z6201xsbmusbp806VoMqwrTtcAbemIWVhfeqLkymi/U40bX2cwPAJc29E9eARCV6nfFrlmSChK/zj/C4scLEQDrjg0l8mRHg4O51n8UTsGvbeF3iIMwwSmjL9aw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=Ya2NF/vA; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 44VJka2H032204;
	Fri, 31 May 2024 21:05:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Yk7VA+HEcR20gkB/6v5vEyWOz+IIKZizxHjGWlqg/mc=; b=Ya2NF/vAgtLEhDjX
	cY9FbhhnG31R0U6rbXYIV4zBouEELY8aDk0S1tLPZzn9StxnZpoNPvyfLBs7d/jA
	e8WtI2kmni3+fPBGieuNUJrKETzFZMiGbtArrVGvlm0wVAaDqaBZxncB5XssNYSi
	cDqUyXUFIhd6WF87FOD7mSymBV9KDR9IH1ZZSJ3nuYnqaLiC3CMtw3GmH2Us0JGN
	hjIBsnyg4qFAPMBrKUCSQKeLBSCPMYkDxrKEPEI2TcUBsWSOAlKtTpo2lb7gxgyo
	MOkwEo8SA9ZuBfsuKUX8NirBXiGDwqt6YmYEVulWPXDh7ygwd2+m/CPVmmT0YWay
	XoHG2g==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3yba0ggg1k-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 31 May 2024 21:05:36 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 44VL5ZoT008118
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 31 May 2024 21:05:35 GMT
Received: from [10.226.59.182] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Fri, 31 May
 2024 14:05:34 -0700
Message-ID: <f78a5c96-6a4e-f13f-c17a-984ddd8617c5@quicinc.com>
Date: Fri, 31 May 2024 15:05:33 -0600
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.0
Subject: Re: [PATCH] Documentation/accel/qaic: Fix typo 'phsyical'
Content-Language: en-US
To: Shuah Khan <skhan@linuxfoundation.org>,
        Danish Prakash
	<contact@danishpraka.sh>
CC: Carl Vanderlip <quic_carlv@quicinc.com>,
        Pranjal Ramajor Asha Kanojiya
	<quic_pkanojiy@quicinc.com>,
        Oded Gabbay <ogabbay@kernel.org>, "Jonathan
 Corbet" <corbet@lwn.net>,
        "open list:QUALCOMM CLOUD AI (QAIC) DRIVER"
	<linux-arm-msm@vger.kernel.org>,
        "open list:QUALCOMM CLOUD AI (QAIC) DRIVER"
	<dri-devel@lists.freedesktop.org>,
        "open list:DOCUMENTATION"
	<linux-doc@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>
References: <20240531060929.5281-1-contact@danishpraka.sh>
 <16b1bcb5-00c6-4b59-a880-188bed32d175@linuxfoundation.org>
From: Jeffrey Hugo <quic_jhugo@quicinc.com>
In-Reply-To: <16b1bcb5-00c6-4b59-a880-188bed32d175@linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: RTucxBVNOIh-q8QTwaHEvvKuJPmq8RKO
X-Proofpoint-ORIG-GUID: RTucxBVNOIh-q8QTwaHEvvKuJPmq8RKO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.12.28.16
 definitions=2024-05-31_14,2024-05-30_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 suspectscore=0
 priorityscore=1501 bulkscore=0 phishscore=0 adultscore=0 spamscore=0
 mlxlogscore=999 malwarescore=0 lowpriorityscore=0 clxscore=1011
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2405170001 definitions=main-2405310161

On 5/31/2024 8:20 AM, Shuah Khan wrote:
> On 5/31/24 00:09, Danish Prakash wrote:
>> (as part of LFX Linux Mentorship program)
>>
> 
> Please add proper commit log for this change.

Looks like a good fix, and I'd love to take it, but the commit log needs 
some content.

> 
>> Signed-off-by: Danish Prakash <contact@danishpraka.sh>
> 
>> ---
>>   Documentation/accel/qaic/qaic.rst | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/Documentation/accel/qaic/qaic.rst 
>> b/Documentation/accel/qaic/qaic.rst
>> index efb7771273bb..628bf2f7a416 100644
>> --- a/Documentation/accel/qaic/qaic.rst
>> +++ b/Documentation/accel/qaic/qaic.rst
>> @@ -93,7 +93,7 @@ commands (does not impact QAIC).
>>   uAPI
>>   ====
>> -QAIC creates an accel device per phsyical PCIe device. This accel 
>> device exists
>> +QAIC creates an accel device per physical PCIe device. This accel 
>> device exists
>>   for as long as the PCIe device is known to Linux.
>>   The PCIe device may not be in the state to accept requests from 
>> userspace at
> 
> thanks,
> -- Shuah


