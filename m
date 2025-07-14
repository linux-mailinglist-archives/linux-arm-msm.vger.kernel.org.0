Return-Path: <linux-arm-msm+bounces-64759-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E8D5B0372B
	for <lists+linux-arm-msm@lfdr.de>; Mon, 14 Jul 2025 08:33:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9D19D1895071
	for <lists+linux-arm-msm@lfdr.de>; Mon, 14 Jul 2025 06:33:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 505D7230BE3;
	Mon, 14 Jul 2025 06:31:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="aEgoj2kw"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B84622A4F1
	for <linux-arm-msm@vger.kernel.org>; Mon, 14 Jul 2025 06:31:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752474716; cv=none; b=DP22uaU6Jn6DFcoudzHaz/0AjPcJW0tkQ78b+a6bJg+xeZMKWZaI/KzjP+/EiqZMwpCeFONmyrnwHgXX6nJWIKQecW6HARAoKf/1NKlA6NZtOMRYd/mep/H8HgqOuOwQmQf2DOKUfuI+Y9XvMTIKXOaxMnGIGkafu6VJxgi//k0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752474716; c=relaxed/simple;
	bh=M6Rp1weLtW2KJ/xnoDLmI39vOeiI36mIJrwui1LUzPk=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=X2fKPyQEPaj7DCgsWvtA+CFChK7zflEnYNlQKHLKIZe4FPwayUdp8LC2UiEYLtJIwQ3G4t2i+jzvbw6qKGB1ewYfzjD9gZTAz3ICipoMwlLVzKMAMFrGfjeCPmvr2NtpNKGST0s+ZAadtp1xSbjjF7RQBpUOZ75gbMIQpl+n2qk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=aEgoj2kw; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56DMA23w002937
	for <linux-arm-msm@vger.kernel.org>; Mon, 14 Jul 2025 06:31:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=qoFg4KFCsq0
	JCWNAAHHpPtznsQ0Gp9v6PqKrgQDg78Q=; b=aEgoj2kwOYv+Ma2QwthyHiCBp9e
	XN3fh1VBMd+VJSJqEk41nWseK/fpw/dJ92fvrfpfEmyePjypRK3jZwioWIiwMc8t
	C7TFokXbvfCVPomSQ09zKdA8T+k6d9wQY61AIWAxRNWaTVgOcu/QoC+h/WW47x6k
	SWmLnWz6YgJa2U09me48h4W9cwEmQ41FndEH+Ei4DQ+IqonTk/PLy1cpjRNYpigN
	6Gjz6C+XtLx1kpQWBmk7/U139c3RRTUNGbOQV1BJHXbHm/Yk1BBH/Fwc8ZKtsDBI
	CIzRCDV22+dwZSTpwb6GMxW3fL1BfTOwF3H8ZjKQTuw9DoshiGv+e4lVxLg==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47ugfhbh32-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 14 Jul 2025 06:31:53 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-313f702d37fso4378037a91.3
        for <linux-arm-msm@vger.kernel.org>; Sun, 13 Jul 2025 23:31:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752474713; x=1753079513;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qoFg4KFCsq0JCWNAAHHpPtznsQ0Gp9v6PqKrgQDg78Q=;
        b=GFRuvysvx5kINFFTuFukFn74X5EpFRoHzKCpoLqErYBMw1N8OBC/V+FdlhCRww/jd1
         VZdYS+yam/vvKxbq/t0DYx9mKaFlAVcqJIyYMEcP4RduMDgdlmsnO9PaifnQpgXl/2Aq
         ZQL5rOr9isFQtw2wdebqC+K3tEZK99uwvxTMNmyHQuSPxM6TYWYWsMMZzIk44J/S6qzx
         fz5vTy3llBm2qy35e5EmCHO1TcbkGIM9yTXAfu7z9w8Ybxep+6t2RA+wtV+nbRjoDpaH
         fVAaANbBa3OM65SeGtujubkxCLOmJAjo5nTmmoKBk+MKe17Ow0daUUXxLDUCorprpXXJ
         gHGQ==
X-Forwarded-Encrypted: i=1; AJvYcCWEyZvWiiDaabteJgYQcg+840NPBUKTXUSG1lCbZTCWq6BJ4Y1phRl7p3raIIVCAHeYwxAg5c/ETlPNc/Wy@vger.kernel.org
X-Gm-Message-State: AOJu0YySR29co7+hgYDrPjaNwoHqcl3eAIhGhjKHyFUzY2bm6GWBwRym
	63CPuznrw9enK06tDRH6cqDjkSDws9zvJJLeV299WP1Va4jfHaabHp4KdvaEaBt6mo3NUPfqUX2
	xPAN7hpfx+FxSwPSErKNpzb6snDa6KExay/SL+zaXqxG3lnbIfb7v26XjKi5eQi3r1//9
X-Gm-Gg: ASbGncvZm4h16QWuc0d/0tJuZN6CHmcIaFDgVTo+VWICYsHAnnMIvOmS0B5PSgmIE9w
	+RhlCUPFjZEoAyjjG9vU036W7yOcIm4/MFA9riCKtCN6XGUrksSWlLtj0SKwZ89RReFHSNlPg8F
	6vOK3e2YKmff1+hbfAST2w01WWOJ7Ud0trE/8aWi+ljpOq8tLFwOry5QfqoPxW6uvDyb51BP09T
	hoXolCQS8eY0UyUBvEknfnOCflS+VvU/7ohLht3ApTBHvGKfCfb7OofSLjjOuAzXUiMfCA1IEw0
	fTl18mYSERXyhnc2+ENXvo0oxLz15iOh5sDYnGjlSZY/G4LpSuhCPyj5aB+vnHoTriJJ9nMKIvY
	pyqKonQMC+SPyp8r/1dUK
X-Received: by 2002:a17:903:40c6:b0:235:f70:fd37 with SMTP id d9443c01a7336-23dee204614mr181668895ad.19.1752474712687;
        Sun, 13 Jul 2025 23:31:52 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG6/E8+pWE8Qlpm2Dm9PL72eqb4o7WVOlJWmb4J4fwBoKVGK1/eINOMbAkX7/N7IGeqA2CThA==
X-Received: by 2002:a17:903:40c6:b0:235:f70:fd37 with SMTP id d9443c01a7336-23dee204614mr181668365ad.19.1752474712267;
        Sun, 13 Jul 2025 23:31:52 -0700 (PDT)
Received: from jiegan.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23de4334005sm86138255ad.158.2025.07.13.23.31.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Jul 2025 23:31:51 -0700 (PDT)
From: Jie Gan <jie.gan@oss.qualcomm.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach <mike.leach@linaro.org>,
        James Clark <james.clark@linaro.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Tingwei Zhang <quic_tingweiz@quicinc.com>,
        Yuanfang Zhang <quic_yuanfang@quicinc.com>,
        Mao Jinlong <quic_jinlmao@quicinc.com>,
        Jie Gan <quic_jiegan@quicinc.com>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: [PATCH v3 RESEND 07/10] coresight: tmc: add prepare/unprepare functions for byte-cntr
Date: Mon, 14 Jul 2025 14:31:06 +0800
Message-Id: <20250714063109.591-8-jie.gan@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250714063109.591-1-jie.gan@oss.qualcomm.com>
References: <20250714063109.591-1-jie.gan@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: BdxwBks-5E1x8N_p4f-VZvsMD65N9bFT
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzE0MDAzNyBTYWx0ZWRfXzlObhRlsrWwG
 9txQ3gCmmfae3kyiQ5FeJb8z3LKU56/dh6yZ/VE7DwNKVFDZNUMnlSqNUw9cbW8hFz6cw1ZCPB2
 gM+qQXfFAK1LjFtfezZjvN1aexPd8o/QeEz9XagbPVKVEq7q2P6RAJQLb5J2MrSMWISHg7V6RDD
 mUuuNwTD7Dr7KD11AymXwLVZh/rzjcwXZorDXFDyt/77H3tZBLB1u913jZwmZLLfJmUX/1uw7m+
 Mhmt5TriiNuXEhfr9fNRiyof+U4DwoLhVjjM8N73WwMe5bLVmCYrVTlAKiXIrIdff1ASo7cG9lJ
 0+SYere8jtrJSCmUyj/kVsRYW4PYglMoVuHYV0mOdTMO+vdw1RJ1WQA7IWN02FOD07Q5XiDNKyu
 oDYkJDtPv1EO7dyEcaJOY5lZ6fN3bXQOc7zmuv0BT3UHbYzVGsfWeMQp+zebibQveg/setEO
X-Proofpoint-GUID: BdxwBks-5E1x8N_p4f-VZvsMD65N9bFT
X-Authority-Analysis: v=2.4 cv=HYkUTjE8 c=1 sm=1 tr=0 ts=6874a459 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=xC7plfDI9GgKYcT3xssA:9
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-14_01,2025-07-09_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 priorityscore=1501 bulkscore=0 clxscore=1015
 mlxscore=0 mlxlogscore=798 malwarescore=0 impostorscore=0 spamscore=0
 lowpriorityscore=0 phishscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507140037

Prepare for byte-cntr reading. An additional sysfs_buf is required to
receive trace data, as byte-cntr always reads from the deactivated
and filled sysfs_buf.

The unprepare function releases the additional deactivated sysfs_buf
allocated during the prepare phase.

Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
---
 .../hwtracing/coresight/coresight-tmc-core.c  | 38 ++++++++-
 .../hwtracing/coresight/coresight-tmc-etr.c   | 79 +++++++++++++++++++
 drivers/hwtracing/coresight/coresight-tmc.h   |  7 ++
 3 files changed, 120 insertions(+), 4 deletions(-)

diff --git a/drivers/hwtracing/coresight/coresight-tmc-core.c b/drivers/hwtracing/coresight/coresight-tmc-core.c
index 4d249af93097..354faeeddbb2 100644
--- a/drivers/hwtracing/coresight/coresight-tmc-core.c
+++ b/drivers/hwtracing/coresight/coresight-tmc-core.c
@@ -230,7 +230,11 @@ static int tmc_prepare_crashdata(struct tmc_drvdata *drvdata)
 
 static int tmc_read_prepare(struct tmc_drvdata *drvdata)
 {
-	int ret = 0;
+	struct coresight_device *helper = coresight_get_helper(drvdata->csdev,
+						CORESIGHT_DEV_SUBTYPE_HELPER_CTCU);
+	struct ctcu_byte_cntr *byte_cntr_data = NULL;
+	struct ctcu_drvdata *ctcu_drvdata = NULL;
+	int port, ret = 0;
 
 	switch (drvdata->config_type) {
 	case TMC_CONFIG_TYPE_ETB:
@@ -238,7 +242,18 @@ static int tmc_read_prepare(struct tmc_drvdata *drvdata)
 		ret = tmc_read_prepare_etb(drvdata);
 		break;
 	case TMC_CONFIG_TYPE_ETR:
-		ret = tmc_read_prepare_etr(drvdata);
+		if (helper) {
+			port = coresight_get_port_helper(drvdata->csdev, helper);
+			if (port >= 0) {
+				ctcu_drvdata = dev_get_drvdata(helper->dev.parent);
+				byte_cntr_data = &ctcu_drvdata->byte_cntr_data[port];
+			}
+		}
+
+		if (byte_cntr_data && byte_cntr_data->thresh_val)
+			ret = tmc_read_prepare_byte_cntr(drvdata, byte_cntr_data);
+		else
+			ret = tmc_read_prepare_etr(drvdata);
 		break;
 	default:
 		ret = -EINVAL;
@@ -252,7 +267,11 @@ static int tmc_read_prepare(struct tmc_drvdata *drvdata)
 
 static int tmc_read_unprepare(struct tmc_drvdata *drvdata)
 {
-	int ret = 0;
+	struct coresight_device *helper = coresight_get_helper(drvdata->csdev,
+						CORESIGHT_DEV_SUBTYPE_HELPER_CTCU);
+	struct ctcu_byte_cntr *byte_cntr_data = NULL;
+	struct ctcu_drvdata *ctcu_drvdata = NULL;
+	int port, ret = 0;
 
 	switch (drvdata->config_type) {
 	case TMC_CONFIG_TYPE_ETB:
@@ -260,7 +279,18 @@ static int tmc_read_unprepare(struct tmc_drvdata *drvdata)
 		ret = tmc_read_unprepare_etb(drvdata);
 		break;
 	case TMC_CONFIG_TYPE_ETR:
-		ret = tmc_read_unprepare_etr(drvdata);
+		if (helper) {
+			port = coresight_get_port_helper(drvdata->csdev, helper);
+			if (port >= 0) {
+				ctcu_drvdata = dev_get_drvdata(helper->dev.parent);
+				byte_cntr_data = &ctcu_drvdata->byte_cntr_data[port];
+			}
+		}
+
+		if (byte_cntr_data && byte_cntr_data->thresh_val)
+			ret = tmc_read_unprepare_byte_cntr(drvdata, byte_cntr_data);
+		else
+			ret = tmc_read_unprepare_etr(drvdata);
 		break;
 	default:
 		ret = -EINVAL;
diff --git a/drivers/hwtracing/coresight/coresight-tmc-etr.c b/drivers/hwtracing/coresight/coresight-tmc-etr.c
index 4609df80ae38..2b73bd8074bb 100644
--- a/drivers/hwtracing/coresight/coresight-tmc-etr.c
+++ b/drivers/hwtracing/coresight/coresight-tmc-etr.c
@@ -2032,6 +2032,85 @@ int tmc_read_unprepare_etr(struct tmc_drvdata *drvdata)
 	return 0;
 }
 
+int tmc_read_prepare_byte_cntr(struct tmc_drvdata *drvdata,
+			       struct ctcu_byte_cntr *byte_cntr_data)
+{
+	unsigned long flags;
+	int ret = 0;
+
+	/* config types are set a boot time and never change */
+	if (WARN_ON_ONCE(drvdata->config_type != TMC_CONFIG_TYPE_ETR))
+		return -EINVAL;
+
+	if (coresight_get_mode(drvdata->csdev) != CS_MODE_SYSFS)
+		return -EINVAL;
+
+	/*
+	 * The threshold value must not exceed the buffer size.
+	 * A margin should be maintained between the two values to account
+	 * for the time gap between the interrupt and buffer switching.
+	 */
+	if (byte_cntr_data->thresh_val + SZ_16K >= drvdata->size) {
+		dev_err(&drvdata->csdev->dev, "The threshold value is too large\n");
+		return -EINVAL;
+	}
+
+	raw_spin_lock_irqsave(&drvdata->spinlock, flags);
+	if (byte_cntr_data->reading) {
+		ret = -EBUSY;
+		goto out_unlock;
+	}
+
+	byte_cntr_data->reading = true;
+	raw_spin_unlock_irqrestore(&drvdata->spinlock, flags);
+	/* Insert current sysfs_buf into the list */
+	ret = tmc_create_etr_buf_node(drvdata, drvdata->sysfs_buf);
+	if (!ret) {
+		/*
+		 * Add one more sysfs_buf for byte-cntr function, byte-cntr always reads
+		 * the data from the buffer which has been synced. Switch the buffer when
+		 * the used buffer is nearly full. The used buffer will be synced and made
+		 * available for reading before switch.
+		 */
+		ret = tmc_create_etr_buf_node(drvdata, NULL);
+		if (ret) {
+			dev_err(&drvdata->csdev->dev, "Failed to create etr_buf_node\n");
+			tmc_delete_etr_buf_node(drvdata);
+			byte_cntr_data->reading = false;
+			goto out;
+		}
+	}
+
+	raw_spin_lock_irqsave(&drvdata->spinlock, flags);
+	atomic_set(&byte_cntr_data->irq_cnt, 0);
+	enable_irq(byte_cntr_data->byte_cntr_irq);
+	enable_irq_wake(byte_cntr_data->byte_cntr_irq);
+	byte_cntr_data->total_size = 0;
+	byte_cntr_data->irq_num = 0;
+
+out_unlock:
+	raw_spin_unlock_irqrestore(&drvdata->spinlock, flags);
+
+out:
+	return ret;
+}
+
+int tmc_read_unprepare_byte_cntr(struct tmc_drvdata *drvdata,
+				 struct ctcu_byte_cntr *byte_cntr_data)
+{
+	struct device *dev = &drvdata->csdev->dev;
+
+	guard(raw_spinlock_irqsave)(&byte_cntr_data->spin_lock);
+	disable_irq_wake(byte_cntr_data->byte_cntr_irq);
+	disable_irq(byte_cntr_data->byte_cntr_irq);
+	byte_cntr_data->reading = false;
+	tmc_delete_etr_buf_node(drvdata);
+	dev_dbg(dev, "send data total size:%llu bytes, irq_cnt:%d\n",
+		byte_cntr_data->total_size, byte_cntr_data->irq_num);
+
+	return 0;
+}
+
 static const char *const buf_modes_str[] = {
 	[ETR_MODE_FLAT]		= "flat",
 	[ETR_MODE_ETR_SG]	= "tmc-sg",
diff --git a/drivers/hwtracing/coresight/coresight-tmc.h b/drivers/hwtracing/coresight/coresight-tmc.h
index f6b05639aeca..1dbba0bc50a3 100644
--- a/drivers/hwtracing/coresight/coresight-tmc.h
+++ b/drivers/hwtracing/coresight/coresight-tmc.h
@@ -14,6 +14,8 @@
 #include <linux/refcount.h>
 #include <linux/crc32.h>
 
+#include "coresight-ctcu.h"
+
 #define TMC_RSZ			0x004
 #define TMC_STS			0x00c
 #define TMC_RRD			0x010
@@ -357,6 +359,11 @@ extern const struct coresight_ops tmc_etr_cs_ops;
 ssize_t tmc_etr_get_sysfs_trace(struct tmc_drvdata *drvdata,
 				loff_t pos, size_t len, char **bufpp);
 
+/* Byte-cntr functions */
+int tmc_read_prepare_byte_cntr(struct tmc_drvdata *drvdata,
+			       struct ctcu_byte_cntr *byte_cntr_data);
+int tmc_read_unprepare_byte_cntr(struct tmc_drvdata *drvdata,
+				 struct ctcu_byte_cntr *byte_cntr_data);
 
 #define TMC_REG_PAIR(name, lo_off, hi_off)				\
 static inline u64							\
-- 
2.34.1


