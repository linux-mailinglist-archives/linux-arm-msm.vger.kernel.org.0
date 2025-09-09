Return-Path: <linux-arm-msm+bounces-72871-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B199B5068B
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Sep 2025 21:46:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D6CE61C63DB8
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Sep 2025 19:47:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9C96230DD01;
	Tue,  9 Sep 2025 19:46:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="S3NHo08h"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E56BF304973
	for <linux-arm-msm@vger.kernel.org>; Tue,  9 Sep 2025 19:46:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757447207; cv=none; b=iplszoAWD5kPNX9IPRrrpNJeSL0dkSEhy+GuvqVnoAgysLHpiIMEcxCgnkWh/zqKnWbRV6go9tH6f1XMecJnOZKBaT1yAl/nFJa1pD6v4iPlKJm9x2PGjk6kAp9qVJHi/JZf4vJPiK63oDRulqqWCQxK5ue/YhYoDKxsYpGJMig=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757447207; c=relaxed/simple;
	bh=bxllsDf1Lp5l4wjG0+72sWfLlBUmHJTnSL+neH2MmYE=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=b4L04eiNRTLvJ9HcLFLrnjPuqCQnqCnXGBi9NHAc2V5QhkSqOGVkT02f2RrzqOFLTn+F6U+H3U/5FB5aJTKLqa7coCGgISSxj8PemM/D+BdmvONdWprnAfnIDIPH/dvlsPwSMwpl8p4AJ1DoSqVD8V3u9C8PyawI6z1SyluaJLY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=S3NHo08h; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 589HKcPg029371
	for <linux-arm-msm@vger.kernel.org>; Tue, 9 Sep 2025 19:46:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=5steLRplPiLvefWuDpnbGIk+jjoaaF/CqJG
	o3p0Oykg=; b=S3NHo08hi5lyx5mDsSx3B7xaaTgM7tPKMem0kGKIsnoA1mpmZOx
	2wgTlDZeC0P/fckpfQ5i+cZkT49P24l0w0ciAWLyxV0HOefBY3TKrXoSW5wWJ9aB
	0W7pdUka6RDxsgB/K6iEIfCi2pdDCd92mL8JBrOzq9ed4P5HcbzCPgHZ3uuZdVsx
	5i56ZWFFtBcWIFH9tv18waP4QBQaAAI9ezzHX90s++mH7gNUQRiOse862IQTamaz
	A59peSJpaQRpZo5UXMswFV+BZbOykcya9AmntZaNZ7L8dNOcQK+w9SNDiiyXBFgo
	KsZtUvTZUkUSw31UMlvsOrrV76yPvkEJbdA==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 490db8hgxg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 09 Sep 2025 19:46:44 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-72023d1be83so208119996d6.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 09 Sep 2025 12:46:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757447204; x=1758052004;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5steLRplPiLvefWuDpnbGIk+jjoaaF/CqJGo3p0Oykg=;
        b=NVKiIiJaQulrY+UWcDj9ozmmoOoj4ImlEtD0e6nbOfzTFWkMhEWN/QT5V+RyDwJ1qH
         GLU3C5uOgNaqmQM+Cfu0lnGPJegB5uht4flJpeapl3XoQx/sjlw59iYGoCHcN/VACcTs
         t+uAt4MAhephjhWLMdXOyk2iAsKvryztPSoiFb4vmiXTzv9ncKFb62eh0Hw8B8FJjjFA
         Da1Lbb4F5e42Z0up/v8NhrGi1+wJdGl0Y9oEXo8ULodb+DpbogT7BhQHja7VEQjm4fsO
         XY+iH89JCMI6XTVQ3L9ZlqwE/EYwxt8WzIOkhi/pkNJcRGKqV/A5D1BjBjal6Fa4Vhzq
         v5sw==
X-Forwarded-Encrypted: i=1; AJvYcCVoce3PfBtK13Oq4sGmTZLNgSoCUgsnksxQ7xqNdxh3yTiaBVyuhclyWuSmpvuLsUZMMKrQf7ogJ+46isUa@vger.kernel.org
X-Gm-Message-State: AOJu0YzdnQouMquN9kVb5NFr4t58JYCZo27px5ZMyhnJmeHMjc/nHv4w
	RUPhkFKuocVRfYpHLv1m1Z92cb/zV+T84Jj5X7mQ0037IbeAbBUP5bclDkmYIlKtICCCfUf2F/t
	Pt/NWqyCEcUyizU2WHzf4mvw41+J24EL3B6fLkHimkKAjA9mpjkwmw62i7TK1epXUxF2fy1chEo
	AmUpE=
X-Gm-Gg: ASbGncv3f+ShJzV8AL4TajX1DEHtglcxZM1FRzc3xJkE+dP8N7MR4zEeRr3Wj28CbIn
	arU3q6sarL0OpcpcX3fZlwGHb6qWc+diDuYPv2HuzVNOxR3m8EqBG6bZ8mreNk76lLtRxrALajn
	EvDLh2jNcqAncqMIcrrJZo8GHiDfbFPJ8HAGWwRk4AEfJZuWj4zWzqCikn2h7l9uTPWdv8v2rYh
	B89BZzjNShUdMkvLnjoKmnBZUX1UeC1uKycHcoPT/82RqGMTN1y/4gpsu31ZAuZxM1qUsv0kJuI
	oFd9w3J5qzUigxztHioRdOf4OxBignvAHtJT0E10w6MBtzf2r2wrGeG0UmHovosfi0x66AfWYlA
	=
X-Received: by 2002:a05:6214:2262:b0:72d:8061:93f9 with SMTP id 6a1803df08f44-7393ec168a2mr106215046d6.37.1757447203580;
        Tue, 09 Sep 2025 12:46:43 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHicJvN6Ujucn2Isb8qJ82mIwVum40z8rVje70UXWdGxfkdDyrQ4DkGVKF4ygrOam+Eb1NvNA==
X-Received: by 2002:a05:6214:2262:b0:72d:8061:93f9 with SMTP id 6a1803df08f44-7393ec168a2mr106214806d6.37.1757447203103;
        Tue, 09 Sep 2025 12:46:43 -0700 (PDT)
Received: from QCOM-eG0v1AUPpu.qualcomm.com ([2a01:e0a:82c:5f0:15ba:6482:f5ef:4039])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-62bfef68a44sm1743963a12.21.2025.09.09.12.46.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Sep 2025 12:46:42 -0700 (PDT)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
To: bryan.odonoghue@linaro.org
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        hans@jjverkuil.nl, Loic Poulain <loic.poulain@oss.qualcomm.com>,
        kernel test robot <lkp@intel.com>
Subject: [PATCH] media: qcom: camss: Add missing header bitfield.h
Date: Tue,  9 Sep 2025 21:46:36 +0200
Message-Id: <20250909194636.2243539-1-loic.poulain@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA2MDAzMSBTYWx0ZWRfXynQg+9ayCiDK
 62shsiUNRqpxE+c3kRu53FYVIa8FZFcbfY9PIERaDzM0oenSrr3OBWVx+ClP+NctGbjxHEXhJzh
 l5Tl1gdefiw9uqiF2U/ROUTgPNQZCVeLc2BKvyinXFKa2RWm+5CMijAMMzKwxRtKcHW4t+oER7p
 /C5fEOnRrXVHH8e24T/oEx51Y9d0Y3ftuMWjD67Wt6KDVcbK3BoMSn/nk37lEARMrotr51YX74l
 ioogwZr8CGOekKYuaxgyggGRyrrJeD+8QgubXdWgLlNLZpi9gDod8TR5+idNOqQcc2QDqByrwGn
 iuN21ia6zzDXB1np6VODxWOSrLtuR6EB0dlO2Mi5+iIxkhZ+r7kZqIPYhQglyjLgWXENMMzQfbW
 8oiTeQOx
X-Proofpoint-ORIG-GUID: 3lShVr3GuEE4Nap63E4pm8_fCTM4esak
X-Proofpoint-GUID: 3lShVr3GuEE4Nap63E4pm8_fCTM4esak
X-Authority-Analysis: v=2.4 cv=VIDdn8PX c=1 sm=1 tr=0 ts=68c08424 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=xqWC_Br6kY4A:10 a=yJojWOMRYYMA:10
 a=VwQbUJbxAAAA:8 a=QyXUC8HyAAAA:8 a=EUspDBNiAAAA:8 a=d6NsCnqxkaT3_V1LjFAA:9
 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-09_03,2025-09-08_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 spamscore=0 suspectscore=0 bulkscore=0
 phishscore=0 adultscore=0 clxscore=1015 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509060031

Add the <linux/bitfield.h> header to prevent erros:
>> drivers/media/platform/qcom/camss/camss-vfe-340.c:186:21: error: call to undeclared function 'FIELD_PREP'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     186 |                         if (bus_status & TFE_BUS_IRQ_MASK_RUP_DONE(i))
         |                                          ^
   drivers/media/platform/qcom/camss/camss-vfe-340.c:36:40: note: expanded from macro 'TFE_BUS_IRQ_MASK_RUP_DONE'
      36 | #define         TFE_BUS_IRQ_MASK_RUP_DONE(sc)   FIELD_PREP(TFE_BUS_IRQ_MASK_RUP_DONE_MASK, BIT(sc))
         |                                                 ^
   drivers/media/platform/qcom/camss/camss-vfe-340.c:191:21: error: call to undeclared function 'FIELD_PREP'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     191 |                         if (bus_status & TFE_BUS_IRQ_MASK_BUF_DONE(i))
         |                                          ^
   drivers/media/platform/qcom/camss/camss-vfe-340.c:38:40: note: expanded from macro 'TFE_BUS_IRQ_MASK_BUF_DONE'
      38 | #define         TFE_BUS_IRQ_MASK_BUF_DONE(sg)   FIELD_PREP(TFE_BUS_IRQ_MASK_BUF_DONE_MASK, BIT(sg))
         |                                                 ^
   2 errors generated.

Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202509100228.xLeeYzpG-lkp@intel.com/
Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
---
 drivers/media/platform/qcom/camss/camss-csid-340.c | 1 +
 drivers/media/platform/qcom/camss/camss-vfe-340.c  | 1 +
 2 files changed, 2 insertions(+)

diff --git a/drivers/media/platform/qcom/camss/camss-csid-340.c b/drivers/media/platform/qcom/camss/camss-csid-340.c
index 7a8fbae3009b..22a30510fb79 100644
--- a/drivers/media/platform/qcom/camss/camss-csid-340.c
+++ b/drivers/media/platform/qcom/camss/camss-csid-340.c
@@ -6,6 +6,7 @@
  */
 
 #include <linux/completion.h>
+#include <linux/bitfield.h>
 #include <linux/interrupt.h>
 #include <linux/io.h>
 #include <linux/kernel.h>
diff --git a/drivers/media/platform/qcom/camss/camss-vfe-340.c b/drivers/media/platform/qcom/camss/camss-vfe-340.c
index 55f24eb06758..30d7630b3e8b 100644
--- a/drivers/media/platform/qcom/camss/camss-vfe-340.c
+++ b/drivers/media/platform/qcom/camss/camss-vfe-340.c
@@ -6,6 +6,7 @@
  */
 
 #include <linux/delay.h>
+#include <linux/bitfield.h>
 #include <linux/interrupt.h>
 #include <linux/io.h>
 #include <linux/iopoll.h>
-- 
2.34.1


