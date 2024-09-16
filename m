Return-Path: <linux-arm-msm+bounces-31800-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 91BB8979AA9
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Sep 2024 07:13:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 25146B207AF
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Sep 2024 05:13:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7BD8C208D1;
	Mon, 16 Sep 2024 05:13:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="lJgXMiUC"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEDC514AA9;
	Mon, 16 Sep 2024 05:13:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726463584; cv=none; b=T/5vYMPTFEMrFVy3K4ldyH/1alvEey2fIrkvOZoDP6YLJGLCPDq2+XIor0xjFA5rvwYbK23g1UmkyESqP4AtOGajtvSlD73VJCqcf53dqSJGntEcoIbWcJuhdfrzlGgATAnN2yLY1Q2+y14T9UvHcTX5FQvknCSmIFW1gTtOWpo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726463584; c=relaxed/simple;
	bh=gnp0mpQBbM6SMN7JZQ2MMuhgpM4lmrntx89qvrqHR0k=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=QagGxE3FyziHkt6XdeiVz9yIdCdrWSlcccxfUCzk93I5DJUssIWLwav08XxbVWrqd1mmFx7Ak42ApI55VLS6E4b1ZlxLXW+C3jdwgPbPxMT9108SviAlMyUtKG9RXfIo81ivA3C2FNB00tu5T0Wv44RpE7HF76He1Xex/x28FKQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=lJgXMiUC; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 48FNsxUG028424;
	Mon, 16 Sep 2024 05:07:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	CAAcZuecdfzQYLqNroZXOBVabLrdH0t/pE3SxzUSCNg=; b=lJgXMiUCGB+NpR60
	3i84/PZLaKL9OVzYnzAmuFu0ZKeGzxyk69kEbtWq43G1P/0oAJGew5N5pHL954qR
	XVqCFDi4u41SxTg2etiLc+5AXS0tGiDf3WVUwXGYGFzpn4FTd9LTVoH6gSkxPMwa
	ZD5t/zGHsLwTW+FsRNDQfsdrPskSImfWMrWggiL9d9szilU48MRIJZZf8l2SU6/N
	TxR/G0YERiT6wNyqt4ia3q6rsbojrxWB4b81sBFStoAgY5G9INRttMBQlk6yV1BA
	9PHm3Vg39ofLYCYzysZnCfctgn1Jcw5P85PzfhKUeo0iCUaYYASoTW5kLnWWrtAc
	lCQISg==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 41n4hfau96-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 16 Sep 2024 05:07:47 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 48G57kP2030707
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 16 Sep 2024 05:07:46 GMT
Received: from [10.226.59.182] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Sun, 15 Sep
 2024 22:07:46 -0700
Message-ID: <da23b318-1d65-c001-1dc2-8ba66abe9d6f@quicinc.com>
Date: Sun, 15 Sep 2024 23:07:44 -0600
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
From: Jeffrey Hugo <quic_jhugo@quicinc.com>
In-Reply-To: <CABx5tqJomV_Su2NmyBBgipOiiby5sF7LAo_kdvhYT6oNYwVpVA@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: OwG_ZnzRy1hofcxENBlNh5A__DhprHuA
X-Proofpoint-ORIG-GUID: OwG_ZnzRy1hofcxENBlNh5A__DhprHuA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 clxscore=1011 phishscore=0 malwarescore=0 mlxlogscore=494 mlxscore=0
 impostorscore=0 adultscore=0 suspectscore=0 lowpriorityscore=0 spamscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2408220000 definitions=main-2409160030

On 9/5/2024 6:14 PM, Brian Masney wrote:
> Hi Jeffrey,
> 
> On Thu, Aug 29, 2024 at 11:01 AM Jeffrey Hugo <quic_jhugo@quicinc.com> wrote:
>> Interesting, I haven't seen this in my testing.  I'll go swing back and
>> try to figure out why.
>>
>> For future reference, I'm still supporting Amberwing/QDF2400.
>> Addressing emails to me is a good way to get my attention.
> 
> I also see an unrelated error when booting the Qualcomm Amberwing with
> 6.11.0-rc5:
> 
> [   14.159483] arm-smmu-v3-pmcg arm-smmu-v3-pmcg.1.auto: error
> -EINVAL: invalid resource (null)
> [   14.167076] arm-smmu-v3-pmcg arm-smmu-v3-pmcg.1.auto: probe with
> driver arm-smmu-v3-pmcg failed with error -22
> [   14.177707] arm-smmu-v3-pmcg arm-smmu-v3-pmcg.2.auto: error
> -EINVAL: invalid resource (null)
> [   14.185557] arm-smmu-v3-pmcg arm-smmu-v3-pmcg.2.auto: probe with
> driver arm-smmu-v3-pmcg failed with error -22
> ...
> 
> I spent 20 minutes troubleshooting this in the arm smmu driver,
> however I didn't see anything obvious. I attached the full dmesg.
> Ernesto: Are you seeing that on your Amberwing?

Yes, looks like it first pops up 6.11-rc1.
Nothing is jumping out at me.  I'm running a bisect to see if it gives a 
clue.

-Jeff

