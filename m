Return-Path: <linux-arm-msm+bounces-4957-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 2850C814F77
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 Dec 2023 19:06:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D8934281302
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 Dec 2023 18:06:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9E2B230128;
	Fri, 15 Dec 2023 18:06:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="eM5V2Nj2"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BAD33011F
	for <linux-arm-msm@vger.kernel.org>; Fri, 15 Dec 2023 18:06:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 3BFC2lcf018903;
	Fri, 15 Dec 2023 18:06:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	message-id:date:mime-version:subject:to:cc:references:from
	:in-reply-to:content-type:content-transfer-encoding; s=
	qcppdkim1; bh=RXXm7dRlkS6rhni5/83PoJopsCY9CNCug/c0OmgJa70=; b=eM
	5V2Nj2gX8LNfaN8IGPXUSxiJUsfQGG5kQToFAYGp7AJ8kBfIgL99AR6ziC1H44n7
	zjqupQGUmBcpzwlIl25OTojv72h18Cd2nKaFcjXbYrjgBEKTuJsvLiGpG4aPnVr3
	VCxJtG+DM9Oka9ImYWLn7caxsxix3qs6fzq0G5nMvcUyK3FbHmADqKNPZ9nNsZuZ
	k/2fq2xVfaT6PWeh1n5wqy456vLj4njNOA3eKmyOd70gyUKqNGUwurpi9WVbaOi0
	L0cNmC1p13RYkImBqsgLnOIPdCH5A/AfSDBqPyHVWHEHG6NVWBiHOLis4SMaSRYP
	NoV9uLjTNFPkn1q9oyPw==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3v0hqchqyn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 15 Dec 2023 18:06:25 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 3BFI6O0n006837
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 15 Dec 2023 18:06:24 GMT
Received: from [10.226.59.182] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Fri, 15 Dec
 2023 10:06:23 -0800
Message-ID: <9c314cf9-0291-2879-9a78-80cf97ca4ce6@quicinc.com>
Date: Fri, 15 Dec 2023 11:06:23 -0700
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.0
Subject: Re: [PATCH 6/7] accel/qaic: Leverage DRM managed APIs to release
 resources
Content-Language: en-US
To: <quic_carlv@quicinc.com>, <quic_pkanojiy@quicinc.com>,
        <stanislaw.gruszka@linux.intel.com>,
        <jacek.lawrynowicz@linux.intel.com>
CC: <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
        <ogabbay@kernel.org>
References: <20231208163457.1295993-1-quic_jhugo@quicinc.com>
 <20231208163457.1295993-7-quic_jhugo@quicinc.com>
From: Jeffrey Hugo <quic_jhugo@quicinc.com>
In-Reply-To: <20231208163457.1295993-7-quic_jhugo@quicinc.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: b-THD_1fAxjPYnjyU9spoe0oZWKkF0eb
X-Proofpoint-GUID: b-THD_1fAxjPYnjyU9spoe0oZWKkF0eb
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-12-09_01,2023-12-07_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 mlxscore=0
 phishscore=0 adultscore=0 priorityscore=1501 impostorscore=0
 lowpriorityscore=0 mlxlogscore=743 clxscore=1015 suspectscore=0
 spamscore=0 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2311290000 definitions=main-2312150127

On 12/8/2023 9:34 AM, Jeffrey Hugo wrote:
> From: Pranjal Ramajor Asha Kanojiya <quic_pkanojiy@quicinc.com>
> 
> Offload the balancing of init and destroy calls to DRM managed APIs.
> mutex destroy for ->cntl_mutex is not called during device release and
> destroy workqueue is not called in error path of create_qdev(). So, use
> DRM managed APIs to manage the release of resources and avoid such
> problems.
> 
> Signed-off-by: Pranjal Ramajor Asha Kanojiya <quic_pkanojiy@quicinc.com>
> Reviewed-by: Jeffrey Hugo <quic_jhugo@quicinc.com>
> Signed-off-by: Jeffrey Hugo <quic_jhugo@quicinc.com>

Jacek, I saw a review from you for 1-5, and 7 but not this patch (6). 
Did I miss something?

-Jeff

