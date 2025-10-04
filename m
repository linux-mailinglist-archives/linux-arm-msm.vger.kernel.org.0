Return-Path: <linux-arm-msm+bounces-75969-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id D72D3BB8D9F
	for <lists+linux-arm-msm@lfdr.de>; Sat, 04 Oct 2025 15:12:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 841C434174F
	for <lists+linux-arm-msm@lfdr.de>; Sat,  4 Oct 2025 13:12:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CFB4E273D73;
	Sat,  4 Oct 2025 13:12:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=smankusors.com header.i=@smankusors.com header.b="bVxV4tJt"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from dragonfly.birch.relay.mailchannels.net (dragonfly.birch.relay.mailchannels.net [23.83.209.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 580FC1A4F3C;
	Sat,  4 Oct 2025 13:12:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=23.83.209.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759583551; cv=pass; b=VkgHXvLKxR30o4W3Wumrrz0xT1D1NzDawsoTZUK6xnIMsKK+yA/21Hnz1gUZxDC1c5yujnl0tesZ/ExR/jnHHWStnE+FHRKbzS9tJeEIuU+1BTRxk/Lw9gnPOxEioiXcT3hwszWrfn7Rmf5cyPWZpEf0xjZXP2ESRZh1MQlvxTk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759583551; c=relaxed/simple;
	bh=isTPXxe36rEOosjGAJZBp/SvYZDzRhxZ5jxnRH8Ht7A=;
	h=From:Subject:Message-Id:MIME-Version:Content-Type:To:Cc:Date; b=NVVmMwCGO4RSesNh9pZfzmD+UOw6r593Ng4Gs0I9XbOQCZTulhmkB2IJROFQDkU49e3prKPuUd3TuSpSvFPKoYmA5q4J77cviW1Oz+Nvq5aGEGLfSBHElEmG9vJsJK8bEVBwTeGGviBm2sI6IVDn33dOlh77RsacsQWxsv6Zcpw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=smankusors.com; spf=pass smtp.mailfrom=smankusors.com; dkim=pass (2048-bit key) header.d=smankusors.com header.i=@smankusors.com header.b=bVxV4tJt; arc=pass smtp.client-ip=23.83.209.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=smankusors.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=smankusors.com
X-Sender-Id: hostingeremail|x-authuser|linux@smankusors.com
Received: from relay.mailchannels.net (localhost [127.0.0.1])
	by relay.mailchannels.net (Postfix) with ESMTP id 65B4F2E09D0;
	Sat, 04 Oct 2025 13:12:22 +0000 (UTC)
Received: from de-fra-smtpout2.hostinger.io (100-114-189-49.trex-nlb.outbound.svc.cluster.local [100.114.189.49])
	(Authenticated sender: hostingeremail)
	by relay.mailchannels.net (Postfix) with ESMTPA id 434022E0269;
	Sat, 04 Oct 2025 13:12:18 +0000 (UTC)
ARC-Seal: i=1; s=arc-2022; d=mailchannels.net; t=1759583539; a=rsa-sha256;
	cv=none;
	b=UBoLemD+jK0lRBvJXvqRGedtgO87pApZdPOqR09KomB63zaHKtzA/mz4/SEi40AJV/Vf3Q
	0k+jbnHE9NzSl9y/8UoFlOqwaiC1flXWLMy3i6urWkoU89EmwnusFyVX2JTCj3CTSCh6aM
	KBo2oRNnYkTWYcPCS8myT6Y0F5rLH3SXkolobYK1XtMmuV0hozv/susfseauIWDAW8oZe+
	Q79EY9UkDUyiH6e5z9uTJPbu5TqOSWKBEr1yC4xQXcnWDPERcsgwmsgxAuBUI7Z5wZM/Xf
	awOvgGPItf8TnfGXtr8CmHNklZYpz8uMpfZVebH0zGzo67B9kuFX9PCsNGjDPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mailchannels.net;
	s=arc-2022; t=1759583539;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:dkim-signature;
	bh=12vtsuogjisVIWYolq9JuHsBSHiUgGV0RnLP/ifRQxo=;
	b=W5+DJ0gN8tfgCaFIw2GX9nOJH5ZcqlcLZtpEeN7JNJdetNyIq1bZw0sW44wXcdfdZhoWe4
	BFdV6qU0NEBLDDCYvnEsy65mBut9PmCE/rjeMcdFgLtbd2cgzV2dTBAmwkNUlLaPuG9Y88
	z8gHm+WLKqtqWgUlM5gB84BCzxP5Y30dIxODn9Ga5wN/so3XUT9WczDijdQbhFB9f/5VLK
	tzwvSWd/G5W0eAHK58H+qlrZX6dG8Sz0QKdY+/8a6uHVzlxzlS/LZ1QnXP/Z7j592OA9Ch
	yPl6IHbmIRpyORuJd/adAIFtOlDcFQSQUQ+JoG9qTtmCt4l8auPk4DpAeZwk4g==
ARC-Authentication-Results: i=1;
	rspamd-84f8cfc67-wgjd4;
	auth=pass smtp.auth=hostingeremail smtp.mailfrom=linux@smankusors.com
X-Sender-Id: hostingeremail|x-authuser|linux@smankusors.com
X-MC-Relay: Neutral
X-MailChannels-SenderId: hostingeremail|x-authuser|linux@smankusors.com
X-MailChannels-Auth-Id: hostingeremail
X-Chemical-Illustrious: 62bd8b3a7914a1dd_1759583542210_2040494716
X-MC-Loop-Signature: 1759583542210:3910955182
X-MC-Ingress-Time: 1759583542209
Received: from de-fra-smtpout2.hostinger.io (de-fra-smtpout2.hostinger.io
 [148.222.55.5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384)
	by 100.114.189.49 (trex/7.1.3);
	Sat, 04 Oct 2025 13:12:22 +0000
Received: from [172.17.0.2] (unknown [36.79.124.169])
	(Authenticated sender: linux@smankusors.com)
	by smtp.hostinger.com (smtp.hostinger.com) with ESMTPSA id 4cf5Xt4c3Vz3wbl;
	Sat,  4 Oct 2025 13:12:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=smankusors.com;
	s=hostingermail-a; t=1759583536;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=12vtsuogjisVIWYolq9JuHsBSHiUgGV0RnLP/ifRQxo=;
	b=bVxV4tJtStdFcsen/u5APBbzYkGmdGtXrecPJS3lkVuiUxXi4jw+qrTeKEDDw0HU6yDbW+
	DnubZYNc4PTgp0C1RXN4vHLjAORb9AzUwj5JB44xcWzLIMCdIh7MrZeWtIAvy/k+4nLxBR
	L8trKJH2/l3HsvPNxQnSPZ89enc5fxcrx+f9UE73J2QXfMp44mbq2NaczXNLfpUBlPa++2
	yBSQdJnz/yRUh/z/kq4UF6kqTR8ZY5NXZ+ZumEwNQC41jy1Uou6Wo2a3aMNmoQnif4UcF8
	lsGRl14QkY5BXh6P6JAMqVol8fOTJCo+N8LKYmg9gXwwWqepttYtDm3h+6SlbQ==
From: Antony Kurniawan Soemardi <linux@smankusors.com>
Subject: [PATCH 0/2] arm64: dts: qcom: pmi8950: VADC channels corrections
Message-Id: <20251004-fix-pmi8950-vadc-v1-0-3143ecab99e9@smankusors.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAEd4WgC/x2MQQqAIBAAvyJ7bkGFDe0r0SFyrT1kohBB+Pek4
 8DMvFC5CFeY1AuFb6lypQ5mULAda9oZJXQGqy1pbx1GeTCf4jxpvNewoSGKjiJT1CP0LBfuzr+
 cl9Y+7+Qho2IAAAA=
X-Change-ID: 20250928-fix-pmi8950-vadc-155f85fe5f06
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Antony Kurniawan Soemardi <linux@smankusors.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1759583534; l=768;
 i=linux@smankusors.com; s=20250609; h=from:subject:message-id;
 bh=isTPXxe36rEOosjGAJZBp/SvYZDzRhxZ5jxnRH8Ht7A=;
 b=LbxCRIDtKOVSPXyt4RsCf4PJufiM/gBRO47xVONiXRbcHQWUvu/hcL5yj8d3NP0iejgOynjBU
 iSD8sWnxzslCcBQJybzGKPJvQmXBn7mDdrVGA+aD+Uy7Pv5tSRL92g9
X-Developer-Key: i=linux@smankusors.com; a=ed25519;
 pk=65wTy06fJl2/h/EJwjr704YG+yjHFhZObJBWzzK+N00=
Date: Sat,  4 Oct 2025 13:12:14 +0000 (UTC)
X-CM-Analysis: v=2.4 cv=OcPKDQTY c=1 sm=1 tr=0 ts=68e11d30 a=aGBhDEDgd9rkiRpfI0k7ZQ==:117 a=aGBhDEDgd9rkiRpfI0k7ZQ==:17 a=IkcTkHD0fZMA:10 a=wxLWbCv9AAAA:8 a=EU4vko7WZ9QRDQrebR8A:9 a=QEXdDO2ut3YA:10 a=QJY96suAAestDpCc5Gi9:22
X-CM-Envelope: MS4xfNB/LnGVdiHVBQfrgxHfLVW+vw5kn2ShuYtS/3+Epdcn1ax0OwlNGu/En0FEAYX5n5IGbonkMzMat4b1lxEFK3KP79Ea2FjPDCdHhPynZepgYk8DTiho TQjyEwWshEzHkFx8J762h/on02vOruJesc0lNL/RM8q62OBEnoeMfBL6TAeWy2rUg0NVOI3reEjnFaHC8WjqXj8ypVGTgcO24e0H2Glrg4UOYwo0Rg/Ya94s 4nPuOH7uman2DO2VG8gNhv0qC3s7h/qFjrrIwMaBEKQC8DJ8OTBqnVZhpl+S0CXyodYwRBm5W3EL/7E7o5ncrF7FeistnGo2znfYXuSGt0nODWDYZIkz6YzX XyrNIUN8MaaqSwU33vrGImzgJ1yt9reFmMaZkLqItlX6aPDfyoU6Jh4CKSkTnsCStmyOUlBT6FIEjtYFDCdCw9EH1WciLbN9qHKyKIJSmiDgvTJE/HE=
X-AuthUser: linux@smankusors.com

Addresses issues with VADC channels on the pmi8950.dtsi

1. Missing VDD and GND channels. I think these channels are using same
   address as other Qualcomm's PMIC?
2. Incorrect scaling factors for the USBIN, DCIN, and VCHG_SNS channels

Signed-off-by: Antony Kurniawan Soemardi <linux@smankusors.com>
---
Antony Kurniawan Soemardi (2):
      arm64: dts: qcom: pmi8950: Add missing VADC channels
      arm64: dts: qcom: pmi8950: Fix VADC channel scaling factors

 arch/arm64/boot/dts/qcom/pmi8950.dtsi | 14 +++++++++++---
 1 file changed, 11 insertions(+), 3 deletions(-)
---
base-commit: cbf33b8e0b360f667b17106c15d9e2aac77a76a1
change-id: 20250928-fix-pmi8950-vadc-155f85fe5f06

Best regards,
--
Antony Kurniawan Soemardi <linux@smankusors.com>


