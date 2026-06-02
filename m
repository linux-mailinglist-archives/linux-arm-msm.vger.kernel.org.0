Return-Path: <linux-arm-msm+bounces-110694-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QN5rFjs9HmpriAkAu9opvQ
	(envelope-from <linux-arm-msm+bounces-110694-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 02 Jun 2026 04:17:31 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id ECD6F62725C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 02 Jun 2026 04:17:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 6421C300C0CD
	for <lists+linux-arm-msm@lfdr.de>; Tue,  2 Jun 2026 02:17:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B0A9535A925;
	Tue,  2 Jun 2026 02:17:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iYuHzv3t"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-qv1-f52.google.com (mail-qv1-f52.google.com [209.85.219.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A3F11FBC8C
	for <linux-arm-msm@vger.kernel.org>; Tue,  2 Jun 2026 02:17:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780366647; cv=none; b=QPygIlRpv3GxD+8QBuykzfvTzaqWtfwwO15l+m4WOCkxAvPPjo4NVe6JzREHnvEVOFE107iv9bnYl5BQbBARKu0eV/IuCEGXQ/8BliveO/dOg7rAPrvIKaHhiu9uLG9sMcW1ZwhBVKBIrV26NEerexl/4YJy0RicRTcS46XeBsk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780366647; c=relaxed/simple;
	bh=tIYbPwBNRzf4MU6/1kcaWv3czp8UpZVwpenUBXu7sYU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=EaCGXs0AYNkv3TBC004QF7kj3U1QKheAB2W3b9y5WsBXmc2LzSUPPRbuiJIID0qXcVsNKPuWpWGvVvRc9JoCnhbIBNIlavmaP56Qhq73qc7NDPUb4Ommq36EUVnwinpG6OTw6460cJwCuTec1HRn4tvibBH6zW0QUum4Am9eUHE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iYuHzv3t; arc=none smtp.client-ip=209.85.219.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qv1-f52.google.com with SMTP id 6a1803df08f44-8cce77eb087so34653416d6.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 01 Jun 2026 19:17:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780366645; x=1780971445; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=U5w453nUQQLD9tjxflFUtfWBEuj25pvmqXlOYsO+hXg=;
        b=iYuHzv3t8QRWNkURqGEHYeuTAw29DoKGwzm/OhnF4mfLtqf+VAE0nGemGSKo3vz1vX
         PW14GWU9tezdXyu8+09itMK5HY/ILNKOCseFRl8En8h1as7Q5M9GkIuAq7ZYmqHH8V/N
         6YqqP/21Jw5Dy45TzvWNyy8snfdTfT3iGQkAsvsHtslymw+sJ8kfRa+UdG83yfq/f+Lu
         hRB8XxbbOYk4+OC1sfYDU7ytA3uFYRFuZnHpZkm+YLoh4yPD/Fvif+dOQpPpqGIWUzZo
         qYk+Fij5C/P3cQl9uGLc/bQxOvVeD+7ogYN+j6MGVxLpoYq2aE/ODnEra89ju74KXHs6
         Md3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780366645; x=1780971445;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=U5w453nUQQLD9tjxflFUtfWBEuj25pvmqXlOYsO+hXg=;
        b=To81QvjLK1UI3kWXgb1ubDIG9AjfhNlHwscqiv/lnpuajKiBsFAgdG6kuPWOHoPJ2j
         6DK02gW/C8lcJ4S+PxjebTQg3ycWUBGqiJArcq7Bzjjk0XYmt7isyZNfWZXlL9I+vdNJ
         M91a2wIKsKw0OU3KWRPzUgZ+Vz+cX/94uxIuZHOp1eWvF/8sazlJUot0PM8i4UjfFnrF
         nG30gTxOG7GoIPZXjxm8Dv0ikBqCB/8Pe/Agkp39g3MAJ5IaT/jFSqyNI94kqWk3ocOX
         q5CJHTQZ40IP8HIF+NTSIyYBjrJ5xV6G43ITHL0o8I+pOC6ftG46esksU5RUqYxKd2aT
         eCgA==
X-Forwarded-Encrypted: i=1; AFNElJ92fI1MQr883TtJqED92WHuFah++88bfgKS/5sqZaCPS61zPBTwHYzasseQzhj9oMVO8+qjr00oh9iZRB/J@vger.kernel.org
X-Gm-Message-State: AOJu0Yz1MhThTDpu9/AucZQd5pbHGQYSRF26bxa8MPO7NWwKLUaQzb5b
	xZFTabFqwcb+kBP8o1BenQJ82angCr0GgLnsmwl4c2iAVuP5i5YqrOLnLKNobA==
X-Gm-Gg: Acq92OFsLm7u2E+HeqDzL2XOk6PzWZjQXAiAYrn/qbW4u4Fj6J1HGV/6A0T2POof9Wd
	aEqtIHkaaVnFULpZWTGO3YsRX7zhM0KAPXZX/Yul4y/PNFgDJtoxz0RNup6miJzaiRPS9UhCCS2
	pJhwUvC3YhhaL8Lsx9pwLzpL9BcG0ZYJob3xnTuM+qKZnEvDXJP63hRzx23eOLmGEODwkEKR/oc
	uOwhuslQUVJDw7Ou6Oyrzq+eLtOBOzCLPgc49FAZdJMFtoJiIpzTvWv/aLHCU+lYGpSCcXH+pis
	8UbnC0E6of/IB7iQx5LCsf9HB7D9reEz0fztq9WFfwsIMKobp8RA/KJBWPN6o1onx1xHY2gTita
	QMxFat8VNaK5Md6LV4lyEjDE3G2C5G718pSyaIeQstgyyrd2uyK8sSE9iR8xbZ40IREJ0Go/5nI
	aTzkdeqTy26iDp7LJdq+BQDytohyA58VE/7sQgqA==
X-Received: by 2002:a05:6214:4905:b0:8ca:2413:607a with SMTP id 6a1803df08f44-8ccefb25d5emr247289166d6.5.1780366645479;
        Mon, 01 Jun 2026 19:17:25 -0700 (PDT)
Received: from localhost ([142.181.163.192])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8ccea227f2csm106233896d6.40.2026.06.01.19.17.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Jun 2026 19:17:23 -0700 (PDT)
From: Richard Acayan <mailingradian@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Linus Walleij <linusw@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org
Cc: Richard Acayan <mailingradian@gmail.com>
Subject: [PATCH] arm64: dts: qcom: sdm670-google: add lpi reserved gpios
Date: Mon,  1 Jun 2026 22:17:22 -0400
Message-ID: <20260602021722.30760-1-mailingradian@gmail.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[gmail.com];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-110694-lists,linux-arm-msm=lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	FREEMAIL_FROM(0.00)[gmail.com];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mailingradian@gmail.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	RCPT_COUNT_SEVEN(0.00)[9];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,0.0.0.12:email]
X-Rspamd-Queue-Id: ECD6F62725C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Add reserved GPIOs for the Pixel 3a, which blocks access to the sensor
GPIOs. The hunk in the original patch was dropped in the commit because
it depended on an unapplied patch, which is now commit fe9f4a46895d
("arm64: dts: qcom: sdm670-google: add common device tree include").

Fixes: c4b423835ee7 ("arm64: dts: qcom: sdm670: add lpi pinctrl")
Signed-off-by: Richard Acayan <mailingradian@gmail.com>
---
 arch/arm64/boot/dts/qcom/sdm670-google-common.dtsi | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sdm670-google-common.dtsi b/arch/arm64/boot/dts/qcom/sdm670-google-common.dtsi
index 0f57b915186b..b4854801a5f5 100644
--- a/arch/arm64/boot/dts/qcom/sdm670-google-common.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm670-google-common.dtsi
@@ -522,6 +522,11 @@ rmi4_f12: rmi4-f12@12 {
 	};
 };
 
+&lpi_tlmm {
+	/* sensor gpios are protected */
+	gpio-reserved-ranges = <0 8>, <12 6>;
+};
+
 &mdss {
 	status = "okay";
 };
-- 
2.54.0


