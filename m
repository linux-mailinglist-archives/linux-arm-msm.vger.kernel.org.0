Return-Path: <linux-arm-msm+bounces-68647-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DFA2B21DA6
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 Aug 2025 07:56:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 191D67A3D0D
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 Aug 2025 05:54:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D1AF12DCBE3;
	Tue, 12 Aug 2025 05:55:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="F2fpHsKr"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E871A2367DC
	for <linux-arm-msm@vger.kernel.org>; Tue, 12 Aug 2025 05:55:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754978156; cv=none; b=QG3GjLB/D6Ehs+KwkGoBc6lE3F9R4R9I8EfG75uXezl/zOutldWUR9iH0h3IZz2CDhruF53doMoa5GMS3l+DGIcmqf05TU+y4wj4oweAkXjnDtrPAwp7hTF2GSzxvE3VXBUhhKra0ABaoDXqLDKOZSfy57cJHHUjj4U5H2QwetM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754978156; c=relaxed/simple;
	bh=dsi/nrKzVZMuL/4lw3VF7AO57QYerZ2w9zZyzFIubrU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=NhhmEQYza/DBGP6+112ysUobIbiV2VVfVO+kHtruYXMfLbJmAE5MibYb1jGn2+RG8NviyPH4STUw90Umi0N7Rrlaavz81r6s+nhqq9GE4GpqE8Zy0ZCwSKgoJgZZ2N5n8qRVkdCbFv9nF3Zw7X6OjhU50p64LdhBvrLNl0cg6q4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=F2fpHsKr; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57C4sLAK029604
	for <linux-arm-msm@vger.kernel.org>; Tue, 12 Aug 2025 05:55:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=RDhofFk1RaL
	aCMXm/5C2/6Ncd5FVwO78HtMV84strHE=; b=F2fpHsKrZ+SpHFIvcehGFUDBw/8
	rO1OjG6DNB6SSEPJilxu8KIhEo7Vx4idZxs1Y3brj0m+p05PayVajvT5+bo2NhOw
	lKEpTyqUdo/IbA4jOoH2szaJ4w7lU3evZOYGiiYF2jx0nmsOIfYJgjAGymGMvPzM
	6jAlNmC8P6eEeWwdVJ6FhUEVtKxg2dqC7zbmg3GqL+OMl9ljRyF/Xd2BlJa1nI2W
	jrUdDtjG0HTf4vHu3iRDYeo9rWaOc1MdaqIu3LpzLgYk7vbezzkI2NTvEfjO5WI+
	O17vkyPANCTfe+DIwBA/8wYE164Hz5K4l+LsGEfX2IDlrl1gEnoExQbgj4A==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48dw9sq4we-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 12 Aug 2025 05:55:54 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-b2fa1a84566so4438821a12.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 11 Aug 2025 22:55:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754978153; x=1755582953;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RDhofFk1RaLaCMXm/5C2/6Ncd5FVwO78HtMV84strHE=;
        b=Kp0OAynNqFdHugQEJfTXFz/u6WnmZHlBUpskIC2GE30uA9jWqeiFWIxO0FU4YBSzbx
         SzaScVln9on3kcu6QFbaJB0SaFyN3Y2Hsw2F/NHS9sDCL/qv0LUkq47A6DAcF8r8qKzK
         qdtqXhZa2YfXTb/hWBNnsbbysIze4uBReKI/KbCyypgox1Z78FPEymy5muelLHAR36x4
         K2zN8SoTQmzaw2ec2r754JR3gql9bfXjjyfWJdxw3h94D97NJNmZoCgx0l6W/t6br6A3
         g7OKTlwGOn67d5tiPvqsGptPJ2FD5Q+YEY4DX01DR0g6ZWhkoI01qKnxOahZdLaD2PPl
         aHvA==
X-Gm-Message-State: AOJu0Yx3Yauai3UZev1KNwAR+jm34YIsrs9Nh/DweWfhqjZk2p1Q0nwk
	TmE09KprXFeabtpWffpLoUUxhAnnR9u1g+tw9DcYHLHNfiXCgNxYcAEVtuYoRNapHyE172Tq5TY
	hr4ZWB6WFmQ4MfU8OwunjyeSQYtJgNkLI8XR+ws3LIfZ7Rg8tmeacUlE/44A5ag7qhxsu
X-Gm-Gg: ASbGncs7l/G6pDky0i0RUvwlVGmPZcqbWvi+1rGINJ9Y8eZ+1bUV5791E2bqLwQvaSV
	Xem75KaxujoR7R7HIvLyrpu+fve6xdoZeqsDIBjEfQG4KEmpfKoRaptgEPfWnsADU4/SYZIabL9
	d+SyzA9CwjYH1voPc6hbfHwRynI9B2/zDv40/0e+T4XR86iNIud14tpQYPT7pHbGsYDkEy5wXbE
	lQfnaXEA2v/lG1KIvPWdw+K46DBAXk9vgAuiP0u3WpQVda1p0X5mHQjKlGgoBoYn2FfkAJg9LQZ
	gvJvny4bxCIh17BpxLsd2pxmPXIIvywSomU8IadvOnShV7n2bSDEMuyS++D0Bm3HX+Je7NuYJki
	7ew==
X-Received: by 2002:a17:903:2310:b0:234:c549:da0e with SMTP id d9443c01a7336-242fc38b17emr38062145ad.47.1754978153395;
        Mon, 11 Aug 2025 22:55:53 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEUXSV4SfnNvn0a+id64qRvfkMtF5ROaM/1BIWLKAuVMiWM8QLsNDekNJyRX6dJDVpUjZY89w==
X-Received: by 2002:a17:903:2310:b0:234:c549:da0e with SMTP id d9443c01a7336-242fc38b17emr38061715ad.47.1754978152977;
        Mon, 11 Aug 2025 22:55:52 -0700 (PDT)
Received: from hu-kriskura-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-241d1f0e585sm288585985ad.40.2025.08.11.22.55.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Aug 2025 22:55:52 -0700 (PDT)
From: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
To: Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Mathias Nyman <mathias.nyman@intel.com>,
        Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
Subject: [PATCH v4 1/3] usb: dwc3: core: Introduce glue callbacks for flattened implementations
Date: Tue, 12 Aug 2025 11:25:40 +0530
Message-Id: <20250812055542.1588528-2-krishna.kurapati@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250812055542.1588528-1-krishna.kurapati@oss.qualcomm.com>
References: <20250812055542.1588528-1-krishna.kurapati@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=J+Wq7BnS c=1 sm=1 tr=0 ts=689ad76a cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=9UFxAfr_hboBSpCGZXUA:9
 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-ORIG-GUID: iOLN_6Owbur2YadSzU0cCUMqZIJuTg13
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA5MDAxNSBTYWx0ZWRfX8jdl5XgtidZh
 uTJveWXhJz2AV48ubkZ+o0cncBPOmfHET+ZYGorA7TYMiRFyK7j8RMAipYjDjQW7gVkQBjDU+05
 nPWxtHrgypcc98r28cSSfOm2Ep1eeTER7mgISNvqCe4jxbVahf/7FdF6AAvDzGTSKBRPjUyR1Gh
 Em5/sSVzqJeqMIoZLEnVgu7+WYuOkVvzWy4lZpIZlkEv3e8ieWP5+FFfjImCgnRx7yVxvoPjqJx
 B3bTQS3WCFTSkOTClUWTZ68R0RXondOrEfYgpJMlQmNgWKjhThN8SX3jj2uwdDU+Ml/n6Y/VDR2
 QeGyTj3M3/pN0Op4eh29shKngPDyGKQbeV5HXDYrhTwT6tftGw3SMq2Y8pGcHRPJCCV8lxEJOm2
 yUaR7Ddf
X-Proofpoint-GUID: iOLN_6Owbur2YadSzU0cCUMqZIJuTg13
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-12_02,2025-08-11_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 malwarescore=0 impostorscore=0 bulkscore=0
 phishscore=0 suspectscore=0 spamscore=0 clxscore=1015 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508090015

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

Signed-off-by: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
---
 drivers/usb/dwc3/core.c   |  1 +
 drivers/usb/dwc3/core.h   | 26 ++++++++++++++++++++++++++
 drivers/usb/dwc3/drd.c    |  1 +
 drivers/usb/dwc3/gadget.c |  1 +
 4 files changed, 29 insertions(+)

diff --git a/drivers/usb/dwc3/core.c b/drivers/usb/dwc3/core.c
index 8002c23a5a02..392ba86c69f5 100644
--- a/drivers/usb/dwc3/core.c
+++ b/drivers/usb/dwc3/core.c
@@ -2351,6 +2351,7 @@ static int dwc3_probe(struct platform_device *pdev)
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
index 25db36c63951..999b2e436622 100644
--- a/drivers/usb/dwc3/gadget.c
+++ b/drivers/usb/dwc3/gadget.c
@@ -2658,6 +2658,7 @@ static int dwc3_gadget_run_stop(struct dwc3 *dwc, int is_on)
 		dwc->pullups_connected = false;
 	}
 
+	dwc3_pre_run_stop(dwc, is_on);
 	dwc3_gadget_dctl_write_safe(dwc, reg);
 
 	do {
-- 
2.34.1


