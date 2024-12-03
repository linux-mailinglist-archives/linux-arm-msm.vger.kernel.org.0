Return-Path: <linux-arm-msm+bounces-39992-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 40F099E11D1
	for <lists+linux-arm-msm@lfdr.de>; Tue,  3 Dec 2024 04:32:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 12840164D92
	for <lists+linux-arm-msm@lfdr.de>; Tue,  3 Dec 2024 03:32:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B5D9A186284;
	Tue,  3 Dec 2024 03:32:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="gOBD5e8r"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36A853F9D2;
	Tue,  3 Dec 2024 03:32:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733196748; cv=none; b=HHWcJk4M9tt9CaxjLpR63eWEmgRxSPQFdUx6ZGL6/EehteQ9Sbt5f1hNvrv2eBS0Zgkbwc5wp9s/YbxOOCfhQPmD5TbFhvJtyOylvCyux75l6qk6ZDF0ZRYKY1HoXX/FOStV8QZTIDBeUh1gEX+BNPtwyx33jXNQn8kcfgNqF2s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733196748; c=relaxed/simple;
	bh=HakEq3N95BMIIM8PvAiGX6Tyi359l/c7+yzyHgH238I=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=nJeiZd273+5CnDLwb7bYMZ3LeIh6UYZnIMQKsEdkslKGszZMA+Uf1Dq0h5lZeO5zGjBx3XR7Jtj1SXuS/UXnxKF4azwXuBPeSuTNRHlEMu2AhxIXcp/iB0QX8iMn+ZjY/1VsWmZrQ9ncQb/zusDIIcQzBnJspD70jP8adS+Q6yo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=gOBD5e8r; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4B2HYOov000533;
	Tue, 3 Dec 2024 03:32:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	z+R+UM++NH21AZ0ur5MVMvElzBMLjkujEXByMCIj7/w=; b=gOBD5e8rkbliSOS3
	PdmvF6A/CzxpWQVI75obD9gJPa3IORMeRNnjqGr3KqD8KFnc/kKwB7vhUXBjkCk7
	OBgH4xArROqOQQwd2JMplq4Rm0EcLDwk9EtNYvn3KJEmV4EriSfykLBseuaOqDKO
	aGTWSwUtdfKxCIVyMfP9k0kU/+YsjXR2wPG9/6J4+GqaQ4NHgSjQ2KNtVpmY3GJ8
	X9ueRbt6ezi+zgW7JNsddFgIh+FDSrs8jtOrfSCr2MWpZfry1BCqs8xZdYqMDF2p
	U7OWwLjBA9q35jz7NrJBU1AlDQQHPhApifR63jP8cQtZWfEdpwYVMLaDe5sjg9HZ
	XkKOvA==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 437r2mxxad-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 03 Dec 2024 03:32:16 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4B33WFhX003573
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 3 Dec 2024 03:32:15 GMT
Received: from abhinavk-linux1.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Mon, 2 Dec 2024 19:32:14 -0800
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
Date: Mon, 2 Dec 2024 19:31:42 -0800
Subject: [PATCH 4/4] dt-bindings: display: msm: dp: update maintainer entry
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20241202-dp_mst_bindings-v1-4-9a9a43b0624a@quicinc.com>
References: <20241202-dp_mst_bindings-v1-0-9a9a43b0624a@quicinc.com>
In-Reply-To: <20241202-dp_mst_bindings-v1-0-9a9a43b0624a@quicinc.com>
To: Rob Clark <robdclark@gmail.com>,
        Dmitry Baryshkov
	<dmitry.baryshkov@linaro.org>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten
	<marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, "Simona
 Vetter" <simona@ffwll.ch>,
        Maarten Lankhorst
	<maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Kuogee Hsieh <quic_khsieh@quicinc.com>,
        Mahadevan <quic_mahap@quicinc.com>
CC: <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
        <freedreno@lists.freedesktop.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1733196732; l=871;
 i=quic_abhinavk@quicinc.com; s=20240509; h=from:subject:message-id;
 bh=HakEq3N95BMIIM8PvAiGX6Tyi359l/c7+yzyHgH238I=;
 b=s9j5zjatjgOO5bNtG2zAChI5qkNVND1C8bvlUCCjT1Q0wUxVMgT0gmOFn2vPpUb6a6QOOtTKq
 hT+dzUMnoQuA0aa8lOv+SkH8ZGWgaw59BXSbKQel/wJdnZWRCR5bsP/
X-Developer-Key: i=quic_abhinavk@quicinc.com; a=ed25519;
 pk=SD3D8dOKDDh6BoX3jEYjsHrTFwuIK8+o0cLPgQok9ys=
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: NZfElm75zQbQHrJ519NnY-6oHkWwqdzY
X-Proofpoint-GUID: NZfElm75zQbQHrJ519NnY-6oHkWwqdzY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 impostorscore=0
 bulkscore=0 priorityscore=1501 suspectscore=0 lowpriorityscore=0
 phishscore=0 mlxlogscore=878 clxscore=1015 mlxscore=0 adultscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412030028

Add myself as maintainer for dp controller yaml as to support
review of the incoming changes.

Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
---
 Documentation/devicetree/bindings/display/msm/dp-controller.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
index 650d19e58277..9867eb5133ab 100644
--- a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
+++ b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
@@ -8,6 +8,7 @@ title: MSM Display Port Controller
 
 maintainers:
   - Kuogee Hsieh <quic_khsieh@quicinc.com>
+  - Abhinav Kumar <quic_abhinavk@quicinc.com>
 
 description: |
   Device tree bindings for DisplayPort host controller for MSM targets

-- 
2.34.1


