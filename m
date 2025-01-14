Return-Path: <linux-arm-msm+bounces-44946-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 48305A0FE27
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Jan 2025 02:33:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 624461695FE
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Jan 2025 01:33:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 42D45381AF;
	Tue, 14 Jan 2025 01:33:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="Vi1urCkz"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B738335965
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Jan 2025 01:33:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736818424; cv=none; b=noKHLOnXDBBBXCcw959g76Emo4U1am5N6Y/UpHSluuj/psx8o9zSl/5n0Tq+Fk/OXEhXm5ZykqhJJGHqpltvDUrDIGWFVYwHeY6qNV6Yr2dHoiTVa1x6w1OCMNWWT2wHoGYvpiXv1cbHV/CKXxtKxN3ovSeTnZEX4q01Ay3dT0M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736818424; c=relaxed/simple;
	bh=hP4aS42Dy+lds6Ss0vkzLcOryrJeJJhClSwCaFi/wu4=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=MMwWBsBoGzX4+3r2eiM5FMwtK0RPKWVg2lHP6FQOkQBo+9BA4DGcSDRZnaup2HHnCsoXm7T8RROIap2ZI+IKGXZzAZZkg1U0nGNpFb0Pfr2N+qq+osHfLs1U/fMy1Z2698tHbKqYtqmGeayjnQzzEEXFHQYAyZufpDsHewd/JSQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=Vi1urCkz; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50DKYwor024316;
	Tue, 14 Jan 2025 01:33:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	nUMSjrqKUHDxE0MWexfqzoHlNVxDZ832ze2t77Cj/7w=; b=Vi1urCkzQTJLiGKp
	cyfNHY1wIo2p9b+6QKipAdbN2Hjt6FTyIUG1fbNSaAfsaE34lNsoaO+Yr6p5L1eF
	rHztSZqDMqkS+OQHC416cxBpJGaJKmtrjmt2MkTDE/37EowVkxcgKeFyo7ESdIWA
	5oRXxsJ0oEkqjmpE229LPT9O20VIAgjKwF+ajFHIdQAf/jhyNifE/R92IHsiVqLw
	TBoARXJ1ixVpjRS2aDfUeh6s+8nE+v3qK1cSIsEAjftKnk2dQ6GvtvhUn2eE1uSF
	UnurS8HoNOeOdKl7qZRpJ8Tq5mFd9RonkUtWgJYvOjcogLu3kvyx3rwpYjhLWjRz
	w7z+Kg==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 445a06gh6p-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 14 Jan 2025 01:33:36 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 50E1XZNi014637
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 14 Jan 2025 01:33:35 GMT
Received: from [10.71.108.79] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 13 Jan
 2025 17:33:34 -0800
Message-ID: <a6e9f2e3-4d28-4a7e-b3c9-2f97e0ef2405@quicinc.com>
Date: Mon, 13 Jan 2025 17:33:33 -0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 5/9] drm/msm/dpu: also use KBps for bw_ctl output
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Rob Clark
	<robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten
	<marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Stephen
 Boyd <swboyd@chromium.org>,
        Simona Vetter <simona.vetter@ffwll.ch>
CC: <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
        <freedreno@lists.freedesktop.org>
References: <20250106-dpu-perf-rework-v4-0-00b248349476@linaro.org>
 <20250106-dpu-perf-rework-v4-5-00b248349476@linaro.org>
Content-Language: en-US
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <20250106-dpu-perf-rework-v4-5-00b248349476@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: T4cRf6m_w19JSZDbnqZMqpzQlC7w7-zr
X-Proofpoint-ORIG-GUID: T4cRf6m_w19JSZDbnqZMqpzQlC7w7-zr
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=837
 priorityscore=1501 malwarescore=0 lowpriorityscore=0 phishscore=0
 spamscore=0 mlxscore=0 bulkscore=0 impostorscore=0 clxscore=1015
 suspectscore=0 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2411120000 definitions=main-2501140010



On 1/5/2025 7:07 PM, Dmitry Baryshkov wrote:
> Change debugfs and log entries to use KBps / u32 for bw_ctl and similar
> data.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>   drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c | 5 +++--
>   drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c      | 3 ++-
>   2 files changed, 5 insertions(+), 3 deletions(-)
> 

Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>

