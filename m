Return-Path: <linux-arm-msm+bounces-76276-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id C2D2DBC2D9E
	for <lists+linux-arm-msm@lfdr.de>; Wed, 08 Oct 2025 00:19:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 57F444F9498
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Oct 2025 22:17:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C4B842080C8;
	Tue,  7 Oct 2025 22:15:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OqSIUPOn"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 353092459ED
	for <linux-arm-msm@vger.kernel.org>; Tue,  7 Oct 2025 22:15:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759875333; cv=none; b=rvQaNfpEw8oQFOjVNLjHvKOQI0FcN5tYQg9I9kzAGbV2JkrhxjT9y8790XkhxijqETn8WrQWwGMN87m5Xfwf0iB+2CXWuNqu+Iwxltyufwk2+r6LQQCptAii8lZ+h7Y99xq8s+C2NayWEz4Fv45TnYu6K4gHFBvkifGogEBI2HY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759875333; c=relaxed/simple;
	bh=o8SUuRKPi4/tomM+pp/fvljjIgBZBJeulXzHWhrYlTs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=WnEaHooTofNNpUa0fh6zYNSYOAlQZZtVdrQR0e4HnFhq509eBVGgUfOX5rstSlMCmEH4dNCWl/Te/AZq5p6nXp6KUwQ3dUPAZ4s/PaJ80peqW9toZad1aS+p6fm4ri2bwsZ306lsDI7Slv/CJTOLPELfgQCn5HFWRhVACq8TbWs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OqSIUPOn; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 597ETEI9006859
	for <linux-arm-msm@vger.kernel.org>; Tue, 7 Oct 2025 22:15:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=qzg0RGVNtw8UQBRce7wlFPpWaHbpTEgKV1P
	6tB6CS1E=; b=OqSIUPOnge5TUlz8U+/HWjmTkw0F9EY7v4ef27nlrUHInpFMrjs
	Z5KttfL1SDzrK9OvrOSQcA+FS0lKw40djNg7KRhulyeD3H9yOQZbRvRmSmecu3WL
	2o7VoIBIQnHOOEmG6revGwrSXAZaOxhvLdf10GgOLfZBh0xrk8BAlKKf1o2l3RoG
	mPcs9t2u7BEtP1qeYr/4fMZtonOQgtmysi5hCtAfCDgza2OGS0nt85znWlfa3pCP
	tcVu+EuyBholzC7nl4z4dPAmnFq6DoOyTDUH4XhUduuRHG7dtlZo9IQd04NiNneh
	hCvE+TAbouqq2dHaH7orotiFkkP3fnZSirA==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49jut1rn6j-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 07 Oct 2025 22:15:31 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4e57359997aso85995201cf.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 07 Oct 2025 15:15:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759875330; x=1760480130;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qzg0RGVNtw8UQBRce7wlFPpWaHbpTEgKV1P6tB6CS1E=;
        b=ZwHV0x/6PyLWKQ81uuowfad07YHUjV7EmzoGAzTMt2BvtDn/cftpzs3NvPPTLOvfF5
         YUtDHBXC74ovxvgk/fqFu6GWRsIt4ca2D0VfHIAOBWYljLLbA/QIOkvygaIIImzdyzc8
         lJoZaF8wyC6q6T0Xq0GeI1OUceK1622uYzGWChkBvCcZK/6rn8X+bDSkDGGyTIgqxrKZ
         R2RCi5I7g4gwDzeQMiKZxpieRQAduXF1WsBOfnEHWE0aYCnVknyMX2QoHLW4aAqPgD1B
         4+NzT6/sTg7UktXIA9VklyfOMWHEKlvtqHb8Pf5VhxhLF3w1ZebnXXF0Y4SnPfoagP/z
         jN3A==
X-Forwarded-Encrypted: i=1; AJvYcCXFfnm3ru8K85oYJgrokm3+WUv1z74Q3kZ/8hqw41pGyL63uHLVrpmw5DvoYs0sFoeVanh2hQM6k0LjMGRV@vger.kernel.org
X-Gm-Message-State: AOJu0YyoDKfKE8Y34gpy/mIjHeI8Sh7gyFpBjBX8BnUvyfcm5qRdhyM2
	klAmaHsYeTZNW6o9Og1cfc1TTbgF79fdiVLGW4HqhoOPJOMA4WnhcvDy4b4MdsLYxw9IV8Tp/RZ
	cUfrJS8iwNxnHJExbFhXBCjxfQGbMXE8Bk/kFnIbtcz0NtScwLwwwYr5vkPVNWkeTxSjJ
X-Gm-Gg: ASbGncsiRkzYMNT0LzqGt+aBLZfI54Q5EudYT1mevThImLMJ4QDHTyh8/W+ph562AB6
	IF6F2QGz9Xc82LE2jKRxSYDoFC0EoLKmD1xSUNLkb4pdo5W31V1BPq4TGLvDRNDOPB7pRTRiKI7
	AkeW+FJenmW3Dg4tbNXD7j6a/D4euK8WGWDwBOSK24b4VXhDZY6BAqyAbSUgJlFyJtbHAUQ9IaL
	BVeulyKI6/I2mVl9d8+w/CmO+lUUnQbgL0Q/VqLBL4c1RHKV8jtbeHzWuv7x6zCkuyzArCdDNB/
	pGc5DaInLrj4suEBbuvYvx9YQiVFWnNVY7FJf4lDogPJsBVgKdGYznRgSKmoVwyQuNBbn708a2F
	v4T32WcysHQ==
X-Received: by 2002:a05:622a:1dca:b0:4e4:f9f8:9d3d with SMTP id d75a77b69052e-4e6ead87103mr20760941cf.84.1759875329909;
        Tue, 07 Oct 2025 15:15:29 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH3pPRZAE0QnEmi7VS3Mj/VxmscKCog2juZMtHF0Ws48wIhs/gnODvFUSnxyYtXuwllAMz8SA==
X-Received: by 2002:a05:622a:1dca:b0:4e4:f9f8:9d3d with SMTP id d75a77b69052e-4e6ead87103mr20760471cf.84.1759875329351;
        Tue, 07 Oct 2025 15:15:29 -0700 (PDT)
Received: from hu-yabdulra-ams.qualcomm.com ([212.136.9.4])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b48652aa035sm1454173466b.15.2025.10.07.15.15.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Oct 2025 15:15:28 -0700 (PDT)
From: Youssef Samir <youssef.abdulrahman@oss.qualcomm.com>
To: jeff.hugo@oss.qualcomm.com, carl.vanderlip@oss.qualcomm.com,
        troy.hanson@oss.qualcomm.com, zachary.mckevitt@oss.qualcomm.com
Cc: ogabbay@kernel.org, lizhi.hou@amd.com, karol.wachowski@linux.intel.com,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org
Subject: [PATCH] accel/qaic: Add xbl_config image entry for AIC200
Date: Wed,  8 Oct 2025 00:15:28 +0200
Message-ID: <20251007221528.561242-1-youssef.abdulrahman@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: -w76TBFGVCOvAyg0HaprpfMO0yiIDLN0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDA0MDAyNyBTYWx0ZWRfX2VSa3TKMRypQ
 PaLRnS0k2toosEt6rwTG+2JHHJcWzMO45AbfJY1/jBVSTZ9Psk9AsU9RWuJidPER/k9qN8TVgQF
 2uwlyZEo+YFTYvDvzolsiNIRpuPEoA+HQV9i0Qjem/y7MWEoyHjo6fnuro0Vjnuu6lA31ZbVr75
 aHdiZCHi6iXi3p0QpzsDdl1OgNM2yMeo/V0gZoO2Dd5TKJJTFoHMLdtviDdsyH5sgwd5QsfjP4Z
 dUr1X6oFCOwA4W9Are45Tizw2KShcUxVwSpCZvLd3QtzzemYZctABEnnWQ++OVh9OGOGJjfPQBK
 AcvGiXwzkl7fmal59D4YWhM89bYeAP9mHMnyLMDYL01dqogNL4fxRUOhwy/uioxLolswgpBOQ+Q
 oymTmgOMSJk7w4kTMkB5ZQUJfMIxCQ==
X-Authority-Analysis: v=2.4 cv=Vqcuwu2n c=1 sm=1 tr=0 ts=68e59103 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=dNlqnMcrdpbb+gQrTujlOQ==:17
 a=x6icFKpwvdMA:10 a=EUspDBNiAAAA:8 a=9t2MsrROHLuJ27tN7sEA:9
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-ORIG-GUID: -w76TBFGVCOvAyg0HaprpfMO0yiIDLN0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-07_02,2025-10-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 malwarescore=0 spamscore=0 priorityscore=1501
 suspectscore=0 bulkscore=0 clxscore=1015 impostorscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2509150000 definitions=main-2510040027

From: Aswin Venkatesan <aswivenk@qti.qualcomm.com>

Update the Sahara image table for the AIC200 to add an entry for xbl_config image at id 38.

Signed-off-by: Aswin Venkatesan <aswivenk@qti.qualcomm.com>
Signed-off-by: Youssef Samir <youssef.abdulrahman@oss.qualcomm.com>
---
 drivers/accel/qaic/sahara.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/accel/qaic/sahara.c b/drivers/accel/qaic/sahara.c
index 3ebcc1f7ff58..04e8acb94c04 100644
--- a/drivers/accel/qaic/sahara.c
+++ b/drivers/accel/qaic/sahara.c
@@ -194,6 +194,7 @@ static const char * const aic200_image_table[] = {
 	[23] = "qcom/aic200/aop.mbn",
 	[32] = "qcom/aic200/tz.mbn",
 	[33] = "qcom/aic200/hypvm.mbn",
+	[38] = "qcom/aic200/xbl_config.elf",
 	[39] = "qcom/aic200/aic200_abl.elf",
 	[40] = "qcom/aic200/apdp.mbn",
 	[41] = "qcom/aic200/devcfg.mbn",
-- 
2.43.0


