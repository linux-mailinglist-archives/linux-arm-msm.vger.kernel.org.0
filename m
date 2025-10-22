Return-Path: <linux-arm-msm+bounces-78240-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AA52CBF9820
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Oct 2025 02:46:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6400F426BCF
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Oct 2025 00:46:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8CCEE1DE4C9;
	Wed, 22 Oct 2025 00:46:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="e7pNnJMe"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2CD586340
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Oct 2025 00:46:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761093962; cv=none; b=J9/qwww6k0WqzAxKBGPcPRLRN7gSf6Zi1gJ/Svv0b5nOfL/HNd9a7aqBer390NZ0mad17P1b0CuVJ9a5AqRrynuE0L3LguORQIejhVJ53qoueeA5wbpQbTWySDFq0pBgJHLxFw7giNsk028UasTGklugmgNGkTgk9O8WKPqaV+8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761093962; c=relaxed/simple;
	bh=A52ROh/Md8E/l7pDVKt3JwMJSU6DehcWufqvmQgZXsc=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=ir/qzJuahDmoo9aqC/PMw6tsEZYSV55LHoUeEbNscKkVTw/dVG3oLd8hCvKOFHDIPPOztBoUXpAavhXMA0qZA5oHKJoD1fuF26sgKHIxjACZ3AKAPViFBLXprOGTjf/OppvxbZbwtOfebHW0a1to5r5iRW4AHbQlXB6MqIbsQjU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=e7pNnJMe; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59LFEYOi026895
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Oct 2025 00:46:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=uBL+fRZoVJd
	0EnYHl7fL+1Rjn/9hbw2Gf19pU1BpfeA=; b=e7pNnJMekYEGtkXQbHG8yk4j2OE
	h+Osd2AsyklSBeAj8uCAiHKEnqNauHA+jQByDH0WcnoLATdtHBdqZq5TaB4QcYeG
	cl2VLu+6ZLbhYoSUcEIdRNq7WgIHv+007Y/ZGYRnIlSZ5JJm4eIZq2omiCAhVmbI
	L0GynrSdApOPWuRWHFmhs+112wmu+rlYjX/wluDYm5KW133YHhqYUMcSKosgr+V9
	kh83px9RK8JeF4RdD7hTyzpakwlQGq5CGGj+N3cwSpN5CLQQBITeyt59Ccgl4PxV
	JPANh07pkRADMHmleZDlmbIXDaVZeQfqEk8IrW5UQUDlfzFgtlLyD/nP7Nw==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49v08pjvxv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Oct 2025 00:45:59 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-290da17197eso80352205ad.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 21 Oct 2025 17:45:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761093958; x=1761698758;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uBL+fRZoVJd0EnYHl7fL+1Rjn/9hbw2Gf19pU1BpfeA=;
        b=F/gSUGecFLrgmUkpx9R7DGr3/e0hObeSmcBbVfp9VU3MHMjDxODrDiFHntHjGsxQ5N
         IR3ot0/oUPjJSQCnZj/kcedhe3W6BTJ1WKyxoR6hwF7tE3pdjuN86yNdeBQ7sr40OBMj
         fC57do/p4BxnDghBLMGNWhHyOdCjVbgf6dzECfWLqzWOkEDYc7wI6vv8e4sO3XiQTlSX
         bQnzGhH7DxdPgksUiTYh0T6jtnY+HFp43UfPueVluhUW4cjvS9DTpVzoFXUxwv1IM4TM
         5jL9KekRZhiqeM08ScA5aN41frHqj6Z6qT/CMD4oxsM8E/XfaRSEn51BW6xV0WplHBWh
         h4Kg==
X-Forwarded-Encrypted: i=1; AJvYcCX2Uu+VwnP8B63GZYPNqsb9+0mCtfCdbw7Up8Rh6y0xy1JaCqBZ3+Q05dB5HTUS8SBLTlkg8jc2a0b8qEkL@vger.kernel.org
X-Gm-Message-State: AOJu0Ywp2fA5NvXo+BvOJWhmKGVqsFWP2SwDDniXFijtGcMyzk0kKbAg
	XXtLIBswpnzVKq3g0DEptR9K5R3OPehA5hCRaGSPzlZqdZoEdz8dwXjVFp+TIM752zD40l5Y4U1
	J+LBdMISCchkcOSahxTZ9NM1SEkIkxl8X68fd7pJN/7bd/7tJFqk/ksYE1CjwQ8R4dLMQ
X-Gm-Gg: ASbGncvSwyb+PBIJ+oej9kW0vnzl02ivlDqU+F/GvOK+M6GqLduXaAmoTLEW9QaSm8p
	eANUg1+OJrCbysdhpjJTlTecQq2VKhApqrcwAFjuQBMp+cYrfRexBTOXTspN8hWwr/seZBcyHur
	zEQ8fseq4t8qcVlb8Q8Klb2K0FTTYboiPsDj3BXP0sCUHOAKRojJ2J//e75/lKcSP564FOnchPE
	IYvvKoAkfEFg0uBeoU/JcuPn4+goJvmth5LrcDmfwPazIbiAl3kpN9jDSFnO4DdCbo5TkvfuiJS
	YQ2iUnxtK+/lj4lUVDbOxCPUJAGprzuvVTeUoXLxgV5hgSIxBcRvNafpafg7pgP9MfiEgwwwXUy
	EWLcnISg4hqqUO+RvZFaUDnu2qctZR4/mRYfFfomZ0eHEi8BWYpSSXrhJKPCecQ==
X-Received: by 2002:a17:903:15ce:b0:273:ab5f:a507 with SMTP id d9443c01a7336-290c9cd9f34mr223087845ad.21.1761093958471;
        Tue, 21 Oct 2025 17:45:58 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFecZ5N9CY9Li0/dfJQAVy9O0/8BZE2w5QKSyPywvMXAXjd7XtWluXcbSuBxe1gDtRVplB+TA==
X-Received: by 2002:a17:903:15ce:b0:273:ab5f:a507 with SMTP id d9443c01a7336-290c9cd9f34mr223087655ad.21.1761093958016;
        Tue, 21 Oct 2025 17:45:58 -0700 (PDT)
Received: from hu-amelende-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29246ebcf67sm121913045ad.15.2025.10.21.17.45.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Oct 2025 17:45:57 -0700 (PDT)
From: Anjelique Melendez <anjelique.melendez@oss.qualcomm.com>
To: heikki.krogerus@linux.intel.com, gregkh@linuxfoundation.org
Cc: lumag@kernel.org, neil.armstrong@linaro.org, johan+linaro@kernel.org,
        quic_bjorande@quicinc.com, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
Subject: [PATCH v6 1/2] usb: typec: ucsi_glink: Update request/response buffers to be packed
Date: Tue, 21 Oct 2025 17:45:53 -0700
Message-Id: <20251022004554.1956729-2-anjelique.melendez@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251022004554.1956729-1-anjelique.melendez@oss.qualcomm.com>
References: <20251022004554.1956729-1-anjelique.melendez@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDE4MDAwMCBTYWx0ZWRfX6DfJ8hktQZWC
 gs5fBl7EmSfzDQolwDZ9Uc/PWEDbYfYMXMBuiNBARd0SbWeS4gzHpyBU4rRB7+mHw5lk0G5ghJO
 gM3P4jjPSnUg/9W/lq0r7wGZl2v+NV2byW+YTb1V0Yc+g7Ml8Hp+/vXNh4Puam68WGTaeBbLV+Y
 Aqb9SPqRlU3X1ASwSaaypfrYaSTLosUUpQhygeB3mElhH1x8LHwLyvHToJjMB18ZniuqN18b4x2
 DLQrJAkodX1CwxK9IZItO/w9SqcnsyCf9WfkNCCn92rRVFvV05YUB1YoXiAgA7gai5x7Q1sjyMO
 H2StyGceiNDth/uarb+lyrY7PmCKD6D+8B9d4QNM/L5nRyRgquQDaV7kVofK18fBWq1gkzB/pmG
 bnv50KxU8dJ4sRcwY8mHu55+59V2NA==
X-Proofpoint-GUID: f_yDjdHq_LCvDn3CVnDXZApgV-ogn5sM
X-Authority-Analysis: v=2.4 cv=Up1u9uwB c=1 sm=1 tr=0 ts=68f82947 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=QyXUC8HyAAAA:8
 a=OI1EoHIFZYFGuZb9aTAA:9 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-ORIG-GUID: f_yDjdHq_LCvDn3CVnDXZApgV-ogn5sM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-21_03,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 suspectscore=0 malwarescore=0 clxscore=1015
 impostorscore=0 bulkscore=0 priorityscore=1501 spamscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510180000

Update the ucsi request/response buffers to be packed to ensure there
are no "holes" in memory while we read/write these structs.

Signed-off-by: Anjelique Melendez <anjelique.melendez@oss.qualcomm.com>
Reviewed-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
---
 drivers/usb/typec/ucsi/ucsi_glink.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/usb/typec/ucsi/ucsi_glink.c b/drivers/usb/typec/ucsi/ucsi_glink.c
index 8af79101a2fc..1f9f0d942c1a 100644
--- a/drivers/usb/typec/ucsi/ucsi_glink.c
+++ b/drivers/usb/typec/ucsi/ucsi_glink.c
@@ -30,24 +30,24 @@ struct ucsi_read_buf_req_msg {
 	struct pmic_glink_hdr   hdr;
 };
 
-struct ucsi_read_buf_resp_msg {
+struct __packed ucsi_read_buf_resp_msg {
 	struct pmic_glink_hdr   hdr;
 	u8                      buf[UCSI_BUF_SIZE];
 	u32                     ret_code;
 };
 
-struct ucsi_write_buf_req_msg {
+struct __packed ucsi_write_buf_req_msg {
 	struct pmic_glink_hdr   hdr;
 	u8                      buf[UCSI_BUF_SIZE];
 	u32                     reserved;
 };
 
-struct ucsi_write_buf_resp_msg {
+struct __packed ucsi_write_buf_resp_msg {
 	struct pmic_glink_hdr   hdr;
 	u32                     ret_code;
 };
 
-struct ucsi_notify_ind_msg {
+struct __packed ucsi_notify_ind_msg {
 	struct pmic_glink_hdr   hdr;
 	u32                     notification;
 	u32                     receiver;
-- 
2.34.1


