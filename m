Return-Path: <linux-arm-msm+bounces-103833-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UbqSHwd+5mklxQEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-103833-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Apr 2026 21:27:03 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 222A643345B
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Apr 2026 21:27:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 72E3F301874C
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Apr 2026 19:27:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7CAA63C3451;
	Mon, 20 Apr 2026 19:26:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="TIuoh2UF"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B32173BFE38
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Apr 2026 19:26:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776713218; cv=none; b=ralm5sDaz7LfXjHQNE2osccPWHqTEtjPNwk1FL8i9IeguVWQr+T7ZuObrx7QHO3F+HSRy1yHOkmr75hsjPHFP2hIICpDqJZtwkuYH++WBBGc5QqAumJAT4Yrs7O/4fMbdei+NVJiavDPWWbuWUthE7un2O19lmXrswpYKyrkMZk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776713218; c=relaxed/simple;
	bh=m+1L9WvbVI0f7eJLVLu5EcNLfHi94bMZgmhpN93ipnA=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=bBB1FzQYq0dK1W/Z9y/FgmLzIK1rLkSEDIcZ/8HOejzA3VR86cZU2yKbwZv0d1qOZvZQWo0jtCYbr/zXZM0XMagi4IGD6cpyUKvOYnyJPVL0sPWZtyfS9FMWdPPBWT2GmqDe0ZtlGtjcjmjDmQn2Vhl1NHgI7aPilLcrY926soQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=TIuoh2UF; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-488c2690057so34021805e9.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 20 Apr 2026 12:26:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1776713215; x=1777318015; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=SMn7mAHyyiq49KgZjxkjkve6OprxewE2dL11FH9InyM=;
        b=TIuoh2UF/0BqfAZGEvsbqPYPpMVUeX4+CaeHUcAVYLpuqeSX7AY5JKqsTINTzQW+jf
         koxoR5+cYBw0IY3HB0IZJusrJBU6yeUgVirMNoeXkLrjkG8DDNyD5LY4Iuo2CivNXBBY
         9r2UvcbQQOHQ4uC1RhiGbLYF4cuzCfr+lSkcPKvBCi+Ezzxs5E1YdNCTaqs1qLupkhsZ
         VpZXBcabIsZoYj/ODFwfr0ddhLZoUWRB2wi7qEte5KliwPwYaGq4Dsw6ICqsDjSCLU8W
         A6oGcEyEGPJ3roFRkDWzr+kgP0yvrweiI4JDhzShSr9zeY4Nw2AYU+6bV8YeyfGGQxjU
         9/TQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776713215; x=1777318015;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SMn7mAHyyiq49KgZjxkjkve6OprxewE2dL11FH9InyM=;
        b=DYpPszwqWfpfuWtuYra3GCHXHmeSDwd8ZsXik6NRzCZFdCNCfVwbhHRAfvy0F+3SfP
         9/0WZa9aXBw5kS8MBWkci5Nj6xJeD816+in2fZ1uFo7iSX3R1PHTj3H5hwbnQHW7Gc+y
         PfMsZHr97gqEKquVLlN3RKwNbU37lPuLgI4I589OkZxgYuTjgSFj5yrth8NUcb8EaTBp
         9kNM1TDTpSWhUIQwHGi5x55aSmQkh34Xxngpth0Y2O63j0t//Mocv5/SvxzTG2sTqcGA
         dkK6C1id15AfsC+V49pQfWHiBQJqJ6z1/AT5mIgR9c4KYUGd5gYex3f+91WGoq8PLaVl
         5RmA==
X-Gm-Message-State: AOJu0Yz0o9g7CGTCTuRrXe/Yhx2W4D81tycHNbASNO+mGXTjB+BEjRjo
	Eygy0WGPBat5KQyeK2rV844sWuISPob7HRr8OB5R8XbKZhRs927DySZ+/PFUqcjSOhQ=
X-Gm-Gg: AeBDieuNPh11YYhTgp9sNf7yGFhWhNQoeeJjfsNB7S9YEpWaf2PuSGPSz7QQppUPNQC
	I535NsBRIih4MDIMa+5l+UO+22GUkZ0YIjHkf5ZpWoMUNXr7X5D2FhYCl96qjYUMHzPONDB6cjg
	/zaULpO5B9Aw0XOGoq1rqRwGRkdIJ1+M5Id+8PfVMFW6pWo44ejdA21n5oVSHy727GK7VsbxC9g
	g85jJwRxsMee08HwidrXoaswcFZZuJIjBCuW79NvLb5G+7QrA4Fc3cUW3/gHhUlxDqNeWhHqx6Y
	v88Ei/P30YPFYZKfIDARF7OE4I5en07twRLQwwtq+Mo7oVuJsf/rKCdHyVCXxVb/hM7xAhap3AI
	Jct4vHTqwtfEvwB6r3xRrVhFGIPhcJwGGxWfXry3xyvmp6T6PGtfDT/08KUD7bjVdwjt2rOq0Qh
	DpScDjv4bQi8Dc87rUt7Vyg5IhykzZG3hC3+6ldGXkxoSBkYSoEz8I+TE=
X-Received: by 2002:a05:600c:a309:b0:488:a882:b7 with SMTP id 5b1f17b1804b1-488fb788b82mr134088445e9.29.1776713214831;
        Mon, 20 Apr 2026 12:26:54 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:106d:1080:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488fb78d1bcsm133524515e9.5.2026.04.20.12.26.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Apr 2026 12:26:54 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: [PATCH v2 0/3] arm64: qcom: sm8650: misc enhancements
Date: Mon, 20 Apr 2026 21:26:50 +0200
Message-Id: <20260420-topic-sm8650-upstream-cpu-props-v2-0-689e07d8ab8c@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAPp95mkC/42NSw6CMBBAr0Jm7Zi2ykdW3sOwgDqFSYQ2UyAaw
 t2tnMDle4v3NogkTBHqbAOhlSP7KYE5ZWCHduoJ+ZkYjDKF0qbC2Qe2GMeqyBUuIc5C7Yg2LBj
 Eh4iqzK/WkruQ0pAqQcjx+zg8msQDx9nL5xiu+mf/b68aFd5c1+XkqHSqvL94asWfvfTQ7Pv+B
 a8EKYvPAAAA
X-Change-ID: 20260128-topic-sm8650-upstream-cpu-props-0754ccef3e01
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Neil Armstrong <neil.armstrong@linaro.org>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=932;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=m+1L9WvbVI0f7eJLVLu5EcNLfHi94bMZgmhpN93ipnA=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBp5n38b5Vhf1lil+1n9JTb1UImZ0C/0VJZpBGUYs/T
 rjbPXOqJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCaeZ9/AAKCRB33NvayMhJ0WF6D/
 9egk3oRCFHBJWE5vNagEYDvaN2lNX8e7ffdUk0HFep9G5ZGTFtEhXaJPCIwYTOvfA9/kt+iXORGUoK
 zezwwfz+2kgFCWcByw/31nutU8hknc5JSIfT5n0tg+xJMV8kWE0df/b5BIrLgL9SFxpHveVPZ92A3x
 nSbDg/SRdNQMP7aOTpgDXG+vCPlbWxG6DVKw/+Ys07Ozyz4Fw5u8mMCNsp8gpPJBvEEtYpaVrcchdG
 FslGqvlhZ+3OQYBmC2jlvQr8KJm0YwyCsJGvby9mM1z9U8aANlcWHjtVvucLEV4kbUbZjmbb8yRAHt
 jCOREflssCI0QAZ3JKGUde4+xUbYYjKUGzCcEhQa3uYXhQ5+orFkYi00N44oGJRhYg0sV8bokNLnl8
 bxEaqKSf3RgvJvt5XIaEuaWNSYjIiqIXhji3noDnNroMUirNEsSePMoPAUWKUwhHJi/oVA4cSS9QsM
 VwG3a66Ij2QrqA3ypDXRG/E5ILv8sfPCUQ2ArgzT2kEhpfIqQPbOollVtTUxd1hDDoDH2PtIfK0yg5
 t/TbRkb0vgFF6KCu9NnMZJklFm7NQu6il/glrFVJ5mEHi5yHh/w9VqbH2bU82GyDo3DRoDaTzeMke7
 hypcIOgr7AaHPDPGIumT88PYyO2jA7DkACZ2MXI1WLdPBHnR/c6CPh/YTtHg==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[linaro.org:+];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-103833-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[neil.armstrong@linaro.org,linux-arm-msm@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[10];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 222A643345B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Misc enhancements for the SM8650 platform:
- update the cpus capacity-dmips-mhz
- add the CPU cache sizes
- correct the soundwire ports

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
Changes in v2:
- Add review tag
- Fix l2 cache size to 512KiB
- Link to v1: https://patch.msgid.link/20260128-topic-sm8650-upstream-cpu-props-v1-0-9fbb5efe7f07@linaro.org

---
Neil Armstrong (3):
      arm64: dts: qcom: sm8650: update the cpus capacity-dmips-mhz
      arm64: dts: qcom: sm8650: add CPU cache size properties
      arm64: dts: qcom: sm8650: fix soundwire ports properties

 arch/arm64/boot/dts/qcom/sm8650.dtsi | 110 ++++++++++++++++++++++++++---------
 1 file changed, 83 insertions(+), 27 deletions(-)
---
base-commit: 97e797263a5e963da3d1e66e743fd518567dfe37
change-id: 20260128-topic-sm8650-upstream-cpu-props-0754ccef3e01

Best regards,
--  
Neil Armstrong <neil.armstrong@linaro.org>


