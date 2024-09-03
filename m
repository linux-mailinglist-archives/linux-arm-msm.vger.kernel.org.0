Return-Path: <linux-arm-msm+bounces-30470-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B5E2969521
	for <lists+linux-arm-msm@lfdr.de>; Tue,  3 Sep 2024 09:19:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D506A1F2229E
	for <lists+linux-arm-msm@lfdr.de>; Tue,  3 Sep 2024 07:19:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 58D1820126D;
	Tue,  3 Sep 2024 07:18:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="Tct3UqMY"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C831520124C;
	Tue,  3 Sep 2024 07:18:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725347919; cv=none; b=L4gDmBNsuh2cMrn5MPS08cXmIX7sEf67GCzeREljB1ClfzYQMw1uYHP4ULa3d5tkSLrXIJErnMXoObFqhYytPMI9aPVI3bnZoejNthKiuQinGJ1YsDr6F2q/PM6KpfIAI1GgSQWAQlsFOlMQ3Fyj+rjMGytsEZAPLxSCk70l23o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725347919; c=relaxed/simple;
	bh=4IkRY2k6bnmUllOE/AWw5R7nYfRY4BDTJUOh4RLOEIc=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=UHRB+9EnuK3alOjuY7uSX/VlckdKurbo4IcYZiNZiw8SZW7u7620WZtBDNvi4pJ/vcrmqUQwckkkxQL8jmQAIiu7fJMDR7pSJXxqx5PwrwvV2c6mBYSNXWTF6Czns/MH3Fs9HaeXavHRr7KDBwfGsUHWJlu6JGViLKmI1A2TFLA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=Tct3UqMY; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 482LkmLw023940;
	Tue, 3 Sep 2024 07:18:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	jGKpBnBr4LUsVEZVPsmkDYxkLpsO2kflG6NOa7SR84E=; b=Tct3UqMY51s2x53a
	r8zcfYAxCjnUdTFvXpFqciV6Psdn3m5ONFZPEX5DlBfXYNKunNxnlUuXWK7m7WF0
	BX0vhFHtAuf277oEU8ABpej6TFAMrntf9gQB66Sl5ucxIAmROCF9iXLF9SfkXD81
	ZfHN6//b67IO07y8JYqMp0xmMQE4ImPNVu7IJbdkuUO+G6MRtmrZC9W9fvcylx1P
	obo0Kw1y1wG/DkVBJbHTmTy/bAY9ualRErAF4DLZduZN0x9iqRgAYXpsqLFEyuQ7
	Np3zOezx3xz87dZqj6Z+jBptqJhxAt5IxGI2Yt37Nw+cYTkKWDtlfyryM9ww3JRL
	+H16tQ==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 41bt4reh7t-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 03 Sep 2024 07:18:35 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4837IYYn004450
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 3 Sep 2024 07:18:34 GMT
Received: from [10.233.21.53] (10.80.80.8) by nalasex01b.na.qualcomm.com
 (10.47.209.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 3 Sep 2024
 00:18:31 -0700
Message-ID: <f6a0ef54-d986-4688-9092-f9c005cd0968@quicinc.com>
Date: Tue, 3 Sep 2024 15:18:28 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/4] soc: qcom: llcc: Add llcc configuration support for
 the QCS8300 platform
To: Krzysztof Kozlowski <krzk@kernel.org>
CC: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio
	<konradybcio@kernel.org>,
        Conor Dooley <conor@kernel.org>, Rob Herring
	<robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
References: <20240903-qcs8300_llcc_driver-v1-0-228659bdf067@quicinc.com>
 <20240903-qcs8300_llcc_driver-v1-4-228659bdf067@quicinc.com>
 <zxhhk4ldsqnxqx6hyqd46q6rllekysmlczgqqlbtl4xw3gnxkq@uaxih2z7f5y4>
Content-Language: en-US
From: Jingyi Wang <quic_jingyw@quicinc.com>
In-Reply-To: <zxhhk4ldsqnxqx6hyqd46q6rllekysmlczgqqlbtl4xw3gnxkq@uaxih2z7f5y4>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: n5l-k5re3kv_NW8z2js77dSYvyILBl2M
X-Proofpoint-ORIG-GUID: n5l-k5re3kv_NW8z2js77dSYvyILBl2M
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-02_06,2024-09-02_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 phishscore=0
 bulkscore=0 malwarescore=0 impostorscore=0 mlxlogscore=759
 priorityscore=1501 spamscore=0 mlxscore=0 clxscore=1015 adultscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2407110000 definitions=main-2409030056



On 9/3/2024 3:14 PM, Krzysztof Kozlowski wrote:
> On Tue, Sep 03, 2024 at 02:21:32PM +0800, Jingyi Wang wrote:
>> Add llcc configuration support for the QCS8300 platform.
> 
> It is LLCC. Fix it everywhere and create commits using consisting style.
> In some subjects you call it LLCC but here llcc...
> 
well noted, will fix that.
>>
>> Signed-off-by: Jingyi Wang <quic_jingyw@quicinc.com>
> 
> Best regards,
> Krzysztof
> 
Thanks,
Jingyi


