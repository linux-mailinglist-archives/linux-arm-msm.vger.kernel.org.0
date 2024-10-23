Return-Path: <linux-arm-msm+bounces-35521-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 830579ABDA2
	for <lists+linux-arm-msm@lfdr.de>; Wed, 23 Oct 2024 07:08:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E03282835E5
	for <lists+linux-arm-msm@lfdr.de>; Wed, 23 Oct 2024 05:08:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 98E6B13CFA1;
	Wed, 23 Oct 2024 05:08:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="TH3SB30E"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E01AD39ACC;
	Wed, 23 Oct 2024 05:08:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729660083; cv=none; b=nu+1apWeHri496FV0R+JcfnrCPyF0VzdVtO3wu7rmpLofRTaGrIfEp1V2I5/CRedPYXidKG8OT+X+JsJlbap6uszPjgBCGelhW0Dm2iXu/NdlacpeR8hwPKPuumSdfHRYEJCGXtmYCIkl5YuT7kB77O/AlC8lXvJRaTGxqKOyA4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729660083; c=relaxed/simple;
	bh=ht2IcqUIibZPtSYBwMnMl0wko1zLpajabqDsNjShT9E=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=aauWoD91hHwvItDatplpNqaA3EXRMkLKILtqB41HU2BmWjOS3mUUpPUISwLjGo8Iq3fpuSlMB2wCfe0JH4kurqqelmgGFIf1wxf4GodP+2bARMK8Ui0SNVQwwnWwxrCHipIzm9WxaN+5wYrHWTGqZ1ZA5LIqCIKB04iQOGrTNdw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=TH3SB30E; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49MLaBlp025161;
	Wed, 23 Oct 2024 05:07:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	kqEsxGFiFNaU+Lg3MVVwP9PI42H4MdV/UcLW2KSfP5Q=; b=TH3SB30ELR1jbbIH
	udlZ9d58mrtgmBuHrnDrPBgCrePOF57RH2X1cDHIjHJK1az9NcvV1uE9rWRCpqLx
	lLEdXfH5EbD/sGF/n77Y8w1wuRNgEVnB0jaClu9yBbMGfOI4rsIeuHwaSYi+h4gz
	wfFhd55tWTxSF6C46ayVxw8xmB1D4upkRlwwmK7FkO1UQae6tYbVSDHUVZOl4xmr
	9ReB+OMufpUmSC3gIShJJKdLfVSsGY7WfrPj+JeYb7+5jcHkzh6iU/BSO4yNKBS/
	vYioH6MDfHLPRdXb5Vk/Ea77llhOMNN2k4k2OaAai5ApNgLatnuRtfCnlmVe/Wni
	4qJj+A==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42em41rvvp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 23 Oct 2024 05:07:41 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 49N57eOm011484
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 23 Oct 2024 05:07:40 GMT
Received: from [10.110.103.186] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 22 Oct
 2024 22:07:39 -0700
Message-ID: <0275bd96-ce6a-454a-a407-b2d8fc60e156@quicinc.com>
Date: Tue, 22 Oct 2024 22:07:38 -0700
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v1 00/10] QRTR Multi-endpoint support
To: Denis Kenzior <denkenz@gmail.com>, <netdev@vger.kernel.org>
CC: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        "David S.
 Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub
 Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, <linux-arm-msm@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
References: <20241018181842.1368394-1-denkenz@gmail.com>
Content-Language: en-US
From: Chris Lew <quic_clew@quicinc.com>
In-Reply-To: <20241018181842.1368394-1-denkenz@gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: hQxSGMe9pQh4lA7EJBEnGyC0a3KrDg4g
X-Proofpoint-ORIG-GUID: hQxSGMe9pQh4lA7EJBEnGyC0a3KrDg4g
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 malwarescore=0 clxscore=1015 mlxscore=0 suspectscore=0 phishscore=0
 mlxlogscore=924 bulkscore=0 adultscore=0 lowpriorityscore=0 spamscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2410230028



On 10/18/2024 11:18 AM, Denis Kenzior wrote:
> The current implementation of QRTR assumes that each entity on the QRTR
> IPC bus is uniquely identifiable by its node/port combination, with
> node/port combinations being used to route messages between entities.
> 
> However, this assumption of uniqueness is problematic in scenarios
> where multiple devices with the same node/port combinations are
> connected to the system.  A practical example is a typical consumer PC
> with multiple PCIe-based devices, such as WiFi cards or 5G modems, where
> each device could potentially have the same node identifier set.  In
> such cases, the current QRTR protocol implementation does not provide a
> mechanism to differentiate between these devices, making it impossible
> to support communication with multiple identical devices.
> 
> This patch series addresses this limitation by introducing support for
> a concept of an 'endpoint.' Multiple devices with conflicting node/port
> combinations can be supported by assigning a unique endpoint identifier
> to each one.  Such endpoint identifiers can then be used to distinguish
> between devices while sending and receiving messages over QRTR sockets.
> 
> The patch series maintains backward compatibility with existing clients:
> the endpoint concept is added using auxiliary data that can be added to
> recvmsg and sendmsg system calls.  The QRTR socket interface is extended
> as follows:
> 
> - Adds QRTR_ENDPOINT auxiliary data element that reports which endpoint
>    generated a particular message.  This auxiliary data is only reported
>    if the socket was explicitly opted in using setsockopt, enabling the
>    QRTR_REPORT_ENDPOINT socket option.  SOL_QRTR socket level was added
>    to facilitate this.  This requires QRTR clients to be updated to use
>    recvmsg instead of the more typical recvfrom() or recv() use.
> 
> - Similarly, QRTR_ENDPOINT auxiliary data element can be included in
>    sendmsg() requests.  This will allow clients to route QRTR messages
>    to the desired endpoint, even in cases of node/port conflict between
>    multiple endpoints.
> 
> - Finally, QRTR_BIND_ENDPOINT socket option is introduced.  This allows
>    clients to bind to a particular endpoint (such as a 5G PCIe modem) if
>    they're only interested in receiving or sending messages to this
>    device.
> 
> NOTE: There is 32-bit unsafe use of radix_tree_insert in this patch set.
> This follows the existing usage inside net/qrtr/af_qrtr.c in
> qrtr_tx_wait(), qrtr_tx_resume() and qrtr_tx_flow_failed().  This was
> done deliberately in order to keep the changes as minimal as possible
> until it is known whether the approach outlined is generally acceptable.
> 

Hi Denis,

Thank you for taking a stab at this long standing problem. We've been 
going back and forth on how to solve this but haven't had anyone 
dedicated to working out a solution. From a first pass I think this 
looks very reasonable and I only have a few nitpicks here and there. 
Hopefully Bjorn and Mani will provide more feedback.

Thanks!
Chris


> Denis Kenzior (10):
>    net: qrtr: ns: validate msglen before ctrl_pkt use
>    net: qrtr: allocate and track endpoint ids
>    net: qrtr: support identical node ids
>    net: qrtr: Report sender endpoint in aux data
>    net: qrtr: Report endpoint for locally generated messages
>    net: qrtr: Allow sendmsg to target an endpoint
>    net: qrtr: allow socket endpoint binding
>    net: qrtr: Drop remote {NEW|DEL}_LOOKUP messages
>    net: qrtr: ns: support multiple endpoints
>    net: qrtr: mhi: Report endpoint id in sysfs
> 
>   include/linux/socket.h    |   1 +
>   include/uapi/linux/qrtr.h |   7 +
>   net/qrtr/af_qrtr.c        | 297 +++++++++++++++++++++++++++++++------
>   net/qrtr/mhi.c            |  14 ++
>   net/qrtr/ns.c             | 299 +++++++++++++++++++++++---------------
>   net/qrtr/qrtr.h           |   4 +
>   6 files changed, 459 insertions(+), 163 deletions(-)
> 

