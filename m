Return-Path: <linux-arm-msm+bounces-83567-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D3795C8DC7D
	for <lists+linux-arm-msm@lfdr.de>; Thu, 27 Nov 2025 11:34:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 50CF53B0704
	for <lists+linux-arm-msm@lfdr.de>; Thu, 27 Nov 2025 10:33:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 44A2332C951;
	Thu, 27 Nov 2025 10:32:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="i1gJD/9l";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="VxkAkxO2"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FA9F32C922
	for <linux-arm-msm@vger.kernel.org>; Thu, 27 Nov 2025 10:32:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764239562; cv=none; b=BXV6VqnSRxHRELwMZGWaoUpa6dhb3muqYNEYYR0GmH/eW9VWXS3O7YpNwo6vJUNvGvWuzE9ww9QEBFXFyRXloQdBgLpHibUuKJzp9YBhXETfJJlzvW2lVa+6AByeJWZdevJVWO52AdQjd55kv6F9IcFdRsvLLI2JR+ZcMBEdcJ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764239562; c=relaxed/simple;
	bh=3jY4jay0fa16bI6Cy4wTjwQK1KlO540uPMJDxUSvlmw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=mk7LQmseiYGkyCUfJs3ZJ8//fh4bVw/gNJC3sARnRXPm+IHScok2/x04N9XVaKfHBJYdvmFZetVKKFltfadXLw/viZFxsLKsf4owf4XJAMb/+TUDY5gdlDSlNZVTQ3MVk2CfUdoKQL0ktknsE9jIecc/G1VqdI7UH7pd3erXl1Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=i1gJD/9l; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VxkAkxO2; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AR7fRw72388038
	for <linux-arm-msm@vger.kernel.org>; Thu, 27 Nov 2025 10:32:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4wfsYUiRzfh9JsB1b2aoq8bGnceYTL/wE/22WZWN7Ks=; b=i1gJD/9lf+sOgjHR
	hEREoKcOKP2AsBizOC1GrB0N1DjxcK41iP9iE+JCCmDGNU7s+TicjUGSDa5HQRgL
	sMJ/IMVQf7ch5F9vf5YxfeFWhXTRto67kqngheicQTWGYuUVZ047aADpJSi2DxWs
	C3yBf/Os5ORG66UCj8Y3eaauBF6bYs5EeZrmd3PJhX2NiOAdq7uvvOBSstN8g3/r
	PVd4B3FIbvuo0dELnN1pqKAI7Z77mXyeCKvA1gLaXFQ43aWVwBumvASqjVvcCi4T
	ko8p7JrvY22lGLRkF76FpI3HpjfkrUaa/Lzu5mBzV/x/tv0RtNPzCnsvVbVeiTPA
	eioX9Q==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ap7n8j42s-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 27 Nov 2025 10:32:39 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-7ba9c366057so1902232b3a.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 27 Nov 2025 02:32:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764239559; x=1764844359; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4wfsYUiRzfh9JsB1b2aoq8bGnceYTL/wE/22WZWN7Ks=;
        b=VxkAkxO2mMaMWi/6qF7nT3JMPLmjX7wwDXVR62ZqiFnA2++l/rAeWWBhSj9LkuW3vD
         Z2QZ3fP4xhF4GRG3kFV8DeZ/y0Uy55Segq4tSU1toCw6Oc6rPJFRgnhHMfRnKKOaOEBy
         xZtcE8Fb0ipwQWevQe60KCG65uaLY1PvQXq2YxTOpyXDwCny3HBkaX5nQ4I4KNS7bedj
         TmhCf4zAfbGCtkRWAciTJc1dzCAmrZ4MwIVItF3M6lZ6wRxe3WPv0D1FPRE6fk19utNB
         s1RctCq9NtXNl0oWunOFoS6Y/ZpLCa5kp0vFN8vjTBAoZBika6/93E7xF/B6qMkF0jC9
         Qkdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764239559; x=1764844359;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=4wfsYUiRzfh9JsB1b2aoq8bGnceYTL/wE/22WZWN7Ks=;
        b=JkAE4KzGSVAdmvRGp1yIPr5a4rE39pS1K8H3V6bPzTgc/yg7pLtSf07m8l4rsw7BtE
         Db0iN2tDA+AwBnEj28fBtRDfQvQnMYSZ7ZtBHoarg86wlXy+mMc+m/Yra37dgtv1400Y
         iJ9N5yWmhfIZvPmH35+vhby7LZEuFBk0Yze6f807Ct5bPG5Og1kfZCqNMEVkmW9Ag31q
         3RaqdB8tHyg9S0bYuJGLO5DpDkFi5qc59UyYpA6PhwuRtHCWrS8Bxy9i3wuJyaa7hkfz
         SP0VZUH5RbpsUJKzymjub41pJP5TOiOGW4VvYFEbrFnUiMsPKPa6SvQgxyBsheWrLraI
         eTxA==
X-Forwarded-Encrypted: i=1; AJvYcCVdVfjw1uTNIHOezzt0KRvpmtKfpNPBvuo4V7buoSYQuQ+vlhHZ85vkuCZtOu6wWwFWxCdVKWWU4lxXrk4T@vger.kernel.org
X-Gm-Message-State: AOJu0YzJxmviu9+DOKAUq8E47FNFzB4jP+qCdlVILrjih9cZTV4jG032
	5u/UqwFEkZHrVOWNQZkJanq3OQbtcqKdc5fxW6MxzagGY1rEbKXTfcHiKM1cgbYzKcf1NX0l9bU
	jfjiMRfaeWKSE+6Rf6olwv5r6bHF0MPzByiOq7BwiFKldRls9s/aDhgZ0myxq+aIHQ7WJ
X-Gm-Gg: ASbGncvNDh3X3zquyGK3BEP6soG5SW7TmiqMcT0DhPNJpxv/GbTvHl0AQU2bNAkWPAV
	neJwQOPWGXcpTJS60GCPbE5t2EEp3NzMOLUuS4mZWG4cQ1RA+1radovj3WrTvx/DxWvaF2nYRWd
	E0LO/cMyD6htZugvtMZHvBueOCvB6WSzrLWdbtVZ4CODFXSXUlGbJ08nNvxgVFC9f3tJsiRm47O
	EZm7uMtHciwNs8nDl56Z2aBwSqLsBc6Ah+GyzGLS5vp/sQoo8h/xJlqNlOB0jOmKU4zvKDdKZnX
	Y9/uQRf5ycCWneLdLDXSx31Ysp5R2l/Ubg0ttuLNzp8+LDKR3Frht7q/UHF/r7LhTsn+08RW5ir
	SiIk4cpmVsYw4VNEAX5BVCtrS8qhJBfogu5EeSP0=
X-Received: by 2002:a05:6a00:10cb:b0:7b7:c078:9f7b with SMTP id d2e1a72fcca58-7ca8975f0a5mr14879351b3a.18.1764239559045;
        Thu, 27 Nov 2025 02:32:39 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFOeS4h4J86AlUYFuq8VUrpWHIhe0O73BqzB2ZXtFJJExi3GnPo/+J0ssWgf74gvRSbwETcMQ==
X-Received: by 2002:a05:6a00:10cb:b0:7b7:c078:9f7b with SMTP id d2e1a72fcca58-7ca8975f0a5mr14879324b3a.18.1764239558519;
        Thu, 27 Nov 2025 02:32:38 -0800 (PST)
Received: from hu-sriramd-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7d15f457c38sm1479819b3a.54.2025.11.27.02.32.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Nov 2025 02:32:38 -0800 (PST)
From: Sriram Dash <sriram.dash@oss.qualcomm.com>
Date: Thu, 27 Nov 2025 16:01:45 +0530
Subject: [PATCH 2/2] usb: dwc3: qcom: Support firmware-managed resource
 states for power management
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20251127-controller_scmi_upstream-v1-2-38bcca513c28@oss.qualcomm.com>
References: <20251127-controller_scmi_upstream-v1-0-38bcca513c28@oss.qualcomm.com>
In-Reply-To: <20251127-controller_scmi_upstream-v1-0-38bcca513c28@oss.qualcomm.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Cc: jack.pham@oss.qualcomm.com, faisal.hassan@oss.qualcomm.com,
        krishna.kurapati@oss.qualcomm.com, andersson@kernel.org,
        linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Sriram Dash <sriram.dash@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Shazad Hussain <shazad.hussain@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1764239543; l=7775;
 i=sriram.dash@oss.qualcomm.com; s=20251022; h=from:subject:message-id;
 bh=3jY4jay0fa16bI6Cy4wTjwQK1KlO540uPMJDxUSvlmw=;
 b=N0Ht/zBgJJWL+0fYK5Xk+/xzqXmfV/mWUqizonEV+bvQscDDDGXXAXkR37csjawbfSkPZaWSD
 uUZz+d8CS97CCN8Ny1HRVUbeTyeO7sV60CJJhNltzRe49g2L+5vege2
X-Developer-Key: i=sriram.dash@oss.qualcomm.com; a=ed25519;
 pk=balisq+aEVXEJ6Gnze3kqbYZiFlsdHUjTSdCvupAeP4=
X-Proofpoint-GUID: XPGKRQDiZpwbHBauuvTOE8_xHBP1yQxl
X-Authority-Analysis: v=2.4 cv=AufjHe9P c=1 sm=1 tr=0 ts=692828c7 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=mTzkS-5CbVgYcLmgcBoA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-ORIG-GUID: XPGKRQDiZpwbHBauuvTOE8_xHBP1yQxl
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTI3MDA3NyBTYWx0ZWRfX7KGNQcUI0q2E
 +yoCK4dJs/CZqebwO9RHpQJ4xajXealxV4fTqpjBJ7bXrLTo3w37pP9faKzy328mfj0e0yQ/6WA
 98n4OKqtP4RVMP7wHnAD1gWirL3DOpDzyQWqwb9a2jJQnXMKcb+drD4/nQGh20tMIjIQcWjJKGw
 QgqGl4yJFXC+zOmYaXSZpaaPaR1qPrCb8qTTMnd+Y7kNxmnUIhYIcofmW1/DJHwHeflPbTWB+Y5
 8i3CT5+m6dwgWgCot7bsXS/TzDzoxzUTUb2zx9QSuqM/cJJSerE9EExSdx1KLj+X/TdC9NG3dh4
 ML2/WM/9iGYDWllKkw3aSfQI8q4kEGa4QGK7ouowKW9BEerqdgnMbVq99L4ErIBlkoLYlV7cpWx
 eO0/jALKxzFZ4U/lRRcA3cWa3gLJPw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-25_02,2025-11-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 bulkscore=0 suspectscore=0 adultscore=0
 phishscore=0 spamscore=0 impostorscore=0 lowpriorityscore=0 clxscore=1011
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511270077

Add support for firmware-managed resource states in the
Qualcomm DWC3 USB controller driver. On platforms
like sa8255p, where controller resources are abstracted
and managed collectively by firmware, the driver communicates
power management transitions using dedicated resource state
levels via dev_pm_opp_set_level().

Macros are introduced to represent key lifecycle events:
initialization, system and runtime suspend/resume, and exit.
The driver sets the appropriate resource state during probe,
remove, suspend, and resume operations, enabling bulk ON/OFF
transitions of grouped resources according to the
controller's operational state.

Signed-off-by: Sriram Dash <sriram.dash@oss.qualcomm.com>
Co-developed-by: Shazad Hussain <shazad.hussain@oss.qualcomm.com>
Signed-off-by: Shazad Hussain <shazad.hussain@oss.qualcomm.com>
---
 drivers/usb/dwc3/dwc3-qcom.c | 97 ++++++++++++++++++++++++++++++++++++++++----
 1 file changed, 88 insertions(+), 9 deletions(-)

diff --git a/drivers/usb/dwc3/dwc3-qcom.c b/drivers/usb/dwc3/dwc3-qcom.c
index 9ac75547820d..9615ca6cfcae 100644
--- a/drivers/usb/dwc3/dwc3-qcom.c
+++ b/drivers/usb/dwc3/dwc3-qcom.c
@@ -13,6 +13,8 @@
 #include <linux/kernel.h>
 #include <linux/interconnect.h>
 #include <linux/platform_device.h>
+#include <linux/pm_domain.h>
+#include <linux/pm_opp.h>
 #include <linux/phy/phy.h>
 #include <linux/usb/of.h>
 #include <linux/reset.h>
@@ -85,10 +87,48 @@ struct dwc3_qcom {
 	struct icc_path		*icc_path_apps;
 
 	enum usb_role		current_role;
+	bool			fw_managed;
 };
 
 #define to_dwc3_qcom(d) container_of((d), struct dwc3_qcom, dwc)
 
+/*
+ * QCOM DWC3 USB Controller: Firmware-Managed Resource State Levels
+ *
+ * On select Qualcomm platforms, the USB controller’s power-related
+ * resources including GDSC, reset lines, clocks, and interconnects
+ * are managed collectively by system firmware via SCMI. The driver
+ * signals the controller’s operational state to firmware using these
+ * levels, each mapped to a specific power management transition or
+ * lifecycle event:
+ *
+ * DWC3_QCOM_FW_MANAGED_INIT
+ *	Enable GDSC, Assert and Deassert Resets, and turn ON all clocks
+ *	and interconnects.
+ *
+ * DWC3_QCOM_FW_MANAGED_SYSTEM_RESUME
+ *	Enable GDSC and turn ON all clocks and interconnects.
+ *
+ * DWC3_QCOM_FW_MANAGED_RUNTIME_RESUME
+ *	Turn ON all clocks and interconnects.
+ *
+ * DWC3_QCOM_FW_MANAGED_EXIT
+ *	Turn OFF all clocks and interconnects, Assert reset and disable GDSC.
+ *
+ * DWC3_QCOM_FW_MANAGED_SYSTEM_SUSPEND
+ *	Turn OFF all clocks and interconnects and disable GDSC.
+ *
+ * DWC3_QCOM_FW_MANAGED_RUNTIME_SUSPEND
+ *	Turn OFF clocks and interconnects.
+ */
+
+#define DWC3_QCOM_FW_MANAGED_INIT			1
+#define DWC3_QCOM_FW_MANAGED_SYSTEM_RESUME		2
+#define DWC3_QCOM_FW_MANAGED_RUNTIME_RESUME		3
+#define DWC3_QCOM_FW_MANAGED_EXIT			8
+#define DWC3_QCOM_FW_MANAGED_SYSTEM_SUSPEND		9
+#define DWC3_QCOM_FW_MANAGED_RUNTIME_SUSPEND		10
+
 static inline void dwc3_qcom_setbits(void __iomem *base, u32 offset, u32 val)
 {
 	u32 reg;
@@ -335,7 +375,7 @@ static void dwc3_qcom_enable_interrupts(struct dwc3_qcom *qcom)
 		dwc3_qcom_enable_port_interrupts(&qcom->ports[i]);
 }
 
-static int dwc3_qcom_suspend(struct dwc3_qcom *qcom, bool wakeup)
+static int dwc3_qcom_suspend(struct dwc3_qcom *qcom, bool wakeup, pm_message_t msg)
 {
 	u32 val;
 	int i, ret;
@@ -348,6 +388,13 @@ static int dwc3_qcom_suspend(struct dwc3_qcom *qcom, bool wakeup)
 		if (!(val & PWR_EVNT_LPM_IN_L2_MASK))
 			dev_err(qcom->dev, "port-%d HS-PHY not in L2\n", i + 1);
 	}
+	if (qcom->fw_managed) {
+		if (PMSG_IS_AUTO(msg))
+			dev_pm_opp_set_level(qcom->dev, DWC3_QCOM_FW_MANAGED_RUNTIME_SUSPEND);
+		else
+			dev_pm_opp_set_level(qcom->dev, DWC3_QCOM_FW_MANAGED_SYSTEM_SUSPEND);
+	}
+
 	clk_bulk_disable_unprepare(qcom->num_clocks, qcom->clks);
 
 	ret = dwc3_qcom_interconnect_disable(qcom);
@@ -369,7 +416,7 @@ static int dwc3_qcom_suspend(struct dwc3_qcom *qcom, bool wakeup)
 	return 0;
 }
 
-static int dwc3_qcom_resume(struct dwc3_qcom *qcom, bool wakeup)
+static int dwc3_qcom_resume(struct dwc3_qcom *qcom, bool wakeup, pm_message_t msg)
 {
 	int ret;
 	int i;
@@ -380,6 +427,18 @@ static int dwc3_qcom_resume(struct dwc3_qcom *qcom, bool wakeup)
 	if (dwc3_qcom_is_host(qcom) && wakeup)
 		dwc3_qcom_disable_interrupts(qcom);
 
+	if (qcom->fw_managed) {
+		if (PMSG_IS_AUTO(msg))
+			ret = dev_pm_opp_set_level(qcom->dev, DWC3_QCOM_FW_MANAGED_RUNTIME_RESUME);
+		else
+			ret = dev_pm_opp_set_level(qcom->dev, DWC3_QCOM_FW_MANAGED_SYSTEM_RESUME);
+
+		if (ret < 0) {
+			dev_err(qcom->dev, "Failed to Resume fw managed device\n");
+			return ret;
+		}
+	}
+
 	ret = clk_bulk_prepare_enable(qcom->num_clocks, qcom->clks);
 	if (ret < 0)
 		return ret;
@@ -624,10 +683,18 @@ static int dwc3_qcom_probe(struct platform_device *pdev)
 
 	qcom->dev = &pdev->dev;
 
+	qcom->fw_managed = device_get_match_data(dev);
+	if (qcom->fw_managed) {
+		ret = dev_pm_opp_set_level(qcom->dev, DWC3_QCOM_FW_MANAGED_INIT);
+		if (ret < 0)
+			return ret;
+	}
+
 	qcom->resets = devm_reset_control_array_get_optional_exclusive(dev);
 	if (IS_ERR(qcom->resets)) {
-		return dev_err_probe(&pdev->dev, PTR_ERR(qcom->resets),
-				     "failed to get resets\n");
+		dev_err_probe(&pdev->dev, PTR_ERR(qcom->resets),
+			      "failed to get resets\n");
+		goto resources_off;
 	}
 
 	ret = devm_clk_bulk_get_all(&pdev->dev, &qcom->clks);
@@ -638,7 +705,7 @@ static int dwc3_qcom_probe(struct platform_device *pdev)
 	ret = reset_control_assert(qcom->resets);
 	if (ret) {
 		dev_err(&pdev->dev, "failed to assert resets, err=%d\n", ret);
-		return ret;
+		goto resources_off;
 	}
 
 	usleep_range(10, 1000);
@@ -727,6 +794,10 @@ static int dwc3_qcom_probe(struct platform_device *pdev)
 clk_disable:
 	clk_bulk_disable_unprepare(qcom->num_clocks, qcom->clks);
 
+resources_off:
+	if (qcom->fw_managed)
+		dev_pm_opp_set_level(qcom->dev, DWC3_QCOM_FW_MANAGED_EXIT);
+
 	return ret;
 }
 
@@ -739,6 +810,10 @@ static void dwc3_qcom_remove(struct platform_device *pdev)
 		return;
 
 	dwc3_core_remove(&qcom->dwc);
+
+	if (qcom->fw_managed)
+		dev_pm_opp_set_level(qcom->dev, DWC3_QCOM_FW_MANAGED_EXIT);
+
 	clk_bulk_disable_unprepare(qcom->num_clocks, qcom->clks);
 	dwc3_qcom_interconnect_exit(qcom);
 
@@ -756,7 +831,7 @@ static int dwc3_qcom_pm_suspend(struct device *dev)
 	if (ret)
 		return ret;
 
-	ret = dwc3_qcom_suspend(qcom, wakeup);
+	ret = dwc3_qcom_suspend(qcom, wakeup, PMSG_SUSPEND);
 	if (ret)
 		return ret;
 
@@ -772,7 +847,7 @@ static int dwc3_qcom_pm_resume(struct device *dev)
 	bool wakeup = device_may_wakeup(dev);
 	int ret;
 
-	ret = dwc3_qcom_resume(qcom, wakeup);
+	ret = dwc3_qcom_resume(qcom, wakeup, PMSG_RESUME);
 	if (ret)
 		return ret;
 
@@ -809,7 +884,7 @@ static int dwc3_qcom_runtime_suspend(struct device *dev)
 	if (ret)
 		return ret;
 
-	return dwc3_qcom_suspend(qcom, true);
+	return dwc3_qcom_suspend(qcom, true, PMSG_AUTO_SUSPEND);
 }
 
 static int dwc3_qcom_runtime_resume(struct device *dev)
@@ -818,7 +893,7 @@ static int dwc3_qcom_runtime_resume(struct device *dev)
 	struct dwc3_qcom *qcom = to_dwc3_qcom(dwc);
 	int ret;
 
-	ret = dwc3_qcom_resume(qcom, true);
+	ret = dwc3_qcom_resume(qcom, true, PMSG_AUTO_RESUME);
 	if (ret)
 		return ret;
 
@@ -839,6 +914,10 @@ static const struct dev_pm_ops dwc3_qcom_dev_pm_ops = {
 };
 
 static const struct of_device_id dwc3_qcom_of_match[] = {
+	{
+		.compatible	= "qcom,snps-dwc3-fw-managed",
+		.data		= (void *)true,
+	},
 	{ .compatible = "qcom,snps-dwc3" },
 	{ }
 };

-- 
2.34.1


