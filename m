Return-Path: <linux-arm-msm+bounces-71043-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id DD989B38AB5
	for <lists+linux-arm-msm@lfdr.de>; Wed, 27 Aug 2025 22:13:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A650517F4D0
	for <lists+linux-arm-msm@lfdr.de>; Wed, 27 Aug 2025 20:13:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0C7D62F0681;
	Wed, 27 Aug 2025 20:12:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Fs4jMqr5"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C2932EA174
	for <linux-arm-msm@vger.kernel.org>; Wed, 27 Aug 2025 20:12:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756325568; cv=none; b=b296YkE994AQER6tEndl+3zNQaJzLc34ZB75VSiVRuHlB8E+3+O7Axs/39VFVezJYLvBAVJLQcjJQ+sFk0FvQtThT+6fboWLmMw9b1vHJMUolg7Czq6DUassOpTm3JRA2KUKbGypTrAobSdEu2CMwCEo75AgJcYdaQZtObOv5pc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756325568; c=relaxed/simple;
	bh=meLDgphMIzrKjvme/9NyKwkff6sfs1AHm861URMwqb4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=KL7ZGPlrVWUaZQ1+H658XuW/LlxlFH60x3TDzMnitl0qt7ePvEZrCnPkgbXJjmlYmekNoAqfhpSqwtfQOsJMkq07YMe+g+lBtdcUFmjvf6EH+fkToxxgvgsDm2/lWERqz3p4xlKeuPYWUCbGQPGBsnV7Tx6BtKdqgpqx44MK0FE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Fs4jMqr5; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57RGIXf4019411
	for <linux-arm-msm@vger.kernel.org>; Wed, 27 Aug 2025 20:12:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=eCTGEcbB5k6
	fBhyVH2N2aNB10W+jMPYCn5g3eW0CwJw=; b=Fs4jMqr5JCTbDd4qFcRfY/09Ofk
	eKJDb797kgpfG9loG4XpEYoqSI6XHNEfxufqT3Bwt0A2dwq1iUYlYIGiRZ7WXhxu
	PUBz0Cl0xkFJDyt6Jthf80vg/OrEgLmXGfohIUzaVyOT74yKtLrhp4BcvZXlKTOM
	vUWi9A/Njoa3QCXK/h61rrOJrTEgif7XFU1vjd3ktTgayO/R2IpfqSItgTlq/8uK
	bJ8mTgMGSvjBdvq21PF+0bT7UEejyb4AzVfFdIOLT7FHZ9pM0qr/KLp9SmsJm4lB
	dNAlV5UUiWkZlg/uMkO+5RRVLFUajDjG1LD26096NxVEAbl1xIevbf+kSIg==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48q5xfnthm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 27 Aug 2025 20:12:46 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-b47174c8fd2so368987a12.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 27 Aug 2025 13:12:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756325565; x=1756930365;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eCTGEcbB5k6fBhyVH2N2aNB10W+jMPYCn5g3eW0CwJw=;
        b=WLTFYIogl9GXzgj9z1qpJetRNYoycRa4ZA5AKJpVCvb9a/AuG+mYkJFij7hV9P48k2
         pBGM3u4ry4RezzXRHFnJIB6GNh5nK2siLijzP/AxY0RF6jk6sjukCCvWV/VrXO+h5PgI
         tePNRVHbKq7BqLNfPDPURsCvCFMdBEDahd245uEtIvA9R8cVPvoDjNt/3iNH4MH3niyN
         50ioIbnclcbHM58BAwxr0dh+AcgIVWXFPOFmKtVcAWqII073AJvhzQVCAPFUjrZyDO9h
         fAYU9DEKFiAekSA8AHkwrpz0rpqrVbzC9rXEmQQmR3lTcclpfVlOQNfyO9VzXwzKK2b7
         lrEw==
X-Forwarded-Encrypted: i=1; AJvYcCVsqszUnHTbLPx/Y6v+JWo75zT6nHj7fHixjWozTHmbxnB53+WtDyFdqti+LN3MoRY4BU9AS//k3OREUppq@vger.kernel.org
X-Gm-Message-State: AOJu0YwcMw81hOcMLJg8ode2oVwRdM/fKGGSdMc706de6n716fUiJOjW
	ZlFNf4bOFIcQlCP8aLQrDy5Po90vEOOmSCDOUWtFAzZISUY7D3crWzCBG841Pg0L2uL4d3TNr1s
	cLl86scmuizKG9lFSYlU7g6NLkR47+/5cPJhXwW+fG4xt6EKdXM+2DYC/vIZ/mI/Beja5
X-Gm-Gg: ASbGncu7JcoXsXSmOasvwxjouMOCQvXOAsckyWsP7/TTGKTMT64XOZpObfsFiXzauN4
	u2TKc/fK/AEHJUHbeqyckW1Y9P9fcN92In/nq5lI6++45x3nx1eIKKDVquFXvyjZOMxcMWzmoc5
	nS5NSZNWNP/ccndA83T03fDxddRy/rd789navP95sUtd06YvPGJs1B4y8GryCRZKMY4Fe2tAxOv
	jzG+BSjfPvQOEMtvfsfDeSCWvRx7IpT0uljQBvz+QVWxZ7BlIPD8NlkVDhNi7UqdnSBj73bAp0W
	OrvUS4WqKWWsIwKVDQrLe/W4AO4E97LQRN8NRavrF3DyG934yS9YXBI91jP9fiYKnO1IOtC+Gxp
	tJN6jQ+MJAvu0nM/dKbaftIL2dls=
X-Received: by 2002:a05:6a20:9188:b0:215:d565:3026 with SMTP id adf61e73a8af0-24340b5ada1mr27366896637.20.1756325565209;
        Wed, 27 Aug 2025 13:12:45 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFIj8L+nwLix1KG/6QnjHpZZhIafsh1DBdgu75+84yKYOIB7X2r8rCg6cN0Ay9YbseD9uexTw==
X-Received: by 2002:a05:6a20:9188:b0:215:d565:3026 with SMTP id adf61e73a8af0-24340b5ada1mr27366868637.20.1756325564771;
        Wed, 27 Aug 2025 13:12:44 -0700 (PDT)
Received: from hu-amelende-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b49cbbbaffdsm12185234a12.51.2025.08.27.13.12.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Aug 2025 13:12:43 -0700 (PDT)
From: Anjelique Melendez <anjelique.melendez@oss.qualcomm.com>
To: heikki.krogerus@linux.intel.com, gregkh@linuxfoundation.org
Cc: lumag@kernel.org, neil.armstrong@linaro.org, johan+linaro@kernel.org,
        quic_bjorande@quicinc.com, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
Subject: [PATCH v3 1/2] usb: typec: ucsi_glink: Update request/response buffers to be packed
Date: Wed, 27 Aug 2025 13:12:40 -0700
Message-Id: <20250827201241.3111857-2-anjelique.melendez@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250827201241.3111857-1-anjelique.melendez@oss.qualcomm.com>
References: <20250827201241.3111857-1-anjelique.melendez@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIzMDAzMyBTYWx0ZWRfXyb7YmQ7t5RGn
 scqsDbP4gw484XwdeKsPl3h9h7lqyVg91tflXqMOP++LJPSRJWo/mkKLYCjPXlQzlmuYo/u2Uan
 5omlKeo6/KuyrY9SwBGFp2gjt5f8yy3XXe/CS7d7HY9QY9eauqyowByyuyf/fUn9yyGXNOPPBE/
 nlAwTCvgiSShR9mbeHxVtSE3LLYyVi6ITdJ/CMh499Z6t8hkOvDl/HEFYE2fRQa+nsnG4sH8sH3
 bdifz7/kIaQO5t+bQik6my3XEe52tI8a2GWvBFS4ITKlcDePnYWlxb0YGDN6y1uqhyoxV2F/nyL
 9BEw1iX4pOELp+JORcGD5xbdM+VEFJDWMGq+0CohbYMqetNw7JwXchJ1Z8K1W/twiD5Q0bN59CV
 86olndNU
X-Proofpoint-GUID: jJ7sIMZCT78wh-Ssjbhv_1kb68sTMm87
X-Authority-Analysis: v=2.4 cv=MutS63ae c=1 sm=1 tr=0 ts=68af66be cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=OI1EoHIFZYFGuZb9aTAA:9
 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-ORIG-GUID: jJ7sIMZCT78wh-Ssjbhv_1kb68sTMm87
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-27_04,2025-08-26_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 adultscore=0 spamscore=0 malwarescore=0
 suspectscore=0 clxscore=1015 bulkscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508230033

Update the ucsi request/response buffers to be packed to ensure there
are no "holes" in memory while we read/write these structs.

Signed-off-by: Anjelique Melendez <anjelique.melendez@oss.qualcomm.com>
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


