Return-Path: <linux-arm-msm+bounces-40678-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 74D1E9E65F5
	for <lists+linux-arm-msm@lfdr.de>; Fri,  6 Dec 2024 05:34:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4B38E1883E84
	for <lists+linux-arm-msm@lfdr.de>; Fri,  6 Dec 2024 04:34:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 405721DC74A;
	Fri,  6 Dec 2024 04:33:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="P4dR3Vyc"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 630221D6DBC;
	Fri,  6 Dec 2024 04:33:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733459593; cv=none; b=IH2BxVD2OGAlghjKF854qbl+LKUk1TaP9oNfW9+vOtw79vvcTUDHlT3qDJauEcy3EuqTCMDCkY0gEy1CD44ZKjSfGaUPK0j10sxRP1145ADFjTO8DfafYjP2BvVrCevDDItfoU+vKtCLIMUuGKGbUHxsVAvF79yi7/Nz9VeIZe0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733459593; c=relaxed/simple;
	bh=IbEfMFEG3Bwu5GHQBbwOjdeDxXLDzPEFoz7GTgUTlGQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=eG31U2/uXUs/yIYK2BywDCLj/NnMyQS031d5M4IDP6wmgd7RQMXCD7ApyUsr/56oyUUnpQUZ1qzpacrXT3TI2CBJgHKWx90nausrKxhPuCJWgm3iDS3TakdnUQxyttvQL0MBG7Q9fzCXAYK9Rx0/hygj2H8pc7YFObg+6JDwqLE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=P4dR3Vyc; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4B5HahQi005401;
	Fri, 6 Dec 2024 04:32:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	QURLaWbcQwFTzlhE4yfoG9hhFXsSYsRmI7mkRW7tFPk=; b=P4dR3VycWEoLYDKJ
	2Vmw7JJx72PO7fiqDP9RK5gZmnK1HbhWJy6x1Jxv1UO1H29wFmGk2+uXT2w+BP7X
	bn7/rugKljJfUctHzXGQUfsUOMN0t3SU097uFKC2C2Ovf3ktCcjjVthMH5SSrKpn
	aBWdVOJvpx6kluGjL//TVYz4Ta77Fvi8tU1XiF3ygTXakU0NyCldSo9X33kQ9qoD
	lPhxBZa7a9lmAJhCK6hpzxqAAanqDo62QCy3d2l1LDu1SlIXVi98/l00Z+r8V2xn
	aZQLOguZINPgaq2Eag69xcrcsYBCRF3zm2gljmC9aUbu1Q7fRtL+JP8RsU1bDHHH
	1AZE8A==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43ba142k80-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 06 Dec 2024 04:32:41 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4B64WefV016374
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 6 Dec 2024 04:32:40 GMT
Received: from abhinavk-linux1.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Thu, 5 Dec 2024 20:32:39 -0800
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
Date: Thu, 5 Dec 2024 20:31:58 -0800
Subject: [PATCH 27/45] drm/msm/dp: make the SST bridge disconnected when
 mst is active
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20241205-dp_mst-v1-27-f8618d42a99a@quicinc.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1733459543; l=797;
 i=quic_abhinavk@quicinc.com; s=20240509; h=from:subject:message-id;
 bh=IbEfMFEG3Bwu5GHQBbwOjdeDxXLDzPEFoz7GTgUTlGQ=;
 b=aWEVl8I//1q8X52hqrNSAXq+G48P35H6rQ/4FIGd2iHNFtfIqnns7wYIKcMx8tFHl34oz3sUW
 iKIsWJYMAt9CyLqt1w6fFp9aYein1BzwrIh35twQ1urdaywLgwdFDC7
X-Developer-Key: i=quic_abhinavk@quicinc.com; a=ed25519;
 pk=SD3D8dOKDDh6BoX3jEYjsHrTFwuIK8+o0cLPgQok9ys=
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: Q8PStUeZO1IYnbTHQXcCWzXomdA6Tl8s
X-Proofpoint-ORIG-GUID: Q8PStUeZO1IYnbTHQXcCWzXomdA6Tl8s
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 bulkscore=0
 phishscore=0 clxscore=1015 mlxscore=0 lowpriorityscore=0 adultscore=0
 priorityscore=1501 suspectscore=0 mlxlogscore=943 malwarescore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412060030

Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
---
 drivers/gpu/drm/msm/dp/dp_drm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_drm.c b/drivers/gpu/drm/msm/dp/dp_drm.c
index 920392b3c688821bccdc66d50fb7052ac3a9a85a..225858c6240512cf2c5ca3b5eb52cf9b7f4db3e3 100644
--- a/drivers/gpu/drm/msm/dp/dp_drm.c
+++ b/drivers/gpu/drm/msm/dp/dp_drm.c
@@ -27,7 +27,7 @@ static enum drm_connector_status msm_dp_bridge_detect(struct drm_bridge *bridge)
 	drm_dbg_dp(dp->drm_dev, "link_ready = %s\n",
 		(dp->link_ready) ? "true" : "false");
 
-	return (dp->link_ready) ? connector_status_connected :
+	return (dp->link_ready && !dp->mst_active) ? connector_status_connected :
 					connector_status_disconnected;
 }
 

-- 
2.34.1


