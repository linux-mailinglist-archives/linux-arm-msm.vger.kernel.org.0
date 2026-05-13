Return-Path: <linux-arm-msm+bounces-107227-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AA3hKsAPBGoMDAIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-107227-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 May 2026 07:44:32 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 228BD52DADC
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 May 2026 07:44:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id B5741306F468
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 May 2026 05:44:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2FC223A6F03;
	Wed, 13 May 2026 05:44:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RIY9+Vco";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bOM99PC0"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 742973A4F46
	for <linux-arm-msm@vger.kernel.org>; Wed, 13 May 2026 05:44:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778651064; cv=none; b=E8lEImrgHRul3Pyn2djJxRDb0JkAds0ol6sSTCLeF3EvONi5qD+81KzymlMbEFTZBm5VDDFQ8+iaE0TyS+KmnVuW4kMxfS4gh5xUk4q9kbMFDRukd1opPobcFrIVXBEPpIVfazCTyZ/eJIJWYFfh7KFSW/X8+koFHaWnJypkjng=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778651064; c=relaxed/simple;
	bh=QYR1p7pypLumCe0co05V3H6BTY/NCkEsxKsFLeqVmwY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=s1QxkKdbXNtItXoef5WcTAqxV93DZQoSGOXTto5pI8Ha9xnKv/F9N6E+r/sVaex9xtVQTVub/h8RhxmbazZkAL14B2XyNq8u+6IkkuTSFY9FN/SPmtpPrFKh/jRbmyt3vEC5DC8+hW6XyllxEXDi4bH3HfSbqqS0d6gJxK8o5xk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RIY9+Vco; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bOM99PC0; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64D4pTuF2344697
	for <linux-arm-msm@vger.kernel.org>; Wed, 13 May 2026 05:44:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=wuDaXbIHo9hWpRR2+1R1zu3ZeYVSiQmB2Zx
	wlTm5TYI=; b=RIY9+VcoABrzcLyannDKa/D/Q9EOtMMU3svFKy39a9kSALMUKUl
	a7Juf2rC4EQahRKKm0xM2JGLL+qdUOgokjuhQS5wqe4onJVIityVoG+hLBti//vx
	lyOeXA4rsniQsW4iuaWA9fywpi9smJ52iUs32Z/MqeYAWnzLJDzifrgjwB7Vm0WK
	oPIFnWmrnXBvKN3iMIuAH8fd6lX+JVMN3Im6xXjCB608PtZEYHcs1pZ54/KBZGPF
	w6jpkm51obGhXH7jo8/PWo++tBlmp1y5gYf29ebdNyuDTndqbdjrIwocY7T4+EjK
	JOcP/1Jp8odXRf2FI9eQ1Y7/CFiLBN0SY1w==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e43tn3efg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 13 May 2026 05:44:21 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2ba86e35aa1so99704215ad.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 12 May 2026 22:44:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778651061; x=1779255861; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=wuDaXbIHo9hWpRR2+1R1zu3ZeYVSiQmB2ZxwlTm5TYI=;
        b=bOM99PC0ymklcMpe3HZh8pSD90Xy2djN0BaNMD78J6MtPx4NNfgHXmreyarxEUZxkB
         4Yz7/xkWupnEBFESrhBueDD+m3iHW9sYVn3xtJFpVCcfcXcfZ5ap2jKhMI3eSBLHLFRa
         j7qImOoKdCH8gfOYSsfet3F7NRTfmFZwdkLD+B7h7xyWNWWKoQzZrrCmDzPeL7sOE5jZ
         R6n1mBvKA45Vaw6BDlwNHE2DVXsXXeXB7o4jr9cl2vSYCLB8owqo9nlZy7MX823EGz37
         S+z/vs6KIOs9hyKeI0n1KnCi/0j180dpgNo0e67ljnC5aBtQFc4zS/qL8H81DGvT42CE
         BiZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778651061; x=1779255861;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wuDaXbIHo9hWpRR2+1R1zu3ZeYVSiQmB2ZxwlTm5TYI=;
        b=chi96s5Sl3rgN/cPraVcbvhVbklFy5WeP5pxs6W3VoCGm2oljUlcY7umwIYzzL5+5i
         zW7SL4LKZWw9vazuDqqBpVGCoJy1hmwg9cV1472tulxNM2+izkf2dkWtbS/+MhaB0o/6
         n7xUY8f4U7TGSu8ZQpjDf2a/1NoM8vyKHexv5EwO1hSTa/YgPVs/9bnY3eumkHHimGPW
         C+PvSOpKokYkJTxMuZp/OkR49eIhkRzKzvPAthHpEBMTFbrkYwV5K/Fqebzukah7Salq
         7NMG/2g2/jy9zdEVqHV7w1DSkdYt0IhMHDCJ0W6dYUydOY1IiYBVZYKfbY15m9ffcuHC
         nBjg==
X-Forwarded-Encrypted: i=1; AFNElJ9C6xg2dPb6XRHfEgPy/PR3tLVUymmh0DMRbr22h5Ckp54MKi1HnJg5L0orMIzp84J+7XvtNiZPKEAwgaUV@vger.kernel.org
X-Gm-Message-State: AOJu0Yycjse18Z71d2G6CohkSqsJr4Lc63KO2aQ1MQYSSZZeKGt9jM1W
	VWVFknTH7SfSb7uJQv665ZCdS7lOYtpNgAPRBapZHB/thxFCWjbYoRFk7z4oqAulCYYEk5GazXo
	dIPmsV2Zy4mzrjQxsEwrmTboDqWRJdinNsMX96mnMqrTEh8Lj7dOMSTPou8OOKm84PviV
X-Gm-Gg: Acq92OEndHtqT5txXLT35dhsKEcdHzN+kbPAvqeV1A7Kg+4P/bw0CBlfLDa1pPkfPoy
	BAkNFW6iNL7KodAFVnZ7vWBm9va0WpcUHtviyFjnATrZjViR15zp1c3X+vW+o9Enb0kIqAN0LGf
	qmDoIfNX4nL6mXCOjxSwrPi4sP4KrFYDZP66NKw1wYcw8syNgkNK4VhfgsZvZBjvoyUNPt8oJaE
	z9yN5N7bvws8k2NcGCyVEmfmskqpHbNJW3U+c/ub3KH48MlqSgTgnkPZJkmDwSBgK53ByrWsD4e
	8zfk/McD0Acw/CV8ymxfiYcUtN5mkTSBIB3cQaOSs1EkHGqLlqikcn+0+Y8o7XaPjQg8tBZEwGO
	5NxZm3pIy4HFOuXzfalSbOpQOci3pK99OxNPWm7XOdrwWSJ0FuazCkEY=
X-Received: by 2002:a17:902:7204:b0:2bc:f2ae:e122 with SMTP id d9443c01a7336-2bd271436f6mr16634675ad.2.1778651060724;
        Tue, 12 May 2026 22:44:20 -0700 (PDT)
X-Received: by 2002:a17:902:7204:b0:2bc:f2ae:e122 with SMTP id d9443c01a7336-2bd271436f6mr16634315ad.2.1778651060112;
        Tue, 12 May 2026 22:44:20 -0700 (PDT)
Received: from hu-priyjain-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2baf1ebea72sm157235605ad.77.2026.05.12.22.44.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 May 2026 22:44:19 -0700 (PDT)
From: Priyansh Jain <priyansh.jain@oss.qualcomm.com>
To: Amit Kucheria <amitk@kernel.org>,
        Thara Gopinath <thara.gopinath@gmail.com>,
        "Rafael J . Wysocki" <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@kernel.org>,
        Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>
Cc: linux-pm@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, manaf.pallikunhi@oss.qualcomm.com,
        Priyansh Jain <priyansh.jain@oss.qualcomm.com>
Subject: [PATCH v4] thermal: qcom: tsens: atomic temperature read with hardware-guided retries
Date: Wed, 13 May 2026 11:14:12 +0530
Message-ID: <20260513054412.911048-1-priyansh.jain@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: lsVV_F4OyePwiY18tcBbVdQqQwvq2pv9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTEzMDA1NSBTYWx0ZWRfX3GadrsfOh+Xh
 q98mQ6uvRiiUul/3JOQz9NwxqynWloTh4m3jKWlFEwHAratGrn6Zj0U/FEyiqESIUQqEQ2M3C6K
 4hLCRNmW3+HN/KHWCUG+vdRvonekMifNmevFJt9JveOPmb4OAlpkx27KfvwEzrme1CPC+FyQnhc
 P+2NcqrJXq2u8q4wawTD6A0Rawr8Zp2TWZd3DRjO0kHke9nBT9bgH5ucsN4hKlThFhIXcJayl8i
 3tTZGrVXIRKn0bTUoEWqK2FWKRCCmwqnwj5ZcyM9j5ns16JDga1I+BRw/2l/G+FIvIn6b0UYqvD
 k8l7weentqiUU1MsD7cVFBzK0wU5SgC9Snd98d9xx2Cl8Y418eBjMHYJyZ0SxsjJ0/rBQQ3JR72
 bHW4bhO1e7Zyyl+9Wis665V/2/IZfgJsC6Z8N6Z+JGzcIKHaN72m24AlAgjEsFQskHhtSrQu9Zs
 92KK9cNRfUMNmS1zXew==
X-Proofpoint-GUID: lsVV_F4OyePwiY18tcBbVdQqQwvq2pv9
X-Authority-Analysis: v=2.4 cv=Ebn4hvmC c=1 sm=1 tr=0 ts=6a040fb5 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=58n1TqAxyoLoCYT524AA:9 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-11_05,2026-05-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 malwarescore=0 lowpriorityscore=0 priorityscore=1501 bulkscore=0
 adultscore=0 clxscore=1015 impostorscore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605050000 definitions=main-2605130055
X-Rspamd-Queue-Id: 228BD52DADC
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com,intel.com,arm.com];
	TAGGED_FROM(0.00)[bounces-107227-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[priyansh.jain@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	PRECEDENCE_BULK(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	NEURAL_HAM(-0.00)[-1.000];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
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
value is returned; otherwise, if the second and third samples match, the
third value is returned; if neither pair matches, -EAGAIN is returned.

Update the TSENS sensor read logic to implement atomic sampling along
with the recommended retry-and-compare fallback behavior. This removes
the race window and ensures deterministic temperature values in
accordance with hardware requirements.

Signed-off-by: Priyansh Jain <priyansh.jain@oss.qualcomm.com>

---
Changes in v2:
- Reverted merging of the valid-bit and LAST_TEMP register field logic
  to preserve the regmap differences between TSENS versions
- Defined valid-bit support and last temperature resolution for all
  TSENS v1 and v2 feature structures
- Defined last temperature resolution for Tsens v0 feature structure
- Dropped tsens version checks in favor of valid-bit capability
- Computed masks from resolution to keep a single source of truth
- Minor code cleanups based on review feedback

Changes in v3:
- Remove valid_bit, last_temp_mask, and last_temp_resolution fields from
  struct tsens_features in tsens.h
- Compute last_temp_mask, resolution, and valid_bit on-the-fly using
  regmap field definitions
- Remove field initializations from all platform data files
  (tsens-v0_1.c, tsens-v1.c, tsens-v2.c)
- Remove the initialization line in init_common() that was computing
  last_temp_mask

Changes in v4:
- Fix indentation issue based on review feedback

---
 drivers/thermal/qcom/tsens.c | 110 ++++++++++++++++++++++++-----------
 drivers/thermal/qcom/tsens.h |   1 +
 2 files changed, 76 insertions(+), 35 deletions(-)

diff --git a/drivers/thermal/qcom/tsens.c b/drivers/thermal/qcom/tsens.c
index a2422ebee816..b1b938312723 100644
--- a/drivers/thermal/qcom/tsens.c
+++ b/drivers/thermal/qcom/tsens.c
@@ -316,9 +316,65 @@ static inline int code_to_degc(u32 adc_code, const struct tsens_sensor *s)
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
+	u32 status = 0;
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
+		/* VER_0 doesn't have VALID bit */
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
+	/* As per the HW guidelines, if none of the attempts observe a
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
@@ -326,20 +382,14 @@ static inline int code_to_degc(u32 adc_code, const struct tsens_sensor *s)
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
@@ -514,8 +564,10 @@ static int tsens_read_irq_state(struct tsens_priv *priv, u32 hw_id,
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
@@ -524,9 +576,14 @@ static int tsens_read_irq_state(struct tsens_priv *priv, u32 hw_id,
 		d->crit_irq_mask = 0;
 		d->crit_thresh = 0;
 	}
-
-	d->up_thresh  = tsens_hw_to_mC(s, UP_THRESH_0 + hw_id);
-	d->low_thresh = tsens_hw_to_mC(s, LOW_THRESH_0 + hw_id);
+	ret = regmap_field_read(priv->rf[UP_THRESH_0 + hw_id], &d->up_thresh);
+	if (ret)
+		return ret;
+	d->up_thresh = tsens_hw_to_mC(s, d->up_thresh);
+	ret = regmap_field_read(priv->rf[LOW_THRESH_0 + hw_id], &d->low_thresh);
+	if (ret)
+		return ret;
+	d->low_thresh = tsens_hw_to_mC(s, d->low_thresh);
 
 	dev_dbg(priv->dev, "[%u] %s%s: status(%u|%u|%u) | clr(%u|%u|%u) | mask(%u|%u|%u)\n",
 		hw_id, __func__,
@@ -750,33 +807,16 @@ static void tsens_disable_irq(struct tsens_priv *priv)
 
 int get_temp_tsens_valid(const struct tsens_sensor *s, int *temp)
 {
-	struct tsens_priv *priv = s->priv;
+	int ret;
 	int hw_id = s->hw_id;
 	u32 temp_idx = LAST_TEMP_0 + hw_id;
-	u32 valid_idx = VALID_0 + hw_id;
-	u32 valid;
-	int ret;
-
-	/* VER_0 doesn't have VALID bit */
-	if (tsens_version(priv) == VER_0)
-		goto get_temp;
 
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
+	ret = tsens_read_temp(s, temp_idx, temp);
 
-get_temp:
-	/* Valid bit is set, OK to read the temperature */
-	*temp = tsens_hw_to_mC(s, temp_idx);
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


