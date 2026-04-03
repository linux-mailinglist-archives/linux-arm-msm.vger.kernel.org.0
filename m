Return-Path: <linux-arm-msm+bounces-101600-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qH14B9IQz2lysgYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-101600-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 03 Apr 2026 02:58:58 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id AF34938FC6D
	for <lists+linux-arm-msm@lfdr.de>; Fri, 03 Apr 2026 02:58:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0C138305ACA7
	for <lists+linux-arm-msm@lfdr.de>; Fri,  3 Apr 2026 00:55:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 43ABD26059D;
	Fri,  3 Apr 2026 00:55:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ciP6up7P";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="KUEwmG/k"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCD6E264FBD
	for <linux-arm-msm@vger.kernel.org>; Fri,  3 Apr 2026 00:55:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775177737; cv=none; b=kfBklUZ61UIpa8jbXMNf/sK4O+fZ4Qch4cJt8+VG9JefrZzZ3OI3w3td2vZdp196lF3cSdXGdMHBzrjCPmMGfbeoMMVCFPnq3DTdxIFjgFGE4cs61WfXBtWmRnUhIohhgNLGfNmG7YcH8lYH1K34aUMjB3VAqD94PW3lrvDmMKA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775177737; c=relaxed/simple;
	bh=o4o4VWomoGx5V3QEAWPY2HRs8htKnWKxHZRr3VyZN2M=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=E1UlNwxnhsx++7hmAHXeOj7Uef7uBqElCvs0JJcNVEWFGgMlzajs4EYHw+JmPT/ty5Neg5Oo2CBDeT4K1mSGozs6D8U4xgBv3K2k6a4GTHASmtXwqY61bXo42qBTTRVF1r9c99UVhZjMFAYHHkaQgn5WEjYFJreNyl6Rjli46lo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ciP6up7P; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KUEwmG/k; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 632G4aaa1562206
	for <linux-arm-msm@vger.kernel.org>; Fri, 3 Apr 2026 00:55:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+LmXWb6B0z5aADS7d20VvyutgCAilEfvrpT8THmEORg=; b=ciP6up7PuV4GW7U2
	cTKDB4Wq+akXag+8doEjQVb+OpWvsVsd4eUPklhWNHDyetv+YRyeUkHAZTYPspEZ
	K35YGH9yDtv7OP7CRWjhqAEZtZkkTM17ZJ7l95TFtY4T7krR8uRLCVSx7XgCQBWk
	3UQLiZz2RF6mKyUY2lBustytfzGz3AornbupjkojS6cCNUDDL+JVtujstRHbB4Oz
	ZmKQ0Br7EVGeLF7ZdEtFQq/6bpTpRq+wBfMvI6P2mhZGazPj2neixyM0noIlkblp
	1efzpR5RFbcs7XterIgrzbu657DwAkq3MojmYtN75pGjucCVhN9DMyyEWh786sj5
	xNapeA==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d9um71hkg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 03 Apr 2026 00:55:35 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-2c18175fc54so3250182eec.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 02 Apr 2026 17:55:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775177735; x=1775782535; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+LmXWb6B0z5aADS7d20VvyutgCAilEfvrpT8THmEORg=;
        b=KUEwmG/kM3kyDFgW838KR4Y8h5hYtbfm91ojOjY/T9SzeCbhh5ticNDqmD/vFQkI53
         9gFPD0pT9lIcf33cVTCX5KRArMfwA+AUJqUSQF8U2Z2iNewoE2d9XEnSi+UdxWSibUzJ
         +UmqoDM7Np08CYgkhYnM5jqmNWkd+0xttJcdbs+KdZ2EJOpWe8uaD1NiahlFIy0NB3O9
         ASTPhqLj1YUYGweGc5sSvHMz3SASoYHFfx+uw3OGj9uRoUSgpc0u7Jcg44qnoEtrEKNH
         dKucPYdYog/eQoUr0Sk44r3KaJOd/2wywCXBgIrBjSKX2RuGkoY4dsBhveXwEfcilNRL
         es+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775177735; x=1775782535;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=+LmXWb6B0z5aADS7d20VvyutgCAilEfvrpT8THmEORg=;
        b=XIzncOq+Ipe5pFvw5Q8X/EzT+1muvoHxf/Sl+aTOS7bwkG1A+iMa0RCeOXPKZJrASb
         C+vs0iTKoRAGNf2g4EqXUr2Ud/mubV+IiUAMQ71XsDlKb8QDV5edZeiVT2+8fGN13M6J
         REWhOm3stjGPUwhQhvfoIfSb+Ey27IlfFBDHFRsRiB9chfPEBk1e3XAxUFfynPWJwK6U
         lepe5YyzHTSScoZgbj/ErGDptU8bnIKagrrmEx3c3+8YkPD99x44ZyfNWD/nFRxEpZAH
         8ASrXDyrBJPS+7lqbNpLYEtRV8+dfeI6XT9GPd4jUaKNbyb17LCL2Y2zJS1V0YdJMgt6
         QBTQ==
X-Forwarded-Encrypted: i=1; AJvYcCVTVFGOwOj/rgSXmF40GFqQ6dWB2Cag1SM2hi3r2y1qNbLY2dAV3KIw4WImUIo9MDrXiPcoSGJlGqziloDS@vger.kernel.org
X-Gm-Message-State: AOJu0YzaCaexSIwoqt8X5iEdwWeKdxHUPGzY217hgWmmGR3/3lfO+mIM
	lKwaeaPQ+dQe13J/5g1iYnZ7cqrNIAWec68HW+dNHl+lDlENBVzW1Ai3lQ55v/1OivRWyOTh4j9
	El8xspx1KY2p3MIhL6l+D7VcYFqVtXyE1E3L4ywGvvSKAvB28u//9ziNBvLwwZgMqFwDL
X-Gm-Gg: AeBDievKxO3qPItMGbZFAUCaLfLuHdtR2jW/t6DBFHUkHe3j7Ae1RgTdM7ooyT0vksG
	w3Kgq+epE7GxW/z9O2oFtZK7dfzNobiM5btA46hhdJYwVF3rixaI6biATCo+QPPgEPH28E0BW2t
	y46EcxRcjZFIE9BuYIWBjvRjqol3NbM7TZ26dxRX5CyPNxvRjeU39y54tcoxzBveP3LID5oVSug
	AiXcXNHk7C0bDydIL1XitsUU2daQLDxG0IAfynbWxFInii8Awk/BlMec3EQ3PKqmz+oqLLRc+rs
	RNTRBS8QAck1/l8fWiQxaUNKuFx/rtvsKbl9+5C9X/FRwHTCiaSqBgIlE2LFn+D8Xb7cCLjMoSG
	ee2Vnp4PrLza7JXCaU3xsYeMF85VZiiYSRdm8tJYXQWieCaQlT3IxdjeBMRS3HU13gEv9798maA
	==
X-Received: by 2002:a05:7300:fd09:b0:2c7:3a7:c7a7 with SMTP id 5a478bee46e88-2cbfc55b4d9mr641858eec.25.1775177734506;
        Thu, 02 Apr 2026 17:55:34 -0700 (PDT)
X-Received: by 2002:a05:7300:fd09:b0:2c7:3a7:c7a7 with SMTP id 5a478bee46e88-2cbfc55b4d9mr641846eec.25.1775177733978;
        Thu, 02 Apr 2026 17:55:33 -0700 (PDT)
Received: from hu-fenglinw-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2ca7cf010d7sm3750800eec.25.2026.04.02.17.55.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Apr 2026 17:55:33 -0700 (PDT)
From: Fenglin Wu <fenglin.wu@oss.qualcomm.com>
Date: Thu, 02 Apr 2026 17:55:12 -0700
Subject: [PATCH v2 2/2] spmi: spmi-pmic-arb: add support for PMIC arbiter
 v8.5
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260402-hawi-spmi-v2-2-0bbe811fe3f4@oss.qualcomm.com>
References: <20260402-hawi-spmi-v2-0-0bbe811fe3f4@oss.qualcomm.com>
In-Reply-To: <20260402-hawi-spmi-v2-0-0bbe811fe3f4@oss.qualcomm.com>
To: Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Subbaraman Narayanamurthy <subbaraman.narayanamurthy@oss.qualcomm.com>,
        David Collins <david.collins@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, kernel@oss.qualcomm.com,
        Fenglin Wu <fenglin.wu@oss.qualcomm.com>
X-Mailer: b4 0.16-dev-17187
X-Developer-Signature: v=1; a=ed25519-sha256; t=1775177731; l=4558;
 i=fenglin.wu@oss.qualcomm.com; s=20260324; h=from:subject:message-id;
 bh=o4o4VWomoGx5V3QEAWPY2HRs8htKnWKxHZRr3VyZN2M=;
 b=7Tewj3gUARuhHCumfreKaI2qe6D1A7FspwfLsaHSWa0Vjm9DCQ+p7aUhQEkmml4ETr66bAdMk
 gMOYw2XYCOmDjSWvqFaCtOY5puIcUG3VTVYdffpyHTYYIH32y4PfSSZ
X-Developer-Key: i=fenglin.wu@oss.qualcomm.com; a=ed25519;
 pk=hJdt3E7o54lql+miD2GaxwF74cDyhgNwMbmFOZ46bRU=
X-Authority-Analysis: v=2.4 cv=U/WfzOru c=1 sm=1 tr=0 ts=69cf1007 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=qQkTAZUf_KvMCO389TYA:9 a=QEXdDO2ut3YA:10
 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-GUID: 1EFatsxx04rpkI1Cnt_GLuzrAGWMm2W0
X-Proofpoint-ORIG-GUID: 1EFatsxx04rpkI1Cnt_GLuzrAGWMm2W0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDAzMDAwNiBTYWx0ZWRfXx7aWVQ/62ZR/
 MXTIVm8p3ctA5DODGrMA4hLxWdTO1a4/AcrV4Wp/75SZvWeTiAo7+pzMYicf6d/6w7sqsfjyGbp
 sZSG9BiU+s5ehFIPH5ue7cLXaumoOA/uR3X2zUK+ceIQh2o5mBSpdgNedR9mdfoIlS//H1VUPbS
 oGnvxYOEZ7KJ5pBVpFlo7TNRjSTmRCBU2lgFU+fgXrHdhfSGAmkCgzM8vQ983cQopWrQVDQOHig
 HTUVGrTHXrZxi+QpIMkaiR3N5Z7zdGdK2hOJtHl+ilW32CKTwsACLaToOj5+SLA4QNcakfgGHvD
 Eixe4nLGfEwtiJzyat6K3wkNmAw35KbzeZpbtXldHtwq/P89TTWw5dBRmUE9zGLRIZ5p0vRXQu0
 m8PwQ1XfgOFATJIHq0LQfaI12EoH5IyM2kM+9wK0OD1vjcvgwx+HGpJZpuhSs5vFKbIkWGt5RQ3
 qKhyHOxFO1QuxTxtYvw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-02_04,2026-04-02_05,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 priorityscore=1501 bulkscore=0 clxscore=1015
 phishscore=0 adultscore=0 spamscore=0 lowpriorityscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2604030006
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[12];
	TAGGED_FROM(0.00)[bounces-101600-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[fenglin.wu@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: AF34938FC6D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

PMIC arbiter v8.5 is an extension of PMIC arbiter v8 that updated
the definition of the channel status register bit fields. Add support
to handle this difference.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Fenglin Wu <fenglin.wu@oss.qualcomm.com>
---
 drivers/spmi/spmi-pmic-arb.c | 69 ++++++++++++++++++++++++++++++++++++++------
 1 file changed, 60 insertions(+), 9 deletions(-)

diff --git a/drivers/spmi/spmi-pmic-arb.c b/drivers/spmi/spmi-pmic-arb.c
index 69f8d456324a..deeaa39bb647 100644
--- a/drivers/spmi/spmi-pmic-arb.c
+++ b/drivers/spmi/spmi-pmic-arb.c
@@ -28,6 +28,7 @@
 #define PMIC_ARB_VERSION_V5_MIN		0x50000000
 #define PMIC_ARB_VERSION_V7_MIN		0x70000000
 #define PMIC_ARB_VERSION_V8_MIN		0x80000000
+#define PMIC_ARB_VERSION_V8P5_MIN	0x80050000
 #define PMIC_ARB_INT_EN			0x0004
 
 #define PMIC_ARB_FEATURES		0x0004
@@ -63,11 +64,34 @@
 #define SPMI_OWNERSHIP_PERIPH2OWNER(X)	((X) & 0x7)
 
 /* Channel Status fields */
-enum pmic_arb_chnl_status {
-	PMIC_ARB_STATUS_DONE	= BIT(0),
-	PMIC_ARB_STATUS_FAILURE	= BIT(1),
-	PMIC_ARB_STATUS_DENIED	= BIT(2),
-	PMIC_ARB_STATUS_DROPPED	= BIT(3),
+struct pmic_arb_chnl_status_mask {
+	u8	done;
+	u8	failure;
+	u8	crc;
+	u8	parity;
+	u8	nack;
+	u8	denied;
+	u8	dropped;
+};
+
+static const struct pmic_arb_chnl_status_mask chnl_status_mask = {
+	.done		= BIT(0),
+	.failure	= BIT(1),
+	.crc		= 0,
+	.parity		= 0,
+	.nack		= 0,
+	.denied		= BIT(2),
+	.dropped	= BIT(3),
+};
+
+static const struct pmic_arb_chnl_status_mask chnl_status_mask_v8p5 = {
+	.done		= BIT(0),
+	.failure	= BIT(1),
+	.crc		= BIT(2),
+	.parity		= BIT(3),
+	.nack		= BIT(4),
+	.denied		= BIT(5),
+	.dropped	= BIT(6),
 };
 
 /* Command register fields */
@@ -201,6 +225,7 @@ struct spmi_pmic_arb_bus {
  * @max_periphs:	Number of elements in apid_data[]
  * @buses:		per arbiter buses instances
  * @buses_available:	number of buses registered
+ * @chnl_status_mask:	Bit masks of channel status fields
  */
 struct spmi_pmic_arb {
 	void __iomem		*rd_base;
@@ -214,6 +239,7 @@ struct spmi_pmic_arb {
 	int			max_periphs;
 	struct spmi_pmic_arb_bus *buses[PMIC_ARB_MAX_BUSES];
 	int			buses_available;
+	const struct pmic_arb_chnl_status_mask *chnl_status_mask;
 };
 
 /**
@@ -312,6 +338,7 @@ static int pmic_arb_wait_for_done(struct spmi_controller *ctrl,
 {
 	struct spmi_pmic_arb_bus *bus = spmi_controller_get_drvdata(ctrl);
 	struct spmi_pmic_arb *pmic_arb = bus->pmic_arb;
+	const struct pmic_arb_chnl_status_mask *mask;
 	u32 status = 0;
 	u32 timeout = PMIC_ARB_TIMEOUT_US;
 	u32 offset;
@@ -323,30 +350,49 @@ static int pmic_arb_wait_for_done(struct spmi_controller *ctrl,
 
 	offset = rc;
 	offset += PMIC_ARB_STATUS;
+	mask = pmic_arb->chnl_status_mask;
 
 	while (timeout--) {
 		status = readl_relaxed(base + offset);
 
-		if (status & PMIC_ARB_STATUS_DONE) {
-			if (status & PMIC_ARB_STATUS_DENIED) {
+		if (status & mask->done) {
+			if (status & mask->denied) {
 				dev_err(&ctrl->dev, "%s: %#x %#x: transaction denied (%#x)\n",
 					__func__, sid, addr, status);
 				return -EPERM;
 			}
 
-			if (status & PMIC_ARB_STATUS_FAILURE) {
+			if (status & mask->failure) {
 				dev_err(&ctrl->dev, "%s: %#x %#x: transaction failed (%#x) reg: 0x%x\n",
 					__func__, sid, addr, status, offset);
 				WARN_ON(1);
 				return -EIO;
 			}
 
-			if (status & PMIC_ARB_STATUS_DROPPED) {
+			if (status & mask->dropped) {
 				dev_err(&ctrl->dev, "%s: %#x %#x: transaction dropped (%#x)\n",
 					__func__, sid, addr, status);
 				return -EIO;
 			}
 
+			if (status & mask->crc) {
+				dev_err(&ctrl->dev, "%s: %#x %#x: CRC error (%#x)\n",
+					__func__, sid, addr, status);
+				return -EIO;
+			}
+
+			if (status & mask->parity) {
+				dev_err(&ctrl->dev, "%s: %#x %#x: parity error (%#x)\n",
+					__func__, sid, addr, status);
+				return -EIO;
+			}
+
+			if (status & mask->nack) {
+				dev_err(&ctrl->dev, "%s: %#x %#x: NACK error (%#x)\n",
+					__func__, sid, addr, status);
+				return -EIO;
+			}
+
 			return 0;
 		}
 		udelay(1);
@@ -2033,6 +2079,11 @@ static int spmi_pmic_arb_probe(struct platform_device *pdev)
 	else
 		pmic_arb->ver_ops = &pmic_arb_v8;
 
+	if (hw_ver < PMIC_ARB_VERSION_V8P5_MIN)
+		pmic_arb->chnl_status_mask = &chnl_status_mask;
+	else
+		pmic_arb->chnl_status_mask = &chnl_status_mask_v8p5;
+
 	err = pmic_arb->ver_ops->get_core_resources(pdev, core);
 	if (err)
 		return err;

-- 
2.43.0


