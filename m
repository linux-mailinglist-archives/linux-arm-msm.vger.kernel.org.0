Return-Path: <linux-arm-msm+bounces-24677-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id A6C6691C6E6
	for <lists+linux-arm-msm@lfdr.de>; Fri, 28 Jun 2024 21:55:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 333E2B235F1
	for <lists+linux-arm-msm@lfdr.de>; Fri, 28 Jun 2024 19:55:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 295DF77F2F;
	Fri, 28 Jun 2024 19:55:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="pZyltw4g"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A14247710C;
	Fri, 28 Jun 2024 19:55:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719604532; cv=none; b=hJgrlRbM9aNJatiGnrqFkG0mk5nilYND90j5brmABi1Y0X0BGqwDCfpMZBEfhcDlIsthDJkJ8xzFhfyoHhTCLpZMl8E2Vib21sr73MwuX4r7i+5hZdL+G2q0Mvi+pdiBsKUKIxMcppdGgfbRnMVEvw0HZzxklS+6KIypRzEIBGA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719604532; c=relaxed/simple;
	bh=YM+yQDNqkkBhY/x5WBPZk5abMHgkfaWP73Nw6FDu1FQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=acmzoJG77jmGchgtZvaZGfzcAgmQGsfj0PoZVZP/bq2OWUjmZGUFYATj+QUF7wV8/cjoGJDIgT3w24w59THEsOnQYBhBC0l7bek62cRTbNkblX7Mf1AxMK7ral5IE/Dkzc0FuMfzy9vTkgpuzB316hUOpJSDnemOtGQorC2RUvM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=pZyltw4g; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45SGc1DM000900;
	Fri, 28 Jun 2024 19:55:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	eRgvqU3QHpMQzWa7BXNysUM8bokPIDW5+DmiJDF3IHA=; b=pZyltw4g79cEf8Jl
	fnVkh6v6K4sYoVw32c5Gw38yXqV+CPh1dnf+hJ+kJLLhsGN/pIJpueL7dgMN7HOv
	uXg3rn+vHLiybEp4ScJmmrsOF/aFLAXRRLi20NZeuB29THaxJJYaENKvOadtb+lR
	AmoeskMXsagX46NXoELKavNw837JtPSH93xfaTA4D6GZSsFjhamS71qvxgRuTDIC
	S0PlVe9pZQ0Nl1XE5j3MzdNxfx0qJoAIMDNK24cKyfIikszWBEqCMssYd5442LdI
	iJMR7FSEcg23E+6v34fo+8fRZ6/9NduQZkeoIpUuPXgAMel1cMobwuOm5HZ0rYF4
	XLXZuQ==
Received: from nasanppmta01.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 400f90rc92-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 28 Jun 2024 19:55:05 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA01.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 45SJt42L013084
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 28 Jun 2024 19:55:04 GMT
Received: from [10.110.112.228] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Fri, 28 Jun
 2024 12:55:00 -0700
Message-ID: <e4f397c5-e266-44ff-b358-f0bd51bc52a0@quicinc.com>
Date: Fri, 28 Jun 2024 12:55:00 -0700
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/3] net: stmmac: Add interconnect support
To: Andrew Lunn <andrew@lunn.ch>
CC: Andrew Halaney <ahalaney@redhat.com>, Vinod Koul <vkoul@kernel.org>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Jose Abreu
	<joabreu@synopsys.com>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet
	<edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni
	<pabeni@redhat.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        "Russell
 King" <linux@armlinux.org.uk>, Rob Herring <robh@kernel.org>,
        "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        "Bhupesh
 Sharma" <bhupesh.sharma@linaro.org>, <kernel@quicinc.com>,
        <linux-arm-msm@vger.kernel.org>, <netdev@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        <devicetree@vger.kernel.org>
References: <20240625-icc_bw_voting_from_ethqos-v2-0-eaa7cf9060f0@quicinc.com>
 <20240625-icc_bw_voting_from_ethqos-v2-2-eaa7cf9060f0@quicinc.com>
 <owkerbnbenzwtnu2kbbas5brhnak2e37azxtzezmw3hb6mficq@ffpqrqglmp4c>
 <cf6c2526-ba12-4627-b4e9-20ce5b4d175c@quicinc.com>
 <c7bcc2ae-eb27-4acc-b18c-8cb584b4d616@lunn.ch>
Content-Language: en-US
From: Sagar Cheluvegowda <quic_scheluve@quicinc.com>
In-Reply-To: <c7bcc2ae-eb27-4acc-b18c-8cb584b4d616@lunn.ch>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: Ij94Dj5NvOC2j9lvQX6ynyrM829I5u-W
X-Proofpoint-GUID: Ij94Dj5NvOC2j9lvQX6ynyrM829I5u-W
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-28_15,2024-06-28_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 suspectscore=0
 spamscore=0 malwarescore=0 mlxlogscore=800 mlxscore=0 adultscore=0
 impostorscore=0 lowpriorityscore=0 phishscore=0 priorityscore=1501
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2406140001 definitions=main-2406280149



On 6/26/2024 5:14 PM, Andrew Lunn wrote:
> On Wed, Jun 26, 2024 at 04:38:34PM -0700, Sagar Cheluvegowda wrote:
>>
>>
>> On 6/26/2024 7:54 AM, Andrew Halaney wrote:
>>> On Tue, Jun 25, 2024 at 04:49:29PM GMT, Sagar Cheluvegowda wrote:
>>>> Add interconnect support to vote for bus bandwidth based
>>>> on the current speed of the driver.This change adds support
>>>> for two different paths - one from ethernet to DDR and the
>>>> other from Apps to ethernet.
>>>
>>> "APPS" is a qualcomm term, since you're trying to go the generic route
>>> here maybe just say CPU to ethernet?
>>>
>> I can update this in my next patch.
>>
>> Sagar
> 
> Please trim emails when replying to just the needed context.
> 
> Also, i asked what Apps meant in response to an earlier version of
> this patch. I think you ignored me....
> 
>        Andrew


Thanks Andrew, i will take a note of it when replying next time.

Regarding the Apps part, i had replied to your email on 06/21.

