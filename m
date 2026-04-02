Return-Path: <linux-arm-msm+bounces-101502-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6PxhHRM5zmmAmAYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-101502-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 02 Apr 2026 11:38:27 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id F34363870CF
	for <lists+linux-arm-msm@lfdr.de>; Thu, 02 Apr 2026 11:38:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 76B9E3198CC7
	for <lists+linux-arm-msm@lfdr.de>; Thu,  2 Apr 2026 09:31:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 277793AEF46;
	Thu,  2 Apr 2026 09:29:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WmRY2AcE";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dBocttn3"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FDAF39B949
	for <linux-arm-msm@vger.kernel.org>; Thu,  2 Apr 2026 09:28:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775122147; cv=none; b=jPrf4FzmjkE6oIzBXO/685u/dJ/ADy5k0xvVMSanNKFQTz+B0uwlbfC6RQT7TTMT8IoBGI3HR3UVru/qD3Q+70qzt2b+QA34h/uKVQvD6zHuVJyxC47aJt6XtYb97qn05tGrtDf49RsfZuUBab9KKYEWUVkyRwr+am2+0SXj814=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775122147; c=relaxed/simple;
	bh=YkfibUf3Sk8wjpdDwqM7ptZvyASwNPFHGpIrHotam/Y=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=X5+eHsrlGMYcAk9xhpeB4M3vytdp9bLR5Sihy3CSpRipUB85pdOyzD+AEkjP1GPnEZ/jwLHKUYJIKm0hsCVyfJryRbrn6hbrHTKMRE73UMOs6v+vrQa4oIprWEHv2R9QqlnPZpsuRd2w2+3rmCA1Szo1TdI9M+FoFSKSiau9+L4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WmRY2AcE; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dBocttn3; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6327A8g23044878
	for <linux-arm-msm@vger.kernel.org>; Thu, 2 Apr 2026 09:28:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=OZaEG6ZKced
	fi4AQS4ZSrWco9P0mCBULI4k4ihcHhYs=; b=WmRY2AcErmE9lGxSgVZgxPXQZRi
	O8S6vy0Nd/na0yQLxkFlcQTkgkIYQFCEHlEZon7Ndo4uIVVtMN/jMmOEEMIbdK8U
	T5fdpOcAz84e53/XVP5L2FDzwSyFQcmxhAHgr6ldK/nsDricmGK2MCapF4SRww1u
	sDlzUWv4jc+93OCVBojc+EqgaY0aHuD4NRdrabAiz3glMAjOt6coNXSC3WdXSpyc
	tzV/svKMG3lsN3RaEFvaG2Vm/ocdG3BMay1lwqTxV+AlRM/oQTVw9YzLOyELGyFy
	MQCqJqfYE+yue8/7yE9UDXIH7xi7Tl5hGP/RWcTDb1fVmcdyvKBgfezEw3Q==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d9483v5q2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 02 Apr 2026 09:28:54 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-2c0ba59a830so1044476eec.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 02 Apr 2026 02:28:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775122134; x=1775726934; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OZaEG6ZKcedfi4AQS4ZSrWco9P0mCBULI4k4ihcHhYs=;
        b=dBocttn3H+7UBtBtReIZscSv1LYgnyrwmuFeeLXBLsAwlgPAGxZ/BApHpfDMQe01p+
         IXXKsXXo7lpQsT1R573cmH/9boFFDL9tNYMeku5QBR49PTFsW513o/EyWyFK995u/87s
         aFwzDQXDCubliC10ukj7xzKYV05WzL33iMQnknxReCI2W7iM6MvqoQl+Xi3V7HX0krkz
         O2OboBsWzUNrR6ZtXHYSD7FsxAxznPFccsdkL08xy30gW4Jo4fE0AhM71ie3xmjlo8Fg
         /DC6wvJundDigQW2zINZteynrQj0QeU3fk4u01o5NB3EZAmmE9plYJLqkAHnQwbtiBkj
         voFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775122134; x=1775726934;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=OZaEG6ZKcedfi4AQS4ZSrWco9P0mCBULI4k4ihcHhYs=;
        b=WZFrXpdNNOMgfOZrTlqJLbqBLJLAO210gn+t3Tl4IoFYufKKuJu/+jxXtRJiPuBnAT
         Ywho1PavXySlrbXwg0QNr364Jv9G60TXF4R4TKvHCXKdXp4YiAej8UGOFYPLHMt3pNFS
         ayTrnSlSX3TTS0jNJP8TjHw+9okBerXEHPMo1+C4H7Ao3Bd+pDjaLW9YwgYZOXs80Udv
         9Z5ivuU3noAutlHD+AVCpfpq1IaefS36i12XwKRbXmcTdRuV1en7MUKhX4yY4qZpoDTV
         Fc8Nrw+bUO/RkMqOFYVMNUkNGTK3wFgTZQLZITZnH9iF00m79X/ftkK6WakGIAtJnaIY
         dVQw==
X-Forwarded-Encrypted: i=1; AJvYcCXkQQIExb+a27qXYDsJrQ2YXtkoFgf4rX2jkZGGcEOjcTv4ZkpWDFrSbToznUNqDLwbnHMVlXCdRo2l6byO@vger.kernel.org
X-Gm-Message-State: AOJu0YyGlKQI/X22+5MhfBK2LpLFrDNNdFFxiQQgrouOrExzoYPYidM4
	LgNBs/CiKzNsf41sfjQAyHdB9Vvdwi4mA39O2I5rszbsbuamZa6smRfBaH+JKmUhlkFOaxO18VJ
	0tBKxXb8D64T6IMZtAQqZ6odPEirkAH4kmA7C2VUx6Xvq2pzKHvpTzCeBjan4aOL+qjQX
X-Gm-Gg: ATEYQzz7Z6h9M/N4dAaCvW65B2FY6aTH1zpxBJwAO9J89FgF1qb6NUgBvuyacW6rgGI
	oRso3ErFZx/KdWg23TXp6YMr302dforECNT8vKRhjaVYSDJk1//1mSNVYgsbypqbHkDsmco/hKE
	HBfz8UY64TNdDNpoztoOlnwZeEFERu/QFf+UVL3xoIvZOiD8zKKr/muup+n3AO0hjL8zo6r0fHz
	++FXlFuWPFcs60WPhY3pc7Cpj6MpvNjSgpozb+yye3KgRBlh5dlJYwxzb5yJVKU8LNdrL7qD4qv
	eFUdF4LWyPJwODJ7tbRwr8VPQyWAoQ7VcdOuRAOXxf/CUuFVEuqKiqChyPYtpHlv6Ftxoihh+0D
	Kc9GiLnKkq8SOhWocZG/huK5Tb+yKVLgHzSu97eNTQYEcEbj3T9z86nPmi8aeT4Oj+W39QT4pVc
	zI
X-Received: by 2002:a05:7300:aa8c:b0:2c7:31b2:44ad with SMTP id 5a478bee46e88-2c9331af315mr3531650eec.31.1775122134051;
        Thu, 02 Apr 2026 02:28:54 -0700 (PDT)
X-Received: by 2002:a05:7300:aa8c:b0:2c7:31b2:44ad with SMTP id 5a478bee46e88-2c9331af315mr3531634eec.31.1775122133456;
        Thu, 02 Apr 2026 02:28:53 -0700 (PDT)
Received: from hu-songchai-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2cafd073194sm951094eec.28.2026.04.02.02.28.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Apr 2026 02:28:52 -0700 (PDT)
From: Songwei Chai <songwei.chai@oss.qualcomm.com>
To: andersson@kernel.org, alexander.shishkin@linux.intel.com,
        mike.leach@linaro.org, konrad.dybcio@oss.qualcomm.com,
        suzuki.poulose@arm.com, james.clark@arm.com, krzk+dt@kernel.org,
        conor+dt@kernel.org
Cc: Songwei Chai <songwei.chai@oss.qualcomm.com>, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        coresight@lists.linaro.org, devicetree@vger.kernel.org,
        gregkh@linuxfoundation.org
Subject: [PATCH v13 2/7] qcom-tgu: Add TGU driver
Date: Thu,  2 Apr 2026 02:28:33 -0700
Message-Id: <20260402092838.341295-3-songwei.chai@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260402092838.341295-1-songwei.chai@oss.qualcomm.com>
References: <20260402092838.341295-1-songwei.chai@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=RYydyltv c=1 sm=1 tr=0 ts=69ce36d6 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=h99DN6MNysFgGb7_OMAA:9 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDAyMDA4NCBTYWx0ZWRfX9nMcuan7mF+e
 Bx/vkV9geBGaL21GeIhMjjwr+/v2YPa6/tJsTHDsp7XU9x6o6nGUyU8KvtTocdoWIAibG7/LeaJ
 k8V0uNiXCcSJqCIx828j67XP235hfpOq2ulV5y3cKmCW8UMs/856atsPY2mt4Z2ewdgsnUUdvgV
 xY+AH3fWLTItzAdR+0G/1i/eQcd35s0WVXk5C3qLhOeQVgfQaLoCc0DRqf8RlXH4oYTmce2qEsJ
 yHyygujLzbmH0+sscx3b3QorUEO2FuPrNhsoam7PhSM6n0KPZjAS6y5QLFZgfaRcOs1gbv6oGJ+
 E2hIKFOmHZSCHVXxtMpOua/EUTZkoBJq7F/Nkd6uUg8iY/muz6CKlDjpdixtdy+K+ufyCzn34/a
 j2q5qVSPesLV1Z2xlBXrUQm5rbPCspPCv8Ti5znlGSPoGLhT4wY8cb3CRy4EzjddBmSFiZ2EG4S
 W+2rz7QtDV5T1Xnwzsw==
X-Proofpoint-ORIG-GUID: PM9T7NIeKZ3mgLXMwYPq1FmWYAUi_MBb
X-Proofpoint-GUID: PM9T7NIeKZ3mgLXMwYPq1FmWYAUi_MBb
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-02_01,2026-04-02_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 clxscore=1015 adultscore=0 bulkscore=0
 spamscore=0 phishscore=0 impostorscore=0 lowpriorityscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2604020084
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-101502-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[songwei.chai@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: F34363870CF
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Add driver to support device TGU (Trigger Generation Unit).
TGU is a Data Engine which can be utilized to sense a plurality of
signals and create a trigger into the CTI or generate interrupts to
processors. Add probe/enable/disable functions for tgu.

Signed-off-by: Songwei Chai <songwei.chai@oss.qualcomm.com>
---
 .../ABI/testing/sysfs-bus-amba-devices-tgu    |   9 +
 drivers/Makefile                              |   1 +
 drivers/hwtracing/Kconfig                     |   2 +
 drivers/hwtracing/qcom/Kconfig                |  18 ++
 drivers/hwtracing/qcom/Makefile               |   3 +
 drivers/hwtracing/qcom/tgu.c                  | 193 ++++++++++++++++++
 drivers/hwtracing/qcom/tgu.h                  |  51 +++++
 7 files changed, 277 insertions(+)
 create mode 100644 Documentation/ABI/testing/sysfs-bus-amba-devices-tgu
 create mode 100644 drivers/hwtracing/qcom/Kconfig
 create mode 100644 drivers/hwtracing/qcom/Makefile
 create mode 100644 drivers/hwtracing/qcom/tgu.c
 create mode 100644 drivers/hwtracing/qcom/tgu.h

diff --git a/Documentation/ABI/testing/sysfs-bus-amba-devices-tgu b/Documentation/ABI/testing/sysfs-bus-amba-devices-tgu
new file mode 100644
index 000000000000..f877a00fcaa5
--- /dev/null
+++ b/Documentation/ABI/testing/sysfs-bus-amba-devices-tgu
@@ -0,0 +1,9 @@
+What:		/sys/bus/amba/devices/<tgu-name>/enable_tgu
+Date:		April 2026
+KernelVersion:	7.1
+Contact:	Jinlong Mao <jinlong.mao@oss.qualcomm.com>, Songwei Chai <songwei.chai@oss.qualcomm.com>
+Description:
+		(RW) Set/Get the enable/disable status of TGU
+		Accepts only one of the 2 values -  0 or 1.
+		0 : disable TGU.
+		1 : enable TGU.
diff --git a/drivers/Makefile b/drivers/Makefile
index 53fbd2e0acdd..82b712a12a26 100644
--- a/drivers/Makefile
+++ b/drivers/Makefile
@@ -177,6 +177,7 @@ obj-$(CONFIG_RAS)		+= ras/
 obj-$(CONFIG_USB4)		+= thunderbolt/
 obj-$(CONFIG_CORESIGHT)		+= hwtracing/coresight/
 obj-y				+= hwtracing/intel_th/
+obj-y				+= hwtracing/qcom/
 obj-$(CONFIG_STM)		+= hwtracing/stm/
 obj-$(CONFIG_HISI_PTT)		+= hwtracing/ptt/
 obj-y				+= android/
diff --git a/drivers/hwtracing/Kconfig b/drivers/hwtracing/Kconfig
index 911ee977103c..8a640218eed8 100644
--- a/drivers/hwtracing/Kconfig
+++ b/drivers/hwtracing/Kconfig
@@ -7,4 +7,6 @@ source "drivers/hwtracing/intel_th/Kconfig"
 
 source "drivers/hwtracing/ptt/Kconfig"
 
+source "drivers/hwtracing/qcom/Kconfig"
+
 endmenu
diff --git a/drivers/hwtracing/qcom/Kconfig b/drivers/hwtracing/qcom/Kconfig
new file mode 100644
index 000000000000..d6f6d4b0f28e
--- /dev/null
+++ b/drivers/hwtracing/qcom/Kconfig
@@ -0,0 +1,18 @@
+# SPDX-License-Identifier: GPL-2.0-only
+#
+# QCOM specific hwtracing drivers
+#
+menu "Qualcomm specific hwtracing drivers"
+
+config QCOM_TGU
+	tristate "QCOM Trigger Generation Unit driver"
+	help
+	  This driver provides support for Trigger Generation Unit that is
+	  used to detect patterns or sequences on a given set of signals.
+	  TGU is used to monitor a particular bus within a given region to
+	  detect illegal transaction sequences or slave responses. It is also
+	  used to monitor a data stream to detect protocol violations and to
+	  provide a trigger point for centering data around a specific event
+	  within the trace data buffer.
+
+endmenu
diff --git a/drivers/hwtracing/qcom/Makefile b/drivers/hwtracing/qcom/Makefile
new file mode 100644
index 000000000000..5a0a868c1ea0
--- /dev/null
+++ b/drivers/hwtracing/qcom/Makefile
@@ -0,0 +1,3 @@
+# SPDX-License-Identifier: GPL-2.0
+
+obj-$(CONFIG_QCOM_TGU) += tgu.o
diff --git a/drivers/hwtracing/qcom/tgu.c b/drivers/hwtracing/qcom/tgu.c
new file mode 100644
index 000000000000..49c8f710b931
--- /dev/null
+++ b/drivers/hwtracing/qcom/tgu.c
@@ -0,0 +1,193 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+#include <linux/amba/bus.h>
+#include <linux/device.h>
+#include <linux/err.h>
+#include <linux/io.h>
+#include <linux/kernel.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/pm_runtime.h>
+
+#include "tgu.h"
+
+static void tgu_write_all_hw_regs(struct tgu_drvdata *drvdata)
+{
+	TGU_UNLOCK(drvdata->base);
+	/* Enable TGU to program the triggers */
+	writel(1, drvdata->base + TGU_CONTROL);
+	TGU_LOCK(drvdata->base);
+}
+
+static int tgu_enable(struct device *dev)
+{
+	struct tgu_drvdata *drvdata = dev_get_drvdata(dev);
+
+	guard(spinlock)(&drvdata->lock);
+	drvdata->enabled = true;
+
+	tgu_write_all_hw_regs(drvdata);
+
+	return 0;
+}
+
+static void tgu_do_disable(struct tgu_drvdata *drvdata)
+{
+	TGU_UNLOCK(drvdata->base);
+	writel(0, drvdata->base + TGU_CONTROL);
+	TGU_LOCK(drvdata->base);
+
+	drvdata->enabled = false;
+}
+
+static void tgu_disable(struct device *dev)
+{
+	struct tgu_drvdata *drvdata = dev_get_drvdata(dev);
+
+	guard(spinlock)(&drvdata->lock);
+	if (!drvdata->enabled)
+		return;
+
+	tgu_do_disable(drvdata);
+}
+
+static ssize_t enable_tgu_show(struct device *dev,
+			       struct device_attribute *attr, char *buf)
+{
+	struct tgu_drvdata *drvdata = dev_get_drvdata(dev);
+	bool enabled;
+
+	guard(spinlock)(&drvdata->lock);
+	enabled = drvdata->enabled;
+
+	return sysfs_emit(buf, "%d\n", !!enabled);
+}
+
+/* enable_tgu_store - Configure Trace and Gating Unit (TGU) triggers. */
+static ssize_t enable_tgu_store(struct device *dev,
+				struct device_attribute *attr,
+				const char *buf,
+				size_t size)
+{
+	struct tgu_drvdata *drvdata = dev_get_drvdata(dev);
+	unsigned long val;
+	int ret;
+
+	ret = kstrtoul(buf, 0, &val);
+	if (ret || val > 1)
+		return -EINVAL;
+
+	if (val) {
+		scoped_guard(spinlock, &drvdata->lock) {
+			if (drvdata->enabled)
+				return -EBUSY;
+		}
+
+		ret = pm_runtime_resume_and_get(dev);
+		if (ret)
+			return ret;
+
+		ret = tgu_enable(dev);
+		if (ret) {
+			pm_runtime_put(dev);
+			return ret;
+		}
+	} else {
+		scoped_guard(spinlock, &drvdata->lock) {
+			if (!drvdata->enabled)
+				return -EINVAL;
+		}
+
+		tgu_disable(dev);
+		pm_runtime_put(dev);
+	}
+
+	return size;
+}
+static DEVICE_ATTR_RW(enable_tgu);
+
+static struct attribute *tgu_common_attrs[] = {
+	&dev_attr_enable_tgu.attr,
+	NULL,
+};
+
+static const struct attribute_group tgu_common_grp = {
+	.attrs = tgu_common_attrs,
+	NULL,
+};
+
+static const struct attribute_group *tgu_attr_groups[] = {
+	&tgu_common_grp,
+	NULL,
+};
+
+static int tgu_probe(struct amba_device *adev, const struct amba_id *id)
+{
+	struct device *dev = &adev->dev;
+	struct tgu_drvdata *drvdata;
+	int ret;
+
+	drvdata = devm_kzalloc(dev, sizeof(*drvdata), GFP_KERNEL);
+	if (!drvdata)
+		return -ENOMEM;
+
+	drvdata->dev = &adev->dev;
+	dev_set_drvdata(dev, drvdata);
+
+	drvdata->base = devm_ioremap_resource(dev, &adev->res);
+	if (IS_ERR(drvdata->base))
+		return PTR_ERR(drvdata->base);
+
+	spin_lock_init(&drvdata->lock);
+
+	ret = sysfs_create_groups(&dev->kobj, tgu_attr_groups);
+	if (ret) {
+		dev_err(dev, "failed to create sysfs groups: %d\n", ret);
+		return ret;
+	}
+
+	drvdata->enabled = false;
+
+	pm_runtime_put(&adev->dev);
+
+	return 0;
+}
+
+static void tgu_remove(struct amba_device *adev)
+{
+	struct device *dev = &adev->dev;
+
+	sysfs_remove_groups(&dev->kobj, tgu_attr_groups);
+
+	tgu_disable(dev);
+}
+
+static const struct amba_id tgu_ids[] = {
+	{
+		.id = 0x000f0e00,
+		.mask = 0x000fffff,
+	},
+	{ 0, 0, NULL },
+};
+
+MODULE_DEVICE_TABLE(amba, tgu_ids);
+
+static struct amba_driver tgu_driver = {
+	.drv = {
+		.name = "qcom-tgu",
+		.suppress_bind_attrs = true,
+	},
+	.probe = tgu_probe,
+	.remove = tgu_remove,
+	.id_table = tgu_ids,
+};
+
+module_amba_driver(tgu_driver);
+
+MODULE_AUTHOR("Songwei Chai <songwei.chai@oss.qualcomm.com>");
+MODULE_AUTHOR("Jinlong Mao <jinlong.mao@oss.qualcomm.com>");
+MODULE_DESCRIPTION("Qualcomm Trigger Generation Unit driver");
+MODULE_LICENSE("GPL");
diff --git a/drivers/hwtracing/qcom/tgu.h b/drivers/hwtracing/qcom/tgu.h
new file mode 100644
index 000000000000..dd7533b9d735
--- /dev/null
+++ b/drivers/hwtracing/qcom/tgu.h
@@ -0,0 +1,51 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+#ifndef _QCOM_TGU_H
+#define _QCOM_TGU_H
+
+/* Register addresses */
+#define TGU_CONTROL		0x0000
+#define TGU_LAR		0xfb0
+#define TGU_UNLOCK_OFFSET	0xc5acce55
+
+static inline void TGU_LOCK(void __iomem *addr)
+{
+	do {
+		/* Wait for things to settle */
+		mb();
+		writel_relaxed(0x0, addr + TGU_LAR);
+	} while (0);
+}
+
+static inline void TGU_UNLOCK(void __iomem *addr)
+{
+	do {
+		writel_relaxed(TGU_UNLOCK_OFFSET, addr + TGU_LAR);
+		/* Make sure everyone has seen this */
+		mb();
+	} while (0);
+}
+
+/**
+ * struct tgu_drvdata - Data structure for a TGU (Trigger Generator Unit)
+ * @base: Memory-mapped base address of the TGU device
+ * @dev: Pointer to the associated device structure
+ * @lock: Spinlock for handling concurrent access to private data
+ * @enabled: Flag indicating whether the TGU device is enabled
+ *
+ * This structure defines the data associated with a TGU device,
+ * including its base address, device pointers, clock, spinlock for
+ * synchronization, trigger data pointers, maximum limits for various
+ * trigger-related parameters, and enable status.
+ */
+struct tgu_drvdata {
+	void __iomem *base;
+	struct device *dev;
+	spinlock_t lock;
+	bool enabled;
+};
+
+#endif
-- 
2.34.1


