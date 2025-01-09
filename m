Return-Path: <linux-arm-msm+bounces-44598-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 00759A07909
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Jan 2025 15:20:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id F01A13A15E0
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Jan 2025 14:20:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CAEC421A432;
	Thu,  9 Jan 2025 14:20:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="SV6LaR5w"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41338218EB8;
	Thu,  9 Jan 2025 14:20:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736432448; cv=none; b=Bb9izA2Do2kTWGjROIY9LCb1TWsb+jqle4qHD3coBd7Yzhe04pwG32nLczl2OxmyBgZlg2x9kdu3ja3N9BAHv9gUDN2pG1hJ2akMH3isO6c7S2EnGjFutoevTBGG4aF7DUvXPRlQ+aeFyFFiWyS3uewIHgeQKgJz753BRNeMShc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736432448; c=relaxed/simple;
	bh=WQjgZPH0AX+r0bQdBP6/Y6y/hdKrBgENkNFq/e4ZkX0=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=tHT7uCa/cGcea36+VP/6bjpJyU/AtpY/xB73IbY4EOALnxo/RMt80ZcvlwVqv+d56R92tY0lz4TS/P4azRugle+ki6vPL8mOIYjIHt2TH5EuNSZoyQynRpsQBx3i7INUM3joFJazCCIKL6zOHmQAc9X1ljHzNuZyb1jrNE8la/Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=SV6LaR5w; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 509D8cIa011816;
	Thu, 9 Jan 2025 14:20:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	hEe2dSpPExObbK1eKe6egzm4w5xoz+xHc6bfmDSlRb0=; b=SV6LaR5wDsxnyshp
	yBmFXI5z9CoKoO0puy9vT1yfeEGMGtF55Wry8ZwdL/WVcNAzyNWtNIdlYBXtacrK
	uqSN3W/XDtEjOKrxRIhOisu7fNbAlM4x+ODy+kcz3aLelNpmTc35kMhUpAodWodu
	TbWcvikVBr4Gr54GJo9HQlY5d3y6hXUPedgPryxSwWVJgKt+jMUE3fh26osodF8l
	dxCGtclBnzZbwFT8Bc+u9GtkdRxp+qn4xZYYpHzw+ojeGFQwFuMGZ8g04AfZrGpp
	eq+GTZEzCEdAML8p+SNEdWwN7FFkVe56pOXveyQyA2YeAC3tA5CKlrf8ljBFtbgy
	/JBO0w==
Received: from nasanppmta04.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 442f2kr5mb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 09 Jan 2025 14:20:31 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 509EKUnK031250
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 9 Jan 2025 14:20:30 GMT
Received: from [10.253.12.10] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Thu, 9 Jan 2025
 06:20:24 -0800
Message-ID: <05e04632-5d79-4f07-bf29-a49c86910d6e@quicinc.com>
Date: Thu, 9 Jan 2025 22:20:22 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v2 07/14] net: ethernet: qualcomm: Initialize PPE
 queue settings
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
        Andrew Lunn
	<andrew+netdev@lunn.ch>,
        "David S. Miller" <davem@davemloft.net>,
        "Eric
 Dumazet" <edumazet@google.com>,
        Jakub Kicinski <kuba@kernel.org>, Paolo Abeni
	<pabeni@redhat.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski
	<krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Lei Wei
	<quic_leiwei@quicinc.com>,
        Suruchi Agarwal <quic_suruchia@quicinc.com>,
        Pavithra R <quic_pavir@quicinc.com>, Simon Horman <horms@kernel.org>,
        Jonathan Corbet <corbet@lwn.net>, Kees Cook <kees@kernel.org>,
        "Gustavo A. R.
 Silva" <gustavoars@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>
CC: <linux-arm-msm@vger.kernel.org>, <netdev@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-doc@vger.kernel.org>, <linux-hardening@vger.kernel.org>,
        <quic_kkumarcs@quicinc.com>, <quic_linchen@quicinc.com>,
        <srinivas.kandagatla@linaro.org>, <bartosz.golaszewski@linaro.org>,
        <john@phrozen.org>
References: <20250108-qcom_ipq_ppe-v2-0-7394dbda7199@quicinc.com>
 <20250108-qcom_ipq_ppe-v2-7-7394dbda7199@quicinc.com>
 <4916d329-4513-46e1-ac1c-34628f335dde@wanadoo.fr>
Content-Language: en-US
From: Jie Luo <quic_luoj@quicinc.com>
In-Reply-To: <4916d329-4513-46e1-ac1c-34628f335dde@wanadoo.fr>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: Th-8zKUQAxnJm7Q40eHqq-IqUg5sTjAP
X-Proofpoint-ORIG-GUID: Th-8zKUQAxnJm7Q40eHqq-IqUg5sTjAP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 adultscore=0 mlxlogscore=968 clxscore=1015 lowpriorityscore=0
 impostorscore=0 spamscore=0 phishscore=0 bulkscore=0 malwarescore=0
 suspectscore=0 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2501090115



On 1/9/2025 3:29 AM, Christophe JAILLET wrote:
> Le 08/01/2025 à 14:47, Luo Jie a écrit :
>> Configure unicast and multicast hardware queues for the PPE
>> ports to enable packet forwarding between the ports.
>>
>> Each PPE port is assigned with a range of queues. The queue ID
>> selection for a packet is decided by the queue base and queue
>> offset that is configured based on the internal priority and
>> the RSS hash value of the packet.
>>
>> Signed-off-by: Luo Jie <quic_luoj@quicinc.com>
> 
> ...
> 
>> +        /* Initialize the queue offset of RSS hash as 0 to avoid the
>> +         * random hardware value that will lead to the unexpected
>> +         * destination queue generated.
>> +         */
>> +        index = 0;
> 
> Useless.

Will remove it.

> 
>> +        for (index = 0; index < PPE_QUEUE_HASH_NUM; index++) {
>> +            ret = ppe_queue_ucast_offset_hash_set(ppe_dev, port_id,
>> +                                  index, 0);
>> +            if (ret)
>> +                return ret;
>> +        }
>> +    }
>> +
>> +    return 0;
>> +}
> 
> ...
> 
> CJ
> 


