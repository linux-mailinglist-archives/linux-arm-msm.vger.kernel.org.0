Return-Path: <linux-arm-msm+bounces-75859-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C63CBB5AAD
	for <lists+linux-arm-msm@lfdr.de>; Fri, 03 Oct 2025 02:21:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 3D7C74E7A03
	for <lists+linux-arm-msm@lfdr.de>; Fri,  3 Oct 2025 00:21:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 877A9139579;
	Fri,  3 Oct 2025 00:20:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Dng5Vfrz"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FBC9347C7
	for <linux-arm-msm@vger.kernel.org>; Fri,  3 Oct 2025 00:20:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759450855; cv=none; b=Q2TQtgcEu4oA+VmPP4A4axP8YhdoxQiTvV+cGiU91UXVW0L5f4Lg8UB8a4643hNc+JpTI+kr7YxpeRqHSic6PwI4TsT95Ib+c8009tzRv4JIeoqvfo3nrOYKyovpnR+zOsr+Ggpw9X7EzJSRncQx7+e7ADkXuiU+Gi4NTh0+yiM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759450855; c=relaxed/simple;
	bh=A52ROh/Md8E/l7pDVKt3JwMJSU6DehcWufqvmQgZXsc=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=UvWQp7+YvapdiCBcP4Ic4H0f016ik4tblNkywQ4jz+dYaT8Sm/he78zKmbgpIQ5C+jh7I60l4LqtyInI33sf8dkCEklo8PLM/0pru6CoOJZwiGsbJlNZ4RpEcJQE9LeGR9p0imMPZRPNm6HMSnviGdrv2BXUGZfr3k7L1NqPmv0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Dng5Vfrz; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 592LlAGj001185
	for <linux-arm-msm@vger.kernel.org>; Fri, 3 Oct 2025 00:20:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=uBL+fRZoVJd
	0EnYHl7fL+1Rjn/9hbw2Gf19pU1BpfeA=; b=Dng5Vfrz494jZHTgR8f/P3BkXuk
	V6z0Jk+XTkJLBboZyRBFVyu+/RfRHFt7hT3hXLYRQ3xE9s8eUJ2gXuheRmu7fIz1
	p7FtZtpFdlmeIRGBBlQj4avXVIuqz5fKIlQ6thdmnlQQGRRYTYL41VrLjo7eVNmb
	Y8EyN0C5Zx1k42oo8dSzVYHFD+EpNBxOe0RdoqNmz4gCceKNMmiggvbmqfVRB8vQ
	7MM1e2JVz0eG0uYqUti8lXDpqs04lLr54ogep9zow3/2xyC9fyWsOv527J/x0oY3
	fAIU4GGg5LRHacKraNByNLER8LFS/Z+r6XL9EjZ9Y24zOwBRDSq++efEh8w==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49e6x61gq1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 03 Oct 2025 00:20:48 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-77f5e6a324fso2740111b3a.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 02 Oct 2025 17:20:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759450848; x=1760055648;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uBL+fRZoVJd0EnYHl7fL+1Rjn/9hbw2Gf19pU1BpfeA=;
        b=rsK7uCtdA2Dn05lNvhyhJKL9kmckeBDPimA/OiR3adcDW6kHe9lV08AstfQSr08ZfP
         xlsWs4B3tt5WxUbJu3oYaXgMdHbvAj9kqQws/eaHYXFfeBeUU/yqdeQ+lvYQkqo1V+qO
         aFmZ2Emikfv+FstxHk+kaQC79/hI9c6K3WpRLxL3M2/C9lGCdBjX48nmwHoFr0+PgiM7
         G2AXs2UzJwVRfdsO48c++bgTZRQqrxBMl7K0vK7xVE/xIQtOGrKZY2HBQTbXyq9S0FF6
         ybWlRYxcae+AoEuJjQRs1xnjkdhrBRF9sXL7LmgD6LZJJUWd4JEzbLyb/opUYywdIHKv
         Di6g==
X-Forwarded-Encrypted: i=1; AJvYcCUDZqGSPey9jX8Q4SD76n0tYRAxZszP/37py+Botgwq8IszGQvGq2PvYig46hpjxuVKD0xKDLJPpDIWZYhv@vger.kernel.org
X-Gm-Message-State: AOJu0YxCl7yxI3RCHzzI56mZksOSW1FtbxQE91i/Iz8iLGcfIjCJxTLQ
	VOUVsRByKvDqSqNlMSyfW2wGR+RUx+buQtU+QKdaAeYFc8rKrGHsKIPRgQaPkZzKZmVu0I5LYjn
	ySxj1gcqUA7Q3rLQ4kdV8Ct5RaxdLHyDzxCwCF94NP3sYnaiIHQhyJlhZIospQFvG7WZt
X-Gm-Gg: ASbGncv53ZEh80CusFWpxQumNoofhU1HOOmjaLgFipbqGMeuT6q+zR2bShPDSErw2Ls
	rZqqPgjw9Mo6VRlfzshWVw7gkmbq7LFlDNi1kJeGgFRkjnGacvebVOuNNPXZS9sjg6Teg8CfI+P
	rD0TTOniU63Mby5ekchYcP8bAb4/EBrChcGbKro4tZXL3r8t2mYF1p1wubBxF0NKUTAALxpqZQS
	RpXrfxIQ1zijvxVb4+PijcXI8X/K76PLOTrnB7RbvWrH9rgmadX0t8rN3eiTF/NiK6XQ3ld8gMf
	OazRi5bP/JU+uc29XwvrSTwhxlqGLN/JgOCfogYscJG6/uMayMZY9+hp3B+dx/F3mTyzH1Eisqa
	gzFnLdK0/8l6p/85VwjEUxikeSgNUXoVU
X-Received: by 2002:a05:6a00:3991:b0:781:2290:e7e7 with SMTP id d2e1a72fcca58-78c98cad84bmr1743825b3a.18.1759450847699;
        Thu, 02 Oct 2025 17:20:47 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFzrJ1TUQnXO5ZzMDLySuam5se1Et+TpMerKKnyr5XaAUqjom5zSs4tikKzGJr9VdCSccGBpA==
X-Received: by 2002:a05:6a00:3991:b0:781:2290:e7e7 with SMTP id d2e1a72fcca58-78c98cad84bmr1743803b3a.18.1759450847258;
        Thu, 02 Oct 2025 17:20:47 -0700 (PDT)
Received: from hu-amelende-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-78b01f9a3f1sm3128632b3a.12.2025.10.02.17.20.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Oct 2025 17:20:46 -0700 (PDT)
From: Anjelique Melendez <anjelique.melendez@oss.qualcomm.com>
To: heikki.krogerus@linux.intel.com, gregkh@linuxfoundation.org
Cc: lumag@kernel.org, neil.armstrong@linaro.org, johan+linaro@kernel.org,
        quic_bjorande@quicinc.com, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
Subject: [PATCH v5 1/2] usb: typec: ucsi_glink: Update request/response buffers to be packed
Date: Thu,  2 Oct 2025 17:20:43 -0700
Message-Id: <20251003002044.2944497-2-anjelique.melendez@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251003002044.2944497-1-anjelique.melendez@oss.qualcomm.com>
References: <20251003002044.2944497-1-anjelique.melendez@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: nyF3PZWi6pLHwA8xLY4yvQXAeIQ5ZYlW
X-Proofpoint-ORIG-GUID: nyF3PZWi6pLHwA8xLY4yvQXAeIQ5ZYlW
X-Authority-Analysis: v=2.4 cv=ZtPg6t7G c=1 sm=1 tr=0 ts=68df16e1 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=x6icFKpwvdMA:10 a=EUspDBNiAAAA:8 a=QyXUC8HyAAAA:8 a=OI1EoHIFZYFGuZb9aTAA:9
 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTI3MDAxOCBTYWx0ZWRfX7txYOgtwlzN6
 BwTxXQ2ftJWuooKEaSr/fr6JS46nBebDniMrNGmOsNtJGb+Tk/jeJ9KVqF/kNCeIG9eF7ilcuVJ
 3v3BAGy8JvXmkV8oTBmrmO0hsx9SUT3k6fylfGoB+VdhI3SrCSG65QQ+9TZc3iMTRU2g1Y7ge6F
 /CNeKPhqvsyoFDfxCm734wE1cT2cS5wQlGtzfQ1Y7gJnP6Oy5yfYBlb6qdTKB0w+Rkm29jv/rBQ
 8a+MW6lfM7ogr+zC+wLXn0elby8leXONZLKWi8V4LLjVAwCkIGhuyAQ/HjlbACzCUcgQ2BMsNWc
 OcRlDPkSaIYnsO60WIF//oBDD3+Gy2F26pRP4EZB4OVTlztTXtqdXDaWw5Nk2Kxi7LbZg1TyNFn
 A870PCzPTn3sUdkO/+rVW9Ut24akoA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-02_09,2025-10-02_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 priorityscore=1501 malwarescore=0 bulkscore=0
 suspectscore=0 clxscore=1015 lowpriorityscore=0 adultscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2509150000 definitions=main-2509270018

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


