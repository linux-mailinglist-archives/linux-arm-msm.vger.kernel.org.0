Return-Path: <linux-arm-msm+bounces-94392-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SL6QE6g3oWkbrQQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-94392-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Feb 2026 07:20:24 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id DB9881B32BB
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Feb 2026 07:20:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id CDFCB315EBC2
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Feb 2026 06:16:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2E4B93DA7D7;
	Fri, 27 Feb 2026 06:16:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Ob8G30SH";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="BYkc8qLK"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B76323603C2
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Feb 2026 06:16:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772172993; cv=none; b=qSkIwgv5R2sHX8Q1fWxBbTlZEsrwWWewB+C6O6zRBft+lWhaaX7fM2SOKedqqiRhbkEvO0sv43Jz9qnAEGZnpIzr6jpzF5FQOq21tcC09Hh3fPNQTX7ENI2xjJP+IrDPGEUbeNgixoEqO3Dihi1rfvNILOTH4nJoohRutZKez/0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772172993; c=relaxed/simple;
	bh=zYwjncLuxAcNRFxhVZP0hv9VGpjetfTguK5Hzpt5cIU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=IfVo++phFK9x4LgAAgfMbhw41PGZRySsLKovygyM6PDO6T4mMvplUIycE7fD9YIspkTHrzh0v06YN3zDNw9RoGRYCDIzAALDkHdXaUx9f8w4EBrkom7c0QcnpwBxr9G8XmYZqQo46nbDc/w4hEFnarGK29nI+1zD092IBeub0PY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Ob8G30SH; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BYkc8qLK; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61R2K8DS1600923
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Feb 2026 06:16:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=S+NcvlPxnrw
	tBt7YIuw1NzxBgtp69duQfhINk9XVHew=; b=Ob8G30SHwaGta5UAa3PgyvtuGes
	AMBaUpSHJsobr33mMyH7vORy089ZE84rUIGRTiKxWjCboaAEI8b1EPfBC4ti/swY
	1TluvGDqw3/ypAO2EnA9Hp/iWswp6js05rlc9KWk+OWnzlqr3LWFAHXiFWlIY87z
	9da2j7JcDg9n7dUFrJZnLyulDwRImGTdeN/hlNPDWovs92pngZ9hr2cV9+kqi51r
	oO+HTklBG2PdJofDnjEsVuyZP7vvxt1/NEDgIMx46RlhWKFL5SSIrI/ycRWaMxOe
	xzlFxSqwxC+i3t9ueYdnbfmLt2n4Z8nUFembWuBg9Q/j1o0kM6p1+6P/wqg==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cjt99tdgh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Feb 2026 06:16:29 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2aad5fec175so65298675ad.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 26 Feb 2026 22:16:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772172989; x=1772777789; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=S+NcvlPxnrwtBt7YIuw1NzxBgtp69duQfhINk9XVHew=;
        b=BYkc8qLKl4s3wXlNZVfxW4KB5gzsaIKbzKMwTn3g1CZyOIK8LTnJo7/vCbeIDeDtvF
         syc7F+TedU85VD/PRgXu5uJkp5mezoGZ0ftvx2VtAUaeZA3dWVo+8mBHo0cxDH4S5sdC
         dG5vUqxK9tjsmhEaU5d5F0UZ9YR80JaOxbaaWVkKXRk3Q+ke5dHLk1H86hDAKjHMojWa
         lrEVsNtFLbUr3pIryZx309nE/m6znUJO7PqAF40ETKINjbSFQnmsYO4MTpc32xXt+mzK
         ELQYUU4QAvPYIMp2OQHPcjZoNDdcvLQtevVMmbapB+aG6ElJw+qoIJaUX9rp4MZWElHZ
         vkmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772172989; x=1772777789;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=S+NcvlPxnrwtBt7YIuw1NzxBgtp69duQfhINk9XVHew=;
        b=REfZflwe/XjoptWpD5mxOjc3Cm9EzRTGHRutBmhh7Y01BXJL8rK1kA5slnANG7VJKb
         Nkd9G2UI89Xjb5IDYNmQTgnm3Nb57Vg7mwZd77sASP/wKvePdLxQfL+3fwDw1kwUAbf6
         qNWwDqbSh0yFWF/Wf5CjZ6CQ17ziP8e2Ovz2IK9A8AOaNIkQiL5zSJSNwvIR+zbsr6JO
         IznyweUE6OUVVqv3RQAiOW+2jTP+euwTBGXhdGpviZr1F6fFpkAlumPy2aSEE/kdsFdA
         K6hnrltFlZfgtwacvxh8hTJDH0oWSirvaj0xjKecvtHRCjfMq487olUSjk0SoKy6UpTO
         ypBQ==
X-Forwarded-Encrypted: i=1; AJvYcCXf3YSrShCFQSdm8f39dpVEjJEYCgfL76V21q7BQcpCUxP6WRJy81n4O5EV37O+Q+Bn9Tl5bzfXlz433N98@vger.kernel.org
X-Gm-Message-State: AOJu0Yy/pg5hTqt0Clthm2INHoKrjtvoJ6Nnz7S8mWNZ1391fak+PIiZ
	eWGo4edePD2ohKkrb15NgnrBKK1syfaWmn8zqowJQQ14ODIIVVjeITDVj4mAhtuWJf43Yw9UezG
	Jcm375Xay0WlA6nFAph9prJBR808pK+z5xwDF0w4vzDyX2wQaUMymMh5w5Fp5RnFyveF3
X-Gm-Gg: ATEYQzzKKD7OylozLvh8cQDMB3TgETU5ali31eY+kFLzkpODTcX9dX1AkCKY2RMr6Vt
	PE+qBs3xzPWXYwtUtwq53aWqS8ySaTqvVmjChQ7J7+D5gDyV7SIMXjNMPnjRXPODO6qPFRD+dLb
	QpdAWWgJgIZOU6C7CNa6rqOZvl0j3/gqrukeP9yPfy4AK4IHssB/V6ufO2FXqzxyAeiWcXDu/Ke
	qNyMck35pz2Bk7E1k1wKSD7CAKXN7yLFv4z7puVUAkXAxeuNvw+AzM7wCiHRHQzjZlYePm+RdHJ
	nj4zKiDhnRbbMj466uFp9Z+nlG0bcBE2IqFo8HGmpxKv+dOdi8pPpHn9tiqoxW3xa7cT/Mf6N43
	Fk79gfGqG9IbQr4o9H5AZhBTp+lti7RE7o0Zpy+ofiKpg3hh5I78RgU0=
X-Received: by 2002:a17:902:f691:b0:2aa:f2f3:bcab with SMTP id d9443c01a7336-2ae2e4d5ef3mr19058835ad.47.1772172989304;
        Thu, 26 Feb 2026 22:16:29 -0800 (PST)
X-Received: by 2002:a17:902:f691:b0:2aa:f2f3:bcab with SMTP id d9443c01a7336-2ae2e4d5ef3mr19058385ad.47.1772172988691;
        Thu, 26 Feb 2026 22:16:28 -0800 (PST)
Received: from hu-ptalari-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2adfb6a043dsm64813025ad.54.2026.02.26.22.16.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Feb 2026 22:16:28 -0800 (PST)
From: Praveen Talari <praveen.talari@oss.qualcomm.com>
To: Andi Shyti <andi.shyti@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Mukesh Kumar Savaliya <mukesh.savaliya@oss.qualcomm.com>,
        Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Praveen Talari <praveen.talari@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-i2c@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        bjorn.andersson@oss.qualcomm.com, dmitry.baryshkov@oss.qualcomm.com,
        konrad.dybcio@oss.qualcomm.com
Cc: prasad.sodagudi@oss.qualcomm.com, aniket.randive@oss.qualcomm.com,
        chandana.chiluveru@oss.qualcomm.com, jyothi.seerapu@oss.qualcomm.com,
        chiluka.harish@oss.qualcomm.com
Subject: [PATCH v6 05/13] soc: qcom: geni-se: Add resources activation/deactivation helpers
Date: Fri, 27 Feb 2026 11:45:36 +0530
Message-Id: <20260227061544.1785978-6-praveen.talari@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260227061544.1785978-1-praveen.talari@oss.qualcomm.com>
References: <20260227061544.1785978-1-praveen.talari@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=IZWKmGqa c=1 sm=1 tr=0 ts=69a136bd cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8
 a=KBRiQYpxJDLEvAb9SdYA:9 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-GUID: fEkKutG2RoJwOLoqzmvvfc6uLMUP2oBP
X-Proofpoint-ORIG-GUID: fEkKutG2RoJwOLoqzmvvfc6uLMUP2oBP
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjI3MDA1MCBTYWx0ZWRfX5JVhJwazJ0Hn
 j1/qQjgHoQ7anXYrWKWYiRiZwE5sXrha0LxkB6fkZdJz/XJvrwib4F6iBkEoZefRJdZtEtofgJm
 F5lAs15nvqRFgP8FFpzXwZQo7mGZdhK2qljpELb061wKopCwFmiOOhxrK6Z0rgfREqye+V7wb6d
 H7BJ7WfoCq3L50sF89z0IaH1/BD/cNQtXth/4vDY99fuNJ2Q4SJwPwj8pzbAWHpkkAa3JFm+CUQ
 NdSgNzA1E582mRB5D/8b5zbo9SfZZyz/WpBMhV9HbiQIv0z9ToFcextA9eZTwr5RFqkHHOBLpnp
 eU7VL7suo4nMvMyJcRxFGjRNg90eIOFehIUMQH2PXjU8YUjp6ynI2hY/lGR2YiTA2DyRcomVpE6
 PoRIe6JahUk6k0kFT5taJDte5nQ250GhyMA9kYgwgRO/Z4t5gzUvEiSI/x0qafJT6b0uLZhZykG
 VI08zRhfzfK3AzpHX5Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-27_01,2026-02-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 clxscore=1015 adultscore=0 lowpriorityscore=0
 priorityscore=1501 suspectscore=0 malwarescore=0 spamscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2602270050
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-94392-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[21];
	FROM_NEQ_ENVFROM(0.00)[praveen.talari@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	NEURAL_HAM(-0.00)[-1.000];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: DB9881B32BB
X-Rspamd-Action: no action

The GENI SE protocol drivers (I2C, SPI, UART) implement similar resource
activation/deactivation sequences independently, leading to code
duplication.

Introduce geni_se_resources_activate()/geni_se_resources_deactivate() to
power on/off resources.The activate function enables ICC, clocks, and TLMM
whereas the deactivate function disables resources in reverse order
including OPP rate reset, clocks, ICC and TLMM.

Signed-off-by: Praveen Talari <praveen.talari@oss.qualcomm.com>
---
v5 -> v6
Konrad
- updated kerneldoc for geni_se_resources_activate().

v4 -> v5
Konrad
- updated return value as 0 for geni_se_resources_activate().

v3 -> v4
Konrad
- Removed core clk.

v2 -> v3
- Added export symbol for new APIs.

v1 -> v2
Bjorn
- Updated commit message based code changes.
- Removed geni_se_resource_state() API.
- Utilized code snippet from geni_se_resources_off()
---
 drivers/soc/qcom/qcom-geni-se.c  | 70 ++++++++++++++++++++++++++++++++
 include/linux/soc/qcom/geni-se.h |  4 ++
 2 files changed, 74 insertions(+)

diff --git a/drivers/soc/qcom/qcom-geni-se.c b/drivers/soc/qcom/qcom-geni-se.c
index 2e41595ff912..6e58568701b0 100644
--- a/drivers/soc/qcom/qcom-geni-se.c
+++ b/drivers/soc/qcom/qcom-geni-se.c
@@ -1025,6 +1025,76 @@ int geni_icc_disable(struct geni_se *se)
 }
 EXPORT_SYMBOL_GPL(geni_icc_disable);
 
+/**
+ * geni_se_resources_deactivate() - Deactivate GENI SE device resources
+ * @se: Pointer to the geni_se structure
+ *
+ * Deactivates device resources for power saving: OPP rate to 0, pin control
+ * to sleep state, turns off clocks, and disables interconnect. Skips ACPI devices.
+ *
+ * Return: 0 on success, negative error code on failure
+ */
+int geni_se_resources_deactivate(struct geni_se *se)
+{
+	int ret;
+
+	if (has_acpi_companion(se->dev))
+		return 0;
+
+	if (se->has_opp)
+		dev_pm_opp_set_rate(se->dev, 0);
+
+	ret = pinctrl_pm_select_sleep_state(se->dev);
+	if (ret)
+		return ret;
+
+	geni_se_clks_off(se);
+
+	return geni_icc_disable(se);
+}
+EXPORT_SYMBOL_GPL(geni_se_resources_deactivate);
+
+/**
+ * geni_se_resources_activate() - Activate GENI SE device resources
+ * @se: Pointer to the geni_se structure
+ *
+ * Activates device resources for operation: enables interconnect, prepares clocks,
+ * and sets pin control to default state. Includes error cleanup. Skips ACPI devices.
+ *
+ * Unlike geni_se_resources_deactivate(), this function doesn't alter the
+ * connected genpds' performance states, which must be additionally handled.
+ *
+ * Return: 0 on success, negative error code on failure
+ */
+int geni_se_resources_activate(struct geni_se *se)
+{
+	int ret;
+
+	if (has_acpi_companion(se->dev))
+		return 0;
+
+	ret = geni_icc_enable(se);
+	if (ret)
+		return ret;
+
+	ret = geni_se_clks_on(se);
+	if (ret)
+		goto out_icc_disable;
+
+	ret = pinctrl_pm_select_default_state(se->dev);
+	if (ret) {
+		geni_se_clks_off(se);
+		goto out_icc_disable;
+	}
+
+	return 0;
+
+out_icc_disable:
+	geni_icc_disable(se);
+	return ret;
+}
+EXPORT_SYMBOL_GPL(geni_se_resources_activate);
+
 /**
  * geni_se_resources_init() - Initialize resources for a GENI SE device.
  * @se: Pointer to the geni_se structure representing the GENI SE device.
diff --git a/include/linux/soc/qcom/geni-se.h b/include/linux/soc/qcom/geni-se.h
index c182dd0f0bde..36a68149345c 100644
--- a/include/linux/soc/qcom/geni-se.h
+++ b/include/linux/soc/qcom/geni-se.h
@@ -541,6 +541,10 @@ int geni_icc_disable(struct geni_se *se);
 
 int geni_se_resources_init(struct geni_se *se);
 
+int geni_se_resources_activate(struct geni_se *se);
+
+int geni_se_resources_deactivate(struct geni_se *se);
+
 int geni_load_se_firmware(struct geni_se *se, enum geni_se_protocol_type protocol);
 #endif
 #endif
-- 
2.34.1


