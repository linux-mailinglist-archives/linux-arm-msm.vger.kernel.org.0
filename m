Return-Path: <linux-arm-msm+bounces-86463-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F070CDB362
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Dec 2025 04:05:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id ADBCB300670C
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Dec 2025 03:05:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1CB6A223708;
	Wed, 24 Dec 2025 03:05:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PR4rg3G5";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hx+3GN23"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B9D31E2858
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Dec 2025 03:05:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766545532; cv=none; b=n8RSQidqk7t2ruygsVNbQ9d8Hs65/gtijnIAz3qMHnC+32nAym3az46bUljbdPN1saEt/MvCAvJNG9mspSAwBlmhKs4B1veQz3ZsW4Gx/KO09nw80HAN+oCGoSbCYLXBiMIhScyMquPHyyWuIVeTm4rTqxxx5AROpnj5mbdPUco=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766545532; c=relaxed/simple;
	bh=L7d9WDfHwlzNrI0KCwmnPnsGCrTqpAM9L8mNj4ddC74=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=OFukBdHKlabuLasLVE1H9HknoNpHFbKMHq20g6R8TvM4W5wufqIjoH88mL6k8Y0rbaifL91eHL+tvHhD8Lh5qSnk1EZ2pc62TqCp7Kmzo/6qDmaOxhv4l4yTfO3o9jleEbYDuyb/GvGke96jQC6vrLdmkptMdbkwlwmVldF5Y+c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PR4rg3G5; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hx+3GN23; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BO17SHq1597726
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Dec 2025 03:05:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=FFOhIoxD+udoXEQm8ssn/k
	1M4rTdS2pHETEOs5w29AI=; b=PR4rg3G5cC9hfSNQTv9U1uBiYrTIIIfxfVvYMv
	jWwIioks7zaooKSChB8SMYi6r3YweMpXajuQLVKaiAUJ2B6YU8rLUN+ZCH9Q05we
	5u+BCSJZWRbCuyNvcXKx3lNjoMpgu4lpQftNcQwr65ovIKv+Qtx1bF6pyEd/7bsn
	G/YrRyZe+XSCjDS7+CRZ07EtSSsIAoXRxP4AgSf4vMMGx6ddI+PUweFxkWEWOm+K
	39yqc6MneivOfRER1lm0UI604ODvjuj5kGU5FKmIBtvDdf7L6J9vMGY0ub52alHz
	Zg5XUnE7ZKrP39H3Lra4bEkGRmrwJ4gwpk5jY7Kf74BAWW1A==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b8683g83c-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Dec 2025 03:05:29 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2a13be531b2so119204645ad.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 23 Dec 2025 19:05:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766545528; x=1767150328; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=FFOhIoxD+udoXEQm8ssn/k1M4rTdS2pHETEOs5w29AI=;
        b=hx+3GN23ygUIHKAMirTthBAes9aWyopEqso/Tdjnk+QhoQJmVb1Wi6lD50TMTjrbEj
         d1ksH7OhJYLjqgj1cg7RCQR3VEek/2HVsosVct1LwinhWpuRaa/e3+hopatkN7pVtfuU
         3ez/jrarzbj+A8+plFIHPC1qEzgoxMQMx0OslQUS7qLMBaQGV6KrUkrFSlvny6yjNtu6
         uqtvRZamttCZioOLpk55hA6nXd2/hwWuejwmzPNJvpDYZL9SkB5W0Myp/V8Ep3ZLHu2h
         l6oPzNnyVADhwR6JWbbuxTOo80aCce/F6lC2YCVGG0bTLpkxYyfvr+KVRw3cNamVjBy1
         N0mA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766545528; x=1767150328;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FFOhIoxD+udoXEQm8ssn/k1M4rTdS2pHETEOs5w29AI=;
        b=fqCWwigAeSt7X7OfkO6waLqkL3ZmR1OaBX4aAbcjHXmz4bKJrRRvb9bOjTEslj4erf
         QYUdwLxsBj9qHBO0fkJmQofdETFoLcGIuAHo1ZKdUmZq/gmDn8zh6I2pcDvYKiRAXrhg
         PSnn3IthV/eL6gHpgEirT1IzVwotGmLjq8WHdsn3ntRNg7rVjHx+LL2wbayDkIqmrl+u
         ebs4B1HttL8sRSYVGpky73GiCFhafJ1dRX+Ou/md3JiRc1Uz94kZyxiS7VGBL7Q21EDK
         JzQwT0pSx1s39T7CuunLVVWGVuLspicw4JgCIyr1HISo73Kp1XK7hKoTUsLM9y1ZKAf0
         uK2w==
X-Forwarded-Encrypted: i=1; AJvYcCWpeZMrmLsPw1ui3Bwy3PXKzt8AUMVoRP5cbAAnN+w8RKxa1sOqGW5nlvci5tceuC7qZSsgjRmLVlO2OYom@vger.kernel.org
X-Gm-Message-State: AOJu0YwoNjjbFuk8zxui8XaP0NMs1L4n06lGv4m+qFMDdMb9DtCfm+lh
	L/fbCgfHpfCko72cqZCfcdxE0hLmcQ49hOqIASeCs9EV0ZzbMZ1LyvCaLR1BJqQ+gIqRYnPO6q6
	dvfbVBMXCw8oRUQtQ9qRN4R+u53Zh0iiiufnwq7TBsNffUQyNk0lyUpF79m7tuGJf+3a6mAtssm
	oWUUs=
X-Gm-Gg: AY/fxX7fjt23XkU/s5hTIJRemUgRzLH0iKRUI6D50z2HeMlXS42qlLFjF2aicz0iE+g
	FMvynK712hM/Te9kSC1zNMTuTfwGUgW2v1w8W6qL0uN93RBucX3xd6jXh0ClEm5PRmHR3Ifnxd5
	lMmh4Zq4LGFX03XqUvvsgdxUM/ZN/RaqYPO+Ppx146feJldvcWpm2aBNYlRcuxJHbvlV8czFIMQ
	hwKX8Nwm6D9yhoMcXnSlTT8dCh8VTHDrdLEvmnfYutcng0WuxRXQ4a/WH0Vfh/O7nLQZVy2Hu59
	NNR0sqAthMFdV0C4xZw0nxuZendpP0n+x8GymMwkHy7zqg3JdoEqCzVcSopGStoNdNCvSYzuXdp
	52Ck3AfQO6MEJXFEt+2LjlAb862Ko7j7SoSAFIamCzOPnhNJpwOlFsvHU
X-Received: by 2002:a05:7022:61d:b0:11a:3483:4a87 with SMTP id a92af1059eb24-121722b771cmr17037682c88.13.1766545528293;
        Tue, 23 Dec 2025 19:05:28 -0800 (PST)
X-Google-Smtp-Source: AGHT+IG93BEwr9RbdIfRstr3iob3AI6olRrNRYusetw+VRPaE/pCjjFrKIVLFO50zD+6M45FOzVPsA==
X-Received: by 2002:a05:7022:61d:b0:11a:3483:4a87 with SMTP id a92af1059eb24-121722b771cmr17037654c88.13.1766545527574;
        Tue, 23 Dec 2025 19:05:27 -0800 (PST)
Received: from hu-qianyu-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-121725548b5sm65186256c88.17.2025.12.23.19.05.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Dec 2025 19:05:27 -0800 (PST)
From: Qiang Yu <qiang.yu@oss.qualcomm.com>
Date: Tue, 23 Dec 2025 19:05:26 -0800
Subject: [PATCH v5] mhi: host: Add support for dual ELF image format
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251223-wlan_image_load_skip_512k-v5-1-8d4459d720b5@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAHVYS2kC/33PTWrDMBAF4KsErasg68exuuo9ShBjaRyL2JYrO
 UpL8N0rp1BaWrIZeIv55s2NJIweE3ne3UjE7JMPUwnqaUdsD9MJqXclE864qiqu6XWAyfgRTmi
 GAM6ks5+NqviZOmc7lNq1DQpS9ueInX+/26/HkrsYRrr0EeFbZDUTNC0wOYjO4ND9ki/zHOJCM
 6cVtRb1oZYStcaXkNL+7QKDDeO4L2O71vu0hPhxfySL7eZXZ86qB52zKHaLrlVSN6Aa+Gtv1bP
 8AXLxCJQFBMa4kFBbdWj+Add1/QSM4CDIeAEAAA==
X-Change-ID: 20251129-wlan_image_load_skip_512k-ddcfe49db8e3
To: Manivannan Sadhasivam <mani@kernel.org>
Cc: mhi@lists.linux.dev, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, Qiang Yu <qiang.yu@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1766545526; l=3460;
 i=qiang.yu@oss.qualcomm.com; s=20250513; h=from:subject:message-id;
 bh=L7d9WDfHwlzNrI0KCwmnPnsGCrTqpAM9L8mNj4ddC74=;
 b=Cx/oxMivL3KjwL0QdFU/ZJfYUgZiKpJY2Kfzj2hsCLOTJibinz2tUObTeJ2aMNUWct8AQs3/e
 2UTHwVZlc6SAJ9EHHfoLsSeObYQmWcXQDLtTjt67A/FJiBk+WNtd1qN
X-Developer-Key: i=qiang.yu@oss.qualcomm.com; a=ed25519;
 pk=Rr94t+fykoieF1ngg/bXxEfr5KoQxeXPtYxM8fBQTAI=
X-Proofpoint-GUID: LSNmpdVPbvNR46yriwGB1g39Ax4-lODP
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjI0MDAyMyBTYWx0ZWRfX5lZ+zv+mH582
 QUC8d09Fm/Ymz3TzywGg40Bwlq/S11JZiGeDIvT7HNlg1lWosPdoXXf0xaYKs+m/fjfn8D6cY+q
 YdAg02373m8oxqo8CK91OFf+YgR5VEyww9mIifV201qDwIEQ7pOqrl6XqI7fOdQeWsumeuid5hi
 jqX4RZOaFR6A4gSn6ZkfmesOPHncC0dUDU9xv7y1jVcrXI4dv3fHCEeCEGlE26m4tsNF19ovczV
 nnfyW82Lsl+HeCEaYrsZwAq3YHK9ACKGt6kQbstRWo7ZFZIVOnxjjeKLQxWsds7LlXbNG22FkRn
 iz3JEIxNweGFVJGR5VSCZ3MFpwgRHeOKRJS8clluNCAkTW7uZVY18vNKmwTReNIdahAHhkiqdrI
 Iet7k6W4Rw7D2LJ6XDY1xq4/FsiEkFCSCUx6DhzTQJp7eW2QqClW+b46iw0WT75D4OcWWbIzlxH
 O+1AN+iPa5tc+BCBhWw==
X-Authority-Analysis: v=2.4 cv=HqV72kTS c=1 sm=1 tr=0 ts=694b5879 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=COk6AnOGAAAA:8
 a=yWoLkE6zulz-TMI_RbsA:9 a=QEXdDO2ut3YA:10 a=324X-CrmTo6CU4MGRt3R:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: LSNmpdVPbvNR46yriwGB1g39Ax4-lODP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-24_01,2025-12-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 suspectscore=0 malwarescore=0 bulkscore=0
 adultscore=0 lowpriorityscore=0 spamscore=0 clxscore=1015 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512240023

Currently, the FBC image contains a single ELF header followed by segments
for both SBL and WLAN FW. However, TME-L (Trust Management Engine Lite)
supported devices (e.g., QCC2072) require separate ELF headers for SBL and
WLAN FW segments due to TME-L image authentication requirements.

Current image format contains two sections in a single binary:
- First 512KB: ELF header + SBL segments
- Remaining: WLAN FW segments (raw data)

The TME-L supported image format contains two complete ELF files in a
single binary:
- First 512KB: Complete SBL ELF file (ELF header + SBL segments)
- Remaining: Complete WLAN FW ELF file (ELF header + WLAN FW segments)

Download behavior:
- Legacy: 1. First 512KB via BHI (ELF header + SBL)
          2. Full image via BHIe

- TME-L: 1. First 512KB via BHI (SBL ELF file)
         2. Remaining via BHIe (WLAN FW ELF file only)

Add runtime detection to automatically identify the image format by
checking for the presence of a second ELF header at the 512KB boundary.
When detected, MHI skips the first 512KB during WLAN FW download over BHIe
as it is loaded in BHI phase.

Signed-off-by: Qiang Yu <qiang.yu@oss.qualcomm.com>
---
Changes in v5:
- Remove invalid Reviewed-by and Signed-off-by tags
- No code changes, only commit message tag corrections
- Link to v4: https://lore.kernel.org/r/20251223-wlan_image_load_skip_512k-v4-1-a00234a6c578@oss.qualcomm.com

Changes in v4:
- Detect image format runtime by checking second ELF header instead of using a flag.
- Link to v3: https://lore.kernel.org/r/20251201-wlan_image_load_skip_512k-v3-1-bedb5498a58a@oss.qualcomm.com

Changes in v3:
- Reword commit message.
- Reword comments of standard_elf_image flag
- Add reviewed-by tag.
- Link to v2: https://lore.kernel.org/mhi/20250603-standard_elf_image_load_support-v2-1-cce97644e99e@oss.qualcomm.com/

Changes in v2:
- V1 patch is paused because of no user. WLAN team plan to add support for
  new WLAN chip that requires this patch, so send v2.
- Change author and SOB with new mail address.
- Reword commit message.
- Place standard_elf_image flag after wake_set in struct mhi_controller
- Link to v1: https://lore.kernel.org/mhi/1689907189-21844-1-git-send-email-quic_qianyu@quicinc.com/
---
 drivers/bus/mhi/host/boot.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/drivers/bus/mhi/host/boot.c b/drivers/bus/mhi/host/boot.c
index 205d83ac069f15a19ab2d66a63692e5d60334d4c..6ba0f16854d3a839e987f19d782600467b5f9836 100644
--- a/drivers/bus/mhi/host/boot.c
+++ b/drivers/bus/mhi/host/boot.c
@@ -584,6 +584,17 @@ void mhi_fw_load_handler(struct mhi_controller *mhi_cntrl)
 	 * device transitioning into MHI READY state
 	 */
 	if (fw_load_type == MHI_FW_LOAD_FBC) {
+
+		/*
+		 * Some FW combine two separate ELF images (SBL + WLAN FW) in a single
+		 * file. Hence, check for the existence of the second ELF header after
+		 * SBL. If present, load the second image separately.
+		 */
+		if (!memcmp(fw_data + mhi_cntrl->sbl_size, ELFMAG, SELFMAG)) {
+			fw_data += mhi_cntrl->sbl_size;
+			fw_sz -= mhi_cntrl->sbl_size;
+		}
+
 		ret = mhi_alloc_bhie_table(mhi_cntrl, &mhi_cntrl->fbc_image, fw_sz);
 		if (ret) {
 			release_firmware(firmware);

---
base-commit: ac35e04f8000aaaf98635792464647e7a6f3422e
change-id: 20251129-wlan_image_load_skip_512k-ddcfe49db8e3

Best regards,
-- 
Qiang Yu <qiang.yu@oss.qualcomm.com>


