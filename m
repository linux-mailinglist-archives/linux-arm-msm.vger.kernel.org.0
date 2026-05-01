Return-Path: <linux-arm-msm+bounces-105528-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AKMEIdbd9Gn0FQIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-105528-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 01 May 2026 19:07:34 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 4370A4AE51B
	for <lists+linux-arm-msm@lfdr.de>; Fri, 01 May 2026 19:07:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 19A4530048DB
	for <lists+linux-arm-msm@lfdr.de>; Fri,  1 May 2026 17:06:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EF9EA4219E3;
	Fri,  1 May 2026 17:06:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="FHoUOpBd";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DreqT4zR"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E884407572
	for <linux-arm-msm@vger.kernel.org>; Fri,  1 May 2026 17:06:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777655203; cv=none; b=FBYhJhtm/E45+3MkyMsUR8o+BW4XSoTsbvHX9HVF+wdvoVdVI2yquWK9B/IsjWOYVYCTL0y2jt5qBU5B6PBA8nJ+3vbGhFV56cQ6cl6SFu15bFQdcoFRByIaZEGMK6HrA57CxFwVNSWgxqMLh3DdlyNz0osaWWzBDYdJVsBKS8U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777655203; c=relaxed/simple;
	bh=WwTmtoZwWYjvV3fuEhiHznZlqQyxogCBBzzvthHXm2Q=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=XqFrItXAPeSRgeTa185c9rpMqRaaUKkFDDfcJct2WyAk6F43MYhbw4s2hl6bGRCW6pDw7uVbVcpOmxnQX+jasH+49NpNzcxj5cyifVUkZrYK2suzszF4Ejyr1hU0BNwqEXUn/Q8TtQIAmq3NlW9BYHyYMZWPcRSRkHqu0O+tRp0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FHoUOpBd; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DreqT4zR; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 641GLTmJ497900
	for <linux-arm-msm@vger.kernel.org>; Fri, 1 May 2026 17:06:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=40HQheDALEN
	WlUv8TyHttMZOpFAwcKS0002ZxXoLW+o=; b=FHoUOpBd/3i8mE0n9mB3qqIsSN2
	yoMlDwqJUI2ZeU53P+o3paChauYIsmsX/Pk+V+sVuzKVrD27Lg1XoKeJmJw92URF
	ueOljx7YrDLbUjCxkCq4BtnyCv7R+VxoMTKloeUK1uM0xQ+SKzOxv6hyMsdvhTVN
	cCSJF4ee6EWflXDtFk/Pfa3wZS4ATbLP/tKiJzCKUW+jPjvAwcybZ27AGCrRaZVf
	f3z8C8i4DOOdJZX6YabqRlB4ZyzTmLCl4U3unbEEJj4MUHO4ZzXpCy+4SeeVl3u5
	oZcE3G6bfxdMlwqkqD+F0dYAYM2FYE+beF8GaOABzSKxDggzT3DYOMUJj2Q==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dvchkbc2m-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 01 May 2026 17:06:41 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-2bdd327d970so1423127eec.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 01 May 2026 10:06:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777655200; x=1778260000; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=40HQheDALENWlUv8TyHttMZOpFAwcKS0002ZxXoLW+o=;
        b=DreqT4zRzTllI8HlykN8xQbq/u6wBBnhN9INbQS09xjSdK3gXJzWuO7rTeEwKIm7Cs
         0Lso9rt0cyzOUqeDveoi/ae0pi5OiXadD7R22ib6r8rueIkVcgkeXVNkleEq4J2Vi1i7
         vJa6fly/ZO0vcojTfbU//CZoSA+2cPCCw2g1HtuvJA6ca4thJR3LDo82pVxmMEFa/noH
         QLN7KTbZLUGArKOLviMVggw+D9nnS3w//Fz2xqeCDIwpfmLIMr7rmRllYScyJROVEffU
         QEmOWBNp1xo3tN7FyCPZiCtEvY4afck9Qa3+Vk8bAfw3FbLH1OQBH3sfIOZOPg5IVAXV
         6kug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777655200; x=1778260000;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=40HQheDALENWlUv8TyHttMZOpFAwcKS0002ZxXoLW+o=;
        b=MVhUdRKDNM1NFNJCRiEbccPqUKhEY5IQTFrgoymwGyZ5wI4snp1HDPUCKD+UPbI1Tj
         nOMA4PNcI+8baM+XPKfGacaCd13cmMNdtYHWNMHqFrslgckfqcyGdK6RE0p+m0Nklfrh
         C4hMQ2Qb53g56um8ruWD6xgdn6pqVptNuHkVyVJDVWlfk4Xuh1XaW0Z5EMyTXxhjtuOi
         KT5A6H9VTMJK4xR+JAlXt+qJj60vGFZRI7kBchihtAedAgTiuvZzpMuxrB1EVm+Sj7/l
         rdvPipYn/4sHLapaltQp3s62d+2KSiyLrbI5l0ZOXmFw/SZ7/tmXN3gEdccqDA0l6/Ze
         PEqg==
X-Gm-Message-State: AOJu0YxCEYtAZrBa8RArHMNuNewvWNrUT6OkmjLfBImpocfu1XB1GgC+
	JX6Kj0E+kS7DGmiNEFqPsCfEFS6OF4hMIdFwFacDtFOqxPVEyJx38Vt+6x1DP1NIdMmGJYVGWFz
	TnYH6yJ4JT11IFhOeCjNvp2/dstBRLksirKvdt0QOo+e6FdB2uGHTRtjbLXU9ZyepKquM
X-Gm-Gg: AeBDiettgAcAJ6d6/KhurvzhxIzIoyAYNA8lQ/XHOnJZYMhzh6x0q3ShhXkebcVHIPN
	P4Who97EVT5G+sAVG45PVzgP3uwxd0O/De07Qpa5b10h3HpQ/ffEyCj2iSJ5JZx7Px5J728ejKS
	n9MoQmVm/qsGuJJG28EnTwYHDHI46B3wpjOboEtzcKu5edxpifMD/X/r6ry2ne5CxD8Du+/K48P
	YrE4FrWi/OsJRGeELFS16ficrw7NJGQYfunCQwqzs8jr0/brN2B0rpHQRN83V5HGOAtZNdgJunG
	ia3/exMwLWLepGZeiiRIBKrrOvbhGY0h9R6RvTQCDau8AO4wCDxAzd0ijcH89t4jlIdXxoT6Eyi
	qelUpPRtuw/c56bX4rHj92h6fbRICjEo9rTZGkCrq1n4ahoXCCbB59+UHGOZJnOT4fLKCaYYLJO
	iDml//CfvvTg==
X-Received: by 2002:a05:7300:7244:b0:2c0:df3b:ec1e with SMTP id 5a478bee46e88-2ed4f1ba5f4mr2969868eec.11.1777655200232;
        Fri, 01 May 2026 10:06:40 -0700 (PDT)
X-Received: by 2002:a05:7300:7244:b0:2c0:df3b:ec1e with SMTP id 5a478bee46e88-2ed4f1ba5f4mr2969845eec.11.1777655199616;
        Fri, 01 May 2026 10:06:39 -0700 (PDT)
Received: from hu-eserrao-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2ee3537d300sm6655978eec.0.2026.05.01.10.06.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 May 2026 10:06:38 -0700 (PDT)
From: Elson Serrao <elson.serrao@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
        Souradeep Chowdhury <quic_schowdhu@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v4 3/9] usb: misc: qcom_eud: add per-path High-Speed PHY control
Date: Fri,  1 May 2026 10:06:29 -0700
Message-Id: <20260501170635.2641748-4-elson.serrao@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260501170635.2641748-1-elson.serrao@oss.qualcomm.com>
References: <20260501170635.2641748-1-elson.serrao@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTAxMDE2OCBTYWx0ZWRfX1uSKHWuwHuJw
 nzvVro+JaURVrIf9txkFE9D7sntlghxeicxJL7SUZ3Aw6rySaSfR56mlfXtC/gLaiW9nwQcgBJp
 QXwAgyYn5RRsQDsBn2QOBmefLImP8KlIhC64++N82t3YO01LiJbix5ZnXol8QPPXLb1wpSFnOhz
 gFJ+Wl2b38WrhuXluJmkB9DNIa+08moZ6GgjvOjOfdB7eSy/DQbmVaN9D+lhuITNNrO0rTwtxR2
 GKxIwYhTCYG77EeT+Jsi0uaIY60xvTjLa9twfqIDJKo0be+BKy9xf5oH203yYyGn07d61nS4KkZ
 JP/EUNEHJAAAhk8Kf2bkekQOdy+qwHKv0fekZ6S/DBUa0OjAYm5vdLAyXVzB/8ll3BUHP4oCuZ0
 Ukgxf8JtSL1hAWSqFt9whrDs0mrRtXek2nkLtVzI3ZwCQoLrFIFOJZBlFHZIyMQaWN0GBYkCybJ
 qd4BMGkY8rQ+G0jvhWg==
X-Authority-Analysis: v=2.4 cv=Zdkt8MVA c=1 sm=1 tr=0 ts=69f4dda1 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=qlyGqpo9vQmvKKGVavcA:9 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-ORIG-GUID: wpIFgH7A4Qd8pO741OeU9c24ts_iM0FW
X-Proofpoint-GUID: wpIFgH7A4Qd8pO741OeU9c24ts_iM0FW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-01_04,2026-04-30_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 spamscore=0 clxscore=1015 lowpriorityscore=0 impostorscore=0
 bulkscore=0 suspectscore=0 malwarescore=0 priorityscore=1501 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605010168
X-Rspamd-Queue-Id: 4370A4AE51B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-105528-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[elson.serrao@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	NEURAL_HAM(-0.00)[-0.998];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]

EUD hardware can support multiple High-Speed USB paths, each routed
through its own PHY. The active path is selected in hardware via the
EUD_PORT_SEL register. As a High-Speed hub, EUD requires access to
the High-Speed PHY associated with the active path. To support this
multi-path capability, the driver must manage PHY resources on a
per-path basis, ensuring that the PHY for the currently selected
path is properly initialized and powered.

This patch restructures the driver to implement per-path PHY management.
The driver now powers the appropriate PHY based on the selected and
enabled UTMI path, ensuring correct operation when EUD is enabled.

Historically, EUD appeared to work on single-path systems because the
USB controller kept the PHY initialized. However, EUD is designed to
operate independently of the USB controller and therefore requires
explicit PHY control for proper operation.

Signed-off-by: Elson Serrao <elson.serrao@oss.qualcomm.com>
---
 drivers/usb/misc/qcom_eud.c | 126 +++++++++++++++++++++++++++++++++++-
 1 file changed, 125 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/misc/qcom_eud.c b/drivers/usb/misc/qcom_eud.c
index 4aa49f0f58c0..a624c44d5d59 100644
--- a/drivers/usb/misc/qcom_eud.c
+++ b/drivers/usb/misc/qcom_eud.c
@@ -11,6 +11,8 @@
 #include <linux/kernel.h>
 #include <linux/module.h>
 #include <linux/of.h>
+#include <linux/of_graph.h>
+#include <linux/phy/phy.h>
 #include <linux/platform_device.h>
 #include <linux/slab.h>
 #include <linux/sysfs.h>
@@ -39,26 +41,84 @@ static const char * const eud_port_names[] = {
 	"secondary",
 };
 
+struct eud_path {
+	struct eud_chip		*chip;
+	struct phy		*phy;
+	u8			num;
+};
+
 struct eud_chip {
 	struct device			*dev;
 	struct usb_role_switch		*role_sw;
 	void __iomem			*base;
+	struct eud_path			*paths[EUD_MAX_PORTS];
 	phys_addr_t			mode_mgr;
 	unsigned int			int_status;
 	int				irq;
 	bool				enabled;
 	bool				usb_attached;
+	bool				phy_enabled;
 	u8				port_idx;
 };
 
+static int eud_phy_enable(struct eud_chip *chip)
+{
+	struct phy *phy;
+	int ret;
+
+	if (chip->phy_enabled)
+		return 0;
+
+	phy = chip->paths[chip->port_idx]->phy;
+
+	ret = phy_init(phy);
+	if (ret) {
+		dev_err(chip->dev, "Failed to initialize USB2 PHY for port %u: %d\n",
+			chip->port_idx, ret);
+		return ret;
+	}
+
+	ret = phy_power_on(phy);
+	if (ret) {
+		dev_err(chip->dev, "Failed to power on USB2 PHY for port %u: %d\n",
+			chip->port_idx, ret);
+		phy_exit(phy);
+		return ret;
+	}
+
+	chip->phy_enabled = true;
+
+	return 0;
+}
+
+static void eud_phy_disable(struct eud_chip *chip)
+{
+	struct phy *phy;
+
+	if (!chip->phy_enabled)
+		return;
+
+	phy = chip->paths[chip->port_idx]->phy;
+
+	phy_power_off(phy);
+	phy_exit(phy);
+	chip->phy_enabled = false;
+}
+
 static int enable_eud(struct eud_chip *priv)
 {
 	int ret;
 
-	ret = qcom_scm_io_writel(priv->mode_mgr + EUD_REG_EUD_EN2, 1);
+	ret = eud_phy_enable(priv);
 	if (ret)
 		return ret;
 
+	ret = qcom_scm_io_writel(priv->mode_mgr + EUD_REG_EUD_EN2, 1);
+	if (ret) {
+		eud_phy_disable(priv);
+		return ret;
+	}
+
 	writel(EUD_ENABLE, priv->base + EUD_REG_CSR_EUD_EN);
 	writel(EUD_INT_VBUS | EUD_INT_SAFE_MODE,
 			priv->base + EUD_REG_INT1_EN_MASK);
@@ -75,6 +135,8 @@ static int disable_eud(struct eud_chip *priv)
 		return ret;
 
 	writel(0, priv->base + EUD_REG_CSR_EUD_EN);
+	eud_phy_disable(priv);
+
 	return 0;
 }
 
@@ -130,6 +192,12 @@ static ssize_t port_store(struct device *dev, struct device_attribute *attr,
 	if (port < 0)
 		return port;
 
+	/* Check if the corresponding path is available */
+	if (!chip->paths[port]) {
+		dev_err(chip->dev, "EUD not supported on selected port\n");
+		return -EOPNOTSUPP;
+	}
+
 	/* Port selection must be done before enabling EUD */
 	if (chip->enabled) {
 		dev_err(chip->dev, "Cannot change port while EUD is enabled\n");
@@ -229,8 +297,54 @@ static void eud_role_switch_release(void *data)
 	usb_role_switch_put(chip->role_sw);
 }
 
+static int eud_init_path(struct eud_chip *chip, struct device_node *np)
+{
+	struct device_node *controller_node;
+	struct eud_path *path;
+	u32 path_num;
+	int ret;
+
+	ret = of_property_read_u32(np, "reg", &path_num);
+	if (ret) {
+		/* Legacy DT uses 'ports' node without 'reg' property; treat as path 0 */
+		if (of_node_name_eq(np, "ports"))
+			path_num = 0;
+		else
+			return dev_err_probe(chip->dev, ret, "unexpected child node '%s'\n",
+					     np->name);
+	}
+
+	if (path_num >= EUD_MAX_PORTS)
+		return dev_err_probe(chip->dev, -EINVAL, "invalid path number: %u (max %d)\n",
+				     path_num, EUD_MAX_PORTS - 1);
+
+	path = devm_kzalloc(chip->dev, sizeof(*path), GFP_KERNEL);
+	if (!path)
+		return -ENOMEM;
+
+	path->chip = chip;
+	path->num = path_num;
+
+	controller_node = of_graph_get_remote_node(np, 0, -1);
+	if (!controller_node)
+		return dev_err_probe(chip->dev, -ENODEV,
+				     "failed to get controller node for path %u\n", path_num);
+
+	path->phy = devm_of_phy_get_by_index(chip->dev, controller_node, 0);
+	of_node_put(controller_node);
+
+	if (IS_ERR(path->phy))
+		return dev_err_probe(chip->dev, PTR_ERR(path->phy),
+				     "failed to get PHY for path %d\n", path_num);
+
+	chip->paths[path_num] = path;
+
+	return 0;
+}
+
 static int eud_probe(struct platform_device *pdev)
 {
+	struct device_node *np = pdev->dev.of_node;
 	struct eud_chip *chip;
 	struct resource *res;
 	int ret;
@@ -241,6 +355,16 @@ static int eud_probe(struct platform_device *pdev)
 
 	chip->dev = &pdev->dev;
 
+	for_each_child_of_node_scoped(np, child) {
+		ret = eud_init_path(chip, child);
+		if (ret)
+			return ret;
+	}
+
+	/* Primary path is mandatory. Secondary is optional */
+	if (!chip->paths[0])
+		return dev_err_probe(chip->dev, -ENODEV, "primary path not found\n");
+
 	chip->role_sw = usb_role_switch_get(&pdev->dev);
 	if (IS_ERR(chip->role_sw))
 		return dev_err_probe(chip->dev, PTR_ERR(chip->role_sw),
-- 
2.34.1


