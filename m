Return-Path: <linux-arm-msm+bounces-108901-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cNirLtZTDmrJ9wUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-108901-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 May 2026 02:37:42 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 39AA859D541
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 May 2026 02:37:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id A793C3029794
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 May 2026 00:37:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 14CD42701D9;
	Thu, 21 May 2026 00:37:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MJQzCC9u";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ka7xWfv0"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 207DC26FD97
	for <linux-arm-msm@vger.kernel.org>; Thu, 21 May 2026 00:37:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779323849; cv=none; b=lNQLu6GyAZDdCwslUpPg13fCW0dnCx+SZrGZ2BRttkqFoPMrkpjacFMen/c8ITMsKxGKjcosJfoerBuenlUDM3o/7XzbQ7svLjTgzTxIaBSwG3aFZ+ZsnQW5kM8wRfWA9hkWyJflM1IxXfyD1AlhAiHVT54h2s5/E45IvQklDp8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779323849; c=relaxed/simple;
	bh=uslzc7nmyiyHk64GKvcYr12UhsrifhwRpc28XFd675k=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=MxafGF8td1UfY3FbWL7sHqGH0bVCet8u86mRLqTXCv7auxSrTevnRgdtyR0ZCLP5H5L01dQfb864aT3UwWU0pAiCHxpfAP0FJ5gc9Q5i2guaSr/an5ZZ+cFA3izEx7ZeF625oD0xIbq3cFQgrnmI1oEnpF4RFGmIib2VhYCNpcI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MJQzCC9u; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ka7xWfv0; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64KF8D76748388
	for <linux-arm-msm@vger.kernel.org>; Thu, 21 May 2026 00:37:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=ZitX75AVxgG
	uWGiVafC3GvCVVrQgyZQFWsUqIo6AsA4=; b=MJQzCC9uiqc8UeqSu6hBkDkzW8z
	vMpfXecaBT8O+Z2unJsqYd53WFdDNjf0yvPvSt2lc5Jc0cA7HS39EpnvHAYei+Vv
	ToRM8y06afkNoW9RQV+ckYvOPVOEaAVa/yK7BIDAhif6SREQyJqkCVfyBR0kPME2
	UQX/it1lwZyEfXPRw86AGhmmiFs3wmR2inHWoNLhANr7UvNcFxUKYp2Hq+TEqUV6
	h6XG63mCc4PlYqU6K6Z8X4EFR9VwgqJBShzFKgjOZ14r/dyrTZLuNUxzl/0wOXZA
	9egAiuDYoWQYDFAJuSXuHaQR2C9opgL5+xjxO2Cxck62mRWK+YlZGTkUjIA==
Received: from mail-yw1-f197.google.com (mail-yw1-f197.google.com [209.85.128.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e9fb6hxvs-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 21 May 2026 00:37:21 +0000 (GMT)
Received: by mail-yw1-f197.google.com with SMTP id 00721157ae682-7bd6fc10a42so110139887b3.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 20 May 2026 17:37:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779323840; x=1779928640; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZitX75AVxgGuWGiVafC3GvCVVrQgyZQFWsUqIo6AsA4=;
        b=ka7xWfv0FAfyrpNAaqdCSRcMklpSnGvwAe6535N2U7TdcVAbqkUQNpb8g1S/ueu9WL
         VreJvfT4Kzcvvl6shiOf+4+9e5amTScKJIzYs7BHKTCdJMjd1xATfELperA6m04i+O+6
         al1F3HY4W9ZDQCyi3IlEyEg5OeMggKg5ilo/plibXA+Jol3KdCksBBtw9Btj5mPSf0JG
         B7rnWunfW1cDBKZaBgAKxLMc5h+eFdH5EPM57N83zI3c63t/greSIM7Oq5T3WphAJvDt
         4qIbJPQpOpK+zaUgr9L1jbUY6FN+dJLWcUqjCGvqqOjlDnXfHS77hIT/ECn0z2I1aKpN
         PcIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779323840; x=1779928640;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ZitX75AVxgGuWGiVafC3GvCVVrQgyZQFWsUqIo6AsA4=;
        b=ECPnT26ofCprVp2yTcTn5TSbBse2AK1TOghQ3weDLMA3wEfqAfhoNhxNKB7vDdWJFi
         /SwHLPfu447HY93E3ycNGuhShN5F9CxarifkVtgrFnaOf+bnycLckkAlX92Z0BsSxS3p
         9pugIhvhUOPcMkjXmX1YzuOT3TGLvVR7ju+O+08GaCFp+Yz9YFiVD6vaNufzQ7YaKcCE
         JCMUNPNuZHLDcLbpx8Kl5KYUH7sTc6uNlEHNbpdtS8Pw5hmspDiOqIZ+RwEgjVrmRCjp
         uaalrjFEdacrlXRQ4JKWgCzTrF08V4O/pF2jk25NAXCzjDjtvcp/7SqPCmQ+lMfqj79i
         noiA==
X-Gm-Message-State: AOJu0Yxbj0a1dax432D9pxeJWfeMq6JEF33iScfZzotC3/nUBmuHHPtq
	RKRqX1IgYEBP7Okr7gL8weEPNlZRv8uo1j+7EvFVlHJarQrQavlaRo85Dh1AkZY2BN/rYbVfV14
	wfUSg1gXGeyevMmghTMAdfd8wmOm72SiqJvAXuXbzWyLVXV0rMaZUXjaQ5acZaQnzgwNP9RRvIp
	1U
X-Gm-Gg: Acq92OGGNQfq/jVmmk7mRBn4wXCsGtPc3d1CF/6q2WtlDAHRT0MSNe21zHft5jcdN54
	90js3e1XWgPQ6RLC6kaMxwFO0yq+tztmFbZD2OpSK/PmG820qX6VKPyUUXbrHQkKEDcecoZ+IVI
	bXnGSSEsph2EoV+8+GeBv+HVHvuM0PxA/ljEnlz2ZjAhz6ClFV6KCNWIJ9NrxBrGViCbBI5HUc/
	FgMlRYn+6dRuFIw19RCwy+1GviW1biddHEaOYt3ZD4YaMFOJPz3ELIfxPFdXBNwLjGnN+CtXU7V
	ljf3lqS+xdUgtduNzQihzGoRg1pdAYaSd6/t70Yw45kTC/RQ3FHV0K/sn30V8/VAlPu3ux0Gu4y
	7irPIw5tLsh1Nj9rg7ih88hI5c2njBQOALwBLM4TTAtj0SRj1dj4U1jXikljsFSQKeVC5aksI7A
	bxSTYPp962buv0DLk=
X-Received: by 2002:a05:690c:e07:b0:7bd:98cc:a675 with SMTP id 00721157ae682-7d20dcf95efmr7291917b3.47.1779323840341;
        Wed, 20 May 2026 17:37:20 -0700 (PDT)
X-Received: by 2002:a05:690c:e07:b0:7bd:98cc:a675 with SMTP id 00721157ae682-7d20dcf95efmr7291487b3.47.1779323839867;
        Wed, 20 May 2026 17:37:19 -0700 (PDT)
Received: from scottml-Latitude-7455 (107-198-5-8.lightspeed.irvnca.sbcglobal.net. [107.198.5.8])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-7cc991c98d9sm60545717b3.10.2026.05.20.17.37.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 May 2026 17:37:19 -0700 (PDT)
From: Michael Scott <mike.scott@oss.qualcomm.com>
To: linux-arm-msm@vger.kernel.org
Cc: vkoul@kernel.org, neil.armstrong@linaro.org,
        dmitry.baryshkov@oss.qualcomm.com, wesley.cheng@oss.qualcomm.com,
        abelvesa@kernel.org, faisal.hassan@oss.qualcomm.com,
        linux-phy@lists.infradead.org, andersson@kernel.org,
        konradybcio@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, devicetree@vger.kernel.org, val@packett.cool,
        bryan.odonoghue@linaro.org, laurentiu.tudor1@dell.com,
        alex.vinarskis@gmail.com, linux-kernel@vger.kernel.org,
        Michael Scott <mike.scott@oss.qualcomm.com>, stable@vger.kernel.org
Subject: [PATCH 3/4] arm64: dts: qcom: x1-dell-thena: mark l12b and l15b always-on
Date: Wed, 20 May 2026 17:36:14 -0700
Message-ID: <20260521003615.1260844-4-mike.scott@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260521003615.1260844-1-mike.scott@oss.qualcomm.com>
References: <20260521003615.1260844-1-mike.scott@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=do/rzVg4 c=1 sm=1 tr=0 ts=6a0e53c1 cx=c_pps
 a=0mLRTIufkjop4KoA/9S1MA==:117 a=cdagev08qavQYXHyx3V8vg==:17
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=CbK1FIr4-MOfYfEwsVEA:9 a=WgItmB6HBUc_1uVUp3mg:22
X-Proofpoint-ORIG-GUID: aZJymPea6Pl7dD6y7sm6zPhm0Ki39-T6
X-Proofpoint-GUID: aZJymPea6Pl7dD6y7sm6zPhm0Ki39-T6
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIxMDAwMyBTYWx0ZWRfXz1m08PCWOdUr
 AWxjwmcHQk9JCJCoUQSu8kni6vJJ7m2u5UFld6h8z2IqiDQodEwDZVDoB0nVOQ2t9r/bf/KxrrV
 sWau6Ozw38dSiXDdCUKLY9FJZ+uL+6geKVLIoupN4lpmqEdrJmKJRCOd+M3mlCeFj32z/PLmT2S
 xoy83z7qIR3pnULDO6mDnatRWIorDt2fzbGvVixIw5WpyJhyc2oo9CFz4RulBPM7NTs6VeWh/vF
 JYMWrTnEM1w2SjebTmzos7qENl1sru2K/Q7TdtN6nNYtCr3EVX+hBGTHexFPOZMymWZ4yGLs3tw
 TP1K8A/6ezgBFZXYmv+oQirDA73zOF+qvgZhnc13GpiNPE4lOZMFO6taMJwgpmmiBo5I2sGoQys
 RG/KATrwM7/nLiQ0jif8u3/KLej32mpVETQgQwohRb0WsrsWdaCmptMuMYf8338B88JSKteZWxh
 8Ef0HXIcFiwRbt638wA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-20_03,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 lowpriorityscore=0 bulkscore=0 suspectscore=0 clxscore=1015
 spamscore=0 malwarescore=0 phishscore=0 priorityscore=1501 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605210003
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	FREEMAIL_CC(0.00)[kernel.org,linaro.org,oss.qualcomm.com,lists.infradead.org,vger.kernel.org,packett.cool,dell.com,gmail.com];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[21];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-108901-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mike.scott@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 39AA859D541
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The l12b and l15b supplies are used by components that are not (fully)
described (and some never will be) and must never be disabled.

Mark the regulators as always-on to prevent them from being disabled,
for example, when consumers probe defer or suspend.

Note that these supplies currently have no consumers described in
mainline for dell-thena beyond the audio codec (vdd-buck/vdd-rxtx/
vdd-io on wcd938x), which can release them when the codec goes idle.
The board-level gpio-fixed regulators that feed the Type-C retimer's
VDDIO and other rails are not described with a vin-supply link, so
the kernel cannot keep their parent LDOs alive on its own.

This mirrors the same change Johan Hovold applied to every other
X1E80100 board in a March 2025 series; commit 63169c07d740
("arm64: dts: qcom: x1e80100-dell-xps13-9345: mark l12b and l15b always-on")
is representative. The dell-thena board file was introduced four months
later and did not inherit that change; this patch closes the gap.

Fixes: e7733b42111c ("arm64: dts: qcom: Add support for Dell Inspiron 7441 / Latitude 7455")
Cc: stable@vger.kernel.org
Signed-off-by: Michael Scott <mike.scott@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/x1-dell-thena.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/x1-dell-thena.dtsi b/arch/arm64/boot/dts/qcom/x1-dell-thena.dtsi
index 96e7a18366dc..d93b704872b5 100644
--- a/arch/arm64/boot/dts/qcom/x1-dell-thena.dtsi
+++ b/arch/arm64/boot/dts/qcom/x1-dell-thena.dtsi
@@ -589,6 +589,7 @@ vreg_l12b_1p2: ldo12 {
 			regulator-min-microvolt = <1200000>;
 			regulator-max-microvolt = <1200000>;
 			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+			regulator-always-on;
 		};
 
 		vreg_l13b_3p0: ldo13 {
@@ -610,6 +611,7 @@ vreg_l15b_1p8: ldo15 {
 			regulator-min-microvolt = <1800000>;
 			regulator-max-microvolt = <1800000>;
 			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+			regulator-always-on;
 		};
 	};
 
-- 
2.53.0


