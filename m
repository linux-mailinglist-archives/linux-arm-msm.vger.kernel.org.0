Return-Path: <linux-arm-msm+bounces-89181-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 250F0D23AE4
	for <lists+linux-arm-msm@lfdr.de>; Thu, 15 Jan 2026 10:46:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id AB83C306661A
	for <lists+linux-arm-msm@lfdr.de>; Thu, 15 Jan 2026 09:30:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0D1C938944E;
	Thu, 15 Jan 2026 09:29:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="B3AduXVj";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="K4/XY2cS"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EA033876B7
	for <linux-arm-msm@vger.kernel.org>; Thu, 15 Jan 2026 09:29:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768469354; cv=none; b=pCqbwzupfhm/mThAG2PZa/2lKdHRID+IXtHJcM/o/wDdU/0J7VIoFYRfHFxWLYItdkl4Lq906xhKwTAIdmoPLNGPmvp6D62d32sPmECj28qQQ6VjGbzjxjTZB8e7k+4fypeYeta/tMBcNarkK7fA0P6kL2EZT/u3AKfIFLBeijo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768469354; c=relaxed/simple;
	bh=s19WZGnVsjnU3CIa2pjMzvDcR1778Z6ip689C/D4ewo=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=EQsVgdpqA30/pjYs0/K6sIEnujDRPf/u31iqrnIrksjQ7NC30GnP28CUTR+eaJ8ddcfZP6M12IUSis5LEzKFD0lXBjc1ccgT4J73rZBw2pyF0k32DdFzCh2Jp7JPUFaQQcdkTyZU7NexOXFYo16qPlNGOhjQIghTxbNvjNT1fqU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=B3AduXVj; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=K4/XY2cS; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60F6g1qu1055246
	for <linux-arm-msm@vger.kernel.org>; Thu, 15 Jan 2026 09:29:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=I87OukHNOgS
	eTgoOXQALSi1N6P0XQunpMCBrwQ4g5NU=; b=B3AduXVji1zoURleuuOhK3oQdx7
	6NRuvXB+sflMwvuDIv1ZbZwrMlthUaCrt+U4unJw/WxvIWFyNwrXg82klH8/5um2
	pPqulZV8fDFIXu4C0uAeQ7lwhEC3BHYelfi3xQII+X0dDph5cur20zGmuIJNIFjz
	sukWJw5FFfiY3hiUXzejcvu17NNZv7lEQ7+Hy181VvHmpO2zdXB6jtPXNgOa4NJp
	2GuM1PTYnV7tsRlcEtklwvSgdVR554fx3ultDjj1frl9uwGI+/NBDGSVcyK54zb1
	Oyaw2y6qyWIh9M6Lch2vmoBVfemxVw+c+pd+M3MpjH9mxvsAvQTsUOq3PGQ==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bp8d344bu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 15 Jan 2026 09:29:12 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-88a47331c39so15892146d6.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 15 Jan 2026 01:29:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768469352; x=1769074152; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=I87OukHNOgSeTgoOXQALSi1N6P0XQunpMCBrwQ4g5NU=;
        b=K4/XY2cSGH2fB5+sZN6mhYPiHKqdjKeM6QptVMCD1+AoiLsr9wychy8Fx7NcpURJdG
         OfO3w4wnKcsyw2IFYX9cGoPvSYPX+sV7qGqEeJo0fyl7kl6AAHUqo0n5JFPB9Ef0nsno
         orp4BwUmM2kUgVe9O6GktufCpFk21KREtx8L8fD/RtHIvzOwyswj0vj2BSNfJHhpTn3E
         kk1Fb9u9ILWZMQX8ZWYVdZyre6/l2D19BKIWJseQxrW5OFYa33IYvigSF2Ay8eZD7bW5
         mELtoZAsV+R+Yl7VKVhxqS+TvWaukftlfSAo3fHE1rMDbqcGQLMLBl4Ae4gl/eos7c2D
         AcHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768469352; x=1769074152;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=I87OukHNOgSeTgoOXQALSi1N6P0XQunpMCBrwQ4g5NU=;
        b=IXCc8HddCvM6Nx9Sj4qXLwT7kp3TV2+BQAC19RTE4onTso7obh9bxGVdpMimCfjvTy
         wfLnDVQ7OFMNZliPMJkNBwST+Rt1iq0cwVpl8iH5sPLNxlu46Yz9HwXJeRIU0RePY7AS
         fUVnJJtQ3E48oaj3JCx5VcD43/yK5ZTif50RZiBXUJxc4Y2bAR50R++5ROkdf7Y6XaBN
         /vzYwoc8zaogT/C44DQzPscsUKOOSgyPdk8k9nziA3+D0lsEuCtwT25OpDSUyrLsThJw
         k35GkMSMUYRDbxeLP3VOQRwRKAY/D8KhihvMIkJxS+DeqKi6bbbWT3vGU7vDLbEaHFjA
         hYUg==
X-Gm-Message-State: AOJu0YxLsy3RHL4jkwUGDdXy1j506DofgSg35OzmUJIqtPHbFG1buV2X
	AgmWEzz1L0KxpcaA+c0B79Gfyrzkyy3CSlGVLbqTaRtkrfFb02w2U9aSAfIs08BqqC4HyMGbJkY
	FBExFjffOXfawLY7HCxqhBx2Mqcm9qZtlXOcuQvBuaV/vqr0/fJC1q8kgYbv8lPfmSJYH
X-Gm-Gg: AY/fxX4Ya9vP6GKUuCQANHS6P/jEsf7xKtGXsKY0m4DoRZ3ctePMfyyYR1GgqBI7Zqd
	ChTG2Byh2qXujGYZsHVfzwtbS8bB2ETq+0q3FszPzfFnx3+YajYX1D+HHZPj7RVw4NtACVMO21Z
	boWEuKi2jUowscosKgRzUC872IkkHnTdUxGafR6BKy7SDAevAlZi6e+GObzUTo2HgeI+U4sByQx
	VTrIpfJVj8uM3F8f1tjMgRCNJtP43Q7pDAyKXCSDjJOI9hYuPbwBPF/9i4ZCKiYUtvCeCzL5Pxg
	m01hQ1d22O2zWjA6ANRHBiyu95x2a3QT3Brmuue8hgIpa6oxoEaAS4AUQ0KHh7/+b9N/c2TnE9L
	sdcLVn3a3jk+Ywtrn39Na0AyktrIiAErb2cAwO+etNOCYmSz3DofJOxZMxcpwqnQ0Pac=
X-Received: by 2002:a05:6214:5182:b0:880:5193:10fb with SMTP id 6a1803df08f44-892743c8cc0mr83008246d6.54.1768469351666;
        Thu, 15 Jan 2026 01:29:11 -0800 (PST)
X-Received: by 2002:a05:6214:5182:b0:880:5193:10fb with SMTP id 6a1803df08f44-892743c8cc0mr83008096d6.54.1768469351265;
        Thu, 15 Jan 2026 01:29:11 -0800 (PST)
Received: from yuanjiey.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-892668a2419sm64388416d6.30.2026.01.15.01.29.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Jan 2026 01:29:11 -0800 (PST)
From: yuanjie yang <yuanjie.yang@oss.qualcomm.com>
To: robin.clark@oss.qualcomm.com, lumag@kernel.org, jesszhan0024@gmail.com,
        sean@poorly.run, marijn.suijten@somainline.org, airlied@gmail.com,
        simona@ffwll.ch, maarten.lankhorst@linux.intel.com, mripard@kernel.org,
        tzimmermann@suse.de, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, neil.armstrong@linaro.org,
        konrad.dybcio@oss.qualcomm.com
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, tingwei.zhang@oss.qualcomm.com,
        aiqun.yu@oss.qualcomm.com, yongxing.mou@oss.qualcomm.com,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: [PATCH v6 08/12] drm/msm/dpu: Add interrupt registers for DPU 13.0.0
Date: Thu, 15 Jan 2026 17:27:45 +0800
Message-Id: <20260115092749.533-9-yuanjie.yang@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260115092749.533-1-yuanjie.yang@oss.qualcomm.com>
References: <20260115092749.533-1-yuanjie.yang@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: DCUybTP8EQg_9-Wn2MDuaJ6mtiqp7h-l
X-Authority-Analysis: v=2.4 cv=fbWgCkQF c=1 sm=1 tr=0 ts=6968b368 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=RfJNy9JZAWTFlj1jTG0A:9 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-ORIG-GUID: DCUybTP8EQg_9-Wn2MDuaJ6mtiqp7h-l
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE1MDA2NSBTYWx0ZWRfX8pb+kXB9el/b
 4Bba6pMAt7rlPrGxLDBppc9CLur6sr2SdX368RBqhuYD2oMVta4c8OQvKDpUiqxqy6It+8A0Z8y
 XgZFCY7duz+4gez14DPMAv50kXQ5ldIoxgR0p0APHpZhIROaw0vn+lDNslTY0i25ttCP4Q14TyE
 sIJi/DOZrzQK5teDV/AUlsZ0WHePH/x3e/e1ef/vnrq+12o9YMeEnuB5tfLwRqWl77zouWZYKj4
 f9zNOvTMPiSmsCt3lApOHr0gTBX9gE6fX69UckR1qrLQ/hmfGGxQ21jEXyfyT4XHq9dRfw8rj4Q
 ChHFPcsn9kaoJw6ZKmRFOe08ZhxFUOBEABIph6brK2FdbvsEZPG+eygvorfliGvEYOoUKfiMI2h
 uBu2AElVdRAxB5OAoLJvniAKPr4IhjZAOD9F7AKuv5F/x0QTgNm+rm5BD387Mkb+m9ZCpladEOW
 KMd/yFy7UPyr5JaKMGA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-15_02,2026-01-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0 impostorscore=0 phishscore=0 priorityscore=1501
 adultscore=0 clxscore=1015 malwarescore=0 bulkscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601150065

From: Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>

DPU version 13.0.0 introduces changes to the interrupt register
layout. Update the driver to support these modifications for
proper interrupt handling.

Co-developed-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>
---
 .../gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c | 89 ++++++++++++++++++-
 1 file changed, 88 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c
index 49bd77a755aa..5b7cd5241f45 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c
@@ -40,6 +40,15 @@
 #define MDP_INTF_REV_7xxx_INTR_TEAR_STATUS(intf)	(MDP_INTF_REV_7xxx_TEAR_OFF(intf) + 0x004)
 #define MDP_INTF_REV_7xxx_INTR_TEAR_CLEAR(intf)		(MDP_INTF_REV_7xxx_TEAR_OFF(intf) + 0x008)
 
+#define MDP_INTF_REV_13xx_OFF(intf)			(0x18d000 + 0x1000 * (intf))
+#define MDP_INTF_REV_13xx_INTR_EN(intf)			(MDP_INTF_REV_13xx_OFF(intf) + 0x1c0)
+#define MDP_INTF_REV_13xx_INTR_STATUS(intf)		(MDP_INTF_REV_13xx_OFF(intf) + 0x1c4)
+#define MDP_INTF_REV_13xx_INTR_CLEAR(intf)		(MDP_INTF_REV_13xx_OFF(intf) + 0x1c8)
+#define MDP_INTF_REV_13xx_TEAR_OFF(intf)		(0x18d800 + 0x1000 * (intf))
+#define MDP_INTF_REV_13xx_INTR_TEAR_EN(intf)		(MDP_INTF_REV_13xx_TEAR_OFF(intf) + 0x000)
+#define MDP_INTF_REV_13xx_INTR_TEAR_STATUS(intf)	(MDP_INTF_REV_13xx_TEAR_OFF(intf) + 0x004)
+#define MDP_INTF_REV_13xx_INTR_TEAR_CLEAR(intf)		(MDP_INTF_REV_13xx_TEAR_OFF(intf) + 0x008)
+
 /**
  * struct dpu_intr_reg - array of DPU register sets
  * @clr_off:	offset to CLEAR reg
@@ -199,6 +208,82 @@ static const struct dpu_intr_reg dpu_intr_set_7xxx[] = {
 	},
 };
 
+/*
+ * dpu_intr_set_13xx -  List of DPU interrupt registers for DPU >= 13.0
+ */
+static const struct dpu_intr_reg dpu_intr_set_13xx[] = {
+	[MDP_SSPP_TOP0_INTR] = {
+		INTR_CLEAR,
+		INTR_EN,
+		INTR_STATUS
+	},
+	[MDP_SSPP_TOP0_INTR2] = {
+		INTR2_CLEAR,
+		INTR2_EN,
+		INTR2_STATUS
+	},
+	[MDP_SSPP_TOP0_HIST_INTR] = {
+		HIST_INTR_CLEAR,
+		HIST_INTR_EN,
+		HIST_INTR_STATUS
+	},
+	[MDP_INTF0_INTR] = {
+		MDP_INTF_REV_13xx_INTR_CLEAR(0),
+		MDP_INTF_REV_13xx_INTR_EN(0),
+		MDP_INTF_REV_13xx_INTR_STATUS(0)
+	},
+	[MDP_INTF1_INTR] = {
+		MDP_INTF_REV_13xx_INTR_CLEAR(1),
+		MDP_INTF_REV_13xx_INTR_EN(1),
+		MDP_INTF_REV_13xx_INTR_STATUS(1)
+	},
+	[MDP_INTF1_TEAR_INTR] = {
+		MDP_INTF_REV_13xx_INTR_TEAR_CLEAR(1),
+		MDP_INTF_REV_13xx_INTR_TEAR_EN(1),
+		MDP_INTF_REV_13xx_INTR_TEAR_STATUS(1)
+	},
+	[MDP_INTF2_INTR] = {
+		MDP_INTF_REV_13xx_INTR_CLEAR(2),
+		MDP_INTF_REV_13xx_INTR_EN(2),
+		MDP_INTF_REV_13xx_INTR_STATUS(2)
+	},
+	[MDP_INTF2_TEAR_INTR] = {
+		MDP_INTF_REV_13xx_INTR_TEAR_CLEAR(2),
+		MDP_INTF_REV_13xx_INTR_TEAR_EN(2),
+		MDP_INTF_REV_13xx_INTR_TEAR_STATUS(2)
+	},
+	[MDP_INTF3_INTR] = {
+		MDP_INTF_REV_13xx_INTR_CLEAR(3),
+		MDP_INTF_REV_13xx_INTR_EN(3),
+		MDP_INTF_REV_13xx_INTR_STATUS(3)
+	},
+	[MDP_INTF4_INTR] = {
+		MDP_INTF_REV_13xx_INTR_CLEAR(4),
+		MDP_INTF_REV_13xx_INTR_EN(4),
+		MDP_INTF_REV_13xx_INTR_STATUS(4)
+	},
+	[MDP_INTF5_INTR] = {
+		MDP_INTF_REV_13xx_INTR_CLEAR(5),
+		MDP_INTF_REV_13xx_INTR_EN(5),
+		MDP_INTF_REV_13xx_INTR_STATUS(5)
+	},
+	[MDP_INTF6_INTR] = {
+		MDP_INTF_REV_13xx_INTR_CLEAR(6),
+		MDP_INTF_REV_13xx_INTR_EN(6),
+		MDP_INTF_REV_13xx_INTR_STATUS(6)
+	},
+	[MDP_INTF7_INTR] = {
+		MDP_INTF_REV_13xx_INTR_CLEAR(7),
+		MDP_INTF_REV_13xx_INTR_EN(7),
+		MDP_INTF_REV_13xx_INTR_STATUS(7)
+	},
+	[MDP_INTF8_INTR] = {
+		MDP_INTF_REV_13xx_INTR_CLEAR(8),
+		MDP_INTF_REV_13xx_INTR_EN(8),
+		MDP_INTF_REV_13xx_INTR_STATUS(8)
+	},
+};
+
 #define DPU_IRQ_MASK(irq_idx)	(BIT(DPU_IRQ_BIT(irq_idx)))
 
 static inline bool dpu_core_irq_is_valid(unsigned int irq_idx)
@@ -507,7 +592,9 @@ struct dpu_hw_intr *dpu_hw_intr_init(struct drm_device *dev,
 	if (!intr)
 		return ERR_PTR(-ENOMEM);
 
-	if (m->mdss_ver->core_major_ver >= 7)
+	if (m->mdss_ver->core_major_ver >= 13)
+		intr->intr_set = dpu_intr_set_13xx;
+	else if (m->mdss_ver->core_major_ver >= 7)
 		intr->intr_set = dpu_intr_set_7xxx;
 	else
 		intr->intr_set = dpu_intr_set_legacy;
-- 
2.34.1


