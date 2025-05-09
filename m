Return-Path: <linux-arm-msm+bounces-57483-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 45612AB1B94
	for <lists+linux-arm-msm@lfdr.de>; Fri,  9 May 2025 19:31:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E7F0E3B5C3E
	for <lists+linux-arm-msm@lfdr.de>; Fri,  9 May 2025 17:31:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A9E4B23643F;
	Fri,  9 May 2025 17:31:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="bD8fhrja"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA97E1372;
	Fri,  9 May 2025 17:31:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746811909; cv=none; b=mI+xo4T57klh78OurbeVXUPKRzRWrkBPhbwKNL7dC/dHk/n/SvPEGFYFaKwTqzsgNA7FntoisDfDmK5iprHl+8xT6aWJCr+RGw2mfGcOtjGuIMiLMp/OpQj85gRQ7Z1lAw+aeuFr7pjmf7zyPpWI9J6z2tJ3yVTmzixUgy2hXxU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746811909; c=relaxed/simple;
	bh=vUUMzSalBS7ynr0qoKcTSqzQTtVu9QNiDsNlvU5cDC0=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=NI/CzjWS71EetUIduKNXpOPMQYjA4wtA/BTVkgWK1rf/6CYrDdcq8h0d15PNNCRfqUTFCKdrmxU9OHfTlzwPOxG5eJyZawvJmNQyWzdrv0bO4eQ3FKm2Sg0S/7yJliPcdg5h6G1u3LnVTw/Vh5fQNj8AZOV/Z5jdR4uQn8cRkfQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=bD8fhrja; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 549BDwVr022888;
	Fri, 9 May 2025 17:31:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	2rvKNTkCISVKKcRe+EYEYD9XBViFVbuiyWglBNhv5/g=; b=bD8fhrjab5V09uoQ
	FXWRGIsLkWk3e0oVsKVUy8SiNLTab8dxh3IoPg56JJLnclibVBoU8okNZxpJ0mag
	kGmr7P2UqJlH7/gb96vH2I1QxgU37S5XdmaA8Y0i76to2mmQZ24R80yo403zkGX/
	U2X6CTOHhir6JXQaxZUdGcaRag4GJCNpF+27tcvfJ4tjx5llTZSOusikMV8xAxKZ
	Xm3/9QnGRo0B60jUwFdKGe7IPajfe/hJA6dwf9bQmUnCamSkH3kfZRO/2TEuT2s7
	mMOMc/r6kfEPG3K31DePPi+PmTvMXE9EDhatJ2yUl97wM8JEYtc7ibHrSc2Dc9T7
	uoclxg==
Received: from nasanppmta02.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46gnp85etw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 09 May 2025 17:31:19 +0000 (GMT)
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 549HVJHc032364
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 9 May 2025 17:31:19 GMT
Received: from [10.110.34.80] (10.80.80.8) by nasanex01a.na.qualcomm.com
 (10.52.223.231) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Fri, 9 May 2025
 10:31:18 -0700
Message-ID: <5ed2518b-6e90-4f70-9835-d7cf0600777a@quicinc.com>
Date: Fri, 9 May 2025 10:31:17 -0700
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC][PATCH 01/14] Documentation: add kmemdump
To: Eugen Hristev <eugen.hristev@linaro.org>, <linux-kernel@vger.kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <andersson@kernel.org>
CC: <linux-doc@vger.kernel.org>, <corbet@lwn.net>, <tglx@linutronix.de>,
        <mingo@redhat.com>, <rostedt@goodmis.org>, <john.ogness@linutronix.de>,
        <senozhatsky@chromium.org>, <pmladek@suse.com>, <peterz@infradead.org>,
        <mojha@qti.qualcomm.com>, <linux-arm-kernel@lists.infradead.org>,
        <vincent.guittot@linaro.org>, <konradybcio@kernel.org>,
        <dietmar.eggemann@arm.com>, <juri.lelli@redhat.com>
References: <20250422113156.575971-1-eugen.hristev@linaro.org>
 <20250422113156.575971-2-eugen.hristev@linaro.org>
Content-Language: en-US
From: Trilok Soni <quic_tsoni@quicinc.com>
In-Reply-To: <20250422113156.575971-2-eugen.hristev@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Authority-Analysis: v=2.4 cv=M7xNKzws c=1 sm=1 tr=0 ts=681e3be7 cx=c_pps
 a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=KKAkSRfTAAAA:8
 a=WUIyGSjVLVz4V11vD3kA:9 a=QEXdDO2ut3YA:10 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: I8wErxmwtbEu5RPRZpKaXr2e270vSs6l
X-Proofpoint-GUID: I8wErxmwtbEu5RPRZpKaXr2e270vSs6l
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTA5MDE3NCBTYWx0ZWRfX3ogtweTJjaJn
 918B8AzFvksZ1xvvsIDOz4MJZv4eB2KSw3hlr3QbyhMkpb+EBHI4Ga2ITeS4WCLSrHvWYHXw4Yj
 t/4MvnB2v93euP2D4631QTDDD0zQwx7yimMzE+WCw6BK7IQh/UcKQSC3Iwtu87PfX84RMHNUmaE
 SQDelVLjJd6sAdw6Ji4OORtbWzabhJeGNDsM78G+5NIwEnlWuHQqqpj6CZ9MIfZTq+uwoNsRCB7
 w61Fn0SoJZH4rKu2UU7Sck/oJpA7IKNNd0suj27EsYBwIcptE4aDefKSYe2exyFUqZcctS+bfw6
 BdmeIwv+UZI7yQIqmthufoYK0/GiKTweeKLTGMq8ndS6agwykT9gl1tpVQtP4xyUqFOLe1ko2V9
 32StSOSl9Wrzer7cCIWakbRjSVJZCCxlBwIQmb920xZpQYbUysx3m1zro+QQbvjL0NXbda4+
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-09_06,2025-05-09_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 malwarescore=0 mlxscore=0 priorityscore=1501
 spamscore=0 mlxlogscore=945 bulkscore=0 impostorscore=0 clxscore=1015
 suspectscore=0 adultscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2505090174

On 4/22/2025 4:31 AM, Eugen Hristev wrote:
> Signed-off-by: Eugen Hristev <eugen.hristev@linaro.org>
> ---
>  Documentation/debug/index.rst    | 17 +++++++
>  Documentation/debug/kmemdump.rst | 77 ++++++++++++++++++++++++++++++++
>  2 files changed, 94 insertions(+)
>  create mode 100644 Documentation/debug/index.rst
>  create mode 100644 Documentation/debug/kmemdump.rst
> 
> diff --git a/Documentation/debug/index.rst b/Documentation/debug/index.rst
> new file mode 100644
> index 000000000000..9a9365c62f02
> --- /dev/null
> +++ b/Documentation/debug/index.rst
> @@ -0,0 +1,17 @@
> +.. SPDX-License-Identifier: GPL-2.0
> +
> +===
> +kmemdump
> +===
> +
> +.. toctree::
> +   :maxdepth: 1
> +
> +   kmemdump
> +
> +.. only::  subproject and html
> +
> +   Indices
> +   =======
> +
> +   * :ref:`genindex`
> diff --git a/Documentation/debug/kmemdump.rst b/Documentation/debug/kmemdump.rst
> new file mode 100644
> index 000000000000..dfee755a1be1
> --- /dev/null
> +++ b/Documentation/debug/kmemdump.rst
> @@ -0,0 +1,77 @@
> +.. SPDX-License-Identifier: GPL-2.0
> +
> +==========================
> +kmemdump
> +==========================
> +
> +This document provides information about the kmemdump feature.
> +
> +Overview
> +========
> +
> +kmemdump is a mechanism that allows any driver or producer to register a
> +chunk of memory into kmemdump, to be used at a later time for a specific
> +purpose like debugging or memory dumping.
> +
> +kmemdump allows a backend to be connected, this backend interfaces a
> +specific hardware that can debug or dump the memory registered into
> +kmemdump.
> +
> +kmemdump Internals
> +=============

I feel that we are missing to explain "what you need from your firmware"
to support kmemdump on your platform. We should add that section and 
given an example on how Qualcomm does it in their firmware etc; 


-- 
---Trilok Soni

