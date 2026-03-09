Return-Path: <linux-arm-msm+bounces-96359-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4GQ9Ho0vr2nFPQIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-96359-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 09 Mar 2026 21:37:33 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id DA06E240EF9
	for <lists+linux-arm-msm@lfdr.de>; Mon, 09 Mar 2026 21:37:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4DCAA313D73B
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Mar 2026 20:34:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C21F24219F6;
	Mon,  9 Mar 2026 20:33:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="QxPlxkFG";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Oita/X5G"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD06341B369
	for <linux-arm-msm@vger.kernel.org>; Mon,  9 Mar 2026 20:33:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773088433; cv=none; b=SAbL0WZYUafv9rpzPZ4Oncx6e8KNTS4ujr/5Twue/EVYtiEAnXL+lT2dfxZYd8kJ+E9Rbkdy9+sGvsftpqbsjWjcCiNooyR3xIEDSD/KX/CzHJkOWrqEXTBp3qpVct8owsQ9U4jxrfH8p5D34cyHuz5Vlh4EbS4jwnikGLsiNlg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773088433; c=relaxed/simple;
	bh=61qZa5oPb5FYhnLtNGgCYyVGAuKr4dTLYSSjg3McuLM=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=FOUOqzwVI215NAfcD3SNBOoYBR6+e92Sc5FTxYlMbUMKJt+Umlkm36iqDNMIYMqjpG4hwMYEkaVE8ZiM09FD9i+k7OVlyUh7JalVZrbKNFVIUGRL9lVColNGY7Kt/PDN34mWtnT3f/oa1tzTtYtx3eT9eIb68z56utgqqkT9QMI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QxPlxkFG; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Oita/X5G; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 629JGHlF2873091
	for <linux-arm-msm@vger.kernel.org>; Mon, 9 Mar 2026 20:33:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=Vm8K1x7aKvC
	TkjAgk/WSBFUkXkkqg22NG+Ug1hXiRPg=; b=QxPlxkFGkNe4ktku4RmDEu69bww
	VXpqXA3bSn9fwcF43Y3mqlunHUGTqjetTsblclnLh9bh9ynYQBZe/zQXDDyn00H+
	C/6SXRRsS4XWPoJTaW8H3qhjVATATAqeXrScNMOfuh/mZi2426KVKFFnicQHrVWR
	de3/vl5nTtNPYpU5syHgCAo4tBiuBsrafVc80qtKpf0vh9aN7St4TQI/KhKgnMAX
	a3aEyxKFSP1hguIlTumNUHU6xa0kutsWfHSpX2bTv2/bOVPJcoILXCvvAKOBK1Qo
	8CTtCSHaZugORWoe/VrhCTG+Fb5KOapqgkCu1fYsg+y1MlvjNMJOrzRv65g==
Received: from mail-ot1-f71.google.com (mail-ot1-f71.google.com [209.85.210.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ct477g7mr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 09 Mar 2026 20:33:49 +0000 (GMT)
Received: by mail-ot1-f71.google.com with SMTP id 46e09a7af769-7d73c71f9faso17688116a34.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 09 Mar 2026 13:33:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773088429; x=1773693229; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Vm8K1x7aKvCTkjAgk/WSBFUkXkkqg22NG+Ug1hXiRPg=;
        b=Oita/X5GeZBxP2YTLqVdECm1WpEBVLdFu8bR7tA+ayV6QUkLvDiR6GAMl10GczX4lj
         ELaKsO+FR5dI8qg3eImAyYT7X/CBfD0vzAUcEgv0zA1yGeH20E237U8lk3Fh7+eH30SH
         +uy0nD7yAxoZe8RnO1Q2sXGEs+4iHl8+hz+9acgV9nSsWYVXk8eG1G1PNMqyp/O3Mb5f
         h6B8leNjAyollH+6lk4UVHHADGv009IkdYXvQY9mwTPsE4vwbu4dLj5CM3nEWvOigpae
         BQBWaNIQqD7X27BXF16KA6bkS/vm8+VllBFBiyqHijiOu97R102DD8nwuXBllsnb6fXq
         Vb2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773088429; x=1773693229;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Vm8K1x7aKvCTkjAgk/WSBFUkXkkqg22NG+Ug1hXiRPg=;
        b=iaPt/WshnWjCkOkvUg28+EHzEBStThcfaIxli5SvaFRYcMOht6yiIQm/juF/UWBEB9
         C4w40kwz6JgMuG1BOqd+9sF+/nlU0RlDbVBHVE89/2ZTNbJXlcFGCoRsePc+MYEkqaQB
         6CRL6o8IbdVSvq79r5Mh3ALlIpUFMIv/dtYAz3bbaKyAdgUO6Ovd0vY1nddllWmYjvpF
         uVGucIKT99TwAnZveDgHx0ewOMejuWFptV0Iqr5hXUBcUajBQTSDxqAVi18RaEdNinCr
         3Je8cimBOVbILzkltZpgWs7E1IhEUwpuT1i7bMNkcOlKoZNqlITsD0C4p5hWzhqkngXz
         qqLQ==
X-Gm-Message-State: AOJu0YyIex/8fSCxGGIZ/h4MAnwoYU1H+OEPZ5xqI/Uj+HXqfSfoJ3+D
	doDhBnDBEJdPoe65ohBhJXvwHB+bDhs7z2Op3O3ubu6hjx88+XNJiFjNxOGDel1On2ZMfT1mk8f
	LdAbQoYD9nGYbWLbpIfEIvxg+jp9ZkACVbRebd96tQwDJ5iuP4krrZt7Tm9APWpU0mIWX
X-Gm-Gg: ATEYQzyD2G7REpecntuMgKFwHlcrCuwgmNax9Bq94ifmjCrMXHGP2CClqdqS/MJbx9w
	oq8yHUVsuqz6gA5asN+GgH9Zx2aaQDznMGrUUKlkhXhPU56XlLQBdHL8D8B+oCJpQ9S17GNWMD3
	IGoJdTxSu7dlXEttzVt5Wo3YcNYPZJzTEDobF23FQzJU++O0Nxct6om+4cSz57zeMqsyuKfWv74
	IzYTkA9ZjCqCTggZ0pFQisS4CuJ1ekAn4bHi8n/9x72hIZpKDpDUWIwKXG8WCYjLW9QtvwMGy6s
	Pgqc4uIGgOM70xKfcR0ppyft8nPljJv8C0UoowUQs3ukmiUPBXy3L7Kjh84LvUkz65yr8qrcupi
	cyOh37GF3PviT7G62qIUCrbrfLeGfmdi972xNy0mwpsMJ+WjyL2tElEkBriC138WQD1bzxwdkhu
	I=
X-Received: by 2002:a05:6830:f97:b0:7d7:57c4:367b with SMTP id 46e09a7af769-7d757c445b5mr1048631a34.28.1773088428637;
        Mon, 09 Mar 2026 13:33:48 -0700 (PDT)
X-Received: by 2002:a05:6830:f97:b0:7d7:57c4:367b with SMTP id 46e09a7af769-7d757c445b5mr1048615a34.28.1773088428186;
        Mon, 09 Mar 2026 13:33:48 -0700 (PDT)
Received: from hu-eserrao-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7d74885b5a4sm3036494a34.23.2026.03.09.13.33.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Mar 2026 13:33:47 -0700 (PDT)
From: Elson Serrao <elson.serrao@oss.qualcomm.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Souradeep Chowdhury <quic_schowdhu@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH RFC v3 07/10] usb: misc: qcom_eud: add host mode coordination
Date: Mon,  9 Mar 2026 13:33:34 -0700
Message-Id: <20260309203337.803986-8-elson.serrao@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260309203337.803986-1-elson.serrao@oss.qualcomm.com>
References: <20260309203337.803986-1-elson.serrao@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA5MDE4MiBTYWx0ZWRfXxBFExqHydOtS
 7DHcncYwNeUSyfMJsvLK91Glh+CuYGQUbWU4XuEjQvQ5+pKwHROKmXmnGM1T6klO5K0/h/Pi5GS
 SlXfHMJOzF4jQ4WcWu2doFjBxj5L7ZZNGz+8FKB9ChCxOAwltSqW21roJPzFDkebYUph2RhaGhn
 huQrJqAnABAmott1DsKwwJWs2nDca/hG3X0ew2iySM8p8PPxzEkZtqZTSgkrlvtZ9tp2rXLQlZ6
 /rZ9w8aGmn4hrxhvMHKTi1PKOKK0AhF21KJvUKDz+PQbbFh7H81+99xqPptuVewiQUybvQF7v4N
 QizglQ7ivAnVjg0OmfwSgQdo+yBFHPpsvnIOf+t02jilYMxFR3n/1YHyo25b/5/cQJUzykA9LMy
 sWjonKDIBvo/3kZL+9LHwuoactpsHXk/10u21kcxKZbXb2TbgpoWEnEzywLMMdZsii3KqPHtCko
 M+DWrO2/PC2fIEL6Wvg==
X-Proofpoint-GUID: YKBdufoyunTEC9M6g24zZAbr7HEq5HyR
X-Authority-Analysis: v=2.4 cv=KLxXzVFo c=1 sm=1 tr=0 ts=69af2ead cx=c_pps
 a=OI0sxtj7PyCX9F1bxD/puw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=TY8paCK9AY_MSZsb9aIA:9 a=Z1Yy7GAxqfX1iEi80vsk:22
X-Proofpoint-ORIG-GUID: YKBdufoyunTEC9M6g24zZAbr7HEq5HyR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-09_05,2026-03-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 bulkscore=0 impostorscore=0 spamscore=0
 phishscore=0 priorityscore=1501 lowpriorityscore=0 adultscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603090182
X-Rspamd-Queue-Id: DA06E240EF9
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_NEQ_ENVFROM(0.00)[elson.serrao@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-96359-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,qualcomm.com:dkim,qualcomm.com:email];
	RCPT_COUNT_SEVEN(0.00)[11];
	NEURAL_HAM(-0.00)[-1.000];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

EUD functions by presenting itself as a USB device to the host PC for
debugging, making it incompatible with USB host mode configurations.

Handle below two scenarios to prevent these conflicts:
1. Prevent user from enabling EUD via sysfs when the USB port is
   in host mode.
2. Automatically disable EUD when USB port switches to host mode
   and re-enable it when exiting host mode. This is achieved via
   the exported qcom_eud_usb_role_notify() API that allows the USB
   controller driver to notify EUD of role changes.

This ensures consistent state management without creating conflicts
between the EUD debug hub and the USB controller.

Signed-off-by: Elson Serrao <elson.serrao@oss.qualcomm.com>
---
 drivers/usb/misc/qcom_eud.c  | 110 ++++++++++++++++++++++++++++++++++-
 include/linux/usb/qcom_eud.h |  21 +++++++
 2 files changed, 130 insertions(+), 1 deletion(-)
 create mode 100644 include/linux/usb/qcom_eud.h

diff --git a/drivers/usb/misc/qcom_eud.c b/drivers/usb/misc/qcom_eud.c
index 3a71a0d27b5e..e01605e1dac8 100644
--- a/drivers/usb/misc/qcom_eud.c
+++ b/drivers/usb/misc/qcom_eud.c
@@ -12,11 +12,13 @@
 #include <linux/module.h>
 #include <linux/of.h>
 #include <linux/of_graph.h>
+#include <linux/of_platform.h>
 #include <linux/phy/phy.h>
 #include <linux/platform_device.h>
 #include <linux/slab.h>
 #include <linux/sysfs.h>
 #include <linux/usb/role.h>
+#include <linux/usb/qcom_eud.h>
 #include <linux/firmware/qcom/qcom_scm.h>
 
 #define EUD_REG_INT1_EN_MASK	0x0024
@@ -42,11 +44,14 @@ struct eud_chip {
 	struct phy			*phy[EUD_MAX_PORTS];
 	void __iomem			*base;
 	phys_addr_t			mode_mgr;
+	/* serializes EUD control operations */
+	struct mutex			state_lock;
 	unsigned int			int_status;
 	int				irq;
 	bool				enabled;
 	bool				usb_attached;
 	bool				phy_enabled;
+	bool				eud_disabled_for_host;
 	u8				port_idx;
 };
 
@@ -142,17 +147,43 @@ static ssize_t enable_store(struct device *dev,
 		const char *buf, size_t count)
 {
 	struct eud_chip *chip = dev_get_drvdata(dev);
+	enum usb_role role;
 	bool enable;
 	int ret;
 
 	if (kstrtobool(buf, &enable))
 		return -EINVAL;
 
+	guard(mutex)(&chip->state_lock);
+
 	/* Skip operation if already in desired state */
 	if (chip->enabled == enable)
 		return count;
 
+	/*
+	 * Handle double-disable scenario: User is disabling EUD that was already
+	 * disabled due to host mode. Since the hardware is already disabled, we
+	 * only need to clear the host-disabled flag to prevent unwanted re-enabling
+	 * when exiting host mode. This respects the user's explicit disable request.
+	 */
+	if (!enable && chip->eud_disabled_for_host) {
+		chip->eud_disabled_for_host = false;
+		chip->enabled = false;
+		return count;
+	}
+
 	if (enable) {
+		/*
+		 * EUD functions by presenting itself as a USB device to the host PC for
+		 * debugging, making it incompatible with USB host mode configuration.
+		 * Prevent enabling EUD in this configuration to avoid hardware conflicts.
+		 */
+		role = usb_role_switch_get_role(chip->role_sw[chip->port_idx]);
+		if (role == USB_ROLE_HOST) {
+			dev_err(chip->dev, "Cannot enable EUD: USB port is in host mode\n");
+			return -EBUSY;
+		}
+
 		ret = enable_eud(chip);
 		if (ret) {
 			dev_err(chip->dev, "failed to enable eud\n");
@@ -353,6 +384,75 @@ static int eud_parse_dt_port(struct eud_chip *chip, u8 port_id)
 	return 0;
 }
 
+/**
+ * qcom_eud_usb_role_notify - Notify EUD of USB role change
+ * @eud_node: Device node of the EUD device
+ * @phy: HSUSB PHY of the port changing role
+ * @role: New role being set
+ *
+ * Notifies EUD that a USB port is changing roles. EUD will disable itself
+ * if the port is switching to HOST mode, as EUD is incompatible with host
+ * mode operation. This API should be called by the USB controller driver
+ * when it switches the USB role.
+ *
+ * The PHY parameter is used to identify which physical USB port is changing
+ * roles. This is important in multi-port systems where EUD may be active on
+ * one port while another port changes roles.
+ *
+ * This is a best-effort notification - failures are logged but do not affect
+ * the role change operation.
+ */
+void qcom_eud_usb_role_notify(struct device_node *eud_node, struct phy *phy,
+			      enum usb_role role)
+{
+	struct platform_device *pdev;
+	struct eud_chip *chip;
+	int ret;
+
+	if (!of_device_is_compatible(eud_node, "qcom,eud"))
+		return;
+
+	pdev = of_find_device_by_node(eud_node);
+	if (!pdev)
+		return;
+
+	chip = platform_get_drvdata(pdev);
+	if (!chip)
+		goto put_dev;
+
+	mutex_lock(&chip->state_lock);
+
+	/* Only act if this notification is for the currently active EUD port */
+	if (!chip->enabled || chip->phy[chip->port_idx] != phy) {
+		mutex_unlock(&chip->state_lock);
+		goto put_dev;
+	}
+
+	/*
+	 * chip->enabled preserves user's sysfs configuration and is not modified
+	 * during host mode transitions to preserve user intent.
+	 */
+	if (role == USB_ROLE_HOST && !chip->eud_disabled_for_host) {
+		ret = disable_eud(chip);
+		if (ret)
+			dev_err(chip->dev, "Failed to disable EUD for host mode: %d\n", ret);
+		else
+			chip->eud_disabled_for_host = true;
+	} else if (role != USB_ROLE_HOST && chip->eud_disabled_for_host) {
+		ret = enable_eud(chip);
+		if (ret)
+			dev_err(chip->dev, "Failed to re-enable EUD after host mode: %d\n", ret);
+		else
+			chip->eud_disabled_for_host = false;
+	}
+
+	mutex_unlock(&chip->state_lock);
+
+put_dev:
+	platform_device_put(pdev);
+}
+EXPORT_SYMBOL_GPL(qcom_eud_usb_role_notify);
+
 static void eud_role_switch_release(void *data)
 {
 	struct eud_chip *chip = data;
@@ -374,6 +474,8 @@ static int eud_probe(struct platform_device *pdev)
 
 	chip->dev = &pdev->dev;
 
+	mutex_init(&chip->state_lock);
+
 	/*
 	 * Parse the DT resources for primary port.
 	 * This is the default EUD port and is mandatory.
@@ -418,8 +520,14 @@ static void eud_remove(struct platform_device *pdev)
 {
 	struct eud_chip *chip = platform_get_drvdata(pdev);
 
-	if (chip->enabled)
+	platform_set_drvdata(pdev, NULL);
+
+	mutex_lock(&chip->state_lock);
+	if (chip->enabled) {
 		disable_eud(chip);
+		chip->enabled = false;
+	}
+	mutex_unlock(&chip->state_lock);
 
 	device_init_wakeup(&pdev->dev, false);
 	disable_irq_wake(chip->irq);
diff --git a/include/linux/usb/qcom_eud.h b/include/linux/usb/qcom_eud.h
new file mode 100644
index 000000000000..57e86056303c
--- /dev/null
+++ b/include/linux/usb/qcom_eud.h
@@ -0,0 +1,21 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+#ifndef __LINUX_USB_QCOM_EUD_H
+#define __LINUX_USB_QCOM_EUD_H
+
+#include <linux/usb/role.h>
+
+#if IS_ENABLED(CONFIG_USB_QCOM_EUD)
+void qcom_eud_usb_role_notify(struct device_node *eud_node, struct phy *phy,
+			      enum usb_role role);
+#else
+static inline void qcom_eud_usb_role_notify(struct device_node *eud_node, struct phy *phy,
+					    enum usb_role role)
+{
+}
+#endif
+
+#endif /* __LINUX_USB_QCOM_EUD_H */
-- 
2.34.1


