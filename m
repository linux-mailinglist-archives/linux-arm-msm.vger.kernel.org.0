Return-Path: <linux-arm-msm+bounces-41969-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id E30C79F09B7
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Dec 2024 11:38:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 94BED282AEA
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Dec 2024 10:38:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 76AD21C07C1;
	Fri, 13 Dec 2024 10:38:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="f9+Ywsbq"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0ACF81B652B;
	Fri, 13 Dec 2024 10:38:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734086284; cv=none; b=cYmuGmEfVoGJQMr3IRB/QUCtLTrF0MKsXYPBnGgkh63Ow3i3kP4pOEIMjOnn3cY23IehjKD5x/YutDuVJ5xJSFbfGHhlw8Za4Uji3WUsaYKhWgu2tccLMKw4ROa5hVZJAdhNu6uuXQbR1YcJDIpey+/f/Xm8hxc4a3eVb0zjBxQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734086284; c=relaxed/simple;
	bh=Vst3UEO/AkyKcTH51fm7zrlBtMdQx/Y5nU6IaFXGFFE=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=aw94XqpO8tG1ND2ZKN7R5b/n5kDMKq3Yio6XUy7KD3+Xxu6XjQH0p6zBVhftadIn/IN/DWo4j55wtgQyOpiQQ2oHMlcDITn2PyPnvnDNZKrSeY3j55zx7yWFttJRwJKwP9NE7LDeyFsY84PzJpSXr5xUB+JzMPxq60bR5GPKIyQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=f9+Ywsbq; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BCNBCaX028083;
	Fri, 13 Dec 2024 10:38:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	eCo10zrBab9VoOWQEyUUBgEHlj+2qNvHmPzat5FHSbc=; b=f9+Ywsbqfnkx3hU8
	NV/4YXCaSWV0slP5Y3z/2t1m6fYWQGQq39WFLYViZtMYol22CrarLYefKeq5j17O
	hQTlD0t+HqOUOPkfCbQ7oU18katNcPwZxaMRmpR9wBZLSfpXjMr93h41LyB4fLIR
	KSxEFErD+0rTRtkvnhLNyjeUhpw2v6HlZoWa9O2snybmHZt3RgPbJvnQH39A1i4m
	LPuyTTAMfkw3ePBuIGmofc+Vs5litQgVhebIwlQMLnrsKvIvAcN9GvPjKsMQWvyy
	6Tzmj3/1aKbgfcqyPmCgtqE1fB1sqeJ+XOzIyScVf3ssgliYB5VLtE2aoiS6oIAB
	cItChA==
Received: from nasanppmta03.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43fxw4uavu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 13 Dec 2024 10:38:00 +0000 (GMT)
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com [10.45.79.139])
	by NASANPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4BDAc0Bf011243
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 13 Dec 2024 10:38:00 GMT
Received: from [10.239.133.118] (10.80.80.8) by nasanex01c.na.qualcomm.com
 (10.45.79.139) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Fri, 13 Dec
 2024 02:37:54 -0800
Message-ID: <69a01461-0468-44f3-9555-944f9b951c91@quicinc.com>
Date: Fri, 13 Dec 2024 18:37:51 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] arm64: dts: qcom: Add support for secondary USB
 node on QCS615
To: Krzysztof Kozlowski <krzk@kernel.org>,
        Bjorn Andersson
	<andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring
	<robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
	<conor+dt@kernel.org>
CC: <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <kernel@quicinc.com>,
        Krishna Kurapati
	<krishna.kurapati@oss.qualcomm.com>
References: <20241211-add_usb_host_mode_for_qcs615-v2-0-2c4abdf67635@quicinc.com>
 <20241211-add_usb_host_mode_for_qcs615-v2-1-2c4abdf67635@quicinc.com>
 <5770256d-0227-423d-9b6e-4db834284552@kernel.org>
Content-Language: en-US
From: Song Xue <quic_songxue@quicinc.com>
In-Reply-To: <5770256d-0227-423d-9b6e-4db834284552@kernel.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01c.na.qualcomm.com (10.45.79.139)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: 6KzPi_zGwo41QdxRlwNl8Ysi6j_6djRC
X-Proofpoint-GUID: 6KzPi_zGwo41QdxRlwNl8Ysi6j_6djRC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0
 impostorscore=0 clxscore=1011 phishscore=0 spamscore=0 priorityscore=1501
 malwarescore=0 mlxscore=0 bulkscore=0 lowpriorityscore=0 mlxlogscore=749
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412130073



On 12/13/2024 3:54 PM, Krzysztof Kozlowski wrote:
> On 11/12/2024 09:26, Song Xue wrote:
>> From: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
>>
>> Add support for secondary USB controller and its high-speed phy
>> on QCS615.
>>
>> Signed-off-by: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
>> Co-developed-by: Song Xue <quic_songxue@quicinc.com>
>> Signed-off-by: Song Xue <quic_songxue@quicinc.com>
> 
> 
> Please use subject prefixes matching the subsystem. You can get them for
> example with `git log --oneline -- DIRECTORY_OR_FILE` on the directory
> your patch is touching. For bindings, the preferred subjects are
> explained here:
> https://www.kernel.org/doc/html/latest/devicetree/bindings/submitting-patches.html#i-for-patch-submitters
> 
>
Let me fix in next version.

Thanks
Song >
> Best regards,
> Krzysztof




