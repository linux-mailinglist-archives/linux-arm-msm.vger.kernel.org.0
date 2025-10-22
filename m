Return-Path: <linux-arm-msm+bounces-78261-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id C4CEDBFA349
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Oct 2025 08:24:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id AD7343B914B
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Oct 2025 06:24:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0B9E02ECEA7;
	Wed, 22 Oct 2025 06:24:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Zdt/xxqL"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75D2C2ECD2E
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Oct 2025 06:24:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761114246; cv=none; b=NorQYFmEexjKyfAjVsjbcr5Cv0PymSDdcHWCJdHoHZNNAvUg31h2Hd4H0OyKGhKBMHs9LyBn9V+ftlt41ieNjz6pkBa+yoC94vrNTx/89R6L5ZBvfhzeZVlxsLjBoaAgfMZtYLnXaBm+y2R26IPANZmfR5nyak8+pUNMmXwqtrw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761114246; c=relaxed/simple;
	bh=HjIHMU+zk++PkLqRKGKNZqgbjOK9R+lyZTEE8lmlagM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=RM5ArTiVWpCa/wwAxhDhXomjbSyUfl1bItwv1nh8hJgkHyP3UfUY+LBV3v2pBzTo5lgTiwIE69oEGJraz4Yms88Y03dtVZUxYi78AeLvvvYocor+QzhSNT9Ip6f77+e9qpRvKuAYB7sTM5Odu1k7AE7e8uRalP3h+/MST3mKaEA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Zdt/xxqL; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59M24XQX024689
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Oct 2025 06:24:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=CqW2ijx7g1X8E8dZQ1aOa/
	6V0bjVWlE3H0uBU9niqaE=; b=Zdt/xxqLxSmj6dhFhnBnTglBxWD/3DACDYKRx9
	XW6zissV5kzfoknj/ysDOVddgHEzGoI6nofC+F/S8cFIVN7qX70W43+67YZREXOX
	K519zq0+rECmjy/fyItLgaHyWEUR/Q4PSIDiFUO7pY7D2+QONAlmeCQ2h2h118Oe
	J55bRCAIcScSnkwrhiSVO1TQZOOsNu8hb8zQeC8zYYgqM8T3n+950+nFRB5L48gJ
	jwpy/xlNDkrVXuXuLulNHwBgEPKVlGaDNeJD1Rs63UstuMaZ1q9FjAkO1a2x1KGf
	wK7P/yEWeAud2Ng4wPNAP+epv4v0fNwlyBgLWVyDjR0AOEag==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49wsws5v8h-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Oct 2025 06:24:04 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-290b13e3ac0so63085035ad.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 21 Oct 2025 23:24:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761114243; x=1761719043;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CqW2ijx7g1X8E8dZQ1aOa/6V0bjVWlE3H0uBU9niqaE=;
        b=bOS3+rDnKDBOT+Qpka2PzI478eLz4N2xrbw7y9KilQea5hfLfpkW5t0mZy7IUITcq9
         Qn7lL7NS+EaRnO29/FfLl3YZtq4E+5KHgjz0o9vK/O2FI56DjKvZzfgwWBDzD+Aiziwt
         4FN6GvqCLhts1ZWKo9aRw/PohmNpOSLQ1l0EFgk1sxJBjyImGxWa5pWdJYyjB0b8ZqZD
         gaoB52NggGVwVs67eyNLzhtiTcGmhXzIy84ALSYjjqkzw6tRU3H51KEQyBFC/Wmyb2lN
         u77XmnCMBzwpVOyaGmHqThYJL1FPnNQ/7Nh4Z9pHu38HubRLmaGuAvnbP2nrv96MoKIU
         JIAA==
X-Forwarded-Encrypted: i=1; AJvYcCXo0upUJrhM4E1ZgR7kWHRMjf2AWRMQ+lqz4XVG5M22qrmv3jpd1+nMqOOiT1TWaKJ3D9632YgmteCiKCCx@vger.kernel.org
X-Gm-Message-State: AOJu0YzXXkexHESPcyqCkJYKtUuNa0qA2EWPWG/k3VVLDSJAWvNyMjeQ
	DEGHodF9SHRRNdrS3O7A9oAOrQRlVtci1iFfMFhHkkUQn++A4fMG3JG5Va4p84AoziF45lTHXag
	SnUio2lvSmsoUIs4uDVU02rT1ceBpqBp9+6tvwm+PUTU4kGcnsOa1y73Zd69dGLkX8mCbQJpSHm
	IqMD8=
X-Gm-Gg: ASbGnctFAQCSO5DhH8y/NrnmdLc/k+ozAIeDnU1jIx5c5DxlY0iR3ZvMv0LonyYcptY
	gvHaW35kwseZHByI1eva3RvJFclOIzc2IFNA2KhoZvefnw4ae61m6vSfVFsGbGH9aMELQ8CvsE+
	559cr1x/X1DE813o8nwIYaJWpbW+LShzGi9itYl90QYc3U/nezpuobGUZ1sWgSUUU/bHl3AtXoO
	PGihSjpU0zx84/yTLcLSKY2oCHROXEZqk0YLDdoRU4u8cCjKX1wQOlad/zaPLU7P3Hd/+nnmYfY
	2c3fr+l3v8K7xE2uJioq1mPDUQoUWkQuuabq6LkJNrMv/HBherQj3/WcGb4zr9ZVgYui6jXlom6
	zx7V7m8gxz+tD+L2wHs6EjUdkL3Ci4lZt+dU0H0uCW2o+JqygUQ==
X-Received: by 2002:a17:902:e84e:b0:293:b97:c323 with SMTP id d9443c01a7336-2930b97f2e3mr11244865ad.32.1761114242683;
        Tue, 21 Oct 2025 23:24:02 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFg+2crLhdIBFVg/IhlrKOPBnng/Ev7HgNB6SgpJQk7mXQOfOGRAijCd9bUu2W90Q+A3vcEmg==
X-Received: by 2002:a17:902:e84e:b0:293:b97:c323 with SMTP id d9443c01a7336-2930b97f2e3mr11244355ad.32.1761114242215;
        Tue, 21 Oct 2025 23:24:02 -0700 (PDT)
Received: from hu-jingyw-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-292472193a1sm128024795ad.106.2025.10.21.23.24.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Oct 2025 23:24:01 -0700 (PDT)
From: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Date: Tue, 21 Oct 2025 23:23:59 -0700
Subject: [PATCH v2] dt-bindings: thermal: qcom-tsens: document the
 Kaanapali Temperature Sensor
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251021-b4-knp-tsens-v2-1-7b662e2e71b4@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAH54+GgC/02NzQqDMBCEX0Vy7ko2RLA99T2Kh/xsa2hNNGulR
 Xz3Rk+9DHww880qmHIgFpdqFZmWwCHFAupUCdeb+CAIvrBQUjUoFYLV8IwjzEyRoaVWe4/SaWx
 FmYyZ7uFz6G5dYWuYwGYTXb9LikDttT7wnPL3OF1wLx9+eVb/8gUBwXjpPGnrddNcE3M9vc3Lp
 WGoS4hu27YfdX38k8MAAAA=
To: Amit Kucheria <amitk@kernel.org>,
        Thara Gopinath <thara.gopinath@gmail.com>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: aiqun.yu@oss.qualcomm.com, tingwei.zhang@oss.qualcomm.com,
        trilok.soni@oss.qualcomm.com, yijie.yang@oss.qualcomm.com,
        linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-99b12
X-Developer-Signature: v=1; a=ed25519-sha256; t=1761114240; l=1183;
 i=jingyi.wang@oss.qualcomm.com; s=20250911; h=from:subject:message-id;
 bh=b14zm067UTq1Ql0AQCAl6rdyfI9JtsT/6hl+7oSQAGY=;
 b=nxJRNThzAdj7FIjl0v0W7JzAyyHkp33Uzr0mX0QpHjNoUvJwPvvjuBmOH6wpGphJAdv9frz8p
 bo/O5tBrrIxB3TlqXsdJJHwqBfvFmVCzJri+lyfenUs4VUzodLA8xNs
X-Developer-Key: i=jingyi.wang@oss.qualcomm.com; a=ed25519;
 pk=PSoHZ6KbUss3IW8FPRVMHMK0Jkkr/jV347mBYJO3iLo=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDIwMDE0OCBTYWx0ZWRfX8BbzDd6wJ62w
 d7NSHslbu4ShrTh1JhYRwszM7yYwL94Did5k8Sk4LY5MxMKFlWQ8mirI9Cx/3wMlffYqE29CmkY
 3sq94m40c8gzh/DpyfzGWxyuS/Z8Vnkiya0JWYoSssL7WAb8hoLKOLh7IzgAD23fMumD1Znu7+t
 zAVSaqkuUs22VR8pjE+uVTGSYq3QnpYJ0W6j3gNQhh6RLw6lVHPg1A7ni953u7po4bVgtIcW/Pc
 V0s/9KaoQkQEzf1wjGM4RcNDhxfmmV0fzfLqnhSEDRB/2+wlUOonlBNrqOehbIKUsF8MvluSoiS
 ccsF2CeevLQl0/31N+1tJKIWGj8aup2Zh7lkOz5YGZreIhxPwUQqw8qeJuHHb9IQcjbP7cds16X
 C/6DXdPY14P6YI/b0Zwh8rsvOv5FtA==
X-Proofpoint-GUID: rs77qwhSOsjvFxI43YBjDhqEZ4bw9UL9
X-Proofpoint-ORIG-GUID: rs77qwhSOsjvFxI43YBjDhqEZ4bw9UL9
X-Authority-Analysis: v=2.4 cv=a+E9NESF c=1 sm=1 tr=0 ts=68f87884 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=AgW-CbZXvGspVfobTS4A:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-22_02,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 spamscore=0 clxscore=1015 priorityscore=1501 phishscore=0
 bulkscore=0 suspectscore=0 malwarescore=0 impostorscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510200148

From: Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>

Document the Temperature Sensor (TSENS) on the Kaanapali Platform.

Signed-off-by: Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
---
Changes in v2:
- patch rebased
- Link to v1: https://lore.kernel.org/r/20250924-knp-tsens-v1-1-ad0cde4bd455@oss.qualcomm.com
---
 Documentation/devicetree/bindings/thermal/qcom-tsens.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/thermal/qcom-tsens.yaml b/Documentation/devicetree/bindings/thermal/qcom-tsens.yaml
index 78e2f6573b96..b9f99d109949 100644
--- a/Documentation/devicetree/bindings/thermal/qcom-tsens.yaml
+++ b/Documentation/devicetree/bindings/thermal/qcom-tsens.yaml
@@ -50,6 +50,7 @@ properties:
         items:
           - enum:
               - qcom,glymur-tsens
+              - qcom,kaanapali-tsens
               - qcom,milos-tsens
               - qcom,msm8953-tsens
               - qcom,msm8996-tsens

---
base-commit: aaa9c3550b60d6259d6ea8b1175ade8d1242444e
change-id: 20251021-b4-knp-tsens-8e84dd10c418

Best regards,
-- 
Jingyi Wang <jingyi.wang@oss.qualcomm.com>


