Return-Path: <linux-arm-msm+bounces-64731-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id C035EB033E5
	for <lists+linux-arm-msm@lfdr.de>; Mon, 14 Jul 2025 02:51:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E27B11899CD5
	for <lists+linux-arm-msm@lfdr.de>; Mon, 14 Jul 2025 00:51:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C34C21DE889;
	Mon, 14 Jul 2025 00:50:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="FiBFiTjo"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EE6B1D63F0
	for <linux-arm-msm@vger.kernel.org>; Mon, 14 Jul 2025 00:50:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752454229; cv=none; b=moZeOjJBR2lEvuLie4lUgFfsW406K+zIe0DB/otRIlA750Ncksv5ixapjbVMx+a2JKNVBOW2ZlsjxMSi5dCGShQbfI0v+cE5zHkqlHOs4A/da8G0I0E6lfdoPFeDTbHxLzOpGM9IAUHcrBHvWKFTACOTKIzl5JU6GzhySLKM2QI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752454229; c=relaxed/simple;
	bh=nhZDUeOuEBpe4gtZaFsCxHLG2a7kWizgihFMSQLXv+o=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=sosDX9Al8HFcHazvuMte7iqRVIE1dM/V4OhieI9hm7mWYIONGnOeTQhRBmLM1vBJIQDoIwOyRvI2lCtgfF+cAOG3S0gDY2aGAnlo4I7bT9+pbcqCTIhowLGUc11qKZbHLtKmq4XgbgPP1Qp8N5z02k/H+jLmfL1Wz6qB7Ybh6qw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FiBFiTjo; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56DJRk8x007564
	for <linux-arm-msm@vger.kernel.org>; Mon, 14 Jul 2025 00:50:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	pvcGflOb4oHfrwRpsgfYu+5cxv3Vb3K+8uRpTdLXgHU=; b=FiBFiTjoRgGWwliv
	A6NRpzvOrEY2F2d1GiOU+gG2D98jldeZyZNBG22V6PrZlHFWpEl/xLQCPSRcULzO
	q0cJQxFLngWl3AwSZMCPnGNa/dyB2lt71XzCbGo/Kk4XG7jH/bHUFmn6ikqJBcsV
	y9j/g6P1dkTPEDY0Uxig5mgd2UjorcNhxy+w+Yz+A92pb4IKFcmPc4b4dVhAPcMa
	RhCmpNIj3t7qJm2/gAZtqZhyogUUhXXtStWx7Ay9TJSE5KaK/JLz5eVVIm9t0LVk
	NrqkvD/GYdR1qL/7LBW+gUho6lXnuv4YVKTAqx4lBs6xgtFsV+iAGI2eUnhFg7S9
	FKvmGg==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47ugvmtsqx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 14 Jul 2025 00:50:27 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2355651d204so36704765ad.2
        for <linux-arm-msm@vger.kernel.org>; Sun, 13 Jul 2025 17:50:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752454226; x=1753059026;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pvcGflOb4oHfrwRpsgfYu+5cxv3Vb3K+8uRpTdLXgHU=;
        b=gP4zLVDwRx2aP73Gd9RP8J3dqYt7d8XCAPiWCcqmnLl8XB7R5MumRxRQcsmWoc5plW
         QI7oyNkSaOgEyYlm6Z4gq6EMGC66i9pXNWVyYgyRSRWPIGEb4xDYpd9by99eg1ayKJ8f
         icIaV9ks1d8oI4Xp7xqIvFN3RlNtw7gLhZp0dxuGrFm9HH9FiIwgjA56L9OTM38tM7+e
         YfaRt8koCvMJnaukwlSguqVQ6hXwkj47bEEa62yTlCZwvyrrtZIiAjUcTADNFpyVBHNI
         FxlRsieLD+UE2DcPorCa/xqUqdQh3tZViuHXv+faUR71OMOISwzh2PQeF55neVOIRYcf
         gzAQ==
X-Forwarded-Encrypted: i=1; AJvYcCVqC8e4R9V13Bk7u1Eb57AQWRU87l3pT+CvaOuXuW/pRwYu9+uiTOIgi6BPB87B1GbslxwQiQTYCTC8aKQu@vger.kernel.org
X-Gm-Message-State: AOJu0Yyh9F04f7O1ahSXhbqv534eVyga27Nygq41CELG92lLR+j2X+Pd
	aC/du9K27uQiXlQlHJqXvoByKYRsk44UJ8D71bmSPEZV0fS2+cshuseZMXZn+itazdsdbnQhO/e
	eZ05+5rrYEp8w2nQC2Ry/GcCTEbtU2970Jsri4I+FOHHU0D4m6uffGghI1SOzA0NIoG4=
X-Gm-Gg: ASbGnctc5q4Tdysz2J3NooB5Cwji0+hSuJL2JK0Vq4ac45/8PT/L7P0Gb/Fec53ytio
	c3RXVa0jNWXk2Zl45u/gjY8xWhd6DNTvUwDkfdmketuoUDhMt29voxdS3UVg+0EPG2/mOjnO1QF
	5sX3uqBOFQHuVGJGQHZ631H6Qrc6te03JR4hFI/JtYFRhu9+XuJVnTRL2usKht57Y5z9EyNOWno
	ZftieMtFRUBpxmcjIaVAgKPVKt3qiaygT1Z6ZselWxSTFSOmJxQWv+kGjQZTMtGLKpmmySB7z0q
	yMx+ea1gDYHcU6jYhxlvyrG5E3XLNGfrJOXAYtWvAxf0VsODzfPg8b2D9S0tTGq0y4B+TJiB3YX
	XFtbxVSWZ6Q5L0fcfsNGTJsQ=
X-Received: by 2002:a17:902:fb4b:b0:234:a44c:18d with SMTP id d9443c01a7336-23dede4f2b0mr147211585ad.22.1752454226433;
        Sun, 13 Jul 2025 17:50:26 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFSKkQ1vcVqMqiNeyFPoUR8IIMJMh4dpPpOY24o/EK6hmUwpEmfMEVSQBsWp82yDp7UsudZ3w==
X-Received: by 2002:a17:902:fb4b:b0:234:a44c:18d with SMTP id d9443c01a7336-23dede4f2b0mr147211335ad.22.1752454226033;
        Sun, 13 Jul 2025 17:50:26 -0700 (PDT)
Received: from hu-azarrabi-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23de428473fsm87562605ad.13.2025.07.13.17.50.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Jul 2025 17:50:25 -0700 (PDT)
From: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
Date: Sun, 13 Jul 2025 17:49:17 -0700
Subject: [PATCH v6 05/12] tee: increase TEE_MAX_ARG_SIZE to 4096
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250713-qcom-tee-using-tee-ss-without-mem-obj-v6-5-697fb7d41c36@oss.qualcomm.com>
References: <20250713-qcom-tee-using-tee-ss-without-mem-obj-v6-0-697fb7d41c36@oss.qualcomm.com>
In-Reply-To: <20250713-qcom-tee-using-tee-ss-without-mem-obj-v6-0-697fb7d41c36@oss.qualcomm.com>
To: Jens Wiklander <jens.wiklander@linaro.org>,
        Sumit Garg <sumit.garg@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
        Apurupa Pattapu <quic_apurupa@quicinc.com>,
        Kees Cook <kees@kernel.org>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Cc: Harshal Dev <quic_hdev@quicinc.com>, linux-arm-msm@vger.kernel.org,
        op-tee@lists.trustedfirmware.org, linux-kernel@vger.kernel.org,
        linux-hardening@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linaro-mm-sig@lists.linaro.org, linux-doc@vger.kernel.org,
        Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>,
        Sumit Garg <sumit.garg@oss.qualcomm.com>
X-Mailer: b4 0.13.0
X-Proofpoint-GUID: fCgGtLPm76qnXhKm4QK4jEs4Dt4yj_n2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzE0MDAwMiBTYWx0ZWRfX9Br+rgNB1DEq
 2PJN0xyuQ635BzKxlu+W8kho4zuFSHDgg10Hf5X0xojPQ35uMZq4wL8mSb+yyIQMijnCA+HyM1X
 6TzvsUken8H/DvGAF5AlQVCYfwnO75A4xBK/8XBra1PjE/ElxFA4sEctLN5HP7q5Hmg0MhD5SSI
 /kXEy+2WY+MMCF9q1C27/sxr5rdQV2+lihxqalXfUac4jGU0OXEgOMvHSfqnN7nqt3L6ZhjoUQs
 FAAy+2b6g8qvFTx+VfxHLmOTm8mEyFMSqQ7SW1EgMiWXDyj/pj1y2bzowZh/YHTRl3wnTK1M5OK
 7PWVr+/oQbhmUNJ2JDtR43UWwHy63pbS1A0YqqZ7vqAQGvGUr5UFnqY/aT2jqj5O/paPlqfltN9
 r6deKo0ME779N1Y5Ddy4mWv52Jk2xkxQw6a23zA7x15SC4WrC5yiYAVgWkrDwZTd9e4rDXEM
X-Proofpoint-ORIG-GUID: fCgGtLPm76qnXhKm4QK4jEs4Dt4yj_n2
X-Authority-Analysis: v=2.4 cv=C4fpyRP+ c=1 sm=1 tr=0 ts=68745453 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=COk6AnOGAAAA:8
 a=JCP0Puskdh6qvuzBaLcA:9 a=QEXdDO2ut3YA:10 a=1OuFwYUASf3TG4hYMiVC:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-13_03,2025-07-09_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 mlxscore=0 suspectscore=0 phishscore=0
 clxscore=1015 lowpriorityscore=0 spamscore=0 malwarescore=0 bulkscore=0
 impostorscore=0 mlxlogscore=973 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507140002

Increase TEE_MAX_ARG_SIZE to accommodate worst-case scenarios where
additional buffer space is required to pass all arguments to TEE.
This change is necessary for upcoming support for Qualcomm TEE, which
requires a larger buffer for argument marshaling.

Reviewed-by: Sumit Garg <sumit.garg@oss.qualcomm.com>
Tested-by: Harshal Dev <quic_hdev@quicinc.com>
Signed-off-by: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
---
 include/uapi/linux/tee.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/uapi/linux/tee.h b/include/uapi/linux/tee.h
index 441d97add53f..71a365afb89b 100644
--- a/include/uapi/linux/tee.h
+++ b/include/uapi/linux/tee.h
@@ -42,7 +42,7 @@
 #define TEE_IOC_MAGIC	0xa4
 #define TEE_IOC_BASE	0
 
-#define TEE_MAX_ARG_SIZE	1024
+#define TEE_MAX_ARG_SIZE	4096
 
 #define TEE_GEN_CAP_GP		(1 << 0)/* GlobalPlatform compliant TEE */
 #define TEE_GEN_CAP_PRIVILEGED	(1 << 1)/* Privileged device (for supplicant) */

-- 
2.34.1


