Return-Path: <linux-arm-msm+bounces-107776-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MJYIHdT2Bmo4pgIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-107776-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 May 2026 12:35:00 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id C6FBE54D6DC
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 May 2026 12:34:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7469D312B15B
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 May 2026 10:18:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2C8063CE0B2;
	Fri, 15 May 2026 10:18:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="oHmObjrM";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="OkrIjzQ/"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F1013CF67A
	for <linux-arm-msm@vger.kernel.org>; Fri, 15 May 2026 10:18:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778840299; cv=none; b=nR8Sj9VEun7UlbuGdyNGb41VaPLdWfCFTLM6QR8cbfs9/SLSToDRrcuCXUciMeJx+yNFFhuRUzfVcA8uwzxkQPm26Yt2Vg9YNmdT2gmxfckFklVfBg45NL9JzsrmF2AtZlqNllo4Gu1iSgNVURrsiHro1qg9lLNzdBr71wUGEM8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778840299; c=relaxed/simple;
	bh=4DFguP5ocXIhscD9612EjRRT4qcVHurZ7nEpTS/Os6o=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=KCL1GlWwTQGckHTDmMs3qJexZZ4SjuHtWeU6Ci1sWdlv/9kvwWnbkXta41IbUSirZO9NvOeIyVIetwlHKboXu4xW4iC2qfRfBsIJ1qhZGEDPRQ84SqDV+Ne2tdQbSLC8auV1FgMctRjaBhbsOJWBHJNQBvhGF+FsBDgqoNi0aSA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=oHmObjrM; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=OkrIjzQ/; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64F4o7MD4008602
	for <linux-arm-msm@vger.kernel.org>; Fri, 15 May 2026 10:18:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	RRtHwwrJlUuQT5dHlsNzlxDia0oliIuU659w8IfX0lE=; b=oHmObjrM3pih1WsR
	EbZChk1bXouhMg3iAPtgBPT2Ym3rjPE9tDke3L5twPQoFJclII1IGDOImpjh4Nt9
	YX4/vSVZQ6pSrSuaJZ/IKz8uT1wXUd5BG8paYabwFIqt/EqgH1w2XTXH0cWAdZP3
	hPIfdUAkO8AOY0aQcXBz9qWnDXEF4VXF4+uV41IYAVDkYTLFYHSMv3abRTlzy5rR
	u7TeA+2MqlQZ4eG2zUBpp+dV/2Wgdt8GdMiJMm2FGolj+kjgVyQHuyBF9qW0dUx7
	o7Bi2VhuaQDgpGpk0rJ+shVwlcLPLOOYJ2chh+HjIX8saUV1IofVVCDir/upYbrc
	UPq2Kg==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e5m1sttkh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 15 May 2026 10:18:15 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-82fa1c94b37so882612b3a.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 15 May 2026 03:18:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778840294; x=1779445094; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RRtHwwrJlUuQT5dHlsNzlxDia0oliIuU659w8IfX0lE=;
        b=OkrIjzQ/R6vf+ALwVNHJ/0Q4MXpXOUDZMy3SIDfQSNa1UqEQrYe8gd/lkOyVvkGHwE
         C3qwXbTV02dPYva0jVZOdOUYgVbGPt/wWHb+4SnZ4L4/DaU5PabO3ICjPZnx6PEl3t3U
         jM2Hgl2yJzUZ6Q3FvVwkXADcOoSiRcAp1hqXKGX/LezgicTw7X0hjH9pNdb0511iO68v
         lVQL2dvn1OTUyk9vhzq8SsAHIKmKRW19cEJk4tuiNOwlNrCIfnd4Sa8FdHcfISCkFHqI
         UmWMb1W78re65ePVXikcdI7k/zRMTbzkOtZlwRmnyAn9mN8DSHgxLmKRP6ZNxiqk5EgT
         2c9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778840294; x=1779445094;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=RRtHwwrJlUuQT5dHlsNzlxDia0oliIuU659w8IfX0lE=;
        b=ipH6SJbju0bO5Ccr2+Pb1gSbykyOv8kpavu2ig0B3nn2wP/E9r+oWL0m5fIuSFwl/p
         HeFoikxz9br1ss13b24wDlBIUJKcZ6jjpfYXci/ktKz/2BLdl6W9laCjzgsfT83f5JJo
         N2yOWShigH9G9gqhZKRhiWfR2X+ewOz3386KtIcqLQSUBEfc2asMDrA401BScXXfmS/v
         XIeDp+pQ/d9UYMa6QgRmkhbpEVu6PSLIU75qO/cGgiV840Ol/Gf0/zODsQqGSnhMBGXn
         QH03MUQpDtEkQxTi+KWGoGBCcLOxW4b49JlGzY33e5J7G7wF1jBwWgiq+zRzLUcS1Sm1
         HqgA==
X-Gm-Message-State: AOJu0Yy0CjVPJ7r3Lx3t3Bw17VR2ket8aPtV04uz9MCOxo7MYysh5EqS
	yMmK1evWZJ7xRvfXJD2BZQsT/zb/NdNsE+1vjd5sDcNwYbd3mwct3KIQk/QK9V18KrYy+bohYpD
	Ste8Lx7obPsDyyGiJgD2V7a3axq58iNwBC3y2pKCWa8VnSC/XXY6oQneIkdVy0t5Cfsmc
X-Gm-Gg: Acq92OG4hr+oZeA9+Qkcgae0sUJzgIJM6h6hxzLA0+kLYAKo6qX4yc5MuCEFpMC4RPG
	RhJfgFVFdA6+1FLVpS63FOCEkzWwhwebHmsxI7ibS3mveoBACd602qxfC5Pay31r3T5MtMetVpO
	609kinyDpUsoflcNKszYHLNyr7KtYN/IoVHG56a/BgJhj0eiZOVs1zx8RG0+hvMBmHDnrdRCxgL
	qypnINcWdwmI75I0EX4YB47+MMwbUS6rbT3xm8UxhH9YRBawUycYrRfB60Kg0jIDuko9EvEObt9
	es+O/FrW3FYfEg/IPZst3EIoQHP9d/tf1Nlu0zXl2uRoYdME3YLBpI7dGfJfnS6B0Ta4UieIjmm
	GOO9UIPfCIAoT/9EG4/BL3wuOFTin4GMuD8T8G7MSJ+iiL+6cigsRt3L+Rgjy6STK/Zvc4OjvXG
	3C6Qhe9SbSo+MOcBdAIutbyQS32oHve16eAZbJXbKaxzlRIsq//6k=
X-Received: by 2002:a05:6a00:3981:b0:82f:39df:dd54 with SMTP id d2e1a72fcca58-83f18d87730mr7534390b3a.8.1778840294411;
        Fri, 15 May 2026 03:18:14 -0700 (PDT)
X-Received: by 2002:a05:6a00:3981:b0:82f:39df:dd54 with SMTP id d2e1a72fcca58-83f18d87730mr7534344b3a.8.1778840293808;
        Fri, 15 May 2026 03:18:13 -0700 (PDT)
Received: from hu-varada-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-83f19c7c74fsm6878482b3a.49.2026.05.15.03.18.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 May 2026 03:18:13 -0700 (PDT)
From: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
Date: Fri, 15 May 2026 15:48:00 +0530
Subject: [PATCH 2/2] thermal/drivers/qcom/tsens: Add support for ipq9650
 tsens
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260515-tsens-driver-v1-2-015ca76f1418@oss.qualcomm.com>
References: <20260515-tsens-driver-v1-0-015ca76f1418@oss.qualcomm.com>
In-Reply-To: <20260515-tsens-driver-v1-0-015ca76f1418@oss.qualcomm.com>
To: Amit Kucheria <amitk@kernel.org>,
        Thara Gopinath <thara.gopinath@gmail.com>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@kernel.org>,
        Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Proofpoint-ORIG-GUID: ov2TRQakOOBAOzioV9m9nRi9MboTrlfY
X-Proofpoint-GUID: ov2TRQakOOBAOzioV9m9nRi9MboTrlfY
X-Authority-Analysis: v=2.4 cv=cZPiaHDM c=1 sm=1 tr=0 ts=6a06f2e7 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=nMt2SIcdhh0IZDtwxJkA:9 a=QEXdDO2ut3YA:10
 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE1MDEwMyBTYWx0ZWRfXzfDfjsdXr2gG
 ZZB0qnjlrYpHlTs+EiLkvfTD7sLrG/7VOPWIXDhZVrM1Z40+kUlhoNYKLQ9GWxGRm3oBoi8Lc6v
 j2+072p5SiCivi5EiWO5ksLYm+/aUAYySrJx6lI9aAdEfFClxyj7oRsLQLTx0mppouUVKArUuOE
 brtx1CDJFZQaBcTKQo8AbgDmiWVpFRvX+JXXpnSR+oXaKK66YsS/7HKkzzJJrxozTe1nKo/dKi5
 YL8BB4QQyqyt4EjdHGiFAfPEDNrdr5iumKwRN98u9Crez4auz6lejpNz0+fjgYRAnzs7q59C32u
 Kz7PHkAsl2wvlBk4Pofxxm9fH6mUpz0YlaHbpXcci/INuvOHBVXUhZBGWmmOKkEAZax2N86zec3
 giz2Xnrlh5TV8yNhQITYKQXetf9WBx8K4BeKGKWvelTiyDMrfcEDVnmMf/03up+1JHH6SC+YnhO
 MLDvymr0FsePpY0wHPA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-15_02,2026-05-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 clxscore=1015 spamscore=0 priorityscore=1501
 adultscore=0 suspectscore=0 malwarescore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605150103
X-Rspamd-Queue-Id: C6FBE54D6DC
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-107776-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com,intel.com,arm.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[varadarajan.narayanan@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

ipq9650's tsens is similar to ipq5332 tsens but has different number of
sensors. Re-use the ipq5332 data for ipq9650 and modify the sensor
related information.

Signed-off-by: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
---
 drivers/thermal/qcom/tsens-v2.c | 8 ++++++++
 drivers/thermal/qcom/tsens.c    | 3 +++
 drivers/thermal/qcom/tsens.h    | 2 +-
 3 files changed, 12 insertions(+), 1 deletion(-)

diff --git a/drivers/thermal/qcom/tsens-v2.c b/drivers/thermal/qcom/tsens-v2.c
index 8d9698ea3ec4..ef1fee2266a3 100644
--- a/drivers/thermal/qcom/tsens-v2.c
+++ b/drivers/thermal/qcom/tsens-v2.c
@@ -300,6 +300,14 @@ const struct tsens_plat_data data_ipq5424 = {
 	.fields		= tsens_v2_regfields,
 };
 
+const struct tsens_plat_data data_ipq9650 = {
+	.num_sensors	= 11,
+	.ops		= &ops_ipq5332,
+	.hw_ids		= (unsigned int []){5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15},
+	.feat		= &ipq5332_feat,
+	.fields		= tsens_v2_regfields,
+};
+
 /* Kept around for backward compatibility with old msm8996.dtsi */
 struct tsens_plat_data data_8996 = {
 	.num_sensors	= 13,
diff --git a/drivers/thermal/qcom/tsens.c b/drivers/thermal/qcom/tsens.c
index c0c7ecdb9c2b..1d7c2d85c839 100644
--- a/drivers/thermal/qcom/tsens.c
+++ b/drivers/thermal/qcom/tsens.c
@@ -1125,6 +1125,9 @@ static const struct of_device_id tsens_table[] = {
 	}, {
 		.compatible = "qcom,ipq8074-tsens",
 		.data = &data_ipq8074,
+	}, {
+		.compatible = "qcom,ipq9650-tsens",
+		.data = &data_ipq9650,
 	}, {
 		.compatible = "qcom,mdm9607-tsens",
 		.data = &data_9607,
diff --git a/drivers/thermal/qcom/tsens.h b/drivers/thermal/qcom/tsens.h
index 2a7afa4c899b..d9d50d32c962 100644
--- a/drivers/thermal/qcom/tsens.h
+++ b/drivers/thermal/qcom/tsens.h
@@ -657,6 +657,6 @@ extern const struct tsens_plat_data data_ipq5018;
 
 /* TSENS v2 targets */
 extern struct tsens_plat_data data_8996, data_ipq8074, data_tsens_v2;
-extern const struct tsens_plat_data data_ipq5332, data_ipq5424;
+extern const struct tsens_plat_data data_ipq5332, data_ipq5424, data_ipq9650;
 
 #endif /* __QCOM_TSENS_H__ */

-- 
2.34.1


