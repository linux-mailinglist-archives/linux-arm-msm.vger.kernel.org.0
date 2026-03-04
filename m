Return-Path: <linux-arm-msm+bounces-95419-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kD9LOk52qGnpugAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-95419-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 04 Mar 2026 19:13:34 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 98A71205F8A
	for <lists+linux-arm-msm@lfdr.de>; Wed, 04 Mar 2026 19:13:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 7254130B5A8F
	for <lists+linux-arm-msm@lfdr.de>; Wed,  4 Mar 2026 18:07:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0A3AF3DEAE2;
	Wed,  4 Mar 2026 18:03:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GTl/xsZh";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="h/313gp3"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7F6D3DEAC2
	for <linux-arm-msm@vger.kernel.org>; Wed,  4 Mar 2026 18:03:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772647418; cv=none; b=FUWqVr39JSRvy/tZrtL9Z+sGoUz04WALT2bgFcS8igr8QN6w0zQJabc9XizauEaMNWdCya6MNBna/y33tL2sDvYIQezmbv0AMWAX4QAG+S9kDYXc/DLWiro4OUS1wK4OL6FkAoMlg65GU3iOQLVQv4j2BLwDp2XGBjDwcpM5Hc4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772647418; c=relaxed/simple;
	bh=nI413mpH4Vny/jDMl6dShEe8rWIdtCh49blRabGf3jA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=komBIZB9Pg9ExxgoKCNPzBb1ADIr4Z/mSCFc87KvbskXwiSds24I2twcLhZ/F/iaZsmKbeWedeDox1RiPN6yKFFYsqlFAKB4L2D1ldWaPEVfqhMMNSXA0UlZe6IKseJotXJQqTbNp6K6RBjsK0N8738ecmm1Fi/noIfux3cB0Ps=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GTl/xsZh; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=h/313gp3; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 624HHEE43837984
	for <linux-arm-msm@vger.kernel.org>; Wed, 4 Mar 2026 18:03:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	R3mGKt2hZAc1/fLOvPOaHv4o+LhU4pbbCYTJr7cvoC0=; b=GTl/xsZhfZm+uECM
	Cdv2UOoxCyv/FNB5aHi0HOMmTs/tdFSMn+u+2HlMSZcdsQsaoIGdoXX5CUfXM3nU
	RbuKM5FoBt/MY9FodKAiOT3Ah8/frxa4ewWsP1Ve14Ud9k3gXNQsP6GWTVnyDQcs
	r9RgSDhnO/yaIaP8RdeB03NzWHdqxgVyZIDzKt3iqly4GvRVRVHPf8htg6/lT9w4
	q9L5smyFl9f/16FvcbSpURF7f6MZdvGmkXeZNv+ktHQipQHeonV3fQ4QWt3tUEqp
	ePM72MVA3rFC8+Ivu/UGmegFrg6voFc11bgULVPnMY/O86SEOUY5SQFRAT9sK9Vd
	8Rw9kg==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cps0m04nx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 04 Mar 2026 18:03:36 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3595485abbbso5704617a91.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 04 Mar 2026 10:03:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772647416; x=1773252216; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=R3mGKt2hZAc1/fLOvPOaHv4o+LhU4pbbCYTJr7cvoC0=;
        b=h/313gp32WINqznyLbeaP1Qi0hOHQNX3HBWS45oPsG0S77qSQdWQhRXoXWQKwo19eM
         EhNsGGPFjBTNKqRbF80qStnAyXkslP2SLbitglbt3oV0uH4v1G7bPFLfaqNgz2jUjSVE
         SnUWBnI14CHFJAtV1K+HexiWDTcizXsQgCXell7+TR73hlx1TcKIzsLISQycVKHZWs35
         AXpPnZM9tmAOGg0ZJG2eenGkEj3SDz4LD5SQC4Yv9vgWTJYM9hf1aLYY5HvMxxhHRpbv
         mYQ5w0IQr1TKYOfVr0w7lsSNTf/RzBM2eOsNbngyTZASjzlYJKb7ZSUxH06ZrK5v5fnw
         VOrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772647416; x=1773252216;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=R3mGKt2hZAc1/fLOvPOaHv4o+LhU4pbbCYTJr7cvoC0=;
        b=Fpsp9kKX9vzfttwDL3Vu8P5Hg08VRhds6i9V6l2AvBGY9rEuJMzeTuFgf2RulK6OLy
         y3Z/3b8EE+e0+2kwtDs9hClwdZJuIG2Qxy1aoLrobNIzfEi+Uk39B9G59y6gsOA2srl8
         M2LYmiCgEE63Mp+42BGlm8pMw5IB2xbUXTxQOKKq0YHgESAhxIKj4uVzaDG3xSzkmDlL
         nHE+nr1xcsCFtlytiVSsvi7F0N5VtvYebU/hNN/gtieG+jxz+2+l3uuy1Db05KvqRTXM
         +pJw7oEnfu6Fe4ZWDHRKryUkD+KEswRv3ZtDFrjdv4VoSxK3G35eckfNTd8hyIGhI59Z
         WVnA==
X-Forwarded-Encrypted: i=1; AJvYcCX19JQ3+zqCqL9TPcZ8Ybu0bgTbuCQCJ3fR0awVHMyKcc5kbZaQE/9VwjKQnZl9Y4X0tR49YKrn/fTPj19a@vger.kernel.org
X-Gm-Message-State: AOJu0YzwHBzwD/In2d4hvxesYNiAc0a1fbsMrVPy9m+JQDoPqxf25Ktm
	29kQCLD008jpH9dkMSL2qSXGdQrR8y01crks5VAa+XC2WM0CWBFr1TDY/6p3TdpAN4pIM8V+r6s
	lSfnmk9iTZjb07SAYEWuHlHueAP14GGaxvySD9uDu+LqgjW2jZrTm1ngYEiLAuSAGbFBw
X-Gm-Gg: ATEYQzzLfxmdalf/lRZqkUTUv1iTF5v/w2F1/uCy5w7frcDxtMK0Zp/AQm4UHPe2QiU
	TFuRBZSPqUajU5jZgDhg44dDcjI7I9b2vHUwXIXOxbdWEEb+0aUsTmO3o2VY5QJpnjhFy4pqhOl
	fC0HbloXZhpGnBzWCSfP2hXaSQS4xZ6wgsduQZd+EYdYi8CGo4rf/B4PFbdsVAsiJajg+R60bqs
	P7Xpu9eGbgfRDk48CBDXJIw1ds34SVEMDXGnPVxbDLhACONdwHBPxeypQGVJ+VQv/iHU1o+Pns/
	kgSeJbGPYne0u95nK0puQi4i9OG4xS5dX0VmxKUq9YzHAohXy83+Jyx+cDAojBgMZ5HpVfaTDfW
	gYWAAPIpLXDDTKFjyEXgyalbGcYQlKTtfc7+IMWWMwr1Yn7lbytOLcoAcVA==
X-Received: by 2002:a17:90b:1e0b:b0:359:2d1c:9206 with SMTP id 98e67ed59e1d1-359a6a97876mr2870352a91.33.1772647416139;
        Wed, 04 Mar 2026 10:03:36 -0800 (PST)
X-Received: by 2002:a17:90b:1e0b:b0:359:2d1c:9206 with SMTP id 98e67ed59e1d1-359a6a97876mr2870305a91.33.1772647415618;
        Wed, 04 Mar 2026 10:03:35 -0800 (PST)
Received: from hu-spratap-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-359a8f22062sm1080606a91.1.2026.03.04.10.03.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Mar 2026 10:03:35 -0800 (PST)
From: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
Date: Wed, 04 Mar 2026 23:33:01 +0530
Subject: [PATCH v20 01/10] power: reset: reboot-mode: Remove devres based
 allocations
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260304-arm-psci-system_reset2-vendor-reboots-v20-1-cf7d346b8372@oss.qualcomm.com>
References: <20260304-arm-psci-system_reset2-vendor-reboots-v20-0-cf7d346b8372@oss.qualcomm.com>
In-Reply-To: <20260304-arm-psci-system_reset2-vendor-reboots-v20-0-cf7d346b8372@oss.qualcomm.com>
To: Lorenzo Pieralisi <lpieralisi@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
        Bjorn Andersson <andersson@kernel.org>,
        Sebastian Reichel <sre@kernel.org>, Rob Herring <robh@kernel.org>,
        Souvik Chakravarty <Souvik.Chakravarty@arm.com>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Andy Yan <andy.yan@rock-chips.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Mark Rutland <mark.rutland@arm.com>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        John Stultz <john.stultz@linaro.org>,
        Moritz Fischer <moritz.fischer@ettus.com>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Sudeep Holla <sudeep.holla@kernel.org>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1772647398; l=3628;
 i=shivendra.pratap@oss.qualcomm.com; s=20250710; h=from:subject:message-id;
 bh=nI413mpH4Vny/jDMl6dShEe8rWIdtCh49blRabGf3jA=;
 b=tmuPFucdwo0CFgiVjaW74q0jpCSADUah6j2tcoEU889L00rSI3hCZWyRg9lYeuJLkbzcgUbMl
 lLhJoaewZdSC5aD3/VNXRx2t/86PDFYYBGaT//NQg9dHrzNMmUC8aZ3
X-Developer-Key: i=shivendra.pratap@oss.qualcomm.com; a=ed25519;
 pk=CpsuL7yZ8NReDPhGgq6Xn/SRoa59mAvzWOW0QZoo4gw=
X-Authority-Analysis: v=2.4 cv=e6wLiKp/ c=1 sm=1 tr=0 ts=69a873f8 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=QIdouwm7mKRySFGJXRQA:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-ORIG-GUID: H11b8Angs9xTQyC3ZOBarxEIvTDtNzir
X-Proofpoint-GUID: H11b8Angs9xTQyC3ZOBarxEIvTDtNzir
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA0MDE0NyBTYWx0ZWRfX4HCV6I0YCDvV
 BL54+HfUifhTlSI+iY7NSWVZuXkE9K6Edf7tbSBRaKQwzpC9HPjVOZ1/xpyynCMJYv28Hbsp1IA
 v9hSScfwbQz7mxxDZA0BigOPox+XyJCSDEHey580A6adJtmlq7s86c3bwypzLFE8AzVpijuosbK
 1NehrB4yAcckX/0pwKFWJaGY6b/aJhBhNNO7JIrjr25t5zE2wo5smmsSax7Z1tNsGH945U5ojIY
 tAoIIb8CldHDEcw/6f6csXk9BgJilI1dTsg0y9CPgkNyEYgSvuWj8/i6TW81RX9h7KCoo8KMiA2
 CcyCPt/bqmB1OFW/739Zp5bIiIEgFKKFc+CH2zohG7nqcC7ANko2RuiMv9gNHNfiWrYJ8Rz+XZ4
 hTeEXstqgpvCtDree74EPVJP0BPBws2vNAJnrTFcRxWSdTN6PVH5AekfH9pR4tLXbACdnATJEUk
 PKQre9LldfxP9OkxfhA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-04_07,2026-03-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0 phishscore=0 lowpriorityscore=0 clxscore=1015
 spamscore=0 adultscore=0 impostorscore=0 suspectscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603040147
X-Rspamd-Queue-Id: 98A71205F8A
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-95419-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	FREEMAIL_TO(0.00)[kernel.org,arndb.de,arm.com,rock-chips.com,gmail.com,linaro.org,ettus.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[29];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[shivendra.pratap@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

Devres APIs are intended for use in drivers, where the managed lifetime
of resources is tied directly to the driver attach/detach cycle. In
shared subsystem code, there is no guarantee that the subsystem
functions will only be called after a driver has been attached, nor that
they will not be referenced after the managed resources have been
released during driver detach.

To ensure correct lifetime handling, avoid using devres-based
allocations in the reboot-mode and explicitly handle allocation and
cleanup of resources.

Fixes: 4fcd504edbf7 ("power: reset: add reboot mode driver")
Signed-off-by: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
---
 drivers/power/reset/reboot-mode.c | 33 ++++++++++++++++++++-------------
 1 file changed, 20 insertions(+), 13 deletions(-)

diff --git a/drivers/power/reset/reboot-mode.c b/drivers/power/reset/reboot-mode.c
index fba53f638da04655e756b5f8b7d2d666d1379535..d033043f5250a4de152a7786ef37e88a0ace3bbb 100644
--- a/drivers/power/reset/reboot-mode.c
+++ b/drivers/power/reset/reboot-mode.c
@@ -3,13 +3,17 @@
  * Copyright (c) 2016, Fuzhou Rockchip Electronics Co., Ltd
  */
 
+#define pr_fmt(fmt)	"reboot-mode: " fmt
+
 #include <linux/device.h>
 #include <linux/init.h>
 #include <linux/kernel.h>
 #include <linux/module.h>
 #include <linux/of.h>
+#include <linux/property.h>
 #include <linux/reboot.h>
 #include <linux/reboot-mode.h>
+#include <linux/slab.h>
 
 #define PREFIX "mode-"
 
@@ -74,6 +78,7 @@ int reboot_mode_register(struct reboot_mode_driver *reboot)
 	struct property *prop;
 	struct device_node *np = reboot->dev->of_node;
 	size_t len = strlen(PREFIX);
+	u32 magic;
 	int ret;
 
 	INIT_LIST_HEAD(&reboot->head);
@@ -82,19 +87,18 @@ int reboot_mode_register(struct reboot_mode_driver *reboot)
 		if (strncmp(prop->name, PREFIX, len))
 			continue;
 
-		info = devm_kzalloc(reboot->dev, sizeof(*info), GFP_KERNEL);
+		if (device_property_read_u32(reboot->dev, prop->name, &magic)) {
+			pr_debug("reboot mode %s without magic number\n", prop->name);
+			continue;
+		}
+
+		info = kzalloc(sizeof(*info), GFP_KERNEL);
 		if (!info) {
 			ret = -ENOMEM;
 			goto error;
 		}
 
-		if (of_property_read_u32(np, prop->name, &info->magic)) {
-			dev_err(reboot->dev, "reboot mode %s without magic number\n",
-				info->mode);
-			devm_kfree(reboot->dev, info);
-			continue;
-		}
-
+		info->magic = magic;
 		info->mode = kstrdup_const(prop->name + len, GFP_KERNEL);
 		if (!info->mode) {
 			ret =  -ENOMEM;
@@ -102,8 +106,7 @@ int reboot_mode_register(struct reboot_mode_driver *reboot)
 		} else if (info->mode[0] == '\0') {
 			kfree_const(info->mode);
 			ret = -EINVAL;
-			dev_err(reboot->dev, "invalid mode name(%s): too short!\n",
-				prop->name);
+			pr_err("invalid mode name(%s): too short!\n", prop->name);
 			goto error;
 		}
 
@@ -116,8 +119,8 @@ int reboot_mode_register(struct reboot_mode_driver *reboot)
 	return 0;
 
 error:
-	list_for_each_entry(info, &reboot->head, list)
-		kfree_const(info->mode);
+	kfree(info);
+	reboot_mode_unregister(reboot);
 
 	return ret;
 }
@@ -130,11 +133,15 @@ EXPORT_SYMBOL_GPL(reboot_mode_register);
 int reboot_mode_unregister(struct reboot_mode_driver *reboot)
 {
 	struct mode_info *info;
+	struct mode_info *next;
 
 	unregister_reboot_notifier(&reboot->reboot_notifier);
 
-	list_for_each_entry(info, &reboot->head, list)
+	list_for_each_entry_safe(info, next, &reboot->head, list) {
+		list_del(&info->list);
 		kfree_const(info->mode);
+		kfree(info);
+	}
 
 	return 0;
 }

-- 
2.34.1


