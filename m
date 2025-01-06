Return-Path: <linux-arm-msm+bounces-44039-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id C9573A030A5
	for <lists+linux-arm-msm@lfdr.de>; Mon,  6 Jan 2025 20:33:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 496E53A36BD
	for <lists+linux-arm-msm@lfdr.de>; Mon,  6 Jan 2025 19:33:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A758D1DEFD0;
	Mon,  6 Jan 2025 19:32:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="hSc+M8AW"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9D331DFE33;
	Mon,  6 Jan 2025 19:32:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736191978; cv=none; b=tO6/g5hBc5G7LxeM5VZ2IL+KbdhNtmmVQmt4PW2RNQwW7xJJunsIjmVoidysfu6LoPb065Jjd3u1sDcmnZZTGCCzj72i/zLvG/bxLwkNnJNy/Q384+YOdJo4WtRvIhhFVMXJcpsi21gkjfOkX2UuIXlSU4MvB1TT3JFJJpV1qMU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736191978; c=relaxed/simple;
	bh=jbojpJELzawxA+9H40CsIDDaqIOnvrF5f6aUTJXfDXE=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=L5/m2bngJGExXL1FsGvW1BHJT+xK0pRQwp3oyf24UUKPUkZdjBB8lQlE76gahREeqRHqyM9+iU9RrygWaBAK2/Mex9cCsoZTOOKbXHUoD0USg1ACgAd/QVorIVOImXbOjFGcPBp9Is9qqwqguUZQz+r/x4Bvy1gs1gQEPDiWlWo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=hSc+M8AW; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 506HrmqI012208;
	Mon, 6 Jan 2025 19:32:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	fEkajOg6ZoFU0sPYfi+oBvbYPQbEN4kxtOoBkXJnPLk=; b=hSc+M8AWqK8YnMN8
	7ipvooUeyuKD33dtQWUiapUd5E1rgucaCGDmcB3EnEGVWLirYHi+oC/phTPFXlCn
	0IGAf/ay2TVPMjvJXWOId2FvGaUXlSwKYi0cKQdSeuXoH9RimYMZEIc+nQCrg38B
	7yi9AX23tHTKdVWimGLYVcibho94aV0YX1YoeUjQhhlsy1DbN4L5+43d+G+Ij0y3
	8qHKE6D0eJmulrFDa7I1Tl/84I7Ew5arySKazgxMAQf52fRxMiY4MJu3mXG34eJt
	fcECOfxZik0V3ln3ZqeNHt5ZmBFtVabor8gvGgYtxrQnSnb+gs5ehIRKeOa7PRgK
	kwlybQ==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 440kyqg6fm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 06 Jan 2025 19:32:49 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 506JWmlH002420
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 6 Jan 2025 19:32:48 GMT
Received: from [10.134.71.247] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 6 Jan 2025
 11:32:48 -0800
Message-ID: <dc7649bd-f237-458e-ada8-3f9fe0b43bcd@quicinc.com>
Date: Mon, 6 Jan 2025 11:32:47 -0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] drm/msm/dpu: correct LM pairing for SM6150
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Rob Clark
	<robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten
	<marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, "Simona
 Vetter" <simona@ffwll.ch>
CC: Li Liu <quic_lliu6@quicinc.com>, Fange Zhang <quic_fangez@quicinc.com>,
        <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
        <freedreno@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>
References: <20241217-dpu-fix-sm6150-v2-1-9acc8f5addf3@linaro.org>
Content-Language: en-US
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <20241217-dpu-fix-sm6150-v2-1-9acc8f5addf3@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: mSCcrWUGpC7i08ZzUnDRxfviZEb2LW7Y
X-Proofpoint-GUID: mSCcrWUGpC7i08ZzUnDRxfviZEb2LW7Y
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 mlxscore=0
 impostorscore=0 malwarescore=0 adultscore=0 priorityscore=1501
 mlxlogscore=780 clxscore=1015 phishscore=0 suspectscore=0 spamscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2501060171



On 12/17/2024 4:35 AM, Dmitry Baryshkov wrote:
> The SM6150 platform doesn't have 3DMux (MERGE_3D) block, so it can not
> split the screen between two LMs. Drop lm_pair fields as they don't make
> sense for this platform.
> 
> Suggested-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> Fixes: cb2f9144693b ("drm/msm/dpu: Add SM6150 support")
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
> Changes in v2:
> - Dropped lm_pair field as recommended by Abhinav.
> - Link to v1: https://lore.kernel.org/r/20241216-dpu-fix-sm6150-v1-1-9fd7ce2ff606@linaro.org
> ---
>   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_3_sm6150.h | 2 --
>   1 file changed, 2 deletions(-)
> 

Thanks!

Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>

