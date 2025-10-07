Return-Path: <linux-arm-msm+bounces-76232-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 93B61BC1F9E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 07 Oct 2025 17:45:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4CECD3A5838
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Oct 2025 15:45:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E893A42A96;
	Tue,  7 Oct 2025 15:45:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="iT682xzE"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 679DF28E9
	for <linux-arm-msm@vger.kernel.org>; Tue,  7 Oct 2025 15:45:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759851930; cv=none; b=HzTJC+A5/7Tl64QgaHO0TbEfk0dsFSNJc1vajbzEusi/NY7GNm1gpPqujFuIr/yZGM4+O1qkxlgobcO2SWOlyPUf7tiew9q3OwjUjGut2CKC1KGJHHkCVsY2w0tlP1Zy0oa7Ji5OyypzOxzoS7oxNjOfV46QN+rF0sby1YqL3lM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759851930; c=relaxed/simple;
	bh=yuD4+p9uI0lFv+NpN5InWIqxp3+KnX0dCceqK65B7ro=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=O8pvtLj5/Uvs5h785dEoWRx++5oF3YDEa8ZC8Jt7pVWszpavvXyq7+h53rmj6D3elxDna+LZWHFrySk6z9A4SENfawwFXgLdSDUtKsiF2MBR4ohj7/2FAHdU6ziZ9ggJDIv4SBmvJ6J/8LDwm/2oIQzzZkGyamGWVF0R4a9DZQY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=iT682xzE; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 597ETKii020772
	for <linux-arm-msm@vger.kernel.org>; Tue, 7 Oct 2025 15:45:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=uzC6cr1XmyHJvxN5ZCqD/yrayfmcb2xgD7c
	8ae74a+w=; b=iT682xzEE0IdScQDAs7Xavxv3f0RNz9e0Jg+46gaYyWmGVSS6cT
	+JntuU4LRxgPF5leBnX2lbtUZbPn5XwzWsqvgfk/6zGYIEdZSvs6JAmAt8bQU2pr
	47sV/QoY+jGbuqLBVEdM2UB+LDcLnDwnAgv2EzqCjDrx4Rm/Jww+5J0n4JwoWhrN
	2Va3DZovDM4RVstzjKYYxQ7+Oiir+7VgwzreeBohiQ1F79iC+dt2XrvbjwP3qDWT
	FYFwLKBglUqzXpibwW2uTYuU6qNJH6hCp00vUHxFjDRDo9h01QkMYcT2+TX0S+0E
	tlH0PoenHQYoxLvBo65ZVXI6NLtK5nGaaZg==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49js9dywwm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 07 Oct 2025 15:45:28 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4e1f265b8b5so143846751cf.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 07 Oct 2025 08:45:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759851927; x=1760456727;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uzC6cr1XmyHJvxN5ZCqD/yrayfmcb2xgD7c8ae74a+w=;
        b=NGGNzPeSghkSPHtbCkotgNcd0IRLT0H49YM792kGuz6aFFNWLatIDrOLA6D8mbDKF3
         +peCHkPtbFinfovdcmJcb9YXcygFA29eWIHoHFH4rn9TQq7fjvutf6rz4PzHW+blhtQp
         r+EPUbANZvaL81OHzpVty9ViBFzU3ToH6sAi83Ry67Y9HYPaHdAhGP2Q4E5eB8pgj5LJ
         0+7oyiBdeajQK3JcgO2caU1x7lfjON609Az+dBjod5WNx4xxbQtXgaFFef2fyg81JTAE
         o9qoPFiI4In+pxTwHoybpvSkfN1DDS74bZFiu+k00Y7oAht2K5A140r3skt0dCfqytda
         DaRA==
X-Forwarded-Encrypted: i=1; AJvYcCVsb3o7W2upl55wlUxyrbo1wjyndR5rJzE7Yf27e2SJIcGlYO8jMWF6ap3bYEF6uheIXcFJxNiitEIEwdgX@vger.kernel.org
X-Gm-Message-State: AOJu0Yydrjwo75s3GlOyBTZ4a4SJpkBxecDysiFRPDdmxxJgAfSpHUlh
	AuZ79Vt8K3afi1HDIGZkUBSAtOD34Cr4JT5kY56jybuV6iRnoEEfjQ6GWgfw1kD8vXSys6ihpyN
	oy63WorKpQlirff9B9H1zvM3Sc5XH79H3fyDi0oNOW93ve+bm2To7CCvgKaFT7e2O/mKg
X-Gm-Gg: ASbGncsrCkFnkVzq1l1UL8I+htKC4xHd6ER4SUUsDotntP9Z0H4nBbaB+gs+WGP/vaE
	+3m7lV12yjlxXK3SJ+8JnHbiQ2EKCEZpnWfJzXDcv5pyZh94qe4enjV3/iPmRvXZCFWTl58Fl2b
	ltjZHUzRWgwqw+jv9BcLDmq44FV1cPdKJV/1YYApbROsYgV4JHBKoLN45M/LbGCP+cyCep1iedK
	1hsOsPezpL/wOVLb1x/ifvKbRtNjMD3i0agvGSHvo/kvmuw1SWFLVIPV8/PG2BPqJjEDvf8LMfw
	Bbdw/KvJAOizd3nHt2MbkKb+6IrTZYwp41MHvKQSdgWuYiH9IOj2Y9Du+OPQ7ZUqsuqkVfzDZ+Z
	I2ItmsIHthA==
X-Received: by 2002:ac8:6f13:0:b0:4b7:95da:b3c7 with SMTP id d75a77b69052e-4e576ae5e78mr211662511cf.48.1759851926935;
        Tue, 07 Oct 2025 08:45:26 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEt79x6LJ5dCtqfIWhwe8WAQwwI9bDIhQG7xuS6ZPYBCKrhtE+gFeELQnmnrZrLECs1V5wL8Q==
X-Received: by 2002:ac8:6f13:0:b0:4b7:95da:b3c7 with SMTP id d75a77b69052e-4e576ae5e78mr211661551cf.48.1759851926303;
        Tue, 07 Oct 2025 08:45:26 -0700 (PDT)
Received: from hu-yabdulra-ams.qualcomm.com ([212.136.9.4])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b486970b30asm1467957566b.59.2025.10.07.08.45.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Oct 2025 08:45:25 -0700 (PDT)
From: Youssef Samir <youssef.abdulrahman@oss.qualcomm.com>
To: jeff.hugo@oss.qualcomm.com, carl.vanderlip@oss.qualcomm.com,
        troy.hanson@oss.qualcomm.com, zachary.mckevitt@oss.qualcomm.com
Cc: ogabbay@kernel.org, lizhi.hou@amd.com, karol.wachowski@linux.intel.com,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org
Subject: [PATCH] accel/qaic: Include signal.h in qaic_control.c
Date: Tue,  7 Oct 2025 17:45:25 +0200
Message-ID: <20251007154525.415039-1-youssef.abdulrahman@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=Hrl72kTS c=1 sm=1 tr=0 ts=68e53598 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=dNlqnMcrdpbb+gQrTujlOQ==:17
 a=x6icFKpwvdMA:10 a=EUspDBNiAAAA:8 a=2SYoI0-8wfQ5n7FIWCoA:9 a=zZCYzV9kfG8A:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-GUID: meAwP0CKa2owj68beZvqLdOyzQEIqaBk
X-Proofpoint-ORIG-GUID: meAwP0CKa2owj68beZvqLdOyzQEIqaBk
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDA0MDAwNCBTYWx0ZWRfX6ji0+Z9Bxu7e
 9UWwi0etSGUXRPfHtBbZU/J1WPMCBCHIwaDRTwXq3D+vG0Jop7cbKABU6EfrgFEDytdPZFOO26z
 mwMXhWTPEa6IfW4nN6lqxLKgnkBazsWDGd/txcZ6zaZsZAJGZrCJjbc5STdGeKM+0Kcva1PRQ8e
 gITThNUHOMsooYjMgi+lzs7f2zg72N+3RTrtLu4VuXKHGoINwp5k1r0ooulvn3UWmPfNQ+4ptfc
 pcbAgFMK21/m8AtH+byX1ldt8FAyuO54P1oMiMROPY5CwTioJCp3ZSj66nBrz68HbrVMqTQwZ3E
 uMZhxyWJSHEZCR48j65yWI1vQPj5kxMkPIpoCVbbqGuYSfnTxTkw4rM88uZ+ERFkIT6pwZ9yONF
 woqewYaVXqme/rOKpQl/mNak+WS6qg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-07_02,2025-10-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 spamscore=0 adultscore=0 lowpriorityscore=0
 bulkscore=0 priorityscore=1501 malwarescore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2509150000 definitions=main-2510040004

From: Zack McKevitt <zmckevit@qti.qualcomm.com>

Include linux/sched/signal.h in qaic_control.c
to avoid implicit inclusion of signal_pending().

Signed-off-by: Zack McKevitt <zmckevit@qti.qualcomm.com>
Signed-off-by: Youssef Samir <youssef.abdulrahman@oss.qualcomm.com>
---
 drivers/accel/qaic/qaic_control.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/accel/qaic/qaic_control.c b/drivers/accel/qaic/qaic_control.c
index d8bdab69f800..e47a48de7876 100644
--- a/drivers/accel/qaic/qaic_control.c
+++ b/drivers/accel/qaic/qaic_control.c
@@ -17,6 +17,7 @@
 #include <linux/overflow.h>
 #include <linux/pci.h>
 #include <linux/scatterlist.h>
+#include <linux/sched/signal.h>
 #include <linux/types.h>
 #include <linux/uaccess.h>
 #include <linux/workqueue.h>
-- 
2.43.0


