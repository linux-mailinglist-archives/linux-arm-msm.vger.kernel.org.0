Return-Path: <linux-arm-msm+bounces-66315-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 292AFB0F415
	for <lists+linux-arm-msm@lfdr.de>; Wed, 23 Jul 2025 15:33:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 50DB3173E51
	for <lists+linux-arm-msm@lfdr.de>; Wed, 23 Jul 2025 13:33:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F371D2E7192;
	Wed, 23 Jul 2025 13:33:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Ke4SeYrx"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D9222080C0
	for <linux-arm-msm@vger.kernel.org>; Wed, 23 Jul 2025 13:33:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753277630; cv=none; b=qXTXAbgsczt/c6IXbB3Z4kTW8o1uYTTMkbKr00JLp9H8O1dvJ33rWG2CoOp0VQYZH8stV3G40u2yuaL3hJGI2fKqhO1A3QiHdfQF+e61hmSUgP4qLOes4dSrnXu/zCtwfLCOLuxk+8tQ+aEPEbnSx4zH2mSP8Sz8l4lQkXYDLj0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753277630; c=relaxed/simple;
	bh=SBUY/V4xLs/7I4TRnpBK02us0MpTJs5s79N5xrPclI4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=UpmazgLCOE7jgeV9NS2We4d+L13v7agGMigDyph1NBrewy4aZHI3u6zmCXbs0vKIxB8tD5aJ9usuTQaW6P+eb00gfeCImFjUfIK9gHIzljCYTEDhvGadecl3N6K1l8iNRUSvKeaNBKH55F2g6JZy8QDaFmvQUzAlBQOQDLYmnkc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Ke4SeYrx; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56N96ZJd024768
	for <linux-arm-msm@vger.kernel.org>; Wed, 23 Jul 2025 13:33:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=WTQFEIPLe1Tpen98i92mSH
	rOdL5Ab+xN4wlWiokaT5c=; b=Ke4SeYrxSPuS3KhWMpA1fQDAXHQ28aH6A3J2XM
	jC9GLrMYFnTk/tUuAizSb8UUCt70kr3tRk60m9n21xNsRndAArbSe1YfAv63Yr66
	+E9V9hLlI3mrDkbpjOGF37hd4yTiQMIbZu2xM2hGxY/hOPTkSemVUsKffcITZSvS
	Sd/UiLsCTrM3zilRL+WM0eLvNmciZsmcmnLAxNUFCwLJSJa8JX+NKHunuQtak9Dz
	M1kKp7b7YdZMKICEGOuZW1f9QQq6yM2AXqCCAOFLHx0/fbU01rUhCPAsSZ/H+mvB
	0QilctERmpLqkI5t3ZP7P9/sOAO9Pu2X9TtCPOJl0+m3o4NQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48044dn44k-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 23 Jul 2025 13:33:48 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7ceb5b5140eso1162531785a.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 23 Jul 2025 06:33:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753277626; x=1753882426;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WTQFEIPLe1Tpen98i92mSHrOdL5Ab+xN4wlWiokaT5c=;
        b=s/fv60kI24unMdsqFikhXTYqPSo+X4dX7dh4NBVwGdP7EkqD0UC3aXj5iWns0mE4Yh
         5R4psL8j9BXsL6Hw4/KjGxMGZdhfR6cGhsiZUz81QFlKCIcKWxnpYvVmbGhirikOQGT5
         VWar7QVRQbe/naAdOXJ3huEW8I9jwjuv55apFNF3xCRsnXfe+wqwqpGYDsj3oBP/CGGq
         pwdRQQbUht0263uFwJkrEbEMm8hYYIaEvipSX595KpByfSfFcyy6gTIEjN6T6FcIcBod
         vtwYOVSwD0ODpp0h9azrm8sNXTR4ejNjJQbhKAkCNIqB2hPHQstCIH8KfRrL97bUILJ8
         f7zQ==
X-Forwarded-Encrypted: i=1; AJvYcCVkbHgFFJVYiI2XtME+xRkwau7LvO9Lw69Zm+zJxWK3pvOz4deez+wVogtBlpPZegwwAHxqaa23LdvTeWCT@vger.kernel.org
X-Gm-Message-State: AOJu0Ywbpt1T3qzrjLHOkNrT3Po+dXUfkXAKjsT77AuEaBrcpspqjGPK
	ZmduQcLHBEUYFSfBx6KTz3z3ALQ27tTLo0W5TpYeG7bZSHdqpxsnq+rPSukYSd9L8tw1+tWS3Io
	5DuWnn+G8iLOFWQluHTGVKcY0kby2nNYvdyvkP3/KNRQLc3wxPR3wFE1rLsL6VZktC9lB4UXty/
	gU
X-Gm-Gg: ASbGncukG4eP3hUYOwSswXDyQGI1k6UiDNjLv/TAx0uRAHSqYB5V8Rc0BuqTYENmCVL
	wD+MpLwb2jP0iWUrkS2rN6ejstk4L2HF0aQaRgf/M/UTQ+JkDs3H6A3q7eAd9C6Y4rXNZ1Zxl0m
	Fu6erLPrlZ25cBZavPyjwBIpWzGWd+I068SZZa8Vd45qZok6Oq8w2n6FQ2H/V/qpq5jSFu2gzOx
	xJG3kwGLNGpGFbguNKRz31+F2h8SedCcZ4PQ4uLBdHFl1H78dNq9K1d9vOIMI5ERha0A9+lsKwK
	hVHMNNVC3KkL2/GsDEFXHPxvEphZyNK/TNT8TrYxbtqrMtqcofXzBAelQfzPjkrd54fNMsmn3dC
	AnwJp0mhHwjacqIc/etxsLSL50eq7qUf8FTf/0NB5vGwODCW3ZHuh
X-Received: by 2002:a05:620a:698a:b0:7e3:4804:6d6a with SMTP id af79cd13be357-7e62a0961b5mr389689685a.7.1753277625779;
        Wed, 23 Jul 2025 06:33:45 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGIbu3Pi8x0OiP43SauVb8JeZIBxt/dr12pb52JW+xXRmOZK0s8yrai9klZTjw4uI2IfxS83A==
X-Received: by 2002:a05:620a:698a:b0:7e3:4804:6d6a with SMTP id af79cd13be357-7e62a0961b5mr389684285a.7.1753277625278;
        Wed, 23 Jul 2025 06:33:45 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-55a31d7c76csm2304535e87.122.2025.07.23.06.33.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Jul 2025 06:33:44 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Wed, 23 Jul 2025 16:33:43 +0300
Subject: [PATCH v3] soc: qcom: ubwc: provide no-UBWC configuration
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250723-ubwc-no-ubwc-v3-1-81bdb75685bf@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIALbkgGgC/3XPSw6CMBAG4KuQri32QVVYeQ/josAgTaSVtlQM4
 e4W2Bijm07+ycyX6YQcWAUOFcmELATllNEx8F2CqlbqG2BVx4wYYYIcyQEP5bPC2myVVyKnOTt
 yIBzFlYeFRo0rd7nG3CrnjX2teqBL9w8UKKYYeC4Ek5JkdXM2zqX9IO+V6bo0PmjxAvswGP8yW
 DROTAAFEFkpxQ9j3o600A/xq367FJXSAV6GlC8SDaPfd9J5sHF+fgPOz8vXIgEAAA==
X-Change-ID: 20250706-ubwc-no-ubwc-3c5919273e03
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2890;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=SBUY/V4xLs/7I4TRnpBK02us0MpTJs5s79N5xrPclI4=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBogOS4B8xLRc/tP2mWUM8pLag/D25jq2Lvgx7GI
 NfVsxwYFzuJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaIDkuAAKCRCLPIo+Aiko
 1Qw2B/9Px8qUpaP6FZLiIa1oy9vHbRSAdE/D598x7ufikpHqguT389LRl/BhbSAJ/REpVvOaVv/
 TCr69PwL/Cr68jpyQJ0+ryJ0kwnppxg6lUSI/IKbZ6eF2FD+TvD9Uc7KpAMKogSY0JxOUzNpF9b
 esuvlWT7zaErklWT39eNRobaxclJ5RrfG9hSlD/yVfqTgV+ds/+yXyVw4MglBRgmGA2T+SNrcwj
 /SwbJdfRmR7ZHW1IYyLQ+5MvurVxNH+kyp9Rw2VCHbXfuuiFvgNnXTh5oh6Qdjc18EwY4U/uC1U
 IGWJLjAV2MEVZM4NupwE6ot0slIQoxmqnsaH8Y47t8w7nGx0
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Authority-Analysis: v=2.4 cv=BJ6zrEQG c=1 sm=1 tr=0 ts=6880e4bc cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Wb1JkmetP80A:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=HI9FvKZQ5624IJQzk6MA:9
 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: FKOpCB6kCYgVI5FUBrkHXf0Z7JACtk5x
X-Proofpoint-ORIG-GUID: FKOpCB6kCYgVI5FUBrkHXf0Z7JACtk5x
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzIzMDExNiBTYWx0ZWRfX9OruOH7C6r01
 7I1BlBjnZ+fv6U0MbyuLfDgc29frW+gk3aBKPVRpEq6PLfrbIt3X/9GvG0HhB+DUGpOLcuOB8c8
 LNA27uAeVFUCxrtU4fSNOs2PpgbNnRVqltL6hJco252hO5AA6u1mGvuNUxT4cS0PpRs2N7ZK9yM
 ZcAWHNnwwhH0AlG/deI3KC5n7UWr+a7uRDW/ocnVaQV6bRP1ZPgacxdrYy3q9jlpYbNAEC/Jtd+
 IqUSwFaFf4DwFFTkIYS2NZ7w1U9BhqD3xewOxOkooptHThbIWjH7t4hbvaLFxcAkoFg+7q1OwRP
 HLCUKhRvY2ewd7dwq1iUZPXZm4xus8dBacmi+/rpzZ6heMOCB7xnYRhiS/Ywxtfz4cboFxCMmRJ
 FgRPKsrroPeoEeaEzTnIQ79rWnMuVXNqKQJrtHcLs3B+r6JWS3fr/Jk74kPLmnkNWXwEI4u5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-23_02,2025-07-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 clxscore=1015 spamscore=0
 mlxlogscore=999 suspectscore=0 impostorscore=0 phishscore=0 adultscore=0
 mlxscore=0 malwarescore=0 bulkscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507230116

After the commit 45a2974157d2 ("drm/msm: Use the central UBWC config
database") the MDSS driver errors out if UBWC database didn't provide it
with the UBWC configuration. Make UBWC database return zero data for
MSM8916 / APQ8016, MSM8974 / APQ8074, MSM8226 and MSM8939.

Fixes: 1924272b9ce1 ("soc: qcom: Add UBWC config provider")
Acked-by: Bjorn Andersson <andersson@kernel.org>
Reviewed-by: Rob Clark <robin.clark@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
Note: the driver is a part of drivers/soc, but as it got merged through
drm/msm tree, this fix should also go through the drm/msm tree.
---
Changes in v3:
- Just picked up all R-B tags from v1 (forgot those in v2)
- Link to v2: https://lore.kernel.org/r/20250723-ubwc-no-ubwc-v2-1-825e1ee54ba5@oss.qualcomm.com

Changes in v2:
- Added APQ8026 to the list (Luca Weiss)
- Link to v1: https://lore.kernel.org/r/20250706-ubwc-no-ubwc-v1-1-e39552aa04df@oss.qualcomm.com
---
 drivers/soc/qcom/ubwc_config.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/drivers/soc/qcom/ubwc_config.c b/drivers/soc/qcom/ubwc_config.c
index bd0a98aad9f3b222abcf0a7af85a318caffa9841..9002fc9373ce349c129889ab58f87cd59591de63 100644
--- a/drivers/soc/qcom/ubwc_config.c
+++ b/drivers/soc/qcom/ubwc_config.c
@@ -12,6 +12,10 @@
 
 #include <linux/soc/qcom/ubwc.h>
 
+static const struct qcom_ubwc_cfg_data no_ubwc_data = {
+	/* no UBWC, no HBB */
+};
+
 static const struct qcom_ubwc_cfg_data msm8937_data = {
 	.ubwc_enc_version = UBWC_1_0,
 	.ubwc_dec_version = UBWC_1_0,
@@ -215,11 +219,18 @@ static const struct qcom_ubwc_cfg_data x1e80100_data = {
 };
 
 static const struct of_device_id qcom_ubwc_configs[] __maybe_unused = {
+	{ .compatible = "qcom,apq8016", .data = &no_ubwc_data },
+	{ .compatible = "qcom,apq8026", .data = &no_ubwc_data },
+	{ .compatible = "qcom,apq8074", .data = &no_ubwc_data },
 	{ .compatible = "qcom,apq8096", .data = &msm8998_data },
+	{ .compatible = "qcom,msm8226", .data = &no_ubwc_data },
+	{ .compatible = "qcom,msm8916", .data = &no_ubwc_data },
 	{ .compatible = "qcom,msm8917", .data = &msm8937_data },
 	{ .compatible = "qcom,msm8937", .data = &msm8937_data },
+	{ .compatible = "qcom,msm8939", .data = &no_ubwc_data },
 	{ .compatible = "qcom,msm8953", .data = &msm8937_data },
 	{ .compatible = "qcom,msm8956", .data = &msm8937_data },
+	{ .compatible = "qcom,msm8974", .data = &no_ubwc_data },
 	{ .compatible = "qcom,msm8976", .data = &msm8937_data },
 	{ .compatible = "qcom,msm8996", .data = &msm8998_data },
 	{ .compatible = "qcom,msm8998", .data = &msm8998_data },

---
base-commit: a933d3dc1968fcfb0ab72879ec304b1971ed1b9a
change-id: 20250706-ubwc-no-ubwc-3c5919273e03

Best regards,
-- 
With best wishes
Dmitry


