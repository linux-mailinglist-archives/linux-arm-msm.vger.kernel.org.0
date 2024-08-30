Return-Path: <linux-arm-msm+bounces-30315-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 118D1966C24
	for <lists+linux-arm-msm@lfdr.de>; Sat, 31 Aug 2024 00:16:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C232A28466F
	for <lists+linux-arm-msm@lfdr.de>; Fri, 30 Aug 2024 22:16:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 88D1C1C1749;
	Fri, 30 Aug 2024 22:16:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="BiJI/+ia"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5CD91BDAB1;
	Fri, 30 Aug 2024 22:16:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725056177; cv=none; b=NNp4/diLn/EPJPDLUtmh4bugKuLWRsmuwbNMmjFwXpsuYNBoQtcIqGfgE26P/OQL9zLEDxCq1DsjC8EhJajWhPnJHmKWIYbe/0X+HJv8/e+MyypPtHoNKd8FjB2sOxvau5n1akGETEwlJk/dVXkdQOOlrFsdO/1ZxZpW3jZpuQ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725056177; c=relaxed/simple;
	bh=eiAiaAMxrnwkQh8OZNgENo2OCIGfzf4Ul9qhg+3zyfY=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=QTq1jHFT8kZLQJMI/7JEKgoIT+cuCU3c1DHR/kjPhmxbaAtII/hrlHcR3qnroYamIMPCIXozSYpshPMQFHklRJxwAR7XOipmj2tBvZzOOfv2eHdd/GWbMKLMiFgVEph7akFdU9aeVg7hBfn8w8+LZCmGKw5emGsn4mkuU43Jbqg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=BiJI/+ia; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 47UFsQJk023319;
	Fri, 30 Aug 2024 22:16:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	naL+DF9ioWHaYPmy57myekiuG522s2M1hb98q4d0hHk=; b=BiJI/+iae4Z7E9jd
	nyfk1m73von9yTfpP9jgnjoNzImr1W6Xu6KiNyybLgpxlj6+Fxhkwlzj2+L59lhW
	8lXaVRUqojol6WnJWKf+jt8z4zlMY/uynqCWxAI9Dcku4soOMiEwiu++8VNd6NSa
	1/IBC/cjxnYugpwYM9lQpfS6liHs8PYV6/9CLG1QA5D58/bYszfFrGTj3iYbKeY9
	1WSAutdpTbroE/t6xNO9wpxRUbVhIo3jAAKblVnjhPc5Q8L787iLKkNC2HWwI58T
	1wmMjfAY4Qzl2Aw4vz5/3CW/jOufE5tht1JQ23FJaXtSV5bcRUUAmXKm7/RJOvB4
	qxZIjw==
Received: from nasanppmta04.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 41a612r7hr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 30 Aug 2024 22:16:01 +0000 (GMT)
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 47UMG05Y032297
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 30 Aug 2024 22:16:00 GMT
Received: from [10.110.126.215] (10.80.80.8) by nasanex01a.na.qualcomm.com
 (10.52.223.231) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Fri, 30 Aug
 2024 15:15:59 -0700
Message-ID: <02138a65-4cd7-4423-886d-35ad86afcff0@quicinc.com>
Date: Fri, 30 Aug 2024 15:15:58 -0700
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 1/7] dt-bindings: arm: Add support for Coresight TGU
 trace
To: songchai <quic_songchai@quicinc.com>,
        Suzuki K Poulose
	<suzuki.poulose@arm.com>,
        Mike Leach <mike.leach@linaro.org>, James Clark
	<james.clark@arm.com>,
        Alexander Shishkin
	<alexander.shishkin@linux.intel.com>,
        Andy Gross <agross@kernel.org>,
        "Bjorn
 Andersson" <andersson@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        "Krzysztof Kozlowski" <krzk+dt@kernel.org>,
        Conor Dooley
	<conor+dt@kernel.org>
CC: <linux-kernel@vger.kernel.org>, <coresight@lists.linaro.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>
References: <20240830092311.14400-1-quic_songchai@quicinc.com>
 <20240830092311.14400-2-quic_songchai@quicinc.com>
Content-Language: en-US
From: Trilok Soni <quic_tsoni@quicinc.com>
In-Reply-To: <20240830092311.14400-2-quic_songchai@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: exG77MoKoMk6EyX4HCq-mfpniNBrNMYr
X-Proofpoint-ORIG-GUID: exG77MoKoMk6EyX4HCq-mfpniNBrNMYr
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-30_11,2024-08-30_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 malwarescore=0
 phishscore=0 spamscore=0 mlxlogscore=712 adultscore=0 impostorscore=0
 mlxscore=0 suspectscore=0 bulkscore=0 lowpriorityscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2407110000 definitions=main-2408300173

On 8/30/2024 2:23 AM, songchai wrote:
>  |                         |                     |     |             |
>  |-------------------------|                     |     |-------------|
>  |                         |                     |     | prioroty[3] |


s/prioroty/priority 

-- 
---Trilok Soni


