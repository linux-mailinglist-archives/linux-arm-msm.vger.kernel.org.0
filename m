Return-Path: <linux-arm-msm+bounces-31859-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 9007397A6ED
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Sep 2024 19:42:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1F9D91F22D4B
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Sep 2024 17:42:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C592F15A865;
	Mon, 16 Sep 2024 17:42:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="bdC2HBsb"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2617A1547D5;
	Mon, 16 Sep 2024 17:42:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726508557; cv=none; b=JwtGJlEoK+i3oYciALcwvhF4DlzF08He3bD0tWKChflXPj1dwKmm1sZnxGSDvkBXjWlB3XYkAhSZ7hnNyrsC0r4C7l2wZ6kNBpguRS17qixhR4Lq8WhgunqtrCJ/+Aj1dK5D8k3GDf807tpAVxf2zgCrXr1zu/x0EXe/tFGu+zQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726508557; c=relaxed/simple;
	bh=imJb10F0p8FimdcWYKhHlt27ZPYdvlPl/FXZuuDmNYk=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:CC:References:
	 In-Reply-To:Content-Type; b=T2QeQs6fD0/YL8evAzjXFYeEqQEV85hd2PcgrYxB+lN1WHSsTNf9OkHSDhXHra+k9GoJ0sPQnX+WsGXqj6VMHfsq3OGGM1X6Wy0Asiu0q6U8Z6m+oGph8Z4hnxYIqhxjgv1adrmDe9oVDiTvKZ+PmjcpwKoB11cBzU8Q4KvBdXY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=bdC2HBsb; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 48GDoRo6021351;
	Mon, 16 Sep 2024 17:42:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	c86s9XXOd5VXIbBhX4HoJ1Rw58RLd+R0EqmNmSMHhdQ=; b=bdC2HBsbduHZ8d82
	QtK8okAAxccyFwBOsisfrePlHXxLbj1Q8rQyDmZYZfD6JtVDyJD2mGc3FfCN+32D
	4nDmKwh96EzQZAvONmJeTAPPAtjjUQj48It0FemoArT+SRBph3V476ha8LLQPRmE
	RcbxG+KpQHM3/s+M4WDmxo428CYtFyQ+n4bL2MBZD94QhMB6s/h5EfLTM+wYPc9q
	J9HxgZ1DzbgYr5sSu6y6mc2XzbIZHiMTHLlgySSlejTmPDvgc8EHbvfk2lhooTGy
	HobQLmMnNnb/Vg52L+zyXM7vRzJiJEklr6krgCmlQEiCKtZhigeBwJi975sNcvUz
	uGTN7g==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 41n4jhmuje-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 16 Sep 2024 17:42:28 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 48GHgROo008844
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 16 Sep 2024 17:42:27 GMT
Received: from [10.226.59.182] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 16 Sep
 2024 10:42:26 -0700
Message-ID: <e6299c6d-dc18-eb05-2af5-8f8d885831c9@quicinc.com>
Date: Mon, 16 Sep 2024 11:42:25 -0600
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.0
Subject: Re: qcom-rng is broken for acpi
Content-Language: en-US
From: Jeffrey Hugo <quic_jhugo@quicinc.com>
To: Brian Masney <bmasney@redhat.com>
CC: =?UTF-8?Q?Ernesto_A=2e_Fern=c3=a1ndez?= <ernesto.mnd.fernandez@gmail.com>,
        Trilok Soni <quic_tsoni@quicinc.com>, <linux-crypto@vger.kernel.org>,
        "Herbert Xu" <herbert@gondor.apana.org.au>,
        "David S. Miller"
	<davem@davemloft.net>,
        <linux-arm-msm@vger.kernel.org>,
        Om Prakash Singh
	<quic_omprsing@quicinc.com>
References: <20240828184019.GA21181@eaf>
 <a8914563-d158-4141-b022-340081062440@quicinc.com>
 <20240828201313.GA26138@eaf>
 <CABx5tq+ZFpTDdjV7R5HSEFyNoR5VUYDHm89JEHvKb-9TW6Oejw@mail.gmail.com>
 <f6075361-1766-35a5-c7ac-cc3eb416a4e1@quicinc.com>
 <CABx5tqJomV_Su2NmyBBgipOiiby5sF7LAo_kdvhYT6oNYwVpVA@mail.gmail.com>
 <da23b318-1d65-c001-1dc2-8ba66abe9d6f@quicinc.com>
In-Reply-To: <da23b318-1d65-c001-1dc2-8ba66abe9d6f@quicinc.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: cux0zRGIW8GzzR-6FkqKU94shoTYIY96
X-Proofpoint-GUID: cux0zRGIW8GzzR-6FkqKU94shoTYIY96
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 clxscore=1015 phishscore=0 impostorscore=0 bulkscore=0 adultscore=0
 suspectscore=0 lowpriorityscore=0 malwarescore=0 spamscore=0 mlxscore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2408220000 definitions=main-2409160118

On 9/15/2024 11:07 PM, Jeffrey Hugo wrote:
> On 9/5/2024 6:14 PM, Brian Masney wrote:
>> Hi Jeffrey,
>>
>> On Thu, Aug 29, 2024 at 11:01 AM Jeffrey Hugo <quic_jhugo@quicinc.com> 
>> wrote:
>>> Interesting, I haven't seen this in my testing.  I'll go swing back and
>>> try to figure out why.
>>>
>>> For future reference, I'm still supporting Amberwing/QDF2400.
>>> Addressing emails to me is a good way to get my attention.
>>
>> I also see an unrelated error when booting the Qualcomm Amberwing with
>> 6.11.0-rc5:
>>
>> [   14.159483] arm-smmu-v3-pmcg arm-smmu-v3-pmcg.1.auto: error
>> -EINVAL: invalid resource (null)
>> [   14.167076] arm-smmu-v3-pmcg arm-smmu-v3-pmcg.1.auto: probe with
>> driver arm-smmu-v3-pmcg failed with error -22
>> [   14.177707] arm-smmu-v3-pmcg arm-smmu-v3-pmcg.2.auto: error
>> -EINVAL: invalid resource (null)
>> [   14.185557] arm-smmu-v3-pmcg arm-smmu-v3-pmcg.2.auto: probe with
>> driver arm-smmu-v3-pmcg failed with error -22
>> ...
>>
>> I spent 20 minutes troubleshooting this in the arm smmu driver,
>> however I didn't see anything obvious. I attached the full dmesg.
>> Ernesto: Are you seeing that on your Amberwing?
> 
> Yes, looks like it first pops up 6.11-rc1.
> Nothing is jumping out at me.  I'm running a bisect to see if it gives a 
> clue.

Bisect pointed to the following which makes zero sense -

commit 5db755fbb1a0de4a4cfd5d5edfaa19853b9c56e6
Author: Christoph Hellwig <hch@lst.de>
Date:   Fri May 31 09:47:56 2024 +0200

     ubd: refactor the interrupt handler

     Instead of a separate handler function that leaves no work in the
     interrupt hanler itself, split out a per-request end I/O helper and
     clean up the coding style and variable naming while we're at it.

     Signed-off-by: Christoph Hellwig <hch@lst.de>
     Reviewed-by: Martin K. Petersen <martin.petersen@oracle.com>
     Acked-By: Anton Ivanov <anton.ivanov@cambridgegreys.com>
     Link: https://lore.kernel.org/r/20240531074837.1648501-2-hch@lst.de
     Signed-off-by: Jens Axboe <axboe@kernel.dk>

  arch/um/drivers/ubd_kern.c | 49 
+++++++++++++++++-----------------------------
  1 file changed, 18 insertions(+), 31 deletions(-)

I wonder if bisect-ability got broken somehow.

I'm going to try to do a bit of a manual bisect to see if I can avoid 
whatever glitch (possibly self induced) I seem to have hit.

-Jeff


