Return-Path: <linux-arm-msm+bounces-38878-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A3E79D6440
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 Nov 2024 19:38:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BA36228286B
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 Nov 2024 18:38:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B73F6BA20;
	Fri, 22 Nov 2024 18:38:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="C3+TWYqw"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 152AA2FC23
	for <linux-arm-msm@vger.kernel.org>; Fri, 22 Nov 2024 18:38:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732300728; cv=none; b=rTrB52BR+kgAd5eplSLx+Pjy0pXx2A6spZpX3QrYqr0IAdTXFXtVRr3JHc1syB32UpJiJe+XhtfXrSzW+zRe0pzEtsVrUnmJFodkX2lLAP9F27mSjl5Fu5flb2iXZ6xyxHfz0tUgP7Jjt4rF7TVoOsRCKg+VZc1s9/eszGkJgfg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732300728; c=relaxed/simple;
	bh=rvIkMwuoqT5YSWcE3lJqYpVqFAzm2xpYKbW7P2FcmjY=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=LoQyIUm5+OYx79h18vN01u2Ba4C7GlO/UthlRGO5qplXoylHzla5sNGwsgF4wr34ZcIQ5690kiKBb4NI1hVj4MJ6MWM0ki9vPpVU6kn2ieXMw+NLmRjh+CGhd8MndG2TvyC/+E0Q20B6rrm1Ck8yHCe9qvHH/DxEXKxE2YBgHZw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=C3+TWYqw; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4AMBxowQ004608;
	Fri, 22 Nov 2024 18:38:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	KJV7+5jrID/ChUcEkj99nCNJ4KK80LJ+d7p6tlWha2g=; b=C3+TWYqw5eZEF7o1
	OBOZourZ6LoDffEIkfnn1NjY2DxvqySt1lKMXwktyI5jHsl7zkFM70+c8J4o6230
	reQ5PG3HhTk68wig81RpZC9X6iVtU1xUW25SUCicH5b95a1bzsbQlxdiLx1nBinZ
	DT2NgTz1NzBLrTvwjUXFa4LcbZULxOX5MWxbLe9/M30LPv+4BUK+ALpctkm8KvAI
	pcpJFoWdlH96a2Jf1tyz0d0TGhc/xNcIr6Jxc/kVZ++CEgiAJA/gaiE2HRAtbmyS
	MTpTGudMNlZCv/x1QTt9HlqROgDZTkUbM7dD8FcdAJmAKGNytkdl54vTGzlifgYU
	XWrmwA==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 431ea77t53-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 22 Nov 2024 18:38:42 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4AMIcg2N006113
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 22 Nov 2024 18:38:42 GMT
Received: from [10.226.59.182] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Fri, 22 Nov
 2024 10:38:41 -0800
Message-ID: <e88d420f-4dd0-a362-404c-f8e347cd2df2@quicinc.com>
Date: Fri, 22 Nov 2024 11:38:40 -0700
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.0
Subject: Re: [PATCH] accel/qaic: Drop redundant vfree() null check in sahara
Content-Language: en-US
To: <quic_carlv@quicinc.com>, <andersson@kernel.org>,
        <quic_yabdulra@quicinc.com>
CC: <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
        "kernel test robot" <lkp@intel.com>
References: <20241117202629.1681358-1-quic_jhugo@quicinc.com>
From: Jeffrey Hugo <quic_jhugo@quicinc.com>
In-Reply-To: <20241117202629.1681358-1-quic_jhugo@quicinc.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: mDqpIVDk1B3MK-d8nx-ahPnWTI-dhgAO
X-Proofpoint-ORIG-GUID: mDqpIVDk1B3MK-d8nx-ahPnWTI-dhgAO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 adultscore=0
 bulkscore=0 mlxscore=0 suspectscore=0 lowpriorityscore=0 clxscore=1015
 priorityscore=1501 impostorscore=0 malwarescore=0 mlxlogscore=746
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2411220157

On 11/17/2024 1:26 PM, Jeffrey Hugo wrote:
> The documentation for vfree() says that passing in NULL is ok. Therefore
> we can drop the null check as redundant.
> 
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202410301732.abF5Md4e-lkp@intel.com/
> Signed-off-by: Jeffrey Hugo <quic_jhugo@quicinc.com>

Applied to drm-misc-next

-Jeff

