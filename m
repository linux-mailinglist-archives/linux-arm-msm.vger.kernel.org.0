Return-Path: <linux-arm-msm+bounces-44575-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 06A6AA076C8
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Jan 2025 14:12:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 01E777A3983
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Jan 2025 13:12:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B419D217F28;
	Thu,  9 Jan 2025 13:11:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="OFEaCKIW"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E2F1BA2E;
	Thu,  9 Jan 2025 13:11:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736428310; cv=none; b=njXe2XVwwYL6yrem/XY/ojeoa8NyQOyZ5EeTDE+Q48rJ7+EfoEpsxlh/jqBpDwE5LstyjSb89R2+hVp+0mOJ90LVqyZX6Cw94ePMWl/1SGRQkhuqjadXXKkVTWZV214B26ZW6nII09ZFi9ppTYp45OAsmadUJB21K20CAfL0gHA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736428310; c=relaxed/simple;
	bh=WNqCG5aj1Z5Z6Vavi0yXahgnOvyN0Yo7pSJg84dzMJc=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=av9+99JZ+ihsuZ/waUurm0EmmVPtikMSbBID0xJHQelZTRYVZYr4H4SOZDuj3XdK3mRCmWN95Yy54PMUwsOdWrinYACR2z9MMCMVw3RbYwakbP+ZW4peTUvOZnLqJIR86V03h5jni2VIQqMEYHhKs9VELsdO46Je6+NmPts6KGI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=OFEaCKIW; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5094gtAv018495;
	Thu, 9 Jan 2025 13:11:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	fdSr1sOO2d/Y41hZnhsfJ24JQqQV44b/b/fbT7QktRI=; b=OFEaCKIWBiZaHKEn
	Q2RJsNyC5Y/IPUJZo3YQJoqqEAiw+TID72Kp+ZdZJMFNt7MDz7RCeJ0l5cGdFzCx
	yJu4J3yI4ja+vfNqK8zPN/sLbBwxK7hPfBdbPcLbhVrCcaqpVUchA4hkC4XCfbam
	qWUYxzWlhftTCGc/9R3XyNdwsyzCkmyrDrkZOTcYA5M8NJN4MZq4GxEO/9lBsjl3
	18O2wFSWzermgNBe2qUknkqN7XU6jIxkfHubkRDkhrPbq/RR22vOLu8eCFp+mfIH
	StJo3Jq2r26gfg41EGm5ou8SR1z/gYmB7qIA08cRQPRTgtQc3QbfQeKidCpmTFJB
	8CfWvw==
Received: from nasanppmta04.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4427nws4tv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 09 Jan 2025 13:11:32 +0000 (GMT)
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 509DBVmU025772
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 9 Jan 2025 13:11:31 GMT
Received: from [10.253.38.216] (10.80.80.8) by nasanex01a.na.qualcomm.com
 (10.52.223.231) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Thu, 9 Jan 2025
 05:11:26 -0800
Message-ID: <8ac3167c-c8aa-4ddb-948f-758714df7495@quicinc.com>
Date: Thu, 9 Jan 2025 21:11:05 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v4 3/5] net: pcs: qcom-ipq9574: Add PCS
 instantiation and phylink operations
To: Simon Horman <horms@kernel.org>
CC: Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller"
	<davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski
	<kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, Rob Herring
	<robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
	<conor+dt@kernel.org>, Andrew Lunn <andrew@lunn.ch>,
        Heiner Kallweit
	<hkallweit1@gmail.com>,
        Russell King <linux@armlinux.org.uk>, <netdev@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <quic_kkumarcs@quicinc.com>,
        <quic_suruchia@quicinc.com>, <quic_pavir@quicinc.com>,
        <quic_linchen@quicinc.com>, <quic_luoj@quicinc.com>,
        <srinivas.kandagatla@linaro.org>, <bartosz.golaszewski@linaro.org>,
        <vsmuthu@qti.qualcomm.com>, <john@phrozen.org>
References: <20250108-ipq_pcs_net-next-v4-0-0de14cd2902b@quicinc.com>
 <20250108-ipq_pcs_net-next-v4-3-0de14cd2902b@quicinc.com>
 <20250108100358.GG2772@kernel.org>
Content-Language: en-US
From: Lei Wei <quic_leiwei@quicinc.com>
In-Reply-To: <20250108100358.GG2772@kernel.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: Jt4ELdp5GQdwqa7zj0rpHoY5rcng5sFq
X-Proofpoint-GUID: Jt4ELdp5GQdwqa7zj0rpHoY5rcng5sFq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 suspectscore=0 phishscore=0 bulkscore=0 adultscore=0 mlxlogscore=756
 mlxscore=0 clxscore=1011 impostorscore=0 spamscore=0 priorityscore=1501
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2501090105



On 1/8/2025 6:03 PM, Simon Horman wrote:
> On Wed, Jan 08, 2025 at 10:50:26AM +0800, Lei Wei wrote:
>> This patch adds the following PCS functionality for the PCS driver
>> for IPQ9574 SoC:
>>
>> a.) Parses PCS MII DT nodes and instantiate each MII PCS instance.
>> b.) Exports PCS instance get and put APIs. The network driver calls
>> the PCS get API to get and associate the PCS instance with the port
>> MAC.
>> c.) PCS phylink operations for SGMII/QSGMII interface modes.
>>
>> Signed-off-by: Lei Wei <quic_leiwei@quicinc.com>
> 
> ...
> 
>> +static int ipq_pcs_enable(struct phylink_pcs *pcs)
>> +{
>> +	struct ipq_pcs_mii *qpcs_mii = phylink_pcs_to_qpcs_mii(pcs);
>> +	struct ipq_pcs *qpcs = qpcs_mii->qpcs;
>> +	int index = qpcs_mii->index;
>> +	int ret;
>> +
>> +	ret = clk_prepare_enable(qpcs_mii->rx_clk);
>> +	if (ret) {
>> +		dev_err(qpcs->dev, "Failed to enable MII %d RX clock\n", index);
>> +		return ret;
>> +	}
>> +
>> +	ret = clk_prepare_enable(qpcs_mii->tx_clk);
>> +	if (ret) {
>> +		dev_err(qpcs->dev, "Failed to enable MII %d TX clock\n", index);
>> +		return ret;
> 
> Hi Lei Wei,
> 
> I think you need something like the following to avoid leaking qpcs_mii->rx_clk.
> 
> 		goto err_disable_unprepare_rx_clk;
> 	}
> 
> 	return 0;
> 
> err_disable_unprepare_rx_clk:
> 	clk_disable_unprepare(qpcs_mii->rx_clk);
> 	return ret;
> }
> 
> Flagged by Smatch.
> 

We had a conversation with Russell King in v2 that even if the phylink 
pcs enable sequence encounters an error, it does not unwind the steps it 
has already done. So we removed the call to unprepare in case of error 
here, since an error here is essentially fatal in this path with no 
unwind possibility.

https://lore.kernel.org/all/38d7191f-e4bf-4457-9898-bb2b186ec3c7@quicinc.com/

However to satisfy this smatch warning/error, we may need to revert back 
to the adding the unprepare call in case of error. Request Russel to 
comment as well if this is fine.

Is it possible to share the log/command-options of the smatch failure so 
that we can reproduce this? Thanks.


>> +	}
>> +
>> +	return 0;
>> +}
> 
> ...
> 


