Return-Path: <linux-arm-msm+bounces-105845-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +DbkLZyX+WmB+AIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-105845-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 05 May 2026 09:09:16 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B3AA4C78A7
	for <lists+linux-arm-msm@lfdr.de>; Tue, 05 May 2026 09:09:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id CC9FA30C51DB
	for <lists+linux-arm-msm@lfdr.de>; Tue,  5 May 2026 07:02:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CA2E73DEACA;
	Tue,  5 May 2026 07:01:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="UGaMBaT2";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Yy/b8744"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 599623D5259
	for <linux-arm-msm@vger.kernel.org>; Tue,  5 May 2026 07:01:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777964466; cv=none; b=SogVJMhCQZInAkWU7md4ZY5dp4RO4KmPutKR4MfthAFeq5Pm2Arr279WXMT0yxk8CzuOkyL+NKQpU52Y98FcbjTt/XU1hCNSOXmo44x9hG8W1JnOLNTU2cRwpi8yJumWe6RMfseMcH/XRm4MDpp7GY2cdTZ6xd9aaVSKl3Qay2k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777964466; c=relaxed/simple;
	bh=lQ3z4JfxRQCYgSubX6j1hfl+h6PxkcR07VzhxVTyjGc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=LAAexee/pO5QQy8YVwXwfRXqBXLUnkB+YMEsfp3OZfqhRaNNuE/Mt/G5wHvJ2lKa/o53Qcm0x0AvVw60sD/NeV3/KXC+QMBxI9Ik3rvoDIS8Q9/u6nulkaUXFCKepBdhAr6NMVwT5hyRzenAPg6/xxDaik+8A+exE7m9ByndjWo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UGaMBaT2; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Yy/b8744; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6455cCsN749090
	for <linux-arm-msm@vger.kernel.org>; Tue, 5 May 2026 07:01:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	kIHJ7/jlM1Et6nXCMTws30svegX3oTdpHgtcyGwoCNo=; b=UGaMBaT2lL8loyJA
	pPx+8SZOnlTskN0iINLrj23dpF4ZJqr3QmYUuKI2v5bt6zH6jCUMHD3DViYiAFID
	5SZvQAa1rzvXRksYp+Z9tS1w/fq91soWCNUVjVZrC+uVsVGWBao6oRY7YPLF/IUM
	PDaHHz7UQtawsXDq1KS1nCNEqeWMM116OObzcK7aMtf6vpXEC4qMznfFQvjthjw2
	4PlaTf95kO/sr6xBqa0tT9FeSgwaZPaYxy1eruBMgY+SsISceYNnaJ/iFxW51RsD
	cdUAKjngmbe9Njen5tXKlnsF/eLPgL8DztwbHBqeIBNgJk/1G8oWhVblPPJ1K/Xd
	eYKg0Q==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dxscf3tg0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 05 May 2026 07:01:03 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-3568090851aso12612326a91.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 05 May 2026 00:01:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777964463; x=1778569263; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kIHJ7/jlM1Et6nXCMTws30svegX3oTdpHgtcyGwoCNo=;
        b=Yy/b8744Pnz6QxTsic+7k0b/8Z7nHeX9zp/5CEYKl8KxSoq9QYLz3nZb3515qjexDf
         cMLOZA5DNmUpF+C5JXErdoDPOzkpm5MqLbLCnmYVfrNdP4WxLPctoO3DT8lyA8XgZoeK
         ZY9vLk6lUKYZ7qIoaQfvshOtOVmo8dNq9yY1wEsuP42od8FYa28R9SrmueR558AfOSaH
         2BkfuHwd7GSrEZlHL5GzJWKmn+rqd/2tZAmPf2dQsJB90aGl/aDF3qmxUB+k/8RkxDyI
         jsAlyq3b7F/PEZ3unGsLVRO1zufp54jZ6bHZP8C/CHib4bUjB25mGex5IrpR8Uop1jVb
         XICw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777964463; x=1778569263;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=kIHJ7/jlM1Et6nXCMTws30svegX3oTdpHgtcyGwoCNo=;
        b=Q0whFT/ch6H1DtHKADKLMlqgP+9wd8eIs4D6HFUC1nbYHR49J9UEljnm/D67M95abh
         /pA61hXxtsfqrrcek9rBFjCafs6TbVDIu0zRQrCt3FfoJgcuiQsXb9enIRA04jvJJXQu
         PAopdsM+f7R2pmkr9wsckz8FmZYKPJDhw/SinOv4lshJYv5x36/tC7/006YV7MpbuR8/
         ksw8VzanjiqCEdYOxySkZQohU54LpzcgmFmdVomzAINzGq6Y80cCalU1+cIWIs6Imd5J
         7a0u2PKY5jsqxl6wG4lJ36Di3clSCd4ZPT1TKDdyK55Ib0vpIoCLRY1/KtelFfkUyEPH
         xhGg==
X-Forwarded-Encrypted: i=1; AFNElJ8ttm//SREqFiaCKYXXbeSHtioAR+fpUM0F2/SGA1CQGFu1NWdh5H5XhbDUi417tekZ3ZZI+xw4+3+dE9g7@vger.kernel.org
X-Gm-Message-State: AOJu0YyJUBS0kDoD6eOZH5LWL+Q6UjK8kZIB1lVugurDi9zV6+FRSA6k
	dXr8Qjc9oHHgUYlIOiCaBMT7I9gu/1TEtafkFunClV9J6YrbIcxcjUtjkoGq7SkP1ASBTwzCrge
	QUkOwX017YOYAaYBOXB7w3Bxi5sbXrG9xuCqJY0etcRhq7JCdksboNRneBdOXzq8nNn27
X-Gm-Gg: AeBDievwzRU5ghiczMtgoUDzoQHvTR++T+C68BAsZ8Ih/0oKzivj41tnGm7plJmKs1F
	FIXNnj3fP2LfSKB8iTbTYScF53PTK/xATxOBZnCaXn8wD3DnRRjkpFuVl7C5y3jhyV9P9vrDmot
	pDaLSDKgdaTaaF/4TJqfphzmzzMeeQfzegO6YErf9mxHYdENLeZyPdgoGRh7TuuQFFIH/w0BJWg
	+ZnkjQ1XRh3H2k3j5T8zOwLD26METm66eV+Q6g/4XQeErIlkkb8OPHUQpdLNIbLdeMMZmdjQs3d
	38yBuUac3oWhGP6uEP5qanropfzyQ/StLLGqEeYkSKM6w1jixfCInZQWJnSV8N2AIiPlEci2wYv
	CB+ievmRc0usK+cNEn8ZnJgZO1v1ZpT51WC0mD2ntp8DgUjhacDEE6WspBfw2VZYLQg==
X-Received: by 2002:a17:90b:35cc:b0:35f:b6d3:da7d with SMTP id 98e67ed59e1d1-36577485fabmr2034552a91.17.1777964462163;
        Tue, 05 May 2026 00:01:02 -0700 (PDT)
X-Received: by 2002:a17:90b:35cc:b0:35f:b6d3:da7d with SMTP id 98e67ed59e1d1-36577485fabmr2034510a91.17.1777964461663;
        Tue, 05 May 2026 00:01:01 -0700 (PDT)
Received: from hu-bvisredd-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-364ebec73aasm13840146a91.2.2026.05.05.00.00.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 May 2026 00:01:01 -0700 (PDT)
From: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Date: Tue, 05 May 2026 12:29:26 +0530
Subject: [PATCH v4 05/13] iommu: Add iris-vpu-bus to iommu_buses
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260505-glymur-v4-5-17571dbd1caa@oss.qualcomm.com>
References: <20260505-glymur-v4-0-17571dbd1caa@oss.qualcomm.com>
In-Reply-To: <20260505-glymur-v4-0-17571dbd1caa@oss.qualcomm.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil@kernel.org>,
        Stefan Schmidt <stefan.schmidt@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
        Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        iommu@lists.linux.dev, Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1777964421; l=1065;
 i=busanna.reddy@oss.qualcomm.com; s=20260216; h=from:subject:message-id;
 bh=MN1sEQpm2XgufXMnfyVogm/WAu43GbiaX89w8VaFbuU=;
 b=yU4wGk5gMcNMl/YgYaMOseMuBSUH5Ol/F51wnfm/FMqe+aaL+AG8wYAK8NCO34c4/5rM4xA8j
 frn4+vcXcSNBHatelFfO3ExHrA/OmP6y3dlyfsQmh+rCumYZTZflQuL
X-Developer-Key: i=busanna.reddy@oss.qualcomm.com; a=ed25519;
 pk=9vmy9HahBKVAa+GBFj1yHVbz0ey/ucIs1hrlfx+qtok=
X-Authority-Analysis: v=2.4 cv=BcvoFLt2 c=1 sm=1 tr=0 ts=69f995af cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=ADq-ahcSnVbbDow3-dgA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA1MDA2MyBTYWx0ZWRfX4qMQYE3XrOSt
 LfdJF9/PpZFX3PHNLrnwLEe51PWPxUeARSiKZ7TacCF7N8PBOepbRqMLeRsbUOOcbOlw4pwHrA4
 PWuxxaU9zfT961ylgrdjGmXBlcjD49stWayGlp1v8lXjD6Azca+yZYvfTwKrBxWpkIQrp47/6i4
 yrtkyO509/clIvbFlUhmRzj1XUEPnDnErQR1+ROfnKeux5jnS6xn6QZea1YRlpiZ/3X1h1JCYRA
 q86mCdcYHH8Jwj7uS7e0VD2FtH6I7EOTobkgkIUljPW60b3I7c36z+ig8DTsESxBJ9Mdi6xnEqs
 TqjMg3S0m+I+ktUo52zNwyJxGZ6LPyGPPtsbLyKTdOVj4vdIqGr3oJR2Cxtg/tjlMYmHCItQl/2
 jfjQrxoGviUUrbZHNI14DniKoWnvQqMysXGYFFcmhFchjlDTWROrqkJ9sjuhdjIve62x8LZCq+1
 hfSn18frDVlAZ3CyBzw==
X-Proofpoint-ORIG-GUID: rGDdmbr14DRcxpsWvtoiiWXUR_SsB07g
X-Proofpoint-GUID: rGDdmbr14DRcxpsWvtoiiWXUR_SsB07g
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-05_02,2026-04-30_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 spamscore=0 clxscore=1015 phishscore=0
 lowpriorityscore=0 bulkscore=0 adultscore=0 priorityscore=1501
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2605050063
X-Rspamd-Queue-Id: 4B3AA4C78A7
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-105845-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,linux.dev,kernel.org,linaro.org,gmail.com,8bytes.org,arm.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[22];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[busanna.reddy@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]

From: Vikash Garodia <vikash.garodia@oss.qualcomm.com>

Add iris-vpu-bus to iommu_buses[] to register the bus notifier callbacks
for device add and removal events. This ensures that when a device is
registered on iris-vpu-bus, the notifier triggers dma_configure(),
which sets up the IOMMU context for that device.

Signed-off-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
---
 drivers/iommu/iommu.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/iommu/iommu.c b/drivers/iommu/iommu.c
index fccdbaf6dbd5..3b65df247e52 100644
--- a/drivers/iommu/iommu.c
+++ b/drivers/iommu/iommu.c
@@ -13,6 +13,7 @@
 #include <linux/bug.h>
 #include <linux/types.h>
 #include <linux/init.h>
+#include <linux/iris_vpu_bus.h>
 #include <linux/export.h>
 #include <linux/slab.h>
 #include <linux/errno.h>
@@ -179,6 +180,9 @@ static const struct bus_type * const iommu_buses[] = {
 #ifdef CONFIG_CDX_BUS
 	&cdx_bus_type,
 #endif
+#if IS_ENABLED(CONFIG_VIDEO_QCOM_IRIS)
+	&iris_vpu_bus_type,
+#endif
 };
 
 /*

-- 
2.34.1


