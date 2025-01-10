Return-Path: <linux-arm-msm+bounces-44752-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C8D4A095E0
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Jan 2025 16:37:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 66C2F16B14C
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Jan 2025 15:37:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CF090211A36;
	Fri, 10 Jan 2025 15:37:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="fFtDnhcF"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03077211A2D;
	Fri, 10 Jan 2025 15:37:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736523445; cv=none; b=Pcg5ng9gxOtRGwUX0DiA0OsoIlDhHV5LVRprT6OP6OdK3d91klkkV4J0hoAdtBRgY/mWRDvZdoi8HLzXihvofZNoEcfPXy3IHTXD0W6SeTVH9NWg0x8S2QX+oEK8tvOZ0x/AvnD+tpPs9HOC+VL3aiEx73FIWs2PucgFZtKerMQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736523445; c=relaxed/simple;
	bh=Z/bsfZHLqn7sUe4vDHhHfLRhvjd61kqXFBkhmq0D8vg=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=qVKq8fozb9AxdvRhBL1OvWlyZzGj6Gc1brPSE4/nfX3qOLEHwiZaUQ5HkQHPPGjekA3DzHROpDqH9E1o5j5BIkVhQYMxUMKl3+NqzlU+Tk/Zz6WeaUAGrciTG7Sf/z+V3A5OkL5erBzjszqIxW5C3CSNeXbthseO6Kt1vLMfoTA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=fFtDnhcF; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50A9wnHU012011;
	Fri, 10 Jan 2025 15:37:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	pcaB471v/EE7pbHbVZ/gzy+IGGkuqwQSaMJRbgn0Bv8=; b=fFtDnhcFkqijZ/eK
	thCE/FMs6C0ACoa4HyH4mKN4krKBMCGkEaliR8KUMNU8gNnH8Idr8w0W+XDGTwCM
	jFKarnmygA6xW8urvPVl6iEZc/CuYLwXumZQ8Ng+9BfgqSU+y3Kz2Lq2YbvYbxfv
	7FmoiqkZMgSf2QQulmJJ1FX7DyHQ7Rr4y5GjTJyHBmkwAVDkFPi3GHRsqqv7v4cc
	R3ylGnrIile8BSUc0rvz37itx6UrevJ0B7tDZQSaib2/IfUHHM0QlwkxpA/oDwc7
	NyKwNUvTXLUdWtSCsKRQ6SVcsB1yB5XQeBGRgWctYqOnJRRd83kXUwMkSjNKHcC9
	LItTUQ==
Received: from nasanppmta04.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4431d48vuh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 10 Jan 2025 15:37:07 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 50AFb6qP002889
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 10 Jan 2025 15:37:06 GMT
Received: from [10.253.12.10] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Fri, 10 Jan
 2025 07:37:00 -0800
Message-ID: <50a42c90-bbe7-4bdd-90dd-c8bfe4d4051d@quicinc.com>
Date: Fri, 10 Jan 2025 23:36:58 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v2 08/14] net: ethernet: qualcomm: Initialize PPE
 service code settings
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
	<conor+dt@kernel.org>, Lei Wei <quic_leiwei@quicinc.com>,
        Suruchi Agarwal
	<quic_suruchia@quicinc.com>,
        Pavithra R <quic_pavir@quicinc.com>,
        "Jonathan
 Corbet" <corbet@lwn.net>, Kees Cook <kees@kernel.org>,
        "Gustavo A. R. Silva"
	<gustavoars@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        <linux-arm-msm@vger.kernel.org>, <netdev@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-doc@vger.kernel.org>, <linux-hardening@vger.kernel.org>,
        <quic_kkumarcs@quicinc.com>, <quic_linchen@quicinc.com>,
        <srinivas.kandagatla@linaro.org>, <bartosz.golaszewski@linaro.org>,
        <john@phrozen.org>
References: <20250108-qcom_ipq_ppe-v2-0-7394dbda7199@quicinc.com>
 <20250108-qcom_ipq_ppe-v2-8-7394dbda7199@quicinc.com>
 <20250109175845.GQ7706@kernel.org>
Content-Language: en-US
From: Jie Luo <quic_luoj@quicinc.com>
In-Reply-To: <20250109175845.GQ7706@kernel.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: GDOoK8I8GJC-t7MO56NwjeOuF5zGrryY
X-Proofpoint-GUID: GDOoK8I8GJC-t7MO56NwjeOuF5zGrryY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 adultscore=0
 malwarescore=0 phishscore=0 mlxlogscore=999 spamscore=0 mlxscore=0
 lowpriorityscore=0 clxscore=1015 priorityscore=1501 suspectscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2501100122



On 1/10/2025 1:58 AM, Simon Horman wrote:
> On Wed, Jan 08, 2025 at 09:47:15PM +0800, Luo Jie wrote:
>> PPE service code is a special code (0-255) that is defined by PPE for
>> PPE's packet processing stages, as per the network functions required
>> for the packet.
>>
>> For packet being sent out by ARM cores on Ethernet ports, The service
>> code 1 is used as the default service code. This service code is used
>> to bypass most of packet processing stages of the PPE before the packet
>> transmitted out PPE port, since the software network stack has already
>> processed the packet.
>>
>> Signed-off-by: Luo Jie <quic_luoj@quicinc.com>
> 
> ...
> 
>> diff --git a/drivers/net/ethernet/qualcomm/ppe/ppe_config.h b/drivers/net/ethernet/qualcomm/ppe/ppe_config.h
> 
> ...
> 
>> +/**
>> + * struct ppe_sc_bypss - PPE service bypass bitmaps
> 
> nit: struct ppe_sc_bypass

OK. Will correct it.

> 
>> + * @ingress: Bitmap of features that can be bypassed on the ingress packet.
>> + * @egress: Bitmap of features that can be bypassed on the egress packet.
>> + * @counter: Bitmap of features that can be bypassed on the counter type.
>> + * @tunnel: Bitmap of features that can be bypassed on the tunnel packet.
>> + */
>> +struct ppe_sc_bypass {
>> +	DECLARE_BITMAP(ingress, PPE_SC_BYPASS_INGRESS_SIZE);
>> +	DECLARE_BITMAP(egress, PPE_SC_BYPASS_EGRESS_SIZE);
>> +	DECLARE_BITMAP(counter, PPE_SC_BYPASS_COUNTER_SIZE);
>> +	DECLARE_BITMAP(tunnel, PPE_SC_BYPASS_TUNNEL_SIZE);
>> +};
> 
> ...


