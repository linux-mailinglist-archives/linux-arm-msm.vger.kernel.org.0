Return-Path: <linux-arm-msm+bounces-33668-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id E5E4D996531
	for <lists+linux-arm-msm@lfdr.de>; Wed,  9 Oct 2024 11:24:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 8141AB2805F
	for <lists+linux-arm-msm@lfdr.de>; Wed,  9 Oct 2024 09:24:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9B89518EFD4;
	Wed,  9 Oct 2024 09:20:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="YhbrNKQO"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1ECD118E76E;
	Wed,  9 Oct 2024 09:20:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728465649; cv=none; b=jE+KEEHlBWWRRe4RPKPoBareS+VlyHK3mRPljcjGI5USP9dEgM65R7O8t2sOyxnKHHAk69W6ZQdOnDOxohMEortjWNb/b5+kLzsAJ7xqxrTvSOkHfpocPg5IFuJW7AAuIek9E1zVypPS5xwnw4en/kbhwh1ln8ZjS7evwJxcSpE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728465649; c=relaxed/simple;
	bh=aeOCbk0PsLtE5JzLWPFz2lzRfvXT6wwOoAgjwany9N8=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=Jg8cB7ENdatD/sL9XP0jiXCq1ekIGqDg4lgkdgokZpE4yJ5AAz480wACTirCA4a1Y3vOQREfYuT/CODo5N4Ic5mQzP1ON0HqmGQDDfqh0+jWGOAFwxDOpWALc0/ttXJZKSGa0PFp8j5cGd3UzEycj6mOaEMslRBg1pQHtkRzrFQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=YhbrNKQO; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 499786KF026815;
	Wed, 9 Oct 2024 09:20:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	nopzlFAvEnKmID7NT6spIwtKQ7l5wvtm5oKw6QdIjsQ=; b=YhbrNKQOcHz22qpM
	K1gqu1DOL1FXgo+mBI8bx0t9fOKIzVa6CVknXH4lpuvemDZqtx/oodRnwvdRErt6
	C1KqhTo2dbphfz6p3DvCQQDRmYIuf1sXI3uNCDMVuYl1VtC0EqQMp/jlbV8cABtt
	eSCc9M1YkSrgqrP7t+NsI5vGV15u6uOT5r3QlEbTERAWeJn/G1k5YF5E2QgzXPkY
	/5/hFLYkGSNRHK6thxHnY+Ysx5TnXPOn7AfRpSfXLP5g64xXtpNoXsg49xKgalOW
	2cxhD514jh6u+Bhzvlxhc/EIBm/08DvOpSlsqqht5GqopjD7Yboq4RhQ/o1yAlZt
	6bweew==
Received: from nasanppmta04.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 422xqa2bym-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 09 Oct 2024 09:20:37 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4999Kbvk025740
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 9 Oct 2024 09:20:37 GMT
Received: from [10.239.133.242] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 9 Oct 2024
 02:20:33 -0700
Message-ID: <0525c2a9-45a5-4654-aaf4-b0ab9e161884@quicinc.com>
Date: Wed, 9 Oct 2024 17:20:26 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] Coresight: Narrow down the matching range of tpdm
To: Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach
	<mike.leach@linaro.org>, James Clark <james.clark@arm.com>,
        Alexander
 Shishkin <alexander.shishkin@linux.intel.com>,
        Andy Gross
	<agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Rob Herring
	<robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
	<conor+dt@kernel.org>
CC: <linux-kernel@vger.kernel.org>, <coresight@lists.linaro.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>
References: <20241009085042.1098-1-quic_songchai@quicinc.com>
 <a7fc66fe-0fb3-4d2c-8f23-03ccd46a4766@arm.com>
Content-Language: en-US
From: songchai <quic_songchai@quicinc.com>
In-Reply-To: <a7fc66fe-0fb3-4d2c-8f23-03ccd46a4766@arm.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: ITtbRwbSSCE1pC52BwfFQ4pT3RPX6ch1
X-Proofpoint-GUID: ITtbRwbSSCE1pC52BwfFQ4pT3RPX6ch1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 phishscore=0
 spamscore=0 lowpriorityscore=0 priorityscore=1501 impostorscore=0
 bulkscore=0 suspectscore=0 malwarescore=0 adultscore=0 mlxlogscore=999
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2410090061


On 10/9/2024 4:54 PM, Suzuki K Poulose wrote:
> On 09/10/2024 09:50, Songwei Chai wrote:
>> The format of tpdm's peripheral id is 1f0exx. To avoid potential
>> conflicts in the future, update the .id_table's id to 0x001f0e00.
>> This update will narrow down the matching range and prevent incorrect
>> matches. For example, another component's peripheral id might be
>> f0e00, which would incorrectly match the old id.
>>
>> Signed-off-by: Songwei Chai <quic_songchai@quicinc.com>
>> ---
>>   drivers/hwtracing/coresight/coresight-tpdm.c | 4 ++--
>>   1 file changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/hwtracing/coresight/coresight-tpdm.c 
>> b/drivers/hwtracing/coresight/coresight-tpdm.c
>> index b7d99e91ab84..8e2985d17549 100644
>> --- a/drivers/hwtracing/coresight/coresight-tpdm.c
>> +++ b/drivers/hwtracing/coresight/coresight-tpdm.c
>> @@ -1308,8 +1308,8 @@ static void tpdm_remove(struct amba_device *adev)
>>    */
>>   static struct amba_id tpdm_ids[] = {
>>       {
>> -        .id = 0x000f0e00,
>> -        .mask = 0x000fff00,
>> +        .id = 0x001f0e00,
>> +        .mask = 0x00ffff00,
>>       },
>>       { 0, 0, NULL },
>>   };
>>
>
> Please could you add "Fixes" tag for this ? You don't want an old 
> kernel detect something else as TPDM, so this must go to stable kernels.
> Also, while at it, please could you intend the id and mask values with
> tabs, so it is easier to what exactly we are matching ? e.g,
Thanks for your quick response, Suzuki.
Corrected it in the new version!
>
>
>     .id    = 0x001f0e00,
>     .mask    = 0x00ffff00,
>
> Kind regards
> Suzuki
>
>

