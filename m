Return-Path: <linux-arm-msm+bounces-68182-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E221B1F39C
	for <lists+linux-arm-msm@lfdr.de>; Sat,  9 Aug 2025 11:17:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id AFC9C581EE7
	for <lists+linux-arm-msm@lfdr.de>; Sat,  9 Aug 2025 09:16:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DB300280037;
	Sat,  9 Aug 2025 09:16:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="HETUexZq"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E11927FD5A
	for <linux-arm-msm@vger.kernel.org>; Sat,  9 Aug 2025 09:16:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754730990; cv=none; b=SHk/aF6L7AgyCoU1eoHbKbR7VIXSc72mP2h109NMhaCU9S97Cick8lQ04Odo7KrbmRCNasquyHqJTnaeR1IevI+aUEkNAbmjAdYX00s+Qqg/Uh1MK4RZqF+K6gUQ7rJfhjkpj89H2cZcHp2DHH77LfIONSTda//xx17tz3umBa0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754730990; c=relaxed/simple;
	bh=cH9mFD81gjvWgXR9gnN/Va1aF7qgFbqJRVc2CfvcnWk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=oQdcl65hORB6+Wlg4EmGlxvklcYwjMcu1CAdxBEB47LqI2WT/zUPOEb54GA+q4JKXpnFX0Pivak84AkESAqz9Cb3x9XANmVEqhxyKgz6pvDH07kXFC61GRF5TcwyTdEKfB67z+AO0ASt9I13BPqlHITNZPgMQgOzMyqqk8pMklM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HETUexZq; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5795pKWY014386
	for <linux-arm-msm@vger.kernel.org>; Sat, 9 Aug 2025 09:16:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	cxfuy14u1nD4xI/i3c1nKgU2lIEUsDht3WPVHTU7Mno=; b=HETUexZqTVdDOGRP
	RWasJYih7V6A+xvow361DxvLJY+SHqeJbak02pkjsA+kJQtjdMd/18Vgb9uIY4Eb
	TM2viu6jTQEBxrNvN43BLhzGYkq814eQ28TKkQpwhsQvEY2X9M7zw5b1kAqPRWez
	HqNeh+Nd1/8ZSG0EMyHNVNWNV4B7IeGww0yVR4u+VKsfQcg+J7tmEeSaGnPyn2ZY
	NyO7WfeAy9v0eYEA6rI+6QijwHiemy7vPKJFco94VLx2rN93ZffGF6z5Z4x93GKd
	ecNsesXKjUHtln0854kKQyiEfyvLVRuSUh7yV7S4Fd76x+A+tGjiEAXWIfX2A4sE
	2cXlLA==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48dv1fgkq9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 09 Aug 2025 09:16:28 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4b07b90d5cdso36570461cf.2
        for <linux-arm-msm@vger.kernel.org>; Sat, 09 Aug 2025 02:16:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754730987; x=1755335787;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cxfuy14u1nD4xI/i3c1nKgU2lIEUsDht3WPVHTU7Mno=;
        b=GlrzHKC1NPQs5K36UIiJ+V/9UIsGwRTnHCLSk0BTWYVNE429jE6cFO4ik8nre7yedz
         zNQLK52kxW7IKGPGAQGK9SSU6+8v2SgP8TZIqB436lfa7mIcVA7/x9iwQHKZJ9MMBO3B
         wh/s3DDZ+DX/JNh8RgoesJMOmvG1Jb8Dmt7Bii3ctf4/1ajTkgcKwczwu7YGxEtwvWju
         Ua+DxYN2e/mIPhm6ZM9OQP1XJ2hV+3mLU4nBp7HdUYoTdI9COhWkclnX7VDQrfjJy0CG
         vLLd9sW9sgLN39g2xi9rSPYnMSgLoL+PHxRs1Uy/D1vu8jj6VCNcdXHPrtweGLzAad7b
         5q0g==
X-Gm-Message-State: AOJu0YziWY8SPwvZ3zuALZzQ3ZFp9bw3jHaDDOBz4pwJmR1sKwWR0gT0
	kUHDtpvdWybzR/b6B5inYlBydNw0VIj0wS0BHaAgwX7pnF+G2lKOETPe/hkxQSfWPH6EI6T6ZRU
	bCaiYRLXqcbmyIF4VPGuED7Dm1aWd+1hTSKFUGetV+YDjCaApws21V6U+VXHPp22AlrNA
X-Gm-Gg: ASbGnctqZbnnQ6CvDGJQWxqaehZR8SoLmZ8zuuRKtTGwepdlr5DUmAkANaTyNtFrgXQ
	MYmvscSjGufcoC4UoA49f5aNZX2Yax49qqjqN2HMhnx74Zt7nsu8WAYCzYGa7ecq0DLvv7IdmTb
	xxST+m8UlspggmOGdB7Twbep4+RbkJX1cZUJYn/o9ItS0QjNsFdW+8j8YJQyh2nydifcZPIlu01
	7Ck1PI6DsgCgtQyzyWr5zZSncmzkCAfxexpkuQdbLCYNXytU4K00QReKhC2NIzV592pyKsLNYvS
	W0I9snT7F4qSXl8O/NT2bu51PZoIEV7o/rklgQq43l98ZLYuLyT6Mgj9EWd4mDT6kDWXO4SBrRV
	qm6QGTctCpCF3RR2Iofg+6D5+nCumppBMdwBWK0uWsuZYIRVPUjqu
X-Received: by 2002:ac8:570f:0:b0:4b0:6c7c:a955 with SMTP id d75a77b69052e-4b0aedc899emr75036161cf.35.1754730987341;
        Sat, 09 Aug 2025 02:16:27 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFZvWtm4YlKcaL23W+nUW97ef++KL1gDtBq38oi2j2iC9f5MjRqW8FMjd3aynm+3WxWfkZZ6w==
X-Received: by 2002:ac8:570f:0:b0:4b0:6c7c:a955 with SMTP id d75a77b69052e-4b0aedc899emr75035961cf.35.1754730986918;
        Sat, 09 Aug 2025 02:16:26 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-55b8898beb4sm3361989e87.30.2025.08.09.02.16.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 09 Aug 2025 02:16:25 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sat, 09 Aug 2025 12:16:16 +0300
Subject: [PATCH v5 2/6] dt-bindings: display/msm: qcom,x1e80100-mdss:
 correct DP addresses
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250809-dp_mst_bindings-v5-2-b185fe574f38@oss.qualcomm.com>
References: <20250809-dp_mst_bindings-v5-0-b185fe574f38@oss.qualcomm.com>
In-Reply-To: <20250809-dp_mst_bindings-v5-0-b185fe574f38@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Kuogee Hsieh <quic_khsieh@quicinc.com>,
        Abel Vesa <abel.vesa@linaro.org>, Mahadevan <quic_mahap@quicinc.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1755;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=NXtQ3bomvI5JzHf8G2204y7/eJt5cmkeL6NKDMpr9gg=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBolxHiy8bk2eyMWBCLg7kj5oWCwhIy6ZQzsXJ5v
 Fg6f80aQbGJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaJcR4gAKCRCLPIo+Aiko
 1a9RCACZtDdNaFddD3qCGcB/weJbCYH+yRFlmWQ7lGHxAxSSQjfDYujPMeEaA4yIbucYI0Y4Oup
 NuNyAcq9AMWwDBUYJRiY6KKLIUTrd5tlAT9LV7qF+jAUot8QnbFw8sT3XTJFmaiNx0luXWSVfcj
 tF0NCenZp1Mr3dYPKq7kmLPkDSJb5UJItb11+ZKvjP5ibrZkOUQxKiiUpd7YUyk8vGTQiufx932
 SWyQrYNKRXzcas23G902tyZ5HlLxaM1+CJEWGOake5tBi/fbHlL/z+bl5roh/U3XeP3Fo+ufB/K
 uh9QGEy32Ll4xc1qcDI7fJGvkcynbeIW3T+iKj54CGRaUVh6
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-GUID: Yn0hie_G2ZBxpBkTY7UcGGZZ-qxbb_S6
X-Authority-Analysis: v=2.4 cv=cLTgskeN c=1 sm=1 tr=0 ts=689711ec cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=2OwXVqhp2XgA:10 a=COk6AnOGAAAA:8 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=fvGZ3mk3BhhUN7shqj8A:9 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA5MDAwMyBTYWx0ZWRfX8OTLkvmVAUla
 xfdgIhOPn59tLwKulmGyTgImMzqLDyMibUAlU5faAoMdwWzK+Sp6XIRaX9X2CbZJLjK/vOM6vRe
 5s9c8OoNX8U8pPFQa/J7/BDAkBt/VMf//bgPg8xg3ylar7CAMqb/F+7iPRMV3I/FrNHKMF0MKw3
 qIcmhS0rgFHQCmit43PKPnNQ/SdNoQx0KQk7mOfoSCfWowq+2U0x86mEgNY6JqlCjoulDR31nwq
 HQ3jiPNqvTVrbgQ0Jzvp4WkpbfwlFQOY5Q6ySambVPZkFTxFNszvLHDIZUiVx1FFwanRayMQqiK
 HXbghd3RWxP9W2A3bTzCjowsjHCfZjA1dglQIH2X8OVah0gcVSMa6tShtWzBiEdH1WtV4vBzfp2
 jZyL7sKJ
X-Proofpoint-ORIG-GUID: Yn0hie_G2ZBxpBkTY7UcGGZZ-qxbb_S6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-09_03,2025-08-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 phishscore=0 bulkscore=0 clxscore=1015
 malwarescore=0 suspectscore=0 spamscore=0 adultscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508090003

From: Abhinav Kumar <quic_abhinavk@quicinc.com>

Fix c&p error and correct example to use 32-bit addressing (as the rest
of the example DT does) instead of 64-bit (as the platform does).  It
got unnoticed before since DP controller node wasn't validated against
DT schema because of the missing compatible.

Fixes: 81de267367d4 ("dt-bindings: display/msm: Document MDSS on X1E80100")
Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 .../devicetree/bindings/display/msm/qcom,x1e80100-mdss.yaml    | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/msm/qcom,x1e80100-mdss.yaml b/Documentation/devicetree/bindings/display/msm/qcom,x1e80100-mdss.yaml
index 3b01a0e473332c331be36f7983fb8012652a8412..e35230a864379c195600ff67820d6a39b6f73ef4 100644
--- a/Documentation/devicetree/bindings/display/msm/qcom,x1e80100-mdss.yaml
+++ b/Documentation/devicetree/bindings/display/msm/qcom,x1e80100-mdss.yaml
@@ -170,11 +170,11 @@ examples:
 
         displayport-controller@ae90000 {
             compatible = "qcom,x1e80100-dp";
-            reg = <0 0xae90000 0 0x200>,
-                  <0 0xae90200 0 0x200>,
-                  <0 0xae90400 0 0x600>,
-                  <0 0xae91000 0 0x400>,
-                  <0 0xae91400 0 0x400>;
+            reg = <0xae90000 0x200>,
+                  <0xae90200 0x200>,
+                  <0xae90400 0x600>,
+                  <0xae91000 0x400>,
+                  <0xae91400 0x400>;
 
             interrupt-parent = <&mdss>;
             interrupts = <12>;

-- 
2.39.5


