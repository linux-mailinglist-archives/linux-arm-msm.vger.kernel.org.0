Return-Path: <linux-arm-msm+bounces-34116-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 90CA299A64A
	for <lists+linux-arm-msm@lfdr.de>; Fri, 11 Oct 2024 16:28:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 178971F216F9
	for <lists+linux-arm-msm@lfdr.de>; Fri, 11 Oct 2024 14:28:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 98EFA2194A6;
	Fri, 11 Oct 2024 14:28:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="WHVjerdU"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32B56212F13;
	Fri, 11 Oct 2024 14:28:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728656886; cv=none; b=j3O2lT2nzFLOII7VR5CU5gBZq8yq6qdZcScyTQFp7NAApCxRFsd83Ljy0IFxcpYicv5vGeVj2+fr3TIifh1eda/6XDlgWerYzrG0fOu/z1jGUn4cc90M8/0NeLSmZocsG60sL+p5xr5ZB+DKkD8q5r/+CRIBQ/RUSGQjzgWPp5E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728656886; c=relaxed/simple;
	bh=L+gXCKny+WaarEbGPHZM3dwhDvC1Mp2ZZsPvrE1lgBo=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=kYWm8kp1d7IEX/rqAx+LhWYz/hW05nIsy4BwCeNP92KNzIIkRCo7IzDGG/4zlr+GwA3p2EwqT8YTa9bDzpJCJMjjgoy1f2uZxQLUx3m2PZXgCyKpL0Mvofvm21KhDx1DMoxDcp80PWJvZsNAZ/3qpYqS9bPGl3YV+ypidbypuC0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=WHVjerdU; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49BAw7hA006577;
	Fri, 11 Oct 2024 14:27:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	zLNY1QKiA67jtVorzKmEfKmwe+WAqPbBGq8S+bpyAzo=; b=WHVjerdUlVtW0KCl
	4Mmxrn7fqWOKdGLTvuSQ7eOjr1shNhGb3FwZ3egWxs/g6Qlv+CKrtIvps+CbGtq3
	+BR/EvjprAGPDGkz7KJSqEJ67eI/2NAnvcYeai6duKssWbkx0cDiQwhz7mdblEc1
	AFZvnoHgBBwUw5qOZO2q5e+w5hVUy8v+G7FHAG5SMFHyVZRPHi3wTs6K7YvNotwZ
	faoXMu9wKCNQKjm0O9Ngk37uP0XA52Beojq2Hxn6M/Z1OFRIsJWbozEkBCbUhkSj
	8/0BnYOcfOy86+1sVonlUI5IfkvFEyR46B9iQQU1LBEkVIlZCwTNXbQ2/vPFltBA
	NnsPMw==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 426t7st170-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 11 Oct 2024 14:27:46 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 49BERjhn002310
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 11 Oct 2024 14:27:45 GMT
Received: from [10.226.59.182] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Fri, 11 Oct
 2024 07:27:44 -0700
Message-ID: <468f05e2-1717-3bd1-2ccb-280865180b0c@quicinc.com>
Date: Fri, 11 Oct 2024 08:27:43 -0600
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.0
Subject: Re: [PATCH net-next 3/3] accel/qaic: Pass string literal as format
 argument of alloc_workqueue()
Content-Language: en-US
To: Simon Horman <horms@kernel.org>, "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        "Paolo
 Abeni" <pabeni@redhat.com>
CC: Woojung Huh <woojung.huh@microchip.com>, Andrew Lunn <andrew@lunn.ch>,
        Florian Fainelli <f.fainelli@gmail.com>,
        Vladimir Oltean <olteanv@gmail.com>,
        Richard Cochran <richardcochran@gmail.com>,
        Jiawen Wu
	<jiawenwu@trustnetic.com>,
        Mengyuan Lou <mengyuanlou@net-swift.com>,
        "Nathan
 Chancellor" <nathan@kernel.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Bill Wendling <morbo@google.com>,
        Justin Stitt <justinstitt@google.com>,
        "Carl Vanderlip" <quic_carlv@quicinc.com>,
        Oded Gabbay <ogabbay@kernel.org>, <UNGLinuxDriver@microchip.com>,
        <netdev@vger.kernel.org>, <llvm@lists.linux.dev>,
        <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>
References: <20241011-string-thing-v1-0-acc506568033@kernel.org>
 <20241011-string-thing-v1-3-acc506568033@kernel.org>
From: Jeffrey Hugo <quic_jhugo@quicinc.com>
In-Reply-To: <20241011-string-thing-v1-3-acc506568033@kernel.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: PSMKLJF5TTSph64DwS_tuqCkpSa_1WXE
X-Proofpoint-ORIG-GUID: PSMKLJF5TTSph64DwS_tuqCkpSa_1WXE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 mlxlogscore=999 malwarescore=0 phishscore=0 mlxscore=0 priorityscore=1501
 suspectscore=0 impostorscore=0 clxscore=1011 adultscore=0 bulkscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2410110100

On 10/11/2024 3:57 AM, Simon Horman wrote:
> Recently I noticed that both gcc-14 and clang-18 report that passing
> a non-string literal as the format argument of alloc_workqueue()
> is potentially insecure.
> 
> E.g. clang-18 says:
> 
> .../qaic_drv.c:61:23: warning: format string is not a string literal (potentially insecure) [-Wformat-security]
>     61 |         wq = alloc_workqueue(fmt, WQ_UNBOUND, 0);
>        |                              ^~~
> .../qaic_drv.c:61:23: note: treat the string as an argument to avoid this
>     61 |         wq = alloc_workqueue(fmt, WQ_UNBOUND, 0);
>        |                              ^
>        |                              "%s",
> 
> It is always the case where the contents of fmt is safe to pass as the
> format argument. That is, in my understanding, it never contains any
> format escape sequences.
> 
> But, it seems better to be safe than sorry. And, as a bonus, compiler
> output becomes less verbose by addressing this issue as suggested by
> clang-18.
> 
> Also, change the name of the parameter of qaicm_wq_init from
> fmt to name to better reflect it's purpose.
> 
> Compile tested only.

I'm not sure why this looks like it is targeted for net-next.  I'm not 
seeing any dependencies on net code, nor is this a net driver.  My 
confusion makes me think I might be missing something.

I'll plan on independently taking this through DRM, unless something is 
brought to my attention.

Regarding the patch itself, looks sane to me.  I'll give it run through 
on hardware soon.

-Jeff

