Return-Path: <linux-arm-msm+bounces-30051-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 84F2D964953
	for <lists+linux-arm-msm@lfdr.de>; Thu, 29 Aug 2024 17:01:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2FFAB1F2303E
	for <lists+linux-arm-msm@lfdr.de>; Thu, 29 Aug 2024 15:01:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C681326AE6;
	Thu, 29 Aug 2024 15:01:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="J4cOHHuN"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D276A194C88;
	Thu, 29 Aug 2024 15:00:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724943660; cv=none; b=SL1Pfoo0IHmLbg0Jz5lnq8dYsEAE0MvR5haHdupI2ykYvg3FDcQl2LDTdSzo3ix/4UkLQsPt5F4RU8uqfDYXmqjoTUjOS6hLpjkTs5gq3LsIgu5oWtFCULjVrK/ZGQjaRFAkHzBP2+JaW0UJgF991+ofDgLy+OkHRUonV34FZVk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724943660; c=relaxed/simple;
	bh=O+d/0lMVaIYVMB/riqqZ+H+RRARHH5fN/vZI7PK+/nw=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=bMNTOR30Ev4R0D+6yZXc9Kjr+8D9Cx6cLFuS1HWiq+pfa0Swv43boSKQg2tAzVmzHa6JN20JRSmWaBc/1tN86N/NsZ2OV/+JkjFihDap7pIVJfemRvJZcy7E8csKoSjX4gKj124xhKzihdtIuJowpe93CmFJYHceJGSZ1XpfwBo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=J4cOHHuN; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 47T8cT5f010662;
	Thu, 29 Aug 2024 14:55:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	qci3cwf+mW9KbSy7TQgd0WaPW96WIwi1KoQEYhtS2Pg=; b=J4cOHHuN9G0HjIWw
	/25+ak2LuBuAXp7eGZFNHpxPl4yiyt4dzF4/+JUKvfdGtA+Llcb8s4yxBbzWM/qx
	SDse382kxkCffOGDv4/s90dEPT0QfLufEfqvCiYmN2dS1erBe1xZKIFs/xCQTgKW
	eUNr/ayP1xNcIIFUQPA1OKbttqGzD5ZUyGnLhUfIcV8j9EUjwdR+O/WggxiMdIaO
	vn4PSEfEetkhvnwVZpPaljah10iK0iDxhDZ/fx+mHaREAivl9Ws9FMCtTQowBTmf
	6QSBDl8Tnw9mG0YdKGgp95evG4PmaNnSawAlXBb7iAW0aoWXh53eS8KzLdpzPHhu
	x3NmJw==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 419pv0np5p-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 29 Aug 2024 14:55:50 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 47TEtnF4031331
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 29 Aug 2024 14:55:49 GMT
Received: from [10.226.59.182] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Thu, 29 Aug
 2024 07:55:48 -0700
Message-ID: <f6075361-1766-35a5-c7ac-cc3eb416a4e1@quicinc.com>
Date: Thu, 29 Aug 2024 08:55:47 -0600
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
To: Brian Masney <bmasney@redhat.com>,
        =?UTF-8?Q?Ernesto_A=2e_Fern=c3=a1ndez?=
	<ernesto.mnd.fernandez@gmail.com>
CC: Trilok Soni <quic_tsoni@quicinc.com>, <linux-crypto@vger.kernel.org>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller"
	<davem@davemloft.net>,
        <linux-arm-msm@vger.kernel.org>,
        Om Prakash Singh
	<quic_omprsing@quicinc.com>
References: <20240828184019.GA21181@eaf>
 <a8914563-d158-4141-b022-340081062440@quicinc.com>
 <20240828201313.GA26138@eaf>
 <CABx5tq+ZFpTDdjV7R5HSEFyNoR5VUYDHm89JEHvKb-9TW6Oejw@mail.gmail.com>
From: Jeffrey Hugo <quic_jhugo@quicinc.com>
In-Reply-To: <CABx5tq+ZFpTDdjV7R5HSEFyNoR5VUYDHm89JEHvKb-9TW6Oejw@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: nPn6qFdRs7NaGeLsQxwaLHdeZRIfhkaK
X-Proofpoint-ORIG-GUID: nPn6qFdRs7NaGeLsQxwaLHdeZRIfhkaK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-29_03,2024-08-29_02,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 mlxlogscore=826 bulkscore=0 impostorscore=0 phishscore=0 clxscore=1011
 mlxscore=0 spamscore=0 suspectscore=0 malwarescore=0 adultscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2407110000 definitions=main-2408290104

On 8/28/2024 7:25 PM, Brian Masney wrote:
> On Wed, Aug 28, 2024 at 4:13 PM Ernesto A. Fernández
> <ernesto.mnd.fernandez@gmail.com> wrote:
>> On Wed, Aug 28, 2024 at 12:03:57PM -0700, Trilok Soni wrote:
>>> On 8/28/2024 11:40 AM, Ernesto A. Fernández wrote:
>>>> Hi, I have a bug to report.
>>>>
>>>> I'm getting a null pointer dereference inside qcom_rng_probe() when this
>>>> driver gets loaded. The problem comes from here:
>>>>
>>>>    rng->of_data = (struct qcom_rng_of_data *)of_device_get_match_data(&pdev->dev);
>>>>
>>>> because of_device_get_match_data() will just return null for acpi. It seems
>>>> that acpi was left behind by the changes in commit f29cd5bb64c2 ("crypto:
>>>> qcom-rng - Add hw_random interface support").
>>>
>>> Which Qualcomm platform you are testing w/ the ACPI? Most of our platforms
>>> uses the devicetree.
>>
>> Amberwing.
> 
> We have a few Amberwing servers in the lab at Red Hat. I verified that
> qcom-rng was crashing on boot with an upstream kernel, and it's now
> fixed with this:
> 
> https://lore.kernel.org/linux-arm-msm/20240829012005.382715-1-bmasney@redhat.com/T/#t
> 
> Brian
> 
> 

Interesting, I haven't seen this in my testing.  I'll go swing back and 
try to figure out why.

For future reference, I'm still supporting Amberwing/QDF2400. 
Addressing emails to me is a good way to get my attention.

-Jeff

