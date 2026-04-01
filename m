Return-Path: <linux-arm-msm+bounces-101286-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qExGKWbszGk/XwYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-101286-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 01 Apr 2026 11:59:02 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C5A03781E0
	for <lists+linux-arm-msm@lfdr.de>; Wed, 01 Apr 2026 11:59:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id F2DE83141F57
	for <lists+linux-arm-msm@lfdr.de>; Wed,  1 Apr 2026 09:43:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 88DD13DFC99;
	Wed,  1 Apr 2026 09:41:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="aJcLUXKl";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="cnRjr4l8"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D53A23DA5AD
	for <linux-arm-msm@vger.kernel.org>; Wed,  1 Apr 2026 09:41:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775036510; cv=none; b=GZbiBfZDcs0FTc3pKK40DLjD5x5X6p/ZiEumJRSka1OGS/eI8+sRb/ZZuzqRNy7QEFP77cYSDSfRaa28vhhfm5kQY8kuZoxVCdcP8/hFSmUDMW+LOl3x0TwPw6N0q7GbcEYh6tqrPep2TPs9cXffZgr2Je3wccXbhsuWBy/9g9c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775036510; c=relaxed/simple;
	bh=8e1wrGwtOt6jYX3+6GLgmMDaN6TklWOqHQL7+SqwExQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=SCRXxZUY4193NJ4XnXxFnnzmDJ4EizsFFAdiw6K/epUytK+W6YA65s0Mq3ZvGaY9t0IoOzv88SfeJP5mWa+5AzaE18oYETnKngY1BUGjIxVO4zNs0b3yvVgo8YP3RGiuqkYCZfhsqKbt5v1GFrp2qcrjJPCOqP2p5H9u/eGGaG4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=aJcLUXKl; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=cnRjr4l8; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6314J5cW1579457
	for <linux-arm-msm@vger.kernel.org>; Wed, 1 Apr 2026 09:41:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	3PqUADJMJJoP0wu59C9aNUAlbK4WpxvtmmPet8NmdNA=; b=aJcLUXKlwLsN0HZE
	pX+wH8xspIs9wmQlSUgay25eMrhg3ZTkBXVEpWvAW9tLifey0Rgm+WkJj26Osuri
	epoYli5Xdxf1hfju/m6+ekiLDOYMdZkIYd8ky7pClXLpYqy7tqVWx/QAED8zNhXN
	qaxtGAwchogJx0uhpqXYVAFd+oP7vIGZ0VyOUy0xugQd7ONaICRHh9un7pX86EMf
	oxNcm1KTIwIoJuqJfecNwBIM/62Gxl01G8ulHnnLLJ/O7zchanC0pu4qb17AzMpt
	WKs4JNoOUKmvG/TPvrr/yTsnZRsVBCbhc5AvHZPYShnmM7li3iVmUgPf9dIJI5u4
	fbjhhg==
Received: from mail-dl1-f69.google.com (mail-dl1-f69.google.com [74.125.82.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d8mr2tuyj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 01 Apr 2026 09:41:47 +0000 (GMT)
Received: by mail-dl1-f69.google.com with SMTP id a92af1059eb24-12711ec96fbso13508357c88.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 01 Apr 2026 02:41:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775036507; x=1775641307; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3PqUADJMJJoP0wu59C9aNUAlbK4WpxvtmmPet8NmdNA=;
        b=cnRjr4l8BNRTXNJsKadvaffi5rVw8jX8CbQ932Gej7r/ocOgm05EM4h/mhg2eO6w7O
         /fazYCk1f5irZzOn0X38DChvv/xNnZ1dsqEiIBITUIEfwAGRzG4lmBOFJ5/9/1HEip3q
         91lxhBdYp80dQmQ+4A/1OESAH2Fzkx/VI4fD3jmiFEHj4mrelcEnFhCAyqzZ6yV+IDPx
         GRhgAM60KOeb4BI5aloaZmeOgvXFMnmADvpI0NnYWg/i2HiBltovz87V+XwjiRJIIHt2
         ct7oOXm7VMZ6MW85Gkjd7kBzlNxrNWNOtd7uE7q1Q9sETvoMqIayyjmcodlGoyiCmhrY
         leaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775036507; x=1775641307;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=3PqUADJMJJoP0wu59C9aNUAlbK4WpxvtmmPet8NmdNA=;
        b=SWroKLmGw/X5OTRStKU/vdMlbiyfHfCVxcSIuuz+5WQQVMMs+/ytnf/1JfXdX9/oN4
         eOvwW0i7lbORVm7uVSaWwmGrTEXkWfTEaBzdhaoBHquUuOrWyCAelq8bNcWCvNLdzyEl
         I1UKBkuQRdV27v1D+/6t7k3CmjZvqHd1eCvDq4Mfktq/dtqEL8h71iSSwF/L74jV6Fbq
         peqLwKsAfzgb7ZEwTd+hvI4x6M7bIJIIguOGAHfmvUXJC0nlPMBhru/pz4iHx23bv0ZU
         ykYYyA2Qzpxnh+8WaL4HGDSDoM1pPcM/rB6NIImM1DnKSJdSvnL1+/u12kearHheybIa
         kOag==
X-Forwarded-Encrypted: i=1; AJvYcCVyVl1HLTKp1011+81U4BN5lwupWa0nECGBDN9I4CVa1ruDH5b0nN4Mv/s1Hs5vlLD4X74tIdUk2+DpN8hL@vger.kernel.org
X-Gm-Message-State: AOJu0Yyr/6vJcCnN4qxffOlc0W6DRPD0ifom34AwoCGRGRPhErdf16n6
	+BGU8SWFNXSInp1ytZ8gr+U8v8oOb+fxs3TQJPLVTtvgVj/oevJ09Zp536LHKwvbTv+DSwkshPV
	9fWGKa5my6HF4q0aFhvMJgNU0NFFNO8wY7IKqzbqFh1fAtNFDNF2944ABKZ1ETezQkcJz
X-Gm-Gg: ATEYQzwJAp/jgTVpRZwGJ0qnpc9sOw+uzNPhaBYZcrB0WtY4e0nNDNuRg1HPkmPljeO
	mKS2sV1PllS+ZbcmSmbW+f+cotYJA6sUSqAoc75NqjHclATOVrQTcA6XtQKN1AcV0sE5SDcRmoD
	+WlEnYL+fZeiwbxefdlE8fG8K4q3ve13YxNIV7odGZ3EXsqYiGlpQXZNnkl3+BwXaI9GS6tDsme
	AHgo/WxYFJyniZmdoY4Pyfl6UtpoOpgoAshW1tlpQD6GjB7cO1uyJ3+H4SarD3qwkxcHhzTQzpB
	tTwDn2DoH7mww1uElHtI31vv3MbZgrrGbfdbvNvYbK9aM1amkyRVhc+BPzRdiZWsvX+pfTar/A6
	dEZJcfTDewUhIMMo+NdoIfdwQPUO0pjnj13fPVBmjI5bZyKME2jr+LZ7HoxUe8JMNDTw/OFhxkQ
	==
X-Received: by 2002:a05:7022:ea26:b0:11a:e426:911a with SMTP id a92af1059eb24-12be643816cmr2043500c88.15.1775036506488;
        Wed, 01 Apr 2026 02:41:46 -0700 (PDT)
X-Received: by 2002:a05:7022:ea26:b0:11a:e426:911a with SMTP id a92af1059eb24-12be643816cmr2043475c88.15.1775036505863;
        Wed, 01 Apr 2026 02:41:45 -0700 (PDT)
Received: from hu-fenglinw-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-12ab983f9f3sm18982647c88.10.2026.04.01.02.41.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Apr 2026 02:41:45 -0700 (PDT)
From: Fenglin Wu <fenglin.wu@oss.qualcomm.com>
Date: Wed, 01 Apr 2026 02:41:24 -0700
Subject: [PATCH 2/2] spmi: spmi-pmic-arb: add support for PMIC arbiter v8.5
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260401-hawi-spmi-v1-2-c40963041078@oss.qualcomm.com>
References: <20260401-hawi-spmi-v1-0-c40963041078@oss.qualcomm.com>
In-Reply-To: <20260401-hawi-spmi-v1-0-c40963041078@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1775036501; l=4497;
 i=fenglin.wu@oss.qualcomm.com; s=20260324; h=from:subject:message-id;
 bh=8e1wrGwtOt6jYX3+6GLgmMDaN6TklWOqHQL7+SqwExQ=;
 b=1S0erltnTVdBmiiXN1oRavSHh/OWi0nN1ROWxzEQU+EG0gukJXRmGAxiNvRiZbuk8n3Df3Vlc
 xkHOOk+yzm8BFM5XWSftFdT14eg4FqJNEn8Hia+J4U0+1nm/eOoYfAB
X-Developer-Key: i=fenglin.wu@oss.qualcomm.com; a=ed25519;
 pk=hJdt3E7o54lql+miD2GaxwF74cDyhgNwMbmFOZ46bRU=
X-Authority-Analysis: v=2.4 cv=B+O0EetM c=1 sm=1 tr=0 ts=69cce85b cx=c_pps
 a=kVLUcbK0zfr7ocalXnG1qA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=qQkTAZUf_KvMCO389TYA:9 a=QEXdDO2ut3YA:10
 a=vr4QvYf-bLy2KjpDp97w:22
X-Proofpoint-ORIG-GUID: RMG9cwjHglpZzQvtdMHPTVGzcZYnqvRE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDAxMDA4NyBTYWx0ZWRfX7tiUOz5wMdfj
 9UBsdznAnJe9FuSWjltdMr+PsCzU7qdmT88DGDlhJDY+PbzLVDF3fbxeIgAu/oTlWr36R5nY0PO
 EC7KtHqS2rKil8doGbw84xgc1TCAvwmVSmkmoDhtxA4cp61N9A3S2WRz8LS8F8zorxzWTNWW2Ap
 wzXn72dxRgMhOEsvJPTS7rukp6UWBqrAxAeCEqB/6WQ9kbtfbejPFVeCXQ4G+7y5t55mI61XYYF
 xohQAb4vaG7J0+U7RtXjADjxt3fpZLbTmB05mM67b4KAxaHnZxpSoENIEPcp4SOlz9hyN8JQRFu
 k2SFJJmebDJ7vLSrfzB3s2ix12KOb0d/jQp71q8Td/MW4gXTiFeJMgjES+CFyjWCfxy5JL5mC1/
 362ImOZtjPHFKjEOOHPBo6OTHrn5ZDKWOPaq/Bi1HuQyxYxsHeLgR+9hvVaMKM2xfFb/n6Ytzx1
 JTDTl5M3UvK2Y3dz4rw==
X-Proofpoint-GUID: RMG9cwjHglpZzQvtdMHPTVGzcZYnqvRE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-01_03,2026-04-01_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 adultscore=0 malwarescore=0
 lowpriorityscore=0 spamscore=0 clxscore=1015 suspectscore=0 phishscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2604010087
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
	TAGGED_FROM(0.00)[bounces-101286-lists,linux-arm-msm=lfdr.de];
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
X-Rspamd-Queue-Id: 0C5A03781E0
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

PMIC arbiter v8.5 is an extension of PMIC arbiter v8 that updated
the definition of the channel status register bit fields. Add support
to handle this difference.

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


