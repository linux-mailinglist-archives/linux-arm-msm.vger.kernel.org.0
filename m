Return-Path: <linux-arm-msm+bounces-109971-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6IT+G/C+FmrOqgcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-109971-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 27 May 2026 11:52:48 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id D5A315E229A
	for <lists+linux-arm-msm@lfdr.de>; Wed, 27 May 2026 11:52:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 2C78F3181728
	for <lists+linux-arm-msm@lfdr.de>; Wed, 27 May 2026 09:45:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BC78E3F0A81;
	Wed, 27 May 2026 09:44:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DdP+KHXS";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NNY+rTYD"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EC863F0747
	for <linux-arm-msm@vger.kernel.org>; Wed, 27 May 2026 09:44:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779875093; cv=none; b=ceTbK+JWaPvmuGpwh0hpWJzZ4XFPWCx3XvojPL0uQLC/odzK9EJCwBeC9T0VS+iM3iJgxoUDAQTi7KI6pZ9jeRxJEKB1ASJyUkq8DmKqir2s7gT8VhE+iSwrdHQnBlUAxHPkTx7+RZuDyIFoQGi5bbg0rnJAs0H2JrjA2d2dBDQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779875093; c=relaxed/simple;
	bh=AfGMWkQSJ7LzUVaJkCKm4gZXr4bFLsauZkt3pqx+AOQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=TQO/RBlzQxG/YyorSLdPMxogO4RIsKOCGrioKLxtP08CSwXXV8T0YLapa9PssawL+we3idI5oYBIMO8BINxEVV0fbmx/yE/rrW3iiL5gMQXt1jKKJB4kSQSzlLpaTcPwAokRfpZvz56uFbXTg8u31ri77tM5t9/l5GMo7g6n0qU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DdP+KHXS; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NNY+rTYD; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64R8mgce4109057
	for <linux-arm-msm@vger.kernel.org>; Wed, 27 May 2026 09:44:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=r7TCBXkC6rN
	bkZ2Na9DbN/Yo7WelMgj9OYLFhnu779o=; b=DdP+KHXSGhCIO8FWsI01l++TIwe
	XbGTk0G1s1IpYJbPw2US7xe7AZsLvO0heYjJPF8VJXiont7pe6JP/zxkGPvicBpy
	FFtKPSBdsdwygu8utwlTjnBXHnK3Uj0UiJ4tCNc2Sl5NmIHQ/V/QzOX4mUfXF4LN
	f0kPSZ12mvKngDPjurfKAf4q2T8HxzCSwLFnxJESlAhZEjRlVDUMmldw6JDY0XDd
	z1IbVuSHf0Utm+nX69mqhihQZotIDOYa1RZS6gpukxtE9UlZc7JejzqRKKWtimWJ
	ia59IniKwQ3lpaExSyNsOlpt3UZVhcuMBHt2S3Z+0HBA59dlQnYhy2eLpTw==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4edefukk7u-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 27 May 2026 09:44:51 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2b9b8137828so118135255ad.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 27 May 2026 02:44:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779875091; x=1780479891; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=r7TCBXkC6rNbkZ2Na9DbN/Yo7WelMgj9OYLFhnu779o=;
        b=NNY+rTYDEX5bqpXghKBETrUMOg7gFpa0CgsyKGxLensu0IbGn2swLP1mU2OlHZiq9C
         320amKWadL3s0FxJwpiVjBwVJPGggYIqVzGWO6MpGGQyPv15DgQX6joAF+ADhOyY+3qa
         sVQUVMs3r5JuJvuVeHpVzWVChUKmy2lW1ivst4houra5TbJNnsEDcH3Rlm322IjWIvUM
         pLEqV4xF3U0xukfub12kOYXpi+3v8s/UhEsi5/t5ttfI6b/NvrbzqIn5uiEAJypZcGuS
         5bhQ6r/QL/0qqJs0sXBLMJKTLvjlX8eYIFd9C1LSS0SlLVI4jdd//7yGsqADl5/hNHSX
         xqQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779875091; x=1780479891;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=r7TCBXkC6rNbkZ2Na9DbN/Yo7WelMgj9OYLFhnu779o=;
        b=fjrBRQB/X4oie1mA/rxBVyrXJ5BHAkrNhFQNJGRfh3akcE10CuhDbtacuex35uEz9+
         gyquh4VZA+xkwhFADuWz4KJ2I4Y8TG/p9OhV842W7TIVs92Qr7lJ+fMi9SF8FfHUHQEw
         2BPQ5a8Rr9HrZqJcNFkZfPsbGPQYpEoK9NGCAMlPyxIpbBBSQjKzws6YbaXtmFFMpOST
         jqLHl4o9R4lGuGtuAtfINUnV+Y+1T5CoPmQamhmQDdSk9zEpwI2e4HQ5Ino/q1ri3zYU
         ApgVehxZbQmGKcN1QrUM0rlIVLWGS2eUzVIwcZI0RKw84GVBW7Yv0fP5dP7mQMfDmKdZ
         Z5Eg==
X-Forwarded-Encrypted: i=1; AFNElJ8mbtFQnY8Uz0a+UMeIAEHLMb8SNZLP5H6BiwSewVPfIRJ/bphmoLTLQnm6r9Tyvu81mqnf2fCcxVB1tKLX@vger.kernel.org
X-Gm-Message-State: AOJu0YzOA+UspXM2Y9nJku3wwsJOa/yvH5CiBjdRitVJb80eU9OXyx4b
	Wsi3hDZn8PPGA59Uy0x+KRpigo34LrENStJ+UsmfxS5OB3DXpbBr/GSHI9ni/+u/GBTcBqPIp1I
	VMw/So2OlC1SS4BaAsr4cA0zXueKpNRa6UIoWkgyjNFMt1Rp3ee3Lp+pIBKjJ0dpm0cuS
X-Gm-Gg: Acq92OE6750qUoyva9uPcgKoKZP1p4Bc28jIwm5btNfTyqhJagRnDJa+4WK+V8/2Sg5
	v1SeDtbGKJjchA1os9pjd+taslkECzK31XHrkCvs4tVUuHz6P8P36bYdUzwnQfMSuOECWce7XuL
	nVSKxRfNHwCRS7LNmAkXLOrA24WKY0xTiF/B7NzDsn8F5xoYTYPhJ6qU41c/9U1zcYnXgsX1OMY
	dzSisreJYmOZxFR7/C2fI9Kub5NsC0enIMdZttwGSkjfuhCvpPSyeJ8qUNjFjLeY/rlgbNdmRYQ
	zDocmlWSvC1VjkpBP+YB1LiecGG002Fp84V2lL06+k4UFb/EsQzJaFLSt714w2ZZUwuGLpv5du/
	fdN3pnzZnR6mQai85Gbop2lAustupZEjGlwd8tOpVA7Ef5IAS
X-Received: by 2002:a17:903:2bcc:b0:2bc:b80f:677e with SMTP id d9443c01a7336-2beb069970bmr238800685ad.25.1779875090580;
        Wed, 27 May 2026 02:44:50 -0700 (PDT)
X-Received: by 2002:a17:903:2bcc:b0:2bc:b80f:677e with SMTP id d9443c01a7336-2beb069970bmr238800415ad.25.1779875090077;
        Wed, 27 May 2026 02:44:50 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2beb58b386esm154738185ad.44.2026.05.27.02.44.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 May 2026 02:44:49 -0700 (PDT)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Thomas Gleixner <tglx@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: cros-qcom-dts-watchers@chromium.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Subject: [PATCH v2 17/24] arm64: dts: qcom: sar2130p: Reduce OS PDC DRV span to 0x10000
Date: Wed, 27 May 2026 15:13:22 +0530
Message-ID: <20260527094333.2311731-18-mukesh.ojha@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260527094333.2311731-1-mukesh.ojha@oss.qualcomm.com>
References: <20260527094333.2311731-1-mukesh.ojha@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI3MDA5MyBTYWx0ZWRfX18yVOcIx5FOR
 Z8Nw9MdEo34x66A5+R3qJjOnSjLExnSR6ba3XCuY5NGxTXxqJYbomXj4U6a+yNG8tVoLzNmUL3T
 VMkRzaPZ6YmOhDb1bdQcgV1hPW8owb6Kjb3loCm5JjQxY5WkAWkvAfdDinAv0rnvxT6E/LKj9xv
 7tFRycSI/eZzkRsJBMjEJG0mXqA5NQCSox2HnxqFTV3Kdla8uOVP0Warh0Jh0l0VHI+zVedqlnH
 3TPIKoT+NQuAwb/EjhaZjJssLh16ml/zslUcJombdg9xbOZ1kNNuFQqhFdG73VaKqa6f+/3QQLI
 Oa9H4w7LCVXiXucCSZLsTqajTBzv7tld1rjoPo58JkbsRK9aIJWXbYi/YIrygyWJmUe837amssb
 lMegN+m2cNQaPoQzYn0XdQTWitLnkM91sZOOvGqfn5D4P8h/js66oXPNbER99xk1jgduybODbmT
 iU0hKmXp1O5++unzlSw==
X-Proofpoint-GUID: 3DPlsnK4HlCjykB3pW2qzIAx1dpPABUy
X-Proofpoint-ORIG-GUID: 3DPlsnK4HlCjykB3pW2qzIAx1dpPABUy
X-Authority-Analysis: v=2.4 cv=cPnQdFeN c=1 sm=1 tr=0 ts=6a16bd13 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8
 a=Kg2GlfR0pfIXhFNuCKsA:9 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-05-27_01,2026-05-26_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 spamscore=0 adultscore=0 phishscore=0
 impostorscore=0 lowpriorityscore=0 clxscore=1015 priorityscore=1501
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605270093
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_NEQ_ENVFROM(0.00)[mukesh.ojha@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-109971-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,af00000:email,qualcomm.com:email,qualcomm.com:dkim,b220000:email,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo];
	RCPT_COUNT_SEVEN(0.00)[11];
	NEURAL_HAM(-0.00)[-0.997];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: D5A315E229A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The OS PDC DRV register window on sar2130p spans 0x10000 bytes. Reduce
the size of the first reg entry from 0x30000 to 0x10000.

Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sar2130p.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sar2130p.dtsi b/arch/arm64/boot/dts/qcom/sar2130p.dtsi
index d65ad0df6865..c4d48f657e5d 100644
--- a/arch/arm64/boot/dts/qcom/sar2130p.dtsi
+++ b/arch/arm64/boot/dts/qcom/sar2130p.dtsi
@@ -2417,7 +2417,7 @@ dispcc: clock-controller@af00000 {
 
 		pdc: interrupt-controller@b220000 {
 			compatible = "qcom,sar2130p-pdc", "qcom,pdc";
-			reg = <0x0 0x0b220000 0x0 0x30000>, <0x0 0x174000f0 0x0 0x64>;
+			reg = <0x0 0x0b220000 0x0 0x10000>, <0x0 0x174000f0 0x0 0x64>;
 			qcom,pdc-ranges = <0 480 94>,
 					  <94 609 31>,
 					  <125 63 1>,
-- 
2.53.0


