Return-Path: <linux-arm-msm+bounces-10227-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E9A0F84E804
	for <lists+linux-arm-msm@lfdr.de>; Thu,  8 Feb 2024 19:49:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 288481C2730E
	for <lists+linux-arm-msm@lfdr.de>; Thu,  8 Feb 2024 18:49:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 79FBA25571;
	Thu,  8 Feb 2024 18:49:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="RfGJ3v2l"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE50620B34
	for <linux-arm-msm@vger.kernel.org>; Thu,  8 Feb 2024 18:49:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707418158; cv=none; b=OJqak0Oh0WBfvLqNyDkUq3/wqGQvNfzJKpTjrqW0n5yPOTafABL2H9DEP5PEtpliQzLUBwJTtjqG4dsNkLbQZk/JShPoVMzD6YLKQGBk2nsnimQ2J8h2Ed12XtjLLhMSpgCa2DmFFM9/VXajURc8iWWYXeo+QBywQ4ogRUTAma8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707418158; c=relaxed/simple;
	bh=WDdjwDZFwhIIwgucOp90Tli+oKHy8FP9NYlF1hOfyfs=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=JHl4kBYJq5EsHUB/g7FtWgUjB/bAMRLWO9Ndsgn5VNM9WSaVQ4Pt0j06DUVKgtJl4jbZNwIXRCOLpixXFHrlf6jdMNWWov7hWpTw10tfubZ+ZR8rFtmD79IKgAuXgf38lmKYz1Ecs1KLW69Y6DkIJ7uLycKKkhqvOkN9B0PjnGA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=RfGJ3v2l; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 418HZpeZ006763;
	Thu, 8 Feb 2024 18:49:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	message-id:date:mime-version:subject:to:cc:references:from
	:in-reply-to:content-type:content-transfer-encoding; s=
	qcppdkim1; bh=QBqTvuDJPuu7iizUVoHoiNBzYUjWoKyMdKaS94JQEhU=; b=Rf
	GJ3v2l0dggc9Qw1bn1L5HldPAM6pvPZcO+gMNF2lJuMTZgPQtU+PjVRBoQKHrhoK
	lgwpV5zY5lor58d8PLUQyvjhMql+46ysqlnwyl48YC1R3EZ+4k+GKyZXGMm3G+vO
	QKaIkDntj5zrSqLx3ZXqYKfF7bR2lXFuDd5+VOlyZmNT+cxkKabbeXNZ9lFv6FEU
	r7oHayibhTURES0equHM/ivmNPwZWvQ26QLr6Evai8l8cdz2rhsomXRu/xVxdCm5
	sIK58Wv0xJVS8/Ro3Vn+ToqikM6XiUewfn80rQBPGT+GiBaObK7wWIV9OYHPxhy+
	3VAGOy+9vMYWdSva1dCw==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3w4h0ujtb3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 08 Feb 2024 18:49:06 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 418In6mA016465
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 8 Feb 2024 18:49:06 GMT
Received: from [10.71.109.81] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Thu, 8 Feb
 2024 10:49:05 -0800
Message-ID: <0c6a313b-c897-576d-ad74-8a5822622eab@quicinc.com>
Date: Thu, 8 Feb 2024 10:49:05 -0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v4 4/5] drm/msm/dpu: move writeback's atomic_check to
 dpu_writeback.c
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Rob Clark
	<robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten
	<marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Daniel
 Vetter <daniel@ffwll.ch>
CC: <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
        <freedreno@lists.freedesktop.org>
References: <20240208-fd_remove_phys_ops_atomic_mode_set-v4-0-caf5dcd125c0@linaro.org>
 <20240208-fd_remove_phys_ops_atomic_mode_set-v4-4-caf5dcd125c0@linaro.org>
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <20240208-fd_remove_phys_ops_atomic_mode_set-v4-4-caf5dcd125c0@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: Tp34sSLNQ77vkqV-J8bjeVLG3JstZCB1
X-Proofpoint-GUID: Tp34sSLNQ77vkqV-J8bjeVLG3JstZCB1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-02-08_08,2024-02-08_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 adultscore=0
 spamscore=0 mlxscore=0 suspectscore=0 phishscore=0 malwarescore=0
 bulkscore=0 mlxlogscore=999 priorityscore=1501 clxscore=1015
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2401310000 definitions=main-2402080099



On 2/8/2024 7:20 AM, Dmitry Baryshkov wrote:
> dpu_encoder_phys_wb is the only user of encoder's atomic_check callback.
> Move corresponding checks to drm_writeback_connector's implementation
> and drop the dpu_encoder_phys_wb_atomic_check() function.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>   .../gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c    | 54 -------------------
>   drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c            |  9 ++--
>   drivers/gpu/drm/msm/disp/dpu1/dpu_writeback.c      | 61 +++++++++++++++++++++-
>   drivers/gpu/drm/msm/disp/dpu1/dpu_writeback.h      |  3 +-
>   4 files changed, 68 insertions(+), 59 deletions(-)
> 

<Snip>

> +
> +	crtc = conn_state->crtc;
> +	if (!crtc)
> +		return 0;
> +

This should fix the crash and rest of the change LGTM

Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>


Please give us a couple of days to re-test this and give our Tested-by 
as we plan to rebase CDM over DP on top of this and post V2.

