Return-Path: <linux-arm-msm+bounces-86743-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 8796CCE5427
	for <lists+linux-arm-msm@lfdr.de>; Sun, 28 Dec 2025 18:22:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4C11E303C81A
	for <lists+linux-arm-msm@lfdr.de>; Sun, 28 Dec 2025 17:21:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A8C3B1EFF93;
	Sun, 28 Dec 2025 17:21:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="pZ2pXMZT";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ZTyrCQTI"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3E61227BB5
	for <linux-arm-msm@vger.kernel.org>; Sun, 28 Dec 2025 17:21:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766942468; cv=none; b=NjpARePpWbjeXHMGLAjqWTLpgpVlwGLCZim55bQCbO48AmTiSxHDcoYc2i3lGg8mKAEjKkZ9j/bYz99KyHdfKnwGfi2UAW/M9rboo4OTGvpVnPOKy8A4o3W3UYKwDAdVRyoAhmEUHFq5ycwYUQZRMdutotAossWgtRdybaeXilU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766942468; c=relaxed/simple;
	bh=LHOC90yAoiwemIEAKL3+u1kkTKM+A1ZqtQ5uNG8qwD8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=RAwQARX+kJsC/ybRismN/g6AcYEC2xXIquU6nvaI5P5E8GETQucW4+zRIOP3VbsjI1p4bP9RNVC2jxnU/GMN3kn1XYayExOBt0+hor5FGUMOXQMRFQFLWvraIIhbtaKwLnHod7GWYwAN1qfTS1DHPhUU/Jr9kDsRTpfwI543T0I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pZ2pXMZT; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZTyrCQTI; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BSDTdh62948340
	for <linux-arm-msm@vger.kernel.org>; Sun, 28 Dec 2025 17:21:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	IVcTn3KqGR/L4VgGa1zjn9+vt8y24OHnRTPtAi2BpJg=; b=pZ2pXMZTL/YK8WqE
	Dj74KJaZ8Mj/3oyXl3NgqX2nV80RXCC9TKWYKLDd4N+sl5qUYDuqUpoQYoHygVfj
	0ZdFSDEUpYZ9FZWCmtmxrIfGgM4pflE9q8Pf8zLZkxTsW94Xlne4iN1VcpHIYM+g
	uuWROg/eOhJuF0IuE8C/vj4XVsReNn+K7lKLe/p7ommRYmnz16VAdC7D6zwdx+C/
	SCh1CtMpcwqMpknAPlqOeyPxKBJ5yGGyoXdJ5YBvj3Pe0oqeBtQBayxPnpIjDGJN
	FmP1YH4IGYUImZHLxI8SZs0f9f7+g3HYBPhF6daX+qQsuELscAd6eAQjszbYCAJy
	lhpfZA==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ba87btfs6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 28 Dec 2025 17:21:05 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2a0c495fc7aso126273905ad.3
        for <linux-arm-msm@vger.kernel.org>; Sun, 28 Dec 2025 09:21:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766942465; x=1767547265; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IVcTn3KqGR/L4VgGa1zjn9+vt8y24OHnRTPtAi2BpJg=;
        b=ZTyrCQTIV6mEv7sa93/Qv1YeJzKJ3a7/9DhMPMbqYKjFf4i6K80/fPsQZiePjNHv+L
         NtfOkrwmXDnwmUNlmaUX4MUinBGzIY4phMYWcfASXlXll3F+Lnfk8Eg7XQ/O8xEJqFB9
         ffsNcEG2r/18Z9WNm5MdO4CSHGpoMXI2NcRHirfjl7Vsco/sU3ZZtMuvPav6Njku3JlG
         yEQa9M29r4whRSyaEesIJy/381Z58zo5qwCzDGSQ7J5VjuOrvOBKAL4AaSqQfFgL1n9b
         M+QfBDdeMuUsmHKBPN1ReG7LmY/6I+tUsTewdXuBsK3Q6NKAPCL/rzIGuhnXeNJnCSUW
         CKwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766942465; x=1767547265;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=IVcTn3KqGR/L4VgGa1zjn9+vt8y24OHnRTPtAi2BpJg=;
        b=d1WxlbGP5c13uwMBoDKXwaGGIvEFXVW45IwvvFCzTJHbxgcpOX8Rm0P0CMx4Tqr7DD
         tE21dg7neoIPVqgTomU/Mj3zQ0wus0NTeV5uGE7QAS5s0vQf/otaIVXbY2RN6SGIOuT2
         Wl/OiN1WeXFJr5cXpFSRX/ZHF/TZ1XgKWk7SDknfxqgjAp4voKdLRjqlEpLUczZst+nL
         d2I90vviXOS1dFcIt1xncHnAQjvEqtZKJF+txWRfzjmAs0KzIW0QNm/KQgWDmLc3vNkw
         7sm8vGB7DbyOEyYjuW95AeEQy5lzBeKVeP3aZ3j95rN7tBvDmSWT9SfPxx56q8s0RSs0
         ukyw==
X-Forwarded-Encrypted: i=1; AJvYcCUpZsffN+0yHXjBksjtWgE8nhfxqPQjU3UnfiH6/R10cOIIE4ZMkforg4Vh+AsahmRedOy8AQPhFf0GKwqz@vger.kernel.org
X-Gm-Message-State: AOJu0YwRnew34g5oqVfZqortJ5xLVncIXsUx2DJfPwlTvc1k81krmsyn
	qTdUP3EAuBguq3ShiTsmxY5ZPMt2NOhLeWWoX39oRJmOMGN5QxsB5tAL56i0knN7YYE15pN6Le8
	wgM+X7tqjAKlFLMBxJyg0iGIudHiKR8LDKGSbdf4Gyp/7gVDiBqrI2uWbSiZczD/HyirYQKBxkp
	GY
X-Gm-Gg: AY/fxX61jGH/JbJlTW0EUICAWL/gfLDG1L08pC54ndWcaaPDHWS65cj+/SO+Fhfy34I
	PCKMs+VzS4hIf2TJZ6nU9+AS9STVK+5KgdiywriaoTJyAxkLpwi6UsUAopALYpZ3JNArpkLmYAA
	Dxz1BZvvcl+pE9iCIKYMpEZHPDfB45t62BtTcA/yK+F3PAV0Kjzkokh3FAokzWY06p0wgVVD82q
	gYNnl6A2QF1PozOqNWMmq5VPvnlR1TTkJlbdJfHuaP2uDemmn7MqzoRot5eQckBvLeTNeYRSmU2
	KVzqpScwLRj56GJo5tFqnJpyxQ1b2t35e72Poa05d1y99Weef1H7MwsvXfCdBKlxFpbH63K9Pjs
	2xhTwmotH86PONS82i7faha5ZmgfA9BKKfBb+urHknmSprw==
X-Received: by 2002:a17:902:f68b:b0:2a0:afeb:fbb6 with SMTP id d9443c01a7336-2a2f2202efbmr247419165ad.8.1766942464907;
        Sun, 28 Dec 2025 09:21:04 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHvLWJGvwwSQTUevMZQ5PBmpbNhxoSUnp1idgws9zQOSNVHlKUJTahTxvetNh17hCPL7TDtLg==
X-Received: by 2002:a17:902:f68b:b0:2a0:afeb:fbb6 with SMTP id d9443c01a7336-2a2f2202efbmr247418855ad.8.1766942464387;
        Sun, 28 Dec 2025 09:21:04 -0800 (PST)
Received: from hu-spratap-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a2f3d776ebsm255743965ad.99.2025.12.28.09.20.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Dec 2025 09:21:04 -0800 (PST)
From: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
Date: Sun, 28 Dec 2025 22:50:22 +0530
Subject: [PATCH v19 04/10] firmware: psci: Introduce command-based reset in
 psci_sys_reset
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251228-arm-psci-system_reset2-vendor-reboots-v19-4-ebb956053098@oss.qualcomm.com>
References: <20251228-arm-psci-system_reset2-vendor-reboots-v19-0-ebb956053098@oss.qualcomm.com>
In-Reply-To: <20251228-arm-psci-system_reset2-vendor-reboots-v19-0-ebb956053098@oss.qualcomm.com>
To: Lorenzo Pieralisi <lpieralisi@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
        Bjorn Andersson <andersson@kernel.org>,
        Sebastian Reichel <sre@kernel.org>, Rob Herring <robh@kernel.org>,
        Sudeep Holla <sudeep.holla@arm.com>,
        Souvik Chakravarty <Souvik.Chakravarty@arm.com>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Andy Yan <andy.yan@rock-chips.com>,
        John Stultz <john.stultz@linaro.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Moritz Fischer <moritz.fischer@ettus.com>,
        Mark Rutland <mark.rutland@arm.com>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>
Cc: Florian Fainelli <florian.fainelli@broadcom.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Andre Draszik <andre.draszik@linaro.org>,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>,
        linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org,
        Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>,
        Srinivas Kandagatla <srini@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1766942426; l=4358;
 i=shivendra.pratap@oss.qualcomm.com; s=20250710; h=from:subject:message-id;
 bh=LHOC90yAoiwemIEAKL3+u1kkTKM+A1ZqtQ5uNG8qwD8=;
 b=sWN6sTNCRcdeGqX6q7zskFmdTLAQicaxMgOh0lxtfbIU8M9y9rQgQsYsISuK6JP1Qm/eaa0cp
 JuLYxzWfqgIDtw8t8c7Ba8IvDrELeHysFF5pou+bwpIA+SelYR8d0P5
X-Developer-Key: i=shivendra.pratap@oss.qualcomm.com; a=ed25519;
 pk=CpsuL7yZ8NReDPhGgq6Xn/SRoa59mAvzWOW0QZoo4gw=
X-Proofpoint-ORIG-GUID: 8V60ZCX0a93pwubyVeg_RBmWfTxX10Ry
X-Proofpoint-GUID: 8V60ZCX0a93pwubyVeg_RBmWfTxX10Ry
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjI4MDE1OCBTYWx0ZWRfX1jypfNl/nxNC
 0MdRVSL7/i4LBYl2pf3KKqTeP0TImZ1fOmuRgzxnfpNvUor4dwGWMLnQAL6Z2OWYXitXZjYIiJ0
 AqKrjNI8Zz5rr3R2GsZ5VqqHdT7Zn6XS7pQ1EG+3ZfxtHnOZtH2P27JZmPz5QmIqGLN5FV7Er7h
 69HxryB7D4XU1WK3aZ4IQMpRmhg8V84puyq6tulEV8hc1eGCNmwsgKdQEtnPTgje1NU5dSMdLq/
 azRjXhEXkXChDdEnlTF5pqOCe0t2Kil4n8LjSTCNU8MzPeJL+cN2dPF1gMzcEPEfB6TrDUJ+rtt
 /fiZ1pDiQ2WtSmbEyLQgOucfXAf5QSjDgNv5/aH2IMRoDSfWnyKiWXXUQtTATcHX3IcortloDZe
 f4dH3O6Wvqv3zxgr75ibGGApfG55ht5p5zTHwfN/hW4FczCcklImmAQHbyRXC9MNCvJuEo5VRO/
 viPhrJw2BmVqmF1z6PA==
X-Authority-Analysis: v=2.4 cv=do7Wylg4 c=1 sm=1 tr=0 ts=69516701 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=eczEI0HPkUfQIoTEgvMA:9
 a=QEXdDO2ut3YA:10 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-28_06,2025-12-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 bulkscore=0 clxscore=1015 lowpriorityscore=0
 adultscore=0 spamscore=0 suspectscore=0 phishscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512280158

PSCI currently supports only COLD reset and ARCH WARM reset based on the
Linux reboot_mode variable. The PSCI specification now includes
SYSTEM_RESET2 for vendor-specific resets, but there's no mechanism to
issue these through psci_sys_reset.

Add a command-based reset mechanism that allows external drivers to set
the psci reset command via a new psci_set_reset_cmd() function.

The psci command-based reset is disabled by default and the
psci_sys_reset follows its original flow until a psci_reset command is
set or a kernel panic is in progress.

Signed-off-by: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
---
 drivers/firmware/psci/psci.c | 46 ++++++++++++++++++++++++++++++++++++++++++--
 include/linux/psci.h         |  2 ++
 2 files changed, 46 insertions(+), 2 deletions(-)

diff --git a/drivers/firmware/psci/psci.c b/drivers/firmware/psci/psci.c
index 38ca190d4a22d6e7e0f06420e8478a2b0ec2fe6f..ad7a3267276f9e26740aea99c11f171ac715f9ba 100644
--- a/drivers/firmware/psci/psci.c
+++ b/drivers/firmware/psci/psci.c
@@ -51,6 +51,15 @@ static int resident_cpu = -1;
 struct psci_operations psci_ops;
 static enum arm_smccc_conduit psci_conduit = SMCCC_CONDUIT_NONE;
 
+struct psci_sys_reset_params {
+	u32 system_reset;
+	u32 reset_type;
+	u32 cookie;
+	bool cmd;
+};
+
+static struct psci_sys_reset_params psci_reset;
+
 bool psci_tos_resident_on(int cpu)
 {
 	return cpu == resident_cpu;
@@ -80,6 +89,29 @@ static u32 psci_cpu_suspend_feature;
 static bool psci_system_reset2_supported;
 static bool psci_system_off2_hibernate_supported;
 
+/**
+ * psci_set_reset_cmd - Sets the psci_reset_cmd for command-based
+ * reset which will be used in psci_sys_reset call.
+ *
+ * @cmd_sys_rst2: Set to true for SYSTEM_RESET2 based resets.
+ * @cmd_reset_type: Set the reset_type argument for psci_sys_reset.
+ * @cmd_cookie: Set the cookie argument for psci_sys_reset.
+ */
+void psci_set_reset_cmd(bool cmd_sys_rst2, u32 cmd_reset_type, u32 cmd_cookie)
+{
+	if (cmd_sys_rst2 && psci_system_reset2_supported) {
+		psci_reset.system_reset = PSCI_FN_NATIVE(1_1, SYSTEM_RESET2);
+		psci_reset.reset_type = cmd_reset_type;
+		psci_reset.cookie = cmd_cookie;
+	} else {
+		psci_reset.system_reset = PSCI_0_2_FN_SYSTEM_RESET;
+		psci_reset.reset_type = 0;
+		psci_reset.cookie = 0;
+	}
+	psci_reset.cmd = true;
+}
+EXPORT_SYMBOL_GPL(psci_set_reset_cmd);
+
 static inline bool psci_has_ext_power_state(void)
 {
 	return psci_cpu_suspend_feature &
@@ -309,14 +341,24 @@ static int get_set_conduit_method(const struct device_node *np)
 static int psci_sys_reset(struct notifier_block *nb, unsigned long action,
 			  void *data)
 {
-	if ((reboot_mode == REBOOT_WARM || reboot_mode == REBOOT_SOFT) &&
-	    psci_system_reset2_supported) {
+	if (((reboot_mode == REBOOT_WARM || reboot_mode == REBOOT_SOFT) &&
+	     psci_system_reset2_supported) && (panic_in_progress() || !psci_reset.cmd)) {
 		/*
 		 * reset_type[31] = 0 (architectural)
 		 * reset_type[30:0] = 0 (SYSTEM_WARM_RESET)
 		 * cookie = 0 (ignored by the implementation)
 		 */
 		invoke_psci_fn(PSCI_FN_NATIVE(1_1, SYSTEM_RESET2), 0, 0, 0);
+	} else if (!panic_in_progress() && psci_reset.cmd) {
+		/*
+		 * Commands are being set in psci_set_reset_cmd
+		 * This issues, SYSTEM_RESET2 arch warm reset or
+		 * SYSTEM_RESET2 vendor-specific reset or
+		 * a SYSTEM_RESET cold reset in accordance with
+		 * the reboot-mode command.
+		 */
+		invoke_psci_fn(psci_reset.system_reset, psci_reset.reset_type,
+			       psci_reset.cookie, 0);
 	} else {
 		invoke_psci_fn(PSCI_0_2_FN_SYSTEM_RESET, 0, 0, 0);
 	}
diff --git a/include/linux/psci.h b/include/linux/psci.h
index 4ca0060a3fc42ba1ca751c7862fb4ad8dda35a4c..d13ceca88eab8932894051e7c86e806c2ad8a73a 100644
--- a/include/linux/psci.h
+++ b/include/linux/psci.h
@@ -45,8 +45,10 @@ struct psci_0_1_function_ids get_psci_0_1_function_ids(void);
 
 #if defined(CONFIG_ARM_PSCI_FW)
 int __init psci_dt_init(void);
+void psci_set_reset_cmd(bool cmd_sys_rst2, u32 cmd_reset_type, u32 cmd_cookie);
 #else
 static inline int psci_dt_init(void) { return 0; }
+static inline void psci_set_reset_cmd(bool cmd_sys_rst2, u32 cmd_reset_type, u32 cmd_cookie) { }
 #endif
 
 #if defined(CONFIG_ARM_PSCI_FW) && defined(CONFIG_ACPI)

-- 
2.34.1


