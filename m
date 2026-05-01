Return-Path: <linux-arm-msm+bounces-105530-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ALomMxbe9Gn8FQIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-105530-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 01 May 2026 19:08:38 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 582BC4AE580
	for <lists+linux-arm-msm@lfdr.de>; Fri, 01 May 2026 19:08:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id B220D30068F2
	for <lists+linux-arm-msm@lfdr.de>; Fri,  1 May 2026 17:07:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1FA69423A81;
	Fri,  1 May 2026 17:06:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OPNOK3Ci";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="G1fKA0Yh"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 231EE421F03
	for <linux-arm-msm@vger.kernel.org>; Fri,  1 May 2026 17:06:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777655207; cv=none; b=rK+/NUVJDYluHstRbNRdkTzBIiEC9SXwlSPOd38KAsOThv2AFcOSX4dOlwe5ASq1xpwsafuKC3X5c1AHO8F4Iu8hZhQyHyrHnPT8wS8pyzn1MWEQAWxkygno95RCx7Hpq7WqPkljrMvhoaRFzmr2OiwSjPi4+3v2wtz9UHd6KNI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777655207; c=relaxed/simple;
	bh=tPwt2zibhZ1iKm71VtuAD4bNx+7+5u8go0KRtNEVjuo=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=G1kQbnEHnelp02gA8GggCceuAQVwlWQi3zuJNN7cwTar7uN00rGFg5k/lrEzJjz+D9cysvJmXuTgmAb0mMlEYe3Db7ouPtgq5t3lgACoOEVHFFyHc09RUaWT9e1mhvrUlpQOeqgPqcqqZNzdKeAwCaTEkaB2+iUmm9hb804CnyU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OPNOK3Ci; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=G1fKA0Yh; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 641GLSeG3938638
	for <linux-arm-msm@vger.kernel.org>; Fri, 1 May 2026 17:06:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=cq08UG3/aul
	dFdZC7DVUavdx4NaeoilYtVujt5rmGXQ=; b=OPNOK3CimXiEbGEZjUOKpAOSdWw
	Mfb/ombr1q1M7DxTQuXVkSOBkmULCglacE3icLJ8wfo1bpO68dnvgwMI3whFTiIj
	Yjm5jEYS3nI3JcGrGckWjkn1l/XEn4acUaxvEmWTGvl9s/i50l+de7fNo6RApcEU
	8hgQJ4SIYC3SjikDLcVJxFx0zAaFhtTib1ttYlTQIMQlQ/t2qO1K3senn57qFwnX
	62EM0f3qcoQsJ2rcSYVFX2Rh86QaEHdpefXYTAbb4RpGWUJHM/eWuaTHRraNEsKl
	hB1W+58/SOSBl6vgoKj+Lwy75//5ItZBpgJcAcPRLtt+RoVvpyEbnTtOLGA==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dvtrn12n9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 01 May 2026 17:06:44 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-2ee34588671so1565465eec.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 01 May 2026 10:06:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777655203; x=1778260003; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cq08UG3/auldFdZC7DVUavdx4NaeoilYtVujt5rmGXQ=;
        b=G1fKA0YhElkNN3qpOkWodjvr72JTM2JZNckk+NJW5Fq1XO3NxVNe8aNkqW4q8+dWMz
         GY1jzJzH50eoWfYO1MI5l4iERjejWmw1/8NxGliGzpi+kedy++En7zeCEEC2Fk4LU5Fl
         YV/KGrbwZgCC0oBV0iifWpXb7zULzqEnC0bVs6/PQ0LnkFvE8SrSwTcnk1CUGuMJHQB+
         9+g2JUDI3Lr/CCkN7nps+aIdeuYnN6e9RwQzfcnrrNOoqGSXW3Nv7HK8sxVLER5oxmlY
         EOeHmmpSeYAb4pobvjldhnyLNE9WfNaPBbrCb+QJQ6QAI4MvDEbP3cfn32JW4SHwEwAM
         s3Dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777655203; x=1778260003;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=cq08UG3/auldFdZC7DVUavdx4NaeoilYtVujt5rmGXQ=;
        b=kMpwS0xvhhPG9KfYqyfJLnQtBHMny2t7rJQK/UU15BOblDn0h8Yaa5MnjZ7DxO6Gvu
         Sd+9ZXdT3uB69quB6c8tRwD4xKRgRFu62L5edltQHUM3EXfJcgjm5VgkAuE87r299XrD
         1zCZ5poTvppICLxBGpLIxnC/OlH4GUZD2YnImeLqSiIp+O02/YiZWwLo6ShZMdUWcg7b
         szpAvgI2JIBJR2xSI9Z86zD8Ww6Y7QSkMo908d3y2SZtOaOhL3Ty1Pa6N5M3eOAZbwuM
         BBoxS4Y0TxFbUAG1KS3/srSAaOK4HKwM6rrYY86RYt3kIS9JcfmAMxhW2magHl0l+Shy
         aWug==
X-Gm-Message-State: AOJu0YzVdSjarkK4qA44o40X87FWD3rxR3PmaPPLXrZpSfSvb/25MLpn
	uhCTBNwnTcjuyebfir6Snbu3sFRtt7DBfvswg9UW4wm5smgoOMOxYkbnEvcAQAPui76gX3ipfc0
	L839gpUGvGqgtnPt4JRMD44Xsa7Mg7N4jy8Pq8O+nmGZ8vWveVJMEiVG6YwZyMthvfxG/
X-Gm-Gg: AeBDieu/l7fWhMXb5ZuOzS/YTSKk3Is1yZeR1mWXMm+8xmBuaT5VKV3cIuNQy1z3cWm
	gVP4vPyAf8dO92u2+jbSxzWlPgNQ3JTwGT0ZQunPq0K+SPiMQXqwIgp+61JUyeDyfDSvRJ93Iff
	YQ1lQeogfNxmOQy+Pwop5XJnJg+z0/T5LWL/pDY8t8+OGS8X1xEc0TAg5uxC2/0Hua8+swZVDWP
	HB8j7OqyZsOWmMpkVI837ZUoEYxWqPmzR/uZo9WMSp75Rbp9G6EqojqHZY2w3b+kjs2Vfa1/4nM
	obAuvKgrcuI+P4CV42Cujl9ltrU355t3dG9+CGJTJQEZx7+AKfXxoiIcIVPj8b8kElSENpqsA3D
	BmRm/qb4HUcL/mbLFQnQO96LKUo0lk116Z84K1sCMzgrLmVkQuvMTn8Z4sMmQ1pm414Wsn0cKVa
	FQOhQOnqAs9g==
X-Received: by 2002:a05:7300:cd95:b0:2ea:cd38:f921 with SMTP id 5a478bee46e88-2efba28ad96mr83663eec.26.1777655203248;
        Fri, 01 May 2026 10:06:43 -0700 (PDT)
X-Received: by 2002:a05:7300:cd95:b0:2ea:cd38:f921 with SMTP id 5a478bee46e88-2efba28ad96mr83638eec.26.1777655202650;
        Fri, 01 May 2026 10:06:42 -0700 (PDT)
Received: from hu-eserrao-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2ee3537d300sm6655978eec.0.2026.05.01.10.06.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 May 2026 10:06:42 -0700 (PDT)
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
Subject: [PATCH v4 6/9] usb: misc: qcom_eud: add host mode coordination
Date: Fri,  1 May 2026 10:06:32 -0700
Message-Id: <20260501170635.2641748-7-elson.serrao@oss.qualcomm.com>
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
X-Proofpoint-ORIG-GUID: q9J7woHU_KU0LXt2PZl4OaGJwo-nbHJR
X-Proofpoint-GUID: q9J7woHU_KU0LXt2PZl4OaGJwo-nbHJR
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTAxMDE2OCBTYWx0ZWRfX0eg/Inf7nZYn
 EMo8y6epYcTNot295PgFizfSrDHvN0g78gq9ypq7ljaRQdaY3dwpHaJc2om7cOTz7iOG3C5MKEg
 dYFrdK0A1btr3+7r5E186TAZH17Bz/xt5Y3xHICl7dkfFiuj/W9e1oK6W+vcREyme3NObUGGMHg
 bTujtrapqD4D3ZWPBLvHqmzVAY5GnAHwvWlXhKGq97XWuAfXL0S8ixkMyY5lJp/5Eys8USZErK3
 QsMKfxHGPBGgDBhMwKy4TWuzxnJEJsd/rWjj4ikaSMQMrVtd7ikJ8jOS1n53k+lfMftEmHma/In
 /MErZHkJvBVlN6zuETyLtUWSYf+Atr2RJd6NI3NQ7CsaKR3kFSiFrCF0EFHWCCc3C2ghKDK9ueE
 w/X64orHPzQv7RzebZ5C8fqtllFxcogP7WrPNxgHMMwd0O/oHkVQDoW668Da6IkWCJPB2Ks9jkm
 MhpQHCW1+asLHif2duA==
X-Authority-Analysis: v=2.4 cv=KrZ9H2WN c=1 sm=1 tr=0 ts=69f4dda4 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=opDcP0t3FEC8bhoQoCgA:9 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-01_04,2026-04-30_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015 priorityscore=1501 bulkscore=0 adultscore=0
 impostorscore=0 phishscore=0 suspectscore=0 lowpriorityscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605010168
X-Rspamd-Queue-Id: 582BC4AE580
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-105530-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[elson.serrao@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	NEURAL_HAM(-0.00)[-0.998];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]

EUD functions by presenting itself as a USB device to the host PC for
debugging, making it incompatible with USB host mode configurations.
Enabling EUD while in host mode can also cause the USB controller to
misbehave, as the EUD hub supports only a single upstream-facing port.

Handle the following scenarios to prevent these conflicts:
1. Prevent the user from enabling EUD via sysfs when the USB port is in
   host mode.
2. Automatically disable EUD when the USB port switches to host mode,
   and re-enable it when exiting host mode.

This ensures consistent state management without creating conflicts
between the EUD debug hub and the USB controller.

Signed-off-by: Elson Serrao <elson.serrao@oss.qualcomm.com>
---
 drivers/usb/misc/qcom_eud.c | 65 ++++++++++++++++++++++++++++++++++++-
 1 file changed, 64 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/misc/qcom_eud.c b/drivers/usb/misc/qcom_eud.c
index f656ffc8818a..4734b6307a85 100644
--- a/drivers/usb/misc/qcom_eud.c
+++ b/drivers/usb/misc/qcom_eud.c
@@ -55,12 +55,15 @@ struct eud_chip {
 	struct device			*dev;
 	void __iomem			*base;
 	struct eud_path			*paths[EUD_MAX_PORTS];
+	/* serializes EUD control operations */
+	struct mutex			state_lock;
 	phys_addr_t			mode_mgr;
 	unsigned int			int_status;
 	int				irq;
 	bool				enabled;
 	bool				usb_attached;
 	bool				phy_enabled;
+	bool				eud_disabled_for_host;
 	u8				port_idx;
 };
 
@@ -156,17 +159,43 @@ static ssize_t enable_store(struct device *dev,
 		const char *buf, size_t count)
 {
 	struct eud_chip *chip = dev_get_drvdata(dev);
+	struct eud_path *path;
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
+		path = chip->paths[chip->port_idx];
+		if (path->curr_role == USB_ROLE_HOST) {
+			dev_err(chip->dev, "cannot enable EUD: USB port is in host mode\n");
+			return -EBUSY;
+		}
+
 		ret = enable_eud(chip);
 		if (ret) {
 			dev_err(chip->dev, "failed to enable eud\n");
@@ -308,9 +337,41 @@ static irqreturn_t handle_eud_irq_thread(int irq, void *data)
 static int eud_role_switch_set(struct usb_role_switch *sw, enum usb_role role)
 {
 	struct eud_path *path = usb_role_switch_get_drvdata(sw);
+	struct eud_chip *chip = path->chip;
 	int ret;
 
-	/* Forward the role request to the USB controller */
+	guard(mutex)(&chip->state_lock);
+
+	/*
+	 * EUD must be disabled when USB operates in host mode. EUD functions by
+	 * presenting itself as a USB device to the host PC for debugging, making
+	 * it incompatible with host mode configuration.
+	 *
+	 * chip->enabled preserves user's sysfs configuration and is not modified
+	 * during host mode transitions to maintain user intent.
+	 */
+
+	/* Only act if EUD is enabled and this is the active path */
+	if (chip->enabled && path->num == chip->port_idx) {
+		if (role == USB_ROLE_HOST && !chip->eud_disabled_for_host) {
+			ret = disable_eud(chip);
+			if (ret) {
+				dev_err(chip->dev, "failed to disable EUD for host mode: %d\n",
+					ret);
+				return ret;
+			}
+			chip->eud_disabled_for_host = true;
+		} else if (role != USB_ROLE_HOST && chip->eud_disabled_for_host) {
+			ret = enable_eud(chip);
+			if (ret) {
+				dev_err(chip->dev, "failed to re-enable EUD after host mode: %d\n",
+					ret);
+				return ret;
+			}
+			chip->eud_disabled_for_host = false;
+		}
+	}
+
 	ret = usb_role_switch_set_role(path->controller_sw, role);
 	if (ret) {
 		dev_err(path->chip->dev, "failed to set role %s for port %u: %d\n",
@@ -424,6 +485,8 @@ static int eud_probe(struct platform_device *pdev)
 
 	chip->dev = &pdev->dev;
 
+	mutex_init(&chip->state_lock);
+
 	for_each_child_of_node_scoped(np, child) {
 		ret = eud_init_path(chip, child);
 		if (ret)
-- 
2.34.1


