Return-Path: <linux-arm-msm+bounces-39976-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 269FF9E107C
	for <lists+linux-arm-msm@lfdr.de>; Tue,  3 Dec 2024 01:41:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DF64228698C
	for <lists+linux-arm-msm@lfdr.de>; Tue,  3 Dec 2024 00:41:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E907F51016;
	Tue,  3 Dec 2024 00:39:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="G8QwDz7r"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E7E92E414
	for <linux-arm-msm@vger.kernel.org>; Tue,  3 Dec 2024 00:39:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733186374; cv=none; b=LSJO7DGHcDq5ZjH8uvNnPsszCKmAYnK9U9FmlPuHCxn3kholGblzOQ47gvWE57dVZ1auELBrmjUYSdmD4RW20BZCQaERW3f/mMLLny8oEF6XlGEJGVHtT/GbPv/6ytsWtbB/ORNYmyGzNnAW7vVLMUXvjnDNbCAPJxi0PwzVVX8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733186374; c=relaxed/simple;
	bh=ulOrtwLyA5l17UFXotN3R2Cj8YZLtDzpwCEPaPc3xA4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=XK8offK7x5FuGNr5S0tpVMdwX/Yv/5/Hhpq0/CO4fzhr6qtOEPi2fJMmqyKZge1Jt71yAsbkdJ5NE9D8EM8siH+k07WWHAyjspEojFBHJEjqccUDpV14RMLHNbht9T9wfwnHYKwF81FaUrac2Vn5TqM+91AGA/2BUHhdBNCJ1qQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=G8QwDz7r; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4B2JaP91016124;
	Tue, 3 Dec 2024 00:39:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	wPwAUqoSGJCxz2ExptnBXgdMlyVWy6yqMhydbA3dXSA=; b=G8QwDz7rLrtPf7Xd
	7ZtsfV2f7jY/OYTUJ1UrsDxTXEH+RSpOGPxFMtpSqPxBwToQ0ZpuyH9QUtlPG90B
	2pRA3Vmk5OQ04rme6wCzX81dQB+Kxb/IthYV1yZV3bHOj5GZaIJn8MLyQzNOUfA9
	WoT6/uqRNwQA5cwX05WImpL8EZ2WBntksPR5TZoJ91uRjgmRs1cTMiABUp6aqfNA
	p1HXRzXxUT5T/jK1TsLrbmsnNVF/+nAz+Ylw7nfbTuLoHRbLkiZVuGPDJ823n1Uf
	fcl7UkXlh29NGZB3GG2mRCoWoko4bnJpG8/87gjT+lPMyn8fGQklc8rAxi5uzHU7
	IECsCg==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 437sq66c7w-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 03 Dec 2024 00:39:23 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4B30dLcN026313
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 3 Dec 2024 00:39:22 GMT
Received: from abhinavk-linux1.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Mon, 2 Dec 2024 16:39:21 -0800
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
Date: Mon, 2 Dec 2024 16:39:02 -0800
Subject: [PATCH 3/4] drm/msm/dp: replace ST_DISPLAY_OFF with power_on in
 msm_dp_hpd_unplug_handle()
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20241202-hpd_display_off-v1-3-8d0551847753@quicinc.com>
References: <20241202-hpd_display_off-v1-0-8d0551847753@quicinc.com>
In-Reply-To: <20241202-hpd_display_off-v1-0-8d0551847753@quicinc.com>
To: Rob Clark <robdclark@gmail.com>,
        Dmitry Baryshkov
	<dmitry.baryshkov@linaro.org>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten
	<marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, "Simona
 Vetter" <simona@ffwll.ch>
CC: <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
        <freedreno@lists.freedesktop.org>, Stephen Boyd <swboyd@chromium.org>,
        "Doug
 Anderson" <dianders@chromium.org>,
        Johan Hovold <johan@kernel.org>,
        "Bjorn
 Andersson" <quic_bjorande@quicinc.com>,
        Abhinav Kumar
	<quic_abhinavk@quicinc.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1733186360; l=1035;
 i=quic_abhinavk@quicinc.com; s=20240509; h=from:subject:message-id;
 bh=ulOrtwLyA5l17UFXotN3R2Cj8YZLtDzpwCEPaPc3xA4=;
 b=tMp4m1cBjjrUDNOgDAcbH9PoseeK/LJA/g1Cvde5ASlJoawMtGeh61dIll6lCkbmyiO27bKb9
 Qc8/T00kJPVAhxUwrhk7rJKUpeCgtS5tctKwthof3hJK1H9//0HEWJp
X-Developer-Key: i=quic_abhinavk@quicinc.com; a=ed25519;
 pk=SD3D8dOKDDh6BoX3jEYjsHrTFwuIK8+o0cLPgQok9ys=
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: WL-g59IMYAq2Yz3tKqK2c4v6qSN6ix7-
X-Proofpoint-ORIG-GUID: WL-g59IMYAq2Yz3tKqK2c4v6qSN6ix7-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 bulkscore=0
 priorityscore=1501 mlxscore=0 clxscore=1015 lowpriorityscore=0
 suspectscore=0 adultscore=0 spamscore=0 impostorscore=0 mlxlogscore=785
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412030002

msm_dp_hpd_unplug_handle() checks if the display was already disabled and if
so does not transition to ST_DISCONNECT_PENDING state and goes directly to
ST_DISCONNECTED. The same result can be achieved with the !power_on check.

Replace ST_DISPLAY_OFF with !power_on to achieve the same outcome.

Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
---
 drivers/gpu/drm/msm/dp/dp_display.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index 614fff09e5f2..831876aa5b35 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -655,7 +655,7 @@ static int msm_dp_hpd_unplug_handle(struct msm_dp_display_private *dp, u32 data)
 	 */
 	msm_dp_display_notify_disconnect(&dp->msm_dp_display.pdev->dev);
 
-	if (state == ST_DISPLAY_OFF) {
+	if (!dp->msm_dp_display.power_on) {
 		dp->hpd_state = ST_DISCONNECTED;
 	} else {
 		dp->hpd_state = ST_DISCONNECT_PENDING;

-- 
2.34.1


