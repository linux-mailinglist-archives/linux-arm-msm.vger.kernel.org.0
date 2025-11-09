Return-Path: <linux-arm-msm+bounces-80873-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D203C4407C
	for <lists+linux-arm-msm@lfdr.de>; Sun, 09 Nov 2025 15:38:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 509674E54DE
	for <lists+linux-arm-msm@lfdr.de>; Sun,  9 Nov 2025 14:38:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 80AF92FE05F;
	Sun,  9 Nov 2025 14:38:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hK7Y9mgw";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Zd7FfbET"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A01432FE048
	for <linux-arm-msm@vger.kernel.org>; Sun,  9 Nov 2025 14:38:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762699104; cv=none; b=dwc3MDNqJ/+jmFe6Z8gYGPycN2+RsfUIDXndv7GCpglDEe7AhiHDwJccTp9aBpUIsZj8SWcMPTG3OLz8qJUqDRPRxF5I2WZuv8rxKMLBCs5xW+vBhOcNOfdu2EjBU8ksteyfP20m80ZdsBJfbTlBb6ggNmKz1yPQ4ZE5y6RKdpA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762699104; c=relaxed/simple;
	bh=4y05tl5JnFA8b6YlLDdx12ZxapyYnXQ2xFk7Mn0seVs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=BPZ3vveIdc0qSLg+MzYCDtoVKTM+cQjdEc4VpBzspcmh54c14MD4hDA22AV315p421WKkKI6sGiKDip6BIDbe3L1yRU4X4qjlwxY35KCIzn9ZBdJ0DLu6rd79i8B4mhaEKn2YpSZdYk8b0Hqh5LyuTTbIHKbCTyShRpPChC7b3Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hK7Y9mgw; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Zd7FfbET; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5A99Ugpc4086987
	for <linux-arm-msm@vger.kernel.org>; Sun, 9 Nov 2025 14:38:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Uo7LT6euvRJruZtdgnGKAy39fSD8X4XwSTTfUk+1bv0=; b=hK7Y9mgwVQzAX85U
	htBJKQO4Xl+Ik2DPsS/62bLQLCpinBmOMA0olTpoJHBT98/mpzhRX7iXO+bP+be5
	RLi7KiUyf06rka11Oc5a1H7xn4mrHdocQgbCtZ0RML03reAV2bSQI7GFhwFrcLat
	7mwZK83txokPi+WOCLM2nFP2N3EtyUBzCKKul0BKbpCMWWdmxMKcIkqTyzU8KHZr
	L8TucMeJEVCz0NyH7g5XSGnMo1ejR1hs1pQwglrhNYXs99Ghay7isbinaZmK6ZPr
	XQaWZr4uiv0XGUoBTuRhxmUS7nKraVgNuEtfg3gsQ0fStAI8kFe88v71CBoaEWlQ
	ZpV3hA==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a9y1h27d1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 09 Nov 2025 14:38:21 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-33d75897745so5092039a91.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 09 Nov 2025 06:38:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1762699101; x=1763303901; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Uo7LT6euvRJruZtdgnGKAy39fSD8X4XwSTTfUk+1bv0=;
        b=Zd7FfbET6k7XCfGOmRVRpf9PVPKSIT3laR2pBURCr465w5DZU7y7Pj84H3PFl8y4is
         hvQqL8cDomQ9ssFTAKS4Yi0HH11qly+ApD19aS+lBUeyB1DH/aDfqtbqa93JCZLr0oX/
         uUD80IUPh8p8UatS2Q7eOKgs8M4mpRYhqpU3TUwChRNVzmg9JHphYTXmy1oyx5Uxe6i0
         aH22CKGcQWoZIwC6etiJ0E6fEJfLQk0Lc/UeocnMOHzy9uGZho70p8WoAwWXrKsKfRSL
         rilvWt3VIn/rtZfqum2C1JvC1MsVvwRc4o1zWtVEwkYh3BOSr+sp4ZCipjtsBb47418d
         Jh8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762699101; x=1763303901;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Uo7LT6euvRJruZtdgnGKAy39fSD8X4XwSTTfUk+1bv0=;
        b=cKp9KPE09aJCg+7/Vgq8lE1hCuNFyOKgUTiFGaj/XRNFdYG5db5K7ED4ICZ+DTxK6v
         gcmXeY/3QEvxgOluMdVX3cKJBqeAe0wQDvZ6NM9nnV+P9iDK1tKo6ZjmkBlTJ+2y8+87
         uDnLPJ1wvoQbaKYNCTD3Lyx3GIuqcfzIfqPj06gjfvfHPDktQaDzm9pECYIuPGKkZF0J
         vmiO6ZP1ZiKLsGgBMfQuJySD1tH6Plj8t+Ri5WVAfNEM5zl6KB4E54cgnA+eC1v8BITc
         QRoZ/tZm/gwy+04dyxTfukwERrOBVl5+nSuT+OjRAABQ2mnEQyExOplPepNITxm065OG
         7s1g==
X-Forwarded-Encrypted: i=1; AJvYcCVvkm/5dbyVFQybdMrnNniDRVqKKtEBWr5UwIw9mwN/1e8kw6nYBvMPdyzqZzHBivIfNxMxRmWUKlBdyhvJ@vger.kernel.org
X-Gm-Message-State: AOJu0Yz67xu4wv1WbSmSo7ahRHHjLIigeQxmrsF66UWnOxlpo2lGvDON
	09ritfcYUuhs5We+a4vlfCZzT4RkB/fGfTWLPaqmtcPm+Z7qalgu6+sA/55JpQJkP+VhFQ24dRN
	epLMffxyHaOdzmhkxX00YWWYvT8QncPtgTkHXHl9dsL5gMHo7VXDNunD6MGquGduSgGvD
X-Gm-Gg: ASbGncshVVOJ6whSQu9NiE6nGbfPwYiqyLeJ1stDhbp+o5shG0B4lBMO1DaRyvMFfQe
	hnT0E9Ix2GvytlgIhePp4eDa3UYpMEwPYEzbPTDBOWbdV/XPRR4Wb128XjSttnJw+lnmJkZ7/3F
	ZqNznxIr7VmN2DeJC1s7hEovgCozzYjk7tQ1Ke4GRRjcorQ6A70AEhfCk1FeMBLnY+2mFNsJXsu
	FUGF9SAw6vGjjRGXstF1l4hppBtCmWUzL9ZaLCgqs/tsQjY9WBvdJNZczYHHQiArbA8nGrt0BWk
	HFQSGkOxpBO3hxlDmdP/GSVmYErq3s8x+4A1IT6chFByGHPNV/mXGKS8VOB3kSYGKqhtWi6a9RR
	Wi8rNKEoqsqIy6tNz8eUwoIICY7Mm/NhXmB4=
X-Received: by 2002:a17:90b:3811:b0:340:29ce:f7fa with SMTP id 98e67ed59e1d1-3436cb7ae1emr7571933a91.7.1762699101154;
        Sun, 09 Nov 2025 06:38:21 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHGnivRRM8Xz3flnELsFAmipMGOzqr6JvqifyyUie4y1Y4jWQDfWv+NfIOTqq8B3YWWPWAf5Q==
X-Received: by 2002:a17:90b:3811:b0:340:29ce:f7fa with SMTP id 98e67ed59e1d1-3436cb7ae1emr7571881a91.7.1762699100638;
        Sun, 09 Nov 2025 06:38:20 -0800 (PST)
Received: from hu-spratap-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-341a68a68e6sm14845401a91.4.2025.11.09.06.38.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Nov 2025 06:38:20 -0800 (PST)
From: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
Date: Sun, 09 Nov 2025 20:07:15 +0530
Subject: [PATCH v17 02/12] power: reset: reboot-mode: Add firmware node
 based registration
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251109-arm-psci-system_reset2-vendor-reboots-v17-2-46e085bca4cc@oss.qualcomm.com>
References: <20251109-arm-psci-system_reset2-vendor-reboots-v17-0-46e085bca4cc@oss.qualcomm.com>
In-Reply-To: <20251109-arm-psci-system_reset2-vendor-reboots-v17-0-46e085bca4cc@oss.qualcomm.com>
To: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Sebastian Reichel <sre@kernel.org>, Rob Herring <robh@kernel.org>,
        Sudeep Holla <sudeep.holla@arm.com>,
        Souvik Chakravarty <Souvik.Chakravarty@arm.com>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Andy Yan <andy.yan@rock-chips.com>,
        Mark Rutland <mark.rutland@arm.com>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        Arnd Bergmann <arnd@arndb.de>, Konrad Dybcio <konradybcio@kernel.org>,
        cros-qcom-dts-watchers@chromium.org, Vinod Koul <vkoul@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        Florian Fainelli <florian.fainelli@broadcom.com>,
        Moritz Fischer <moritz.fischer@ettus.com>,
        John Stultz <john.stultz@linaro.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Krzysztof Kozlowski <krzk@kernel.org>
Cc: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Stephen Boyd <swboyd@chromium.org>,
        Andre Draszik <andre.draszik@linaro.org>,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>,
        linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-arm-msm@vger.kernel.org,
        Elliot Berman <quic_eberman@quicinc.com>,
        Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>,
        Xin Liu <xin.liu@oss.qualcomm.com>,
        Srinivas Kandagatla <srini@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1762699073; l=3351;
 i=shivendra.pratap@oss.qualcomm.com; s=20250710; h=from:subject:message-id;
 bh=4y05tl5JnFA8b6YlLDdx12ZxapyYnXQ2xFk7Mn0seVs=;
 b=vs3wqeUOLeic+1W7I0EI8aB6oJC74eGyyuuemjAP54LQwPmCWoLH5jWQiO+mDhZeRaIXg4SCi
 FrddfqAJhKSDh6WdKIQCfUpid1SYartnJ4tBNv3Sl8dK0paFII8Fg1Z
X-Developer-Key: i=shivendra.pratap@oss.qualcomm.com; a=ed25519;
 pk=CpsuL7yZ8NReDPhGgq6Xn/SRoa59mAvzWOW0QZoo4gw=
X-Proofpoint-ORIG-GUID: GRzExjGpKxjtFCJZbmcYDpp8Kp29U99b
X-Proofpoint-GUID: GRzExjGpKxjtFCJZbmcYDpp8Kp29U99b
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTA5MDEyOSBTYWx0ZWRfX5sJ4kpZwW6XK
 7z+ORmejoJb8pdeAvUhKa8Mc5YaMdi9w54abRWKMjx0qpazxkXk7C28qsoy/PnXnBMpwzePvBqQ
 fQwIhu8mu+RgTK+d/XUiWAWZB+n4yK5Hp3bmEtRkVu8/9HYFD2YMndbiMqv1gEnmqZGbbu6SPyT
 lrsnuOwX06JDsInyvKsQ0RP8CZYLe9mW4id4UWZ2KiyotZ+ZW2QA/QEhpYPY/eYsCcPD6xf7hyv
 Buz7CzSxg4BAkElFkwcqOLnjggu99FKEU0oIy54w6QniiKWyGzyTQR6LJYbVhJqh+jJr+KozDnd
 9gSKZrXNhrysKDF4OF1eaq5nSigwBj/H2OAJU5D8Q3sJl6KXLXdT5aWC7DkqRl8V7A6Ka5RvT2F
 IoJKnzIkb+KX1Dx12BnOvtg8zUE0MA==
X-Authority-Analysis: v=2.4 cv=Xuj3+FF9 c=1 sm=1 tr=0 ts=6910a75d cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=yMQn7kocbCrLHgxSFm0A:9
 a=QEXdDO2ut3YA:10 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-09_06,2025-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 suspectscore=0 spamscore=0 phishscore=0
 malwarescore=0 clxscore=1015 impostorscore=0 lowpriorityscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2511090129

The reboot-mode driver does not have a strict requirement for
device-based registration. It primarily uses the device's of_node
to read mode-<cmd> properties.

Remove the dependency on struct device and introduce support for
firmware node (fwnode) based registration. This enables drivers
that are not associated with a struct device to leverage the
reboot-mode framework.

Signed-off-by: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
---
 drivers/power/reset/reboot-mode.c | 19 ++++++++++++++++---
 include/linux/reboot-mode.h       |  4 +++-
 2 files changed, 19 insertions(+), 4 deletions(-)

diff --git a/drivers/power/reset/reboot-mode.c b/drivers/power/reset/reboot-mode.c
index ac4223794083f36960b2bd37a601b7e1f1872de5..eff60d6e04df2cb84ba59d38512654336f272f8a 100644
--- a/drivers/power/reset/reboot-mode.c
+++ b/drivers/power/reset/reboot-mode.c
@@ -8,10 +8,12 @@
 #include <linux/device.h>
 #include <linux/init.h>
 #include <linux/kernel.h>
+#include <linux/list.h>
 #include <linux/module.h>
 #include <linux/of.h>
 #include <linux/reboot.h>
 #include <linux/reboot-mode.h>
+#include <linux/slab.h>
 
 #define PREFIX "mode-"
 
@@ -67,18 +69,26 @@ static int reboot_mode_notify(struct notifier_block *this,
 /**
  * reboot_mode_register - register a reboot mode driver
  * @reboot: reboot mode driver
+ * @fwnode: Firmware node with reboot-mode configuration
  *
  * Returns: 0 on success or a negative error code on failure.
  */
-int reboot_mode_register(struct reboot_mode_driver *reboot)
+int reboot_mode_register(struct reboot_mode_driver *reboot, struct fwnode_handle *fwnode)
 {
 	struct mode_info *info;
 	struct mode_info *next;
+	struct device_node *np;
 	struct property *prop;
-	struct device_node *np = reboot->dev->of_node;
 	size_t len = strlen(PREFIX);
 	int ret;
 
+	if (!fwnode)
+		return -EINVAL;
+
+	np = to_of_node(fwnode);
+	if (!np)
+		return -EINVAL;
+
 	INIT_LIST_HEAD(&reboot->head);
 
 	for_each_property_of_node(np, prop) {
@@ -168,11 +178,14 @@ int devm_reboot_mode_register(struct device *dev,
 	struct reboot_mode_driver **dr;
 	int rc;
 
+	if (!reboot->dev || !reboot->dev->of_node)
+		return -EINVAL;
+
 	dr = devres_alloc(devm_reboot_mode_release, sizeof(*dr), GFP_KERNEL);
 	if (!dr)
 		return -ENOMEM;
 
-	rc = reboot_mode_register(reboot);
+	rc = reboot_mode_register(reboot, of_fwnode_handle(reboot->dev->of_node));
 	if (rc) {
 		devres_free(dr);
 		return rc;
diff --git a/include/linux/reboot-mode.h b/include/linux/reboot-mode.h
index 4a2abb38d1d612ec0fdf05eb18c98b210f631b7f..22f707ade4ba93592823ea8718d467dbfc5ffd7c 100644
--- a/include/linux/reboot-mode.h
+++ b/include/linux/reboot-mode.h
@@ -2,6 +2,8 @@
 #ifndef __REBOOT_MODE_H__
 #define __REBOOT_MODE_H__
 
+#include <linux/fwnode.h>
+
 struct reboot_mode_driver {
 	struct device *dev;
 	struct list_head head;
@@ -9,7 +11,7 @@ struct reboot_mode_driver {
 	struct notifier_block reboot_notifier;
 };
 
-int reboot_mode_register(struct reboot_mode_driver *reboot);
+int reboot_mode_register(struct reboot_mode_driver *reboot, struct fwnode_handle *fwnode);
 int reboot_mode_unregister(struct reboot_mode_driver *reboot);
 int devm_reboot_mode_register(struct device *dev,
 			      struct reboot_mode_driver *reboot);

-- 
2.34.1


