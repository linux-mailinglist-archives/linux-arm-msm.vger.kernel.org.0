Return-Path: <linux-arm-msm+bounces-49867-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 80E28A49D50
	for <lists+linux-arm-msm@lfdr.de>; Fri, 28 Feb 2025 16:24:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D3FB53ABDFA
	for <lists+linux-arm-msm@lfdr.de>; Fri, 28 Feb 2025 15:24:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6975225DD1D;
	Fri, 28 Feb 2025 15:24:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="drmekr33"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9667C1EF389;
	Fri, 28 Feb 2025 15:24:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740756277; cv=none; b=rwp+9Naf77fuTxLNcn3zR+shgtZOU2KtAfAbgV8v98KtdzIPm6U2tmr/dt8WCkHr6dqGb+HRODXMSJwcSQqFdfn9ZlZVkctHCKR6veXuEa5zrfcqoICMG4hBV3yONrUw5jr1EAjTPycp4ZY0P25mQTz9Jb5B2v2UYD2tGWT2mgM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740756277; c=relaxed/simple;
	bh=fdHTrCQaf2WzOLBugDNFz6q3/+1PV3s2MWhFiZNu8XM=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:CC:References:
	 In-Reply-To:Content-Type; b=uoISdNXrho/S1q6mRyXXd+OtFGcfrJJ8yzJIbu80GRn0uoYTp+tQugpcERECtDoK1YvEb+InKBmSxnFqoHq3tG3yMV2dTeR6ZfVz5DLiDzkHtIoPwzW0XN/nieiyyRa/yjg0O2WyTmMLQglHHbJ7PyJnS65YlPpJBA2uZ+6EUeI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=drmekr33; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51SAXHQx011045;
	Fri, 28 Feb 2025 15:24:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	YmeFxvI2yR6UVdzo02dmsTmlBlfgTFLRHjuSM9wlVnU=; b=drmekr33e4XmpAmW
	cv3Q/ofRggDSZweRvqclJzhHIcH056c0rJv+ajgKQ0ebJ9YoDi31lBYp3YcmI2Y7
	QIlewOMcA/AL9etvEB4ku2/JlNlcziC+hLJhSOOxhxVUhuwjkFVMuxHV8bLa5hTN
	Nz4Cs3rvZhp5bFwWDtWv8Mm3Ybh2xCTPENbhuXHq/gpShoeOTJ2jg7WLRMxhNryt
	vOKUHu3qeqAg6FbwTdurAh3C3rw1IZHg9Ko5PYl9cMKb5kuGreeUamlBIysDCv3U
	eBgRhusfKsvOc+VGHzQ/7JHeqrkK0g+dLugGshNgjvU5mQC497ULLMa9gQwZbKON
	Od/ssg==
Received: from nasanppmta01.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 451prk9tse-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 28 Feb 2025 15:24:18 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 51SFOHfh025285
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 28 Feb 2025 15:24:17 GMT
Received: from [10.253.33.252] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Fri, 28 Feb
 2025 07:24:10 -0800
Message-ID: <36fbefff-a985-4aba-8085-4a6e139b88ba@quicinc.com>
Date: Fri, 28 Feb 2025 23:24:07 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Jie Luo <quic_luoj@quicinc.com>
Subject: Re: [PATCH net-next v3 06/14] net: ethernet: qualcomm: Initialize the
 PPE scheduler settings
To: Andrew Lunn <andrew@lunn.ch>
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
        "Simon
 Horman" <horms@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
        Kees Cook
	<kees@kernel.org>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        "Philipp
 Zabel" <p.zabel@pengutronix.de>,
        <linux-arm-msm@vger.kernel.org>, <netdev@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-doc@vger.kernel.org>, <linux-hardening@vger.kernel.org>,
        <quic_kkumarcs@quicinc.com>, <quic_linchen@quicinc.com>,
        <srinivas.kandagatla@linaro.org>, <bartosz.golaszewski@linaro.org>,
        <john@phrozen.org>
References: <20250209-qcom_ipq_ppe-v3-0-453ea18d3271@quicinc.com>
 <20250209-qcom_ipq_ppe-v3-6-453ea18d3271@quicinc.com>
 <f8d30195-1ee9-42f2-be82-819c7f7bd219@lunn.ch>
 <877b3796-3afc-4f3e-a0f5-ec1a6174a921@quicinc.com>
 <d0cf941b-db9b-451c-904f-468ffb11e2f7@lunn.ch>
Content-Language: en-US
In-Reply-To: <d0cf941b-db9b-451c-904f-468ffb11e2f7@lunn.ch>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: alDS7pMMps2ZgDfqbsolwbFnKzYXLJQj
X-Proofpoint-ORIG-GUID: alDS7pMMps2ZgDfqbsolwbFnKzYXLJQj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-28_04,2025-02-27_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0
 lowpriorityscore=0 priorityscore=1501 suspectscore=0 impostorscore=0
 phishscore=0 spamscore=0 mlxscore=0 mlxlogscore=701 malwarescore=0
 adultscore=0 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2502100000 definitions=main-2502280112



On 2/20/2025 11:12 PM, Andrew Lunn wrote:
>> As a general rule, we have tried to keep the data structure definition
>> accurately mirror the hardware table design, for easier understanding
>> and debug ability of the code.
> 
> Could you point me at the datasheet which describes the table?
> 
> 	Andrew

Hi Andrew,
We are under process of requesting our Ops team to release the datasheet
of IPQ9574. This may take a few days.

In the mean time, let me provide the description of this register table
to clarify.

Bits	Field Name	Access	Description
31:12	Reserve		RW	Reserved field
11:8	SEC_PORT_NUM	RW	Second port ID
7	Reserve		RW	Reserved field
6	SEC_PORT_VALID	RW	Second port valid or not
5	VALID		RW	Valid or not
4	DIR		RW	Egress or Ingress
3:0	PORT_NUM	RW	Port ID

Thanks.

