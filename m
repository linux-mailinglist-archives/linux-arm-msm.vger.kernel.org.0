Return-Path: <linux-arm-msm+bounces-99947-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sP1jJRpQxGljyAQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-99947-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Mar 2026 22:14:02 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E4A4432C457
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Mar 2026 22:14:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 644893184024
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Mar 2026 21:05:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 535C9346E75;
	Wed, 25 Mar 2026 21:02:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=smankusors.com header.i=@smankusors.com header.b="VKqdalQr"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from crocodile.elm.relay.mailchannels.net (crocodile.elm.relay.mailchannels.net [23.83.212.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41F843264CF;
	Wed, 25 Mar 2026 21:02:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=23.83.212.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774472566; cv=pass; b=Ykkea9S0zYNFuGc15Y8WnXt06tXSw+DXyCcGipx+R5RiN8B0QU1Kf9ZsDiG3ZSnWYUTuHAR+D1ARb+4czQzkm5BbQvbCO6zGI82eNqj7d5gQ/EdEFUjxK7K/DQqHMHgMKSr88NFX0Q3UxmNAusc/TdnzYP1RpdIJ/njdSy0i3r8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774472566; c=relaxed/simple;
	bh=wACdQNI+8zAec/s3V3rt5YY4G202YVIBUqhgbpq2kKs=;
	h=From:Subject:Message-Id:MIME-Version:Content-Type:To:Cc:Date; b=jwrcyOWOAlYoavPT3UeicVNWRIvIsKya93ffqL8i4+xvhgJ4m5l93X3Rq8K86rfHH7pqhV62lgqO9dBCZjULP0dY4omIan0MfUci4ZAYE2rI8Km60TdXW53+6kYrXTwrxyMWBI7PhX0G95rPltMUpCzmggzW6nJditTXfsFgNP0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=smankusors.com; spf=pass smtp.mailfrom=smankusors.com; dkim=pass (2048-bit key) header.d=smankusors.com header.i=@smankusors.com header.b=VKqdalQr; arc=pass smtp.client-ip=23.83.212.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=smankusors.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=smankusors.com
X-Sender-Id: hostingeremail|x-authuser|linux@smankusors.com
Received: from relay.mailchannels.net (localhost [127.0.0.1])
	by relay.mailchannels.net (Postfix) with ESMTP id 8452D401D86;
	Wed, 25 Mar 2026 21:02:43 +0000 (UTC)
Received: from fr-int-smtpout25.hostinger.io (100-96-3-148.trex-nlb.outbound.svc.cluster.local [100.96.3.148])
	(Authenticated sender: hostingeremail)
	by relay.mailchannels.net (Postfix) with ESMTPA id 505F54019F2;
	Wed, 25 Mar 2026 21:02:39 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; d=mailchannels.net; s=arc-2022; cv=none;
	t=1774472561;
	b=yjnqidl4fAjbA1IhAlxhr5W/ECfVLMJnz2Ierlq8Lwq8y50ywrj1UfCM0lvzpJ4sZdRVDZ
	W3scnfcJzoeQvAcXRXIfOcfmFJgDhZgIs3P9pdYLyanX+avmATX2nvm/MGBAljk2Te3vOp
	mRbT4d87g6PKEGzqrSdfh0hrhFkNGAWdBbLrEzAvfMjmzACGJVXbFK0QbLMqXDYx785Avp
	bdrgQKimXLaE6om+a58OwuiZL07bgOdfOBFQaxytAggm2KUq2ALArXYvjcSRro8/2Pc1Xi
	FAh1PplYqn1u52qKx6+YM9BtWQCFapJLJFyBEUCh01AAqXSHRb9/9cLtMzzXAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mailchannels.net;
	s=arc-2022; t=1774472561;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:dkim-signature;
	bh=OH8COS2pCIjBs8hij3fLubn5K83F6iOpok5M1DQoARo=;
	b=wmP/XVxmngHY+JS11NS3jW+8m5oyCvntfezWmXyArCmv8l1KU26uEYhPqpZOkN6n2mbOt1
	DM9pZMbayy3C5Zn3nYd/t4TUi9hgpJP+xRz2k6uvHyAPn/M+9PwpEXI45c5LPXt6Z2cqKi
	LOtqzBKZArBinXR3oeQ3rgaSU20axH/3/g+/Qa/CsLFeQoiJWZJ1v2sjwj8HJ2Ugojsfb2
	YSYF173bRDdHaKeHnyMujosaDUAw21liNYsNgVO84E+zaGympenohPrw/6ECL+o7QsGJaj
	ypT+ePkbdc6m1J8JQweUEcl5p6ykyHQiABsvfSiuzJ79B5ddbCZPiCbhVYyeKg==
ARC-Authentication-Results: i=1;
	rspamd-db964497c-g7vbt;
	auth=pass smtp.auth=hostingeremail smtp.mailfrom=linux@smankusors.com
X-Sender-Id: hostingeremail|x-authuser|linux@smankusors.com
X-MC-Relay: Neutral
X-MailChannels-SenderId: hostingeremail|x-authuser|linux@smankusors.com
X-MailChannels-Auth-Id: hostingeremail
X-Bottle-Wipe: 296c16f64cb0b399_1774472563407_200871386
X-MC-Loop-Signature: 1774472563407:3782653531
X-MC-Ingress-Time: 1774472563407
Received: from fr-int-smtpout25.hostinger.io (fr-int-smtpout25.hostinger.io
 [148.222.54.38])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384)
	by 100.96.3.148 (trex/7.1.5);
	Wed, 25 Mar 2026 21:02:43 +0000
Received: from [172.17.0.2] (unknown [180.253.44.220])
	(Authenticated sender: linux@smankusors.com)
	by smtp.hostinger.com (smtp.hostinger.com) with ESMTPSA id 4fgzrB1BDLz1xpk;
	Wed, 25 Mar 2026 21:02:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=smankusors.com;
	s=hostingermail-a; t=1774472557;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=OH8COS2pCIjBs8hij3fLubn5K83F6iOpok5M1DQoARo=;
	b=VKqdalQr8k1J7BL3fktoyk+cX58ZCd/7Lz87OZTmG+Xi8L2lNUbxNNo1e0N504AG3TRc5O
	HwkquOCOwIzYUXBtha4pG5nbkNqAqhEm/WELvsWbFJIp+stse2xRPkNeMr9qiYW44Ta7Wl
	KTtzZJ6oY7/yKOgG7UNxamjU0TxuUVawS2+ZQJ28NcE3+9iRqAoIkXM1o1sVTaa1M+N+V1
	RgmVoNL6io8nqtT3om29wE1OM25c//rmn5h6cOiNplpMmLUnbnSKzkLcKe3bTrVR8GC6zc
	mjmTPeCMCX2JwPL0VBrK1DehHZABR/BFvMLGhBGLNyN0LMjLLUuTbefVkPhH2w==
From: Antony Kurniawan Soemardi <linux@smankusors.com>
Subject: [PATCH 0/2] iio: adc: qcom-pm8xxx-xoadc: add support for reading
 channel labels from DT
Message-Id: <20260326-pm8xxx-xoadc-label-v1-0-027805dad4db@smankusors.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIADBNxGkC/x3MSQqAMAxA0atI1gZqFaeriItoUw040YIExLtbX
 L7F/w9EDsIR+uyBwLdEOY+EIs9gXulYGMUlgzW2NqUt8NpbVUU9yc240cQbVg155xtvauoghVd
 gL/pPh/F9P55ww49kAAAA
X-Change-ID: 20260321-pm8xxx-xoadc-label-47afdf7f06a9
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Jonathan Cameron <jic23@kernel.org>, 
 David Lechner <dlechner@baylibre.com>, 
 =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>, 
 Andy Shevchenko <andy@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-iio@vger.kernel.org, 
 phone-devel@vger.kernel.org, 
 Antony Kurniawan Soemardi <linux@smankusors.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1774472553; l=1433;
 i=linux@smankusors.com; s=20250609; h=from:subject:message-id;
 bh=wACdQNI+8zAec/s3V3rt5YY4G202YVIBUqhgbpq2kKs=;
 b=ngiU1utpjKX9QkjYMT7YkL/wUgt/0RSA9kG2krG7tk3hEMlcX7VAA1wqk9EOQuWa7SqrU7ETQ
 QPc5aZ3y/XxCaN0nBCxgTOL0qNLNWTSsy7AkUXPqbfR83Un+3FXBSQa
X-Developer-Key: i=linux@smankusors.com; a=ed25519;
 pk=65wTy06fJl2/h/EJwjr704YG+yjHFhZObJBWzzK+N00=
Date: Wed, 25 Mar 2026 21:02:33 +0000 (UTC)
X-CM-Analysis: v=2.4 cv=UN2PHzfy c=1 sm=1 tr=0 ts=69c44d6d a=9XgiG0qChrIWxZZBWkq1Wg==:117 a=9XgiG0qChrIWxZZBWkq1Wg==:17 a=IkcTkHD0fZMA:10 a=VwQbUJbxAAAA:8 a=wxLWbCv9AAAA:8 a=zjR9frvayTJ3PP2CzHgA:9 a=QEXdDO2ut3YA:10 a=QJY96suAAestDpCc5Gi9:22
X-CM-Envelope: MS4xfA7a2X59ChSMD813BX2eR1odEZ2qEOMwPOVe0DQZDcCg2f/jysaAd1GCL2jeNExy4PzxZ8mcVyGujDtHwKMavW9mdtXwEWqWxGa1riumiOfHYCwh0RJ0 bzY1vovyWT3+cM7a8Zk+AzsQZALioXLQnR895C7L6kKZSTkGv+qk9jwu3KtMHnrFehwOLacczz/dvqGWNs4AMR6jSx/q4RzhjjCOYRk2eolkCYC3r/7QM66a qxm7t5rp90ccnPC9SvYXOYVCUjmPLr9ixpI6g8DD0XFqKKKj5/DQltz2w6B8H010ME3WTUcg3GS16saIZ/JVAq7PTNWkk1akU4EO65H0jph3vw/rDEKmcrMc NpRNIb/A/kucF6ODvSwZ3laTdibNR+zq4eRw0cOU7bLjKtr04ehl+OijsdutgyTnjwmTO5dQu9dHovL1TJsOJzBkuhhfY5ogB3NmO99s2OOCni0hWgS0pS/K qXFyetOMQc5kiEQ69eQRloJK7LJqrwswThZxRZgwU26yg+t1P9xNC+fyNbz3TVqNYUzqXIMSePLqbIwR69b/fMSyEAgTzf0ewXtxMeKaLKHiPVPCGR01kyFf wX4uQP2UUWdYqavRNO8aw3Dv7MScSthZqFp8qFiMiyMQIkx4oTa4l5+eIeK4D005/aA=
X-AuthUser: linux@smankusors.com
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[smankusors.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[smankusors.com:s=hostingermail-a];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[15];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-99947-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[smankusors.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,smankusors.com:dkim,smankusors.com:email,smankusors.com:mid];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linux@smankusors.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: E4A4432C457
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

This series adds support for reading channel labels from the device tree
in the the Qualcomm PM8xxx XOADC driver, along with the corresponding
DT updates for the PM8921 PMIC.

Tested on Sony Xperia SP (PM8921):
> cat /sys/bus/iio/devices/iio\:device0/in_voltage7_label
usb_vbus
> cat /sys/bus/iio/devices/iio\:device0/in_temp12_label
ref_muxoff

This patch was originally part of the larger series addressing the said
driver improvements. As the calibration fixes are not yet ready, the
label support is split out to allow independent review and merging.

Changes since original patch:
- The label is now read from the platform description (device tree)
  instead of the internal datasheet name.
- Link to original patch:
  https://lore.kernel.org/all/20251028-pm8xxx-xoadc-fix-v1-1-b000e1036e41@smankusors.com/

Signed-off-by: Antony Kurniawan Soemardi <linux@smankusors.com>
---
Antony Kurniawan Soemardi (2):
      ARM: dts: qcom: pm8921: add labels for ADC channels
      iio: adc: qcom-pm8xxx-xoadc: add support for reading channel labels

 arch/arm/boot/dts/qcom/pm8921.dtsi  | 12 ++++++++++++
 drivers/iio/adc/qcom-pm8xxx-xoadc.c | 26 +++++++++++++++++++++-----
 2 files changed, 33 insertions(+), 5 deletions(-)
---
base-commit: c612261bedd6bbab7109f798715e449c9d20ff2f
change-id: 20260321-pm8xxx-xoadc-label-47afdf7f06a9

Best regards,
--
Antony Kurniawan Soemardi <linux@smankusors.com>


