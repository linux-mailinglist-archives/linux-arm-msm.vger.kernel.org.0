Return-Path: <linux-arm-msm+bounces-102189-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wPDeCxQh1Wnr0wcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-102189-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 07 Apr 2026 17:21:56 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C4F693B0DD6
	for <lists+linux-arm-msm@lfdr.de>; Tue, 07 Apr 2026 17:21:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id C89D4301F689
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Apr 2026 15:21:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 28A9436BCE2;
	Tue,  7 Apr 2026 15:20:38 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtpbgbr2.qq.com (smtpbgbr2.qq.com [54.207.22.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 854D13644CF;
	Tue,  7 Apr 2026 15:20:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.207.22.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775575237; cv=none; b=p7ou7kaRuEeafoUCAs1m7qqOKg/3hxjeOh6uwgTM3ihggm2tyre3WDxeRSUZ1IBVFRTwn3/yoZy2VybT0mF57cSyJcI/lqgA8enXn3MiZZKVbpInVRnVx9bOpsFruImCY4fdPSsOaprYNOQbcxEdC5ofAnHnwFDEEA1xH2ivae4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775575237; c=relaxed/simple;
	bh=MFMZfu8OrH+9H/Z5u1OPH+iT4oPtmmCZ569AUwFMwOo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Nt+uEQrI29uIWDS4gsmXHn5hSIPqEClzgrCQS5aVcaURocgEkXswg5ZYp24vuzkNO5pczi6fQVntXpQbVWInq8kF5N54xi066lerxE36pCxUHa0eMI526lGgYhXHnCJUrAxHIzqPbVDXq4fDHsMDt13suUGCFa1V5iOVrqjhT2M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=radxa.com; spf=pass smtp.mailfrom=radxa.com; arc=none smtp.client-ip=54.207.22.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=radxa.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=radxa.com
X-QQ-mid: esmtpsz19t1775575211tc8018f21
X-QQ-Originating-IP: rENiXbxgP+1im1Zu/n/e0Api5DLh6GMgLyHDUd/e+O8=
Received: from [192.168.30.32] ( [116.234.14.100])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Tue, 07 Apr 2026 23:20:09 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 3996882772581790980
EX-QQ-RecipientCnt: 15
From: Xilin Wu <sophon@radxa.com>
Date: Tue, 07 Apr 2026 23:19:53 +0800
Subject: [PATCH 01/12] firmware: qcom: scm: Allow QSEECOM for Radxa Dragon
 Q6A
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260407-dragon-q6a-feat-fixes-v1-1-14aca49dde3d@radxa.com>
References: <20260407-dragon-q6a-feat-fixes-v1-0-14aca49dde3d@radxa.com>
In-Reply-To: <20260407-dragon-q6a-feat-fixes-v1-0-14aca49dde3d@radxa.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Judy Hsiao <judyhsiao@chromium.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
 linux-sound@vger.kernel.org, Xilin Wu <sophon@radxa.com>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=763; i=sophon@radxa.com;
 h=from:subject:message-id; bh=MFMZfu8OrH+9H/Z5u1OPH+iT4oPtmmCZ569AUwFMwOo=;
 b=owGbwMvMwCVmdFg0fe08Iz/G02pJDJlXFZZolEhcfSk0c8VHqZsP9z1Y4qvrMP9rmZ7d6vnxN
 Qf/1CxO6yhlYRDjYpAVU2RRiGeYy16Ze+2pWKkezBxWJpAhDFycAjCR230M/xR27ln2ftGExFnv
 hf5a/vjbpCO89MQn9TfthQdOd2h7ZbYzMnRzO/x9wZfR8vK/oNOm26t2e3/QtrTcGlO7Qner7Lz
 979gA
X-Developer-Key: i=sophon@radxa.com; a=openpgp;
 fpr=205F009D07796DD6E516752E32C31567AD9E324E
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpsz:radxa.com:qybglogicsvrsz:qybglogicsvrsz3b-0
X-QQ-XMAILINFO: NlWvLSkfVnGck+LgyAESukXtYxnndFNsNUW1AA+eC2eAnJp8UpuTVd3A
	PLb7gmBrhuCsEaCJYL0AFE/ZD+G8a3imELYotjpe83KmBp9JVPXiy+/WwMwlBPrNJ1YJu/S
	/zkOsH40j8HpTOG1LJQYjKb9NI8gk7oQZ0cUcqv6Pr7LHujRk63WqCdXP1YUX1jk/k9BJy6
	DUtEOgyjNY3xaE7POXY79jw0pdiqDUKDPyPjj2LQS7j+6dDGHBGrFPsvwbdTUVE4yOxjpdf
	wM+/yCAySe6cjR10l6TwTM08z4Z2mlacYW9j4IU33EcFe1RjXyywC3f6hd+vTpFbvKzN4UK
	lD6WCFBG/vv9TzIKMRoMaOhPBthcuyU/8AkDS5MC/qK0ga4E+ARCurgbR+YKpCTzXSc+nsZ
	6XZRvz/KvZcH+sdHlk91hzMw6ZOBbiyU20MxHzFtfCnIQDMgTfS2syLiAZPkX6G86iJoL9f
	QZ53MUElJYkTeVWWOQfFZO36Oq0SSOzMzgoTJFtwVt4fXIHpuuchY4vWZnLbDRaMErTU85z
	+ypsIapkbGGJmK59eqhQ70L1vSthUsIV4v0gGRVe/qUcwcUqBYcVJDM6ryypCkBBIjYMPNC
	11dUEyeWpGgdklhicSGEKusNxgWdfO8jZ3YxC4j8jzr0S3htQgJ7lKyMtV+FuuZM9mKYU9i
	q7yKTHDg98D55Pa90QmPcgrDdZB8Jb+6gEkD9glbXBxp91BRbWtx7DRBFJnDdUbHzBvNDjU
	5MiBXX1KFI0thI7qn1z5b19qw40ibPIzehOAnq2wWL28b0ZAqxuCPhUurDtBR27vUOPAZVw
	PXuy7mhgz/DZZ0MlBSZvuiDfmvtOq3EKmhgYDnNICvz2sIP+t82108hA8n4i+PF/MoxMXlL
	t0deP/uo+hrSIQX0wBsBg6KMA6enX2NgA21wEC27FIcgxRNteTD2xHJJ5/TIS1FxLQAHKNh
	Z/sElyWkuLW8vfghr2hx2DyTOklmIITS7Kiz6rBwaXVaQw72TbAlnw8jbfIc0RfLkmtQydG
	jZQsB0RtCUo0cxBM6JUdVPy53Rz0g=
X-QQ-XMRINFO: Mp0Kj//9VHAxzExpfF+O8yhSrljjwrznVg==
X-QQ-RECHKSPAM: 0
X-Spamd-Result: default: False [0.14 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	DMARC_POLICY_SOFTFAIL(0.10)[radxa.com : SPF not aligned (relaxed), No valid DKIM,none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[kernel.org,oss.qualcomm.com,gmail.com,chromium.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-102189-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sophon@radxa.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.800];
	MID_RHS_MATCH_FROM(0.00)[];
	R_DKIM_NA(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[radxa.com:email,radxa.com:mid,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: C4F693B0DD6
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

add "radxa,dragon-q6a" as compatible device for QSEECOM

This is required to get access to efivars and uefi boot loader support.

Signed-off-by: Xilin Wu <sophon@radxa.com>
---
 drivers/firmware/qcom/qcom_scm.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/firmware/qcom/qcom_scm.c b/drivers/firmware/qcom/qcom_scm.c
index 9b06a69d3a6d..55b18463560a 100644
--- a/drivers/firmware/qcom/qcom_scm.c
+++ b/drivers/firmware/qcom/qcom_scm.c
@@ -2319,6 +2319,7 @@ static const struct of_device_id qcom_scm_qseecom_allowlist[] __maybe_unused = {
 	{ .compatible = "qcom,x1e80100-crd" },
 	{ .compatible = "qcom,x1e80100-qcp" },
 	{ .compatible = "qcom,x1p42100-crd" },
+	{ .compatible = "radxa,dragon-q6a" },
 	{ }
 };
 

-- 
2.53.0


