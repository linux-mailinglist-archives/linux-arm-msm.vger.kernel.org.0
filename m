Return-Path: <linux-arm-msm+bounces-40685-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id D06829E660E
	for <lists+linux-arm-msm@lfdr.de>; Fri,  6 Dec 2024 05:36:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 57ABD1619B8
	for <lists+linux-arm-msm@lfdr.de>; Fri,  6 Dec 2024 04:36:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C726D1F668E;
	Fri,  6 Dec 2024 04:33:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="XTvTkJZn"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C50D31E282D;
	Fri,  6 Dec 2024 04:33:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733459598; cv=none; b=S+xkEOMHDCBr2Ta6cW+Ywh/14bSgSypwJt8Fv/VAifMZH+QvIX2LalK5liebDMj+OjWQuhXrOIFLki+YsZ5noYxye/zqrGgZ1318SABy43Wl1NWRSGE0wjPpfLQlgiyeoOBPVqc/lWC3gDJ0Mc+AhDsIULngCWnL2bMdsgpqoEU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733459598; c=relaxed/simple;
	bh=vF4pbsDZSIkvUA2jBBS1wHa0UpDRC2QmIDLSGxlVkeI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=LyyY2Lm8tWcBV1Xir+/1+KAcdAB181iJG4wzM7nBa5gfTVw04NxRwcwXoLSLmH8rF18cH54DVABfxM5kEuh8jc4SAxvMOz7rhFiZAZxR0KjL3zeScl9ktnQuITLYby8yDYoc8pdL8qMBBAxZU1Q8BgDnyemb2xtIW4GoBihDSw4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=XTvTkJZn; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4B62S8qc004287;
	Fri, 6 Dec 2024 04:32:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	tjP0Mguzax7cHwImo5rW5rhiceEC8tRn1O7bb2yoJHg=; b=XTvTkJZnPzw9zASQ
	OZYEmyt2PyVghQ4L3yud28XW2PLWO/NeVlFKJdNELH9JzWkWUU+nliXQcSpJ3bfl
	yAldI03Yr8sQuNCP8rweTU+MFOBhXuctdUCZO6ghR0yN/re0OGpVmMNAhrj9fGuC
	ykmV7W5BMciy0VYSh3k29gy2hE0ym+oefa1hFUkZKTI9liSmoJLf/taozvFT0aP1
	Tp+umjq+188lylvNfPF/4JTCnuX1YugtrS1CIfhq6rYNGfMU4r1soptiPX9KbRq6
	4J74hbBlRBdKXk1gfAu//pnuRar3LaMDk0ONY3y73g7Gx/S0q8rNN39SMa/uRPPr
	G/LW1Q==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43brgp08yj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 06 Dec 2024 04:32:41 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4B64WfpG007185
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 6 Dec 2024 04:32:41 GMT
Received: from abhinavk-linux1.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Thu, 5 Dec 2024 20:32:40 -0800
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
Date: Thu, 5 Dec 2024 20:32:00 -0800
Subject: [PATCH 29/45] drm/msm/dp: skip reading the EDID for MST cases
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20241205-dp_mst-v1-29-f8618d42a99a@quicinc.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1733459543; l=1007;
 i=quic_abhinavk@quicinc.com; s=20240509; h=from:subject:message-id;
 bh=vF4pbsDZSIkvUA2jBBS1wHa0UpDRC2QmIDLSGxlVkeI=;
 b=G5Um2F+DCCJrDmVr2p1aUl2UPFHTfPOvg8RwsBsUEPKgvfOkcTFWiP0n/bIhKthXKV3FbvrWw
 ZZux4t91hioDBRjMXVdepM+NozRRpGB3or93Vnga8SIkYpL+lsSmq7Z
X-Developer-Key: i=quic_abhinavk@quicinc.com; a=ed25519;
 pk=SD3D8dOKDDh6BoX3jEYjsHrTFwuIK8+o0cLPgQok9ys=
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: DE6xcVsa2-2R6CB0b5A829Xvsz-T8qsw
X-Proofpoint-ORIG-GUID: DE6xcVsa2-2R6CB0b5A829Xvsz-T8qsw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 clxscore=1015
 adultscore=0 lowpriorityscore=0 mlxscore=0 spamscore=0 suspectscore=0
 priorityscore=1501 phishscore=0 impostorscore=0 mlxlogscore=999
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412060030

For MST cases, EDID is handled through AUX sideband messaging.
Skip the EDID read during hotplug handle for MST cases.

Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
---
 drivers/gpu/drm/msm/dp/dp_display.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index 033d238e956263c1212fce45aab01316ef341edb..a67bc7c1b83a5a9996435804ff7337f72dae93a0 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -420,9 +420,11 @@ static int msm_dp_display_process_hpd_high(struct msm_dp_display_private *dp)
 	if (rc)
 		goto end;
 
-	rc = msm_dp_panel_read_edid(dp->panel, connector);
-	if (rc)
-		goto end;
+	if (dp->max_stream <= DEFAULT_STREAM_COUNT || !msm_dp_panel_read_mst_cap(dp->panel)) {
+		rc = msm_dp_panel_read_edid(dp->panel, connector);
+		if (rc)
+			goto end;
+	}
 
 	msm_dp_link_process_request(dp->link);
 

-- 
2.34.1


