Return-Path: <linux-arm-msm+bounces-40658-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id EA7BE9E6572
	for <lists+linux-arm-msm@lfdr.de>; Fri,  6 Dec 2024 05:33:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9F42A18841A2
	for <lists+linux-arm-msm@lfdr.de>; Fri,  6 Dec 2024 04:33:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4D827192B76;
	Fri,  6 Dec 2024 04:33:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="Bse6Gb38"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A41C228FD;
	Fri,  6 Dec 2024 04:33:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733459587; cv=none; b=ndhR9sZlocGhRTBMg+MkVAE6zucB1jv2KQI8B6a0jK6IaBIwyxOhU6TlT4dbsmstDSTJxA6FbynBkK/MRL75btwx0NSIRgfy98BQd6BH0VRbIO0Wel2OHYjtlQ8lB3mRCsWgz5toZ5om4JU2xmoleAZkIi3qIxrqzrkJYHGtu+I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733459587; c=relaxed/simple;
	bh=O1GMf7ML/zK0OfZCW5etzHDpmwiOILRlOVF7A9rR1AE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=B+HFejDsRgb7QpeP/Ej9RmO0Kkf/UTqKCjMpZfHE4vfyOouT3xeax8YTeJrqKi0w15gGulFCTyv/qG6wCkCYXECh1QG2fKiXrMYMdT5P3mNIuWMSEmy43AY00w3e0b+JdL12a0AOqh2fKljDoFQ9ymdL1wjvn8f9VWIEgLJRUL8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=Bse6Gb38; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4B5Haf9H016423;
	Fri, 6 Dec 2024 04:32:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	3HLiWjt8g5cnnasW4dQTGwnTGuAXkDFee40PTFrz2QY=; b=Bse6Gb38glYjO3S6
	6XM3r/cRTK2adOM3I4wL+xtvaWNqlgMUt+8ehFFtFr9NwxVUYf0y2RFTx2y7PuOl
	6l8oOstUsb1d1tVhLw3JehwUvIxVwFHTQgUJWjqAB0T2l74kINjFGbJVtPz1kllR
	DO83p6H84anb68Zr6N9kv2k/D2GFLzvh37OKNvsSWAzi0+w7l5vzTAMN1+jG7XWz
	pLSL632zyDpY/XECyxqo9TWglic3sv8mQAWncik0FnD0Ci9P71MousqqjAZNfqsU
	+u4Fzz+BMNBSA0AjBUQgCy2RmobJwWDZL8NaZqEP7RqRhKgqqkQVQNA6QRH71c2I
	MhoDFA==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43bbnmj9mt-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 06 Dec 2024 04:32:26 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4B64WPUr007104
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 6 Dec 2024 04:32:25 GMT
Received: from abhinavk-linux1.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Thu, 5 Dec 2024 20:32:24 -0800
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
Date: Thu, 5 Dec 2024 20:31:32 -0800
Subject: [PATCH 01/45] drm/msm/dp: dont call dp_catalog_ctrl_mainlink_ctrl
 in dp_ctrl_configure_source_params()
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20241205-dp_mst-v1-1-f8618d42a99a@quicinc.com>
References: <20241205-dp_mst-v1-0-f8618d42a99a@quicinc.com>
In-Reply-To: <20241205-dp_mst-v1-0-f8618d42a99a@quicinc.com>
To: Rob Clark <robdclark@gmail.com>,
        Dmitry Baryshkov
	<dmitry.baryshkov@linaro.org>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten
	<marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, "Simona
 Vetter" <simona@ffwll.ch>,
        Stephen Boyd <swboyd@chromium.org>,
        "Chandan
 Uddaraju" <chandanu@codeaurora.org>,
        Guenter Roeck <groeck@chromium.org>,
        Kuogee Hsieh <quic_khsieh@quicinc.com>,
        Bjorn Andersson
	<andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring
	<robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
	<conor+dt@kernel.org>
CC: Vara Reddy <quic_varar@quicinc.com>, Rob Clark <robdclark@chromium.org>,
        Tanmay Shah <tanmay@codeaurora.org>, <linux-arm-msm@vger.kernel.org>,
        <dri-devel@lists.freedesktop.org>, <freedreno@lists.freedesktop.org>,
        <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
        Jessica Zhang
	<quic_jesszhan@quicinc.com>,
        Laurent Pinchart
	<laurent.pinchart@ideasonboard.com>,
        Abhinav Kumar
	<quic_abhinavk@quicinc.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1733459543; l=980;
 i=quic_abhinavk@quicinc.com; s=20240509; h=from:subject:message-id;
 bh=O1GMf7ML/zK0OfZCW5etzHDpmwiOILRlOVF7A9rR1AE=;
 b=HiJMK1HZQB62XJqc2liffkZ47wqz4XpBTNkDWL2nSYoOIfMIUZegg+qhjiYJhTytMjl4lihcp
 QNmWbj5w8peAJqPA4QyW7AjpqIuCNwEmGROWHFN/1QS2p26bJDz+nQ8
X-Developer-Key: i=quic_abhinavk@quicinc.com; a=ed25519;
 pk=SD3D8dOKDDh6BoX3jEYjsHrTFwuIK8+o0cLPgQok9ys=
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: 5hJIannSLd589px--f4uWRlQ6xXd-CDG
X-Proofpoint-GUID: 5hJIannSLd589px--f4uWRlQ6xXd-CDG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 mlxlogscore=782 priorityscore=1501 spamscore=0 impostorscore=0 bulkscore=0
 suspectscore=0 adultscore=0 clxscore=1011 phishscore=0 mlxscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412060030

Once the link has already been setup there is no need to call
dp_catalog_ctrl_mainlink_ctrl() as this does a reset on the mainlink
thereby tearing down the link briefly.

Fixes: c943b4948b58 ("drm/msm/dp: add displayPort driver support")
Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
---
 drivers/gpu/drm/msm/dp/dp_ctrl.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_ctrl.c b/drivers/gpu/drm/msm/dp/dp_ctrl.c
index bc2ca8133b790fc049e18ab3b37a629558664dd4..a8069f7c4773f087229727dc38c9af0d6d84f863 100644
--- a/drivers/gpu/drm/msm/dp/dp_ctrl.c
+++ b/drivers/gpu/drm/msm/dp/dp_ctrl.c
@@ -178,7 +178,6 @@ static void msm_dp_ctrl_configure_source_params(struct msm_dp_ctrl_private *ctrl
 	u32 cc, tb;
 
 	msm_dp_catalog_ctrl_lane_mapping(ctrl->catalog);
-	msm_dp_catalog_ctrl_mainlink_ctrl(ctrl->catalog, true);
 	msm_dp_catalog_setup_peripheral_flush(ctrl->catalog);
 
 	msm_dp_ctrl_config_ctrl(ctrl);

-- 
2.34.1


