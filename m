Return-Path: <linux-arm-msm+bounces-42454-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 25BF59F4033
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Dec 2024 02:49:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DE4E1188AB69
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Dec 2024 01:49:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 605A842A93;
	Tue, 17 Dec 2024 01:49:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="mKdCse/w"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCE8115AF6;
	Tue, 17 Dec 2024 01:49:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734400185; cv=none; b=OCPCor4TEN7vVxC2RSytwtGNHFsOudSiPbOu/++7XGuHesOOmf2F/LlvpBulkSTUpmjTBavvAjyqbCd8XgKaBJqmeKoVPDC16zmra/MCLMSSN3WUs4odZYfKTdJl1/DoP96swhVHG4ZLADRf8pLhZ1McrW+YTv8wzHj9Tc4UVIk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734400185; c=relaxed/simple;
	bh=BLmEiHhmsTAqTJlIyrB/FsMeZTiyxSQT4Vn13cimxE0=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=jW/nLivwy9lOdBkuwe384PI6hzlh7nebbTO7vsesl6Z151okoXFdSQXqfJVdrP95cC+5VLRnrXRgoo9RnSAt8t4vYWDdO1Ehb650ESZBGfAMUmHixqsyn/We6OU1Y/Zxv37sjsg+37tJ3+yXimLkp60fF7hSGXwlegiYJ/pZfR0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=mKdCse/w; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BGKsceT009929;
	Tue, 17 Dec 2024 01:49:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ubmllXRO7FkSfR6ZJt4umsMtTi1Wn6GPdKGo8CmrLSg=; b=mKdCse/wl/SL7FBz
	WEwPfw9CwzoDwrFsIzaO2JgbuqPspACgezbUXOoW0/kqdJdGamL1LTQKd3XITBEM
	LkC03RUfCAdXUAYowUTaeN8bJ5/Yu5zPfbv4z59g4iI1zZ8wOehExotDRsS8SsoL
	nqLqMllqW+6HSygJ/whpzGT3eG5yhohh7Xtf405D6l6mWfVbOK8+FQPTOzLP1zFo
	iOYGo9QGYqmWiIvSfSal+l589kMoJXvXYLJkNkXg7WeVMPeYHIDxhV+qQ35L6PrY
	+/XePDfOM+8krECJBXyu3TkUDYQYELBye6uLo4E3+XkxHEwjKFjvvLbb6ov4pWj3
	/OOl+A==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43junjgguf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 17 Dec 2024 01:49:30 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4BH1nTxW027860
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 17 Dec 2024 01:49:29 GMT
Received: from [10.110.119.169] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 16 Dec
 2024 17:49:28 -0800
Message-ID: <ad5ccae5-24f8-47c7-81fa-8f344f1cafa6@quicinc.com>
Date: Mon, 16 Dec 2024 17:49:27 -0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 01/25] drm: add clone mode check for CRTC
To: Jessica Zhang <quic_jesszhan@quicinc.com>,
        Rob Clark
	<robdclark@gmail.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        "Sean
 Paul" <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        "David Airlie" <airlied@gmail.com>,
        Maarten Lankhorst
	<maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Simona Vetter <simona@ffwll.ch>,
        Simona Vetter <simona.vetter@ffwll.ch>
CC: <quic_ebharadw@quicinc.com>, <linux-arm-msm@vger.kernel.org>,
        <dri-devel@lists.freedesktop.org>, <freedreno@lists.freedesktop.org>,
        <linux-kernel@vger.kernel.org>, Rob Clark <robdclark@chromium.org>,
        =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
References: <20241216-concurrent-wb-v4-0-fe220297a7f0@quicinc.com>
 <20241216-concurrent-wb-v4-1-fe220297a7f0@quicinc.com>
Content-Language: en-US
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <20241216-concurrent-wb-v4-1-fe220297a7f0@quicinc.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: 4ChAss6kxFiM8geGGPaCTTgb47vb7iJ5
X-Proofpoint-GUID: 4ChAss6kxFiM8geGGPaCTTgb47vb7iJ5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 phishscore=0 mlxlogscore=709 clxscore=1015 suspectscore=0 malwarescore=0
 mlxscore=0 adultscore=0 spamscore=0 bulkscore=0 priorityscore=1501
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412170013



On 12/16/2024 4:43 PM, Jessica Zhang wrote:
> Add a common helper to check if the given CRTC state is in clone mode.
> This can be used by drivers to help detect if a CRTC is being shared by
> multiple encoders
> 
> Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
> ---
>   drivers/gpu/drm/drm_crtc.c | 20 ++++++++++++++++++++
>   include/drm/drm_crtc.h     |  2 +-
>   2 files changed, 21 insertions(+), 1 deletion(-)
> 

Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>

