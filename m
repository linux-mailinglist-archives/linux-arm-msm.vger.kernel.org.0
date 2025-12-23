Return-Path: <linux-arm-msm+bounces-86378-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id DC3C5CDA0B0
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Dec 2025 18:08:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 4E64E30305C1
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Dec 2025 17:08:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0F9F4257843;
	Tue, 23 Dec 2025 17:08:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="HH9NnO8m";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="HVL3E4dk"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55C973469EF
	for <linux-arm-msm@vger.kernel.org>; Tue, 23 Dec 2025 17:08:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766509698; cv=none; b=alchf+OMyW3uR4w/U1hSfNAJrRKwgITncEzQVu0ZX6RHzG9nCS+FKERSAReye0IXrUwqAbqmxNQB+FBDVAWznW6+9DI2hAIfmGf7d9z2iJ0hSGMBK0kbtvF4Ho3IWPnPW6WqmcvCsRjYiw8H34SilnUJNmoMI8fKE0mNOdCDrW8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766509698; c=relaxed/simple;
	bh=EwcxR/RujuDEpRybikjE1BbpDVQI9UxyV0ysyUeOLxE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=q363RjOC4vt2ZHCBK0s8qa5u0nL+pXXGq07aPWJyL9YaeAAkWkyX8AakbVGpXpVNTMnmBj0ZaNn8li5Cmb3czwptk3ljkOHJpLRnGbYWb2wRcrH9ytEjg99RnL0aHk1RZL+4jl8E23MRUFC+8fNLexzHie16JyUrk9p6ENQrCnk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HH9NnO8m; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HVL3E4dk; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BNGZuI22778107
	for <linux-arm-msm@vger.kernel.org>; Tue, 23 Dec 2025 17:08:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ATmBcvdi0ZM8QoG3QXHD/flqNJmgCDsENr6fJV3JS3U=; b=HH9NnO8mW92oPOiM
	fQyYZmS/UYALFDf62pRwRkp/yXzyI4p9u4LraYVQktx1jq2Z7JY/nvTyXWBZ8N8T
	f0l/M3yByd4M6RSFar2vUtHZmC1ZDMPRmLk4xTjVygZW951NE77tXHz1cjFeG99X
	6I0yBE9tzuRjPjxujiT6u/NZMDe1+ft1CHEscs0SXP64n3YVbPCktZzvOADaEeeN
	zrBrew/Z6HDV4CyomtSjP1+aDB8GEBQPoO/drAHKeoyc3Dtd2j7RJq7YSPecpxjc
	7nX7ZGk/bSIe+seEYrI7Y0fVqNxG5obXFXxR1rmd7mMBE9xLFumqlblW9pIb0KGQ
	7Lfm5Q==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b76yy4dm6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 23 Dec 2025 17:08:16 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2a0e952f153so157617995ad.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 23 Dec 2025 09:08:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766509696; x=1767114496; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ATmBcvdi0ZM8QoG3QXHD/flqNJmgCDsENr6fJV3JS3U=;
        b=HVL3E4dkg4GdlCw1YBwDA+rUi8UzSVzr+i/OUqGyIo+Ywp+/eiTJKKchT9cdAJxG/+
         ScwyTEss4c/LVk8CwXK/Fl6a5DvS6T0cFJQ5pX4PJfvY0L7C11ckNXG64zA8MrZ6zVlh
         mXhKcGLP17JcT1f6Jp5bQmUTYinpw0vC+QgimGYBoe2hW8ctYQOcSZdTQFNJ4QRA/TcX
         94Kn8/jz8ISVgV64DmPgoic2sTjRrsEgKA9NWV2DQTkrKI10GoVVwoKS7XIM4pSjSC0m
         PWY6HZM/9m9cnYmudDX5ycGD3ybPckemrcUyrBH17sAP3CoYVKCcIPb0IdkeAkVZODPq
         gInQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766509696; x=1767114496;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ATmBcvdi0ZM8QoG3QXHD/flqNJmgCDsENr6fJV3JS3U=;
        b=owKqv8RKwGrCjdIONIwDEFaPq2gnVByQQfwTOKj0N+aL58Nht08Cm0QqcsI1mPC4Um
         rrepZo+JLfSKgKtGEIq5pZ50gu3ST6szLx9VuFWsL6OIChNL0nTAEJhJ8PrEoPjDCZ/R
         zgBaT0SridtZMmGZYvOvPXGSfTkcaOYvlzbAzaJW/fRhqQmq+OHRfqWZgQMjrxpDq/Au
         NNgfOdUA8mg/goYiQE3VzAtKaDEHsTqPO08yF41zhAc1BJMOO0Mo8bIxmQx8IoEqpOhl
         mbfD3q0lb0YlgX0m8gSoWzX20Th6ZKVb3e9P1xC+Z0usDtelcI7cbTn/STLry7MJQK4E
         UKzg==
X-Forwarded-Encrypted: i=1; AJvYcCWPhP9Awv8jgp79TCOj5SDQCnXtWazUBu/rKbru//O+F4E3NqwL19DF1Ej4zTVI30AfN9lybn3RrH7Te452@vger.kernel.org
X-Gm-Message-State: AOJu0YwOMyVzuskxgs/D6NrTr7ekNaomWPhVHksZJ/bmtUYTU69kkK6N
	EApSWZTfmixgEwijR1MTd7k1cB6izLzmu0ejfNbbEaKvjJQXqELRVL8rHhlZEcaMucx5TAswuay
	TU5XNopZ/XlwiL+xQ3iG24U0rY/8sVlQ3cgj3HmLE8LMawurWumxSwSA2lYbIILLQZLzl
X-Gm-Gg: AY/fxX5wmQZw8OHJppDhtQcPB6xYztTzLEO6rAb3fQGQmaUQZJDXQSzXm5b8roemayU
	Ozi2Fc4dzePLssEX/3DioCTn68KSwTwumY9G+GfdTnEhbQ+Dy7lIqpLNC5nNmQDYClTVIG9eTte
	gnDi7Mtxlsm2Q8kcaipzD9jLhAtghhbMEiRr7Q+kkPL1FFBQIFY3wHGDEmloJtJbUV+eBr3xutw
	MukoxseaC24TEbJPnbB6rCGtV0Tqy5GOSD6QSkNq1qQTUiwoHj/eloejbQgm/3acVK4Yf6Wl7GT
	G7OptZkhzGN9y1btSYBH3y6x9VE26dN3HuU9XmGJpNYDlYvHk45KiGqUk/BxAxWN3bVUG2ZAlNg
	zmdWMpp5+W2usFTJP3/O/pCzs8BIPepF7uqsWHnIHPt1Ong==
X-Received: by 2002:a17:903:22d2:b0:2a0:de4f:c96 with SMTP id d9443c01a7336-2a2f22290bfmr155876025ad.18.1766509695868;
        Tue, 23 Dec 2025 09:08:15 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGLK98y9AUy+4JNxavuFk4mRdGfVbrYe9HdiVU9bqvyrNEVl99KZev10YEXapHKTBkUt9/3bw==
X-Received: by 2002:a17:903:22d2:b0:2a0:de4f:c96 with SMTP id d9443c01a7336-2a2f22290bfmr155875775ad.18.1766509695401;
        Tue, 23 Dec 2025 09:08:15 -0800 (PST)
Received: from hu-spratap-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a2f3d5d863sm130019325ad.80.2025.12.23.09.08.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Dec 2025 09:08:15 -0800 (PST)
From: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
Date: Tue, 23 Dec 2025 22:37:34 +0530
Subject: [PATCH v18 03/10] power: reset: reboot-mode: Add support for
 predefined reboot modes
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251223-arm-psci-system_reset2-vendor-reboots-v18-3-32fa9e76efc3@oss.qualcomm.com>
References: <20251223-arm-psci-system_reset2-vendor-reboots-v18-0-32fa9e76efc3@oss.qualcomm.com>
In-Reply-To: <20251223-arm-psci-system_reset2-vendor-reboots-v18-0-32fa9e76efc3@oss.qualcomm.com>
To: Lorenzo Pieralisi <lpieralisi@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
        Bjorn Andersson <andersson@kernel.org>,
        Sebastian Reichel <sre@kernel.org>, Rob Herring <robh@kernel.org>,
        Sudeep Holla <sudeep.holla@arm.com>,
        Souvik Chakravarty <Souvik.Chakravarty@arm.com>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Andy Yan <andy.yan@rock-chips.com>,
        Bartosz Golaszewski <brgl@kernel.org>
Cc: Florian Fainelli <florian.fainelli@broadcom.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Andre Draszik <andre.draszik@linaro.org>,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>,
        linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>,
        Srinivas Kandagatla <srini@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1766509672; l=5544;
 i=shivendra.pratap@oss.qualcomm.com; s=20250710; h=from:subject:message-id;
 bh=EwcxR/RujuDEpRybikjE1BbpDVQI9UxyV0ysyUeOLxE=;
 b=k0L6kc/W6ljfBJPxAe+iBCBIK2dumAtN+LIGDVzfVBr87lfwWKHECVyHSAazU5HMEKCsxDTqJ
 8W2Eiwi72HnB2I0oUhcB8wVNTPjEOpMwbzeoBYJv0zY0ko6WlRNP0Vb
X-Developer-Key: i=shivendra.pratap@oss.qualcomm.com; a=ed25519;
 pk=CpsuL7yZ8NReDPhGgq6Xn/SRoa59mAvzWOW0QZoo4gw=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjIzMDE0MiBTYWx0ZWRfX0LyG7n83a1Lt
 oLuHUiRKrBaYSobZ0geVSjn4U2lE5NPCjFzchLbkcfBY6Tp5jPlOXvgkI6Fk0xOq3Q9UI/Pnnyy
 RivrDv+Y5OFH/CNY1325QfAAEhgKXmVDkmEe/pXymAkAEG4Xpjs6QDkH7WEorKbrj/zob/Woha3
 yGBqaH00bCv7Hq2oUelJ/DLIa1th5rWxiBNmGi2YDocsLwi19qxKzTL34KNURvYDOHP6ErrU0pO
 J/Uy0zJo5eoEy/Rh3vad3u6HBi9OSYrhhFY4d1yUPFQ0MKSJJ3xr5+l/cr+NeIsGSADaOosu2PF
 4bJ+wp1ep+HkSYOGcpFxVD5R7GITMd/3qbDKdGdn5tRgXcHQO84ZQIHvYBt/qnp0qIOQTHGS6Q2
 Pfha6LD7Q/SN6tU3xmOXdlfhxFhBwpJouGYrD+5p4OH8s2VQ0VqnO9uXhBPbGIQujLPltckwawF
 DqVmT4nI97LF2kAC+Dg==
X-Authority-Analysis: v=2.4 cv=Zb0Q98VA c=1 sm=1 tr=0 ts=694acc80 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=UVh4EkS4hOj72C4E1asA:9
 a=QEXdDO2ut3YA:10 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-ORIG-GUID: nH5m8U4W3ewoquzv76DQJHpRtQPsllFu
X-Proofpoint-GUID: nH5m8U4W3ewoquzv76DQJHpRtQPsllFu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-23_04,2025-12-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 priorityscore=1501 malwarescore=0 impostorscore=0
 phishscore=0 spamscore=0 bulkscore=0 adultscore=0 suspectscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2512230142

reboot-mode based drivers can define a reboot-mode by adding it under
the reboot-mode node in device tree. This limits such drivers, to define
any predefined reboot-modes statically within the driver and creates a
dependency on device-tree.

Introduce a list for predefined modes in the reboot-mode framework and
process the predefined reboot-modes along with the device-tree defined
reboot-modes. Modify existing reboot-mode based drivers to initialize
the predefined list-head as empty.

This patch enables a reboot mode driver to define reboot-modes through a
predefined static list, in addition to the device-tree based reboot-modes.

Signed-off-by: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
---
 drivers/power/reset/nvmem-reboot-mode.c  |  1 +
 drivers/power/reset/qcom-pon.c           |  1 +
 drivers/power/reset/reboot-mode.c        | 28 ++++++++++++++++++++++------
 drivers/power/reset/syscon-reboot-mode.c |  1 +
 include/linux/reboot-mode.h              |  9 +++++++++
 5 files changed, 34 insertions(+), 6 deletions(-)

diff --git a/drivers/power/reset/nvmem-reboot-mode.c b/drivers/power/reset/nvmem-reboot-mode.c
index b3d21d39b0f732254c40103db1b51fb7045ce344..b02a2af31aac52cb0ab19cf5d4d315d17c208f6e 100644
--- a/drivers/power/reset/nvmem-reboot-mode.c
+++ b/drivers/power/reset/nvmem-reboot-mode.c
@@ -44,6 +44,7 @@ static int nvmem_reboot_mode_probe(struct platform_device *pdev)
 
 	nvmem_rbm->reboot.dev = &pdev->dev;
 	nvmem_rbm->reboot.write = nvmem_reboot_mode_write;
+	INIT_LIST_HEAD(&nvmem_rbm->reboot.predefined_modes);
 
 	nvmem_rbm->cell = devm_nvmem_cell_get(&pdev->dev, "reboot-mode");
 	if (IS_ERR(nvmem_rbm->cell)) {
diff --git a/drivers/power/reset/qcom-pon.c b/drivers/power/reset/qcom-pon.c
index ccce1673b2ec47d02524edd44811d4f528c243e8..bf7b9f0bcdcc4c168aa7ff8d6494122d898814b5 100644
--- a/drivers/power/reset/qcom-pon.c
+++ b/drivers/power/reset/qcom-pon.c
@@ -75,6 +75,7 @@ static int qcom_pon_probe(struct platform_device *pdev)
 		pon->reboot_mode.dev = &pdev->dev;
 		pon->reason_shift = reason_shift;
 		pon->reboot_mode.write = qcom_pon_reboot_mode_write;
+		INIT_LIST_HEAD(&pon->reboot_mode.predefined_modes);
 		error = devm_reboot_mode_register(&pdev->dev, &pon->reboot_mode);
 		if (error) {
 			dev_err(&pdev->dev, "can't register reboot mode\n");
diff --git a/drivers/power/reset/reboot-mode.c b/drivers/power/reset/reboot-mode.c
index 54adcda57e44edf2fd2cda0f752226f747aa72d7..c17c61f47f069b96a9b38699de71dc1f30a807c5 100644
--- a/drivers/power/reset/reboot-mode.c
+++ b/drivers/power/reset/reboot-mode.c
@@ -15,12 +15,6 @@
 
 #define PREFIX "mode-"
 
-struct mode_info {
-	const char *mode;
-	u64 magic;
-	struct list_head list;
-};
-
 static u64 get_reboot_mode_magic(struct reboot_mode_driver *reboot, const char *cmd)
 {
 	const char *normal = "normal";
@@ -71,6 +65,7 @@ static int reboot_mode_notify(struct notifier_block *this,
  */
 int reboot_mode_register(struct reboot_mode_driver *reboot)
 {
+	struct mode_info *info_predef;
 	struct mode_info *info;
 	struct mode_info *next;
 	struct property *prop;
@@ -82,6 +77,9 @@ int reboot_mode_register(struct reboot_mode_driver *reboot)
 
 	INIT_LIST_HEAD(&reboot->head);
 
+	if (!np)
+		goto predefined_modes;
+
 	for_each_property_of_node(np, prop) {
 		if (strncmp(prop->name, PREFIX, len))
 			continue;
@@ -123,6 +121,24 @@ int reboot_mode_register(struct reboot_mode_driver *reboot)
 		list_add_tail(&info->list, &reboot->head);
 	}
 
+predefined_modes:
+	list_for_each_entry(info_predef, &reboot->predefined_modes, list) {
+		info = kzalloc(sizeof(*info), GFP_KERNEL);
+		if (!info) {
+			ret = -ENOMEM;
+			goto error;
+		}
+
+		info->mode = kstrdup_const(info_predef->mode, GFP_KERNEL);
+		if (!info->mode) {
+			ret = -ENOMEM;
+			goto error;
+		}
+
+		info->magic = info_predef->magic;
+		list_add_tail(&info->list, &reboot->head);
+	}
+
 	reboot->reboot_notifier.notifier_call = reboot_mode_notify;
 	register_reboot_notifier(&reboot->reboot_notifier);
 
diff --git a/drivers/power/reset/syscon-reboot-mode.c b/drivers/power/reset/syscon-reboot-mode.c
index eb7fc5b7d6a7ed8a833d4920991c4c40b5b13ca7..74e2e14c5d87c54ac24ef63c7905b3266d736439 100644
--- a/drivers/power/reset/syscon-reboot-mode.c
+++ b/drivers/power/reset/syscon-reboot-mode.c
@@ -50,6 +50,7 @@ static int syscon_reboot_mode_probe(struct platform_device *pdev)
 	syscon_rbm->reboot.dev = &pdev->dev;
 	syscon_rbm->reboot.write = syscon_reboot_mode_write;
 	syscon_rbm->mask = 0xffffffff;
+	INIT_LIST_HEAD(&syscon_rbm->reboot.predefined_modes);
 
 	syscon_rbm->map = syscon_node_to_regmap(pdev->dev.parent->of_node);
 	if (IS_ERR(syscon_rbm->map))
diff --git a/include/linux/reboot-mode.h b/include/linux/reboot-mode.h
index a359dc0c6dede0ac5ce67190a00d46a7e7856707..bddec9b7f94187dcb056540df79eea34c25b1d0d 100644
--- a/include/linux/reboot-mode.h
+++ b/include/linux/reboot-mode.h
@@ -4,11 +4,20 @@
 
 #include <linux/bitfield.h>
 #include <linux/bits.h>
+#include <linux/reboot.h>
 #include <linux/types.h>
 
+struct mode_info {
+	const char *mode;
+	u64 magic;
+	struct list_head list;
+};
+
 struct reboot_mode_driver {
 	struct device *dev;
 	struct list_head head;
+	/* List of predefined reboot-modes, a reboot-mode-driver may populate. */
+	struct list_head predefined_modes;
 	int (*write)(struct reboot_mode_driver *reboot, u64 magic);
 	struct notifier_block reboot_notifier;
 };

-- 
2.34.1


