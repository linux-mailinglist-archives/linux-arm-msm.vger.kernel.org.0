Return-Path: <linux-arm-msm+bounces-77434-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 04624BDF53D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Oct 2025 17:22:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 404B6354A70
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Oct 2025 15:22:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0967821ABC9;
	Wed, 15 Oct 2025 15:22:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Qs8PLf6p"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 374DF18BC3D
	for <linux-arm-msm@vger.kernel.org>; Wed, 15 Oct 2025 15:22:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760541764; cv=none; b=RTqaVOQruYlzMyPakQYXQ0VjzBuJ/RLMdItYUF6ZL7+U5ZX/4At25nuTfrbL25YwJgoOXWPcT5kCwGCatUH2307G8ZCV5rJ1nrqryBK6XpWMh1W25o1z43W5ONN7cY3o2L24CQX48vQo5aZ22RKFICdIlrbja1s9pXhK+2ux7FA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760541764; c=relaxed/simple;
	bh=0W9XF+6ThgiKXdZ2smYcUHMFdThpGhSkFjwjg6dmi38=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=CcYrzEXYU+eiure0573ylI9gdasWatGwJhciduP/m3UwsYZtSSiZ/kRbDiZEOWoWBfT4GjADXdowu/Uu/s18VvlVwF5c9kR0m4jwXTKfSzDbQfOlcL6oYQ0qa+Ru77isnp0zY5jhUymurCZ0yndsRC4ni+uzUrisrTtiTXLqUZ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Qs8PLf6p; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59FAiZge003849
	for <linux-arm-msm@vger.kernel.org>; Wed, 15 Oct 2025 15:22:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=edJ0bEjnWm5j3ldlKq/JlHzM8rs/5qauvRp
	LA6s36iQ=; b=Qs8PLf6p6JQ8PQKVqU1+OaJcebSkaVyyeuCAIW6rmJ+KTW228aB
	jGb6jwRYx9rr+qD6dQ2Epaxoed/T9JppRX7hNxrfqkuo88/WvVGCiufWpQrZR0BH
	U7MfJ3mCHmxNdut0r87sLe0laNZleORAfEYeDxrR4KznWJI+E9JfjICbYKWr1IR3
	IyYPZyHjryjdqzp4u5yxuonv+Hc9l5tsTh7QWEWG3EzP18byvgY7ArbMB4BKozwL
	rsgW2XXX12mtJ9JhcwGVz8VtG5Ka273nBLgUADIGDd7Qr3Wwt60bdwwZobLuX2Uz
	tKRiF5LYr1JxwOgOllN3MYjRlojVrACUq8g==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49sua8kgje-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 15 Oct 2025 15:22:41 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-87561645c1cso3298256685a.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 15 Oct 2025 08:22:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760541761; x=1761146561;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=edJ0bEjnWm5j3ldlKq/JlHzM8rs/5qauvRpLA6s36iQ=;
        b=LdxM/8Rje2dHiY3tdmKItUCTQdXxOWgUrk7YZkZo+fK/z8ImmWTjdlSvazGK6pnY16
         y59DldqA257rnJ09UYicB7PVuTNz1XUZhfLYuq9/sKZnmQIBSTxgUrlhGtV3BbsgCj9R
         W9g+Um3oNJ7Ubl7BC/+rEmuvgLr2WKay+kNAesMwrzcCBILHDTHFkrIy/dnp+SMSgCxE
         /xFn4mZuczQTdaHKypckDfb+bpJlxGjH81NlGuWrFCBtVhiQ3VY4uN8xbrgWAZoP4Cjg
         A6UYiST5K5mzD28KKXZidKfcfI8748Zm0JveCSQvFIG2UtQkFMFacnYfXg6o9mhW0t/S
         7VOA==
X-Forwarded-Encrypted: i=1; AJvYcCWmfO0xzD7HsGY3XUs6HiVu1/RgbTZfK8vJWjt6Ur6aQX72tHKlJ0s40VHWw32mPA74SkWtvgMypiQUImBm@vger.kernel.org
X-Gm-Message-State: AOJu0Yw8WiZ8H5WGCMCKHiCmvwyaenCPOPiO5sAHSPSp4J4UvyLOCuP+
	QUrgobWmytN8cyHRz/NKO/CWoSZsdcFZt2iq+r3BX9tKOo/NbFvyZxgIIlmx/M5XHkVGtTOC35F
	eJZup2LmghYcQJFUT0Q7yUXMutJrBcUBYEVT8UeiNp9FLwHDenWW18pElfhjOWL2nLIrC
X-Gm-Gg: ASbGncvwLoCmXy48dwdJxx5g6w04TaXita48KU3gN1U5+rdJ+Y1g8cdNqQK00vwQ6pB
	Lviuur95NHaW1lUv/YGqT36/eSU+llCd0pOncuA1X/x3yZeKPx7b2f3/tU/ntrETBEXC7DrDm5q
	6vnguWmjY09bLpBQcvqSbjQlIOb2Xari402JVK5Y1qVAiSMAMo1AJ0z5rnO38EjQkQ0G2hcAkxp
	NNJVnWvFab56qT5/6bO58+prVpNsgwQGIQMV6jUFheG4jhRsbcaTGE14Bk3uS1yDdifmxeALFoz
	w7OWUjYPJkKsmL98QNLlNXSGGJnUriBjlwf/wair4gIskLtbDTS+jlXTgEb8Al7W0lbfMHufzyX
	1UoXZlhQHLtW77x+E+4TxRmwOJZkBJ9ko8UZ6xto=
X-Received: by 2002:a05:622a:508:b0:4e7:281e:df87 with SMTP id d75a77b69052e-4e7281ee715mr149667531cf.21.1760541760887;
        Wed, 15 Oct 2025 08:22:40 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGpCCdhARt3ZuZXs1p8VBeOh7OQNbgINPUU/IinUgq+Yn542+19RfvpRPL4ZuON4lZwBwjdcg==
X-Received: by 2002:a05:622a:508:b0:4e7:281e:df87 with SMTP id d75a77b69052e-4e7281ee715mr149667031cf.21.1760541760260;
        Wed, 15 Oct 2025 08:22:40 -0700 (PDT)
Received: from hu-yabdulra-ams.qualcomm.com ([212.136.9.4])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b5cb9e80bcesm256689866b.26.2025.10.15.08.22.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Oct 2025 08:22:39 -0700 (PDT)
From: Youssef Samir <youssef.abdulrahman@oss.qualcomm.com>
To: jeff.hugo@oss.qualcomm.com, carl.vanderlip@oss.qualcomm.com,
        troy.hanson@oss.qualcomm.com, zachary.mckevitt@oss.qualcomm.com
Cc: ogabbay@kernel.org, lizhi.hou@amd.com, karol.wachowski@linux.intel.com,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org
Subject: [PATCH] accel/qaic: Replace user defined overflow check
Date: Wed, 15 Oct 2025 17:22:39 +0200
Message-ID: <20251015152239.167226-1-youssef.abdulrahman@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: DZ_uydoDcKcsOnYT8Dhudbk41Lpj5dNF
X-Authority-Analysis: v=2.4 cv=e5MLiKp/ c=1 sm=1 tr=0 ts=68efbc41 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=dNlqnMcrdpbb+gQrTujlOQ==:17
 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8
 a=FPDjysqdnJW7MIsHof4A:9 a=IoWCM6iH3mJn3m4BftBB:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDE0MDEzNCBTYWx0ZWRfXw5AliGyITLST
 YYYLbQRNwMRsW+IUPFZYNUv1pFUinbFKC7nsG5OY2xl+4h4Rrm0mpHxvIQHUdAB9QjclS9PEbip
 Jx2z72aCEY8/xVw+vpfA9gIIMcK6bInUxgfPhzkbmvEOjcl/q7SpODFTmc0C7h/zv2BxjPb4U9A
 XKNq5BOppfFaNwt+lPdFir1YVtYgQzpWeNuBVR9uJVDGBmdGZQv5qkS5bSq0+lrRoBL4QIRJim3
 epml0bb1RxzOQbgRYzSkWq0RK0gcaEKIP5OS/Vj7P/jVKacrcDqY3qKD4ckksHN71iUgTqnV1XP
 p34ghR05Z2Lrgkk1zNV+mpjufphiDR27P34eKBaCKbtpu00YuDxapMl/Fnekq7FJvlVpL0yukME
 Kqx3/FqWlun0I5HMgpN2KvnQbUPiRw==
X-Proofpoint-ORIG-GUID: DZ_uydoDcKcsOnYT8Dhudbk41Lpj5dNF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-15_05,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0 spamscore=0 adultscore=0 clxscore=1015
 priorityscore=1501 impostorscore=0 malwarescore=0 bulkscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2510020000
 definitions=main-2510140134

From: Sourab Bera <quic_sourbera@quicinc.com>

Replace the current logic to check overflow, with the kernel-provided
macro `check_mul_overflow` in the function __qaic_execute_bo_ioctl().

Signed-off-by: Sourab Bera <quic_sourbera@quicinc.com>
Signed-off-by: Youssef Samir <youssef.abdulrahman@oss.qualcomm.com>
---
 drivers/accel/qaic/qaic_data.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/accel/qaic/qaic_data.c b/drivers/accel/qaic/qaic_data.c
index 797289e9d780..e6f96dbb3382 100644
--- a/drivers/accel/qaic/qaic_data.c
+++ b/drivers/accel/qaic/qaic_data.c
@@ -15,6 +15,7 @@
 #include <linux/math64.h>
 #include <linux/mm.h>
 #include <linux/moduleparam.h>
+#include <linux/overflow.h>
 #include <linux/scatterlist.h>
 #include <linux/spinlock.h>
 #include <linux/srcu.h>
@@ -1305,17 +1306,17 @@ static int __qaic_execute_bo_ioctl(struct drm_device *dev, void *data, struct dr
 	u64 received_ts;
 	u32 queue_level;
 	u64 submit_ts;
+	size_t size;
 	int rcu_id;
 	u32 head;
 	u32 tail;
-	u64 size;
 	int ret;
 
 	received_ts = ktime_get_ns();
 
 	size = is_partial ? sizeof(struct qaic_partial_execute_entry) : sizeof(*exec);
-	n = (unsigned long)size * args->hdr.count;
-	if (args->hdr.count == 0 || n / args->hdr.count != size)
+	if (args->hdr.count == 0 ||
+	    check_mul_overflow((unsigned long)size, (unsigned long)args->hdr.count, &n))
 		return -EINVAL;
 
 	user_data = u64_to_user_ptr(args->data);
-- 
2.43.0


