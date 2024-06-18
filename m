Return-Path: <linux-arm-msm+bounces-23148-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id AA26790DF67
	for <lists+linux-arm-msm@lfdr.de>; Wed, 19 Jun 2024 00:52:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5942E281918
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Jun 2024 22:52:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3519E1514E9;
	Tue, 18 Jun 2024 22:52:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="VG434ZFC"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D441B28DD0
	for <linux-arm-msm@vger.kernel.org>; Tue, 18 Jun 2024 22:51:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718751120; cv=none; b=kgkshrai8u1+ppFcNlLlobItKQIWv4yaP6C7dfDaFBPH8qG18EdQN/b10xdarfI/zxVDKQjSJxdjqHWdckasyoqr0Teh7Th5pIyDpQwTSfkAGRG1tjWpch6hL2RAbcz7EOg7qg82qPRSokCc3D54GQ5oxKeUP49qpMEC6O0bA8I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718751120; c=relaxed/simple;
	bh=QM8za5h5iUMULrqjUj817ZhF5FHHaPtNnVGpNUCs52s=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=byF6s+Q+wxxyhGGPnEZZAHigJu7pTMLwfxSiRefn0i0UOZWGkU1nuzlDh5nTefCLctl5h02URerbUC1uHcceiJM1dUml0U45yPnmDBdrvxnqOGe9AZ30aFAJO8NjVlFXws9/1G62oNWk9+9d5hZ6/1XLLY0rwZ339QYJaJ1cZsI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=VG434ZFC; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45ILegfW025755;
	Tue, 18 Jun 2024 22:51:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	qx8v2K1M8Jqc5cX77f/wHQRonys+DN8oGBtUtfbnySc=; b=VG434ZFCIXjRoKiX
	5mTXkLkWdK3Bx5bTopL/kNjuDazWog7CJce8QvDRlKDKwNGzPXB9Yklz6JpLeAl9
	bgvsygcReHPxWSLeuMc/ZsmZM6sE6IsPEkdb8qXgv+JkQtEZNUw5QQvN7hpNwZ4k
	y0y9mfHwRmSqQlJ9ij/G8+rDabNr7SSFNeLsia48kdphLVswNPlms4PY+MlUl84Z
	8db+tQb+1/mAY8qHgzZG3mGKg1j5bt2HOAIN/gHrauJFqK3d+I96m0JEvpcTO27u
	9Ji7OFI9V/BsoDq0Ae/N8cz/Co3OAhgsPOwu7+s4KfdXZAY3PQUOuAq715fj8QbE
	NfL9Ug==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3yujc4g3kp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 18 Jun 2024 22:51:50 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 45IMpn4T002280
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 18 Jun 2024 22:51:49 GMT
Received: from [10.134.71.247] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 18 Jun
 2024 15:51:49 -0700
Message-ID: <1c81986b-68a3-3945-fbe7-f5ae812e22bc@quicinc.com>
Date: Tue, 18 Jun 2024 15:51:49 -0700
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v3 4/9] drm/msm/dpu: split dpu_format_populate_layout
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Rob Clark
	<robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten
	<marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Daniel
 Vetter <daniel@ffwll.ch>
CC: Abel Vesa <abel.vesa@linaro.org>, Johan Hovold <johan+linaro@kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
        <freedreno@lists.freedesktop.org>
References: <20240614-dpu-mode-config-width-v3-0-29ec4069c99b@linaro.org>
 <20240614-dpu-mode-config-width-v3-4-29ec4069c99b@linaro.org>
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <20240614-dpu-mode-config-width-v3-4-29ec4069c99b@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: 2XR2HnXrTjA-pxrp2CTV1g37sYEkkmQo
X-Proofpoint-GUID: 2XR2HnXrTjA-pxrp2CTV1g37sYEkkmQo
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-18_05,2024-06-17_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 clxscore=1015
 priorityscore=1501 mlxlogscore=999 malwarescore=0 lowpriorityscore=0
 mlxscore=0 bulkscore=0 impostorscore=0 spamscore=0 phishscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2405170001 definitions=main-2406180168



On 6/13/2024 3:36 PM, Dmitry Baryshkov wrote:
> Split dpu_format_populate_layout() into addess-related and
> pitch/format-related parts.
> 
> Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>   .../gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c    |  8 +++-
>   drivers/gpu/drm/msm/disp/dpu1/dpu_formats.c        | 45 ++++++++++++----------
>   drivers/gpu/drm/msm/disp/dpu1/dpu_formats.h        |  8 +++-
>   drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c          | 12 ++++--
>   4 files changed, 46 insertions(+), 27 deletions(-)
> 

as promised,

Tested-by: Abhinav Kumar <quic_abhinavk@quicinc.com> # sc7280

