Return-Path: <linux-arm-msm+bounces-112601-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id TqJ4LcRCKmpolQMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-112601-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Jun 2026 07:08:20 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 563AF66E642
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Jun 2026 07:08:20 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=YVFd+f0p;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=KzITkFSu;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-112601-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-112601-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id BCED7301435B
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Jun 2026 05:08:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 48418359A81;
	Thu, 11 Jun 2026 05:00:50 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7FB338C2A0
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Jun 2026 05:00:38 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781154049; cv=none; b=sn9QGkQvXt6SqgtTE40okV3qQqexXfckr/J1oy96NPP4S+A/9EA7lwJ+Y3qVuRxitNgmeSiQre5Hi1ahK7A5tYJVsFw6UV/VoBGTxp6dbaKd8bQOdsTMZrNyNBUVdZySyyngs79EfTAMo7sR47hDHfrce2ROGkd5EMGPZy4Gdew=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781154049; c=relaxed/simple;
	bh=qulQeLlsdi2L9cgTVMM2ifRrI3vP1mJxG3+XGafHl1w=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=W4tKpa87aifr6MySBPlcE9+U1SYGeE0Y9i2ilzAkrSRppuReram17zzy3+kPtCt/t2D9qNxYBUTEigdIDMosL8iqyYeGFf2j01GOitBnUisxnVcibV6YmzRr5/Yfz+CoTFUNLrY9RZfAsuq1Smixysx30uI7QdN+f7Ghdeu+PxY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YVFd+f0p; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KzITkFSu; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65B0Nb1M3132319
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Jun 2026 05:00:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	yG71hJdidD01pZim8qt5eu3WDh8+/Nc00tfgnxfvMhI=; b=YVFd+f0pa/xVpfs6
	MCaLefhgK7vNkoDYqjWnY0kWHicpKXUKDQ4f92mhJii0cfnZG+4ZQ73bjm+W0hxk
	jAY8mOqy5clrU8PItrlvXkfqz/p/0/XzLCX0S+YqjHz2kaiCZNIxzIXbDmS8F4tV
	2FFAlb8sKFifd4Y0XYiB8CIo5Ww5bCFAlx+w0XtHMesckN3gpAFj4mMhHb9I0QNs
	Qu2CKWzUOVQFsgO7h3SEOzWWQp3zWAzJmgZKX+Pg0ya6cJDZKQX3kqSjApHiw+vp
	uicKL5nCK+kaql6eVcfAaiqs0d1TqcwTZt3EvjAcWRvkKrq9/p7qpYOuH1eNY/At
	7ydDSQ==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eqe6shqnc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Jun 2026 05:00:37 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2c0c36f1cc0so137245855ad.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 10 Jun 2026 22:00:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781154036; x=1781758836; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yG71hJdidD01pZim8qt5eu3WDh8+/Nc00tfgnxfvMhI=;
        b=KzITkFSuk1duNqgGIrggHXO9918NwsZbXlUpvm+Y3oIwnMbqicZTujadPmY884CZtx
         CYe6hAUksK1dTqMae+0bfGKvnG7xCrW6zL8ZyyPl9TomgIIa4L5SxQaBbL5vNWczi9UG
         w/oULSmsBcSpO+rY67wjWYXGk4AhzCwGFVwGzUSVJV2ywtk+yuRTNdYerTw+hcHKYzua
         nafzOmUK9loCyWVUdrT0vsBeYCKHX3mZPial4hyE8+vW/9fBM/8B5UaGB1Bq+s2oLu0J
         Iz7HI8Ju+qCE8S2irf4CoZZZ21oV4UC9B7CrTLEw4GIVgsTGnJRsxXjsInfFiJkV4SNw
         jWoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781154036; x=1781758836;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=yG71hJdidD01pZim8qt5eu3WDh8+/Nc00tfgnxfvMhI=;
        b=odn0a03eep4EQTh/dDSazyRpT9iHMH5as7DVRJjmkJNhhAtL9yfonb4v0Eeq8zC6Gv
         LfeB3rx9Lcs/CIJmO7PgcZFj3sgz95gTT7ATqmFUuv/RKqz2YR90PjzQrm6T/qn/KezF
         eTCFFitCSnAuXk0k1W7A3BveIOoHUjJf/ts/agYDVOUhEBl8z7wVW8N86aZXV7sM/q4D
         kF+laISoIUAZye/GJal91wDEFpZKpJeMlgLzViebYjC8v1EbF+looHqrFkzV0mAQ4soN
         9ZB1+/EIDxj8BV/ksMlRiRu8RKDLP6cQJxAHc2CqUWS4vFSk1HA0XFwFkLvMm2+CBDr6
         pKiw==
X-Gm-Message-State: AOJu0Yy4V0adCpmIziR9dtCLMolSlUFxy+HLtXDcgNZOs3E+fgkdV1aM
	1H+g3CdiRXm0bCUgawXkJ0zSZtMkrwxj8D9eEZgGKlN2VLQQhy/cZrHnGbMFyedNYqisBYjKJc7
	bVcOxaSkYBSwjDtzn1ZKXlqeIkdk304TM2RGPVXQw4Nv7nIcxThkEWILqRQ/X2+3eBYXLCIdoKV
	BS
X-Gm-Gg: Acq92OEaRxv4hllhpti4wHIXO5QlC4K2dsTOQEbkRJVxiqXt2CriLaeCMfvGu53GZfM
	sgUlFTy5DnKCuXHqN1QXaX/SKPk4tMcoudYUnMdDbUv9Z08MDVuhGUP0tC+ihaX37KEkrjrdmPT
	ntXoNzYPOuDZag3BWCimYJqmqcjdtLuWWKfkPWJizjp3TZoQ4/F0EbobPZ69acH7HDfYLNvt9tk
	BqjNlPUW8dx031mxLsNJQupQboAfoDcmTDHnSI3X2g4Z4c8OznLb637yKoVVCXq1YoyxRwO5Cpm
	XHqGdLyanTro8koCrEnixt+K1QyZOKagxENrI+riGbb2/RE7wR0pT0t/22ErSnKrueQ9GNfeMto
	AMVhOXD4k/IJd+Mfq0q+mqysmyILyQ9fSKnB/wY1FzpVS1dnFh/r65n1+bbA7yPuisZI=
X-Received: by 2002:a17:902:ef45:b0:2c1:1aa7:b17e with SMTP id d9443c01a7336-2c2f2e5f6b4mr14526125ad.30.1781154031478;
        Wed, 10 Jun 2026 22:00:31 -0700 (PDT)
X-Received: by 2002:a17:902:ef45:b0:2c1:1aa7:b17e with SMTP id d9443c01a7336-2c2f2e5f6b4mr14520455ad.30.1781154026234;
        Wed, 10 Jun 2026 22:00:26 -0700 (PDT)
Received: from hu-krichai-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c164f8bc5asm276188335ad.27.2026.06.10.22.00.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jun 2026 22:00:25 -0700 (PDT)
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Date: Thu, 11 Jun 2026 10:28:59 +0530
Subject: [PATCH v2 23/37] arm64: dts: qcom: sa8295p: Move PCIe GPIOs to
 root port node
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260611-wake-v2-23-2744251b1181@oss.qualcomm.com>
References: <20260611-wake-v2-0-2744251b1181@oss.qualcomm.com>
In-Reply-To: <20260611-wake-v2-0-2744251b1181@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        cros-qcom-dts-watchers@chromium.org,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
        Krishna Chaitanya Chundru <krishna.chaitanya.chundru@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1781153928; l=2675;
 i=krishna.chundru@oss.qualcomm.com; s=20230907; h=from:subject:message-id;
 bh=qulQeLlsdi2L9cgTVMM2ifRrI3vP1mJxG3+XGafHl1w=;
 b=fBV3GiKdV0a55h3xYCW72AeLyAejpU53bs/YkWn2envrhuGiuJc6r1LN9FjEoUwz4OjMm1J+S
 FjRgoLHfGLADmHvyniTOzBlM1yh0JQiI0qdZpodlQOZ1wLeVZQIzQdR
X-Developer-Key: i=krishna.chundru@oss.qualcomm.com; a=ed25519;
 pk=10CL2pdAKFyzyOHbfSWHCD0X0my7CXxj8gJScmn1FAg=
X-Authority-Analysis: v=2.4 cv=GbMnWwXL c=1 sm=1 tr=0 ts=6a2a40f5 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=xzbAzJKGZiqbpjPgTfkA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-ORIG-GUID: 51j4ViNnR7HtuOVQ6pvFhf3uiYS2P__i
X-Proofpoint-GUID: 51j4ViNnR7HtuOVQ6pvFhf3uiYS2P__i
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjExMDA0NiBTYWx0ZWRfX4ni/pu9zasqA
 MxWc0fYJ+J/OhwU1wgVXLTgdcj5hUYqQfSoEbOkSJ9EhTbxFx3rcqrVtG6Twgyon3qYVCRsmwOw
 QWmtI1VWDkPtF2a4sS/63gYwTz1FiZWdo2dJWayNIo58WLCKh+zwSItVa6CWNzf/pxtEirlGx8E
 yy5DjZATU5qr0z8p/rgbXGYIGVuZmMY2eYSAb/l86LwJa4SAGyBqsLMlva/JRlRLjEWmaRiWUEq
 9s434ULE/4ewHDsJnDThSBVr9zD5XYCOXTvV/nFnd1NShNaj3h5Pad5ExkvpeO/O6KzexhW+fZl
 c6xBHxG8lTdfgF7dvlgHjoFt2lp1xtDu2PaLN/euey4IL1G92kOzSnW8v6F7WCKIyvDL0AzvK4k
 3JlyLM53UoovfJZG/P1Xz4jJUnQ50ZGbOm/3XJ5+y53l9uX+mKT1ulHODM1bouQZi7lfCoJladN
 ue8vRuepjX3kgbxioCw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjExMDA0NiBTYWx0ZWRfX+nx2eJcrJGrm
 eJ1Fdqdioh1k/50SPplIzZAWrF52jlXDLMdFi4Iy2ltXpJI1bwbkhnqORA/WBAcCSrcJsoGOSWJ
 /WfY5zN8x9qFKBW1zS+egll4bk81Mps=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-11_01,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 malwarescore=0 suspectscore=0
 priorityscore=1501 bulkscore=0 adultscore=0 spamscore=0 impostorscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606040000
 definitions=main-2606110046
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-112601-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[krishna.chundru@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:cros-qcom-dts-watchers@chromium.org,m:conor+dt@kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krishna.chundru@oss.qualcomm.com,m:krishna.chaitanya.chundru@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,qualcomm.com:dkim,qualcomm.com:email,vger.kernel.org:from_smtp,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krishna.chundru@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 563AF66E642

The perst/wake GPIO properties are per root port and belong in the
root port node, not in the RC controller node. Move perst-gpios/
wake-gpios from the &pcie2a, &pcie3a, &pcie3b, and &pcie4 controller
overrides to the respective &pcie2a_port0, &pcie3a_port0,
&pcie3b_port0, and &pcie4_port0 nodes, renaming perst-gpios to
reset-gpios to match the binding used in the root port context.

Signed-off-by: Krishna Chaitanya Chundru <krishna.chaitanya.chundru@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sa8295p-adp.dts | 32 ++++++++++++++++++++------------
 1 file changed, 20 insertions(+), 12 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sa8295p-adp.dts b/arch/arm64/boot/dts/qcom/sa8295p-adp.dts
index d28d69162427..512de3597581 100644
--- a/arch/arm64/boot/dts/qcom/sa8295p-adp.dts
+++ b/arch/arm64/boot/dts/qcom/sa8295p-adp.dts
@@ -453,15 +453,17 @@ &mdss1_dp3_phy {
 };
 
 &pcie2a {
-	perst-gpios = <&tlmm 143 GPIO_ACTIVE_LOW>;
-	wake-gpios = <&tlmm 145 GPIO_ACTIVE_LOW>;
-
 	pinctrl-names = "default";
 	pinctrl-0 = <&pcie2a_default>;
 
 	status = "okay";
 };
 
+&pcie2a_port0 {
+	reset-gpios = <&tlmm 143 GPIO_ACTIVE_LOW>;
+	wake-gpios = <&tlmm 145 GPIO_ACTIVE_LOW>;
+};
+
 &pcie2a_phy {
 	vdda-phy-supply = <&vreg_l11a>;
 	vdda-pll-supply = <&vreg_l3a>;
@@ -472,15 +474,17 @@ &pcie2a_phy {
 &pcie3a {
 	num-lanes = <2>;
 
-	perst-gpios = <&tlmm 151 GPIO_ACTIVE_LOW>;
-	wake-gpios = <&tlmm 56 GPIO_ACTIVE_LOW>;
-
 	pinctrl-names = "default";
 	pinctrl-0 = <&pcie3a_default>;
 
 	status = "okay";
 };
 
+&pcie3a_port0 {
+	reset-gpios = <&tlmm 151 GPIO_ACTIVE_LOW>;
+	wake-gpios = <&tlmm 56 GPIO_ACTIVE_LOW>;
+};
+
 &pcie3a_phy {
 	vdda-phy-supply = <&vreg_l11a>;
 	vdda-pll-supply = <&vreg_l3a>;
@@ -489,15 +493,17 @@ &pcie3a_phy {
 };
 
 &pcie3b {
-	perst-gpios = <&tlmm 153 GPIO_ACTIVE_LOW>;
-	wake-gpios = <&tlmm 130 GPIO_ACTIVE_LOW>;
-
 	pinctrl-names = "default";
 	pinctrl-0 = <&pcie3b_default>;
 
 	status = "okay";
 };
 
+&pcie3b_port0 {
+	reset-gpios = <&tlmm 153 GPIO_ACTIVE_LOW>;
+	wake-gpios = <&tlmm 130 GPIO_ACTIVE_LOW>;
+};
+
 &pcie3b_phy {
 	vdda-phy-supply = <&vreg_l11a>;
 	vdda-pll-supply = <&vreg_l3a>;
@@ -506,15 +512,17 @@ &pcie3b_phy {
 };
 
 &pcie4 {
-	perst-gpios = <&tlmm 141 GPIO_ACTIVE_LOW>;
-	wake-gpios = <&tlmm 139 GPIO_ACTIVE_LOW>;
-
 	pinctrl-names = "default";
 	pinctrl-0 = <&pcie4_default>;
 
 	status = "okay";
 };
 
+&pcie4_port0 {
+	reset-gpios = <&tlmm 141 GPIO_ACTIVE_LOW>;
+	wake-gpios = <&tlmm 139 GPIO_ACTIVE_LOW>;
+};
+
 &pcie4_phy {
 	vdda-phy-supply = <&vreg_l11a>;
 	vdda-pll-supply = <&vreg_l3a>;

-- 
2.34.1


