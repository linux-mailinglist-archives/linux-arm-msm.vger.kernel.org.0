Return-Path: <linux-arm-msm+bounces-52908-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1688AA77262
	for <lists+linux-arm-msm@lfdr.de>; Tue,  1 Apr 2025 03:42:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B85B416AA62
	for <lists+linux-arm-msm@lfdr.de>; Tue,  1 Apr 2025 01:42:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 84BE370830;
	Tue,  1 Apr 2025 01:42:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YX4Cet3J"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE2CB2AF04
	for <linux-arm-msm@vger.kernel.org>; Tue,  1 Apr 2025 01:42:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743471741; cv=none; b=fhUany42P4tsEKQro9MYUT+ZWqrYp2iz1+/1l3dJEcP6NBtkAxcBVJvEI0gj+2QOB8PoP0z+oTTwPPAU+GRFuWLxE/uD923P2SL1lIhxx6PV/4v9gk8vwHPH9ijECbZ43WSxiGrfDoVgfs//2+aeL4U7bsBIIGdYFPj3FlkIC60=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743471741; c=relaxed/simple;
	bh=LgAgkR9JX+LzMJK56/SfcYwiPWFfGWJah1IzcNJ7x4c=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=U+H1dinRHhq+8qrC/WDZJwnmF7EgEyrWNL79xk2hzFhd/aid+rO0pSRenPEj0CA32xnXk45w9BSzMxs+GRch9C398XKV5intDPazzmSFs6d5vzvmq89s6FyobtKBL3zZl/x71Pyj7Mu4h8ytFoHSbQNJoL6h10gxlv869yAERoY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YX4Cet3J; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52VFCqss025623
	for <linux-arm-msm@vger.kernel.org>; Tue, 1 Apr 2025 01:42:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=tQNRCYHU/5P2PfWYw9DTAN2O1KOVrz4anhz
	8ncma5w0=; b=YX4Cet3JYUf2Ih40V3PneXIZvWvQlf6S7Bc7u2hJHvH0GWzp7xV
	u+qwDYCphHhDa++A+YDuzntCM8hIVncD0Lq9At3XrYcaKVKgiq1T0CuT8pmy8SES
	e/54+r8KQiXqLH+itC44KnS/kCtUwrh/ZKOwrx4dVtb3AZJVYu6XAANvfmXiDklU
	nnwuVRUlj04LgX1cV6Soa6IrJByJ//atKvpTdxouUe3nQd7HuYiaiBYiYSeU/9IO
	S1xZoKFoeYPpW2+GKrCq86e2E0+02fPHHDbbb5cvHqYOiLJk3svdBBwZr1JHp6D0
	1ZoyprqR1omSE0TdK8lVtvnezVb6vo1TZTA==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45p6jhpagy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 01 Apr 2025 01:42:19 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2265a09dbfcso145281435ad.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 31 Mar 2025 18:42:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743471738; x=1744076538;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tQNRCYHU/5P2PfWYw9DTAN2O1KOVrz4anhz8ncma5w0=;
        b=ovLyUqVkzdt7h46bZaP0vMtyNeIZxrPNGLWVkKnnZbJI5euIDvyHVlq8+p3WWkpGc0
         5nrJdEN/WlpN2JxGPehXGCiVR5poizG7AwIkbwBXiZHzrnvKk/Ita/5NLwy/gtUQ6ULf
         eeJ1Ljt+Ht2lkmccs6TioOa5lP53qI0+QmB0M94tH3Ek5f4KmrnMy2/MPS99VahZs91H
         fe2DUvmm4GiOvu05JsTztDC5MCGWqYCRX/OikUjQzSy3Nh7lsi583YysJX/NHcUBOgip
         WRPlrYG4TzTczyFPi84UEZBmZhIE04vVS4MuUt/VNU8NwpsIz9JlufBqplGdCGsc5r0P
         wSwA==
X-Forwarded-Encrypted: i=1; AJvYcCWCwFXNvV5RnLHVvlp5if2zpbK4B6MpyS8eGBvyJmMSvCRifud+XsIIJH3c0Xa4vX68zt93YA57eq/kxWRY@vger.kernel.org
X-Gm-Message-State: AOJu0YzLhW0eAnlfoM4Umb582hjkEp4E5qwlO8oItodsyBKGVsO+8VYT
	CG/zwJuuHnOShnqrf3CyUHaq4lQjQyvNBIMZKhu13SqzYKk7dzoR2vJOP3oPJwTR0AdWEo4wSvv
	m2qJOrnK/IeTDgJ1fruOFy7sSJkfW9KKEXPztnPv+uNRkpnZTCg3jGAaO8EUQZxKj
X-Gm-Gg: ASbGncsN3bkfdJAg20oLUol3SHx83lT0Tk7VnvgwGC+DpZu+8oOuRGcfJ6XLJaBVvNc
	a3BRR85IZmiQKekK6K/hXdPNKNmrtHBPI+KuCD0Ka+GWrtBcP67tvcRI1RiD+AnJ7b7fdXwyJu2
	jMHu3wmqLe9RXOOb24AclttOS2IVQhTIAV8S8pCKR4fnN1XO1JSb6YXjsWhq2oePQzKQ7ulefII
	bppypkd6nNHf9NvEy8vYtyR/PA6388i9A0buwb/cPsCCnC+hV3pwrYGo0SkbDU+6iD53Byl4sbX
	IqKP3qaqTTF93LnJwtq59gX56w2GYWZuOQF5cF6XRwUPBVzYIgctSCtKJFg8wwkmCGYMixcYpqw
	=
X-Received: by 2002:a17:902:e74e:b0:224:376:7a21 with SMTP id d9443c01a7336-2292f9fa2d8mr186446245ad.42.1743471738158;
        Mon, 31 Mar 2025 18:42:18 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEdZ08l4j9k8M+jkJjNmYyxstuXHNySWWgvJXMz8WalhCiWroBe3xTuvINkOu/d9tKSD1zceg==
X-Received: by 2002:a17:902:e74e:b0:224:376:7a21 with SMTP id d9443c01a7336-2292f9fa2d8mr186446005ad.42.1743471737836;
        Mon, 31 Mar 2025 18:42:17 -0700 (PDT)
Received: from jiegan-gv.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2291eee03f5sm76911435ad.99.2025.03.31.18.42.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Mar 2025 18:42:17 -0700 (PDT)
From: Jie Gan <jie.gan@oss.qualcomm.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach <mike.leach@linaro.org>,
        James Clark <james.clark@linaro.org>,
        Jie Gan <quic_jiegan@quicinc.com>
Cc: Tingwei Zhang <quic_tingweiz@quicinc.com>,
        Jinlong Mao <quic_jinlmao@quicinc.com>, coresight@lists.linaro.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Dan Carpenter <dan.carpenter@linaro.org>
Subject: [PATCH] coresight: fix the wrong type of the trace_id in coresight_path
Date: Tue,  1 Apr 2025 09:42:10 +0800
Message-Id: <20250401014210.2576993-1-jie.gan@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: gSBWeob4liA2co6Z3NTzwL6xxLUUYbnL
X-Proofpoint-ORIG-GUID: gSBWeob4liA2co6Z3NTzwL6xxLUUYbnL
X-Authority-Analysis: v=2.4 cv=bZZrUPPB c=1 sm=1 tr=0 ts=67eb447b cx=c_pps a=cmESyDAEBpBGqyK7t0alAg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17 a=XR8D0OoHHMoA:10 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=h-QhH5eI3XViKx3wfOsA:9 a=1OuFwYUASf3TG4hYMiVC:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-01_01,2025-03-27_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0
 priorityscore=1501 clxscore=1015 phishscore=0 adultscore=0
 lowpriorityscore=0 suspectscore=0 spamscore=0 malwarescore=0 mlxscore=0
 impostorscore=0 mlxlogscore=999 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2502280000 definitions=main-2504010010

The trace_id in coresight_path may contain an error number which means a
negative integer, but the current type of the trace_id is u8. Change the
type to int to fix it.

Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
Fixes: 3c03c49b2fa5 ("Coresight: Introduce a new struct coresight_path")
Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
---
 include/linux/coresight.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/linux/coresight.h b/include/linux/coresight.h
index d79a242b271d..c2bf10c43e7c 100644
--- a/include/linux/coresight.h
+++ b/include/linux/coresight.h
@@ -337,7 +337,7 @@ static struct coresight_dev_list (var) = {				\
  */
 struct coresight_path {
 	struct list_head	path_list;
-	u8			trace_id;
+	int			trace_id;
 };
 
 enum cs_mode {
-- 
2.34.1


