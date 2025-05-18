Return-Path: <linux-arm-msm+bounces-58347-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F958ABB02D
	for <lists+linux-arm-msm@lfdr.de>; Sun, 18 May 2025 14:18:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B0DFF1895641
	for <lists+linux-arm-msm@lfdr.de>; Sun, 18 May 2025 12:18:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 220E121ABAE;
	Sun, 18 May 2025 12:17:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b="MDoRHQhw"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.smtpout.orange.fr (smtp-30.smtpout.orange.fr [80.12.242.30])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C520E8F6F;
	Sun, 18 May 2025 12:17:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.12.242.30
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747570675; cv=none; b=KeIXNxdrouGvheUuOsQz0TIi6wpqwZB2Pstq0ZaS/MXrBDal3aSAOsWRgFZrSznudTwHk3LhjnlyRteIW+OgkWwpbuUWVrm74R5OUFh3uy8VzKu9pL+pggIgbv42G7Rfz3Bmeih0rRdpcJYcBPHd29KeE9cdsCKvxCGqEGsx5MA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747570675; c=relaxed/simple;
	bh=0v/G4KcYtPxRvt1h3Inzd4Yw8+tP49EnSXrRK1XGvCc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=U2gWSr+9KFpF88rqMu9/RdZpZ25iEq6RfyK6+BDhD6rASLPAOWZHM/DS+siOVnaJk8+k+Ex+sxqx3XD8tJdXZfaVs2/JW4xrQOem0830IDF7F0ZTpF6lf8OdhRyEodTobIsdjPedVfNwBdi0HpdJw9+7n+VGTplQrJ+cBBByp5Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wanadoo.fr; spf=pass smtp.mailfrom=wanadoo.fr; dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b=MDoRHQhw; arc=none smtp.client-ip=80.12.242.30
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wanadoo.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wanadoo.fr
Received: from localhost.localdomain ([90.11.132.44])
	by smtp.orange.fr with ESMTPA
	id GcwQuJOtAXqD9GcwQuDNR9; Sun, 18 May 2025 14:16:30 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
	s=t20230301; t=1747570590;
	bh=oK1c9fHfkRUZnB9Q4IFRGsFSdnhn8KItWVH7jNnZ+1o=;
	h=From:To:Subject:Date:Message-ID:MIME-Version;
	b=MDoRHQhwQ/guYGLQEVlIIvLoC+fZLYp+b95jI4Qc+g6ZO94jUkHT8rq7DxOq/Kdsk
	 TDc4hmW1BnxJLT1RiIXB6bNCJ29ibWR6N0yG4+jPj/tgf1nTTHMUitn2QKlkWr5hFM
	 ZVwHV+MXHXgocbx2KT2d8bk2//zVe0N5gaBASKWn70pArsgZR/kRHS1Zz/a9k9dzMq
	 RVXAwpLgKRosVwdhqDInRVs0LZSXJf581aFGx29O0ANqDJf414FJ4BUPEPR012faoT
	 LdAKtHusGGrZrYvuvtl0Dn7K/ALXU1OW7z8FPhX2gVaBvls1EF9epkV0G21HTJ46ss
	 sKmMm/AyC5G9Q==
X-ME-Helo: localhost.localdomain
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Sun, 18 May 2025 14:16:30 +0200
X-ME-IP: 90.11.132.44
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>
Cc: linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
	linux-arm-msm@vger.kernel.org
Subject: [PATCH] regulator: qcom_spmi: Constify struct spmi_voltage_range
Date: Sun, 18 May 2025 14:16:21 +0200
Message-ID: <ef2a4b6df61e19470ddf6cbd1f3ca1ce88a3c1a0.1747570556.git.christophe.jaillet@wanadoo.fr>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

'struct spmi_voltage_range' are only modified at runtime to compile a
field, n_voltages, that could be computed at compile time.

So, simplify spmi_calculate_num_voltages() and compute n_voltages at
compile time within the SPMI_VOLTAGE_RANGE macro.

Constifying these structures moves some data to a read-only section, so
increase overall security.

On a x86_64, with allmodconfig:
Before:
======
   text	   data	    bss	    dec	    hex	filename
  85437	  26776	    512	 112725	  1b855	drivers/regulator/qcom_spmi-regulator.o

After:
=====
   text	   data	    bss	    dec	    hex	filename
  86857	  24760	    512	 112129	  1b601	drivers/regulator/qcom_spmi-regulator.o

Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
Compile tested-only.

I've also checked in the .s file that n_voltages was set initialized with
the correct value.
---
 drivers/regulator/qcom_spmi-regulator.c | 69 ++++++++++++-------------
 1 file changed, 32 insertions(+), 37 deletions(-)

diff --git a/drivers/regulator/qcom_spmi-regulator.c b/drivers/regulator/qcom_spmi-regulator.c
index d66a0f61637e..c1a41ce70b36 100644
--- a/drivers/regulator/qcom_spmi-regulator.c
+++ b/drivers/regulator/qcom_spmi-regulator.c
@@ -400,7 +400,7 @@ struct spmi_voltage_range {
  * so that range[i].set_point_max_uV < range[i+1].set_point_min_uV.
  */
 struct spmi_voltage_set_points {
-	struct spmi_voltage_range		*range;
+	const struct spmi_voltage_range		*range;
 	int					count;
 	unsigned				n_voltages;
 };
@@ -474,6 +474,9 @@ struct spmi_regulator_data {
 		.set_point_max_uV	= _set_point_max_uV, \
 		.step_uV		= _step_uV, \
 		.range_sel		= _range_sel, \
+		.n_voltages		= (_set_point_max_uV != 0) ? \
+						((_set_point_max_uV - _set_point_min_uV) / _step_uV) + 1 : \
+						0, \
 	}
 
 #define DEFINE_SPMI_SET_POINTS(name) \
@@ -489,110 +492,110 @@ struct spmi_voltage_set_points name##_set_points = { \
  * increasing and unique.  The set_voltage callback functions expect these
  * properties to hold.
  */
-static struct spmi_voltage_range pldo_ranges[] = {
+static const struct spmi_voltage_range pldo_ranges[] = {
 	SPMI_VOLTAGE_RANGE(2,  750000,  750000, 1537500, 1537500, 12500),
 	SPMI_VOLTAGE_RANGE(3, 1500000, 1550000, 3075000, 3075000, 25000),
 	SPMI_VOLTAGE_RANGE(4, 1750000, 3100000, 4900000, 4900000, 50000),
 };
 
-static struct spmi_voltage_range nldo1_ranges[] = {
+static const struct spmi_voltage_range nldo1_ranges[] = {
 	SPMI_VOLTAGE_RANGE(2,  750000,  750000, 1537500, 1537500, 12500),
 };
 
-static struct spmi_voltage_range nldo2_ranges[] = {
+static const struct spmi_voltage_range nldo2_ranges[] = {
 	SPMI_VOLTAGE_RANGE(0,  375000,       0,       0, 1537500, 12500),
 	SPMI_VOLTAGE_RANGE(1,  375000,  375000,  768750,  768750,  6250),
 	SPMI_VOLTAGE_RANGE(2,  750000,  775000, 1537500, 1537500, 12500),
 };
 
-static struct spmi_voltage_range nldo3_ranges[] = {
+static const struct spmi_voltage_range nldo3_ranges[] = {
 	SPMI_VOLTAGE_RANGE(0,  375000,  375000, 1537500, 1537500, 12500),
 	SPMI_VOLTAGE_RANGE(1,  375000,       0,       0, 1537500, 12500),
 	SPMI_VOLTAGE_RANGE(2,  750000,       0,       0, 1537500, 12500),
 };
 
-static struct spmi_voltage_range ln_ldo_ranges[] = {
+static const struct spmi_voltage_range ln_ldo_ranges[] = {
 	SPMI_VOLTAGE_RANGE(1,  690000,  690000, 1110000, 1110000, 60000),
 	SPMI_VOLTAGE_RANGE(0, 1380000, 1380000, 2220000, 2220000, 120000),
 };
 
-static struct spmi_voltage_range smps_ranges[] = {
+static const struct spmi_voltage_range smps_ranges[] = {
 	SPMI_VOLTAGE_RANGE(0,  375000,  375000, 1562500, 1562500, 12500),
 	SPMI_VOLTAGE_RANGE(1, 1550000, 1575000, 3125000, 3125000, 25000),
 };
 
-static struct spmi_voltage_range ftsmps_ranges[] = {
+static const struct spmi_voltage_range ftsmps_ranges[] = {
 	SPMI_VOLTAGE_RANGE(0,       0,  350000, 1275000, 1275000,  5000),
 	SPMI_VOLTAGE_RANGE(1,       0, 1280000, 2040000, 2040000, 10000),
 };
 
-static struct spmi_voltage_range ftsmps2p5_ranges[] = {
+static const struct spmi_voltage_range ftsmps2p5_ranges[] = {
 	SPMI_VOLTAGE_RANGE(0,   80000,  350000, 1355000, 1355000,  5000),
 	SPMI_VOLTAGE_RANGE(1,  160000, 1360000, 2200000, 2200000, 10000),
 };
 
-static struct spmi_voltage_range ftsmps426_ranges[] = {
+static const struct spmi_voltage_range ftsmps426_ranges[] = {
 	SPMI_VOLTAGE_RANGE(0,       0,  320000, 1352000, 1352000,  4000),
 };
 
-static struct spmi_voltage_range boost_ranges[] = {
+static const struct spmi_voltage_range boost_ranges[] = {
 	SPMI_VOLTAGE_RANGE(0, 4000000, 4000000, 5550000, 5550000, 50000),
 };
 
-static struct spmi_voltage_range boost_byp_ranges[] = {
+static const struct spmi_voltage_range boost_byp_ranges[] = {
 	SPMI_VOLTAGE_RANGE(0, 2500000, 2500000, 5200000, 5650000, 50000),
 };
 
-static struct spmi_voltage_range ult_lo_smps_ranges[] = {
+static const struct spmi_voltage_range ult_lo_smps_ranges[] = {
 	SPMI_VOLTAGE_RANGE(0,  375000,  375000, 1562500, 1562500, 12500),
 	SPMI_VOLTAGE_RANGE(1,  750000,       0,       0, 1525000, 25000),
 };
 
-static struct spmi_voltage_range ult_ho_smps_ranges[] = {
+static const struct spmi_voltage_range ult_ho_smps_ranges[] = {
 	SPMI_VOLTAGE_RANGE(0, 1550000, 1550000, 2325000, 2325000, 25000),
 };
 
-static struct spmi_voltage_range ult_nldo_ranges[] = {
+static const struct spmi_voltage_range ult_nldo_ranges[] = {
 	SPMI_VOLTAGE_RANGE(0,  375000,  375000, 1537500, 1537500, 12500),
 };
 
-static struct spmi_voltage_range ult_pldo_ranges[] = {
+static const struct spmi_voltage_range ult_pldo_ranges[] = {
 	SPMI_VOLTAGE_RANGE(0, 1750000, 1750000, 3337500, 3337500, 12500),
 };
 
-static struct spmi_voltage_range pldo660_ranges[] = {
+static const struct spmi_voltage_range pldo660_ranges[] = {
 	SPMI_VOLTAGE_RANGE(0, 1504000, 1504000, 3544000, 3544000, 8000),
 };
 
-static struct spmi_voltage_range nldo660_ranges[] = {
+static const struct spmi_voltage_range nldo660_ranges[] = {
 	SPMI_VOLTAGE_RANGE(0,  320000,  320000, 1304000, 1304000, 8000),
 };
 
-static struct spmi_voltage_range ht_lvpldo_ranges[] = {
+static const struct spmi_voltage_range ht_lvpldo_ranges[] = {
 	SPMI_VOLTAGE_RANGE(0, 1504000, 1504000, 2000000, 2000000, 8000),
 };
 
-static struct spmi_voltage_range ht_nldo_ranges[] = {
+static const struct spmi_voltage_range ht_nldo_ranges[] = {
 	SPMI_VOLTAGE_RANGE(0,  312000,  312000, 1304000, 1304000, 8000),
 };
 
-static struct spmi_voltage_range hfs430_ranges[] = {
+static const struct spmi_voltage_range hfs430_ranges[] = {
 	SPMI_VOLTAGE_RANGE(0, 320000, 320000, 2040000, 2040000, 8000),
 };
 
-static struct spmi_voltage_range ht_p150_ranges[] = {
+static const struct spmi_voltage_range ht_p150_ranges[] = {
 	SPMI_VOLTAGE_RANGE(0, 1616000, 1616000, 3304000, 3304000, 8000),
 };
 
-static struct spmi_voltage_range ht_p600_ranges[] = {
+static const struct spmi_voltage_range ht_p600_ranges[] = {
 	SPMI_VOLTAGE_RANGE(0, 1704000, 1704000, 1896000, 1896000, 8000),
 };
 
-static struct spmi_voltage_range nldo_510_ranges[] = {
+static const struct spmi_voltage_range nldo_510_ranges[] = {
 	SPMI_VOLTAGE_RANGE(0, 320000, 320000, 1304000, 1304000, 8000),
 };
 
-static struct spmi_voltage_range ftsmps510_ranges[] = {
+static const struct spmi_voltage_range ftsmps510_ranges[] = {
 	SPMI_VOLTAGE_RANGE(0, 300000, 300000, 1372000, 1372000, 4000),
 };
 
@@ -1676,18 +1679,10 @@ static const struct spmi_regulator_mapping supported_regulators[] = {
 
 static void spmi_calculate_num_voltages(struct spmi_voltage_set_points *points)
 {
-	unsigned int n;
-	struct spmi_voltage_range *range = points->range;
-
-	for (; range < points->range + points->count; range++) {
-		n = 0;
-		if (range->set_point_max_uV) {
-			n = range->set_point_max_uV - range->set_point_min_uV;
-			n = (n / range->step_uV) + 1;
-		}
-		range->n_voltages = n;
-		points->n_voltages += n;
-	}
+	const struct spmi_voltage_range *range = points->range;
+
+	for (; range < points->range + points->count; range++)
+		points->n_voltages += range->n_voltages;
 }
 
 static int spmi_regulator_match(struct spmi_regulator *vreg, u16 force_type)
-- 
2.49.0


