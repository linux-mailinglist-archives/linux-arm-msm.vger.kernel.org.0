Return-Path: <linux-arm-msm+bounces-50815-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 61194A59231
	for <lists+linux-arm-msm@lfdr.de>; Mon, 10 Mar 2025 12:04:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1B62D3A695E
	for <lists+linux-arm-msm@lfdr.de>; Mon, 10 Mar 2025 11:04:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 47E47226D12;
	Mon, 10 Mar 2025 11:04:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bj2neNPP"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC5C0225775
	for <linux-arm-msm@vger.kernel.org>; Mon, 10 Mar 2025 11:04:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741604661; cv=none; b=WimmkzzXdaJhDlGSoDHXNdI+ay0HSfBzwrbvXUf+phJvIpJSd+CG739a49kYRjXSvdEBOhDzEJ2rplr/CeeTHg8pVKGoOfetcF/bX2PLm/3Rkn8hXo8VTjOpBszc48dobcqRoPBFmiMAjUqG6/JbOEdBxVo9dvoeO5A+9CJC8xI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741604661; c=relaxed/simple;
	bh=SLKi5/pU6VmqZloQSrc3BsEC95BvrfInlTEKZdNyDPI=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=uzJzJ1bGf7uMCc30JoR78ESx2KzC3BWD3Cq/cS5mNzsJEF7ZmlBgefYkZdIMiAuC7DBBZD4cxbe+n+h+PjqhvoE+GYqJuK9hmcJ70h7TGlOioke2IgjcjyvIadoTO2jJnyX6/BCU3718ns+/taPlD3CAJOOD6WE4wKTX/8K8f3M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bj2neNPP; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52A9u2rA020151
	for <linux-arm-msm@vger.kernel.org>; Mon, 10 Mar 2025 11:04:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=7+h0SgCQWbpp2hc08NzZtuUqyuQ4lXLc5tQ
	LmGtbA50=; b=bj2neNPPyGpRSdjTyspYKoXqr14OqsTXVLwiR9JUgqJTZzyZpXX
	d6rdXBVYipzcHPvJkkfveDmRHAt+jCfMBfr/+expJ8k8JEBMb6quwaPVvS3bM05Q
	U9ax+hAhd89Kx2tEmJXMSzepqa7qBD1990jPd63aBdEPBeE5TvU1j50VUcv47qPs
	6K0d+9i4AVpvR1oegcOwVb/dMV7HUfORL+FkmNZ0YIFi0OiUe0PZAeTzTw9qZycz
	ox3rzhe0kIdVE88URT+z/PjGkEYuPcnPBkv0Vg5XUd11WHmUhJ9nuRTq9h8v4PkT
	U+4p74QN3SeXafsdULRBxxAGj5tWvhZ8NqQ==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 458eyuck2d-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 10 Mar 2025 11:04:16 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-22410053005so130092045ad.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 10 Mar 2025 04:04:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741604655; x=1742209455;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7+h0SgCQWbpp2hc08NzZtuUqyuQ4lXLc5tQLmGtbA50=;
        b=D6aypBB1F70TSPYenWw4WesojxuFtzX054xHVovOE7/XcDdWmQwh8X8rMyVVd3tYbJ
         G1lirRewikmfd0ARQpLewP0ckLAhMz7vKpkipQL0wnFp2d0bqgtd3/pjZMfeeFCjmB5u
         03eZGccP/PPIiRE8cXsYMDFk5H/FZz4hc5zauJU6lthEePHAFpXe8bIR+TjXlJCt0PpL
         Z62sXBXG3a4qhEcFXE1KOizi6OEMfdj7WWe4AMbzsCeFUt6kUOwjyvx+sWBXMf7a2OB9
         idGrDbnb/S0mMhDl75rqj/KGUQXQ3gFDyRNCoQ8Fs0EHmCQK0nVJDam3L0s8H8CAigZo
         64Ng==
X-Forwarded-Encrypted: i=1; AJvYcCUpZuMi0bPs/f2ISoDMXYsxHUw0VnZu8Q/ANiAGz87tGjI1MCeQmJ4r/r5cv0WUlJIsby46w1q2sX2FXLDj@vger.kernel.org
X-Gm-Message-State: AOJu0YyV3a9B17fphnh48csHhPXek5sYfGUFKptfYNfpquFsG2TcrQ6J
	ce1K91hTqxYgUvZLRO5Zegcq/bxiQI4dmoxYf95trqXn3jGeMlshejHgyD8e+DXxMET1vi7TyO/
	pA4f+VdGAJc//bUnNdBzFHDFbAiFmKg919+n83pAd+HUOw+wqqHGILl76nF+1CVQ7
X-Gm-Gg: ASbGncug2y2v2v47WCLosFOKG7lxJ7zSsI3l7w6i3HGtEevt2nY9qG7kIz+va6MQ17g
	30fGUGkTMG/xPa/xDeme2IeYCizsJsNOkydFeWtWxLiBc4g4TOkdabDCG06j8kh9Z2iYFKeRSIN
	WeavtVFtWUDyY1v4tpXivAWC3M9lLuDjXU1c7uUEPLzP85GvW8TFJjz8M/rn5LmnfY5dX8IEK9V
	Pn/BHrSElpLmTEwLjAIa1MGjoQzmIo7jA7DMOarTa7WDdevU+1PIdr4+fksTWi6RAYSiSKLpc/+
	ACLBXfRSisotGQXAM0WS7W/+73w/0uI5zM0Tuvly215dzJCVxjGWTA==
X-Received: by 2002:a17:903:22c8:b0:220:f449:7419 with SMTP id d9443c01a7336-22428880305mr190238495ad.7.1741604655614;
        Mon, 10 Mar 2025 04:04:15 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGPpOyafTgqJOPNvJdDELRWWpYaOQqOg/hYct9/Qs6ay7Y38goWmm0TeDagcKLKgA3lGaIYZQ==
X-Received: by 2002:a17:903:22c8:b0:220:f449:7419 with SMTP id d9443c01a7336-22428880305mr190238105ad.7.1741604655245;
        Mon, 10 Mar 2025 04:04:15 -0700 (PDT)
Received: from hu-kriskura-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22410a7f8c2sm74902025ad.116.2025.03.10.04.04.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Mar 2025 04:04:14 -0700 (PDT)
From: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        Johan Hovold <johan+linaro@kernel.org>
Cc: linux-phy@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
Subject: [PATCH v4] phy: qcom: qmp-usbc: Add qmp configuration for QCS615
Date: Mon, 10 Mar 2025 16:33:59 +0530
Message-Id: <20250310110359.210990-1-krishna.kurapati@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=cbIormDM c=1 sm=1 tr=0 ts=67cec730 cx=c_pps a=cmESyDAEBpBGqyK7t0alAg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17 a=Vs1iUdzkB0EA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8 a=GV-Fn4z6lk5qDZWrX1MA:9 a=1OuFwYUASf3TG4hYMiVC:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: YeC3uF4Gwu9Ww-CMUCnRiQNpaoxqTbiy
X-Proofpoint-GUID: YeC3uF4Gwu9Ww-CMUCnRiQNpaoxqTbiy
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-10_04,2025-03-07_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0 mlxscore=0
 impostorscore=0 bulkscore=0 suspectscore=0 priorityscore=1501 phishscore=0
 malwarescore=0 adultscore=0 clxscore=1015 spamscore=0 mlxlogscore=999
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2502100000
 definitions=main-2503100088

Provide PHY configuration for the USB QMP PHY for QCS615 Platform.

Signed-off-by: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
Link to v3:
https://lore.kernel.org/all/20241224084621.4139021-4-krishna.kurapati@oss.qualcomm.com/
 
Changes in v4:
First two patches in v3 are merged. Rebasing this patch on top
of phy/next. No changes in code and v3 applies cleanly so keeping
RB from Dmitry unchanged. Also changing mail ID from quicinc to OSS
mail ID.

 drivers/phy/qualcomm/phy-qcom-qmp-usbc.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-usbc.c b/drivers/phy/qualcomm/phy-qcom-qmp-usbc.c
index cf12a6f12134..5e7fcb26744a 100644
--- a/drivers/phy/qualcomm/phy-qcom-qmp-usbc.c
+++ b/drivers/phy/qualcomm/phy-qcom-qmp-usbc.c
@@ -1124,6 +1124,9 @@ static const struct of_device_id qmp_usbc_of_match_table[] = {
 	}, {
 		.compatible = "qcom,qcm2290-qmp-usb3-phy",
 		.data = &qcm2290_usb3phy_cfg,
+	}, {
+		.compatible = "qcom,qcs615-qmp-usb3-phy",
+		.data = &qcm2290_usb3phy_cfg,
 	}, {
 		.compatible = "qcom,sdm660-qmp-usb3-phy",
 		.data = &sdm660_usb3phy_cfg,
-- 
2.34.1


