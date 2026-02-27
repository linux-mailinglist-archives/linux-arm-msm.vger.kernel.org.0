Return-Path: <linux-arm-msm+bounces-94390-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IDvINks3oWk1rQQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-94390-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Feb 2026 07:18:51 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FCFD1B3248
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Feb 2026 07:18:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C471F3179C0F
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Feb 2026 06:16:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 32D6E3D903C;
	Fri, 27 Feb 2026 06:16:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="emUr0a9g";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="UmTyvNJa"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8FFD33344C
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Feb 2026 06:16:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772172978; cv=none; b=swuv09RINeJ+mOBA8HLPikuWgeKbHGmHJOo5V/VFJhcofP3XfLF7y7ATqjjQEZz768S4N5747lzZYjsK4fetZlQ5n7jIAtzHGgVjfhTV8tKACtAtJFDeLJCf8KAykaFrVSfDoTZktLuiZDz3q9UfJgDtgtBhAfZeAmWIPakx61o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772172978; c=relaxed/simple;
	bh=ugzI2X4T4Eu6du95zdaOBWO3+LJFBYSONj4KCG0BUk8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=mwItwGgY++QINNstQLtYM8IHS/yKJ7zEfNr+8T4UdV0UKJiS2gQPdjvgXAr61hOPOLn96TxgXrcJOyWDuhiBofsUxD11aZySQCix8fUuf0/uCeYNlbazIh+WPKaT/USrNvfJAk3PtdzPxxzhYMteFjnfT1gDmEI1prkzwaMJdRk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=emUr0a9g; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=UmTyvNJa; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61R2K1DP3185456
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Feb 2026 06:16:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=slQCzeC9waI
	6hA1xDFtb4CgPu+7qSKt+eKegC+Sl/tk=; b=emUr0a9g7T58XcL/OgtRlEkwkKc
	5FnuSngX6H3kxE/HdBNez+1TxkEvvmeCOq8a5UhJiwv+exQYNVI+o7ptca2EEXGy
	brT4XDDipCMc/P1B6TJvjyY3tKInlCP/u8UNt1DDOOC7g+GjvPanjpx9MffMYX5d
	VJ7FOGsegx019p3QTqRslcCImXv4E223+pEF7cUg8uCDAClcX8uLX4pfO949r/1O
	j2OSqk6a1n+JhUUoUfmNSvZ04TRNDIcLcuRrHt0qmByZEPUp7I2FDr9FdaBQ3sfb
	y7PLvCzC1QcsVVCsCp2lSJ7dCpbPZ+nCrhXBxOyZzRV3vtfYjTFeOTCgeOQ==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cjmp63hck-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Feb 2026 06:16:15 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-3562692068aso2018302a91.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 26 Feb 2026 22:16:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772172975; x=1772777775; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=slQCzeC9waI6hA1xDFtb4CgPu+7qSKt+eKegC+Sl/tk=;
        b=UmTyvNJa5yphuXz+txfcBScvY0jxaYN8I3fu/35qUpNMnZUD4kegr+aK+eA/4Qn8b9
         pf2uE0iAtE9YBmKBstMLbPVB43ivilOegXqRTnxA/Q6OKnDu/lfhV0TTnnfoBIwGC3ul
         XNpelp9WUGt7JkVIA0xjfeSfuFVZF4VXdy1kP2eWX7YhhnvC76TUKJhb72tPANIjt4jj
         wkvv9TpfNnaOABUXXXuHfLCG0W7QSvMgBME/mc+02LPYTk1kYEsG6THuaqRGT+5cF6aj
         JOUZ64zdAOrZCRNYyiAUdirZF900HIV4YusmgNovACYy7w5cw1JCgGfb2JEaxFclhjjc
         QCfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772172975; x=1772777775;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=slQCzeC9waI6hA1xDFtb4CgPu+7qSKt+eKegC+Sl/tk=;
        b=i1SI/YDUxtaTkp2Tmkj/YUFQ3pc+n4r0QxyuuWsMiVHQEBEskBuUTvZIO09yf+FMYi
         FcYJ1KJ+KsY7lzTDHmYO2LAYAbOue6ZR3ZdtyDtfcCMYYcL34uqvnDA0oAn3qKpD2roj
         LfLUXlU7+V1gKfiOmDKnrvowssb7/sI7WSA0vDdq+OqS7UNRQ1ER6E/Lhm/kGtKRyHU/
         rh43DIHcBbl57jBw6Z7w8uvlY5al+kDISHY1ZBwZ+Njs8uBvLzjKud1e9gG9JPSuXEKr
         XerR0hR16GrKoMLmejrqwCQS4pafC9EBq/tcwDr2GFGHeYgyfTn0BjFJoaMpcsAw7QGE
         j5qw==
X-Forwarded-Encrypted: i=1; AJvYcCWr4q8Emm95cAn/SNEI19AMEDwiDdmb1gR6ymoJbSH1XQYspRyEiCOc6hfHfnUVoyoIdw1Wbxr+dpXcHJ0w@vger.kernel.org
X-Gm-Message-State: AOJu0YyLmplRds0AC3vjHPan5jM6dOEKGYEaxdrxF3Rv9YytGtV1feU2
	esOsSpyZXynKEywQlw3fMk/sxEoBGguWLv9kYWAM0p1Cp1/dLCkddAiUgLx29f/j9bZY/v47B16
	AjzPNrD+XSgizX9Bc/SeayBWZzf/38eNEUpZklmpimLb8T3qbV7F3FUs0y1cAWX9YyKJx
X-Gm-Gg: ATEYQzzz5IsQNNTJBziS2GVfArAjicFpVUJVUpJ+X+dEmjtor/49CtZiVrwjtcMQkEL
	PR+KbAvnPO0ESA4i7+lmVSpHWvi11bVXsFvj2cmYxDUwwB7spyVnW5fGgY9LAFyZzo0iNzYmGCm
	XQzM2WtzB940W2vEEYO9tILDfSWABJ8l+cs3IQWXawbqJ4Bq3XQxTJiOkTcYMLThDF9jcGuT16o
	QassgthEUQULd3xumn4Y7QBK2C6Gx34QzVgxN82rkTZleNfHUzV+q6cKwbHGfISTtX3a9/Zv1SM
	vZxr10W1kG+Io53Syg6fbAA7V5fclroeAjMX0IARjsK+ZPXyvvDzCNVo9Fx90ovaxGIbmkXXwjC
	7EKhHXXgW/lim0T5sIsw39VSf06KGN1lsucXWIUqe2m/fatFliTFchL0=
X-Received: by 2002:a17:902:f543:b0:2ae:d7c:1ec6 with SMTP id d9443c01a7336-2ae2b55872amr17585295ad.0.1772172974681;
        Thu, 26 Feb 2026 22:16:14 -0800 (PST)
X-Received: by 2002:a17:902:f543:b0:2ae:d7c:1ec6 with SMTP id d9443c01a7336-2ae2b55872amr17584995ad.0.1772172974105;
        Thu, 26 Feb 2026 22:16:14 -0800 (PST)
Received: from hu-ptalari-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2adfb6a043dsm64813025ad.54.2026.02.26.22.16.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Feb 2026 22:16:13 -0800 (PST)
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
Subject: [PATCH v6 03/13] soc: qcom: geni-se: Introduce helper API for resource initialization
Date: Fri, 27 Feb 2026 11:45:34 +0530
Message-Id: <20260227061544.1785978-4-praveen.talari@oss.qualcomm.com>
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
X-Proofpoint-GUID: Ykk8W1FjqI_Z79P2ObPWJPHBByWIzj8C
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjI3MDA1MCBTYWx0ZWRfX/rFKP5sX3aSs
 G5HzKiGanthmBeB9VA1Eo9ggRjZpFBdXOAKv416DFz0v80CgRm9PgaUMdo5U3aHvfea8I3BuNBE
 /v6+wtjlpvHV+/jLKxc/y9Y9GfjnGQ3Ck4BuoKjuzCzoa32wLd5B6Xgq2RCEALVnCYVFXZZl2MJ
 pIlO254ZpAx4TBuiggHNdqlWQZrG4OTBCD0nQt1PzG+8/3dkaRrcU9hf5BQqoOt49KjWp6TNTy4
 HKtxbgODSZwNmOJw2nZy2w0X1m/5UIopa4H45p+wUOo9zpvkgPLnUkCbFHbUmwyVvQLvXnzJgTT
 yyFzUSqHTWvyuU71kf2paqWzGeyqwcKYR3B9SlrkfuKGO1yU38K22WVAIeLQsSIglZEp2UtuywS
 cscUYd9byQq1vupoDwZJ7EICcuWjdB9u0eyQHAoluslEoY6/oWbknuzrjuV5O6loahvW2MDrAE5
 o1h2RPePwYuBmn9UmJw==
X-Authority-Analysis: v=2.4 cv=daaNHHXe c=1 sm=1 tr=0 ts=69a136af cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=OYYzyx7XpuDNtx8IVW4A:9 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-ORIG-GUID: Ykk8W1FjqI_Z79P2ObPWJPHBByWIzj8C
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-27_01,2026-02-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 phishscore=0 bulkscore=0 adultscore=0
 priorityscore=1501 spamscore=0 clxscore=1015 impostorscore=0 suspectscore=0
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
	TAGGED_FROM(0.00)[bounces-94390-lists,linux-arm-msm=lfdr.de];
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
X-Rspamd-Queue-Id: 7FCFD1B3248
X-Rspamd-Action: no action

The GENI Serial Engine drivers (I2C, SPI, and SERIAL) currently duplicate
code for initializing shared resources such as clocks and interconnect
paths.

Introduce a new helper API, geni_se_resources_init(), to centralize this
initialization logic, improving modularity and simplifying the probe
function.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Praveen Talari <praveen.talari@oss.qualcomm.com>
---
v4 -> v5:
- Added a Reviewed-by tag

v1 -> v2:
From kernel test robot
- Updated proper return value for devm_pm_opp_set_clkname()
---
 drivers/soc/qcom/qcom-geni-se.c  | 47 ++++++++++++++++++++++++++++++++
 include/linux/soc/qcom/geni-se.h |  6 ++++
 2 files changed, 53 insertions(+)

diff --git a/drivers/soc/qcom/qcom-geni-se.c b/drivers/soc/qcom/qcom-geni-se.c
index b0542f836453..75e722cd1a94 100644
--- a/drivers/soc/qcom/qcom-geni-se.c
+++ b/drivers/soc/qcom/qcom-geni-se.c
@@ -19,6 +19,7 @@
 #include <linux/of_platform.h>
 #include <linux/pinctrl/consumer.h>
 #include <linux/platform_device.h>
+#include <linux/pm_opp.h>
 #include <linux/soc/qcom/geni-se.h>
 
 /**
@@ -1012,6 +1013,52 @@ int geni_icc_disable(struct geni_se *se)
 }
 EXPORT_SYMBOL_GPL(geni_icc_disable);
 
+/**
+ * geni_se_resources_init() - Initialize resources for a GENI SE device.
+ * @se: Pointer to the geni_se structure representing the GENI SE device.
+ *
+ * This function initializes various resources required by the GENI Serial Engine
+ * (SE) device, including clock resources (core and SE clocks), interconnect
+ * paths for communication.
+ * It retrieves optional and mandatory clock resources, adds an OF-based
+ * operating performance point (OPP) table, and sets up interconnect paths
+ * with default bandwidths. The function also sets a flag (`has_opp`) to
+ * indicate whether OPP support is available for the device.
+ *
+ * Return: 0 on success, or a negative errno on failure.
+ */
+int geni_se_resources_init(struct geni_se *se)
+{
+	int ret;
+
+	se->core_clk = devm_clk_get_optional(se->dev, "core");
+	if (IS_ERR(se->core_clk))
+		return dev_err_probe(se->dev, PTR_ERR(se->core_clk),
+				     "Failed to get optional core clk\n");
+
+	se->clk = devm_clk_get(se->dev, "se");
+	if (IS_ERR(se->clk) && !has_acpi_companion(se->dev))
+		return dev_err_probe(se->dev, PTR_ERR(se->clk),
+				     "Failed to get SE clk\n");
+
+	ret = devm_pm_opp_set_clkname(se->dev, "se");
+	if (ret)
+		return ret;
+
+	ret = devm_pm_opp_of_add_table(se->dev);
+	if (ret && ret != -ENODEV)
+		return dev_err_probe(se->dev, ret, "Failed to add OPP table\n");
+
+	se->has_opp = (ret == 0);
+
+	ret = geni_icc_get(se, "qup-memory");
+	if (ret)
+		return ret;
+
+	return geni_icc_set_bw_ab(se, GENI_DEFAULT_BW, GENI_DEFAULT_BW, GENI_DEFAULT_BW);
+}
+EXPORT_SYMBOL_GPL(geni_se_resources_init);
+
 /**
  * geni_find_protocol_fw() - Locate and validate SE firmware for a protocol.
  * @dev: Pointer to the device structure.
diff --git a/include/linux/soc/qcom/geni-se.h b/include/linux/soc/qcom/geni-se.h
index 980aabea2157..c182dd0f0bde 100644
--- a/include/linux/soc/qcom/geni-se.h
+++ b/include/linux/soc/qcom/geni-se.h
@@ -60,18 +60,22 @@ struct geni_icc_path {
  * @dev:		Pointer to the Serial Engine device
  * @wrapper:		Pointer to the parent QUP Wrapper core
  * @clk:		Handle to the core serial engine clock
+ * @core_clk:		Auxiliary clock, which may be required by a protocol
  * @num_clk_levels:	Number of valid clock levels in clk_perf_tbl
  * @clk_perf_tbl:	Table of clock frequency input to serial engine clock
  * @icc_paths:		Array of ICC paths for SE
+ * @has_opp:		Indicates if OPP is supported
  */
 struct geni_se {
 	void __iomem *base;
 	struct device *dev;
 	struct geni_wrapper *wrapper;
 	struct clk *clk;
+	struct clk *core_clk;
 	unsigned int num_clk_levels;
 	unsigned long *clk_perf_tbl;
 	struct geni_icc_path icc_paths[3];
+	bool has_opp;
 };
 
 /* Common SE registers */
@@ -535,6 +539,8 @@ int geni_icc_enable(struct geni_se *se);
 
 int geni_icc_disable(struct geni_se *se);
 
+int geni_se_resources_init(struct geni_se *se);
+
 int geni_load_se_firmware(struct geni_se *se, enum geni_se_protocol_type protocol);
 #endif
 #endif
-- 
2.34.1


