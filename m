Return-Path: <linux-arm-msm+bounces-43874-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 4423CA00913
	for <lists+linux-arm-msm@lfdr.de>; Fri,  3 Jan 2025 13:10:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 16A99160E14
	for <lists+linux-arm-msm@lfdr.de>; Fri,  3 Jan 2025 12:10:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 268BD1F9F4E;
	Fri,  3 Jan 2025 12:10:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="T/6hErGR"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B5D463CF;
	Fri,  3 Jan 2025 12:10:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735906229; cv=none; b=ncdzTt5usMdY2bkuvRmGmWPQXKW/gDVmF++1zzMcVfKBSS9tnlhR1+DJMFCSbfBk2pKBzcf0eTeV7s3Y1HJ41+2wS/FC/vCHYxoN6RA+daXbcearQ8tCl1XCy0FjrPeQEz1ccCxpH3epMS2gm67XYMo+eWs5fSgp2zN6gCLxApM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735906229; c=relaxed/simple;
	bh=wLV5Xn6f3CdUs6eWelhECh6Eb+61ZGv6Pj50x1AuYK4=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=imLV9rZpCZ3sFOXqyJF3WjPPjjGXkQeMqGpfrZ7FSyF3Tvoww812qH8ouXGWTXnKo4wFstyGzwOGGg/P/CMWjldCBk/tRQ2kFy325wUUyeWCeMpWgYao+DQYfm5UW9KBbeLN1gaeHv/Z7kFq4yxqlzn4nHbrsd5cAfMwpW9RgsU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=T/6hErGR; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 503C4F9o027125;
	Fri, 3 Jan 2025 12:10:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	qDotob+KLOgE3EV+Z10TccPZex4ox/Ag0q3jKEja434=; b=T/6hErGR2sCV2LPs
	ia2Ko5r8XXJ9tisVC1kL5XSwCLv0N+MBxk4W8VKEZfy0zqEK70RJkQ7UeV/x2MKQ
	Go0XocCL9rw+aQJqxnLLxh4dygqngzosNtrsrCFYMGdVAXUwS8gdF6W7Y286fgyj
	agT68XxDvjlAscWys/Ell2zYnGQoI9/S4bHOkzoxAoYDev9gRmD+pYhJx177fSlw
	tmQxvOBT6jefBkYy5lgyEi+IgWK7xPgqBnPk4clq7iW6fZT4oR8bNXdYMcag24ko
	ihBvxHQdqhBRpPNxOc7PMWZXtf/4IkI3zY2x1pdT6RtoPYp1CjdOK/ylHMjB4PTt
	WptCbg==
Received: from nasanppmta02.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43xfjk80d3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 03 Jan 2025 12:10:22 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 503CALik019953
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 3 Jan 2025 12:10:21 GMT
Received: from [10.50.14.170] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Fri, 3 Jan 2025
 04:10:17 -0800
Message-ID: <7752fbd7-7888-4943-9202-4ad211160e02@quicinc.com>
Date: Fri, 3 Jan 2025 17:40:14 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V2 0/2] mailbox: tmel-qmp: Introduce QCOM TMEL QMP mailbox
 driver
To: Krzysztof Kozlowski <krzk@kernel.org>, <jassisinghbrar@gmail.com>,
        <robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <andersson@kernel.org>,
        <konradybcio@kernel.org>, <manivannan.sadhasivam@linaro.org>,
        <dmitry.baryshkov@linaro.org>
References: <20241231054900.2144961-1-quic_srichara@quicinc.com>
 <a4678676-39e1-4df8-998e-a91e97ae0a4f@kernel.org>
Content-Language: en-US
From: Sricharan Ramabadhran <quic_srichara@quicinc.com>
In-Reply-To: <a4678676-39e1-4df8-998e-a91e97ae0a4f@kernel.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: h2Og-hjvgfxeuU1XvwJ_FVJcJq8mu6BE
X-Proofpoint-GUID: h2Og-hjvgfxeuU1XvwJ_FVJcJq8mu6BE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 lowpriorityscore=0
 malwarescore=0 priorityscore=1501 mlxlogscore=753 spamscore=0
 clxscore=1015 bulkscore=0 suspectscore=0 impostorscore=0 phishscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2501030107



On 12/31/2024 1:27 PM, Krzysztof Kozlowski wrote:
> On 31/12/2024 06:48, Sricharan R wrote:
>> Since clients like same rproc driver use SCM/TMEL across socs, the goal here was to abstract the
>> TMEL-QMP SS functionality, so that clients should be able to connect and send messages with
>> a common API.
>>
>> [v1] RFC Post
>>
>> [v2]
>>       Added HW description in the bindings patch.
>>       Fixed review comments for bindings from Krzysztof and Dmitry
> 
> Which ones? This is just too vague.
ok, i mentioned detailed in respective patches.
will have detailed in Cover letter also for next version.

Regards,
  Sricharan

