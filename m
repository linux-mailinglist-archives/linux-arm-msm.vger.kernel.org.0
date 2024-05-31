Return-Path: <linux-arm-msm+bounces-21341-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 070FD8D685D
	for <lists+linux-arm-msm@lfdr.de>; Fri, 31 May 2024 19:46:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 69CA71F28B11
	for <lists+linux-arm-msm@lfdr.de>; Fri, 31 May 2024 17:46:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D1F0F446D1;
	Fri, 31 May 2024 17:46:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="MP9wjwLi"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 723011DFCB;
	Fri, 31 May 2024 17:46:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717177581; cv=none; b=D4AXmd0c8FmgL3pcp+n/pvTsi4FWRVkhMRx//rdD4/Dp8KUzOyvhbkcCMK3Af4gmcbdxICjqmP0d/T+gTaC2mfePK704wxtNripr+3hcrIUp42Y1E3yKpHo/Z+5QS8WaYAQyJ99PhV9sq9fVKqYvl12uVgbSIcuz7p7EUExqmgg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717177581; c=relaxed/simple;
	bh=Y4T7SfHtyt2wfB248WjeW5VIVUYqLwsf3jldjamaeFU=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=WgQU2YMj88yQr0vwBpzZBBwQkoApiAA/5qVCCLuIXEFONh//rOARuMSHlYo5XcK9OWzh2HhAVrbLjXYkquq0D4mEi7MKSEDNz/P6Ncw1E1ASHXI5HG0UETSYHJe/81+UXp/VfxWPv7lpimLUMqr86NpEnfiDBCR5KLSK077Uu9E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=MP9wjwLi; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 44V9eD7k015957;
	Fri, 31 May 2024 17:46:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	zDggzVShflqQw+bpQBvpfshxpqbJqcejeDnhzjwPzK8=; b=MP9wjwLioEOXZgKb
	ep9UN9V7rvQdz4tILrb0vIlIXAMLDefc9rSQkSAGZFopK9aYr6NQBclJVCqHtyVt
	wz+Rtkg6vXlVnzHQcFGmzjm84KdegD+9+bqf+kdl7V5hBAF58OdOlCM8THIFP+Ws
	jVjS87vTnvDDLj+j/aJ3OdjrUUu6sJngQs85pMwH3fFCfvx6iRYxqeO/i7yWhWax
	k4z5VQds9M7q2nLd66GcJJ6k5vifis9z2MoidIzF9cbK1N43Hp0RfVdk7cxTIzEE
	j0Y3H/C8cB33pP58alr2WH14SgfSJMSzJBTNgP6A/H9oO6cB++ohUgfU7S53OWkz
	6VWh4g==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3yf23stk49-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 31 May 2024 17:46:05 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 44VHk1iE004296
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 31 May 2024 17:46:01 GMT
Received: from [10.226.59.182] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Fri, 31 May
 2024 10:46:00 -0700
Message-ID: <871ef640-c5fe-69d5-2b15-286db6845dc8@quicinc.com>
Date: Fri, 31 May 2024 11:46:00 -0600
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.0
Subject: Re: [PATCH v3 0/3] drm/panel-edp: remove several legacy compatibles
 used by the driver
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
CC: Douglas Anderson <dianders@chromium.org>,
        Neil Armstrong
	<neil.armstrong@linaro.org>,
        Jessica Zhang <quic_jesszhan@quicinc.com>,
        "Sam
 Ravnborg" <sam@ravnborg.org>,
        Maarten Lankhorst
	<maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
        <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <linux-rockchip@lists.infradead.org>
References: <20240531-edp-panel-drop-v3-0-4c98b2b95e3a@linaro.org>
 <7428a2f7-befc-6db8-76f4-3ca8dc12d31c@quicinc.com>
 <6kmhrxip4xb44bspptwdaoqsod5gm7ccr27fn3jr4ouh4jszi4@fuxht25n5wki>
From: Jeffrey Hugo <quic_jhugo@quicinc.com>
In-Reply-To: <6kmhrxip4xb44bspptwdaoqsod5gm7ccr27fn3jr4ouh4jszi4@fuxht25n5wki>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: durUuZ7aWnVn__pqXTtLIFPO6Bca352L
X-Proofpoint-GUID: durUuZ7aWnVn__pqXTtLIFPO6Bca352L
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.12.28.16
 definitions=2024-05-31_12,2024-05-30_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 suspectscore=0
 adultscore=0 spamscore=0 lowpriorityscore=0 priorityscore=1501
 impostorscore=0 phishscore=0 mlxlogscore=999 bulkscore=0 mlxscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2405170001 definitions=main-2405310133

On 5/31/2024 11:43 AM, Dmitry Baryshkov wrote:
> On Fri, May 31, 2024 at 10:18:07AM -0600, Jeffrey Hugo wrote:
>> On 5/30/2024 5:12 PM, Dmitry Baryshkov wrote:
>>> There are two ways to describe an eDP panel in device tree. The
>>> recommended way is to add a device on the AUX bus, ideally using the
>>> edp-panel compatible. The legacy way is to define a top-level platform
>>> device for the panel.
>>>
>>> Document that adding support for eDP panels in a legacy way is strongly
>>> discouraged (if not forbidden at all).
>>>
>>> While we are at it, also drop legacy compatible strings and bindings for
>>> five panels. These compatible strings were never used by a DT file
>>> present in Linux kernel and most likely were never used with the
>>> upstream Linux kernel.
>>>
>>> The following compatibles were never used by the devices supported by
>>> the upstream kernel and are a subject to possible removal:
>>>
>>> - lg,lp097qx1-spa1
>>> - samsung,lsn122dl01-c01
>>> - sharp,ld-d5116z01b
>>
>> Ok to drop the sharp one I added.  It should be able to be handled by the
>> (newish) edp-panel, but I think the TI bridge driver needs some work for the
>> specific platform (no I2C connection) to verify.
> 
> Thanks. I'm tempted to merge the series as is now and drop
> sharp,ld-d5116z01b once you can confirm that it can be handled by
> edp-panel on your platform.
> 

Sounds good to me.

-Jeff

