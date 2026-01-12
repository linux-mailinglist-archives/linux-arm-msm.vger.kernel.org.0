Return-Path: <linux-arm-msm+bounces-88523-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 99F8DD12050
	for <lists+linux-arm-msm@lfdr.de>; Mon, 12 Jan 2026 11:50:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id D7103307B319
	for <lists+linux-arm-msm@lfdr.de>; Mon, 12 Jan 2026 10:48:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 82CAE34D3B6;
	Mon, 12 Jan 2026 10:48:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Ip6wlg1T";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="frfmlEvJ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A4BA34CFBC
	for <linux-arm-msm@vger.kernel.org>; Mon, 12 Jan 2026 10:48:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768214896; cv=none; b=O532P7MXmb+lTqFFBLFNAPgHeijLhTIo0ZlSUoGFpEhdhU6Z4K1J5BtHyib6o1DBFvyKy2CEq+rA8gyYDc8ZAR8MsMclZEu5dDNyAbWOElAUONYJw0dt4uire1OAdfE3e9qZjwkw73RbAHsDKb6YGO0N3Lu1YZex+kHO42VyN9o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768214896; c=relaxed/simple;
	bh=wIOve8uFF48Gb62JHvsj+fQjMU469T7IW0zeUBXokU8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=R10KxP2lu8FVfNJ+Bvud33bK3nu1ITdzeyHVokuTynrS8sYs7FD/des/irf/LomEVvVtNDcUa6a2T8qLjXhWcdgggvKdy6WYkEhIEj4b2WK1etsgGOmdMZs/1EiBEUy95NOK0zAh0gWDequ5RCJ3STRzdNJifby0YdvJ02WvZxc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Ip6wlg1T; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=frfmlEvJ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60C7Ognb555284
	for <linux-arm-msm@vger.kernel.org>; Mon, 12 Jan 2026 10:48:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=iwjTgNOIt2X
	RAWcDsdp1tFrhZSbG+UyPsyYGOmD1OGQ=; b=Ip6wlg1T4fquA9BFa5EFiZxwRK8
	2yDzGbQ/K4xNTlZXKoc7faIr5NJSOFESCCHjtt0OxHfRA1tW9moEkMwQ3NXdjywd
	Z8E1WkiQ0v/jjQbfQHWyxJtmNr/gbk3U3j6F8WrhTq7dw7+CSsqOl7WOXB5VJckE
	LGIYzs6+Q+Jms4zAvY6HWZAWW86Et5sZwSLWgFwFe02l4oaaPKeJcSNxDoe+GY4q
	cl/z5kM2kZDwW+4cCrEQk94m663yVyYntzkEO7t5VI6OWNQhsrZZ1lvKWFSucaHp
	PuquQYJEvgBpHfUDK6oP3l2p/SXu3ZpA/dG4xSRj0VThVcGU9obwonfZ0xQ==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bmvhw0p5f-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 12 Jan 2026 10:48:12 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-81f42368322so1192087b3a.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 12 Jan 2026 02:48:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768214892; x=1768819692; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iwjTgNOIt2XRAWcDsdp1tFrhZSbG+UyPsyYGOmD1OGQ=;
        b=frfmlEvJnsKZ/zyiOJzxQV0Gjvhv/N89iorKgU5wQMRnRJaqZScFIYspDW5Otz5LxC
         J2lbND2HzI1VaHo911Qr8zs5G4KDUXXsnu3GWnaG7dg0JncIaqV4AOKmW9RXmmeng4qs
         EOfq4X61QLmzmOuQQjhHTidjxYJ5Ym+Fgzf/KgNPAyBB/dIWtCfIZesXtqA5d/3nOZ1R
         d6o2+Os9HOxQCJe0llBaCRIEk9nQ/uA7pAAmJ7uAo0f6QV0yFuBzuuvsb44L6LuJEeVT
         MkqyFLotqS6NLG37Pc2cxVFjiovJxQmitD9ndFaDpDnwP9OZeOthRTqVpFD0qGnBvV0V
         cWdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768214892; x=1768819692;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=iwjTgNOIt2XRAWcDsdp1tFrhZSbG+UyPsyYGOmD1OGQ=;
        b=a6mq/lLmiTip5UeLe89ZOeE7A7xcUO4HNpbbk/juKS4JQKvz49M273d8d6RKOddMV7
         diS3GwHBQsz1R8Rg2Cb35QwkK6khfMGNYzc1y/r21E2gjHd7Z0JG9pbGGdoIWHX7+daL
         lTVb+SQRoJkHMrkAHiRw5pTYiyN7YEYiYxLSwzMd2Fls534eAdzVDkHJoZ2yEbYGWz8B
         8p3NXO5Nz3UPOKB40F1NRwKD0KDBszlZc26KbBMmVgZniI52YWH6XzBn62KXZDXv2QzS
         SglEORKiovD+/flRPVbiBdW81wrTqBQNw5t0Hb7eeBGNDrgnlRh6PRU+Tpex3W6/XzoU
         6OWQ==
X-Forwarded-Encrypted: i=1; AJvYcCXoce5+yEeeOvvNAPDOrfbWSAKj9pao3U1aOKtrSXunm06Jz6DaAdkKn7KHIQBj80mGPg70djh6fQNLQ4oW@vger.kernel.org
X-Gm-Message-State: AOJu0YysNuz4jgYNjbk8c/HjqPp8wxYY1gEmT4rhxxP/ug5XbKYXO3Pu
	OK0zrHXOT0VUX9MHWNA/y8DD8jQD/6YkQP48IVTm+ZTxVsvRClq5zsG3tcPIKnLfv0weEjf2Ikg
	CbotYmwmD7gYt2pcksNBpKue5ygMKWyLX8Lgoms+D/zuG9IkQAao5NOJC2Pooz8oA+Vis
X-Gm-Gg: AY/fxX4kpuebXrGQaAzz0UyyFoig3NLg/9UjgU6tNm+1I+CtCaabJ2VqWRbR6loG+eC
	qjfWgo6MpA2W2cHXyiuFhP93fz0tpv8hpjsN3JGGGCbevQ1viORbwtA77ZTqu5XU6AwfXgSSprA
	6cI0N3xr6ILC7uZ8ijyNDhleioPcZS15zHrYTm6QmHsYbnMpQGzMzJjaJqbqM0V5WyFRvQ9MS5T
	SnBPfwk1S2rwQ1S1CDa3kYGBeANrNnmgZgXBlV5VLIbpVy9ceIG/txpkYRXK1nRhZLwmQYUhqTc
	6cyW8VC7r0mFdf1jos86ZekFaoRfnP2WKV6Xwja9OtWnZsJWgH7FI5OJ8E+grw9RzLXWgqd0PaG
	buEM8M4na8DMOzV499HHPXp468tVry8mi1ofEzz2inpM=
X-Received: by 2002:a05:6a00:3318:b0:81f:5a3a:c91a with SMTP id d2e1a72fcca58-81f5a3acad1mr1991320b3a.46.1768214892113;
        Mon, 12 Jan 2026 02:48:12 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGKv3xBIm6s5ePW5y4EswrA32UfOINAI3FD4tECMqPmJmhR6sDEedYYPxOalf4G8wJfq62Tew==
X-Received: by 2002:a05:6a00:3318:b0:81f:5a3a:c91a with SMTP id d2e1a72fcca58-81f5a3acad1mr1991292b3a.46.1768214891531;
        Mon, 12 Jan 2026 02:48:11 -0800 (PST)
Received: from hu-ptalari-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-819bafe9b8dsm17288681b3a.22.2026.01.12.02.48.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Jan 2026 02:48:11 -0800 (PST)
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
        bryan.odonoghue@linaro.org, dmitry.baryshkov@oss.qualcomm.com,
        bjorn.andersson@oss.qualcomm.com
Cc: prasad.sodagudi@oss.qualcomm.com, quic_vtanuku@quicinc.com,
        aniket.randive@oss.qualcomm.com, chandana.chiluveru@oss.qualcomm.com
Subject: [PATCH v3 06/12] soc: qcom: geni-se: Introduce helper APIs for performance control
Date: Mon, 12 Jan 2026 16:17:16 +0530
Message-Id: <20260112104722.591521-7-praveen.talari@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260112104722.591521-1-praveen.talari@oss.qualcomm.com>
References: <20260112104722.591521-1-praveen.talari@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTEyMDA4NSBTYWx0ZWRfXxJOcKz26Jile
 14LYrsU2jAv0KbqOx0+7u0QDg2a6IOk2cCrwkWdaIVd8km3CJ/pSoE6PzLUsoaBy/ef7VptYb0I
 aFvCymVAB03uLm8eexGx6I86Qqa78Iw5naKTB4x1vt0k5eOv7O2FOLdxe0iTyuVz/VmN8hBM76h
 OXs5cDu5Bpqt7pha/DHwCqihCJH02QQsSBBP85A0ly25CKnzt4L3Rb0G2uPqX0q65V6sVN3xUSG
 JHZKH2St+S1QP0etH63+ZPdClgujQUxDA5RfHmqil0tBoFpY903tGeWtOWCnnZ8lwu9DG5V1N/E
 08bDct5oLmPduOWTs38cATcSyQrm6J4sCi4rnVuiyyp9IiX62sQ1NgkP8US1q+5cyh87uLhdR7V
 VAQMOOJAjzSf0hs7CZI1cPqjOPvFqc1DEgFxKkLTN2csFjS2ar3iMUz+vCVOMujLAwlnVk80ERa
 ytPDFCVSB8BkkKqzvQQ==
X-Authority-Analysis: v=2.4 cv=JP02csKb c=1 sm=1 tr=0 ts=6964d16c cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=NwCh5GMA9Nt760FYQHkA:9 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-GUID: YgjQDd-NRdFsnNq4LA_NW6JU6DroNbHa
X-Proofpoint-ORIG-GUID: YgjQDd-NRdFsnNq4LA_NW6JU6DroNbHa
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-12_03,2026-01-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 priorityscore=1501 impostorscore=0
 suspectscore=0 clxscore=1015 malwarescore=0 adultscore=0 spamscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2601120085

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
index b8e5066d4881..dc5f5bb52915 100644
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
@@ -1093,6 +1099,50 @@ int geni_se_resources_activate(struct geni_se *se)
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


