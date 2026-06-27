Return-Path: <linux-arm-msm+bounces-114722-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id xawYBKmfP2qYVAkAu9opvQ
	(envelope-from <linux-arm-msm+bounces-114722-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sat, 27 Jun 2026 12:02:17 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 115586D1B3E
	for <lists+linux-arm-msm@lfdr.de>; Sat, 27 Jun 2026 12:02:16 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=ULkVnaIC;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=Fu2dA37k;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-114722-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c15:e001:75::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-114722-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 1EF853008CB2
	for <lists+linux-arm-msm@lfdr.de>; Sat, 27 Jun 2026 10:02:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2CC6D39A4D8;
	Sat, 27 Jun 2026 10:02:04 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D15CA391837
	for <linux-arm-msm@vger.kernel.org>; Sat, 27 Jun 2026 10:02:02 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782554524; cv=none; b=TiEWy7bWdCIKBf2M1fBVZkSXVyuGh4trXKtlc6PBuJCc0aAhWJjXUT5aN7IkmCs/eKP45z/hyi1vxiOVPpbFkP4BN9cJB8ieZevTzQwmix1yjzdPfF9hIE0QVIFWzLQgQG+N3749FOMK+ohV6CwwRZd0yLA+Twg2SFe5lmG7qJo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782554524; c=relaxed/simple;
	bh=F+1vuwUREseEO8fmrN+L5VPd0Kb9dANgwZTePjZ5YTU=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=pF+UC8+H+xDPnGyabilBO/Pokg8A1APiOtUBM1kkHqlcAtHYiC3uQV3Bnp1SvY38hhlDNEhKhZp8k0ttaJlrlG75d+Q4ygTXi6+PSdJZMgXNg/fdkQkQXjiJCguhercdfXS9t9CUHQsmReFM2YMBkmelMg6amQESgKWpKp+s3Ow=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ULkVnaIC; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Fu2dA37k; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65R9ZWGi731997
	for <linux-arm-msm@vger.kernel.org>; Sat, 27 Jun 2026 10:02:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=EVWpvntptBmcOLqqewmuNr
	YlXqpbIZ+aNpYVUgqbp1I=; b=ULkVnaICzqpPwEJlWtE/J9AJtipLUeJL98K1KN
	ocOXZI9Xhde5RCkzog7eRySMzkQiLT142/N4JXup9n/JhKTtaXerm9YnQ19lTGv+
	H7fr7K7tA46G+4IczxZ5s/ohTWk3YTHg9sO6c5xHHSqUxB4J1WPvb8AEOhvNCOmP
	S0n2VzWJMNZi+z3TGYOXF4g0uBaXkja9hZS2sFu0DeFWFBUUMPnalEgFHgm27cMe
	CbxdOjvwZCxuM2bsI/zC5mB2ioUNXThXecm4dg+8ekwrKW6SRoBmtPDlwZb6GFsq
	xU5dJbdvaZs02GkwbpLVNvjY0IfrODjhMvJTwq3AKsT+HfSA==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f26turjy3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 27 Jun 2026 10:02:01 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-30c1f6c5559so2011535eec.0
        for <linux-arm-msm@vger.kernel.org>; Sat, 27 Jun 2026 03:02:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782554520; x=1783159320; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=EVWpvntptBmcOLqqewmuNrYlXqpbIZ+aNpYVUgqbp1I=;
        b=Fu2dA37kJ8orAm9yYATo8EH7Pla0QXOBw010Y1eGjPClc2mXrTx0fyR61h4Z6tz3XM
         zqLV6rCHtTHARcJ/oRV61H1prkHQWuQNuWHKVVJAEATkLhFiD+wrUfhHlXL2tb/Q4p/M
         OkQCicIpQBZFVN9gBq8Kvdhp+D2njxynSTwdbrtD6Ctmpt9Gy6HahHIGvb1yF0+DC+6a
         wXMjfVlNdhaylRuj4cxZdjyENRWFCqCt9ACrogBWlxHJiAPKHcB2Q4aqIZf4U2FjU6QE
         sAELsRdUXPjzyj08b/ePoOnyh5DkyTUXGfKUFazNTSGhbnInPkpDbWsF06T72rHIHqqh
         q38A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782554520; x=1783159320;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EVWpvntptBmcOLqqewmuNrYlXqpbIZ+aNpYVUgqbp1I=;
        b=dNdYRiA6ndBhhRLqbiAR14cbqnJCq2vfxsn/4RPtvVl3WJvGwdNiabcO7iA+xsckmz
         Y8sY9jg08fPWwsbDsFhh9DJCCKz4+Z0EE9oqHo/oz6KqQd/vN2LOFXegozUGwPqsLanm
         JTqCC1Wzpray5gPMirSLio9Q4kkqMd1sWlG+8ioeN7+JiKuDU36w9h8iE5MqnufNCM8o
         regp7Cip2w4RGbSpTgPRnv3lgAL1e5huOIpB/lwEvfYzDPZ5dtzXftgzoAM1jCa1LFnG
         MiF5QdFMcqvxRFOHzT7urutWHfTzQmC57B1f3XpGtbwhZfqy6XnlwIwTHaXPeBKyy0HH
         nSIA==
X-Gm-Message-State: AOJu0Yxtc0TkwH5GFOYAAGFFP2FmqGM1EZt2y5l4HYvOgGJ/SPGv18h6
	SpIjy5oLGTxAHMIAFbdY7bg/AhBzPVMeZYyOU+cwuj46y50xaWmHVQBByw4L/4I5HhJvYwCTOIc
	k++SxlstVvU8dXtTIiBCwYBas14mm19AF2Q6wI8mTSEHV1dzTqN3Vvcq3lgKn7Ch75QM/
X-Gm-Gg: AfdE7cldi87Zbob71erEKv07jykJKe56qhogyYPMxy9NkYlxgBh0msDgtMQfBNQTVXF
	LyPsaPGurl4YVvD+RWW2isb1qP2Tm6rWT7JLHKgBEyY89PV8L0ahKA85SIS7q0a8KN97REcnjbU
	n530Ti7hWzGICbRCs9CVPIDUUomqHuq4Q+oXKMeg0XhILNpO9SnkxVbf4YUPuKw0E4xEHGQXFaR
	RhYoYU0RKCVthbx35pbgizdx0FAZRQoGkYmEjf1OlaGEdHCiAWVUMaUZw8B2WBSBAdnrhGHWK57
	w1fvRcpWx5ode1qunnqnMvO62/XI3YrzzpiIc1yu+EQkgB4ZYGUSiHCyQpD7mk5pA47CyWKrisa
	+uq22esmxUDrXmA89tXYyCVkT7emZWjWSf0WeIA==
X-Received: by 2002:a05:7022:914:b0:139:7a47:ab68 with SMTP id a92af1059eb24-139dbbcc212mr9246859c88.37.1782554520416;
        Sat, 27 Jun 2026 03:02:00 -0700 (PDT)
X-Received: by 2002:a05:7022:914:b0:139:7a47:ab68 with SMTP id a92af1059eb24-139dbbcc212mr9246835c88.37.1782554519801;
        Sat, 27 Jun 2026 03:01:59 -0700 (PDT)
Received: from hu-naala-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-139d90e95c6sm38446568c88.11.2026.06.27.03.01.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 27 Jun 2026 03:01:59 -0700 (PDT)
From: Nabige Aala <nabige.aala@oss.qualcomm.com>
Subject: [PATCH 0/5] arm64: qcom: dts: Add display support for Shikra
Date: Sat, 27 Jun 2026 15:31:34 +0530
Message-Id: <20260627-shikra-dt-changes-v1-0-449a402673d0@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAH6fP2oC/yXM3QpAQBCG4VvRHJuyW9bPrcjBsoOh0A5Scu8Wh
 09f33uBkGcSKKMLPB0svMwBKo6gHezcE7ILBp1okxhtUAaevEW34b8L5k7prKEiVS6F8Fs9dXx
 +zar+LXszUru9IbjvB+yt4d11AAAA
X-Change-ID: 20260626-shikra-dt-changes-8d127be951d5
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, arpit.saini@oss.qualcomm.com,
        mohit.dsor@oss.qualcomm.com,
        Nabige Aala <nabige.aala@oss.qualcomm.com>
X-Mailer: b4 0.16-dev-d5d98
X-Developer-Signature: v=1; a=ed25519-sha256; t=1782554515; l=3380;
 i=nabige.aala@oss.qualcomm.com; s=20260520; h=from:subject:message-id;
 bh=F+1vuwUREseEO8fmrN+L5VPd0Kb9dANgwZTePjZ5YTU=;
 b=goyzx4KXA+AOAzYVTSCrTSMlFfZ0+qMIiht3NlLRAi92uV+hZgN1UTvjJ3kRVLBS/iOWdF/JS
 p91sNxrXSRGCXlkmGBp+1Ji+N5W6UkrW5fuRO0doq93amp1NME14DxW
X-Developer-Key: i=nabige.aala@oss.qualcomm.com; a=ed25519;
 pk=PYHJom8sPos1IGkrbCCsWiE7XTBQrQZd9jzAo051tgw=
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI3MDA4NiBTYWx0ZWRfXyeiS6+jOPvP8
 rGtUIUT5W4FkSTvIBSYHeVw9RtXZ42hnv/VkfNpW/Z11y4HRbwFYVSvt+AM0mHnd1LoIfBk3FJF
 huph0xR1jv1gZrLKbihvdBpB9whO1zY=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI3MDA4NiBTYWx0ZWRfX072VvN4AuZlK
 OhDsGaCj4QuHL/mMscpy5FJziDUNtLkynLo2h90rGQn/22EjbzAUfvmJoMMF+uKRSDk8EliH0y1
 /FeSC9gv6Mpu5c0bUSWTa9T8hcjpLOoQg72kw/KZwQD6kYpPlP4u6R3dax8iyUMHJyVFJ51Bg9w
 JMy0tdBfwbjOMvuEWbrAkwwSwPzGT8EOOqAZUXJwUoPgb0D05NrYnGCagY7l/U/eB1r+8VTQe4I
 9ridZYcLpK7KrYea0OZtGYVvpyQ1KHpZqjFRLKL/iD4utvuup58LHPpjwqBX50cFMSaYIqupz1w
 3kivoBBEtY+K8266wVvZ3X1+OMpAw8EtLXzl6bxavVR48waU60aEuj24X6xoredLP/s+If1txxr
 GCimodL3T4BcNlgVlYNEpGYdQlLJ+R0Hasy84y3pfOOS7mP2YJuCitiMKuflWn2n1woaVJ6XV/i
 +OLO3lUNKpvt/ust6xA==
X-Proofpoint-GUID: nbYA7R9zpWGGBnrcx3FKKIf6jTCB4L8F
X-Proofpoint-ORIG-GUID: nbYA7R9zpWGGBnrcx3FKKIf6jTCB4L8F
X-Authority-Analysis: v=2.4 cv=DY8nbPtW c=1 sm=1 tr=0 ts=6a3f9f99 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=Kz8-B0t5AAAA:8 a=VwQbUJbxAAAA:8 a=zvx2cZ7kDf5G4oDAlPgA:9
 a=QEXdDO2ut3YA:10 a=bBxd6f-gb0O0v-kibOvt:22 a=RuZk68QooNbwfxovefhk:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-27_01,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 bulkscore=0 clxscore=1015 impostorscore=0
 lowpriorityscore=0 spamscore=0 priorityscore=1501 suspectscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606270086
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-114722-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[nabige.aala@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:arpit.saini@oss.qualcomm.com,m:mohit.dsor@oss.qualcomm.com,m:nabige.aala@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,qualcomm.com:dkim,qualcomm.com:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[nabige.aala@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 115586D1B3E

This series adds display support for the Qualcomm Shikra platform.

It introduces the Shikra MDSS display subsystem support at the SoC
level, and enables display on the Shikra CQS EVK, CQM EVK and IQS
EVK  boards with the required DSI panel nodes. It also adds LT9611UXD
support for HDMI output.

Nabige Aala (5):
    arm64: dts: qcom: shikra: Add MDSS display subsystem
    arm64: dts: qcom: shikra-cqm-evk: Enable display and add ili7807s panel
    arm64: defconfig: Enable ILI7807S DSI panel driver
    arm64: dts: qcom: shikra-cqs-evk: Enable display and add ili7807s panel
    arm64: dts: qcom: Shikra LT9611UXD support

 arch/arm64/boot/dts/qcom/shikra-cqm-evk.dts 		| 104 ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
 arch/arm64/boot/dts/qcom/shikra-cqs-evk.dts 		| 104 ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
 arch/arm64/boot/dts/qcom/shikra-iqs-evk.dts 		| 124 ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
 arch/arm64/boot/dts/qcom/shikra.dtsi        		| 203 ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++--
 arch/arm64/configs/defconfig                		| 1 +
 5 files changed, 534 insertions(+), 2 deletions(-)

prerequisite-message-id: <20260611-shikra-dt-v5-0-103ed26a8529@oss.qualcomm.com>
prerequisite-message-id: <20260608-shikra-dt-m1-v4-0-2114300594a6@oss.qualcomm.com>
prerequisite-message-id: <20260604-shikra-dispcc-gpucc-v4-0-8204f1029311@oss.qualcomm.com>
prerequisite-message-id: <20260608-shikra-display-v4-0-88a846afdd5d@oss.qualcomm.com>
prerequisite-message-id: <20260618-ili7807s-v2-0-b3f0c109b102@oss.qualcomm.com>
prerequisite-message-id: <20260508134009.4582-1-syyang@lontium.com>
prerequisite-message-id: <20260611-lt9611-b4-send-v1-0-42abbcd3bb1e@oss.qualcomm.com>

To: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>
To: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>
To: Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org
Cc: devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Cc: arpit.saini@oss.qualcomm.com
Cc: mohit.dsor@oss.qualcomm.com

Signed-off-by: arpit.saini@oss.qualcomm.com
Signed-off-by: mohit.dsor@oss.qualcomm.com
Signed-off-by: Nabige Aala <nabige.aala@oss.qualcomm.com>
---
Arpit Saini (3):
      arm64: dts: qcom: shikra-cqm-evk: Enable display and add ili7807s panel
      arm64: defconfig: Enable ILI7807S DSI panel driver
      arm64: dts: qcom: shikra-cqs-evk: Enable display and add ili7807s panel

Mohit Dsor (1):
      arm64: dts: qcom: Shikra LT9611UXD support

Nabige Aala (1):
      arm64: dts: qcom: shikra: Add MDSS display subsystem

 arch/arm64/boot/dts/qcom/shikra-cqm-evk.dts | 104 ++++++++++++++
 arch/arm64/boot/dts/qcom/shikra-cqs-evk.dts | 104 ++++++++++++++
 arch/arm64/boot/dts/qcom/shikra-iqs-evk.dts | 122 +++++++++++++++++
 arch/arm64/boot/dts/qcom/shikra.dtsi        | 203 +++++++++++++++++++++++++++-
 arch/arm64/configs/defconfig                |   1 +
 5 files changed, 532 insertions(+), 2 deletions(-)
---
base-commit: f28fb4ff0d25819c58341fec6e3953f1ebb1fc2e
change-id: 20260626-shikra-dt-changes-8d127be951d5

Best regards,
--  
Nabige Aala <nabige.aala@oss.qualcomm.com>


