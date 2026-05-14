Return-Path: <linux-arm-msm+bounces-107651-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kJBTLFrcBWokcgIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-107651-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 May 2026 16:29:46 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 10D6E5431B6
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 May 2026 16:29:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 15D19307A35C
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 May 2026 14:27:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D57333F2109;
	Thu, 14 May 2026 14:27:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XlROFoIB";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="M69h1C/u"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29A343FE34A
	for <linux-arm-msm@vger.kernel.org>; Thu, 14 May 2026 14:27:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778768852; cv=none; b=aUR/bHPv257ko59Wjo3fMmY0POzwgNl4kIlNtPhySo8ROvEjqZXJrjvrCwjZoiSksL8dchxgVW2R146pqh2i4d8o2ozk52DGzXPP9Wf7o6uOPoUioHx1F3EeXphr1yeKsDADVePJXF86LvT7/SQ3c1dWvsM00JzrquoJqniClE4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778768852; c=relaxed/simple;
	bh=c0E+9Z2fyXM2CTKY2rFdNofWBhkxlwIO4amIwNdSABM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=b8Vyfxy7AIUxNceFJQUGBuUAG5l9bPQRShOnlXbtH6wOQ+6rIPf8h5NQawc9kdy2+3EqUymh96qNMp895jHm/JukxdFddn0OKSDmll7eAAqAJbw7Vjvm1bpcLJJM9qWNp30q6u5Ezey4VzPdsL9E2JmT4ZnDh+96kPcJRyp5fJ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XlROFoIB; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=M69h1C/u; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64EBeRUU3951635
	for <linux-arm-msm@vger.kernel.org>; Thu, 14 May 2026 14:27:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	NTa5Z0fUDWnU+L8/u/WQyWQDpDzKW0OBql8292A1sZs=; b=XlROFoIBkPohB195
	KgDer0B4WWYjFLnsTCTJVxh7rJFtEL5BmKAfz/u4PvqV7ByMa/P4na6JHCCsPN07
	CERLUxffjKbHGaotq5dWIigouKgGUJHMwI4OL4SlihaZFlZF5wSQJmQXw2t5V4Og
	/axZGT4zQfoQ1xRVfh6JpIz8mPGvAAxLpiXcSMUPnWkoZeuQpcqsqdx9bEsVWZnN
	dSN994+qOwP7w41mG731OjIcCgHEzieGSzMmnnHi1xh4p3k0tf8nnLWdFASi47cd
	hSjHNU16RvqbAWLJRs2ppdNxaHOzmUrM8CxBz4yKck/1XNZUsrwnjND7ASNVgHdK
	OzpMfg==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e57kssxe6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 14 May 2026 14:27:30 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2bc763c7256so119503185ad.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 14 May 2026 07:27:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778768850; x=1779373650; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NTa5Z0fUDWnU+L8/u/WQyWQDpDzKW0OBql8292A1sZs=;
        b=M69h1C/uzm15RC48j6srIdKVK3u4uxHyBqbHenfeBNuNpFaBYy7CkEgN7eFAjDwBEg
         XuiV6Ups2sgKg8cERO75R/yH9gnIfEktRKZ5nWTDj1DnGcDgm3e8TKxkhrOG2q1Y1m6z
         OHZWsiFDNgLrRi2rfDpz81+snTMWB0lpUjQkcpAW2kt4vuhIwpZMxYoZEPXaGaiSSgUR
         T8Fs3E+l6N4+OhEEB6jimqvMqlPXEz2xrPLeAkGoB08A9y7L9VkvvDckrBDLXgpCNt6p
         St5xqV7ObTL+gdtx0ULdzdkRvl059t0mhYe/6Cq4d9d8obMh70Ac580mev6OilfbUYPo
         nNag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778768850; x=1779373650;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=NTa5Z0fUDWnU+L8/u/WQyWQDpDzKW0OBql8292A1sZs=;
        b=R5xG7z79NmaBO+qGnD/wN/uMKrCGqiEHs1XEj2A6DwEinX7IqzRH/Ij+kmA/ojy9qT
         V47Z4eO5wb7DOcnbdNqPTGDnCzdh/TLfDMFNTh17w3uYaP7gqit/nVs3jT+1rE01RL1E
         Ow2SoWKdY8Ej7dcfacvcb5KpiEeFuDvVoFoMSJwm9ZZ1jWqBcUlcnIsH8F7G9d+qv87A
         cKKglCwoZaUq2+PqjxKTwqaFpmJMR7nrLbNbPEBk7kLxdeE69oXrDsxlMpSxdU3FlBSK
         pkbTzsCCSZYmk8d9uk5boZDmJNTQTEstAMliz34BRp8E+Hc3hq2Z3D98GEPXFlK32KSt
         rjuw==
X-Forwarded-Encrypted: i=1; AFNElJ8OymLa9qHMEBo11JYEt8vdpdfEoUw3UIUwAkKxqfALSgeJNkDoRNGdwoQ9nKyX4CviQQe5rzxv2SON5ay+@vger.kernel.org
X-Gm-Message-State: AOJu0YzjjUPID19QDhHpOeUK5Gy4MwgSav1rFPgIi25wTfOSQoy/9hp/
	bWm2shdrS7VVbbM5KlgDGCCTYnXrn4nt/ByR+G5/IySnAZUd6v/zDa3yKF/Y3by7sSyIf2tWA6D
	/ThEfTbM2zjT4Lt5Yqys/ec27xBeJpdXgGdaCpIkfTb/fN/F/BJyDSWxo9nzZB19XW4mM
X-Gm-Gg: Acq92OHJSruTPyMXD7k7rONAYNI3GlpIHphfhJViJxNbeWqZ6WQ/s5l+HSZaLKKod/C
	4xMSLff4n+8v9Sqx/ghus5LFLf9HH9tyAIybnolltqr9k4AaP8auaQF6qyFoGw5MstIjawWM5t8
	Zn77sDdwcmQdpU53RgkjcDnXbzPLBM+64anIvSToHKgPvVbjT60R19Pg6NTdDB6mSJDaSQogUMD
	C3Zvy3t/aqLg5VQ8N3UqLEcS3QZ0rpbFKb/RUrkuaJNywtmvbFkrHdXaexWg5V2kzeb+WEK/TQF
	QtEPYB7pVjVj7kkccl9tR8BdlPIS7Gk+gOK6GOebLts8Uye46dQYOZ81f6TMNqkWjZhRVebDtyt
	5dJ/k7OBrxPGrdHt5Crv9YJVPqmvpKy2oxYx8EGA66g5Zz5w/rpdStj4kVA==
X-Received: by 2002:a17:903:3d0b:b0:2b4:5aff:de60 with SMTP id d9443c01a7336-2bd276f2a6dmr95801575ad.22.1778768849462;
        Thu, 14 May 2026 07:27:29 -0700 (PDT)
X-Received: by 2002:a17:903:3d0b:b0:2b4:5aff:de60 with SMTP id d9443c01a7336-2bd276f2a6dmr95801115ad.22.1778768848834;
        Thu, 14 May 2026 07:27:28 -0700 (PDT)
Received: from hu-spratap-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2bd5c05ffbesm28566485ad.27.2026.05.14.07.27.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 May 2026 07:27:28 -0700 (PDT)
From: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
Date: Thu, 14 May 2026 19:55:44 +0530
Subject: [PATCH v22 03/13] power: reset: reboot-mode: Add support for
 predefined reboot modes
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260514-arm-psci-system_reset2-vendor-reboots-v22-3-28a5bde07483@oss.qualcomm.com>
References: <20260514-arm-psci-system_reset2-vendor-reboots-v22-0-28a5bde07483@oss.qualcomm.com>
In-Reply-To: <20260514-arm-psci-system_reset2-vendor-reboots-v22-0-28a5bde07483@oss.qualcomm.com>
To: Sebastian Reichel <sre@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@kernel.org>,
        Christian Loehle <christian.loehle@arm.com>,
        Ulf Hansson <ulfh@kernel.org>, Lee Jones <lee@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
        Souvik Chakravarty <Souvik.Chakravarty@arm.com>,
        Andy Yan <andy.yan@rock-chips.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        John Stultz <john.stultz@linaro.org>,
        Moritz Fischer <moritz.fischer@ettus.com>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Sudeep Holla <sudeep.holla@kernel.org>, Ulf Hansson <ulfh@kernel.org>
Cc: linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        devicetree@vger.kernel.org,
        Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>,
        Florian Fainelli <florian.fainelli@broadcom.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Andre Draszik <andre.draszik@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>,
        Srinivas Kandagatla <srini@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778768806; l=11586;
 i=shivendra.pratap@oss.qualcomm.com; s=20250710; h=from:subject:message-id;
 bh=c0E+9Z2fyXM2CTKY2rFdNofWBhkxlwIO4amIwNdSABM=;
 b=ZX/qRQMIKdlkNUrKGzne/vk8+ntfzJi9dYdwUsB3kK1cBmW3G5xbdgok6qfqVmFISWk/uhJbl
 b85DPBsEbqiAEs1k71lUHnmEKHdU01FnndhhCnBhPyJa55ftE5krjl3
X-Developer-Key: i=shivendra.pratap@oss.qualcomm.com; a=ed25519;
 pk=CpsuL7yZ8NReDPhGgq6Xn/SRoa59mAvzWOW0QZoo4gw=
X-Proofpoint-GUID: -rWmrkD41k8NtlKd8VNrmtGDPGdDLK7t
X-Authority-Analysis: v=2.4 cv=KZbidwYD c=1 sm=1 tr=0 ts=6a05dbd2 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=sGFwGsstBXFWfJrNqcQA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE0MDE0NiBTYWx0ZWRfXx0Kl31WkT9kg
 9KYpXUZxOcgAvtBEItsxvYLhS7TApaoabk5fo5mhEXoEI7jsfFVW2wyAeelg4abCvfqFc53eoLo
 699OmaGJXPfex2Vyn7uAPglbC4VI5khlHygA6u/lx17wULXKXzfdLBervEJ3td19J+Apjvs1PjE
 FIVO1BYkYqw84sfuh7xuMJ4SsbDohrXiajwi52fb0e83vz5FMxH7DkMKjUlqfDhq8n6LMhVOUIM
 yepi1gTrQSFrxVU68IRrLafddTpVvF5/Es1KvuSqx2p7YIKRiNZ2rjUY4cjsPDaN4hNIS76elwK
 ALuupdKANiZG0XUJXBSxE7YZL0Hhyodpzl2MP155s7DR9Z8vHKzHrvofSuOBSMqEilukHiJfvIy
 hveHaG4ASJOAQoLwDgnb1KBuHHZ7u+hmDtADNj8BPI4q70INyhFCQGQVRg3bcDclyRjHwm8mrxR
 XdxcFsVvTHjNMra7tWg==
X-Proofpoint-ORIG-GUID: -rWmrkD41k8NtlKd8VNrmtGDPGdDLK7t
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-14_03,2026-05-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0 impostorscore=0 phishscore=0 lowpriorityscore=0
 priorityscore=1501 adultscore=0 malwarescore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605050000 definitions=main-2605140146
X-Rspamd-Queue-Id: 10D6E5431B6
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-107651-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns];
	FREEMAIL_TO(0.00)[kernel.org,arm.com,arndb.de,rock-chips.com,gmail.com,linaro.org,ettus.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[36];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[shivendra.pratap@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

reboot-mode based drivers can define a reboot-mode by adding it under
the reboot-mode node in device tree. This limits such drivers, to define
any predefined reboot-modes statically within the driver and creates a
dependency on device-tree.

Extend the reboot-mode framework to handle predefined modes alongside
those defined in device tree. Drivers can now define their own
reboot-modes and register them via the framework. A centralized init
call has been added to the reboot-mode framework and adopted by
existing drivers. This ensures driver state is initialized together
with predefined modes.

Signed-off-by: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
---
 drivers/power/reset/nvmem-reboot-mode.c  |   4 +-
 drivers/power/reset/qcom-pon.c           |   4 +-
 drivers/power/reset/reboot-mode.c        | 142 ++++++++++++++++++++++++-------
 drivers/power/reset/syscon-reboot-mode.c |   4 +-
 include/linux/reboot-mode.h              |  13 +++
 5 files changed, 130 insertions(+), 37 deletions(-)

diff --git a/drivers/power/reset/nvmem-reboot-mode.c b/drivers/power/reset/nvmem-reboot-mode.c
index bd05d660490c686b43134f82f1eadd7665403d20..50e5e1ff4cd3b14f634dc50cdadd97472cf0b1d0 100644
--- a/drivers/power/reset/nvmem-reboot-mode.c
+++ b/drivers/power/reset/nvmem-reboot-mode.c
@@ -51,8 +51,8 @@ static int nvmem_reboot_mode_probe(struct platform_device *pdev)
 	if (!nvmem_rbm)
 		return -ENOMEM;
 
-	nvmem_rbm->reboot.dev = &pdev->dev;
-	nvmem_rbm->reboot.write = nvmem_reboot_mode_write;
+	reboot_mode_driver_init(&nvmem_rbm->reboot, &pdev->dev,
+				nvmem_reboot_mode_write);
 
 	nvmem_rbm->cell = devm_nvmem_cell_get(&pdev->dev, "reboot-mode");
 	if (IS_ERR(nvmem_rbm->cell)) {
diff --git a/drivers/power/reset/qcom-pon.c b/drivers/power/reset/qcom-pon.c
index 57b36e6186f80aff947fd7f5aae5ce280c65dc6b..95d6f5dd134d54783f5ab6c600d455862e3d39f1 100644
--- a/drivers/power/reset/qcom-pon.c
+++ b/drivers/power/reset/qcom-pon.c
@@ -70,9 +70,9 @@ static int qcom_pon_probe(struct platform_device *pdev)
 	reason_shift = (long)of_device_get_match_data(&pdev->dev);
 
 	if (reason_shift != NO_REASON_SHIFT) {
-		pon->reboot_mode.dev = &pdev->dev;
+		reboot_mode_driver_init(&pon->reboot_mode, &pdev->dev,
+					qcom_pon_reboot_mode_write);
 		pon->reason_shift = reason_shift;
-		pon->reboot_mode.write = qcom_pon_reboot_mode_write;
 		error = devm_reboot_mode_register(&pdev->dev, &pon->reboot_mode);
 		if (error) {
 			dev_err(&pdev->dev, "can't register reboot mode\n");
diff --git a/drivers/power/reset/reboot-mode.c b/drivers/power/reset/reboot-mode.c
index f1372dc700e48043320812c3d3619ab1539e1854..d76aee524749a6ec3dff9729c2b678b7244e4f09 100644
--- a/drivers/power/reset/reboot-mode.c
+++ b/drivers/power/reset/reboot-mode.c
@@ -31,12 +31,12 @@ struct reboot_mode_sysfs_data {
 	struct list_head head;
 };
 
-static inline void reboot_mode_release_list(struct reboot_mode_sysfs_data *priv)
+static inline void reboot_mode_release_list(struct list_head *head)
 {
 	struct mode_info *info;
 	struct mode_info *next;
 
-	list_for_each_entry_safe(info, next, &priv->head, list) {
+	list_for_each_entry_safe(info, next, head, list) {
 		list_del(&info->list);
 		kfree_const(info->mode);
 		kfree(info);
@@ -116,6 +116,51 @@ static int reboot_mode_notify(struct notifier_block *this,
 	return NOTIFY_DONE;
 }
 
+/**
+ * reboot_mode_driver_init - Initialize reboot-mode state
+ * @reboot: reboot mode driver object to initialize
+ * @dev: backing device
+ * @write: write callback for programming magic
+ *
+ * This function must be called with a valid @dev and @write before calling
+ * reboot_mode_register(), reboot_mode_add_predefined_modes(), or any other
+ * reboot-mode framework API.
+ */
+void reboot_mode_driver_init(struct reboot_mode_driver *reboot,
+			     struct device *dev,
+			     int (*write)(struct reboot_mode_driver *reboot, u64 magic))
+{
+	memset(reboot, 0, sizeof(*reboot));
+	reboot->dev = dev;
+	reboot->write = write;
+	INIT_LIST_HEAD(&reboot->head);
+	INIT_LIST_HEAD(&reboot->predefined_modes);
+}
+EXPORT_SYMBOL_GPL(reboot_mode_driver_init);
+
+static struct mode_info *reboot_mode_create_info(const char *mode, u64 magic)
+{
+	struct mode_info *info;
+
+	if (!mode || mode[0] == '\0') {
+		pr_err("invalid mode name(%s): too short!\n", mode);
+		return ERR_PTR(-EINVAL);
+	}
+
+	info = kzalloc_obj(*info, GFP_KERNEL);
+	if (!info)
+		return ERR_PTR(-ENOMEM);
+
+	info->mode = kstrdup_const(mode, GFP_KERNEL);
+	if (!info->mode) {
+		kfree(info);
+		return ERR_PTR(-ENOMEM);
+	}
+
+	info->magic = magic;
+	return info;
+}
+
 static int reboot_mode_create_device(struct reboot_mode_driver *reboot)
 {
 	struct reboot_mode_sysfs_data *priv;
@@ -157,7 +202,7 @@ static int reboot_mode_create_device(struct reboot_mode_driver *reboot)
 	return 0;
 
 error:
-	reboot_mode_release_list(priv);
+	reboot_mode_release_list(&priv->head);
 	kfree(priv);
 	return ret;
 }
@@ -170,7 +215,7 @@ static int reboot_mode_create_device(struct reboot_mode_driver *reboot)
  */
 int reboot_mode_register(struct reboot_mode_driver *reboot)
 {
-	struct mode_info *info = NULL;
+	struct mode_info *info;
 	struct property *prop;
 	struct device_node *np = reboot->dev->of_node;
 	size_t len = strlen(PREFIX);
@@ -180,9 +225,11 @@ int reboot_mode_register(struct reboot_mode_driver *reboot)
 
 	INIT_LIST_HEAD(&reboot->head);
 
+	if (!np)
+		goto predefined_modes;
+
 	for_each_property_of_node(np, prop) {
 		memset(magic, 0, sizeof(magic));
-
 		if (strncmp(prop->name, PREFIX, len))
 			continue;
 
@@ -194,28 +241,18 @@ int reboot_mode_register(struct reboot_mode_driver *reboot)
 			continue;
 		}
 
-		info = kzalloc(sizeof(*info), GFP_KERNEL);
-		if (!info) {
-			ret = -ENOMEM;
-			goto error;
-		}
-
-		info->magic = REBOOT_MODE_MAGIC(magic[0], magic[1]);
-		info->mode = kstrdup_const(prop->name + len, GFP_KERNEL);
-		if (!info->mode) {
-			ret =  -ENOMEM;
-			goto error;
-		} else if (info->mode[0] == '\0') {
-			kfree_const(info->mode);
-			ret = -EINVAL;
-			pr_err("invalid mode name(%s): too short!\n", prop->name);
+		info = reboot_mode_create_info(prop->name + len,
+					       REBOOT_MODE_MAGIC(magic[0], magic[1]));
+		if (IS_ERR(info)) {
+			ret = PTR_ERR(info);
 			goto error;
 		}
 
 		list_add_tail(&info->list, &reboot->head);
-		info = NULL;
 	}
 
+predefined_modes:
+	list_splice_tail_init(&reboot->predefined_modes, &reboot->head);
 	reboot->reboot_notifier.notifier_call = reboot_mode_notify;
 	register_reboot_notifier(&reboot->reboot_notifier);
 
@@ -226,7 +263,6 @@ int reboot_mode_register(struct reboot_mode_driver *reboot)
 	return 0;
 
 error:
-	kfree(info);
 	reboot_mode_unregister(reboot);
 	return ret;
 }
@@ -259,7 +295,7 @@ static inline void reboot_mode_unregister_device(struct reboot_mode_driver *rebo
 	if (!priv)
 		return;
 
-	reboot_mode_release_list(priv);
+	reboot_mode_release_list(&priv->head);
 	kfree(priv);
 }
 
@@ -269,17 +305,12 @@ static inline void reboot_mode_unregister_device(struct reboot_mode_driver *rebo
  */
 int reboot_mode_unregister(struct reboot_mode_driver *reboot)
 {
-	struct mode_info *info;
-	struct mode_info *next;
-
 	unregister_reboot_notifier(&reboot->reboot_notifier);
+	reboot->reboot_notifier.notifier_call = NULL;
 	reboot_mode_unregister_device(reboot);
 
-	list_for_each_entry_safe(info, next, &reboot->head, list) {
-		list_del(&info->list);
-		kfree_const(info->mode);
-		kfree(info);
-	}
+	reboot_mode_release_list(&reboot->head);
+	reboot_mode_release_list(&reboot->predefined_modes);
 
 	return 0;
 }
@@ -344,6 +375,55 @@ void devm_reboot_mode_unregister(struct device *dev,
 }
 EXPORT_SYMBOL_GPL(devm_reboot_mode_unregister);
 
+/**
+ * reboot_mode_add_predefined_modes - Add predefined reboot modes
+ * @reboot: reboot mode driver
+ * @modes: array of predefined reboot mode entries
+ * @count: number of entries in @modes
+ *
+ * Add predefined reboot modes in a single call before registration.
+ *
+ * @reboot must be initialized with reboot_mode_driver_init() before calling
+ * this function.
+ *
+ * Returns: 0 on success, -EINVAL if @modes is NULL, @count is 0, or an entry
+ *          has an invalid name, -EBUSY if called after reboot_mode_register()
+ *          or if predefined modes are already present, or -ENOMEM on allocation
+ *          failures.
+ */
+int reboot_mode_add_predefined_modes(struct reboot_mode_driver *reboot,
+				     const struct reboot_mode_entry *modes,
+				     size_t count)
+{
+	struct mode_info *info;
+	int ret;
+	size_t i;
+
+	if (reboot->reboot_notifier.notifier_call == reboot_mode_notify ||
+	    !list_empty(&reboot->predefined_modes))
+		return -EBUSY;
+
+	if (!modes || !count)
+		return -EINVAL;
+
+	for (i = 0; i < count; i++) {
+		info = reboot_mode_create_info(modes[i].name, modes[i].magic);
+		if (IS_ERR(info)) {
+			ret = PTR_ERR(info);
+			goto error;
+		}
+
+		list_add_tail(&info->list, &reboot->predefined_modes);
+	}
+
+	return 0;
+
+error:
+	reboot_mode_release_list(&reboot->predefined_modes);
+	return ret;
+}
+EXPORT_SYMBOL_GPL(reboot_mode_add_predefined_modes);
+
 static int __init reboot_mode_init(void)
 {
 	return class_register(&reboot_mode_class);
diff --git a/drivers/power/reset/syscon-reboot-mode.c b/drivers/power/reset/syscon-reboot-mode.c
index 9f4b18c5e46f6a8bf197773ceceb80b250f57541..55f2fd33e0d2abc599848c936619cb6cdbaed47d 100644
--- a/drivers/power/reset/syscon-reboot-mode.c
+++ b/drivers/power/reset/syscon-reboot-mode.c
@@ -45,8 +45,8 @@ static int syscon_reboot_mode_probe(struct platform_device *pdev)
 	if (!syscon_rbm)
 		return -ENOMEM;
 
-	syscon_rbm->reboot.dev = &pdev->dev;
-	syscon_rbm->reboot.write = syscon_reboot_mode_write;
+	reboot_mode_driver_init(&syscon_rbm->reboot, &pdev->dev,
+				syscon_reboot_mode_write);
 	syscon_rbm->mask = 0xffffffff;
 
 	syscon_rbm->map = syscon_node_to_regmap(pdev->dev.parent->of_node);
diff --git a/include/linux/reboot-mode.h b/include/linux/reboot-mode.h
index 2ce189fdfff4b396d7cc6f175b30016781ae4fe9..4503ee388cd00d5e004600d51056d623ea23e345 100644
--- a/include/linux/reboot-mode.h
+++ b/include/linux/reboot-mode.h
@@ -15,18 +15,31 @@
 /* Get 32 bit arg2 from 64 bit magic */
 #define REBOOT_MODE_ARG2(magic) FIELD_GET(GENMASK_ULL(63, 32), magic)
 
+struct reboot_mode_entry {
+	const char *name;
+	u64 magic;
+};
+
 struct reboot_mode_driver {
 	struct device *dev;
 	struct list_head head;
+	/* List of predefined reboot-modes, populated via reboot_mode_add_predefined_modes(). */
+	struct list_head predefined_modes;
 	int (*write)(struct reboot_mode_driver *reboot, u64 magic);
 	struct notifier_block reboot_notifier;
 };
 
+void reboot_mode_driver_init(struct reboot_mode_driver *reboot,
+			     struct device *dev,
+			     int (*write)(struct reboot_mode_driver *reboot, u64 magic));
 int reboot_mode_register(struct reboot_mode_driver *reboot);
 int reboot_mode_unregister(struct reboot_mode_driver *reboot);
 int devm_reboot_mode_register(struct device *dev,
 			      struct reboot_mode_driver *reboot);
 void devm_reboot_mode_unregister(struct device *dev,
 				 struct reboot_mode_driver *reboot);
+int reboot_mode_add_predefined_modes(struct reboot_mode_driver *reboot,
+				     const struct reboot_mode_entry *modes,
+				     size_t count);
 
 #endif

-- 
2.34.1


