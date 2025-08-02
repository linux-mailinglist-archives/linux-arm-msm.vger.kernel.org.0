Return-Path: <linux-arm-msm+bounces-67504-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id BB671B18DFB
	for <lists+linux-arm-msm@lfdr.de>; Sat,  2 Aug 2025 12:40:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 177C41AA1C35
	for <lists+linux-arm-msm@lfdr.de>; Sat,  2 Aug 2025 10:41:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5702521CC5B;
	Sat,  2 Aug 2025 10:40:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Zsuangat"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDB1020E00B
	for <linux-arm-msm@vger.kernel.org>; Sat,  2 Aug 2025 10:40:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754131241; cv=none; b=amXBKrW6hw9Ucc6f+uZIKFcaCXO+mDNXfL1c/p3KLe2l9acLNBPAkXEOJ0MEjYcXQRdloZ/bk+W4AB3stkL25m3kKvrChFk3Bk7Uybgocs7ENZeRMIIEvpKhN4bnV7jPQWUnCOlS+Df0JCIk+8ewWgwOH6ocM5ehgCJHwp9F8kk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754131241; c=relaxed/simple;
	bh=V5fwEFSvd6iZX7vn1nOUGXoBQVgsda3sPWa8+8IxVEQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=gF8crcstBSPsmeeS4gIZrLW1atKzTEbfgBEd5O/NG1QVMJYSsK9DC1T1Ta0BwjSuF55oD6x9d0RONQ5xJ/+CPQ/4PszaSLBJJ6hdpfxBjeX5O2wVhMPJUntrB8t8A6hOOqtH7IT4adk/MG13Ht/J1zSm6D0Fg6/1NYK9voKV1SE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Zsuangat; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5725gPYj010579
	for <linux-arm-msm@vger.kernel.org>; Sat, 2 Aug 2025 10:40:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=zu+wgBbmPg38lcKPkzJiVr
	U6c5vcWfMV6SwJ1iTuKKQ=; b=ZsuangatO6qj+6HG4GpE4UDl2oB3KlcZ2GL6Pv
	IRY9pcSj7d+ylN5BWf7CCSDZHCh2FuvTCH5n+nTcI1E5L94ZcFAR29KHhTo0eJsL
	om+2TFYMbPWEvoaE8dBiL8wF8IkCyMyAMXJLfDu7+CDOpbGvssnWvC7tuE0yC/K7
	M6+wv9LGBzChwxaZoNA5Q0usM7Td1e3kzfAh+p4L2SkxcMZpno00Il8UUiDlFRRk
	XjvHJ4PRf/ml9WUCP8iYdtYB/xyF3lXErUaHcCVZuOpJti6/ZrxDiRCwZjh58kAf
	7SmH+TT4jyTYcqFYKRHZnH6nM+6UNqx/HknWn4SOqj/xjWwg==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4899mvrrap-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 02 Aug 2025 10:40:38 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-7c5cd0f8961so302070885a.1
        for <linux-arm-msm@vger.kernel.org>; Sat, 02 Aug 2025 03:40:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754131237; x=1754736037;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zu+wgBbmPg38lcKPkzJiVrU6c5vcWfMV6SwJ1iTuKKQ=;
        b=vFEi9mf2MYmOTAon1GQCl/0mGEa1y6Ue0qqqbDEyp0QSL4g3Lf56OGPVYA1F+xDEup
         oTAqVzqkSJsBAypGEJP1qmsDJOVvZSbpjOI3FCQNWnVGDUbad5q45a6Y7Xcp6XQe0k6p
         QP2laBgBDM+mZ3szJRISdgpaZPRwhoUIs3Ylt52a1UV6HR0P308Qq2uBQEYGtt6QcrRg
         c8DuO4HP5W9FQ1xX3uoUvZWKOIVD9RJj790TUcq57cpkDEYagHwaSnENGB00avfgtZD9
         cwhm+EX6Tvqtb1G6+T7ydVsCKoXHh1FLFoRYOtxqRfvZJ8QfrbOZohT6iuv2GOhlDZAc
         Zl6w==
X-Forwarded-Encrypted: i=1; AJvYcCVWlKcluEb7qX9XjZFtXzG2upV5Q+e0PBxMgb+AERBDMGZG33RJh2/4eq1jd6O4iXnCH339o0fT924Y5Kd+@vger.kernel.org
X-Gm-Message-State: AOJu0YwMG2TDTHbaGDHyVRLnohfLNRTRImh4+/LEU7vsDz+nVePGsEB8
	/lRKHb/WNU91iziEp8bExhHtgJqfw2wajcMr4Ehr6G3AMkQjuUrfXWcNktmetq53dVAIYNVb9Jl
	E5FdidAFfIG7DX1ywfp2mGC/RzDoHzgZ/i3JKTM0uxysrJ++Oc2uyii6L7yqjCaUOCe4b
X-Gm-Gg: ASbGncs3pWjShI8ZvGOwWRkYmIRlILUZD9Kx/tyCOEo8SkD9/B4Uvfl5KWSKAPlgPp+
	BvYaODWVrpF8IlHwRk4PrXoEeHJzXi+V10pVJvpjFDtbrlbVSP0aA8MaO99A+awM8W6MdtIzAwb
	68JmKBNnhlV2pN2AXl5+JjHEU+csh31a9goly0f+domQciyJl7OUy1/1PRQ7jYU3wlCV+CL1SKP
	yBs4TGtMp1HZgYh4T9pXacCBk17XMjB/qGSkZbvG12WF9bMJGw08BqY6EkRsHbhmiz2uHoAJxqi
	CIxa/zwAXFJE7Ikamj5+1He0V2QRyjKATf5xRnbm7a6Fl25CJQcxPvOj9rNtw5kYySXAaEAFssK
	XQacJ5fp3LoVAZAu42e+3mVOpOJtmeUzzKG5Da1Yqwh7nS9QcoGrl
X-Received: by 2002:a05:620a:8c3:b0:7d4:49fa:3c59 with SMTP id af79cd13be357-7e696290870mr383574985a.15.1754131237449;
        Sat, 02 Aug 2025 03:40:37 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFo5WUyWXxaVu371UhvAZx0Y/HJm6ZuA6t/pRnQ+dzL5rNQV5KuJVUOj53fEOxRGNJb2YAEHw==
X-Received: by 2002:a05:620a:8c3:b0:7d4:49fa:3c59 with SMTP id af79cd13be357-7e696290870mr383572585a.15.1754131237029;
        Sat, 02 Aug 2025 03:40:37 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-55b889ace49sm928030e87.71.2025.08.02.03.40.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 02 Aug 2025 03:40:36 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sat, 02 Aug 2025 13:40:35 +0300
Subject: [PATCH] drm/bridge: display-connector: don't set OP_DETECT for
 DisplayPorts
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250802-dp-conn-no-detect-v1-1-2748c2b946da@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIACLrjWgC/x3MPQqAMAxA4atIZgP9QVCvIg62jZolLa2IULy7x
 fEb3qtQKDMVmLsKmW4uHKVB9x34c5ODkEMzGGUGNSqDIaGPIigRA13kL3ST0uNk3UDWQ+tSpp2
 f/7ms7/sB/Uavb2MAAAA=
X-Change-ID: 20250802-dp-conn-no-detect-b901893b5e3c
To: Andrzej Hajda <andrzej.hajda@intel.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Robert Foss <rfoss@kernel.org>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1917;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=V5fwEFSvd6iZX7vn1nOUGXoBQVgsda3sPWa8+8IxVEQ=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBojesjxhI5LE1y0oeOUvU2pvk6ANdl/CkH4FaFn
 0Ute45kT5KJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaI3rIwAKCRCLPIo+Aiko
 1cs+CACO7cAgyLFxQc0407yt4axfgDYItBSqQrrMOKTFTpXNQhcEIIfC90mhSmpoxc/38Fm3XHw
 fqowe6NMvNUzZwTXJ8KMUnWE1FvSmMHdMF5i5f4VgqmxAQn8zvzFjBnuHz2GmFdoZvthLG0QzLC
 Elz1LL+mzcAtxwoSMw5L35tIUhtCZuaQxDho3igakcyl5osd6VOYS/8vvbRslEL1RrDZR3iMTCK
 79eHouHtIOvUwF/8zPOubPwnD4pYd15BlDrZWiWehoLxZP78AwVQhIlwNGp2Do78LWvzs3Wr7R3
 6wZkKoLwjQmzQ9n5+uCslf7Ew0/0QnuyxPkIsbKqr1R/oWgc
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-ORIG-GUID: UQbSNKM4PpmaBxcGXrmZmNtcROC6ia6I
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODAyMDA4OSBTYWx0ZWRfXwymSh8hNbbc7
 ZavCZzSzowE6yjE1XgpWn9OrA4kfL9PDahegvh4Cva9zGJtqG50hphG0Lfg/HoV4zXtRTxOmCTI
 q+bsdNhR6SdAxbGhXRTflqpsWx1rm1gG8Hsr1aO6c9zr8BMH3BpjV9JuTUn6w3tku3qdSW/+rP+
 z0GZrN2o+UEqE0wh8YejyIdSA5JPtbl/ESjI6IqTEO2nO5lBtfzgiTEtNJV2l6zGle1RFAW9LwW
 H4Y6oyxFfTBm1F3YZ4FI3F8KRCZzEjI8x2iL0T0IlM5/VSZ9Tq5Ch31tYBhfR5cEjJojbipThmi
 dj4hRMX4P10Qb2X8gyk27/sUMeCQb+VuMol3OI4BxYWUt72g4tN4Y+o9bhdxKnyaAthUiOO7NIO
 d4if34iP7VjR4J+JBiMAWL54qjO1LIu502eFaSmpxPcV0xYsibuYuVUYCTgolZLD98h+vAr7
X-Authority-Analysis: v=2.4 cv=duXbC0g4 c=1 sm=1 tr=0 ts=688deb26 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=2OwXVqhp2XgA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=jZDBt8FwwR466f3IuqAA:9
 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-GUID: UQbSNKM4PpmaBxcGXrmZmNtcROC6ia6I
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-01_08,2025-08-01_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 suspectscore=0 impostorscore=0 mlxlogscore=999
 priorityscore=1501 mlxscore=0 adultscore=0 bulkscore=0 spamscore=0
 phishscore=0 clxscore=1015 malwarescore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2508020089

Detecting the monitor for DisplayPort targets is more complicated than
just reading the HPD pin level: it requires reading the DPCD in order to
check what kind of device is attached to the port and whether there is
an actual display attached.

In order to let DRM framework handle such configurations, disable
DRM_BRIDGE_OP_DETECT for dp-connector devices, letting the actual DP
driver perform detection. This still keeps DRM_BRIDGE_OP_HPD enabled, so
it is valid for the bridge to report HPD events.

Currently inside the kernel there are only two targets which list
hpd-gpios for dp-connector devices: arm64/qcom/qcs6490-rb3gen2 and
arm64/qcom/sa8295p-adp. Both should be fine with this change.

Cc: Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/bridge/display-connector.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/bridge/display-connector.c b/drivers/gpu/drm/bridge/display-connector.c
index d7e1c2f8f53cad514ec502d58c1b94d348515b42..e9f16dbc953533c2a2d329ee8fd50c1923a78aac 100644
--- a/drivers/gpu/drm/bridge/display-connector.c
+++ b/drivers/gpu/drm/bridge/display-connector.c
@@ -373,7 +373,8 @@ static int display_connector_probe(struct platform_device *pdev)
 	if (conn->bridge.ddc)
 		conn->bridge.ops |= DRM_BRIDGE_OP_EDID
 				 |  DRM_BRIDGE_OP_DETECT;
-	if (conn->hpd_gpio)
+	/* Detecting the monitor requires reading DPCD */
+	if (conn->hpd_gpio && type != DRM_MODE_CONNECTOR_DisplayPort)
 		conn->bridge.ops |= DRM_BRIDGE_OP_DETECT;
 	if (conn->hpd_irq >= 0)
 		conn->bridge.ops |= DRM_BRIDGE_OP_HPD;

---
base-commit: 82928cc1c2b2be16ea6ee9e23799ca182e1cd37c
change-id: 20250802-dp-conn-no-detect-b901893b5e3c

Best regards,
-- 
With best wishes
Dmitry


