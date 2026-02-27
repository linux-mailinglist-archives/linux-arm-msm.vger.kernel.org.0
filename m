Return-Path: <linux-arm-msm+bounces-94394-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cHzANP43oWkbrQQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-94394-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Feb 2026 07:21:50 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A8901B3308
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Feb 2026 07:21:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 2C61731A608D
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Feb 2026 06:16:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8C3703E8C47;
	Fri, 27 Feb 2026 06:16:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="d6eSjE6E";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XeXOMCad"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41B7F355F2C
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Feb 2026 06:16:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772173006; cv=none; b=iR0pKc/abUiyapGdjFHt1y9TxGwnizsnjhY85M4lMj6ZDvy3JLxiWf5zuJPBmF3qePtXO2nUrGZieBuTSfjJaD8FUi1PuBbWQ++n/IFoMIvsfoFFRqr7n7ftUd6leLKt4LFTeNQS2aKDoNEcgn8nFV17rbsOHRtNH6R6YoJPDQU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772173006; c=relaxed/simple;
	bh=r+NuYoZ1+qXStZvaIZDliMZWk1kzoc6TJhJUEDoPnvw=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=KWDizP4/ROlQ4wC5Ex81t6urdHYDVj6NPimpFETr+0GC4uvL8lyQOX/wIcA3gFj7Ci5tPJeqhFi8c5XI3EacrbBRF2Gc+MTlvy0FipSZOnoZb1/rmuPldF9vT24YmwGpJEr/xOkHsJWxVpipehipu0zf6qGH19wfL0GlPSdxexk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=d6eSjE6E; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XeXOMCad; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61R2JuEZ2402979
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Feb 2026 06:16:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=KRLuQ2KM5IF
	ptPVplD9gxuDqOBRonDICntxFIs5jCF4=; b=d6eSjE6Eyh7zHbnmcpJdhMiwA+L
	ipZ7bKHH3sdjkX3Ak+CAnrFIbUQ2MQF87CpouUkE+D9tlQLPXz/PUeVBTXbniwc9
	qVae4yO86wS8u48/+rM2RaPsHAFWWYjyJB1kwJYb8Z84Mfdkvi3PJqSTUymLRPge
	MURoJ6eulYGRHUuokG0+A6UmxvhuIQuScplKITfPSbHQ+LZdotrAo1ZvrEeFnKg3
	LzEza4R6IVyAkXWd/9Hb3A/GwO3Y0x4xTc5WAuSPdC6rX3dzeurD63vw65bqvoX7
	mS44CG4gVfM0XGBOqcxU2KHE4QNWGChfu8qZth3s9uhpKtdrrarXzWTGJkA==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cjw239kmu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Feb 2026 06:16:44 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2aaf0dbd073so17076225ad.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 26 Feb 2026 22:16:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772173003; x=1772777803; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KRLuQ2KM5IFptPVplD9gxuDqOBRonDICntxFIs5jCF4=;
        b=XeXOMCadAHJJS/OFzH+R0xf8EKaVaAlTcNnZJbVJ7YNftr9ovuzGXtwwF4WMlFNsfB
         JnnDq9EbcRD0ALBHbMH8Zyq+y8Tc9s59C+nlla5b1xjM0qBs+i16xeQtfEuTrDLWyUHR
         kQpDivzK/hfj6VTrDitm382gPs+Hpocmx6Oz6cr5k3ieICuFs4f0NGUf5CwR+yXPRTD9
         IJJ4OUlnf4oVhYUeZzSildiCEaJU/m2VA1gv9agiwaBzDEUoyJAMyfuCUXAjRqM7thg4
         e4e72v9xYG9l2WaYRtiw/CfArTYwUq01rCRhe26tqoWPLoA7ZTopZqdfWJd9agaMB5kr
         MTYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772173003; x=1772777803;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=KRLuQ2KM5IFptPVplD9gxuDqOBRonDICntxFIs5jCF4=;
        b=VdRfrCt4Wp5ej9HwApg14XPdktjWAp+Bm547nm+x3Fes+9CPgV772CFGl7pdUnOqE0
         rH98lvjRew6N4d7zDIA/0urQu9po1QB6jtkTsYGWGlTIF5L3Qm4ZEOWn83Tgb/86beK/
         rp6Sx9FzQeXFevXofUNk0YBFa8MbfJuHAUXflCf4upS7D66F/iGS7lrq/Rm0T4a7Fqa2
         p8kLCJhPpDpJ8qLVNC0thOzkPMvlP+TjqBR5xKVe9iAS438w5z2yIIL7Pq7Uekk9MGj6
         jlf4rVvBNHS/tYFqWj6lLMfQiE/9JlgnuqDHXIKlnjDBUwbjOLDJaXpWF3vdSGECPZJm
         YQ3A==
X-Forwarded-Encrypted: i=1; AJvYcCUuLSFr2ULKc/jXGTIn/LIhNMsklxjVns+bvlcaDKLBt0/cqrQPj6dVXSmsomWlV6wNLmRHT7yBHWoXEVO+@vger.kernel.org
X-Gm-Message-State: AOJu0YxBcbUi2Ks8g5oIcExhfZy6diCAVTOkG8NJDTYWiMsMeLndBdfW
	i6KLe1GlzCqIkvKBeLYH2C6MmctoFNg3CRWibK/eHOjhE1pw9rh3wKEUrqgI8xse5isT0bazS7g
	1hiCRIJGBlgXOYrZGc8R2UGotParQN3LC7k9KGBI3GpxekIjHcpJ1BHXxeqhO/2kmyTed
X-Gm-Gg: ATEYQzwGbl5JZRNDWbH7+mqMT01a2fgQqCjvDHlFMKJZE8avgsefDQWA7nLwNiQdzH2
	P6Xm9IVMDBt95Bf+0ewKrYj//ql2I/5mjmWn0ulupQlOBq20GZQl388QiaroAEol7kxWd5BjWdh
	1FMm5QXaroFW3jlWoNbBDM7nVluRRMudas7YrI/0OyV+Zmjfke0GUcnqKmXTpXFf4ON3q4T8JIZ
	3Pa2qGHk04/QXK2k+80IE8sUjke5vNRhTke4EnKm2g3wnD8gXEjf8uHLNoJCOw4Q5MRUtZ6b72J
	2ieSVtNWO2jjdTpjTbSF1rc7leWzWntuWPzCRfmUSpfqL5RhX+3yv92NMmp+MlktmYn/LTAyaI0
	OqGQDT3BWT9DN55oU2+WrE6lx2+gbPahkGLJhGKdSgtFQXkSEQxbdI4I=
X-Received: by 2002:a17:902:e805:b0:2aa:d320:e96d with SMTP id d9443c01a7336-2ae2e4f7f04mr12056685ad.51.1772173003120;
        Thu, 26 Feb 2026 22:16:43 -0800 (PST)
X-Received: by 2002:a17:902:e805:b0:2aa:d320:e96d with SMTP id d9443c01a7336-2ae2e4f7f04mr12056345ad.51.1772173002527;
        Thu, 26 Feb 2026 22:16:42 -0800 (PST)
Received: from hu-ptalari-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2adfb6a043dsm64813025ad.54.2026.02.26.22.16.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Feb 2026 22:16:42 -0800 (PST)
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
Subject: [PATCH v6 07/13] soc: qcom: geni-se: Introduce helper APIs for performance control
Date: Fri, 27 Feb 2026 11:45:38 +0530
Message-Id: <20260227061544.1785978-8-praveen.talari@oss.qualcomm.com>
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
X-Proofpoint-GUID: 2Um-0siiY3UR3LKOV84yyPAIIEt909gO
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjI3MDA1MCBTYWx0ZWRfX9hbEcPej2uqC
 ue3khM6JQrxHfSauaJnR4oeUhfNOS3salLcH2a9WY6qO4SNxEVddbuLJ0x9swmZMycXHIXOuw1h
 ecjFCqUljFakACBtfPOtKKAZW8GCXI+Sj6Mqgv9xBydQYltJsbMvDb8L19OB4r+rQHyT659S+38
 mHhQjurlsfxEdYlHG/mCvgmZbHCOywoT0ZjBJ606TiM4tXgzKNSDfgVf0i8cuDIoT4y2vcHPKtW
 hIpqdS7+uWxbc84sHib/5U2YP4m5pgK82YqWK9PQnoaGYqxpDFWk/yOelgz3pZRBaE+NIfVbXvM
 mClFL3eTq7Hg5sfq7M7ACcwzS6GmdWxJhx5ApevvX10EhALJ+cKn+7+pSuNUwzTU7tJltgDHX0z
 eBLN+pLQKsNvqrMiESw+IGx8L28OY5jGTcTKhag9hepznVtpOq50flOXklDoorfTR8sy8o+CvCi
 5WCeTbb5JvwNNuPKInA==
X-Authority-Analysis: v=2.4 cv=cJHtc1eN c=1 sm=1 tr=0 ts=69a136cc cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=NwCh5GMA9Nt760FYQHkA:9 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-ORIG-GUID: 2Um-0siiY3UR3LKOV84yyPAIIEt909gO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-27_01,2026-02-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 lowpriorityscore=0 phishscore=0 adultscore=0
 spamscore=0 clxscore=1015 priorityscore=1501 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2602270050
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-94394-lists,linux-arm-msm=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 3A8901B3308
X-Rspamd-Action: no action

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
index 13ad3a51b58c..15636a8dc907 100644
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
@@ -1096,6 +1102,50 @@ int geni_se_resources_activate(struct geni_se *se)
 }
 EXPORT_SYMBOL_GPL(geni_se_resources_activate);
 
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
index 5f75159c5531..c5e6ab85df09 100644
--- a/include/linux/soc/qcom/geni-se.h
+++ b/include/linux/soc/qcom/geni-se.h
@@ -550,5 +550,9 @@ int geni_se_resources_deactivate(struct geni_se *se);
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


