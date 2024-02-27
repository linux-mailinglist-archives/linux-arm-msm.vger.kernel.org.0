Return-Path: <linux-arm-msm+bounces-12780-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 34F6786A23C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 Feb 2024 23:14:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CA55F1F239E7
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 Feb 2024 22:14:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C74D21586D7;
	Tue, 27 Feb 2024 22:12:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="X0GbBcKV"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D735415A487
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 Feb 2024 22:12:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709071942; cv=none; b=RtDxy3JelWmwIXaK3wzNCbIGz/gX+nbH4weGYT/2F8wN0FwdkAreZdW8jW6lnTe+B3YeXE3o3l3JVSYAofbqltGZSZCVjxDUX1JTPJQDp4lAkw24U5NW84Vr545lPuPHyiy2QPvchltOQr0doniYFzn4DDkreXVtvCrHYumptpA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709071942; c=relaxed/simple;
	bh=pKxWHQeRH7W2+VpCLMtrnnvM7BaGpBPQ0psp1WNuuZw=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=seUHouOYs5DAqxaChodNlxiSbgToR3kGr3e28nT0OAVbxukxgTgb0YWCmb7EiRjCg0z8aqCQTLe/6er0NSSqF5AegxvQgPkPLZpDh+oJcA3LgFY2f8i+414TnnDiyshgP5OEieNOSuAltQuW6waNXnMZbHF08wu8RFZoDbDW/c8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=X0GbBcKV; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 41R9YUVi007412;
	Tue, 27 Feb 2024 22:12:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	message-id:date:mime-version:subject:to:cc:references:from
	:in-reply-to:content-type:content-transfer-encoding; s=
	qcppdkim1; bh=uKrmizMD77wsqT5ztJQ/oRCWujpPGtrue2Z1MAxzsag=; b=X0
	GbBcKVq7EFy+g61H6Q/hHYetAGyakbqd0v7uOq3IBVMHeUJULCjOcx757hmAthkx
	eMNMH3DcgNYrzBEd2GgqWuJSlpb3v3U/alA6z4kMOEnUUvwK8q6bDkHqgHg6luIV
	uI0qhkIoJs3m7T1syIznbVdDkcFxW+XU4zVyNjbqBh3eluKmEDo7w0TP0ohE6ytE
	puHEpWc1egqkNOjCifmPuGWhrGTPxFqdcBHeCWHYilNZ9E+RVaHbw8rF70uovPj1
	CH2pUrXFYaUHxBNHUvt8mATOnO5X1zK6HH0QxD42EnOO6QtR90Z64Tn5ih9nIuUd
	FSg2MWOhWLiVt0zDJiYw==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3wh8auje1b-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 27 Feb 2024 22:12:13 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 41RMBwP0003967
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 27 Feb 2024 22:11:58 GMT
Received: from [10.110.56.192] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Tue, 27 Feb
 2024 14:11:57 -0800
Message-ID: <46fa8e0a-0af2-2a44-f5f9-70fd49649aa4@quicinc.com>
Date: Tue, 27 Feb 2024 14:11:56 -0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH] Revert "drm/msm/dp: use drm_bridge_hpd_notify() to report
 HPD status changes"
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Rob Clark
	<robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Kuogee Hsieh
	<quic_khsieh@quicinc.com>,
        Sankeerth Billakanti <quic_sbillaka@quicinc.com>
CC: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio
	<konrad.dybcio@linaro.org>,
        Stephen Boyd <swboyd@chromium.org>, David Airlie
	<airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>, <linux-arm-msm@vger.kernel.org>,
        <dri-devel@lists.freedesktop.org>, <freedreno@lists.freedesktop.org>,
        Johan Hovold <johan@kernel.org>
References: <20240227220808.50146-1-dmitry.baryshkov@linaro.org>
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <20240227220808.50146-1-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: uV5HZSVJu--Vw-VsVcE2SpBk7PJyke9G
X-Proofpoint-GUID: uV5HZSVJu--Vw-VsVcE2SpBk7PJyke9G
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-02-27_09,2024-02-27_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 impostorscore=0 bulkscore=0 suspectscore=0 phishscore=0 malwarescore=0
 mlxscore=0 lowpriorityscore=0 adultscore=0 mlxlogscore=999 clxscore=1015
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2402120000 definitions=main-2402270171



On 2/27/2024 2:08 PM, Dmitry Baryshkov wrote:
> This reverts commit e467e0bde881 ("drm/msm/dp: use
> drm_bridge_hpd_notify() to report HPD status changes").
> 
> The commit changed the way how the MSM DP driver communicates
> HPD-related events to the userspace. The mentioned commit made some of
> the HPD events being reported earlier. This way userspace starts poking
> around. It interacts in a bad way with the dp_bridge_detect and the
> driver's state machine, ending up either with the very long delays
> during hotplug detection or even inability of the DP driver to report
> the display as connected.
> 
> A proper fix will involve redesigning of the HPD handling in the MSM DP
> driver. It is underway, but it will be intrusive and can not be thought
> about as a simple fix for the issue. Thus, revert the offending commit.
> 

Yes, for fixing this on 6.9 I am fine with this.

I hope there were not other changes which were built on top of this. So 
it will be better if we retest internal HPD case as well with this.

We will do that in a day or two and give Tested-by.

> Fixes: e467e0bde881 ("drm/msm/dp: use drm_bridge_hpd_notify() to report HPD status changes")
> Link: https://gitlab.freedesktop.org/drm/msm/-/issues/50
> Reported-by: Johan Hovold <johan@kernel.org>
> Link: https://lore.kernel.org/r/Zd3YPGmrprxv-N-O@hovoldconsulting.com/
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>   drivers/gpu/drm/msm/dp/dp_display.c | 20 ++++++++++++++++++--
>   1 file changed, 18 insertions(+), 2 deletions(-)
> 

For the change itself,


Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>

