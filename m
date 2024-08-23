Return-Path: <linux-arm-msm+bounces-29420-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 7950E95D988
	for <lists+linux-arm-msm@lfdr.de>; Sat, 24 Aug 2024 01:13:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 264931F2341D
	for <lists+linux-arm-msm@lfdr.de>; Fri, 23 Aug 2024 23:13:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DE45D1C8FD9;
	Fri, 23 Aug 2024 23:13:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="YG6Xbge+"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39A311C8FCD;
	Fri, 23 Aug 2024 23:13:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724454792; cv=none; b=NhK8EeQ5izxyDBbCT5BgDNrSI6Q81WOCnctl2n5e4VCP2AFgpxgtD84ZM2uweAbQDopy8r2k+lLBZJO66EL9zcwlVtf80y6Y3ie7lTXycvBg0MMXkKIN+2Czmlx2TADEc13FvTjzx1IGnV2g+s/Bv6qc+Z/5BAzsg7Ykijtdmp8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724454792; c=relaxed/simple;
	bh=cZb5bENC2/V22FAm8H6EPE8XYq7AE9WeNFGzS39Z234=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=cfdfYsFZlnAb39mSdSdAUXYDIsmuERplwWoufprywXhvLd4PX7Q10GPCjK8EQnMskDciuMN+OHeAKuCWDMaBt7XIwUEZFOAkELKEfVSy0T1QJB3AWuJjj2FNrS9WYWLrWNHqID7eQ9QQU52XB/9+hhhF1V1qaiqpNqooj55bEeg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=YG6Xbge+; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 47NBU0K1007716;
	Fri, 23 Aug 2024 23:13:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	98ojfFnRqT6OFd+DsmKj4oWIC/lf/udM01Zdlqh5I+s=; b=YG6Xbge+NssyG6iK
	wvN8ZM9+VVl9mkoaN+1V7dBg9BP4JJ1rjGf8O6val93XqsGyHgRwQ3y6Zd+FcllP
	9ROMBKdL33ebT2wvVXqjdDwZzPRYLOr+8ZrnB1elk/cfj0flXBkp1zzjLPKqfudj
	FUA5EiDVnlUcAel9KCApWmbASfOHcC0ss5qAgMdi9wLoPYTtQ+zGBrn6PB8ivcdZ
	ku0wBcF/XStMlaXW/sNmUWLVvUeObokNDiTOitMAt/ZtE4OTSdTaAX88ETKeD1U9
	STiA6GUTQgaqOlX/6YjVYXy4txlVP4rMuJFHMmvhJYx+QWapQ9jUpcmFDDknbH+2
	W8aPxQ==
Received: from nasanppmta04.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 414pe5vpct-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 23 Aug 2024 23:13:06 +0000 (GMT)
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 47NND54L008923
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 23 Aug 2024 23:13:05 GMT
Received: from [10.251.44.135] (10.80.80.8) by nasanex01a.na.qualcomm.com
 (10.52.223.231) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Fri, 23 Aug
 2024 16:13:03 -0700
Message-ID: <1893aa81-89f0-459e-b5b5-9973014ed1e6@quicinc.com>
Date: Sat, 24 Aug 2024 02:13:00 +0300
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] clk: qcom: gdsc: Add a flag to skip setting power
 collapse bits
To: Stephen Boyd <sboyd@kernel.org>, <andersson@kernel.org>,
        <quic_mdtipton@quicinc.com>, <quic_viveka@quicinc.com>
CC: <mturquette@baylibre.com>, <linux-arm-msm@vger.kernel.org>,
        <linux-clk@vger.kernel.org>, <linux-kernel@vger.kernel.org>
References: <20240813120015.3242787-1-quic_c_gdjako@quicinc.com>
 <496d7baf4c0e7e83c54f57edf789eafc.sboyd@kernel.org>
Content-Language: en-US
From: Georgi Djakov <quic_c_gdjako@quicinc.com>
In-Reply-To: <496d7baf4c0e7e83c54f57edf789eafc.sboyd@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: jTbEoyWWRZbzrpcJAgb-ATPzJXdRbxl2
X-Proofpoint-GUID: jTbEoyWWRZbzrpcJAgb-ATPzJXdRbxl2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-23_16,2024-08-23_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 suspectscore=0
 mlxscore=0 lowpriorityscore=0 adultscore=0 priorityscore=1501
 impostorscore=0 clxscore=1011 spamscore=0 mlxlogscore=503 phishscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2407110000 definitions=main-2408230170

On 8/17/2024 12:48 AM, Stephen Boyd wrote:
> Quoting Georgi Djakov (2024-08-13 05:00:15)
>> The sdm845 platforms have a hardware issue that requires keeping
>> some of the MMNOC GDSCs in SW collapse mode (which is the power-on
>> default). But if some driver tries to use these GDSCs and the mode
>> is updated because of runtime pm calls, we may get a board hang.
>> Introduce a flag to skip any updates to the power collapse settings
>> for the impacted GDSCs to avoid unexpected board hangs.
> 
> Can you add a Fixes tag? And does this need to go to stable kernels?

These GDSCs got a user in v6.11-rc1 and there is currently a workaround
in place to avoid the hang, but this patch is the proper way to handle
it. Getting it into either fixes or next is both fine. There is no need
to backport it, as these GDSCs are not used on older kernels.

Thanks,
Georgi

