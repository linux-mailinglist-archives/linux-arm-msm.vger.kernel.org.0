Return-Path: <linux-arm-msm+bounces-80872-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id C3CE9C4406D
	for <lists+linux-arm-msm@lfdr.de>; Sun, 09 Nov 2025 15:38:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 07CF6188C60A
	for <lists+linux-arm-msm@lfdr.de>; Sun,  9 Nov 2025 14:38:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 19DD02FB0A1;
	Sun,  9 Nov 2025 14:38:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="HIoQb7Uj";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DqKsCLBb"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6050F2FE06B
	for <linux-arm-msm@vger.kernel.org>; Sun,  9 Nov 2025 14:38:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762699096; cv=none; b=Fh35rfpgPWZJnAk2esBzSw6KAMThGkqKO+vkSafZIBKa1t6SSK4C4qrnI1rwnhPyrvvkm1ozri74aJwuMej3n4OS39fA0fj0zAZqA6t+YTi1gjZDqTWquGuLG1dM+4TREPEiLYMSiBj/4tnR/64GzP1T+72iiEIh2qjR2hjEnRM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762699096; c=relaxed/simple;
	bh=tSD2yNZaJDc5m1jdDRoQ2dA6oSVGR8ZTHjS4GRBmNcg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=YrWYUvlbH3hoPyLmTbV7yeTffCCxjrrLdHCtl6wy8wutm5kCx94d52NHKxIaCjQ/QyUS4SFKpkvn+cAhBydWO7bf6PArOD0d7o96JnW+AIj9dp+vKKXgt99HacUVwB40JxmpPOkPnDP81WasvrsttLFrzuuKv7lL38pTlUCr+DE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HIoQb7Uj; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DqKsCLBb; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5A97hSsI3969839
	for <linux-arm-msm@vger.kernel.org>; Sun, 9 Nov 2025 14:38:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	jiNDMgJ1PRczoI1657/zd47IielAoH6hCTaVhiNKpyE=; b=HIoQb7UjY9q077NI
	kVl2CpnPnEJvwugYDSyD0BYY7Ki1Ddbt4V2S12+fnDUy7cDXHr5lEwCKvV8sfzI4
	UGzOvjxgkrxhEUwljXiwKmposcK1U9CsT3eDZA48WD9edb5d24OEq03Qy3iKMW/l
	gm0pZPVbVktoSzG9zqMu1MEuAM/FnB5PduxO6LdBsEO/sSKBZO6gkjsIglsAlUl7
	ucvhr1MhO+1vPJlKDrGpgkph5Id5Xk3qpn0TgRkyaMaOmdXOHOuBCrhDfDG8nNrR
	bDGsRSZXq0NYbxd/hjscqlwJHKiOraj4NgN6QLnWQ9jauzBQkncuaBsVC+vb00o/
	irn1fg==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a9y56t6fb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 09 Nov 2025 14:38:13 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-34385d7c4a7so470826a91.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 09 Nov 2025 06:38:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1762699093; x=1763303893; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jiNDMgJ1PRczoI1657/zd47IielAoH6hCTaVhiNKpyE=;
        b=DqKsCLBbFDQft/ZoGsDbfSkzCNmoOhIn+rQjC7NCEHqAshONiYsT6cuUhZsfhcFQs0
         WRqF7iwG0cZRrMtvevOukeUEzaqhbwQ7wfUtRWhsnwwNNxAHQDE22WuOqyef1nte4Ue6
         Z3QL/GAHMi/h17jO4dhzEpicBbZu07CXmJKsdNQ4C+gts1rI5ZvdUJ5lEMkFHTr2Iez3
         A8skSGTo8bmWWXWm8s37LjRYmvT/pqPAJEf1Q2DeSs8rfgL1qKtcAzuVLbjdqJ7lmr0D
         0CgzYxFhBmfdcc5ZJrY8f2VEflbEWmaE8aqx076ILATG9m2uTXlKCwQAMLABE+J3gNC7
         9CJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762699093; x=1763303893;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=jiNDMgJ1PRczoI1657/zd47IielAoH6hCTaVhiNKpyE=;
        b=cuMyiY1eDVjzSBKoCUDA8Euy8JsRhRgahS8db5N7YgFkmkXvqBrIc7mk51wolI/YLl
         Auma1wjA7HXft8NaFCAxT60dPzuGqzu5LpreFYd21mJhnlezkNGOeAHdmSKBnJ2m4YoN
         xgOr8anJVxeY54TIIlo2DMB2Bk0cLnp+B/o+R4IMewtNRtDK+sagFE7bPziu1zkDXEc9
         K12nWOFjRV6Qmdw383JP6633RWVV+kb10JEt1kA8+Uz9CUs55iR8W3zanJO36pWsIoFd
         HiHzXhjkwyQzTPteCsOQRah/OG/YEtbOxi/AHGSwsRj41pJ9I2y6GL/W3DGwshnsAKn0
         tC7g==
X-Forwarded-Encrypted: i=1; AJvYcCXt1nKOQq9PYXPznymNe4VVVtgqUCIRgoWMBb4e2w9121xoaQ8af0LhEP+IMGmLI430KnPSvBdOjH+q6ttv@vger.kernel.org
X-Gm-Message-State: AOJu0Yy6z5xpgEYd3D7a0xo+5qDJ+M0Bf8vJYjIr2aX5KB09jIDtZmHy
	iEqYL0i3LuTSYvnZfBUfv4cWRokUuSHi6q2iSwigsbft47r1sUlUaYtmBBv6JMux7yCjWtGVir1
	0XFP2JXEC0FHy3gkhtdgBlwN4k9DSjBE68h+2OP+bG06zW57VcuRByVe5zZuwJArXcxZELSqO9d
	Cd
X-Gm-Gg: ASbGncsK7dnNlzJdNj+juXVXEu5F3s9tpPxss1xxphZbqbn3PozLx4LQ3DsdDDePF7E
	KtBgYDGmUo+1TrsGyomou8+j6jvdTtlnlDg9vNJnal11eI7sOIxHvmS20DVv5GZ8X9JqHeLnTyc
	3niWGM7AvrXKkexvlf2PtPGePFT4LD6alhHRVZDt51L8QW13PUJdfNviqIBHJKaGINDZSwO0c/v
	LTpWa90xNgVV429wP2+h1zrzl3pjOUQ+qHjSm8f5KsVuweXEeJppwmBlTwvGe7lT9EhpnUfDbC7
	EFOgo6NrUi/aBlc/YoYLVns17mHnFgpmxU6cg26Nz8wA0VFi+NfPLjzuIYBd0TeXWXK4BGuncZb
	nYw4yLbXqUCatNclYdEqhnnWQ4UMhfZ1MtXs=
X-Received: by 2002:a17:90b:2e50:b0:32e:8ff9:d124 with SMTP id 98e67ed59e1d1-3436acc10b1mr6325904a91.15.1762699092557;
        Sun, 09 Nov 2025 06:38:12 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFsz33mCu2I9XufPajBf7LFsiT4u4peJwvXKj1MW+NqngdPeP21HWE8OBRYf1Aie7N1TK+YOA==
X-Received: by 2002:a17:90b:2e50:b0:32e:8ff9:d124 with SMTP id 98e67ed59e1d1-3436acc10b1mr6325873a91.15.1762699092004;
        Sun, 09 Nov 2025 06:38:12 -0800 (PST)
Received: from hu-spratap-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-341a68a68e6sm14845401a91.4.2025.11.09.06.38.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Nov 2025 06:38:11 -0800 (PST)
From: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
Date: Sun, 09 Nov 2025 20:07:14 +0530
Subject: [PATCH v17 01/12] power: reset: reboot-mode: Remove devres based
 allocations
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251109-arm-psci-system_reset2-vendor-reboots-v17-1-46e085bca4cc@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1762699073; l=3273;
 i=shivendra.pratap@oss.qualcomm.com; s=20250710; h=from:subject:message-id;
 bh=tSD2yNZaJDc5m1jdDRoQ2dA6oSVGR8ZTHjS4GRBmNcg=;
 b=bUjyq9xpjS9KUiS6+Nw78zrsSxHqaWYFJL0jGHwwWaOkVhD0IIgjEAY5Z0HoEPo/CcR3Xz4oA
 IulwmmBv4T4A9e0Vrji+SnFgsZO+5ByFEtY5OaqNKYLzIpwTq8pESLl
X-Developer-Key: i=shivendra.pratap@oss.qualcomm.com; a=ed25519;
 pk=CpsuL7yZ8NReDPhGgq6Xn/SRoa59mAvzWOW0QZoo4gw=
X-Proofpoint-GUID: UU1yfiOaywK72aLZW3etMP_x2Li2gMaz
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTA5MDEyOSBTYWx0ZWRfXxkUGL1aZH75s
 VV8eHlhrkGXX0E5+pvGR10Gzj1Sp5nqf2z3FfR9+OrbwLH31ODpOzLUeeswBxCJuzG9hAG/kIx4
 29CpXvCA/l0aPf4Y3Wlhgy9S7sixP9K7w0iZ4zSR7/zP9i6GocS4A2H8oodT6x5IMi61DuPJRTR
 mlCbS6nw75Zis+uanWroTC7RKHTJJWlmwPNuJiR2qBnVF5L+GxyWbBuxlFQLwFG1h9+MamTOpIA
 2iJ9dTbLrB1yG9CEshma3nXLYQHIGWdHbGZvKEgDTkZLQath8u9b7MtxHxC48Sr/74b4qlxpeCK
 yy85czaEDrgYI2mNDqQGLW1YyoqSkiJJlV63txQ1Nk4kCx9MZ2RhRMmgWXEaNZFJq7SxCkU/btQ
 8e3xObIIkx5rtVtBwjTq7N1G/e6hUQ==
X-Authority-Analysis: v=2.4 cv=V8xwEOni c=1 sm=1 tr=0 ts=6910a755 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=wx_w4_m59dWKJ5at3RkA:9
 a=QEXdDO2ut3YA:10 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-ORIG-GUID: UU1yfiOaywK72aLZW3etMP_x2Li2gMaz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-09_06,2025-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 malwarescore=0 impostorscore=0 spamscore=0
 phishscore=0 adultscore=0 lowpriorityscore=0 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511090129

Devres APIs are intended for use in drivers, and they should be
avoided in shared subsystem code which is being used by multiple
drivers. Avoid using devres based allocations in the reboot-mode
subsystem and manually free the resources.

Replace devm_kzalloc with kzalloc and handle memory cleanup
explicitly.

Fixes: 4fcd504edbf7 ("power: reset: add reboot mode driver")
Signed-off-by: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
---
 drivers/power/reset/reboot-mode.c | 30 ++++++++++++++++++++----------
 1 file changed, 20 insertions(+), 10 deletions(-)

diff --git a/drivers/power/reset/reboot-mode.c b/drivers/power/reset/reboot-mode.c
index fba53f638da04655e756b5f8b7d2d666d1379535..ac4223794083f36960b2bd37a601b7e1f1872de5 100644
--- a/drivers/power/reset/reboot-mode.c
+++ b/drivers/power/reset/reboot-mode.c
@@ -3,6 +3,8 @@
  * Copyright (c) 2016, Fuzhou Rockchip Electronics Co., Ltd
  */
 
+#define pr_fmt(fmt)	"reboot-mode: " fmt
+
 #include <linux/device.h>
 #include <linux/init.h>
 #include <linux/kernel.h>
@@ -71,6 +73,7 @@ static int reboot_mode_notify(struct notifier_block *this,
 int reboot_mode_register(struct reboot_mode_driver *reboot)
 {
 	struct mode_info *info;
+	struct mode_info *next;
 	struct property *prop;
 	struct device_node *np = reboot->dev->of_node;
 	size_t len = strlen(PREFIX);
@@ -82,29 +85,27 @@ int reboot_mode_register(struct reboot_mode_driver *reboot)
 		if (strncmp(prop->name, PREFIX, len))
 			continue;
 
-		info = devm_kzalloc(reboot->dev, sizeof(*info), GFP_KERNEL);
+		info = kzalloc(sizeof(*info), GFP_KERNEL);
 		if (!info) {
 			ret = -ENOMEM;
 			goto error;
 		}
 
 		if (of_property_read_u32(np, prop->name, &info->magic)) {
-			dev_err(reboot->dev, "reboot mode %s without magic number\n",
-				info->mode);
-			devm_kfree(reboot->dev, info);
+			pr_err("reboot mode %s without magic number\n", info->mode);
+			kfree(info);
 			continue;
 		}
 
 		info->mode = kstrdup_const(prop->name + len, GFP_KERNEL);
 		if (!info->mode) {
 			ret =  -ENOMEM;
-			goto error;
+			goto err_info;
 		} else if (info->mode[0] == '\0') {
 			kfree_const(info->mode);
 			ret = -EINVAL;
-			dev_err(reboot->dev, "invalid mode name(%s): too short!\n",
-				prop->name);
-			goto error;
+			pr_err("invalid mode name(%s): too short!\n", prop->name);
+			goto err_info;
 		}
 
 		list_add_tail(&info->list, &reboot->head);
@@ -115,9 +116,14 @@ int reboot_mode_register(struct reboot_mode_driver *reboot)
 
 	return 0;
 
+err_info:
+	kfree(info);
 error:
-	list_for_each_entry(info, &reboot->head, list)
+	list_for_each_entry_safe(info, next, &reboot->head, list) {
+		list_del(&info->list);
 		kfree_const(info->mode);
+		kfree(info);
+	}
 
 	return ret;
 }
@@ -130,11 +136,15 @@ EXPORT_SYMBOL_GPL(reboot_mode_register);
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


