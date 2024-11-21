Return-Path: <linux-arm-msm+bounces-38653-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id CC7F49D4C18
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 Nov 2024 12:38:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8414D1F21E23
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 Nov 2024 11:38:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 97DDF1CD1EB;
	Thu, 21 Nov 2024 11:38:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="gcrE9/67"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01D2F3C47B;
	Thu, 21 Nov 2024 11:38:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732189115; cv=none; b=LKdiTt6g7h7un0h87VOOJOJyRgtP3mxHf6egg7s6hvIf75PE3+0kmRTBnhq2OqwRSmdrIzr1v/vJZUCGKPZHSfoE7CdAW2h6MpB5jLJRS5eik4kPiQo132UZi2gN5DRElWxLfndPrqFTb9fmJnIp/HWlsEbGouaIdoNCIMuXRWk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732189115; c=relaxed/simple;
	bh=TktO2GCT6OnXrOXfOCRgOrtOaCnVDQkqu89HI9z1htE=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=VQOubSZZ8GZYQzNzT0YdUi3FH0hXXsr1SC4kqqOaLO98M4z3zCdBTUeWv1ufYb1Lv2oKFLDOzU8HMeOwetBaYlFKf42CTa3jN64WVu3fAd3S+oQobeEKELLIVrX5YSc/yIVYgCanNedrTmYJsHymjkyd+0Z8fQunKkOz/+X2/5Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=gcrE9/67; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4AL8uUPY003935;
	Thu, 21 Nov 2024 11:38:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4YRcO6b70jf15iw+nKaeBYvuDjp5NyM+Lyd4fqDywlU=; b=gcrE9/67B6ifTCMk
	nKQU5EwKN8AY3Ag3Zbj3FT2LDBhFSYv2XMWiaryj301sBs+t4/cYys5vD1wYoJLT
	ANeZyynnpPXgwNjj7EZG3gd9jW9gh9azdAq4s3aEGQRz7bhQ6VRTZ3WchPodd+Lq
	I9nRzhdWD/jLygI2drBJhFJtktwn/nc08yD8mimwXXrinvUPZCX3JVXInKZb6Xgz
	Zd3+R9xwiyyy5bvH1VC+f2edcWNmtnDwPJYvvOuapWMFYByCP8/X7WOweaMdwaSC
	oA9al3OozE6R76Gwvl40brnLmYTRxN3edj7P6EbKo0cgBT8lqoIGz3rbmxkaragL
	RKlfRw==
Received: from nasanppmta01.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 431ce3bvrk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 21 Nov 2024 11:38:32 +0000 (GMT)
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com [10.45.79.139])
	by NASANPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4ALBcVtL025920
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 21 Nov 2024 11:38:31 GMT
Received: from [10.216.44.227] (10.80.80.8) by nasanex01c.na.qualcomm.com
 (10.45.79.139) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Thu, 21 Nov
 2024 03:38:26 -0800
Message-ID: <f123a993-0cd5-4747-80fb-88acb2434880@quicinc.com>
Date: Thu, 21 Nov 2024 17:08:22 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: qcs9100: Update memory map for QCS9100
 Ride and QCS9100 Ride Rev3
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Kuldeep Singh
	<quic_kuldsing@quicinc.com>
CC: Bjorn Andersson <bjorn.andersson@example.com>,
        Konrad Dybcio
	<konrad.dybcio@example.com>,
        Rob Herring <rob.herring@example.com>,
        "Krzysztof Kozlowski" <krzysztof.kozlowski@example.com>,
        Conor Dooley
	<conor.dooley@example.com>,
        <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <quic_tengfan@quicinc.com>,
        <quic_shashim@quicinc.com>, <quic_kbajaj@quicinc.com>
References: <20241119092501.31111-1-quic_pbrahma@quicinc.com>
 <30fda0e2-f314-49b8-8c1c-bf4fac87050d@quicinc.com>
 <rnrxb5e7xcgnjp4y4id5m5dyswii6xipry3bvtpit2f4c3iqfy@qghr42jz6oze>
Content-Language: en-US
From: Pratyush Brahma <quic_pbrahma@quicinc.com>
In-Reply-To: <rnrxb5e7xcgnjp4y4id5m5dyswii6xipry3bvtpit2f4c3iqfy@qghr42jz6oze>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01c.na.qualcomm.com (10.45.79.139)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: 9n3Lo9Y5RQJnNB6QxYxqUc_ugdjnYlle
X-Proofpoint-ORIG-GUID: 9n3Lo9Y5RQJnNB6QxYxqUc_ugdjnYlle
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 malwarescore=0 clxscore=1015 priorityscore=1501 impostorscore=0
 bulkscore=0 mlxscore=0 adultscore=0 spamscore=0 mlxlogscore=898
 suspectscore=0 phishscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2409260000 definitions=main-2411210091


On 11/20/2024 5:24 PM, Dmitry Baryshkov wrote:
> On Wed, Nov 20, 2024 at 01:41:03AM +0530, Kuldeep Singh wrote:
>>
>> On 11/19/2024 2:55 PM, Pratyush Brahma wrote:
>>> This patch series is based on Tengfei Fan's patches [1] which adds support
>>> for QCS9100 Ride and QCS9100 Ride Rev3 boards.
>>>
>>> Some new carveouts (viz. gunyah_md and a few pil dtb carveouts) have been
>>> introduced and the size and base addresses have been updated for
>>> a few of existing carveouts compared to SA8775P. Also, tz_ffi_mem carveout
>>> and its corresponding scm reference has been removed as it is not required
>>> for these boards. Incorporate these changes in the updated memory map
>>> for QCS9100 Ride and QCS9100 Rev3 boards.
>>>
>>> [1] https://lore.kernel.org/all/20240911-add_qcs9100_support-v2-4-e43a71ceb017@quicinc.com/
>>>
>>> Signed-off-by: Pratyush Brahma <quic_pbrahma@quicinc.com>
>> The memory map for qcs9100-ride-r3 and qcs9100-ride is exactly same.
>> A good churn you are first deleting(based on sa8775p) and then re-adding
>> for qcs9100-ride*.
>>
>> I think it's better to move common qcs9100-ride* to a common file ex:
>> qcs9100-ride.dtsi and keep specifics further to .dts files?
>>
>> This will ensure common entities are present at same place with no
>> duplicates.
> I'd second this proposal.
Ok then, I see that there are some thermal and gpu enablement changes as 
well in the pipeline to be posted.
Having a common dtsi file for these iot socs would help in reducing the 
duplication at board
dts file level for all these changes. In that regard, does naming it
"sa8775-iot.dtsi" sound good? The board files can include this dtsi.

-- 
Thanks and Regards
Pratyush Brahma


