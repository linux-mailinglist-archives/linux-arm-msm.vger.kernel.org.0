Return-Path: <linux-arm-msm+bounces-60121-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6505EACC2A6
	for <lists+linux-arm-msm@lfdr.de>; Tue,  3 Jun 2025 11:06:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B7FFC172178
	for <lists+linux-arm-msm@lfdr.de>; Tue,  3 Jun 2025 09:06:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9C24A28134A;
	Tue,  3 Jun 2025 09:06:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mIY945E/"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAD50281364
	for <linux-arm-msm@vger.kernel.org>; Tue,  3 Jun 2025 09:06:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748941566; cv=none; b=E+XvIc8zqdAcg2dm941hr4U1y+lfeWx3Cd3718tXGhQbIH77IoAS5b/KGr9k39+z2DCXshkkJ7W1m4CCXwwBMRTyF/zz66lZdliPooRdC2e+C7tZHwY8ArqGoviibdJD6OACQ6X1KMV8f0Ea83o4Hy+zcSjEBmZZllvxe1dNLyo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748941566; c=relaxed/simple;
	bh=sRP0LmdX2jCQmP9M0y80Vq5CWeHDEBh8oibADEXpCms=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=h7SEnTV7ptaVj0cCEy34C11NO1BOrUIfSqNJaRzeK+rUrkNUI6T5ms9GAtbpMQuRC7LCPf+ceBYu2QZDro25rAzSQeee+hQ4UWCuGEDMRChKqgMdWIj6UqRE0AuNeTycyeAF9hQ5SQB3U2aajGGkNYIadtHjqplZj7Kh7k7Cg1g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mIY945E/; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5537W3PV026737
	for <linux-arm-msm@vger.kernel.org>; Tue, 3 Jun 2025 09:06:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=7sA02YbbHjaA+JbHO5CG9q
	0PR/A+phKOqR9jUxXEpgk=; b=mIY945E/Nixe3WOBhlIRDU5i5UpgwuRVaoCB2l
	MX+qsL5CLzFZ3SgzU4H5+0bYLiob8X1rZmRM3V+SEtx+FWSbKyAB+fIXdS9Z3zou
	rONaZgWRhLShdJLuZ6oUn+ccmJaY2HXxwjHBceDWQvRf7rKXkQgvGenxZ56rtwWt
	FpqsZu7JN6s4NTBo+NCj/qWryN2yTm/87N+hM7tU7HP8YOUg4aGuxQdXGX+Mwk7D
	0lLLIm+zGW9IT4Ic/CPz+f7qqLmkAp7GCtRGUGqDkeqNiCn6QCwkyDx2eplzyu3T
	S+j5L1RxUwbp0RZM6NCQFxedp1qp8AvYsl5WtYXDkWMj3nsA==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 471g8rsyqs-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 03 Jun 2025 09:06:00 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-234a102faa3so37618235ad.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 03 Jun 2025 02:06:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748941560; x=1749546360;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7sA02YbbHjaA+JbHO5CG9q0PR/A+phKOqR9jUxXEpgk=;
        b=t8L6nGwXFsT4LV2pVfjWT0PJTIdbGdfexzgXFfQOaJ2fiEraZVSHWqqirRDyZmE6j2
         hUGz2h3S5Os6dY1nQDfyA0LhuUsH0Cv7efiGzEJPJHXjje+8dEfwojXa2IATaw4cfAwg
         RGh0pYNIBBhk3M12BTGScFibzRA32JlwTBQZ4H2xlEC/zV59ntiQEUFQfWCpMunJPVV0
         vLBhSOxBFP+tDtQjCP2nLaWHTQnD2VbE8bW8hSGusQliRxNezLCQupl27ewDFWWInUKP
         XNcShv+NnYqzssUsc0d6sAP4IIKzcy/q/6+Cu3GFJUiH/Ujb9gdBdaC4Rpc2Y1Tzr5y0
         5yIA==
X-Forwarded-Encrypted: i=1; AJvYcCWAPc7ZWSVZxBha7cxwfgADiLRIjv/O17kcOLY4iV2rD7wZQFtO/k/FtkuPBMc+2jnE/zLQpOOJTwgY903O@vger.kernel.org
X-Gm-Message-State: AOJu0YwkffnK6Gp+U28KtT+lKEpuk9taMuOKT+Tqs1Yu45n7z2qpTnak
	fy651/Kp3/YVAc5+6omfwzeokCP+uU7C+Dt7MZySXKZTd6+t0fXW/Z2oX6gBWGXv1M8+RZQ3Zsq
	m0dh8BC73RqApCpbaJIDShy/T1UMaDdnoE9FEiIemwrfPzcnu/BmJbcpRsTD4Nw6TubDN
X-Gm-Gg: ASbGncv8/pty3/IhFOxbtSPhbEcQr4CiIy5oOGwPDlPzZMsvoFr+mMOLiFViGwgeuVP
	Npq67fGxT+2Hbf63saCXlUP1ypUhqDB0jpTPmo0xPmQOhyLaMJyh0wrhkpzB1C9LRcd5YcQMk7V
	LZOu1pa3FAWrmMUGsgoUxref6UCLiv3OBWIgihPH+ClDu92UyUy0nErAYBnqoecGGeoHhS5nQnY
	B4UXr9XntK3Ze3owyYRB7NRikyrdHMyrBGiqlFpcycCzP2eM/ytgK1CNTK4HezB+YCjUTkLMkGM
	Jhpm/07gmEckx+B3Ypt34pgLG88kfpPt00pHyrcrc9tB3QOnbrjUOyK+6UU=
X-Received: by 2002:a17:903:1787:b0:234:9374:cfae with SMTP id d9443c01a7336-23528ef5e4amr263371335ad.19.1748941559873;
        Tue, 03 Jun 2025 02:05:59 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH43qHpeF9M3nXB838OHaxee4EJLTnaL3rTc6DrjrHyUUCJy0UJLGrjFgiWIWbpdhKwpiwebA==
X-Received: by 2002:a17:903:1787:b0:234:9374:cfae with SMTP id d9443c01a7336-23528ef5e4amr263371025ad.19.1748941559493;
        Tue, 03 Jun 2025 02:05:59 -0700 (PDT)
Received: from hu-qianyu-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23506bd92f8sm83215375ad.88.2025.06.03.02.05.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Jun 2025 02:05:59 -0700 (PDT)
From: Qiang Yu <qiang.yu@oss.qualcomm.com>
Date: Tue, 03 Jun 2025 02:05:44 -0700
Subject: [PATCH v2] mhi: host: Add standard elf image download
 functionality
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250603-standard_elf_image_load_support-v2-1-cce97644e99e@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAOe6PmgC/x3NQQ6CMBCF4auQrh1DKyJ15T2MaSbtAJNACy0YD
 eHuVnbv2/xvE4kiUxL3YhOR3pw4+Ax1KoTt0XcE7LKFKtW1rMsLpAW9w+gMDa3hETsyQ0Bn0jp
 NIS7gUKOydaUrKUWuTJFa/hwPz1d2G8MISx8Jj66sG63Lm2w0KNlUFUjoeIFE3gGNyAPMK1szM
 /rv+vhv9vZswyj2/QeKeMgVvQAAAA==
X-Change-ID: 20250603-standard_elf_image_load_support-da9a2c649411
To: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        jeff.hugo@oss.qualcomm.com
Cc: mhi@lists.linux.dev, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, quic_bqiang@quicinc.com,
        can.guo@oss.qualcomm.com, Mayank Rana <mayank.rana@oss.qualcomm.com>,
        Qiang Yu <qiang.yu@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1748941558; l=3167;
 i=qiang.yu@oss.qualcomm.com; s=20250513; h=from:subject:message-id;
 bh=z/rZNOS6LYQellsLP6isZYxfUEFgjKzlMB6X/v9Z/Ck=;
 b=imRxSsFqBjNS1t0JMKVAOiQENHjRfq7lUvuCtX4/D8wlTYXORDjeJd/xZ7uUwofbyfFHV2VAk
 DuS6GJwvt0qBbEWvygUxhu1hFletJu8L212DP1DfmjdYFpVe7xplTW+
X-Developer-Key: i=qiang.yu@oss.qualcomm.com; a=ed25519;
 pk=Rr94t+fykoieF1ngg/bXxEfr5KoQxeXPtYxM8fBQTAI=
X-Proofpoint-ORIG-GUID: QkCcvhLFgh-SpgPd3YwaSen70he78Ub-
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjAzMDA3OSBTYWx0ZWRfX7GbnqbcK84kl
 2oof8Pf3TjMT9EZ0e9jIRfkWYF4CJEKEBbldAfHyjrf40ULzGLMJbIQ0YCLePbPJ4qXn/npbjKb
 cgLRR+M1BGJtMqeb/1C1mqzqAMMzuexsF+UjRN3I+H9LOrcXQVVWqhxJCTnfZAyV3SsiwCSd7fq
 GOq0hNHtWv/07oYHV8KAVp9NaJPzIHQPZZfvEY334W8ErBobvyFWeyOwp5WRSGlwAyKZCahCH7r
 dXVxOl8k1vFVPmckBgOfFtt7oYCOlrj1Td9R0lDLloqkg33IkY1uwonogMotHGB4OLjbQnDL+16
 NBwFBY035MJw3l4dza1o4GM2ekS0EUadVfwNNtI5lsr5/Q800kGsVQ0J/P5y7MkF6B54AElBEhD
 fIU4G3PKpEMqWbwLpAD+z8T7vLUUwvF/DleFGKLx91wzrW//lzKuQrspNGLJYalKvyeteQFy
X-Authority-Analysis: v=2.4 cv=RdWQC0tv c=1 sm=1 tr=0 ts=683ebaf8 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=VwQbUJbxAAAA:8 a=COk6AnOGAAAA:8
 a=EUspDBNiAAAA:8 a=o8HkkU2S3lM798f_WwQA:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: QkCcvhLFgh-SpgPd3YwaSen70he78Ub-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-03_01,2025-06-02_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 mlxscore=0 priorityscore=1501 phishscore=0
 clxscore=1011 lowpriorityscore=0 malwarescore=0 suspectscore=0
 impostorscore=0 spamscore=0 mlxlogscore=999 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506030079

From: Mayank Rana <mayank.rana@oss.qualcomm.com>

Currently, the FBC image is a non-standard ELF file that contains a single
ELF header, followed by segments for SBL, RDDM, and AMSS. Some devices are
unable to process this non-standard ELF format and therefore require
special handling during image loading.

Add standard_elf_image flag to determine whether the device can process
the non-standard ELF format. If this flag is set, a standard ELF image
must be loaded, meaning the first 512 KB of the FBC image should be
skipped when loading the AMSS image over the BHIe interface. Note that
this flag does not affect the SBL image download process.

Signed-off-by: Mayank Rana <mayank.rana@oss.qualcomm.com>
Co-developed-by: Qiang Yu <qiang.yu@oss.qualcomm.com>
Signed-off-by: Qiang Yu <qiang.yu@oss.qualcomm.com>
---
Changes in v2:
- V1 patch is paused because of no user. WLAN team plan to add support for
  new WLAN chip that requires this patch, so send v2.
- Change author and SOB with new mail address.
- Reword commit message.
- Place standard_elf_image flag after wake_set in struct mhi_controller
- Link to v1: https://lore.kernel.org/mhi/1689907189-21844-1-git-send-email-quic_qianyu@quicinc.com/
---
 drivers/bus/mhi/host/boot.c | 7 +++++++
 include/linux/mhi.h         | 4 ++++
 2 files changed, 11 insertions(+)

diff --git a/drivers/bus/mhi/host/boot.c b/drivers/bus/mhi/host/boot.c
index efa3b6dddf4d2f937535243bd8e8ed32109150a4..f1686a8e0681d49f778838820b44f4c845ddbd1f 100644
--- a/drivers/bus/mhi/host/boot.c
+++ b/drivers/bus/mhi/host/boot.c
@@ -584,6 +584,13 @@ void mhi_fw_load_handler(struct mhi_controller *mhi_cntrl)
 	 * device transitioning into MHI READY state
 	 */
 	if (fw_load_type == MHI_FW_LOAD_FBC) {
+		dev_dbg(dev, "standard_elf_image:%s\n",
+			(mhi_cntrl->standard_elf_image ? "True" : "False"));
+		if (mhi_cntrl->standard_elf_image) {
+			fw_data += mhi_cntrl->sbl_size;
+			fw_sz -= mhi_cntrl->sbl_size;
+		}
+
 		ret = mhi_alloc_bhie_table(mhi_cntrl, &mhi_cntrl->fbc_image, fw_sz);
 		if (ret) {
 			release_firmware(firmware);
diff --git a/include/linux/mhi.h b/include/linux/mhi.h
index dd372b0123a6da5107b807ff8fe940c567eb2030..48f2b50038519111aed2075f01d0704adfc8989e 100644
--- a/include/linux/mhi.h
+++ b/include/linux/mhi.h
@@ -360,6 +360,9 @@ struct mhi_controller_config {
  * @bounce_buf: Use of bounce buffer
  * @fbc_download: MHI host needs to do complete image transfer (optional)
  * @wake_set: Device wakeup set flag
+ * @standard_elf_image: Flag to determine whether the first 512 KB of the FBC
+ *                      image need to be skipped when loading AMSS image over
+ *                      BHIe interface (optional)
  * @irq_flags: irq flags passed to request_irq (optional)
  * @mru: the default MRU for the MHI device
  *
@@ -445,6 +448,7 @@ struct mhi_controller {
 	bool bounce_buf;
 	bool fbc_download;
 	bool wake_set;
+	bool standard_elf_image;
 	unsigned long irq_flags;
 	u32 mru;
 };

---
base-commit: 6348f62ef7ecc5855b710a7d4ea682425c38bb80
change-id: 20250603-standard_elf_image_load_support-da9a2c649411

Best regards,
-- 
Qiang Yu <qiang.yu@oss.qualcomm.com>


