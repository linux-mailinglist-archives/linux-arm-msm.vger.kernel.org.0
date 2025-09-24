Return-Path: <linux-arm-msm+bounces-74734-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FE62B9C8CB
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Sep 2025 01:26:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 3C33B4E335D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Sep 2025 23:26:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 50E172BD580;
	Wed, 24 Sep 2025 23:26:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="E9hvidxu"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C81728488A
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Sep 2025 23:26:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758756398; cv=none; b=ts/UYB2sBA2xZIyxGy+QGGcvwqa8LyCLWHmcucxYvxq4zrY7951iGXLDfHnMo4n2VV89933FlxPZE4zwfB1NzD2tkI8n10Ujj0HC+x2FQhL+TzOqWfp6OHp1SJzPAxt6Qk92jgs6dXWBJEfbT2iXM+4j+jRy+QJnqQKwQTahnqw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758756398; c=relaxed/simple;
	bh=A52ROh/Md8E/l7pDVKt3JwMJSU6DehcWufqvmQgZXsc=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=mGpxRGgBLSFzjlKZTbW13ZT25bA4xndm6t6Q4hwC891QPudo1Ds3pqVVr+YrleC+Q7NZznFjqlSLWZRopLibOYrSba4GjLBfc4owPSr3jzQX5UB9uQ/J9n5uCUJFERtSpVgNJpVjqtTVHyPWCcP9OIMTpj9VKF0ezXmtXMzNt6A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=E9hvidxu; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58OCnkNl018615
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Sep 2025 23:26:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=uBL+fRZoVJd
	0EnYHl7fL+1Rjn/9hbw2Gf19pU1BpfeA=; b=E9hvidxu+rY1CsCN45h/7J09W3v
	y4ByyRj548wRNOsiAV/E9I/ttJ+IWBNX8WkEk5GMcIq+odj2U6Z5Qd+EjqkRQI09
	0gRdV2loGW5JxcKVhplCgu0Qs2PNY7DA3fFuFQXxXsORl7c61T4ON3UNOQd7qY1/
	WQ0ok8eLpFuEJYsbX/BdKItQBgFzl6YXzIpJTDjpRf01QFtVnxwA0cNmPnGthWTD
	adW1LnR/GiVlVNEai+JRlHbAqCyamxobgBIwAvJ8dy2ZCvP+57jbkSx+coqlUVfk
	eQTvSCMm8PdF56BmKks1t6Vj0um3w82beREm2qrXmI88E8o6YOyokYt1Yyw==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49bhvjyc13-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Sep 2025 23:26:35 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-26e4fcc744dso2305725ad.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 24 Sep 2025 16:26:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758756395; x=1759361195;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uBL+fRZoVJd0EnYHl7fL+1Rjn/9hbw2Gf19pU1BpfeA=;
        b=Z0WG6lPBke1ZPHIWO0o69Gj1wnmVe7E17I/1eUuBZREV3z3+WYRA236m1BdhpvoK8I
         lw1ijv0hO+4d6TWRfjk8RVqF6FdymsNWZM3TTJ3+BdHDkZbTaZUMlDaRFNW199PWOh7X
         IJ0PDuon82DCNQU0KDMxfevFQFTFU67gAgCncHiuR1dZnYq7FNzm0qXkUgHPQVHOAHWD
         H5BoMBwMpS6hRHlqGrCghCku0J5fMVURxDkLWdVLoehAXwQvcipysAa5KUZDw7aO6shG
         I97EMa/bx9U1yWni4+sjwcevNBlSQk7jeimoIWwrJtegw2Ms9HIfQ+QsFdELqLs/C1r0
         eT5Q==
X-Forwarded-Encrypted: i=1; AJvYcCXQwC84oR6eEBN7CzYqM7iMmdIJhR6JZdtctRkR0wDFufSnStxqaHKcRHFQ7Fb4kSs3Hn4/9ZOEtfuci7n4@vger.kernel.org
X-Gm-Message-State: AOJu0Yx+86Dn0hlT/gjv2xYBDDdu45xX0A5mDFEg8tPGrVftgbyzwrT8
	IoQaHBSt4hr8dI992DULM7ntQBRfIPDIqjDOr6rjaVRUmTRV2BljSC0FiW08LJttBjznv011nSd
	+KZC1e1VAV+bIgiEYlRElj7Z28ud6DVSaGMyQzKNV0qEEili9/bzvPPpSITKJrPgQceCV
X-Gm-Gg: ASbGncuCFk8it5+tAa8dt+8lkBuU1eIjqtrWbre01VdGXaVAfIxiJc4ftrUUU6Q3duh
	N7PNQeaOnX1fucmSrftD8WMuhw9QcTVdACz8ZqTmC2kAFd/g20ipYPrckB1HX52KsdcxhkWpK9y
	VrSel8B8Ed0F3lM1ZiSaNEiaWYuNpoPbBl18sttUQPrFmIw+aki7juzk/5GXvOzRo7J5NlkmaoP
	qD2q5yier5neL/uzWkgR4XJg1vVPijcC91irSnSzgkunsngcb8tGSHeFFEPOf/PPiG6c9yFGw6s
	hONXEMhRzCLLtKGXuhbwLDcKsZQU4cmwE591JUbfHcLO3SlDIQdfqHmt0DFC4qd7kGwJQGnGGhX
	31LpDBZcdK7j+45dVxs/V9pe3psM=
X-Received: by 2002:a17:902:e74b:b0:24c:caab:dfd2 with SMTP id d9443c01a7336-27ed4a7aef4mr14903315ad.61.1758756394978;
        Wed, 24 Sep 2025 16:26:34 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGJEScj3N7017e1VxtcyNk4O5EUgwv1v9frS+qgd/Wrq1/qSDc6Y7tgNA0T1wmE6TpBQUbcGA==
X-Received: by 2002:a17:902:e74b:b0:24c:caab:dfd2 with SMTP id d9443c01a7336-27ed4a7aef4mr14903135ad.61.1758756394583;
        Wed, 24 Sep 2025 16:26:34 -0700 (PDT)
Received: from hu-amelende-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-27ed68821ebsm4005735ad.84.2025.09.24.16.26.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Sep 2025 16:26:34 -0700 (PDT)
From: Anjelique Melendez <anjelique.melendez@oss.qualcomm.com>
To: heikki.krogerus@linux.intel.com, gregkh@linuxfoundation.org
Cc: lumag@kernel.org, neil.armstrong@linaro.org, johan+linaro@kernel.org,
        quic_bjorande@quicinc.com, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
Subject: [PATCH v4 1/2] usb: typec: ucsi_glink: Update request/response buffers to be packed
Date: Wed, 24 Sep 2025 16:26:30 -0700
Message-Id: <20250924232631.644234-2-anjelique.melendez@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250924232631.644234-1-anjelique.melendez@oss.qualcomm.com>
References: <20250924232631.644234-1-anjelique.melendez@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: 7075W3VGELjMiHnhYb3wYSng0O7WthYU
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTIzMDAxMSBTYWx0ZWRfX/Urq5uSSd47h
 bTpMKqkYObRQh7I0lErNo8mm2dAqT6+RJF4Tw35juyZ5QJ3rbanePa8RWbiIz37uJM/rdDfKs6k
 m6sXBv9G+dWxIN1m4yTRWPWD6J0jAXJpSUmlY0w7N86SUEqohu9lebVdqbFuKDFJi9m5/WBcDom
 Lmk0BoMIKHHFUoexyLTyjNa9DrhK1Q2WZyco8grJ2KsxMCA6VJDO3mkUcNxRPWSfLsJVltuwTDg
 5pFvKV4rQhS47iF2/AWu16XJmfqMmlmqQTmJRhsNlcyYU+0a/3XCoATZV2JXYaxI1MZHgssSvUt
 Sg3WYMnT3cxHLU6cMAAQGw3FKYcHt7TVInCcKTA3WzNneL60b4yxEUGTQ4yirlXnj1+7+AY6QSK
 VYHIaeez
X-Proofpoint-GUID: 7075W3VGELjMiHnhYb3wYSng0O7WthYU
X-Authority-Analysis: v=2.4 cv=Csq/cm4D c=1 sm=1 tr=0 ts=68d47e2b cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=QyXUC8HyAAAA:8 a=OI1EoHIFZYFGuZb9aTAA:9
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-24_07,2025-09-24_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 adultscore=0 impostorscore=0 phishscore=0
 clxscore=1015 spamscore=0 priorityscore=1501 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509230011

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


