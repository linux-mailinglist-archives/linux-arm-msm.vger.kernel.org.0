Return-Path: <linux-arm-msm+bounces-66793-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DC64BB13073
	for <lists+linux-arm-msm@lfdr.de>; Sun, 27 Jul 2025 18:25:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9593A3BA196
	for <lists+linux-arm-msm@lfdr.de>; Sun, 27 Jul 2025 16:25:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2C67C21C192;
	Sun, 27 Jul 2025 16:25:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Pc3A8fbH"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C7BD21CC62
	for <linux-arm-msm@vger.kernel.org>; Sun, 27 Jul 2025 16:25:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753633516; cv=none; b=IelHWp4jNr0RU1pmmjxS4FkuhRqNG2xLEazXfVszZQ5VDS05Ka1DCJqfYYdcaiXMDpdtIpNX5TIYKufOqooFNvl0uKwxxmMYV8euLZrUCmKmIw+6+t3+g7HUrsHF9eojzHvqeA03w35ST3wyMyCLIgMw2ifiYGS8bgq5OQLTa20=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753633516; c=relaxed/simple;
	bh=FC7RrRfjKXNVyHBQzF6uwLhcss5N7idT7lbjBm/hwDg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=j5x0+JwNn5Nd6WtZYvMLI3wbCqT8TrG9pcM4ZxaUBFLbldpzabw64yI8psrrwGEuzorZ6w2rB8Pvx2qsz/Pae4ySu5mr+9cl3zRZalFYkGkEHaKLqCwklTlBqhSQr9BGuZd5IzCb90RU5fWSqEvwuS4KlECaaq6M3IO6T3hKYuU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Pc3A8fbH; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56RDcfOs002055
	for <linux-arm-msm@vger.kernel.org>; Sun, 27 Jul 2025 16:25:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	v4YCBWmY0mp9H7MQ3j2gakQJBYTosZxb2APt1bK5h/Q=; b=Pc3A8fbHKs3Uzph6
	DOtrmF5OwSYALF4PY5i7D4F9VXczqAzOrGND4qpa31lWhSlECsdAM/Rv4UFEdQ0i
	PItIVzMOGcrEIvfVFmOaH6NMP1HobYfzXXQ1ND/NB3IBKJhSIlUqY6TA9APIg+Tt
	e1sTVP0biTCkzmhm7UJZ3sNscRVQP0mN9u4tZburAFKw1BFE7BUi7xcbw6c5A1VA
	RX8LUHXTMNCktcb+mBTF5LuLW/dF9nwiio3oRhv7tX98JxczkchN69iHw3NzOnQY
	ZN4w5vyjeIdcPP26WobDOofu4PNgdsS2iG+5STLfwXKwGW+iUlu86bPbW6Ca8HDK
	LnMiEQ==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 484q3xjas4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 27 Jul 2025 16:25:13 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-23824a9bc29so61268625ad.3
        for <linux-arm-msm@vger.kernel.org>; Sun, 27 Jul 2025 09:25:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753633511; x=1754238311;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=v4YCBWmY0mp9H7MQ3j2gakQJBYTosZxb2APt1bK5h/Q=;
        b=sTqm7sl2SDvhHdEE4Cup6s6jYaj79GzUBPnRW7wVEhk465D63dzIRwvPX9cQFifRqg
         9hJSQdXWoJ6JTeOLjzdZ+s0/CrrKO6qtZ++SzIFUJs8xRUFlOYfUuShQdF8db9xMJT/S
         PeA1Vfzn1aBLXEJX/4ncv7Tac5L5uu9RswAyGqU19QmDQAtbkDzuRghXyzPmiod9XkoS
         qomZr492UbeMyxYW5yYWLVyf30eTKTok1rqITZQmjEQb9597LO9ahR6WPKGpM4wYZ8fU
         mF5oNd/hCzuKME12PFQTutuM+kefIH5lN8ay0QQNpBmNJes5QuUCKqPu5cSDnZvCBdMW
         L6JA==
X-Forwarded-Encrypted: i=1; AJvYcCXgDhImnyp9pl9mkTW1TWdUOVKmY9Hezhaw68gzbJ/Eo1ZAPXPCCp3jR53WDjESN5KKYYR5+lPY+8w+xbi1@vger.kernel.org
X-Gm-Message-State: AOJu0YzY6FjsJpLRGCMsGLEyyzBycNxqkPLiPaWDJDBnN1duu/l8ZsQk
	TKvhBEwUU20Zd7PDHadGVlHkImcd+qsHKf5B5Yj+ooEnjQkMK5GkRW6wGeuTsDxXQgd2l01B/3G
	wPxxpnZtaiW8A1IxyyO/oyksMdvs3y8nd/sBN6a1gR7zT/+vlB+3lK39a3yps3LHNgA/Je30ddE
	UH
X-Gm-Gg: ASbGncump+ZHLkarJEUCKdle0adcHnOveJqxsQw7Rx/BeSLMt86IMhzBJU8zUY0nwB4
	BcXUNH0yHHEHyyRSMdRwfV7aGYEIwb1MCnochU59xWDKBsiWicdgdryMI2FvwOYzSdz44UhI6m+
	qCghARrJe9Q2dpxa+o0MtMdMAb37Kj2aq4hMP7V8o31LG+IPr5ca+vdWq/M7TI1PaRyDX7wqnkq
	gonzk8NkLQsPIxivP8MpkCgVBdBxdiqw/7GkNNBskleDW83wL683Va+GgIRJof9GoVwyZmD7IAy
	flSJMx5IJWExPxFFgPbiJdUnD5r6FcWx4kqukF/1NnZmLu/3CNudW2WPmDYXXGeMU1oAoe1bZSR
	j
X-Received: by 2002:a17:902:ccc9:b0:240:2eb6:d5cc with SMTP id d9443c01a7336-2402eb6d9e9mr9977005ad.17.1753633511474;
        Sun, 27 Jul 2025 09:25:11 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEVQHJRnmueFVtjE5Xgx+LUDsaynix8FLVjXOCUqpUqvT52MAlWGQMEYT0tAC2uOxsMT2zpuQ==
X-Received: by 2002:a17:902:ccc9:b0:240:2eb6:d5cc with SMTP id d9443c01a7336-2402eb6d9e9mr9976695ad.17.1753633511036;
        Sun, 27 Jul 2025 09:25:11 -0700 (PDT)
Received: from hu-spratap-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23fd9397ebbsm29110325ad.210.2025.07.27.09.25.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Jul 2025 09:25:10 -0700 (PDT)
From: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
Date: Sun, 27 Jul 2025 21:54:44 +0530
Subject: [PATCH v13 01/10] power: reset: reboot-mode: Synchronize list
 traversal
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250727-arm-psci-system_reset2-vendor-reboots-v13-1-6b8d23315898@oss.qualcomm.com>
References: <20250727-arm-psci-system_reset2-vendor-reboots-v13-0-6b8d23315898@oss.qualcomm.com>
In-Reply-To: <20250727-arm-psci-system_reset2-vendor-reboots-v13-0-6b8d23315898@oss.qualcomm.com>
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
        Florian Fainelli <florian.fainelli@broadcom.com>
Cc: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Stephen Boyd <swboyd@chromium.org>,
        Andre Draszik <andre.draszik@linaro.org>, linux-pm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        Elliot Berman <quic_eberman@quicinc.com>,
        Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>,
        Srinivas Kandagatla <srini@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1753633495; l=3679;
 i=shivendra.pratap@oss.qualcomm.com; s=20250710; h=from:subject:message-id;
 bh=FC7RrRfjKXNVyHBQzF6uwLhcss5N7idT7lbjBm/hwDg=;
 b=wuM7Ud9mvdBgYMygF1JESinqXl7pH9Sn1j9nV94LYy4tSZEq96eslDnylVV4vStbiMeqYy+l1
 Cs6ZBdqK3AwBOUismrxPOsG47QSiHQe0Arf9SH5ULtsQcLsU7g18Y+3
X-Developer-Key: i=shivendra.pratap@oss.qualcomm.com; a=ed25519;
 pk=CpsuL7yZ8NReDPhGgq6Xn/SRoa59mAvzWOW0QZoo4gw=
X-Authority-Analysis: v=2.4 cv=JovxrN4C c=1 sm=1 tr=0 ts=688652e9 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=iWTyA_h5fkyOTIp6uasA:9
 a=QEXdDO2ut3YA:10 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-ORIG-GUID: JYq7_Joouf8-9r5IJz3wTKRPtobaIfBt
X-Proofpoint-GUID: JYq7_Joouf8-9r5IJz3wTKRPtobaIfBt
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzI3MDE0MSBTYWx0ZWRfX1FBskJuyzkRh
 xhFApec4YHRNePOto5QoD/0Is7+VUNYWrEyb1Sn5qc2qj1bwsK690DrwBDhJxpwZNZV/vt+xAe5
 A25royPLoei7P/1E0UqVOy8Yk0kZ8mVUsOiRYABXCFWt91NNH9ujKLwnH/3lOXxKNYMQicugE9w
 3gdGfe4vh9wJsSvG28piEUtU13QsD9Jgm0MQ08hjgkCdXROnHkvs8lv1xxZOSRjNP8uWd4lay7L
 asHU4F/oEd73dRxrDDX2XoSWTA1n9hegSvexb6itHSCHHkZykgdv6/jcQCQ9e3bKsMNca2BGkyk
 bJRMw4hwaZrPPBNnqDoYbwjPEVwSizhdAZYJgkVdBNfOVFMA/UbTtNXPpTQy7jV46ZZl9Leb4PV
 TVf3mUI9xMlGrq9UlxMopzEOj8lmTXtykSyHmaBgdKE8qmMBBPGgKvdIb1L0tszRcnoVy48Y
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-27_05,2025-07-24_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 priorityscore=1501 bulkscore=0 impostorscore=0
 lowpriorityscore=0 phishscore=0 suspectscore=0 spamscore=0 mlxlogscore=999
 mlxscore=0 adultscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507270141

List traversals must be synchronized to prevent race conditions
and data corruption. The reboot-mode list is not protected by a
lock currently, which can lead to concurrent access and race.

Introduce a mutex lock to guard all operations on the reboot-mode
list and ensure thread-safe access. The change prevents unsafe
concurrent access on reboot-mode list.

Signed-off-by: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
---
 drivers/power/reset/reboot-mode.c | 24 ++++++++++++++++++++----
 include/linux/reboot-mode.h       |  4 ++++
 2 files changed, 24 insertions(+), 4 deletions(-)

diff --git a/drivers/power/reset/reboot-mode.c b/drivers/power/reset/reboot-mode.c
index fba53f638da04655e756b5f8b7d2d666d1379535..42bb99128ed3846d4bff62416dc31135ddeaeb90 100644
--- a/drivers/power/reset/reboot-mode.c
+++ b/drivers/power/reset/reboot-mode.c
@@ -29,9 +29,14 @@ static unsigned int get_reboot_mode_magic(struct reboot_mode_driver *reboot,
 	if (!cmd)
 		cmd = normal;
 
-	list_for_each_entry(info, &reboot->head, list)
-		if (!strcmp(info->mode, cmd))
+	mutex_lock(&reboot->rb_lock);
+	list_for_each_entry(info, &reboot->head, list) {
+		if (!strcmp(info->mode, cmd)) {
+			mutex_unlock(&reboot->rb_lock);
 			return info->magic;
+		}
+	}
+	mutex_unlock(&reboot->rb_lock);
 
 	/* try to match again, replacing characters impossible in DT */
 	if (strscpy(cmd_, cmd, sizeof(cmd_)) == -E2BIG)
@@ -41,9 +46,14 @@ static unsigned int get_reboot_mode_magic(struct reboot_mode_driver *reboot,
 	strreplace(cmd_, ',', '-');
 	strreplace(cmd_, '/', '-');
 
-	list_for_each_entry(info, &reboot->head, list)
-		if (!strcmp(info->mode, cmd_))
+	mutex_lock(&reboot->rb_lock);
+	list_for_each_entry(info, &reboot->head, list) {
+		if (!strcmp(info->mode, cmd_)) {
+			mutex_unlock(&reboot->rb_lock);
 			return info->magic;
+		}
+	}
+	mutex_unlock(&reboot->rb_lock);
 
 	return 0;
 }
@@ -77,7 +87,9 @@ int reboot_mode_register(struct reboot_mode_driver *reboot)
 	int ret;
 
 	INIT_LIST_HEAD(&reboot->head);
+	mutex_init(&reboot->rb_lock);
 
+	mutex_lock(&reboot->rb_lock);
 	for_each_property_of_node(np, prop) {
 		if (strncmp(prop->name, PREFIX, len))
 			continue;
@@ -113,12 +125,14 @@ int reboot_mode_register(struct reboot_mode_driver *reboot)
 	reboot->reboot_notifier.notifier_call = reboot_mode_notify;
 	register_reboot_notifier(&reboot->reboot_notifier);
 
+	mutex_unlock(&reboot->rb_lock);
 	return 0;
 
 error:
 	list_for_each_entry(info, &reboot->head, list)
 		kfree_const(info->mode);
 
+	mutex_unlock(&reboot->rb_lock);
 	return ret;
 }
 EXPORT_SYMBOL_GPL(reboot_mode_register);
@@ -133,8 +147,10 @@ int reboot_mode_unregister(struct reboot_mode_driver *reboot)
 
 	unregister_reboot_notifier(&reboot->reboot_notifier);
 
+	mutex_lock(&reboot->rb_lock);
 	list_for_each_entry(info, &reboot->head, list)
 		kfree_const(info->mode);
+	mutex_unlock(&reboot->rb_lock);
 
 	return 0;
 }
diff --git a/include/linux/reboot-mode.h b/include/linux/reboot-mode.h
index 4a2abb38d1d612ec0fdf05eb18c98b210f631b7f..b73f80708197677db8dc2e43affc519782b7146e 100644
--- a/include/linux/reboot-mode.h
+++ b/include/linux/reboot-mode.h
@@ -2,11 +2,15 @@
 #ifndef __REBOOT_MODE_H__
 #define __REBOOT_MODE_H__
 
+#include <linux/mutex.h>
+
 struct reboot_mode_driver {
 	struct device *dev;
 	struct list_head head;
 	int (*write)(struct reboot_mode_driver *reboot, unsigned int magic);
 	struct notifier_block reboot_notifier;
+	/*Protects access to reboot mode list*/
+	struct mutex rb_lock;
 };
 
 int reboot_mode_register(struct reboot_mode_driver *reboot);

-- 
2.34.1


