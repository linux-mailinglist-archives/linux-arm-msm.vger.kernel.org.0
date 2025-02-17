Return-Path: <linux-arm-msm+bounces-48313-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id ADA0AA38FD0
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Feb 2025 00:59:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A46EF1887A16
	for <lists+linux-arm-msm@lfdr.de>; Mon, 17 Feb 2025 23:59:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4DFD71ACEBA;
	Mon, 17 Feb 2025 23:59:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="HR/GfALI"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D562315666D;
	Mon, 17 Feb 2025 23:59:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739836755; cv=none; b=O/+L9gfJUzyI9zB937yPFrHMQnQoYb5viXeG3tUabQJdq2dNOO5ypK8NxebQ0JuAuv0KljF7eSK28F/w6H1eJ2UBuWFgZK8QBtxk3kdYiUZ7Hu+P+Ql5iEaO1imL3RaoGYtpfoHr3oDnvgnY8rDmtExw0BhLczUSJ77ihDmOI8o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739836755; c=relaxed/simple;
	bh=6cPuqss60vqDrZyS1BXGI6Mg02FDD1rCqoUWC60NMJA=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=KOhvGUvtYg7ixmzRbdKJI51fMJZknM3v8zR4i1eRJIHqwZ+eurs2unaCSGngdKt+ZK1BEs2+ZAeNrjnrZl6gj1seBraRoT8z7BEbIr1DRJOOXY9Vy5cTGdlLoJ4qtFFMAjEy1Gs5n7Ve4PX6ZxPZ6XEYYBlWCZ+dvJct1+A4JxY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=HR/GfALI; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51HAd7uZ026649;
	Mon, 17 Feb 2025 23:59:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	lMqMZLTYa2kYLC7D9fFxESD4s5mT7HcSQDi9amyaCIU=; b=HR/GfALI+fiDt4WL
	87TMC38N7MmGIGi0z67zVrAJNzUjmv9zR2KViX1P0avT2+2XM/t1v0NZF2idOELP
	tae5kbq/gcTqPsqMQamMbFawih2EcgJDRk6n7xS8ZAv3QrpWM1CtP9EU0PCXcTdK
	3szB/2hY80eN4knFbxrekphO1OWX7sRTH85K49m9qWbONtvpYLaOIDJU3mQS1CFn
	mov/QA4KK15u2e70vM9X/QoaRtZBTvbVMgPHq8T5d2cZ6YdbG8DofvVzVAYUYBhx
	knNEkbJt+7qNyAA8O+I7S64UHWopQJIO4GfRh2cA8eLJwzC5aGLd11gkuXMptG5M
	6Ci7RA==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44ut7sk26y-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 17 Feb 2025 23:59:05 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 51HNx4og028195
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 17 Feb 2025 23:59:04 GMT
Received: from abhinavk-linux1.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Mon, 17 Feb 2025 15:59:04 -0800
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
To: Rob Clark <robdclark@gmail.com>,
        Dmitry Baryshkov
	<dmitry.baryshkov@linaro.org>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten
	<marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, "Simona
 Vetter" <simona@ffwll.ch>,
        Jessica Zhang <quic_jesszhan@quicinc.com>
CC: Abhinav Kumar <quic_abhinavk@quicinc.com>, <linux-arm-msm@vger.kernel.org>,
        <dri-devel@lists.freedesktop.org>, <freedreno@lists.freedesktop.org>,
        <linux-kernel@vger.kernel.org>
Subject: Re: (subset) [PATCH 2/2] drm/msm/dpu: Drop extraneous return in dpu_crtc_reassign_planes()
Date: Mon, 17 Feb 2025 15:58:56 -0800
Message-ID: <173983666324.1740000.4701768298873523057.b4-ty@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250108-virtual-planes-fixes-v1-2-420cb36df94a@quicinc.com>
References: <20250108-virtual-planes-fixes-v1-0-420cb36df94a@quicinc.com> <20250108-virtual-planes-fixes-v1-2-420cb36df94a@quicinc.com>
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
X-Proofpoint-GUID: i_08xV6m383Dqmiq7MT6vQNlEcLbfTM4
X-Proofpoint-ORIG-GUID: i_08xV6m383Dqmiq7MT6vQNlEcLbfTM4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-17_08,2025-02-13_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 phishscore=0 impostorscore=0 bulkscore=0 spamscore=0 priorityscore=1501
 suspectscore=0 malwarescore=0 mlxscore=0 mlxlogscore=687 adultscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2501170000 definitions=main-2502170181


On Wed, 08 Jan 2025 14:40:48 -0800, Jessica Zhang wrote:
> Drop extra return at the end of dpu_crtc_reassign_planes()
> 
> 

Applied to msm-fixes, thanks!

[2/2] drm/msm/dpu: Drop extraneous return in dpu_crtc_reassign_planes()
      https://gitlab.freedesktop.org/drm/msm/-/commit/5e192eefebaa

Best regards,
-- 
Abhinav Kumar <quic_abhinavk@quicinc.com>

