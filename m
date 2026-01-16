Return-Path: <linux-arm-msm+bounces-89474-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id DDD14D389BA
	for <lists+linux-arm-msm@lfdr.de>; Sat, 17 Jan 2026 00:21:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 479DE30AF56A
	for <lists+linux-arm-msm@lfdr.de>; Fri, 16 Jan 2026 23:21:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8C892319862;
	Fri, 16 Jan 2026 23:21:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LrmK+vs3";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="BExXGGcL"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC1A431327B
	for <linux-arm-msm@vger.kernel.org>; Fri, 16 Jan 2026 23:21:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768605672; cv=none; b=ogeoGrSYI7qx+bxF+fiufwuD4mVTptSbxqxpmgGaFP8TW8+b8OJHKRJQM/5hiEBfl+Wxx6nfZ2jZRCdnbltXrdYFCHyB205NA91E4e3YEVXyMiPKxAkGhaiRCINzH5OkR8xlY/EikmSV8d2buwV9r06bHnNFfd93aaAj3K1xXeI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768605672; c=relaxed/simple;
	bh=xMUCXc+T1mxqitUAHJsbyD7zN0MBtP33MxPyki89jC0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=MiUD12bqA27zW5z6w9L8sU1xRb7E7PsQD++CaoWuxc+vhRnLKSDSHLSdQXq7CTUaMqwiOYRGmxnrf0xN034RVWlqx7oHw4m3sG2ZPf7wom1oBnCTq9oYCz6rbtqs5SVBzb1Asx3LltmRB6/j3zysm3oMbp1hLGixAo4oCMarirE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LrmK+vs3; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BExXGGcL; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60GNCu0a2132865
	for <linux-arm-msm@vger.kernel.org>; Fri, 16 Jan 2026 23:21:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=X71iaS2pCQJ
	5JwChEZnH7egZFDTUof/Ft5BQu4Wr5X8=; b=LrmK+vs3pl9QnXnAIzwE/KX3U5R
	AA/wRxhoSRzPD6wqNN+jObeSXQZGlyYn/OgYT5zwMkpoSAemPX9kYS6MVQMxJkDt
	CbxR78LmbWNqDwnAwTrQhMPx8DVnh5LSIy3wzNkFj2C5WmhBuTxNth76Bf+stJhB
	JU9RtacdiB4gxwXJKvKRepiGCMDW8uZJ8vYjaBLaH9CHPC060mv9RYdQy2k+vL5H
	cfgOpj5sCVdevmaZjP6hUPHeVXgL/u3an4+4VgmTEpO2B5rcbvmK6AnevQ4IpKJn
	wzB7FXRiRKgTpIan0iAdARsXcSg8qxBTDUW6doMRQ/M2Z1TRhSgBpUp4YSA==
Received: from mail-dl1-f69.google.com (mail-dl1-f69.google.com [74.125.82.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bqveh8bkx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 16 Jan 2026 23:21:10 +0000 (GMT)
Received: by mail-dl1-f69.google.com with SMTP id a92af1059eb24-11b9786fb51so15704056c88.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 16 Jan 2026 15:21:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768605670; x=1769210470; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=X71iaS2pCQJ5JwChEZnH7egZFDTUof/Ft5BQu4Wr5X8=;
        b=BExXGGcLoU4IGJvz+n8upaghoqqbtLKh3CajiIGHVSvWpe+64X79LUYZqu1I1mqYJd
         DSgZRBvnNxiMvFEhv+/DVZfxrm68jxJo6kyntkXdpOJR5Cs1fYFZoA3KQkA7C83NRpys
         RSKaoSrjZqLy1dnnIeK4n5p2org0k9YeUwxy/5LV28MUBC8LVMk4vIg3F1WCd/8W4Lv4
         44tOhf13oR53KLK7vE+avWFXcQXMQT4xTvAuwdp3rWaTh+BbxpdDVfMXEir7z7F8JXtC
         8GODSjaz18u0/0JFq1+q8Ivk/3ZPhJFVbisu3SNDubY92FOCj/Sc3T7woOlqYczsUjOz
         sEGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768605670; x=1769210470;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=X71iaS2pCQJ5JwChEZnH7egZFDTUof/Ft5BQu4Wr5X8=;
        b=Z89vrA4GmbE0X29IC0/AZKKjZTk/iCHlZFci0v6WeGJaEZxSFrfcSu4goY5bAb4RB9
         vwNJMR4uthmnS/HB3gSwE4hpMD0J4uquPr3gUfvQFWQF9NBtWCyhL52GVX7DOZy5JYJ3
         Hdt8YaI6IIycMEbz/TH14dAIhgkWqHE+jCLIV3VqXHHUAWIM4PPJUi6J0AwmwfOsm9WI
         rVaXdrduiyXjYCfZiriiCMQEPUW/41ueK193fEoJX8voUPj3yF1jzLCnoFtNBQ1mNy/c
         MvfdjYIjyCnOcBd126Rjxh04/74e88+oSgykjKFYakXkMKrxNq7RooZszrFMDEJnCg0v
         FOSA==
X-Gm-Message-State: AOJu0YxzqqaTc15fQ66izC9DgKHTfRtnd+ucWLCo9slD+YPNouoLMqry
	GqCLWVdyWqwo2kMDIsDcP5n1f/vSEbEIEPOHNkcmsGTZjTWErwyb4Rb9SB9Fb6wr/6r2Y0ZVn4J
	v7AdUa0JnW/H8+9341RnflMK2D+dJbuiFvwBQ6kDC/eSs3a3vNUhMHeJCDymX3R6gVo62
X-Gm-Gg: AY/fxX5ozLuutoeefqosYvWgcwjW7zfIEZiYsiJTACIDJUHKMatHC4ej/Vg6Lyhn4Ml
	/RK3RHIK7cPva2sBVkDpYeAFMOaxQJYBKyZ2bAVU0XqK+A1RW7HBxDNxb60LUx3epOdABjqEv7P
	UK02KH7xp/6r6QydcC+ZhcFcWeRUSMBT4O7lcIS1KEhKo+JjTjchX7XmApz3XbwAtHVE1o0fYoC
	oyDgrw2EV12nDN1Nv/u1JH/WeMHXKrqgiQAZ65b0mLT59Tj5SfwR+mZQpX+Gy19nlS0OSVORR37
	trglPyiCLP/WCFg/cZSUKgABNgJ840PfpFmbzSjfInHCFQJR4kIYvXxYoxOXMvbSYwtR8k2uHOA
	mKctcMlHoP827/tMLermGAd7MpO+3yuJXhgMFdwAlxlCJp/zuPGclGC5CUltQRws=
X-Received: by 2002:a05:7022:4189:b0:11b:9386:8262 with SMTP id a92af1059eb24-1244a7a547emr3764385c88.47.1768605669568;
        Fri, 16 Jan 2026 15:21:09 -0800 (PST)
X-Received: by 2002:a05:7022:4189:b0:11b:9386:8262 with SMTP id a92af1059eb24-1244a7a547emr3764373c88.47.1768605669044;
        Fri, 16 Jan 2026 15:21:09 -0800 (PST)
Received: from hu-eserrao-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1244af10e21sm4611267c88.16.2026.01.16.15.21.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Jan 2026 15:21:08 -0800 (PST)
From: Elson Serrao <elson.serrao@oss.qualcomm.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Souradeep Chowdhury <quic_schowdhu@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 2/9] usb: misc: qcom_eud: add sysfs attribute for port selection
Date: Fri, 16 Jan 2026 15:20:59 -0800
Message-Id: <20260116232106.2234978-3-elson.serrao@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260116232106.2234978-1-elson.serrao@oss.qualcomm.com>
References: <20260116232106.2234978-1-elson.serrao@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE2MDE3NSBTYWx0ZWRfX503vRnNwoAWY
 4btm5Ko6KqywOKd60kcl9lhq/BCfGDB0ZanvvrgaeK4A74bDpigOBsh6a2EeM81g1jZklPbzXXb
 XSgi4kOtC8upWN3dEqGsy6HngkfaSPz+VqIRg/mfHKm3gQJKDshlUKBRrTYFazcAj24g+5Wd24I
 duyPYkyeLem0udDGrUXPElFDipEB4RKPA2YnfKM1gjmTXLjBKfzciz6fszZq9opVS3JXb1WjsxY
 KgJky3sv6u+vJC71EE4tthkfY0/nnHjBI54mCjrpuH5c9czgktULdzAArAh6LQt2HFCiuh0yDWs
 eYAAy2r5EIuQO2r8IWIlRcA/AjBELa2rSgPME6eUenXuQLEPOYHDquaLtG9utQKSMt5p8WO4wJA
 sPJiF4iOY3TqnjaCxf8DhMoI6zGt5BhFZRJ10qBGssgyZsvDyJnYDOus2kD9KOnzEeAm9PuNBLY
 /7TefY0gSYSGjRdgsbg==
X-Proofpoint-ORIG-GUID: 7Fx0Zn3BCQF0uu_PWDqOS2m9Js-7KXXF
X-Proofpoint-GUID: 7Fx0Zn3BCQF0uu_PWDqOS2m9Js-7KXXF
X-Authority-Analysis: v=2.4 cv=ePgeTXp1 c=1 sm=1 tr=0 ts=696ac7e6 cx=c_pps
 a=kVLUcbK0zfr7ocalXnG1qA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=un400R04Xmhap_XYEvQA:9 a=vr4QvYf-bLy2KjpDp97w:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-16_08,2026-01-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 clxscore=1015 phishscore=0 spamscore=0
 impostorscore=0 malwarescore=0 adultscore=0 priorityscore=1501 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601160175

EUD can be mapped to either the primary USB port or the secondary USB port
depending on the value of the EUD_PORT_SEL register. Add a 'port' sysfs
attribute to allow userspace to select which port EUD should operate on
and update the ABI documentation. This is needed for systems with dual
USB ports where EUD needs to be accessible on either port depending on the
system configuration and use case.

Signed-off-by: Elson Serrao <elson.serrao@oss.qualcomm.com>
---
 Documentation/ABI/testing/sysfs-driver-eud | 16 ++++++++
 drivers/usb/misc/qcom_eud.c                | 43 ++++++++++++++++++++++
 2 files changed, 59 insertions(+)

diff --git a/Documentation/ABI/testing/sysfs-driver-eud b/Documentation/ABI/testing/sysfs-driver-eud
index 2bab0db2d2f0..67223f73ee60 100644
--- a/Documentation/ABI/testing/sysfs-driver-eud
+++ b/Documentation/ABI/testing/sysfs-driver-eud
@@ -7,3 +7,19 @@ Description:
 		EUD based on a 1 or a 0 value. By enabling EUD,
 		the user is able to activate the mini-usb hub of
 		EUD for debug and trace capabilities.
+
+What:		/sys/bus/platform/drivers/qcom_eud/.../port
+Date:		January 2026
+Contact:	Elson Serrao <elson.serrao@oss.qualcomm.com>
+Description:
+		Selects which USB port the Embedded USB Debugger (EUD)
+		is mapped to on platforms providing multiple High-Speed
+		USB ports.
+
+		Valid values:
+		  0 - Primary USB port
+		  1 - Secondary USB port
+
+		The attribute is writable only while EUD is disabled.
+		Reading the attribute returns the currently selected
+		USB port number.
diff --git a/drivers/usb/misc/qcom_eud.c b/drivers/usb/misc/qcom_eud.c
index 926419ca560f..1a136f8f1ae5 100644
--- a/drivers/usb/misc/qcom_eud.c
+++ b/drivers/usb/misc/qcom_eud.c
@@ -23,8 +23,11 @@
 #define EUD_REG_VBUS_INT_CLR	0x0080
 #define EUD_REG_CSR_EUD_EN	0x1014
 #define EUD_REG_SW_ATTACH_DET	0x1018
+#define EUD_REG_PORT_SEL	0x1028
 #define EUD_REG_EUD_EN2		0x0000
 
+#define EUD_MAX_PORTS		2
+
 #define EUD_ENABLE		BIT(0)
 #define EUD_INT_PET_EUD		BIT(0)
 #define EUD_INT_VBUS		BIT(2)
@@ -40,6 +43,7 @@ struct eud_chip {
 	int				irq;
 	bool				enabled;
 	bool				usb_attached;
+	u8				port_idx;
 };
 
 static int enable_eud(struct eud_chip *priv)
@@ -104,8 +108,47 @@ static ssize_t enable_store(struct device *dev,
 
 static DEVICE_ATTR_RW(enable);
 
+static ssize_t port_show(struct device *dev,
+		struct device_attribute *attr, char *buf)
+{
+	struct eud_chip *chip = dev_get_drvdata(dev);
+
+	return sysfs_emit(buf, "%u\n", chip->port_idx);
+}
+
+static ssize_t port_store(struct device *dev,
+		struct device_attribute *attr,
+		const char *buf, size_t count)
+{
+	struct eud_chip *chip = dev_get_drvdata(dev);
+	u8 port;
+	int ret;
+
+	ret = kstrtou8(buf, 0, &port);
+	if (ret)
+		return ret;
+
+	/* Only port 0 and port 1 are valid */
+	if (port >= EUD_MAX_PORTS)
+		return -EINVAL;
+
+	/* Port selection must be done before enabling EUD */
+	if (chip->enabled) {
+		dev_err(chip->dev, "Cannot change port while EUD is enabled\n");
+		return -EBUSY;
+	}
+
+	writel(port, chip->base + EUD_REG_PORT_SEL);
+	chip->port_idx = port;
+
+	return count;
+}
+
+static DEVICE_ATTR_RW(port);
+
 static struct attribute *eud_attrs[] = {
 	&dev_attr_enable.attr,
+	&dev_attr_port.attr,
 	NULL,
 };
 ATTRIBUTE_GROUPS(eud);
-- 
2.34.1


