Return-Path: <linux-arm-msm+bounces-107577-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EI2JEN6zBWqeZwIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-107577-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 May 2026 13:37:02 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 98837541179
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 May 2026 13:37:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 2332C303C63B
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 May 2026 11:36:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EE3F83C1412;
	Thu, 14 May 2026 11:36:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WEGaNaHB";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="kOJvJQsu"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B23CD3AE197
	for <linux-arm-msm@vger.kernel.org>; Thu, 14 May 2026 11:36:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778758615; cv=none; b=GHHd1YT5IwbyXxjdkq8/rMyKSCoqnx9dqSfzaET2/STgbsYhnPDoLEkuI2Lm0TCh58V0BhGTSYDWd/26pDlDl8HPEYUyyxoj5zMRk4xDn/1tL/3gPpiRBEpM5y+amuqK/FD7TLPiuyoLd/Vz00ERe9W3WBYQT2rlSr8zIplYEhw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778758615; c=relaxed/simple;
	bh=DG5RTzkKQb9dNd7h3PMz3Uho11h1YkmAiGNLFN6vKD0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=NSB1rsweuq0WrGV7TWMh9k5RaEcqIfx40f8T0bJGq9MpFGNQ9ASNvlWA59gxpliYItbNnJmVr1WV1h4bh9hQIo6xI/ytRt6OFKI/eno4+ttipv1nxRN1Ve7tn0IQhe8l3eekfE8wUcqgINfEEiUc0f22qz8pWa9Hw0PwJaWKJb8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WEGaNaHB; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=kOJvJQsu; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64E9kHc61989824
	for <linux-arm-msm@vger.kernel.org>; Thu, 14 May 2026 11:36:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=qN16thgwwCwB2Rdns6XBfhr/Ra0hBXWE7M0
	kvmpsYQA=; b=WEGaNaHBFTPS1V9JNwpy/ptJJBgh+DuoaNWj6RbM8WdIIeRz+uM
	4Jtnz7ddnGcDbP+R+qdm1lmGSxl0ugNxDW5ruw6Hzez970JTlHvLal2JcJYAXMFU
	j5kJmCzguULAWfBlQsKFMSIOcvVcHKZbfk0LSCub663cUPKEUF1pRpbtee8O78Tw
	SrqekMkyKz8cjjvezzZBp57GE3TjMOgLsPouGErMHXig3MwOXVcKrwWikYsT9i86
	e2Sfhbj97qUkgDdII6I2WPXHwg2SYTepUXW7Y8AXQbpXjaY+GltILRjw+Zj+qw31
	TKbwygNng+6tGL9caTixTIPsgYz7NAktTjg==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e566bhjxm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 14 May 2026 11:36:52 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2bc763c7256so116511005ad.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 14 May 2026 04:36:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778758612; x=1779363412; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=qN16thgwwCwB2Rdns6XBfhr/Ra0hBXWE7M0kvmpsYQA=;
        b=kOJvJQsuC/2soMqbdmJxSOd+VQQJZ1kf4I1qZ7Sg3+eJlI9a4XMLmncvKGmq5tP75J
         KmfG9tpXT6rKSmWl0Wy4Ebn19SRnRt+Sk6RemRmUQVtDPcZMqLNW94icWHh3Vu9vpbzL
         Ug2VnJ53/T5uMll1CuiHaqRU2EZGlQn4pjJIzoD/rIdZK+nDURx3Np7asHbSan9/nYM+
         Y7vpauN60c8jJxvd6u7qerKgMlG2S2wHgA8cXapkclNR2dzvf+FG31gFD031ac2kNEYy
         YVLpoCMslsXXb++kcYASNSkBAG0wQB8l1bgB0ltikdItWH7EhTcd5G+KGkkPZahEA7cB
         d6XQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778758612; x=1779363412;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qN16thgwwCwB2Rdns6XBfhr/Ra0hBXWE7M0kvmpsYQA=;
        b=YKF4WZ1tcM04cPSlrhEeqOm+vQTBNodnpT+Khg4g/1UpVoyBElC+BJba+Dy4khn8mR
         1dKg8CXSOZemzprL2D3P8JphgDjOzLpofIAFIVWBqwh/GAKW+0uniAVxFIYJzZqu2Pvk
         4Gm8gsUxq7Ho551lOzDUOyhbs2faefyho8xVRE9XiuKGmOivLbRFkHN/DxIRrfkEqnIM
         xZTSpzbT2NvcLJ/UaX3X3l0miaEt+9ZVaaF18pw1ha6wfKt4rqFu55QDUpMcqiZalnSx
         YfIzU0DkiUDjaaHISS58h4Lp+Tl+547OUKDfY+TLhlt2FVw+3DKr3o3srpcN/PP+ge7I
         7LDQ==
X-Forwarded-Encrypted: i=1; AFNElJ+WTNSr8qPivKp56RZh8RUeqRJKQUIbDfU+70uUOxI7A3HUrqHO+Nv08IgDQ7RuJmcPd9EaWhmR0tpI4Trf@vger.kernel.org
X-Gm-Message-State: AOJu0YwB5VvA28PdoRXhHQqn4+tnQwdEjWhO0nVVxog6Hn6XlDGSPXBW
	lzd2XwlVDxIQuYGzXs09Br6oNSr6EQU6CFcGUDUalGgv2GKmRpa4Y00ayiRLcoudowTsXKrMiJX
	K+115Tt+bvtwS/ORzbp+SVQxY+wIk2lnYO3nX3/CnafezO1sr6NMTCXZzVf11gV35t0OP
X-Gm-Gg: Acq92OHxZ7lOVGx135df7rxhsrLNyPss1EDhaYSGeHRb2tRxEqtFAfD7DvLI289EZ5V
	U9f7u4JkIwBuJTPM+imXsiEJtXRbnqMctkbRoMWyqUtfxPSSIGSagxonk1YkCXHfW6JmixCfVKd
	1nLlno1XxA2AP6Ee4bc18fO83TWII7VO+BNQsEgti+Zg1ctjKp3bns8CQnuwjNayKkXvF4YW24+
	NjorDsYFm7ZtlFgq4F7HvDTj2B8a/s6f6CilzQbLE4upFlURgSZHg2oBoYhVDHkWGTkGmZ/ijxJ
	cAJPGDfpTr/HoBxwZ1yuqDkna9betHwa1FFU5gEWpyYGaPP/TXGsgDgsqZY4LeEg3tOuu7Esa5Q
	Mfz/7gEWfUee4EXUtcNjMfoMpgkCjrbjL5auJhfIPZnKGuO932jQqGvA=
X-Received: by 2002:a17:903:320d:b0:2b9:6458:1a2c with SMTP id d9443c01a7336-2bd272b4403mr78742115ad.13.1778758611321;
        Thu, 14 May 2026 04:36:51 -0700 (PDT)
X-Received: by 2002:a17:903:320d:b0:2b9:6458:1a2c with SMTP id d9443c01a7336-2bd272b4403mr78741775ad.13.1778758610675;
        Thu, 14 May 2026 04:36:50 -0700 (PDT)
Received: from hu-priyjain-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2bd5c05f27csm21756845ad.25.2026.05.14.04.36.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 May 2026 04:36:50 -0700 (PDT)
From: Priyansh Jain <priyansh.jain@oss.qualcomm.com>
To: Amit Kucheria <amitk@kernel.org>,
        Thara Gopinath <thara.gopinath@gmail.com>,
        "Rafael J . Wysocki" <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@kernel.org>,
        Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>
Cc: linux-pm@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, manaf.pallikunhi@oss.qualcomm.com,
        Priyansh Jain <priyansh.jain@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: [PATCH v5] thermal: qcom: tsens: atomic temperature read with hardware-guided retries
Date: Thu, 14 May 2026 17:06:43 +0530
Message-ID: <20260514113643.1954111-1-priyansh.jain@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: lLloselbRSr4J0CFlWIwSVo81GGwl1lx
X-Authority-Analysis: v=2.4 cv=WsMb99fv c=1 sm=1 tr=0 ts=6a05b3d4 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=wJ5UwyVIi5aKMrvtPbQA:9 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE0MDExNiBTYWx0ZWRfX/9o5c5fOChW4
 Khaw8s1vRffYjip/heIVs3dnCS1AmZLOWl7+Arz6Zm0mFuzbjcJKoIermqnWkINnYX7ZXaCSKHZ
 dQyqVckl0uQhyqSVsAW0+FJNF7MBTRqImyZTVJZbxFRNxmE0F8NzJd8tszZiFS2rQaNeCWqbxg5
 L92fENv1ylYYRYTO+MWG/GNqJm9l/d+uiiN6dtMydtJThu47UOAUimeTStC6vTTyC5k4Dny7Ni9
 z2frl9CGzNGtprGw65sy0NKGnO5Lsi4ASolTEZS/t7H5OqrffN+gP0b3fYKLvUAU1/FzQzF+B4B
 SCVfpgYW9MjIAqvoL0m6o7K7F4a3JALRrIkFS1JX54g3SfYhwyVPYmTGuTas+IfW2eVNNo6/qOV
 IvhHA1g2eX6hsL7CTe91YpADbYdXGQwnMjXf2fonB0RAStFEYRmqYlv0J5uLaZQdBzbTEWVeyuW
 9iWhBpObx1XBOwOeH2Q==
X-Proofpoint-GUID: lLloselbRSr4J0CFlWIwSVo81GGwl1lx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-14_02,2026-05-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 priorityscore=1501 malwarescore=0 phishscore=0 bulkscore=0
 impostorscore=0 lowpriorityscore=0 clxscore=1015 spamscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605050000 definitions=main-2605140116
X-Rspamd-Queue-Id: 98837541179
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com,intel.com,arm.com];
	RCPT_COUNT_TWELVE(0.00)[12];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-107577-lists,linux-arm-msm=lfdr.de];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[priyansh.jain@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	NEURAL_HAM(-0.00)[-1.000];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

The existing TSENS temperature read logic polls the valid bit and then
reads the temperature register. When temperature reads are triggered
at very short intervals, this can race with hardware updates and allow
the temperature field to be read while it is still being updated.

In this case, the valid bit may already be asserted even though the
temperature value is transitioning, resulting in an incorrect reading.

Hardware programming guidelines require the temperature value and the
valid bit to be sampled atomically in the same read transaction. A
reading is considered valid only if the valid bit is observed set in
that same sample.

The guidelines further specify that software should attempt the
temperature read up to three times to account for transient update
windows. If none of the attempts yields a valid sample, a stable fallback
value must be returned: if the first and second samples match, the second
value is returned;otherwise, if the second and third samples match, the
third value is returned;if neither pair matches, -EAGAIN is returned.

Update the TSENS sensor read logic to implement atomic sampling along
with the recommended retry-and-compare fallback behavior. This removes
the race window and ensures deterministic temperature values in
accordance with hardware requirements.

Signed-off-by: Priyansh Jain <priyansh.jain@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

---
Changes in v5:
- Reformat multi-line comment to follow kernel style
- Add spacing for improved readability
- Minor code cleanup and variable declaration adjustment
- Link in v4: https://lore.kernel.org/all/20260513054412.911048-1-priyansh.jain@oss.qualcomm.com/

Changes in v4:
- Fix indentation issue based on review feedback
- Link to v3: https://lore.kernel.org/all/15e8fb71-1eb0-4440-a8cf-26f19f66b2bb@oss.qualcomm.com/

Changes in v3:
- Remove valid_bit, last_temp_mask, and last_temp_resolution fields from
  struct tsens_features in tsens.h
- Compute last_temp_mask, resolution, and valid_bit on-the-fly using
  regmap field definitions
- Remove field initializations from all platform data files
  (tsens-v0_1.c, tsens-v1.c, tsens-v2.c)
- Remove the initialization line in init_common() that was computing
  last_temp_mask
- Link to v2: https://lore.kernel.org/all/6e0081a3-a28b-49e5-825d-405cc157254f@oss.qualcomm.com/

Changes in v2:
- Reverted merging of the valid-bit and LAST_TEMP register field logic
  to preserve the regmap differences between TSENS versions
- Defined valid-bit support and last temperature resolution for all
  TSENS v1 and v2 feature structures
- Defined last temperature resolution for Tsens v0 feature structure
- Dropped tsens version checks in favor of valid-bit capability
- Computed masks from resolution to keep a single source of truth
- Minor code cleanups based on review feedback
- Link to v1: https://lore.kernel.org/all/c07fd488-a455-413f-b25f-9f9f1afda097@oss.qualcomm.com/
---
 drivers/thermal/qcom/tsens.c | 111 ++++++++++++++++++++++++-----------
 drivers/thermal/qcom/tsens.h |   1 +
 2 files changed, 78 insertions(+), 34 deletions(-)

diff --git a/drivers/thermal/qcom/tsens.c b/drivers/thermal/qcom/tsens.c
index a2422ebee816..40f27c1a1cd5 100644
--- a/drivers/thermal/qcom/tsens.c
+++ b/drivers/thermal/qcom/tsens.c
@@ -316,9 +316,66 @@ static inline int code_to_degc(u32 adc_code, const struct tsens_sensor *s)
 }
 
 /**
- * tsens_hw_to_mC - Return sign-extended temperature in mCelsius.
+ * tsens_read_temp - Retrieve temperature readings from the hardware.
  * @s:     Pointer to sensor struct
  * @field: Index into regmap_field array pointing to temperature data
+ * @temp: temperature in deciCelsius to be read from hardware
+ *
+ * This function handles temperature returned in ADC code or deciCelsius
+ * depending on IP version.
+ *
+ * Return: 0 on success, a negative errno will be returned in error cases
+ */
+static int tsens_read_temp(const struct tsens_sensor *s, int field, int *temp)
+{
+	struct tsens_priv *priv = s->priv;
+	int temp_val[MAX_READ_RETRY] = {0};
+	u32 status;
+	int ret;
+	u32 last_temp_mask = GENMASK(priv->fields[LAST_TEMP_0].msb,
+					priv->fields[LAST_TEMP_0].lsb);
+	u32 valid_bit = priv->rf[VALID_0] ? BIT(priv->fields[VALID_0].lsb) : 0;
+
+	for (int i = 0; i < MAX_READ_RETRY; i++) {
+		ret = regmap_read(priv->tm_map, priv->fields[field].reg, &status);
+		if (ret)
+			return ret;
+
+		/* VER_0 doesn't have a VALID bit */
+		if (!valid_bit) {
+			*temp = status & last_temp_mask;
+			return 0;
+		}
+
+		temp_val[i] = status & last_temp_mask;
+
+		if (status & valid_bit) {
+			*temp = temp_val[i];
+			return 0;
+		}
+	}
+
+	/*
+	 * As per the HW guidelines, if none of the attempts observe a
+	 * valid sample, a stable fallback value must be returned. If the
+	 * first and second samples match, the second value is returned;
+	 * otherwise, if the second and third samples match, the third
+	 * value is returned.
+	 */
+	if (temp_val[0] == temp_val[1])
+		*temp = temp_val[1];
+	else if (temp_val[1] == temp_val[2])
+		*temp = temp_val[2];
+	else
+		return -EAGAIN;
+
+	return 0;
+}
+
+/**
+ * tsens_hw_to_mC - Return sign-extended temperature in mCelsius.
+ * @s:     Pointer to sensor struct
+ * @temp: temperature in milliCelsius to be read from hardware
  *
  * This function handles temperature returned in ADC code or deciCelsius
  * depending on IP version.
@@ -326,20 +383,14 @@ static inline int code_to_degc(u32 adc_code, const struct tsens_sensor *s)
  * Return: Temperature in milliCelsius on success, a negative errno will
  * be returned in error cases
  */
-static int tsens_hw_to_mC(const struct tsens_sensor *s, int field)
+static int tsens_hw_to_mC(const struct tsens_sensor *s, int temp)
 {
 	struct tsens_priv *priv = s->priv;
 	u32 resolution;
-	u32 temp = 0;
-	int ret;
 
 	resolution = priv->fields[LAST_TEMP_0].msb -
 		priv->fields[LAST_TEMP_0].lsb;
 
-	ret = regmap_field_read(priv->rf[field], &temp);
-	if (ret)
-		return ret;
-
 	/* Convert temperature from ADC code to milliCelsius */
 	if (priv->feat->adc)
 		return code_to_degc(temp, s) * 1000;
@@ -514,8 +565,10 @@ static int tsens_read_irq_state(struct tsens_priv *priv, u32 hw_id,
 					&d->crit_irq_mask);
 		if (ret)
 			return ret;
-
-		d->crit_thresh = tsens_hw_to_mC(s, CRIT_THRESH_0 + hw_id);
+		ret = regmap_field_read(priv->rf[CRIT_THRESH_0 + hw_id], &d->crit_thresh);
+		if (ret)
+			return ret;
+		d->crit_thresh = tsens_hw_to_mC(s, d->crit_thresh);
 	} else {
 		/* No mask register on older TSENS */
 		d->up_irq_mask = 0;
@@ -525,8 +578,16 @@ static int tsens_read_irq_state(struct tsens_priv *priv, u32 hw_id,
 		d->crit_thresh = 0;
 	}
 
-	d->up_thresh  = tsens_hw_to_mC(s, UP_THRESH_0 + hw_id);
-	d->low_thresh = tsens_hw_to_mC(s, LOW_THRESH_0 + hw_id);
+	ret = regmap_field_read(priv->rf[UP_THRESH_0 + hw_id], &d->up_thresh);
+	if (ret)
+		return ret;
+
+	d->up_thresh = tsens_hw_to_mC(s, d->up_thresh);
+	ret = regmap_field_read(priv->rf[LOW_THRESH_0 + hw_id], &d->low_thresh);
+	if (ret)
+		return ret;
+
+	d->low_thresh = tsens_hw_to_mC(s, d->low_thresh);
 
 	dev_dbg(priv->dev, "[%u] %s%s: status(%u|%u|%u) | clr(%u|%u|%u) | mask(%u|%u|%u)\n",
 		hw_id, __func__,
@@ -750,33 +811,15 @@ static void tsens_disable_irq(struct tsens_priv *priv)
 
 int get_temp_tsens_valid(const struct tsens_sensor *s, int *temp)
 {
-	struct tsens_priv *priv = s->priv;
 	int hw_id = s->hw_id;
 	u32 temp_idx = LAST_TEMP_0 + hw_id;
-	u32 valid_idx = VALID_0 + hw_id;
-	u32 valid;
 	int ret;
 
-	/* VER_0 doesn't have VALID bit */
-	if (tsens_version(priv) == VER_0)
-		goto get_temp;
-
-	/* Valid bit is 0 for 6 AHB clock cycles.
-	 * At 19.2MHz, 1 AHB clock is ~60ns.
-	 * We should enter this loop very, very rarely.
-	 * Wait 1 us since it's the min of poll_timeout macro.
-	 * Old value was 400 ns.
-	 */
-	ret = regmap_field_read_poll_timeout(priv->rf[valid_idx], valid,
-					     valid, 1, 20 * USEC_PER_MSEC);
-	if (ret)
-		return ret;
-
-get_temp:
-	/* Valid bit is set, OK to read the temperature */
-	*temp = tsens_hw_to_mC(s, temp_idx);
+	ret = tsens_read_temp(s, temp_idx, temp);
+	if (!ret)
+		*temp = tsens_hw_to_mC(s, *temp);
 
-	return 0;
+	return ret;
 }
 
 int get_temp_common(const struct tsens_sensor *s, int *temp)
diff --git a/drivers/thermal/qcom/tsens.h b/drivers/thermal/qcom/tsens.h
index 2a7afa4c899b..ab57ad88c3f7 100644
--- a/drivers/thermal/qcom/tsens.h
+++ b/drivers/thermal/qcom/tsens.h
@@ -21,6 +21,7 @@
 #define THRESHOLD_MIN_ADC_CODE	0x0
 
 #define MAX_SENSORS 16
+#define MAX_READ_RETRY 3
 
 #include <linux/interrupt.h>
 #include <linux/thermal.h>
-- 
2.43.0


