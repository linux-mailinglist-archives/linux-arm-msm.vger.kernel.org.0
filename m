Return-Path: <linux-arm-msm+bounces-82933-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F602C7C765
	for <lists+linux-arm-msm@lfdr.de>; Sat, 22 Nov 2025 06:02:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 31A404E1E0D
	for <lists+linux-arm-msm@lfdr.de>; Sat, 22 Nov 2025 05:01:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 744F32C158F;
	Sat, 22 Nov 2025 05:01:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="eDuI3xSo";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="cyO+XAWt"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4CFB2BEC57
	for <linux-arm-msm@vger.kernel.org>; Sat, 22 Nov 2025 05:01:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763787676; cv=none; b=Sq32b3zOsiiJvQ9EBlsZUWGDVjqiciVcyZbczkQxR3VgrF/YanGAOGg+LaCNBn72BvsTrMcqPOqPWCeA/gbW2YgEifHvcmBAXOgx6zNkKvxZi8ctV8fNdW3agyt5LRQIwUwCEV5xTXb4jft7cqH9m2P+YbsEhPyz+UiwvtOrwns=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763787676; c=relaxed/simple;
	bh=sK6XaW/k9ZaxCDlbgWVWFCP1NGxYDP2lPv4LzeW4fDw=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Ew/q5tTSIlHAXJLZuDyAvz/td869M8/RPYuh1DHmu8Fsjvv7iJNUFoMflhpKBJ9AcAxotMgjYs4i1X+1Blpu0kS+odq5Qsw1rghF/KmdHatUf4dsEY7eVj4bNnnIOFEZg2+X/n7bN84cDIb5deEu5Kq5elPBVY31Dpinq92QVQU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=eDuI3xSo; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=cyO+XAWt; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AM4Wuln1469407
	for <linux-arm-msm@vger.kernel.org>; Sat, 22 Nov 2025 05:01:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=zTkqjG69O6X
	OIlKcqlqk2XhnP8nX431WPafAy0gUQM4=; b=eDuI3xSo69u574bnJ8T13iUAIQF
	wHEK3sFXBZM45YEbZBOjLfm7nAb+D4TXHWWC4Qg0wudcspY6J1Chg5kN2t5KddVI
	YCLlvPKSww1rkzCo4MchqaQH3KmdMBxXEjq6+L5U8iLjXKcTlnzfzf40AO+CM4Er
	zSElcBdDcU6oSAIt58AZEJJAJ75lhU1dsvJ8y/m6spkWoHM2+YjCQm6LHhp4vPbl
	c+cn18bGWmtZXCWUoOpBaUulvrYWZg0n3nQxBifOaouOs2V+FlybMY3n4V47DJ2+
	fjU+8+NKRGN1KCsd/mc+36/sIL5Trh5kiiBziynGb0I+dC4xOLSNOsjTAcg==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ak67x01gg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 22 Nov 2025 05:01:14 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2980ef53fc5so86218355ad.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 21 Nov 2025 21:01:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1763787673; x=1764392473; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zTkqjG69O6XOIlKcqlqk2XhnP8nX431WPafAy0gUQM4=;
        b=cyO+XAWtH/KV+sIVqtrziaazzVhp8AWN4YG0O/EtFpff/EkdvjzFNfzpO08WPaOwyI
         f7UBVy+NQ6Hbp2JS0r6Dnr1Kq3JMTI62sFK8V3e42VHI1ucGUPXBT8hd5SkDSpI8pWVj
         tNCg7KXYb1KtybFZz453EWXUdw0IYB5LGt/ByI/aZd3EkPOc6HexSJibh2gmTPPu1ZXo
         6PHzwQJ55QYbFJQX+QN+1kXJgAe2hVAWoh2DD8ZACvMIGLPZBAiwOq2X5Q2JAq6lrmnS
         RTTEGO2JgytPIVgzb4NG3zmgE+lO5oooyEg6CP14taEaF6/DtsI0CPoiGlw77XBFj/0g
         RG7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763787673; x=1764392473;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=zTkqjG69O6XOIlKcqlqk2XhnP8nX431WPafAy0gUQM4=;
        b=fnCWLkhfwmVrJaBUP53DFjFfg2zm+4um7fbPa0+p0gmm2C5Bm4kArDSJVkEdJ1M1U5
         nT5N7SEJbA1seryvQ5/+AtLetWYrl0JE8DqF3xt108YnDDcWGLnPSHkMpOy+JxFen3V5
         9K7OaSu3EHnUpOvTurVVo0cWzXogYzScY+VdMGgyNr5+taCcStIS78XY/xw8nU/4gOc7
         ql6yXkQXoRU4cD7VNa6jFklF5KjIkyIeY+XPKpytV0G0NqEzQnBgwrPZv7hKIvJMH9pN
         RgNdvc5h3TjpPTPzyJ3NgaI89rqVnFOJuQluAMi/4DvvfhBvAtLIms0VquHNFmtGEdnP
         VO7A==
X-Forwarded-Encrypted: i=1; AJvYcCX82bPKpp0n9fDjA0F74aQw2iqz3lzmONal0SFO1EWif8sjvF8Gm2Q5mW6b/gA91yS+UbL5F7R+Ba2mpTAO@vger.kernel.org
X-Gm-Message-State: AOJu0YycRBeOVAaoEYH/ROeqt43MLBcDBknL7N3k66Q2QaIUA+SL4BnP
	YwHeAwDpMY4HkRUUMfRksCtZNznedtQhmO5Du4F60akSHBIoFpBcGbciRMopd5gZuRM4s5HHQtG
	KYeQvuEDwgdTyOfgAkhWV5qePJGHMRJU6ux1yZhP8fxZc9y6YQt/0+6DBfx2sK51ahmoc
X-Gm-Gg: ASbGnct4IweguhesJ/XZr1rjYTjOyXr7PwQab1jJP6mmsNivBH5VsvmnXbr4KXJE1SY
	wnIDu3lualDSE2MStphC545Pr8viF6oE1hLxPnHG0rAI3YU0E/2XclHh+gSWFX4oL/QJe9mht74
	g6kiqaN/pmnH3d99dC5LCs5mb1MOfSR4bmzywZD6ItRy3FhkGlFsd6V9/mqGak39E+gk0Gk2Zwp
	6OLyb+DylMIxZsSHIMcGYQbdztONBEY3pW85LvxibHoZi2HRCofscYKXMCg4oM85JqPQREzPclb
	F/DWGTTJ6m+qSgQTBlknhQhy0c72k1SHx1nyNEufok+3pWgc0gVQ8KSWucn5dW+My+hZeUzaEOz
	1Xb4ibN6Je6KR4Qa1P/F55ey0d0tIjEn6oVH5kyxIPUo=
X-Received: by 2002:a17:902:f706:b0:297:c889:ba37 with SMTP id d9443c01a7336-29b6c6a4a1fmr53069835ad.41.1763787673441;
        Fri, 21 Nov 2025 21:01:13 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFZ0RoRjWzpRX7f/7wrrm6o9a/zKalm16NuLlRAP24ZnpVfbAe1bUNnw6cUjpQSbL2g3JKMGg==
X-Received: by 2002:a17:902:f706:b0:297:c889:ba37 with SMTP id d9443c01a7336-29b6c6a4a1fmr53069485ad.41.1763787672866;
        Fri, 21 Nov 2025 21:01:12 -0800 (PST)
Received: from hu-ptalari-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29b5b138c08sm70688725ad.25.2025.11.21.21.01.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Nov 2025 21:01:12 -0800 (PST)
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
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: psodagud@quicinc.com, djaggi@quicinc.com, quic_msavaliy@quicinc.com,
        quic_vtanuku@quicinc.com, quic_arandive@quicinc.com,
        quic_shazhuss@quicinc.com
Subject: [PATCH v1 06/12] soc: qcom: geni-se: Introduce helper APIs for performance control
Date: Sat, 22 Nov 2025 10:30:12 +0530
Message-Id: <20251122050018.283669-7-praveen.talari@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251122050018.283669-1-praveen.talari@oss.qualcomm.com>
References: <20251122050018.283669-1-praveen.talari@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: UrZfRiyNC6Evb2XmYw6PGQUwZ6HV8_eB
X-Authority-Analysis: v=2.4 cv=AcC83nXG c=1 sm=1 tr=0 ts=6921439a cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=NwCh5GMA9Nt760FYQHkA:9 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-ORIG-GUID: UrZfRiyNC6Evb2XmYw6PGQUwZ6HV8_eB
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTIyMDAzNyBTYWx0ZWRfX0dhXKxMg2rAQ
 9kTcNcifn8+u9i9qp7E9l3zom+SYSyFgZznIdBz8Uuyp+sMjta4J5nTxinDkNtfcBt219wnzUe6
 RtmoLjbNnuEX2g0+aCvFuyTKGX3MW5c/gytoR98BCoZ6Lxtr6HFRIyuPRx9DUDT43ETi8Yk7bYl
 i9M2VpYVy1Do+EjvCeWT5xxPprsDZ+nI1sN/3u9iNdcGulSQbeCPQURVphCGJROOTFdRq7cYZqP
 LTWIe1ErrHS8N0syvnycd8Wdw1FvC140G2yMFRUwaMBVApXAGe58S+NZ4e19C6tsN6qspio2cPR
 goMkqbBIJuZgW7+TN2yHGJc+stg+k+h6MXp2vLkQHPUPcu3T+rE9y0L8GBpT8UTOzdoywopuXLr
 TvASfXQyk8iwdcCpWsZdZYzR5qzLPA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-22_01,2025-11-21_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 spamscore=0 phishscore=0 priorityscore=1501 impostorscore=0
 malwarescore=0 adultscore=0 lowpriorityscore=0 suspectscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511220037

The GENI Serial Engine (SE) drivers (I2C, SPI, and SERIAL) currently
manage performance levels and operating points directly. This resulting
in code duplication across drivers. such as configuring a specific level
or find and apply an OPP based on a clock frequency.

Introduce two new helper APIs, geni_se_set_perf_level() and
geni_se_set_perf_opp(), addresses this issue by providing a streamlined
method for the GENI Serial Engine (SE) drivers to find and set the OPP
based on the desired performance level, thereby eliminating redundancy.

Signed-off-by: Praveen Talari <praveen.talari@oss.qualcomm.com>
---
 drivers/soc/qcom/qcom-geni-se.c  | 50 ++++++++++++++++++++++++++++++++
 include/linux/soc/qcom/geni-se.h |  4 +++
 2 files changed, 54 insertions(+)

diff --git a/drivers/soc/qcom/qcom-geni-se.c b/drivers/soc/qcom/qcom-geni-se.c
index 30b58f2f2e5d..292afa18b86c 100644
--- a/drivers/soc/qcom/qcom-geni-se.c
+++ b/drivers/soc/qcom/qcom-geni-se.c
@@ -282,6 +282,12 @@ struct se_fw_hdr {
 #define geni_setbits32(_addr, _v) writel(readl(_addr) |  (_v), _addr)
 #define geni_clrbits32(_addr, _v) writel(readl(_addr) & ~(_v), _addr)
 
+enum domain_idx {
+	DOMAIN_IDX_POWER,
+	DOMAIN_IDX_PERF,
+	DOMAIN_IDX_MAX
+};
+
 /**
  * geni_se_get_qup_hw_version() - Read the QUP wrapper Hardware version
  * @se:	Pointer to the corresponding serial engine.
@@ -1075,6 +1081,50 @@ int geni_se_resources_state(struct geni_se *se, bool power_on)
 }
 EXPORT_SYMBOL_GPL(geni_se_resources_state);
 
+/**
+ * geni_se_set_perf_level() - Set performance level for GENI SE.
+ * @se: Pointer to the struct geni_se instance.
+ * @level: The desired performance level.
+ *
+ * Sets the performance level by directly calling dev_pm_opp_set_level
+ * on the performance device associated with the SE.
+ *
+ * Return: 0 on success, or a negative error code on failure.
+ */
+int geni_se_set_perf_level(struct geni_se *se, unsigned long level)
+{
+	return dev_pm_opp_set_level(se->pd_list->pd_devs[DOMAIN_IDX_PERF], level);
+}
+EXPORT_SYMBOL_GPL(geni_se_set_perf_level);
+
+/**
+ * geni_se_set_perf_opp() - Set performance OPP for GENI SE by frequency.
+ * @se: Pointer to the struct geni_se instance.
+ * @clk_freq: The requested clock frequency.
+ *
+ * Finds the nearest operating performance point (OPP) for the given
+ * clock frequency and applies it to the SE's performance device.
+ *
+ * Return: 0 on success, or a negative error code on failure.
+ */
+int geni_se_set_perf_opp(struct geni_se *se, unsigned long clk_freq)
+{
+	struct device *perf_dev = se->pd_list->pd_devs[DOMAIN_IDX_PERF];
+	struct dev_pm_opp *opp;
+	int ret;
+
+	opp = dev_pm_opp_find_freq_floor(perf_dev, &clk_freq);
+	if (IS_ERR(opp)) {
+		dev_err(se->dev, "failed to find opp for freq %lu\n", clk_freq);
+		return PTR_ERR(opp);
+	}
+
+	ret = dev_pm_opp_set_opp(perf_dev, opp);
+	dev_pm_opp_put(opp);
+	return ret;
+}
+EXPORT_SYMBOL_GPL(geni_se_set_perf_opp);
+
 /**
  * geni_se_domain_attach() - Attach power domains to a GENI SE device.
  * @se: Pointer to the geni_se structure representing the GENI SE device.
diff --git a/include/linux/soc/qcom/geni-se.h b/include/linux/soc/qcom/geni-se.h
index 8c9b847aaf20..cac999d6ca31 100644
--- a/include/linux/soc/qcom/geni-se.h
+++ b/include/linux/soc/qcom/geni-se.h
@@ -548,5 +548,9 @@ int geni_se_resources_state(struct geni_se *se, bool power_on);
 int geni_load_se_firmware(struct geni_se *se, enum geni_se_protocol_type protocol);
 
 int geni_se_domain_attach(struct geni_se *se);
+
+int geni_se_set_perf_level(struct geni_se *se, unsigned long level);
+
+int geni_se_set_perf_opp(struct geni_se *se, unsigned long clk_freq);
 #endif
 #endif
-- 
2.34.1


