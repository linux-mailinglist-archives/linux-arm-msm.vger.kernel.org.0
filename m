Return-Path: <linux-arm-msm+bounces-64472-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D6AAB00EF9
	for <lists+linux-arm-msm@lfdr.de>; Fri, 11 Jul 2025 00:47:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3CF4F1CA80DA
	for <lists+linux-arm-msm@lfdr.de>; Thu, 10 Jul 2025 22:47:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1E0DD2D191F;
	Thu, 10 Jul 2025 22:46:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gmTp5H4p"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21C9A2C3749
	for <linux-arm-msm@vger.kernel.org>; Thu, 10 Jul 2025 22:46:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752187568; cv=none; b=pkZ/vyMaw5jgg/6Tv3Re2D6K426kCFFPEwVzP72UchkWlwiZHz4CAe70Z8fSuFojFLK1BssY5OAYQspzRYuMB6RqvpJPw3sKWkYrhEeStvqGt4JCnR0AIVPb8kr04CvEFk15mdJZARkEnyr9/eKLVTni/CF/XH3KddLYVzWt06o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752187568; c=relaxed/simple;
	bh=1I6+4fLFYxIRchnimpbcx/xAezT0weK9I3m33+3twO8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Wz1BP3KKs9jFJfm9l1sRJl2vwycQPaHifc0/o6BPjJ9sHNwvhddL3hzPOk+dyJHGc7ECtKcB2IF8glbmlMrVpdTIik7kXVhoC8kPhTn9QrEDNqTULfdgGSYasPlGVDd7nSgyIaSbcIZ7Qy9r81yvQTygRpA1P7r/S4dwQGJv/CM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gmTp5H4p; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56AJRmxm009483
	for <linux-arm-msm@vger.kernel.org>; Thu, 10 Jul 2025 22:46:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=qTV57CQ8ymJ
	mYXnc5Iu4DmQhuHr9c68sQy8sTbtSQKA=; b=gmTp5H4pyJl2bQGN0MmDSdMwfn3
	yX7cXfISaAD49TwkCNf+Q+1wd+/j+OpmwWykqo10Fv3CncvoT09CanLZ0XhGMgRO
	Fg2Ya3CZIJwdD94lJkzFd/viSjUyQb+Xe0eNoDqyUfgyvCBQGOSatWXK8x0IPm51
	qSB1Y6LYpdgfxS2f7aWY5wO7gbQtmmTkr3Qlq9WcYUQp88o70NNmDoNIkFPFnGAF
	WvbCy/rckNCsAsI9den2DW9CXWqg8G/l9PLnbKv7B/YTDrrPBYGLf1cQiMvnz2+c
	UNxonW/1TMo66gKNsePCIGBQp52EaeS1Z06pkGKMD6t5/hy2tGwrWdgItsA==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47smbepmfw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 10 Jul 2025 22:46:05 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-31220ecc586so1472263a91.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 10 Jul 2025 15:46:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752187564; x=1752792364;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qTV57CQ8ymJmYXnc5Iu4DmQhuHr9c68sQy8sTbtSQKA=;
        b=ILUoUQCILg0mlQVxBvJMnTdabIRUpQiqwiULN5hUIhrxNuA+TgqsCJI4/wd9aa0cIn
         6vi+9CX25ipgZEAm9bMi+2XBPn/2QtpP0AjMdO8rQprTPlJk7wWIZ+4aYNg5Z+soPqd2
         kkf4NheEa89/VoL8MNltq/q6eSJzeyZT6di5JrZZpbNT3WV6gPeBNFh6Vtw1bJqMo8QX
         tIcO7vRuQNNYnl0LYzL0c4QglFJGJvvXSEz5dsWjN3Tef5PRKJGrLyCDmn5xZIdvhkrb
         au4mc8hCcGo17zMXRkbGYTC3bPrA8J9NLuDyxCKM9Qx/seobgeXuWak++ribQ3Gwa5hR
         vRfw==
X-Forwarded-Encrypted: i=1; AJvYcCW8JfIG0Jl5Ss+0jAYmWQbruYongHAJ067p4DyXNqKX4VTrKe1KcSe5SzMjLckDGDNue74rtWPODR3Pu4CQ@vger.kernel.org
X-Gm-Message-State: AOJu0Yy7vk+SpoaRvgNlAJYCUXOALEsBizc03uzFevMk4yRq0YrgyO8X
	O59j6ocxYy6N9EIDTKUkzRnLd3mCuWHyqyvwX31XFfzpZXy5xF4K5w7ASZlIlnISEu1WjGFW7wG
	PTR2QxoZETrWBCa42UdVv6vZgQQmuFx+IwdeejzSA4k4UGrA6apCRBDN1gRGqcgBnDuCF
X-Gm-Gg: ASbGncs/rOMS+J7EZ/w8cFlewyR8R0MU8MnHgv5LBhHIKl2WQ84+5Ytj9Lm3omxkUIY
	kiqWr4oEtCxW9BmfaF7X8csUTX9dgucKu1PlUF1pdPkRI/geYzUL9jMddfm+3JoA1Wc9U6JEJeu
	qCBEVHSeq4xfTBxI/iRG+lavokNKN7RXTFuh0C6BIWG2oP2boPZKN4MgY7NFjm9DJ5eC+x5oi/m
	wEEGB68etIbZPOR7cewBL/Mb1ilvk4iYZKtYNm++ATbdNPs6kyGjzpev7jzXwBZU7Bpf7c+NIDp
	kzWg5UueNDorOG98O2UcLEogp07mvMwbmo5Yaipx/p/9J8uEqaimR3Th7yJ8JmmBxWxbk5+Bm33
	2RTqBwhxuxaG/9SxdYn66q7iWDIk=
X-Received: by 2002:a17:903:98c:b0:22e:421b:49b1 with SMTP id d9443c01a7336-23dede94a67mr12179045ad.48.1752187564125;
        Thu, 10 Jul 2025 15:46:04 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGkdL3WJ6xRqtGtImhgF2AwOwFBRgfjiJyMt52F5VPsKm3YbKQk5xFMvR1NzIW+jCLp+JXxFQ==
X-Received: by 2002:a17:903:98c:b0:22e:421b:49b1 with SMTP id d9443c01a7336-23dede94a67mr12178805ad.48.1752187563716;
        Thu, 10 Jul 2025 15:46:03 -0700 (PDT)
Received: from hu-amelende-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23de4341d51sm30479615ad.189.2025.07.10.15.46.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Jul 2025 15:46:03 -0700 (PDT)
From: Anjelique Melendez <anjelique.melendez@oss.qualcomm.com>
To: amitk@kernel.org, thara.gopinath@gmail.com, rafael@kernel.org,
        daniel.lezcano@linaro.org
Cc: rui.zhang@intel.com, lukasz.luba@arm.com, david.collins@oss.qualcomm.com,
        stefan.schmidt@linaro.org, quic_tsoni@quicinc.com,
        konrad.dybcio@oss.qualcomm.com, linux-arm-msm@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
        dmitry.baryshkov@linaro.org, dmitry.baryshkov@oss.qualcomm.com
Subject: [PATCH v6 5/5] thermal: qcom-spmi-temp-alarm: add support for LITE PMIC peripherals
Date: Thu, 10 Jul 2025 15:45:55 -0700
Message-Id: <20250710224555.3047790-6-anjelique.melendez@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250710224555.3047790-1-anjelique.melendez@oss.qualcomm.com>
References: <20250710224555.3047790-1-anjelique.melendez@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzEwMDE5MSBTYWx0ZWRfXw4fCg/ypQbtV
 Ti2QQlaiACpl9ZIUtJZlInKetJJP6XjTvFQNE8dPF2XUVmkxp7CtmQAfVKyBSGcoav6uvPDdm1X
 fdCXZRrbLVhfUtGf0KviM7+8spaI10HfaEndmxhAmrc33dUP++mv5brTs/ejpUZStdTa9F98IB1
 4qXu7Jff6nmzFeTAokNmRFfUAdDT+q1pbEx7w4sYeY9Yvx0iHYSB/nIvVqFHJxnyWJaFDVtD/s0
 G7x1nwpTffm/2QA6/uKzgwCKQt9LQgE/2Q8rURB5Kq0SKpl/UoshXqt8iLyQ9+BXvAthMeNM+k2
 +GoHRaZyL7h/HgLdnG3gQqUaVuMURLo1pa1aHT/eu9bPNWA4SnA5RLC8g80e/AvehhPvC04hBks
 M4UpYIbMaL9mplwAyQRBEjf7YLqme/Z8leqDJv3vmlokspcWtWG6mCw+ZJv7MY0vgSdx4zjF
X-Proofpoint-GUID: f7Oa0_d-qV-E7amWzVGPYzogNcVFBasB
X-Proofpoint-ORIG-GUID: f7Oa0_d-qV-E7amWzVGPYzogNcVFBasB
X-Authority-Analysis: v=2.4 cv=VpQjA/2n c=1 sm=1 tr=0 ts=687042ad cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=mWY56GqtIC0XaCpv56YA:9
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-10_05,2025-07-09_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 malwarescore=0 suspectscore=0 clxscore=1015 impostorscore=0
 phishscore=0 mlxlogscore=999 lowpriorityscore=0 adultscore=0
 priorityscore=1501 bulkscore=0 spamscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507100191

Add support for TEMP_ALARM LITE PMIC peripherals. This subtype
utilizes a pair of registers to configure a warning interrupt
threshold temperature and an automatic hardware shutdown
threshold temperature.

Co-developed-by: David Collins <david.collins@oss.qualcomm.com>
Signed-off-by: David Collins <david.collins@oss.qualcomm.com>
Signed-off-by: Anjelique Melendez <anjelique.melendez@oss.qualcomm.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/thermal/qcom/qcom-spmi-temp-alarm.c | 208 +++++++++++++++++++-
 1 file changed, 207 insertions(+), 1 deletion(-)

diff --git a/drivers/thermal/qcom/qcom-spmi-temp-alarm.c b/drivers/thermal/qcom/qcom-spmi-temp-alarm.c
index 9fbfd192017d..f39ca0ddd17b 100644
--- a/drivers/thermal/qcom/qcom-spmi-temp-alarm.c
+++ b/drivers/thermal/qcom/qcom-spmi-temp-alarm.c
@@ -23,6 +23,7 @@
 #define QPNP_TM_REG_TYPE		0x04
 #define QPNP_TM_REG_SUBTYPE		0x05
 #define QPNP_TM_REG_STATUS		0x08
+#define QPNP_TM_REG_IRQ_STATUS		0x10
 #define QPNP_TM_REG_SHUTDOWN_CTRL1	0x40
 #define QPNP_TM_REG_ALARM_CTRL		0x46
 
@@ -30,14 +31,20 @@
 #define QPNP_TM_REG_TEMP_DAC_STG1	0x47
 #define QPNP_TM_REG_TEMP_DAC_STG2	0x48
 #define QPNP_TM_REG_TEMP_DAC_STG3	0x49
+#define QPNP_TM_REG_LITE_TEMP_CFG1	0x50
+#define QPNP_TM_REG_LITE_TEMP_CFG2	0x51
 
 #define QPNP_TM_TYPE			0x09
 #define QPNP_TM_SUBTYPE_GEN1		0x08
 #define QPNP_TM_SUBTYPE_GEN2		0x09
+#define QPNP_TM_SUBTYPE_LITE		0xC0
 
 #define STATUS_GEN1_STAGE_MASK		GENMASK(1, 0)
 #define STATUS_GEN2_STATE_MASK		GENMASK(6, 4)
 
+/* IRQ status only needed for TEMP_ALARM_LITE */
+#define IRQ_STATUS_MASK			BIT(0)
+
 #define SHUTDOWN_CTRL1_OVERRIDE_STAGE2	BIT(6)
 #define SHUTDOWN_CTRL1_THRESHOLD_MASK	GENMASK(1, 0)
 
@@ -45,6 +52,8 @@
 
 #define ALARM_CTRL_FORCE_ENABLE		BIT(7)
 
+#define LITE_TEMP_CFG_THRESHOLD_MASK	GENMASK(3, 2)
+
 #define THRESH_COUNT			4
 #define STAGE_COUNT			3
 
@@ -95,6 +104,19 @@ static const long temp_dac_max[STAGE_COUNT] = {
 	119375, 159375, 159375
 };
 
+/*
+ * TEMP_ALARM_LITE has two stages: warning and shutdown with independently
+ * configured threshold temperatures.
+ */
+
+static const long temp_lite_warning_map[THRESH_COUNT] = {
+	115000, 125000, 135000, 145000
+};
+
+static const long temp_lite_shutdown_map[THRESH_COUNT] = {
+	135000, 145000, 160000, 175000
+};
+
 /* Temperature in Milli Celsius reported during stage 0 if no ADC is present */
 #define DEFAULT_TEMP			37000
 
@@ -202,6 +224,24 @@ static int qpnp_tm_gen2_get_temp_stage(struct qpnp_tm_chip *chip)
 	return alarm_state_map[ret];
 }
 
+/**
+ * qpnp_tm_lite_get_temp_stage() - return over-temperature stage
+ * @chip:		Pointer to the qpnp_tm chip
+ *
+ * Return: alarm interrupt state on success, or errno on failure.
+ */
+static int qpnp_tm_lite_get_temp_stage(struct qpnp_tm_chip *chip)
+{
+	u8 reg = 0;
+	int ret;
+
+	ret = qpnp_tm_read(chip, QPNP_TM_REG_IRQ_STATUS, &reg);
+	if (ret < 0)
+		return ret;
+
+	return FIELD_GET(IRQ_STATUS_MASK, reg);
+}
+
 /*
  * This function updates the internal temp value based on the
  * current thermal stage and threshold as well as the previous stage
@@ -383,6 +423,98 @@ static const struct thermal_zone_device_ops qpnp_tm_gen2_rev2_sensor_ops = {
 	.set_trip_temp = qpnp_tm_gen2_rev2_set_trip_temp,
 };
 
+static int qpnp_tm_lite_set_temp_thresh(struct qpnp_tm_chip *chip, unsigned int trip, int temp)
+{
+	int ret, temp_cfg, i;
+	const long *temp_map;
+	u8 reg, thresh;
+	u16 addr;
+
+	WARN_ON(!mutex_is_locked(&chip->lock));
+
+	if (trip >= STAGE_COUNT) {
+		dev_err(chip->dev, "invalid TEMP_LITE trip = %d\n", trip);
+		return -EINVAL;
+	}
+
+	switch (trip) {
+	case 0:
+		temp_map = temp_lite_warning_map;
+		addr = QPNP_TM_REG_LITE_TEMP_CFG1;
+		break;
+	case 1:
+		/*
+		 * The second trip point is purely in software to facilitate
+		 * a controlled shutdown after the warning threshold is crossed
+		 * but before the automatic hardware shutdown threshold is
+		 * crossed.
+		 */
+		return 0;
+	case 2:
+		temp_map = temp_lite_shutdown_map;
+		addr = QPNP_TM_REG_LITE_TEMP_CFG2;
+		break;
+	default:
+		return 0;
+	}
+
+	if (temp < temp_map[THRESH_MIN] || temp > temp_map[THRESH_MAX]) {
+		dev_err(chip->dev, "invalid TEMP_LITE temp = %d\n", temp);
+		return -EINVAL;
+	}
+
+	thresh = 0;
+	temp_cfg = temp_map[thresh];
+	for (i = THRESH_MAX; i >= THRESH_MIN; i--) {
+		if (temp >= temp_map[i]) {
+			thresh = i;
+			temp_cfg = temp_map[i];
+			break;
+		}
+	}
+
+	if (temp_cfg == chip->temp_thresh_map[trip])
+		return 0;
+
+	ret = qpnp_tm_read(chip, addr, &reg);
+	if (ret < 0) {
+		dev_err(chip->dev, "LITE_TEMP_CFG read failed, ret=%d\n", ret);
+		return ret;
+	}
+
+	reg &= ~LITE_TEMP_CFG_THRESHOLD_MASK;
+	reg |= FIELD_PREP(LITE_TEMP_CFG_THRESHOLD_MASK, thresh);
+
+	ret = qpnp_tm_write(chip, addr, reg);
+	if (ret < 0) {
+		dev_err(chip->dev, "LITE_TEMP_CFG write failed, ret=%d\n", ret);
+		return ret;
+	}
+
+	chip->temp_thresh_map[trip] = temp_cfg;
+
+	return 0;
+}
+
+static int qpnp_tm_lite_set_trip_temp(struct thermal_zone_device *tz,
+				      const struct thermal_trip *trip, int temp)
+{
+	unsigned int trip_index = THERMAL_TRIP_PRIV_TO_INT(trip->priv);
+	struct qpnp_tm_chip *chip = thermal_zone_device_priv(tz);
+	int ret;
+
+	mutex_lock(&chip->lock);
+	ret = qpnp_tm_lite_set_temp_thresh(chip, trip_index, temp);
+	mutex_unlock(&chip->lock);
+
+	return ret;
+}
+
+static const struct thermal_zone_device_ops qpnp_tm_lite_sensor_ops = {
+	.get_temp = qpnp_tm_get_temp,
+	.set_trip_temp = qpnp_tm_lite_set_trip_temp,
+};
+
 static irqreturn_t qpnp_tm_isr(int irq, void *data)
 {
 	struct qpnp_tm_chip *chip = data;
@@ -478,6 +610,70 @@ static int qpnp_tm_gen2_rev2_sync_thresholds(struct qpnp_tm_chip *chip)
 	return 0;
 }
 
+/* Configure TEMP_LITE registers based on DT thermal_zone trips */
+static int qpnp_tm_lite_configure_trip_temps_cb(struct thermal_trip *trip, void *data)
+{
+	struct qpnp_tm_chip *chip = data;
+	int ret;
+
+	mutex_lock(&chip->lock);
+	trip->priv = THERMAL_INT_TO_TRIP_PRIV(chip->ntrips);
+	ret = qpnp_tm_lite_set_temp_thresh(chip, chip->ntrips, trip->temperature);
+	chip->ntrips++;
+	mutex_unlock(&chip->lock);
+
+	return ret;
+}
+
+static int qpnp_tm_lite_configure_trip_temps(struct qpnp_tm_chip *chip)
+{
+	int ret;
+
+	ret = thermal_zone_for_each_trip(chip->tz_dev, qpnp_tm_lite_configure_trip_temps_cb, chip);
+	if (ret < 0)
+		return ret;
+
+	/* Verify that trips are strictly increasing. */
+	if (chip->temp_thresh_map[2] <= chip->temp_thresh_map[0]) {
+		dev_err(chip->dev, "Threshold 2=%ld <= threshold 0=%ld\n",
+			chip->temp_thresh_map[2], chip->temp_thresh_map[0]);
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
+/* Read the hardware default TEMP_LITE stage threshold temperatures */
+static int qpnp_tm_lite_sync_thresholds(struct qpnp_tm_chip *chip)
+{
+	int ret, thresh;
+	u8 reg = 0;
+
+	/*
+	 * Store the warning trip temp in temp_thresh_map[0] and the shutdown trip
+	 * temp in temp_thresh_map[2].  The second trip point is purely in software
+	 * to facilitate a controlled shutdown after the warning threshold is
+	 * crossed but before the automatic hardware shutdown threshold is
+	 * crossed.  Thus, there is no register to read for the second trip
+	 * point.
+	 */
+	ret = qpnp_tm_read(chip, QPNP_TM_REG_LITE_TEMP_CFG1, &reg);
+	if (ret < 0)
+		return ret;
+
+	thresh = FIELD_GET(LITE_TEMP_CFG_THRESHOLD_MASK, reg);
+	chip->temp_thresh_map[0] = temp_lite_warning_map[thresh];
+
+	ret = qpnp_tm_read(chip, QPNP_TM_REG_LITE_TEMP_CFG2, &reg);
+	if (ret < 0)
+		return ret;
+
+	thresh = FIELD_GET(LITE_TEMP_CFG_THRESHOLD_MASK, reg);
+	chip->temp_thresh_map[2] = temp_lite_shutdown_map[thresh];
+
+	return 0;
+}
+
 static const struct spmi_temp_alarm_data spmi_temp_alarm_data = {
 	.ops = &qpnp_tm_sensor_ops,
 	.temp_map = &temp_map_gen1,
@@ -509,6 +705,13 @@ static const struct spmi_temp_alarm_data spmi_temp_alarm_gen2_rev2_data = {
 	.get_temp_stage = qpnp_tm_gen2_get_temp_stage,
 };
 
+static const struct spmi_temp_alarm_data spmi_temp_alarm_lite_data = {
+	.ops = &qpnp_tm_lite_sensor_ops,
+	.sync_thresholds = qpnp_tm_lite_sync_thresholds,
+	.configure_trip_temps = qpnp_tm_lite_configure_trip_temps,
+	.get_temp_stage = qpnp_tm_lite_get_temp_stage,
+};
+
 /*
  * This function initializes the internal temp value based on only the
  * current thermal stage and threshold.
@@ -614,7 +817,8 @@ static int qpnp_tm_probe(struct platform_device *pdev)
 				     "could not read dig_minor\n");
 
 	if (type != QPNP_TM_TYPE || (subtype != QPNP_TM_SUBTYPE_GEN1
-				     && subtype != QPNP_TM_SUBTYPE_GEN2)) {
+				     && subtype != QPNP_TM_SUBTYPE_GEN2
+				     && subtype != QPNP_TM_SUBTYPE_LITE)) {
 		dev_err(&pdev->dev, "invalid type 0x%02x or subtype 0x%02x\n",
 			type, subtype);
 		return -ENODEV;
@@ -629,6 +833,8 @@ static int qpnp_tm_probe(struct platform_device *pdev)
 		chip->data = &spmi_temp_alarm_gen2_rev1_data;
 	else if (subtype == QPNP_TM_SUBTYPE_GEN2 && dig_major >= 2)
 		chip->data = &spmi_temp_alarm_gen2_rev2_data;
+	else if (subtype == QPNP_TM_SUBTYPE_LITE)
+		chip->data = &spmi_temp_alarm_lite_data;
 	else
 		return -ENODEV;
 
-- 
2.34.1


