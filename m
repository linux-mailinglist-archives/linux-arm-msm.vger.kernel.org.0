Return-Path: <linux-arm-msm+bounces-96361-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0MJ3IrEvr2nFPQIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-96361-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 09 Mar 2026 21:38:09 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id E9A77240F26
	for <lists+linux-arm-msm@lfdr.de>; Mon, 09 Mar 2026 21:38:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 90D9C3159B63
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Mar 2026 20:34:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3B75541C0BC;
	Mon,  9 Mar 2026 20:33:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="l+K3cJ8C";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="MJ+toy+Y"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCF713ECBDB
	for <linux-arm-msm@vger.kernel.org>; Mon,  9 Mar 2026 20:33:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773088435; cv=none; b=bse5iLr1sLWHRSF2SVQe3oVPwLKpBTpc0IoMqO9JYSAA+Q1lT6yfNbtIXgtaJlNrTm9wTXnp2+bvFYcA1uxfTGx5/t4ehTywM9l3bSxY7cmBio+VH6nfoHyhT3SYh2i9Rew2UvSzGcLi3G1JTa6hc6erDAWfAO17mPnWzu0gxjw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773088435; c=relaxed/simple;
	bh=hBRDrGzZyzQbp0j3/9wGZbipBYnsHW9DmPOsNcq9U+E=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Rn9QHJ4la/KecNAh19S4pl1kjlynyuJe1RWKtF6Y/lXhG6iogmHPj/RiqloEfkP28N565lHqyc4WfQP7p8o8W/UExmqVtld7hlJ8uey8wL6KnpQXi1d+tApd+EHJxTyEYVaNipclfDDfMuhatxf5YmXuBfFOC8+kPRE5koatmXI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=l+K3cJ8C; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MJ+toy+Y; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 629HBsmb859826
	for <linux-arm-msm@vger.kernel.org>; Mon, 9 Mar 2026 20:33:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=m0r0f2DWKHm
	8QlM7U3TX0AkmaU2aSB7RsqthJ3TDCeI=; b=l+K3cJ8Ch3Dz53H6KR3LliIDqTN
	eFWdjHWJpglzmHPhtOetJznivFa88hupgxeKWJNS/b1GaiTNsU61kHmbRTZ7Ok/S
	0s0Y4qihHhb/7OsJkpeMVD441Fc0RXVuX52e1OHlAS9WIyXYuA7w+GfdjZNqqgQM
	zTuGwlPQLAVY2/OYOKg9EAd0/tU3t+xpV8+VHY+yTn4x6vAc1+YEf7PXLyKpOEyQ
	LJagbzQpRqjSdM/RuW/ecsiT0x/ThgNNATqTI0VDKjI5A/orx3pZSnuwCznYzcVF
	m67DVmDVpTq1bJDnno6jNnT2eF1FUf7sSiC3o47KEwjOaYm7YekgF3IgUbw==
Received: from mail-ot1-f69.google.com (mail-ot1-f69.google.com [209.85.210.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4csyhbsa71-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 09 Mar 2026 20:33:50 +0000 (GMT)
Received: by mail-ot1-f69.google.com with SMTP id 46e09a7af769-7d4d4db1523so54438652a34.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 09 Mar 2026 13:33:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773088430; x=1773693230; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=m0r0f2DWKHm8QlM7U3TX0AkmaU2aSB7RsqthJ3TDCeI=;
        b=MJ+toy+Yhy0FOsHEvHFNrKwVWvedyICxzwcc4X8UxeO8a+VXi6cRkauviuO2TeVZzi
         Uj7GHJCpf72l3VzaYjtfyI+7yS0Qp5BIhR396rWTte8n2st7ihrhYMDQ9eQXnWrE+wOO
         0dlVrds97+rL3uOBOO9Yw6HEAo+D3Uh1OwvAzr455oa0XcBfumgerGlMQbTUWYJFYOn+
         Tvz3lKK86nnYv/VDwhGoVnlCnD6LbUAHiE2jhUQngf/mHuNdj7lQDVQha+yck3f0uJ/g
         yLrfa0PM0ZyTSPn19uAf5q6RfD3i/XSNEJyIuOS9TQZcksjC15MVE9AqN1OhZ3rSC0Vn
         5EQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773088430; x=1773693230;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=m0r0f2DWKHm8QlM7U3TX0AkmaU2aSB7RsqthJ3TDCeI=;
        b=pkOkVPhiFJ9EOHc9zj54NTZh/84yd2F/9p3OfEAZP9iC/DRhV3BvH7+MOMfDZdoBOX
         SvF7m29WTJcUq7/v/+jKc6LO+/Pm/BikKZhPuK2sUJ7KIGqFS+tQ0FEW//8HNGRHKqKg
         uXS4BoPeOsjxLPyMH51JAkV4+0aEJxGkl44vvoGIJkjPynLJmoXDcCBr7U2iAQ/lKGf5
         ZT7Nu/XV0HfzsjB90/aWVs9CS9on07+YYLNKzX6ieKX8S50/fXT927IDU6bT+TBfRjcY
         o1ykgv8IGvjkONo0jE6RIybB18aO6QegU7V1Y0l8r++acTU2VI5SsUmi5hCQcNvsre7S
         QPGA==
X-Gm-Message-State: AOJu0YyPCtHNXQVyShf2j4heJ4i+KHzzijTD2SUsNDJ7G2I51GbsWSvk
	/LSYkO7Om4A25bAoz21xWmmx9CP2HGTwk23nk7e6hlLHxz4JlzF2e6Hx+jZ/3+YQLHlF0t+jDYX
	mgftOW3Xv+kq3VR9o7c0IBvM1xtMsKSnAx0aGi2CQl5xGeYe73NNXP0CKaTBBJ1Y/rnX6
X-Gm-Gg: ATEYQzx7TYw7FOQRWOKVHjaaH7EyaI/glf/RRhfCpOzfQzsKy/4FLIhWRiYpmquW4YB
	OeQSduiWcAIPPYGzFoX45gZKeGBj6l4xTi4gKlaXlNvK32X07InK63GN9NyEK0o6wqMrkCgsOXF
	YD17Zi1e8MX+7MVBzpfsvTGSzo6MSTwwBmRnxgL9fkUFClUBfukuRELYopgYLnzg1pDJWrOwUC5
	qkzp7vt0lQmk+Anpi5Bgjkq+EwZ3ZV0RCEg8YKR3GDRIAGPYiU3YG/f2+B8T3PzVZlbRdFcQw4S
	c96BpfGapMTGlLy/IgqNaCwPOt3imF1x6HByINul8RTO6JSMNHCPmcpBmVbnLlss2bJ6ptLmJy1
	wX3eeHrrtb9mk1neg7il5LHUX8mqUXGIIoLq+7uxhuzT1DtFRUr42JrhySwpFDklD0BDV8Kdwp+
	Y=
X-Received: by 2002:a05:6830:67f5:b0:7d7:5113:f83a with SMTP id 46e09a7af769-7d751142e6fmr1974644a34.25.1773088429987;
        Mon, 09 Mar 2026 13:33:49 -0700 (PDT)
X-Received: by 2002:a05:6830:67f5:b0:7d7:5113:f83a with SMTP id 46e09a7af769-7d751142e6fmr1974620a34.25.1773088429634;
        Mon, 09 Mar 2026 13:33:49 -0700 (PDT)
Received: from hu-eserrao-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7d74885b5a4sm3036494a34.23.2026.03.09.13.33.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Mar 2026 13:33:48 -0700 (PDT)
From: Elson Serrao <elson.serrao@oss.qualcomm.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Souradeep Chowdhury <quic_schowdhu@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH RFC v3 08/10] usb: dwc3: qcom: notify EUD driver of role changes
Date: Mon,  9 Mar 2026 13:33:35 -0700
Message-Id: <20260309203337.803986-9-elson.serrao@oss.qualcomm.com>
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
X-Authority-Analysis: v=2.4 cv=Rcmdyltv c=1 sm=1 tr=0 ts=69af2eae cx=c_pps
 a=z9lCQkyTxNhZyzAvolXo/A==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=D7RZ5MMOI3w-WYzWcLoA:9 a=EyFUmsFV_t8cxB2kMr4A:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA5MDE4MiBTYWx0ZWRfX55rFQKLS1QVX
 f9+JPjJBdw1XTAmvmvfK0LpEgakU1bwH56e9cvRHXr3t3ccF0fsJ5NYbnaSh4BPE+WedF7Om85d
 UrzLFoPiFssPcIikB/Kp1GqWLhTY/gfmJcagtpWNuRkKJrgiq3T75X2UC9mR3/nWKRT41R4s0hv
 bjfU55Bw5EKSIrtvRf1thUO95sc9LBlfPkRlgszxNhauzKbevacrQDLhYaWkT1/tMzMMLbvogIe
 HVtwrNvhtizhh0xG5D+0d/TWiMNsWFasMP9JfwlHmHqhvRSx+V1xf4EeE64DURihjEIZfXseLqI
 OnTpxJLanvx6R9/WasvWlt6LSnBmE6a+vklLci+ekuaOLOjUA/mcp/0a8Cz3amzv78VdqvYIOGc
 hCH82izVGEOQOObPOryjhzbYb68Pe40YeEdqIlUyNidmkx4HXopts1rayXSJSl0upPvxmV76ghh
 wtBA2NYlQC89JpK+HcA==
X-Proofpoint-GUID: vUT6YY1xYV8736jl-0fqTTFwCp1FQIK8
X-Proofpoint-ORIG-GUID: vUT6YY1xYV8736jl-0fqTTFwCp1FQIK8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-09_05,2026-03-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 suspectscore=0 spamscore=0 priorityscore=1501
 impostorscore=0 clxscore=1015 bulkscore=0 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603090182
X-Rspamd-Queue-Id: E9A77240F26
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_NEQ_ENVFROM(0.00)[elson.serrao@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-96361-lists,linux-arm-msm=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

The EUD driver needs USB role information to control its operation as
it is incompatible with host mode. Notify the EUD driver when role
changes occur so it can manage its state accordingly.

Signed-off-by: Elson Serrao <elson.serrao@oss.qualcomm.com>
---
 drivers/usb/dwc3/Kconfig     |  1 +
 drivers/usb/dwc3/dwc3-qcom.c | 10 ++++++++++
 2 files changed, 11 insertions(+)

diff --git a/drivers/usb/dwc3/Kconfig b/drivers/usb/dwc3/Kconfig
index 240b15bc52cb..1a2d7c883b50 100644
--- a/drivers/usb/dwc3/Kconfig
+++ b/drivers/usb/dwc3/Kconfig
@@ -132,6 +132,7 @@ config USB_DWC3_QCOM
 	depends on ARCH_QCOM || COMPILE_TEST
 	depends on EXTCON || !EXTCON
 	depends on OF
+	depends on USB_QCOM_EUD || !USB_QCOM_EUD
 	default USB_DWC3
 	help
 	  Some Qualcomm SoCs use DesignWare Core IP for USB2/3
diff --git a/drivers/usb/dwc3/dwc3-qcom.c b/drivers/usb/dwc3/dwc3-qcom.c
index 9ac75547820d..b51fd97521df 100644
--- a/drivers/usb/dwc3/dwc3-qcom.c
+++ b/drivers/usb/dwc3/dwc3-qcom.c
@@ -9,6 +9,7 @@
 #include <linux/clk.h>
 #include <linux/irq.h>
 #include <linux/of_clk.h>
+#include <linux/of_graph.h>
 #include <linux/module.h>
 #include <linux/kernel.h>
 #include <linux/interconnect.h>
@@ -19,6 +20,7 @@
 #include <linux/iopoll.h>
 #include <linux/usb/hcd.h>
 #include <linux/usb.h>
+#include <linux/usb/qcom_eud.h>
 #include "core.h"
 #include "glue.h"
 
@@ -561,6 +563,7 @@ static int dwc3_qcom_setup_irq(struct dwc3_qcom *qcom, struct platform_device *p
 static void dwc3_qcom_set_role_notifier(struct dwc3 *dwc, enum usb_role next_role)
 {
 	struct dwc3_qcom *qcom = to_dwc3_qcom(dwc);
+	struct device_node *eud_node;
 
 	if (qcom->current_role == next_role)
 		return;
@@ -570,6 +573,13 @@ static void dwc3_qcom_set_role_notifier(struct dwc3 *dwc, enum usb_role next_rol
 		return;
 	}
 
+	/* Notify EUD of role change */
+	eud_node = of_graph_get_remote_node(qcom->dev->of_node, 0, -1);
+	if (eud_node) {
+		qcom_eud_usb_role_notify(eud_node, dwc->usb2_generic_phy[0], next_role);
+		of_node_put(eud_node);
+	}
+
 	if (qcom->current_role == USB_ROLE_DEVICE)
 		dwc3_qcom_vbus_override_enable(qcom, false);
 	else if (qcom->current_role != USB_ROLE_DEVICE)
-- 
2.34.1


