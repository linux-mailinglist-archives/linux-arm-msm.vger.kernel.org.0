Return-Path: <linux-arm-msm+bounces-48315-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 9889DA3905A
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Feb 2025 02:24:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 59C3216C51D
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Feb 2025 01:24:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 617884D8CE;
	Tue, 18 Feb 2025 01:23:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="I9SHbfJd"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C6AE196;
	Tue, 18 Feb 2025 01:23:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739841839; cv=none; b=WFI7mugFpSYlaLbZ6B1wjpJFMyffFNGzPtTrUsK0hX/h4h2UVyJDsmTbNjBqphHlZqPcd9N87WX6JhkkbJh85cmxkgZcQCOuec9i4c4nAA2hiXSENLs7lGPOk7RB4ROU8ZcQieDMETDmAlpRPP478bT5DTLEDEhS2Cs6WDn8pwg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739841839; c=relaxed/simple;
	bh=9oVGiwMKiW7/YtFEjLui8oLPBFncpYRUwuXpmJFIbVI=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=bd/Wki1HqZPY69fd6gyT/D/jiPyTi+ivnPVn9NFs6+YX/KRsUyCnStIKzuVcHqppXcVKN6etEFghkflGKn4MSKyy879FUob4fYsYaclZ9/+AaZV80lqpGF9UkQaJ1QLRwH1JqouzrCNkwguoTDO7O7uBo7oxqkWkCfG43sfI/gE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=I9SHbfJd; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51HAg5va014197;
	Tue, 18 Feb 2025 01:23:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	qMEutTQVuGjBpi2D26yi/Ff62sncQlmCdz6+YwL3Rkw=; b=I9SHbfJdDRfxLLcQ
	OMZcaeo+ERBKdhronzl3b40hibxW9hzXFr4YrUFXV9qxfIF+Gz4ypbTl5UPVXXCB
	JZ5TA7t9cVlPSghFYLGTwJGKVJ3NXaLP9cExGAp//XvLKNN4YQAD9SOSF2QZK8xe
	ImNo1n/HfgpX3H9gzuFY7kwLvkj4FaOMblasU/DcMm0Hx6PqVio3VNZjEWvpAaiz
	AXhF/CC2bD+lXt4nvF/h6Lc0puPOikI96C2NV4P5AnFo1lOQ9iGfhZIJ1TxfnqAp
	iBXmmNccpQqCe81YbNzgUKMWmhazLJIH+DY1xFizh0QPedOYiGNJCTNJPdZIjaT3
	NLfLrg==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44ut7tu7xd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 18 Feb 2025 01:23:41 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 51I1NebU007543
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 18 Feb 2025 01:23:40 GMT
Received: from abhinavk-linux1.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Mon, 17 Feb 2025 17:23:40 -0800
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
To: Rob Clark <robdclark@gmail.com>,
        Dmitry Baryshkov
	<dmitry.baryshkov@linaro.org>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten
	<marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, "Simona
 Vetter" <simona@ffwll.ch>,
        Jonathan Marek <jonathan@marek.ca>,
        "Krzysztof
 Kozlowski" <krzysztof.kozlowski@linaro.org>
CC: Abhinav Kumar <quic_abhinavk@quicinc.com>, <linux-arm-msm@vger.kernel.org>,
        <dri-devel@lists.freedesktop.org>, <freedreno@lists.freedesktop.org>,
        <linux-kernel@vger.kernel.org>, Rob Clark
	<robdclark@chromium.org>
Subject: Re: (subset) [PATCH v3 0/4] drm/msm/dsi/phy: Improvements around concurrent PHY_CMN_CLK_CFG[01]
Date: Mon, 17 Feb 2025 17:23:29 -0800
Message-ID: <173984160581.1759776.15253644637290957859.b4-ty@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250214-drm-msm-phy-pll-cfg-reg-v3-0-0943b850722c@linaro.org>
References: <20250214-drm-msm-phy-pll-cfg-reg-v3-0-0943b850722c@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: yik5yCM9l82EwYzBK7JPIH-3VsrL1uxf
X-Proofpoint-ORIG-GUID: yik5yCM9l82EwYzBK7JPIH-3VsrL1uxf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-17_09,2025-02-13_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 spamscore=0
 suspectscore=0 lowpriorityscore=0 malwarescore=0 impostorscore=0
 mlxscore=0 mlxlogscore=782 clxscore=1015 phishscore=0 priorityscore=1501
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2501170000 definitions=main-2502180006


On Fri, 14 Feb 2025 16:08:40 +0100, Krzysztof Kozlowski wrote:
> Changes in v3:
> - Define bitfields in patches 1-3, so move there parts from patch #4
> - Use FIELD_GET
> - Keep separate cached->bit_clk_div and pix_clk_div
> - I think this implements entire feedback from Dmitry
> - Link to v2: https://lore.kernel.org/r/20250203-drm-msm-phy-pll-cfg-reg-v2-0-862b136c5d22@linaro.org
> 
> [...]

Applied to msm-fixes, thanks!

[1/4] drm/msm/dsi/phy: Protect PHY_CMN_CLK_CFG0 updated from driver side
      https://gitlab.freedesktop.org/drm/msm/-/commit/588257897058
[2/4] drm/msm/dsi/phy: Protect PHY_CMN_CLK_CFG1 against clock driver
      https://gitlab.freedesktop.org/drm/msm/-/commit/5a97bc924ae0
[3/4] drm/msm/dsi/phy: Do not overwite PHY_CMN_CLK_CFG1 when choosing bitclk source
      https://gitlab.freedesktop.org/drm/msm/-/commit/73f69c6be2a9

Best regards,
-- 
Abhinav Kumar <quic_abhinavk@quicinc.com>

