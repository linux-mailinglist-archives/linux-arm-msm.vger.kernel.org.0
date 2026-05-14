Return-Path: <linux-arm-msm+bounces-107658-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uKn1NKHdBWokcgIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-107658-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 May 2026 16:35:13 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 423A5543329
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 May 2026 16:35:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id AEFEC30D15E0
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 May 2026 14:28:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6E83F3FF892;
	Thu, 14 May 2026 14:28:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GMboUtuG";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="KMavS7x9"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0612E3CC7FB
	for <linux-arm-msm@vger.kernel.org>; Thu, 14 May 2026 14:28:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778768923; cv=none; b=ch6YCNV6hQjL56qClc1BBuKZ3GNblO17z3CS+lRrfzU/xDI5/U4T0EHtNK4rGBoRhEaxMtQaEEsEKBLCeBDmnKYnimQirToPKoO97FrkKw+tWygvHUAKg39t7WlSni4/T2NR72nzpv4LSndd3C3xX0Tae5BftHgNcoUZK++f0q0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778768923; c=relaxed/simple;
	bh=Z4ZuPORDaKmwW4HgxyAXr2NET55WZqUTE31cMVs09oQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Owxvlwm+RxQtzavz68wYnuG8hSQu3i2A+7jNXyahhBmc8IO77m6ldkN9KCEv44vEjg6qnra6onV3RML5/U6SW02Aw58qqBRX5zjJr+MsGx8tACwjJ0jtFn2yiW8b8gOhQePoJ5Tn6u8oDW1CnLLMofrlZwZsmO1QwC0gqHGtcqI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GMboUtuG; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KMavS7x9; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64EBeUYp3048537
	for <linux-arm-msm@vger.kernel.org>; Thu, 14 May 2026 14:28:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	NzWlaO04yyHlsdDuTucopP+bIfNJCQRkBOIVvtEthBc=; b=GMboUtuG1xj1VF/0
	LZjDrzXIme3PohyrPVBtWygHkd5e3XWG1qMA6PRmHGw0B2XxxfhtErGq+3LOjNNy
	m5sqPOp2CSljODTxNyal4QUAhiREKwpC/LauH25c2jTwP0GU7hHP8DxOJyIySNtu
	JHnpaMLhaw97ZIKe0D0S7CJyplUgi6avGb6BF7Ds+ZxFXxWBgBfWg4Gg/ratDCOv
	dmYOh1dYR5NlkhV6f/nI/GiqYWiGiXPgb7aK/rZ95+P37kcCWLDACoPVZFZA1rTD
	rDii4jX8gUC/9InqVgYyF3Mfa7zUHgNR6yzKy7NUW0SlOmg1UdWQ9PyUA4eZ1KgL
	o4+y3g==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e5492thgs-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 14 May 2026 14:28:40 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2bd04e4fe3dso59443725ad.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 14 May 2026 07:28:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778768920; x=1779373720; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NzWlaO04yyHlsdDuTucopP+bIfNJCQRkBOIVvtEthBc=;
        b=KMavS7x93CBFn9Izz+uAhF9Q40Tj7izmfx6DXJAXkpL2Q2VtWmW6GR+CQF4sX5swve
         OedDkw5aSrtrC+67Po03k9UeX+heIHIyQ2KuXF8f1+cE9duQtHcRC/lu9nEjTfZVsPQn
         oV86lEBOtnLr8MC6aENkFeL+xwq0pzjRoP8WWYGi1RIZs+eIyXYhmJt6kBkfbN4YHCkz
         EwZyDX5XkKP+wFNnW38EabSJfV09ezLW7myGD4fv8ioxibR1yAsg+dIQ8dFv7cZy/rC0
         7kkFLPmOd3jXYFJaHMKnps3R3zf3dCexvJDh8SUykcAtaM/D9QTve0VAa+gs47GPumsP
         NCDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778768920; x=1779373720;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=NzWlaO04yyHlsdDuTucopP+bIfNJCQRkBOIVvtEthBc=;
        b=V/vCz8+jGIEZTQ7MwDDxu6Tx3fCGJAVb1s/PfoBQt9HpkBjVOCrdfjpxGalCl5ZaE5
         p++Wqa+xM31ZHja6lPaDkSnQgpBMCpbDJ3z5lnBXHSAOWdteC8g+KZcjaFi5L4XCTrOO
         E2Nd6byA0v11DJwyzvvnPp8PrNAF29U1UAtMIP1O4osI2AfTgdhrgRWEeuLqfrUdSSoh
         3TzFh3kwPaJGUk1XNk5YvTBq4ncde+i5dAAiGqbFe3TriP51s8Z+ioZbdBHmVmXl69ll
         DeBraU+sSmGexc6/3g0DDpz4Ys4LDBwudd8oWYXHB7jmcp7HTduRPOj3VFpzqItFY5LB
         o5Dg==
X-Forwarded-Encrypted: i=1; AFNElJ9Mw66toI9e/fHrdLoEWkUctnjBzALwNGvdTvJwRkMWlJULjYUMz75vpHskFnbI3q1m2WjOVHSI4AU5cc42@vger.kernel.org
X-Gm-Message-State: AOJu0Yx1Y2gmKK/owHuglWEZazMPmR1bt9pWIAGwPmM4Yfwe/Al/ylvL
	3ds7m5LGJ6Q8Nb8eCMaK2mmZuDuEaKBKRy/AQnkUgBQEjgVGWYeQppXfC6OMZ7ECGyrNjCnEz9Z
	Q2KEOATPvYOZ3hdSqIv7DJc0D0W56Elgba8LzD7inO2G+HBIn7dm0gmOwwsanfIPKA0EJ
X-Gm-Gg: Acq92OHcs8Ir2jquaESidSH3jZ0XKGmv0w6/kn7z95XBmSzYrkLioKxSrSU9TK/oW6Z
	XEsINrPf1gSKF2r4pmz3sSICyUmef3moNMQ94c57DwBe/j6flLC6CwiY+ig57WdEpE/DX9ettP6
	JhLMpzkMmvR6GCDcJc6dIel499dPXr0joZ8/2XYrAXjCxCh4CUgcOv4mML0F0dFXLEs6eU0pbWp
	RgL9KSLS1d+eODG02nCoxruBPA60pKtYIt1P4fmWGj53/jocE6KsVO6z42Ou5G5Cfu9b9W8yWga
	3hnppfVTQUvwvWpuWZjnLG1oSKgkyA3VlX6djK+DfkXmaO0OF8SrGO26x6q2Ts/PjMikLNylyKa
	IhFSFe/3FwrPG8yUdlbSMGWpub9BBa1260YdAgqN0i2Nx0F4p0GOJKCX6nLg+alUFmiv3
X-Received: by 2002:a17:903:388c:b0:2bc:e62a:979b with SMTP id d9443c01a7336-2bd30333de6mr84519985ad.30.1778768919639;
        Thu, 14 May 2026 07:28:39 -0700 (PDT)
X-Received: by 2002:a17:903:388c:b0:2bc:e62a:979b with SMTP id d9443c01a7336-2bd30333de6mr84519645ad.30.1778768919132;
        Thu, 14 May 2026 07:28:39 -0700 (PDT)
Received: from hu-spratap-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2bd5c05ffbesm28566485ad.27.2026.05.14.07.28.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 May 2026 07:28:38 -0700 (PDT)
From: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
Date: Thu, 14 May 2026 19:55:51 +0530
Subject: [PATCH v22 10/13] arm64: dts: qcom: Add psci reboot-modes for
 kodiak boards
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260514-arm-psci-system_reset2-vendor-reboots-v22-10-28a5bde07483@oss.qualcomm.com>
References: <20260514-arm-psci-system_reset2-vendor-reboots-v22-0-28a5bde07483@oss.qualcomm.com>
In-Reply-To: <20260514-arm-psci-system_reset2-vendor-reboots-v22-0-28a5bde07483@oss.qualcomm.com>
To: Sebastian Reichel <sre@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@kernel.org>,
        Christian Loehle <christian.loehle@arm.com>,
        Ulf Hansson <ulfh@kernel.org>, Lee Jones <lee@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
        Souvik Chakravarty <Souvik.Chakravarty@arm.com>,
        Andy Yan <andy.yan@rock-chips.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        John Stultz <john.stultz@linaro.org>,
        Moritz Fischer <moritz.fischer@ettus.com>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Sudeep Holla <sudeep.holla@kernel.org>, Ulf Hansson <ulfh@kernel.org>
Cc: linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        devicetree@vger.kernel.org,
        Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>,
        Florian Fainelli <florian.fainelli@broadcom.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Andre Draszik <andre.draszik@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>,
        Srinivas Kandagatla <srini@kernel.org>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778768806; l=2313;
 i=shivendra.pratap@oss.qualcomm.com; s=20250710; h=from:subject:message-id;
 bh=Z4ZuPORDaKmwW4HgxyAXr2NET55WZqUTE31cMVs09oQ=;
 b=UV3YrYW7ea7IDtY3mvFFnc3oM4mTHIzbv8vLk9734m6TdveIxgUI2VsXxYkgt6YmsWwQrXH5O
 7md8+BNAZT/DDonxcGbchOqjnzcHx957S4NDCLNDmMDE+9AuEo2Hg+C
X-Developer-Key: i=shivendra.pratap@oss.qualcomm.com; a=ed25519;
 pk=CpsuL7yZ8NReDPhGgq6Xn/SRoa59mAvzWOW0QZoo4gw=
X-Proofpoint-GUID: PqL7oXEggEZsgLfl9Ors7oOpdhXeC6uf
X-Authority-Analysis: v=2.4 cv=R74z39RX c=1 sm=1 tr=0 ts=6a05dc18 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=t9IVmYW30V31rltyR78A:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-ORIG-GUID: PqL7oXEggEZsgLfl9Ors7oOpdhXeC6uf
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE0MDE0NiBTYWx0ZWRfX/BYM4dEbIycV
 B608mqNfl6Oqrm376ycJ/4Zp9cnYrldJaobb+ljS4v0hq8V6rBP57/RRcuMb0gyi78t3mG1kQbD
 JRV/Ue3GOtv0Zy9hzmvBFTyxrYRvr/fiymeE2cU0W7b7YbJoXT9/7AWydoEafdd0zOiQNzmX7k8
 lKoz3fLm6wmXX/IhawJTEPfWm+cEqs8ntt2O2JLvNJDXVLbXqxfPEA9KUcXU95nkJmiKBizdPng
 CsvgS06nlWq5GoZ8YMzWnnHdu6E+/EKFTvBrIop6UMZSk0NPFTypFIt6+w/yCWVcYTZESDOPBkm
 VEKltiM/NNZ213bkTBOph7pJidMmtApgNDbcdqSrvEbjJAVOlxeKJdkZCEue8fWcAIUIbbEKUCp
 PzGjGwTYTimGdupoE2jEDmMeR9hWJOPP2+4dr3GJ/T/AEEmvGO7+mD0BFHgk9gUaKQSbv6WMCBy
 fAwrWDZYcvi245TtopA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-14_03,2026-05-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0 impostorscore=0 adultscore=0 lowpriorityscore=0
 clxscore=1015 phishscore=0 priorityscore=1501 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605050000 definitions=main-2605140146
X-Rspamd-Queue-Id: 423A5543329
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-107658-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim];
	FREEMAIL_TO(0.00)[kernel.org,arm.com,arndb.de,rock-chips.com,gmail.com,linaro.org,ettus.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[37];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[shivendra.pratap@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

Add PSCI SYSTEM_RESET2 reboot-modes for qcm6490-idp and qcs6490-rb3gen2
for use by the psci-reboot-mode driver.
The following modes are defined:
- bootloader: reboot into fastboot mode for fastboot flashing.
- edl: reboot into emergency download mode for image loading via
  the Firehose protocol.

Support for these modes is firmware dependent and not available across
all kodiak based boards.

Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Signed-off-by: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/kodiak.dtsi         | 2 +-
 arch/arm64/boot/dts/qcom/qcm6490-idp.dts     | 7 +++++++
 arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts | 7 +++++++
 3 files changed, 15 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/kodiak.dtsi b/arch/arm64/boot/dts/qcom/kodiak.dtsi
index 988ca5f7c8a0ec5196c88881f529236c321ad617..72bcc732ab7b64288e1848edb8a55e2c7fe34f98 100644
--- a/arch/arm64/boot/dts/qcom/kodiak.dtsi
+++ b/arch/arm64/boot/dts/qcom/kodiak.dtsi
@@ -863,7 +863,7 @@ pmu-a78 {
 		interrupts = <GIC_PPI 7 IRQ_TYPE_LEVEL_LOW>;
 	};
 
-	psci {
+	psci: psci {
 		compatible = "arm,psci-1.0";
 		method = "smc";
 
diff --git a/arch/arm64/boot/dts/qcom/qcm6490-idp.dts b/arch/arm64/boot/dts/qcom/qcm6490-idp.dts
index bdc02260f902bd37242ba96b90a858ff091e0c80..b7a0b53476395c25f264f2808176588f5943c4c7 100644
--- a/arch/arm64/boot/dts/qcom/qcm6490-idp.dts
+++ b/arch/arm64/boot/dts/qcom/qcm6490-idp.dts
@@ -786,6 +786,13 @@ &qup_uart7_tx {
 	bias-disable;
 };
 
+&psci {
+	reboot-mode {
+		mode-bootloader = <0x80010001 0x2>;
+		mode-edl = <0x80000000 0x1>;
+	};
+};
+
 &qupv3_id_0 {
 	status = "okay";
 };
diff --git a/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts b/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
index ceb68a890bf401ca1d0c787a801d6b192f4e0743..f4af4d1e9bfcee0bbeca892d5386bcec5663c20a 100644
--- a/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
+++ b/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
@@ -1096,6 +1096,13 @@ &pon_resin {
 	status = "okay";
 };
 
+&psci {
+	reboot-mode {
+		mode-bootloader = <0x80010001 0x2>;
+		mode-edl = <0x80000000 0x1>;
+	};
+};
+
 &qup_uart7_cts {
 	/*
 	 * Configure a bias-bus-hold on CTS to lower power

-- 
2.34.1


