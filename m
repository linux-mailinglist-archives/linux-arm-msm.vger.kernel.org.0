Return-Path: <linux-arm-msm+bounces-78507-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DA76C001A7
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Oct 2025 11:08:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 470913A4FAC
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Oct 2025 09:08:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 842042FD687;
	Thu, 23 Oct 2025 09:06:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="B1EL2lBW"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 988D42FD68F
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Oct 2025 09:06:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761210394; cv=none; b=MMT7+l50QbXslClP91eFgvt4G5ScG/RlCPFcBuuL+/DfLmsjenV6l52mUpVdQCpJ4+BQqWL09MNGniQxQPar0l8QkewcZxSTAuJ5GNM4XZognnRCvC+ahILxyTm8yDe3KQAPln2/2HrmOZHdp/7uW+8ilytDujbrQtHg3QhfwHc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761210394; c=relaxed/simple;
	bh=xwACydKQvgDKuB0v3VRVNVKaf/7fL95Co83H8L4/8V8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=WjkLpnkx24vKb7pfBJzXejVwdYKfTew8D/qgWtEVQ0M4qu1bcoOApPrPqlbejb7tVHh9iqLw6s1C3zean1LnddwQN2KFjP3/h9jI2diQf09COOJioKG50kQ7+2tP8pMYttWDOkJXjMMzq5oq7hAiGy5pbr2jwdsekYK8TdgkByg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=B1EL2lBW; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59N6xoMB007442
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Oct 2025 09:06:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=Tbyvd4eRGssa6Ha0ecVbsY
	tSBYVsX1t2xVyxXt94ET0=; b=B1EL2lBWBnN34927WafsHwonB2UGuLi6pZlOPk
	OmgCYq64xuesQ06vVKEV8RP0vsd4sSzRxd0gTT0R4Eyudf45C5sy4YP3gkPSY9UT
	fJaLnL7Fs1C3+YIISCWROoisShsWMo2XmUJJUkX5ygH2TxPpi+nWhgLteODJW8bA
	K2O+tvRHwr4ZT7BTjsSISqqhRpo61PrimoiemBqMBq7IOfjlYfiM8JsOqeFwyAug
	+jgfJgEAut9gOLibsCJoPHo5a3VSq2dnDQH5Wv9boiBgPfTg6RUURWkWfmthRRrW
	CpTCeRSotwd8MUIMId8ojRylX4dMNYWYhFA8tPbMy1+3PClQ==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49v3447tw3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Oct 2025 09:06:31 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2697410e7f9so15579785ad.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 23 Oct 2025 02:06:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761210391; x=1761815191;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Tbyvd4eRGssa6Ha0ecVbsYtSBYVsX1t2xVyxXt94ET0=;
        b=R9AnBW9d04pXPzlh0rMefRC5zKZ+GjY1Irhvq4qccQGzKx4Vy+d4wIUqOOdblcAR+r
         x4alElZp/H3DnAY5+hZ0PMpxFyH+T2GsBBGIhFvEdps/XcMGzJ8FsB7Qg6cAsH69eOI7
         NMZl4v94+iy7/4RS1W0GtRZU2SWQar/CB4bJROpMlfLl9Pfu/Wj2QuxaBoZQh9n5a3ZG
         +kOmaXILnUkJcpTN3VjH6Zz2miwcGQApVhVsuNAUd6GSQL/3i5N9XbuWDrB2WEF37PjH
         fjixdfKbhovevAvchLMOMHoeccSgQw7xwJU/OUji+/gpsBwK/WHtFIxFUn0HSa5jrtDI
         wKAg==
X-Forwarded-Encrypted: i=1; AJvYcCVFMcB2qNpmM+Ejfpu6BijQ7zEPqc6PJaRMnZZ/YO1l4pRhvC4sGoYVMNwzi6OoGaAGjURiWDiK03CmZr7+@vger.kernel.org
X-Gm-Message-State: AOJu0YzTFOYgeL0WxphqkHWZbhq93sAXhYsoG3KkW56cydTLH+DNhZsZ
	usASJkFnPLnQG64Xuu3i0wJ0dTRYIDVmsSU+km6RSAIuMbejq8aESCO6qAuyS7A/HWb0j6wGR1b
	1VuvbemgG3oZSFTyoGvycH/w0Fr2sYc8/XUrAVUD9ruUZNdlPifMzm1OLp9vs/6LdB6t4
X-Gm-Gg: ASbGncuxGwiDBU60rmphsH5F0xv1D864euYR+Axu1KrKDT8dD2C5et60NtDPmONNxRl
	heb0d1VR03pHoO1Ru9ekq08jbQ16/Hfj4hE+JCa0Bc4+sRptRn5HMiY0/3DG1kAd/iGiKfqz4fJ
	bByJmXA6uqA/wUK3iJ43vVZCRKOBWFjCCJPuemSUI8hDro1ulZOlFgV48678xgmxyTI4BVVg3fp
	E8VUwFoYB6zg6rAoG12JOyAKwktQ4U3c+036SCOt/CjoPzdDixgstloZZ9yYC8y2WI1Ron+5eyw
	IbCDCGIAVXkPxyuUpChsEU38s6Rd5YBRV5Tzrx65qo0+CSu9tcfcdEy1WwFl/LrIpcEMOZC5hU+
	kSBLzSSDKH3/fDN6NGP7SNDgUrgIUzE1vTbG3+6SsGG1Hqj+IK0fdCA==
X-Received: by 2002:a17:902:ec87:b0:269:82a5:fa19 with SMTP id d9443c01a7336-290cb07cbbbmr274605455ad.45.1761210390989;
        Thu, 23 Oct 2025 02:06:30 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGXtnMJKSahTr3YrUSbYlgQcd+PhongCRbCPX3M+/vpJqbpLoH+wusz0Lz81kTeDHbmGQz8pA==
X-Received: by 2002:a17:902:ec87:b0:269:82a5:fa19 with SMTP id d9443c01a7336-290cb07cbbbmr274605095ad.45.1761210390516;
        Thu, 23 Oct 2025 02:06:30 -0700 (PDT)
Received: from hu-hangxian-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2946dfc1c8asm16698685ad.71.2025.10.23.02.06.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Oct 2025 02:06:30 -0700 (PDT)
From: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
Date: Thu, 23 Oct 2025 02:06:26 -0700
Subject: [PATCH] media: camss: csiphy: Make CSIPHY status macro
 cross-platform
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251023-make-csiphy-status-macro-cross-platform-v1-1-5746446dfdc6@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIABHw+WgC/x2NQQrCQAxFr1KyNjAzpaBeRVyEaWqDtjMkoyild
 29w8RbvLf7fwFiFDa7dBsofMSmrSzx1kGdaH4wyukMKaYghRVzoyZhN6vxDa9Te5ilrQccM64v
 aVHTBob+EMcd0Jmbwtao8yff/dLvv+wHpHkPYeQAAAA==
X-Change-ID: 20251021-make-csiphy-status-macro-cross-platform-5390dc128aee
To: Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Robert Foss <rfoss@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Todor Tomov <todor.too@gmail.com>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: linux-i2c@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org,
        Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Proofpoint-GUID: uw0ppXav5nHztYKxsv8kVqtVQZ72z-wz
X-Proofpoint-ORIG-GUID: uw0ppXav5nHztYKxsv8kVqtVQZ72z-wz
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDE4MDAyMyBTYWx0ZWRfX+Wu2LlpTMzEu
 v9KXA+heIKFOkDYi8DPHz9FNj1mA82YCzuongt1IusF2M1zu4XXm3Z2xffOkwPOXRdNFn6V8c+L
 7vIC151xgu5eRFMEkLULfqOrEBwDGQAA/YnDjjUUhA9T3IgiJHtwbLRSSN7K8MvBDRSZc1Yprg9
 3NvA01gqfu3nAKoFOpxvOfjlF3VzNDEmeXgkaUue1ZnAljLeNCzDBZwg/6ifBA7xQPNbWUYmfiW
 TcxUn91Ztefz1lIIBW5eNrbHS2jBnmVuV/l8swVVCa0AyHZDStPa5SQgRST76fUeYi7WTjOQv2V
 7TUQcVCgCB+7neNqUdqrDhrw4CxMc7FXZMSbLWb44RXbUIVLJT2GW2+ys+W/3Hqsgao9LriUQW4
 3rn1lLNBQzJip6LZ3ukpkqs06eV/rw==
X-Authority-Analysis: v=2.4 cv=E/vAZKdl c=1 sm=1 tr=0 ts=68f9f017 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=edmtyYkapI0WV9tsjtgA:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-22_08,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 priorityscore=1501 bulkscore=0 suspectscore=0
 lowpriorityscore=0 clxscore=1015 adultscore=0 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510180023

The current value of '0xb0' that represents the offset to the status
registers within the common registers of the CSIPHY has been changed on
the newer SOCs and it requires generalizing the macro using a new
variable 'common_status_offset'. This variable is initialized in the
csiphy_init() function.

Signed-off-by: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
---
This change introduces common_status_offset to replace the hardcoded
offset in CSIPHY_3PH_CMN_CSI_COMMON_STATUSn.
---
 .../media/platform/qcom/camss/camss-csiphy-3ph-1-0.c  | 19 +++++++++++++------
 drivers/media/platform/qcom/camss/camss-csiphy.h      |  1 +
 2 files changed, 14 insertions(+), 6 deletions(-)

diff --git a/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c b/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c
index a229ba04b158..9b6a0535cdf8 100644
--- a/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c
+++ b/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c
@@ -46,7 +46,8 @@
 #define CSIPHY_3PH_CMN_CSI_COMMON_CTRL5_CLK_ENABLE	BIT(7)
 #define CSIPHY_3PH_CMN_CSI_COMMON_CTRL6_COMMON_PWRDN_B	BIT(0)
 #define CSIPHY_3PH_CMN_CSI_COMMON_CTRL6_SHOW_REV_ID	BIT(1)
-#define CSIPHY_3PH_CMN_CSI_COMMON_STATUSn(offset, n)	((offset) + 0xb0 + 0x4 * (n))
+#define CSIPHY_3PH_CMN_CSI_COMMON_STATUSn(offset, common_status_offset, n) \
+	((offset) + (common_status_offset) + 0x4 * (n))
 
 #define CSIPHY_DEFAULT_PARAMS		0
 #define CSIPHY_LANE_ENABLE		1
@@ -714,13 +715,17 @@ static void csiphy_hw_version_read(struct csiphy_device *csiphy,
 	       CSIPHY_3PH_CMN_CSI_COMMON_CTRLn(regs->offset, 6));
 
 	hw_version = readl_relaxed(csiphy->base +
-				   CSIPHY_3PH_CMN_CSI_COMMON_STATUSn(regs->offset, 12));
+		CSIPHY_3PH_CMN_CSI_COMMON_STATUSn(regs->offset,
+						  regs->common_status_offset, 12));
 	hw_version |= readl_relaxed(csiphy->base +
-				   CSIPHY_3PH_CMN_CSI_COMMON_STATUSn(regs->offset, 13)) << 8;
+		CSIPHY_3PH_CMN_CSI_COMMON_STATUSn(regs->offset,
+						  regs->common_status_offset, 13)) << 8;
 	hw_version |= readl_relaxed(csiphy->base +
-				   CSIPHY_3PH_CMN_CSI_COMMON_STATUSn(regs->offset, 14)) << 16;
+		CSIPHY_3PH_CMN_CSI_COMMON_STATUSn(regs->offset,
+						  regs->common_status_offset, 14)) << 16;
 	hw_version |= readl_relaxed(csiphy->base +
-				   CSIPHY_3PH_CMN_CSI_COMMON_STATUSn(regs->offset, 15)) << 24;
+		CSIPHY_3PH_CMN_CSI_COMMON_STATUSn(regs->offset,
+						  regs->common_status_offset, 15)) << 24;
 
 	dev_dbg(dev, "CSIPHY 3PH HW Version = 0x%08x\n", hw_version);
 }
@@ -749,7 +754,8 @@ static irqreturn_t csiphy_isr(int irq, void *dev)
 	for (i = 0; i < 11; i++) {
 		int c = i + 22;
 		u8 val = readl_relaxed(csiphy->base +
-				       CSIPHY_3PH_CMN_CSI_COMMON_STATUSn(regs->offset, i));
+			CSIPHY_3PH_CMN_CSI_COMMON_STATUSn(regs->offset,
+							  regs->common_status_offset, i));
 
 		writel_relaxed(val, csiphy->base +
 			       CSIPHY_3PH_CMN_CSI_COMMON_CTRLn(regs->offset, c));
@@ -989,6 +995,7 @@ static int csiphy_init(struct csiphy_device *csiphy)
 
 	csiphy->regs = regs;
 	regs->offset = 0x800;
+	regs->common_status_offset = 0xb0;
 
 	switch (csiphy->camss->res->version) {
 	case CAMSS_845:
diff --git a/drivers/media/platform/qcom/camss/camss-csiphy.h b/drivers/media/platform/qcom/camss/camss-csiphy.h
index 895f80003c44..2d5054819df7 100644
--- a/drivers/media/platform/qcom/camss/camss-csiphy.h
+++ b/drivers/media/platform/qcom/camss/camss-csiphy.h
@@ -90,6 +90,7 @@ struct csiphy_device_regs {
 	const struct csiphy_lane_regs *lane_regs;
 	int lane_array_size;
 	u32 offset;
+	u32 common_status_offset;
 };
 
 struct csiphy_device {

---
base-commit: 076fb8624c282c10aa8add9a4ae2d9354d2594cb
change-id: 20251021-make-csiphy-status-macro-cross-platform-5390dc128aee

Best regards,
-- 
Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>


