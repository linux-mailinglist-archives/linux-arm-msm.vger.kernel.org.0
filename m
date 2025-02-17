Return-Path: <linux-arm-msm+bounces-48299-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 840A9A38EE0
	for <lists+linux-arm-msm@lfdr.de>; Mon, 17 Feb 2025 23:13:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8419A189626E
	for <lists+linux-arm-msm@lfdr.de>; Mon, 17 Feb 2025 22:12:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 866E41AA1E0;
	Mon, 17 Feb 2025 22:10:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="L/otBlqE"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9B721A8402;
	Mon, 17 Feb 2025 22:10:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739830259; cv=none; b=mpnsTUX5AcWG/Lkj+VldMZx6Ve3I7fGxwp0Al1wh9Nac07YF9/VJrg8oilA5xIO2HirwqCNxm1omqt9Ufs7mR1sAvfNQ6tzVchi8gx1eXsBIdAI9lHnLN8/zuI4NyAGGjmDkad/h6ZYsBI3//lSLUcclfPYphqZlBmx2AmheHto=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739830259; c=relaxed/simple;
	bh=kz2joIaUFNhKMcE7TsiNBZLC3yx9ts0wwnhOk56savA=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=FOH3y6Dv+MKnAgQb6o4HEHfikeAOIbN2NLVrOoOqgWSu+zK+cSZ08ygLZan7eBTAyw4Lll2Zm82iF6O7zqOyRqN5AzZXbfFfBekG40O5LuuPZjFUDnI+a6UUrZiHnE/MDZ4zV4eTlODFKDxrF0g1FLqWrCpvkFAMnwB7o/5duIw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=L/otBlqE; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51HAisBn004459;
	Mon, 17 Feb 2025 22:10:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	LZO4RmAwdWvHhYb8qMLxm/nSTg9V+VwwT6x0u1skeEc=; b=L/otBlqE+gbq85BM
	WgeeUrcJCMrF36W4W3MNERaOVQUehpx5Uka7cr1KpRacic2xBhZCLac+K2MC3P1i
	zju9KIh6k3FjaOpD8g95dSrdM9xr7azTUYO/BX4p//ucL1OdfA7vsFrlLQ0Ck7zj
	kWyBiVr5YLWj1JRZJ4R9qfaiQ59n67iQlnobHQDb4yyBsYpUcxLeSrzh9Zxwtfxy
	SLV/kg0Gdt8DC+avPjcLhz27hFMyIw5G145d7c25KSoNuqBNViKe/zCcn/zHO/+R
	4wvVPdaQkBCZay5MNZDpye56Na/9LK1sDj2HXIsXEg/YZj1W7jN/SHyan2uu/5pm
	5Wglfw==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44v3mg1duj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 17 Feb 2025 22:10:46 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 51HMAiIR004908
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 17 Feb 2025 22:10:44 GMT
Received: from abhinavk-linux1.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Mon, 17 Feb 2025 14:10:44 -0800
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        "Marijn
 Suijten" <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Vinod Koul <vkoul@kernel.org>, Konrad Dybcio
	<konradybcio@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
CC: Abhinav Kumar <quic_abhinavk@quicinc.com>, <linux-arm-msm@vger.kernel.org>,
        <dri-devel@lists.freedesktop.org>, <freedreno@lists.freedesktop.org>,
        <linux-kernel@vger.kernel.org>
Subject: Re: (subset) [PATCH 00/35] drm/msm/dpu: rework HW block feature handling
Date: Mon, 17 Feb 2025 14:10:26 -0800
Message-ID: <173982978188.1706705.18136509869048284263.b4-ty@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241214-dpu-drop-features-v1-0-988f0662cb7e@linaro.org>
References: <20241214-dpu-drop-features-v1-0-988f0662cb7e@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: rlyp48cn0jiv6PkP1lfCgzG4n7DNNeOI
X-Proofpoint-ORIG-GUID: rlyp48cn0jiv6PkP1lfCgzG4n7DNNeOI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-17_08,2025-02-13_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 bulkscore=0 clxscore=1015 adultscore=0 priorityscore=1501 mlxscore=0
 phishscore=0 spamscore=0 mlxlogscore=927 impostorscore=0 malwarescore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2501170000 definitions=main-2502170173


On Sat, 14 Dec 2024 00:14:16 +0200, Dmitry Baryshkov wrote:
> Some time ago we started the process of converting HW blocks to use
> revision-based checks instead of having feature bits (which are easy to
> miss or to set incorrectly). Then the process of such a conversion was
> postponed. (Mostly) finish the conversion. The only blocks which still
> have feature bits are SSPP, WB and VBIF. In the rare cases where
> behaviour actually differs from platform to platform (or from block to
> block) use unsigned long bitfields, they have simpler syntax to be
> checked and don't involve test_bit() invocation.
> 
> [...]

Applied to msm-fixes, thanks!

[01/35] drm/msm/dpu: skip watchdog timer programming through TOP on >= SM8450
        https://gitlab.freedesktop.org/drm/msm/-/commit/2f69e5458447
[02/35] drm/msm/dpu: enable DPU_WB_INPUT_CTRL for DPU 5.x
        https://gitlab.freedesktop.org/drm/msm/-/commit/af0a4a2090cc

Best regards,
-- 
Abhinav Kumar <quic_abhinavk@quicinc.com>

