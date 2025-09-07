Return-Path: <linux-arm-msm+bounces-72440-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BC170B47CC2
	for <lists+linux-arm-msm@lfdr.de>; Sun,  7 Sep 2025 20:14:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 23BA93BDE25
	for <lists+linux-arm-msm@lfdr.de>; Sun,  7 Sep 2025 18:14:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 726DE29BDAD;
	Sun,  7 Sep 2025 18:14:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="aQqyvQc0"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB41E29ACD7
	for <linux-arm-msm@vger.kernel.org>; Sun,  7 Sep 2025 18:14:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757268867; cv=none; b=m1lqXu5f+SieprzWT4+ZVWA1ZbkvcV1hDyYMy6SwxyI4rMET02gGf9NZtqqnhHnQgK16yRCorrsRnAsg8sbBuw/Av5pBA7ULbx9xh13o2nwis073RnLJoMHSHbVjQC5jA4OgqeVZfMRH+QbZuheJm1kPYOyoVLst+kZ7ACTdH5E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757268867; c=relaxed/simple;
	bh=FWBE8TbnpDoILTgny5SLZBpQh7y0VgQZiXP6ZqS4dy4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=rVqVZHsJpVREG0yXlzgwVBpg3rzsum2uLijDohgC/tox9hwA7dhNNjwDXP3dvCWCHdKq6oGuS/wN7rxyxa2ChuW+d7kDaQ/a3NmCadDZ7h8n7Vn7mPno4JLoR4tjLZcuyijEoXjnb8WbrLjSiJ2UrWYY6sXTnzbmwdRpEw+jp5s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=aQqyvQc0; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 587DirsD013387
	for <linux-arm-msm@vger.kernel.org>; Sun, 7 Sep 2025 18:14:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=zXbvHhAHt3e
	XLIh4fGNwnDZCLikwnim4WFNUvEbF34I=; b=aQqyvQc0HXfZCig0yNWtZPUzqtV
	XRX51ydJPaziJ4FujVFMTVQ7z7X+ZOEZhyKz1Rflhul7xtyzBNBPxoeIvfpLVij/
	/ktL6/Ey6vFSljnVqj+uAOhHa/BK+L2D1ddSLw2GrWq5oXd+C5/D7i96E/Tz/8Ck
	4MIUsq3ifXW1DWM2AWHvepeSV4oeWF3c8ZxnVw8CBZ8wVwsxvQdUo9yuRibLDtGk
	9Ks+bDko+jCpJDJQsKO8Iqpm1s44brak2bSY6pNKYaO3voDOQWTKc5SK053Tg3Nq
	kRftvkvhRcX4pyiOFRGuTQY6KzIuYCLx47HbGXPoMbPslFHG4sFlFs2ewMA==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 490c9j2gf3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 07 Sep 2025 18:14:24 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-24b18ad403eso38196475ad.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 07 Sep 2025 11:14:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757268863; x=1757873663;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zXbvHhAHt3eXLIh4fGNwnDZCLikwnim4WFNUvEbF34I=;
        b=u/16LNOp2UP+ydNjyWXwDslSxU/1wBybKmFh/Fza3MnIYeoCp7sp7Xi4tRjYcK3hku
         yafSgrKgBxzDJN8dXVyh/jGvaKaQeIbgE1+fOkPgrOxS30iRG1b+67lqaND7E071dM/G
         EjIQ1Lv/IzRLos+TNoKnK94QDwab+10eJKaxi0akZyhQtOHDYJt9n0jpNeiYQofSUEI1
         JKxe5ww2GozFD9vo7Ja7ly/okGuZzkURBvYW77Jt4/x45KFJGTesjGFXyETibYbIEuI5
         /Gxt6bf/MiLXU31St0A+2GSvbT4MYZrJ7TZpIIgZs54IJz2xMYsqTwl2tEcP6SC7Vv6E
         n0Iw==
X-Gm-Message-State: AOJu0YxYFhkt6RKVHMYARtivzEX9nEK4omhVeyl9D9g80kAIECHXFNoG
	Jl64qyGcdv09zC1VqMHm4nP5skXdPdU9XS6xMsOyZR6axTVdDctLffljy9Nc3o/aqtHvQ1rTtjt
	54racmSj50QIgcVBiFkluMIXpIGDcB5F8fHxfwhgXIboAuvA5iosX7H2TiL7GHELRFEg/
X-Gm-Gg: ASbGncsj7axEeElA48Xk+/qDtQmQKvt8rM4eYd62d0UwCcJcuPSW1QQIiKIni7RmkPW
	Ku0B3X3QXLdRUIZuf3t4rqZZFLstU7l1iOjm9jgZPZPESlPAsnA34mScpBbssZQdNy/mtEqNWTA
	9eLZFZyYbgwK4+VX90QAJM218ejvLBCFpcfIvscFKOz6jjYIVDV7b+zu5OZzbzhDnbY/+hhBsmt
	wejDu5+uCZXl6nMg0ixu/ELiIcV/fKuE11NJjy+WBEyZ8uMWkhWddn4Sntqbo0Yl69QA51oJZ1o
	wUeoxzmrNNExsgWteLKtH6vNA+OpyHFNl8PFY0zG+4K4vErJrKRMDdHrCr/0MUz3TC631gJijNG
	BAg==
X-Received: by 2002:a17:903:1905:b0:24b:1585:6350 with SMTP id d9443c01a7336-25175f6e65emr79397095ad.11.1757268863159;
        Sun, 07 Sep 2025 11:14:23 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGfb9X7Y0iEuBI2GhrDyKdeAQMyHma5HcIN4lLPMF+QE9VYRSDXVNdwO2//mXVcLKZed3gAiw==
X-Received: by 2002:a17:903:1905:b0:24b:1585:6350 with SMTP id d9443c01a7336-25175f6e65emr79396855ad.11.1757268862650;
        Sun, 07 Sep 2025 11:14:22 -0700 (PDT)
Received: from hu-kriskura-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-24cde5b6484sm84074765ad.19.2025.09.07.11.14.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Sep 2025 11:14:22 -0700 (PDT)
From: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
To: Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org, dmitry.baryshkov@oss.qualcomm.com,
        konrad.dybcio@oss.qualcomm.com,
        Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
Subject: [PATCH v5 1/2] usb: dwc3: core: Introduce glue callbacks for flattened implementations
Date: Sun,  7 Sep 2025 23:44:11 +0530
Message-Id: <20250907181412.2174616-2-krishna.kurapati@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250907181412.2174616-1-krishna.kurapati@oss.qualcomm.com>
References: <20250907181412.2174616-1-krishna.kurapati@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA2MDAyMiBTYWx0ZWRfX8/9OxE/QMGij
 DVJBisBUhtTYj5yF+U12megLyGmEdba6aZt9VBmUX0TC1gGpSexDXgyXfF+jY5AmCyrNi/Ju+dm
 knNnfd4P09j//QQaNtd04mwHPwYl2L7BsqnxDS3PHQ08GXlUS35STGRgCCGq1jvyofch6iRI3Vh
 tnd74oj74pZY65bU7m6uVm7sg6EnOICBWSmPR1jdWzBoyis2yF5DCR9PnNbq2fmOjTeD7W2HHA2
 k8NVHXOwq7eb/d+Igf2+SLX9JosWF1e1vE1ueiIeAEoPr8PWPl6QUf0n0g02JoAyK7yQ0MVILnz
 zWlfJhHML+qy2dBeBbUjH/LxIntrvFZuHs6nkQqxo9qhiz5ZgwypgLTZvZ1ajsRZ3hPHBrH1SEk
 K3Z9k0sK
X-Proofpoint-ORIG-GUID: vmW_Vx8EJuRf77H5oke4quHjjQrkWs9J
X-Authority-Analysis: v=2.4 cv=PpOTbxM3 c=1 sm=1 tr=0 ts=68bdcb80 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=yJojWOMRYYMA:10 a=jIQo8A4GAAAA:8 a=EUspDBNiAAAA:8 a=9UFxAfr_hboBSpCGZXUA:9
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-GUID: vmW_Vx8EJuRf77H5oke4quHjjQrkWs9J
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-07_07,2025-09-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 spamscore=0 bulkscore=0 clxscore=1015
 malwarescore=0 adultscore=0 impostorscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509060022

In certain situations like role switching, the glue layers need to be
informed of these events, so that they can take any necessary action.
But in non-flattened implementations, the glue drivers have no data on
when the core driver probe was successful post invoking of_platform_
populate. Now that the core driver supports flattened implementations
as well, introduce vendor callbacks that can be passed on from glue to
core before invoking dwc3_core_probe.

Introduce callbacks to notify glue layer of role_switch and run_stop
changes. These can be used by flattened implementation of Qualcomm
glue layer to generate connect/disconnect events in controller during
cable connect and run stop modifications by udc in device mode.

Acked-by: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Signed-off-by: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
---
 drivers/usb/dwc3/core.c   |  1 +
 drivers/usb/dwc3/core.h   | 26 ++++++++++++++++++++++++++
 drivers/usb/dwc3/drd.c    |  1 +
 drivers/usb/dwc3/gadget.c |  1 +
 4 files changed, 29 insertions(+)

diff --git a/drivers/usb/dwc3/core.c b/drivers/usb/dwc3/core.c
index 370fc524a468..ae140c356295 100644
--- a/drivers/usb/dwc3/core.c
+++ b/drivers/usb/dwc3/core.c
@@ -2352,6 +2352,7 @@ static int dwc3_probe(struct platform_device *pdev)
 		return -ENOMEM;
 
 	dwc->dev = &pdev->dev;
+	dwc->glue_ops = NULL;
 
 	probe_data.dwc = dwc;
 	probe_data.res = res;
diff --git a/drivers/usb/dwc3/core.h b/drivers/usb/dwc3/core.h
index d5b985fa12f4..a5fc92c4ffa3 100644
--- a/drivers/usb/dwc3/core.h
+++ b/drivers/usb/dwc3/core.h
@@ -992,6 +992,17 @@ struct dwc3_scratchpad_array {
 	__le64	dma_adr[DWC3_MAX_HIBER_SCRATCHBUFS];
 };
 
+/**
+ * struct dwc3_glue_ops - The ops indicate the notifications that
+ *				need to be passed on to glue layer
+ * @pre_set_role: Notify glue of role switch notifications
+ * @pre_run_stop: Notify run stop enable/disable information to glue
+ */
+struct dwc3_glue_ops {
+	void	(*pre_set_role)(struct dwc3 *dwc, enum usb_role role);
+	void	(*pre_run_stop)(struct dwc3 *dwc, bool is_on);
+};
+
 /**
  * struct dwc3 - representation of our controller
  * @drd_work: workqueue used for role swapping
@@ -1012,6 +1023,7 @@ struct dwc3_scratchpad_array {
  * @eps: endpoint array
  * @gadget: device side representation of the peripheral controller
  * @gadget_driver: pointer to the gadget driver
+ * @glue_ops: Vendor callbacks for flattened device implementations.
  * @bus_clk: clock for accessing the registers
  * @ref_clk: reference clock
  * @susp_clk: clock used when the SS phy is in low power (S3) state
@@ -1197,6 +1209,8 @@ struct dwc3 {
 	struct usb_gadget	*gadget;
 	struct usb_gadget_driver *gadget_driver;
 
+	const struct dwc3_glue_ops	*glue_ops;
+
 	struct clk		*bus_clk;
 	struct clk		*ref_clk;
 	struct clk		*susp_clk;
@@ -1614,6 +1628,18 @@ void dwc3_event_buffers_cleanup(struct dwc3 *dwc);
 int dwc3_core_soft_reset(struct dwc3 *dwc);
 void dwc3_enable_susphy(struct dwc3 *dwc, bool enable);
 
+static inline void dwc3_pre_set_role(struct dwc3 *dwc, enum usb_role role)
+{
+	if (dwc->glue_ops && dwc->glue_ops->pre_set_role)
+		dwc->glue_ops->pre_set_role(dwc, role);
+}
+
+static inline void dwc3_pre_run_stop(struct dwc3 *dwc, bool is_on)
+{
+	if (dwc->glue_ops && dwc->glue_ops->pre_run_stop)
+		dwc->glue_ops->pre_run_stop(dwc, is_on);
+}
+
 #if IS_ENABLED(CONFIG_USB_DWC3_HOST) || IS_ENABLED(CONFIG_USB_DWC3_DUAL_ROLE)
 int dwc3_host_init(struct dwc3 *dwc);
 void dwc3_host_exit(struct dwc3 *dwc);
diff --git a/drivers/usb/dwc3/drd.c b/drivers/usb/dwc3/drd.c
index 7977860932b1..4c91240eb429 100644
--- a/drivers/usb/dwc3/drd.c
+++ b/drivers/usb/dwc3/drd.c
@@ -464,6 +464,7 @@ static int dwc3_usb_role_switch_set(struct usb_role_switch *sw,
 		break;
 	}
 
+	dwc3_pre_set_role(dwc, role);
 	dwc3_set_mode(dwc, mode);
 	return 0;
 }
diff --git a/drivers/usb/dwc3/gadget.c b/drivers/usb/dwc3/gadget.c
index 554f997eb8c4..6f18b4840a25 100644
--- a/drivers/usb/dwc3/gadget.c
+++ b/drivers/usb/dwc3/gadget.c
@@ -2662,6 +2662,7 @@ static int dwc3_gadget_run_stop(struct dwc3 *dwc, int is_on)
 		dwc->pullups_connected = false;
 	}
 
+	dwc3_pre_run_stop(dwc, is_on);
 	dwc3_gadget_dctl_write_safe(dwc, reg);
 
 	do {
-- 
2.34.1


