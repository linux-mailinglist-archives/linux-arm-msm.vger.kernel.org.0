Return-Path: <linux-arm-msm+bounces-90107-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AFytLSiIcWk1IAAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-90107-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 Jan 2026 03:15:04 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 803E360CA0
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 Jan 2026 03:15:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 7FCB7407B84
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 Jan 2026 02:10:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B70383803C5;
	Thu, 22 Jan 2026 02:09:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BZMT8Z6a";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="AvcLSG21"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C20636AB5D
	for <linux-arm-msm@vger.kernel.org>; Thu, 22 Jan 2026 02:09:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769047769; cv=none; b=lRs+J9pd1HRIfrPmrHDy/+aNEqlO03HBHXaTuWuXMg/Pv1B2Vws6Lj5Oo09yG5QFrECMZNfwPL2tAZRrge6LWafCtiyZ2AZzQrBtYvPLORWbyOm9j4Q1mIa3Wd4c8NPPEz+FNAZcQ/i05NLv7EfTWZmXiMw3kfbrbFhrhwEVNlI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769047769; c=relaxed/simple;
	bh=U3SBm8Q4F2Lqg46nftP77Qbyf63TqJWnGptxyfW3r6I=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=kcCfx4fBvC4kHGCesqnu/dYy5ojn+F49J6on168Fo8jDnJXhdFkJlQAKc7vjhVK6LhseL8wlnsefxnHC4RLtuEgN3oursMpKcXlXFamKRh3VxASe4wobrtDzTbFqLnuJTPrBDZ2JnkdID9V5iMllKZXSwjPkcYOVaHTc5pui0kI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BZMT8Z6a; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=AvcLSG21; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60LJ1VL93902145
	for <linux-arm-msm@vger.kernel.org>; Thu, 22 Jan 2026 02:09:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	2hUWnOSTgpb39HiN4iScZAjggx5kZGetEG2O1nLvCqo=; b=BZMT8Z6aMJtCZ+DZ
	wUklgb+eqJn24hQv0mrEEtwD7crXLJ6a/eRC63tiFNslClsoD58FML5FJmCgLPml
	+V4f3R/4f7IUhJEEvDsmom518hdnVAyzFZILBU9DekztZoGZZaYsxKeTWIgkWYVy
	Y+xOvKS1algFUWKM4Et3pkWLcMMPe9TBu9jLGFXVK+GEsThGuwAXMtNMrnpBqRQC
	cYGlhPS7yYd0QUIi5BeG4XRfCcRlhIVeGpL9Mgvh9cVpJQIyz2UayEF5vZiLSR2Z
	/wDNKY102NxP+Ikyp4blk2IuzQ1iH1mJLdFEh9jnJOTdGPlP6J6GI8BMV0ymE6I/
	vGcL4w==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bu4khh1t4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 22 Jan 2026 02:09:21 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2a7a98ba326so4656305ad.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 21 Jan 2026 18:09:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769047761; x=1769652561; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2hUWnOSTgpb39HiN4iScZAjggx5kZGetEG2O1nLvCqo=;
        b=AvcLSG21TshtbJL0SaLulxFmjnvVvx+bGg+e112a0iE6JxdNn6FjpBWK54/JgPx2/X
         4F5HwB1MH4VUQclIJ6YFYyoU7qcO7DLIyquDRzbtfhx5UetDzjNF8w0k+i4FvPLQiOSD
         y8gGzkAxAtfbLtqlav7N5zGWe0ojzvZZVry5d6UA8KguOLQEpcTokf8M5rWB87iVsQc7
         VosiGYziAaOunyN4Ct2En2HoYAwKzimiK+N8Gl9+/IUZfirCc0ieG9zN/yld5a/7p5uW
         eRbjaI6TmtzdUGY6VljMA1kGWqPwJLDUTlxCBzGOsnPSvizQ56wPS3hfP+KXbq3gSAHP
         rvyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769047761; x=1769652561;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=2hUWnOSTgpb39HiN4iScZAjggx5kZGetEG2O1nLvCqo=;
        b=IIzBuQg9DaFLntVjGmOkQ7KWCMYG0d6zpbjcbBf8RSEX0r/Bd2y5tcDVeYoLZ01Ivj
         48VEJr2NvgWDtVd2dicWkkniKo05VAgL9fOYhqpUuiz/LceZlPnDz9QtB9z3t1XrEwSf
         1xjcARlrn97uHSXeJ/QS156U5ptp5TwizRF4wvMFdwPDhfMuXEIFgE/DyGkOb/6awNFh
         UrG2dl+upC8fgXLW6MURmUQLIQiL3hyTmjc7FHbH6P7Rbct06WiEE+yLY8HcRxOYobRI
         VZVsyMQWjZpSljUdVUDLJmSX+j3yTN54BBU3iaNiqCkcpS5sAjLReh+9Uzb+18PpDQgb
         wMNg==
X-Forwarded-Encrypted: i=1; AJvYcCXWBzaPDXRjyQPPgGrwaTmCAzeXhUxrRzmwfSNNa8bh4L3IcCmVLEupP4/dLgLmyNycJOhw1Xlgx/eWx3rX@vger.kernel.org
X-Gm-Message-State: AOJu0YzlZDMYzBN28NrwcPh02pnL9AcOupsP8XXXYmHulogE0xEzb3qN
	CXrrcSSt/4nunXLdvJavD40GBUTZcIwRXlxt1vDs9xicSAcuRnhioprRsuHbknNHOyhKQNpjZT+
	6cLxEIde9vwv43lRyKVr//YpMq4dYTwv3O2Kp2WEE0xAq/hQMuIyeyjhbu06OSwspHyfn
X-Gm-Gg: AZuq6aImiz1L5C+U47fHr9cQ4WxY0lEB1W4Naj7qoRU+eIxReZGfGjZZ4roveptZEbz
	Z3YtJXCsREmEo1pGDnudzFVhBr9HvKZfQVVWuw20vgmKMZQN4pO/K7yMJNguG4L/IisKr5Si+F+
	zO0tOaxqbYTapcvPSI9DX7ZgUISb1xTwRNFHimHxS1qDAAk3ALXSPRTEn/twsL6w4cldDzb2SPF
	qRO+BCaKrBd8oWia/Sgn6vC5wYHFwVinc20DBUvbmpPSUxQUfGasSMASOqJqkJzZPbi5uhf38PZ
	YXEIYxD0F1R8pzFf8hi2tLKgw8df7+WmbPLjCJ1WREerkOKWfv8TIcREgeeKANH9cA0aYHGZozF
	ytR1lgnBeTv2mdwGEqm9WZb8+yzY1Pj/astp0YcEMpw07qBFebqaT+yETmgGotx7HBrAGldUz
X-Received: by 2002:a17:903:2ac4:b0:2a7:a6fa:eddf with SMTP id d9443c01a7336-2a7d2f47348mr14195345ad.17.1769047761107;
        Wed, 21 Jan 2026 18:09:21 -0800 (PST)
X-Received: by 2002:a17:903:2ac4:b0:2a7:a6fa:eddf with SMTP id d9443c01a7336-2a7d2f47348mr14194925ad.17.1769047760623;
        Wed, 21 Jan 2026 18:09:20 -0800 (PST)
Received: from jiegan-gv.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a780a4631csm49710305ad.18.2026.01.21.18.09.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Jan 2026 18:09:20 -0800 (PST)
From: Jie Gan <jie.gan@oss.qualcomm.com>
Date: Thu, 22 Jan 2026 10:08:21 +0800
Subject: [PATCH v10 8/8] arm64: dts: qcom: lemans: add interrupts to CTCU
 device
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260122-enable-byte-cntr-for-ctcu-v10-8-22978e3c169f@oss.qualcomm.com>
References: <20260122-enable-byte-cntr-for-ctcu-v10-0-22978e3c169f@oss.qualcomm.com>
In-Reply-To: <20260122-enable-byte-cntr-for-ctcu-v10-0-22978e3c169f@oss.qualcomm.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach <mike.leach@linaro.org>,
        James Clark <james.clark@linaro.org>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>,
        Mao Jinlong <jinlong.mao@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, Jie Gan <jie.gan@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1769047716; l=769;
 i=jie.gan@oss.qualcomm.com; s=20250909; h=from:subject:message-id;
 bh=U3SBm8Q4F2Lqg46nftP77Qbyf63TqJWnGptxyfW3r6I=;
 b=b0vwksCJSZDVDR3oLaXtrkBBvR0U8dzLyYweInT8NsLxQOJVcZxRM7jEzAoSzriNC6jVcmj4I
 hz9WDiif8OjAXAC7wlDvD7OgH5Qyw+hXKLUZ4uHJM9F3pTHesvINDnY
X-Developer-Key: i=jie.gan@oss.qualcomm.com; a=ed25519;
 pk=3LxxUZRPCNkvPDlWOvXfJNqNO4SfGdy3eghMb8puHuk=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTIyMDAxNSBTYWx0ZWRfX5m7QGSTKO9iJ
 6QuAtUZMOVr5o1UJ20z80DgTou7xOYGBuTpgn9sFWDb9ivrvcr5k9Iytnh0iYSfTQgyTk9X518B
 jPNLzCNdRGPJvSvtbF5mh6lgAq96z36osg+CGtBv1epL6gMj10K8ZC33PFo+CmTw+afdByVp7au
 UqGjqHU4J+zeTwxlmsqk5I19hLwLBKTNr1rCUVavLyR2Y2wfaA95LLLGV5jatGhEnPZXJsE1ENg
 ATUENbE4yGVBlk8hM+tZBjR8RVk9Y8/6OqzU49o78SgEI2kBjM1yaODvwblsrEiKtLfk5sm6X7i
 NiPROOkEeQdbrtY1bGav0j3wWZ6BYxsvqcDXmtGRf8YQLk0zHV3MIoluKkAaDR3z+O6ui8wTBwt
 Hjuu8rUS+odbqW8rJ1Gd1Y5yP2XD6/zmMCv+nFX2upxn+EUPanoV4aX5UtkziJ2ZkJxQjtEf58M
 UUYUBvfVCj3QKLO+OFg==
X-Proofpoint-ORIG-GUID: MjfdOULZFXkUZwqmi1SvVeB0zSKq2wkN
X-Authority-Analysis: v=2.4 cv=UOjQ3Sfy c=1 sm=1 tr=0 ts=697186d1 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=gBkj9RZkAcI1HbXH1KoA:9
 a=QEXdDO2ut3YA:10 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-GUID: MjfdOULZFXkUZwqmi1SvVeB0zSKq2wkN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-21_04,2026-01-20_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 suspectscore=0 bulkscore=0 adultscore=0
 clxscore=1015 lowpriorityscore=0 impostorscore=0 priorityscore=1501
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2601220015
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.46 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DMARC_POLICY_ALLOW(0.00)[qualcomm.com,reject];
	TAGGED_FROM(0.00)[bounces-90107-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,ams.mirrors.kernel.org:helo,ams.mirrors.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim,0.61.12.232:email];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[18];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:7979, ipnet:2a01:60a::/32, country:US];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jie.gan@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	R_SPF_SOFTFAIL(0.00)[~all:c];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 803E360CA0
X-Rspamd-Action: no action

Add interrupts to enable byte-cntr function for TMC ETR devices.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/lemans.dtsi | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/lemans.dtsi b/arch/arm64/boot/dts/qcom/lemans.dtsi
index 0b154d57ba24..75a468ddbf53 100644
--- a/arch/arm64/boot/dts/qcom/lemans.dtsi
+++ b/arch/arm64/boot/dts/qcom/lemans.dtsi
@@ -2776,6 +2776,9 @@ ctcu@4001000 {
 			clocks = <&aoss_qmp>;
 			clock-names = "apb";
 
+			interrupts = <GIC_SPI 270 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 262 IRQ_TYPE_EDGE_RISING>;
+
 			in-ports {
 				#address-cells = <1>;
 				#size-cells = <0>;

-- 
2.34.1


