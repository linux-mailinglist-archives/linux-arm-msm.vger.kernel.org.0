Return-Path: <linux-arm-msm+bounces-100741-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0IFaOt1Qymmb7QUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-100741-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Mar 2026 12:30:53 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 66FE53594F2
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Mar 2026 12:30:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 9EE1330604E9
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Mar 2026 10:18:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5D7E53BAD96;
	Mon, 30 Mar 2026 10:14:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CWe9PHJ/"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E0D63BD629
	for <linux-arm-msm@vger.kernel.org>; Mon, 30 Mar 2026 10:14:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774865663; cv=none; b=b49xWYg7E4Bl5E+lhzKj/BDHAC4W+FZqT3/k74o6iQGKhUClklj1ZCMB6kX+0xMi1245RRw4l9YTwaPnRgaDxjUr5XkGmIIOdnGhqXnM+XuLsLonN6qvhnLnK+Bjvrh5qPZ7+J5DjAruniCifH9t7UeJ3CuIDdYeJzLB5v8caRc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774865663; c=relaxed/simple;
	bh=VNUz0WiHOuF9ZjXRU42hQEkj+M2Tlz+LSPf+IMOY+mA=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=ap23Lib/+u4YbgmmlcvYhhQsZXYjh9msh8b/saLLddmueoqTMpoZcPTE2MH9hwS6DUynaBpM2bd4/oMOd2huLr3HeZccFUHmu6coTw+P7f1BdDYlzjZVk9mRY6nPUDgu+d20RUqewX6+bvaFbopfiRZSfAcO4duCGnOFfvKM4yI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CWe9PHJ/; arc=none smtp.client-ip=209.85.210.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-82a893d289bso1840633b3a.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 30 Mar 2026 03:14:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774865661; x=1775470461; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=6X2KX1P20FWcEf3JZUQZZD6U+N7BccVzrtbGiYYMsJc=;
        b=CWe9PHJ/Z07fS7sJXYXBwcKQ6K25SqQ0gFjPrviJkM9+c6u6Q2VoBztAUytk/4hxAI
         Si4r3RT9iEAb2+zyEw9vQMxPQWhkLS9KlqNFPdhOR9c8Jh/CsdPZ3v1vyzu+jRhWEsg8
         puq6DKhY+WgMt5vnjiETwUVn9Oyyb0yDOSbmmQiN6ybXF6jER4PBPee7z1CuPeCs+WYV
         yKDoHutsM43HJssmPwPy07ya3uobbN8HPMi0HkKUrBcXZIOuvSkiDuETk6wxifo0Y/02
         1GX/K2fBER0HjiIdkJro6yPnNuSwyIKWQSVC2Q0QnuDSBzyOMFf8U+IyVldFySPulEHc
         gtIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774865661; x=1775470461;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6X2KX1P20FWcEf3JZUQZZD6U+N7BccVzrtbGiYYMsJc=;
        b=V1n83oXCILDIF8bx+yfZJ2tHrlYxxkCRdlOmMcZHOSlDWxnHDk5xXTAbNC0w6r7NRR
         gQjleSjOzbvycTGImgbQwn0L0jU2IXbpxvHO7jMk+zxLzlGjCm/TU+vzDg9mxHtzaocc
         z+RLc3Knpw4QP75GRr/8id0c8/UiGTDN1fZA9CqAf50lfmiNQHKUV+aAx0QM+FKxdzdf
         nHrUrCMSOK2WZzsMik18kTkoecu/m5eN52hkPi96qPaz0cHnJT2IWAXKX5mAuj+kTJQh
         Ooh+BiocrkPY1gR992AFUziVI6apAw121hoL+tpUO8QXQ/qc4cKUs58/NgJ0UXXHgu62
         RwCA==
X-Gm-Message-State: AOJu0YyNza4wdB38aeRolucmE8N4xRf9ZiWvMOWAxD8Sk5YOHuOpp4pO
	utOBV5DInbiwQPArM1WYK7mm6dovhA3cCPSUyisAruzvnglVFsI36EDw
X-Gm-Gg: ATEYQzyohydQt5tDNOmneYgorrahSnxaFifg9oyt5PGHf/k6mcq7sonPxi/334IWzD0
	Xb5Ya/AighhweQvEDw4s8ENAQxWZuVftz0lijc+/F7LoWyzYjF9MP0GkDE5VtX1TkwMb5o3tWpG
	pczBY90eKm0p1uKUcAviReF6eT0h4qffrfT+XZLlHYjNaftb/xdR5dbhp7G1azUUg2Q4tGjDOK5
	qFWD1i3gy3CrXSLFawFrZGcOVyzlbAlZqOIvWflbry4hJL6c0S8Vz/AZlBOO0M6D3xsCLlvwu4p
	jUUJwZC2eG0E23fuYfKyjul5/7qRWOFO9H3I2Yl48gIhIlUnxTyQiqBGJ5hsvnxk8NPzfxbvrYA
	Hioso0O8SA8tJ/Pnif6gA4aGOSoiOJ1pmsBQjMWy1d3Fbh6E94iYUvxDnXrPmjLJJENXTE6/LVK
	GX9WST0deO3+KVHl+j2wt8MEqSKjLL
X-Received: by 2002:a05:6a00:2d22:b0:829:7e6d:cf19 with SMTP id d2e1a72fcca58-82c9604e3eamr12068833b3a.48.1774865661480;
        Mon, 30 Mar 2026 03:14:21 -0700 (PDT)
Received: from [192.168.0.101] ([43.226.29.240])
        by smtp.googlemail.com with ESMTPSA id d2e1a72fcca58-82ca843d8e5sm8286080b3a.5.2026.03.30.03.14.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Mar 2026 03:14:21 -0700 (PDT)
From: Biswapriyo Nath <nathbappai@gmail.com>
Subject: [PATCH v3 0/7] Add vibrator, IR transmitter and USB-C handling in
 xiaomi-ginkgo
Date: Mon, 30 Mar 2026 10:13:47 +0000
Message-Id: <20260330-ginkgo-add-usb-ir-vib-v3-0-c4b778b0d7f8@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/4WNyw7CIBBFf8WwdgylgI+V/2FcQJni+GgNWKJp+
 u9C3bgxLk9y7zkjixgII9stRhYwUaS+y1AvF6w5mc4jkMvMBBea10KBp+7iezDOwRAtUIBEFqR
 RlXXbttXSsvy9B2zpOXsPxw/HwZ6xeRRZWZwoPvrwmsOpKrt/jVQBByl1o3GjlXF672+Grqumv
 7HSSOLbsv1lEdmyWXPka6lQKfy2TNP0BhIniOgSAQAA
X-Change-ID: 20260325-ginkgo-add-usb-ir-vib-4a51bd9ff64b
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>, 
 Pavel Machek <pavel@kernel.org>, Sean Young <sean@mess.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Martin Botka <martin.botka@somainline.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org, 
 linux-clk@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht, 
 phone-devel@vger.kernel.org, Biswapriyo Nath <nathbappai@gmail.com>, 
 kernel test robot <lkp@intel.com>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1774865654; l=1678;
 i=nathbappai@gmail.com; s=20260118; h=from:subject:message-id;
 bh=VNUz0WiHOuF9ZjXRU42hQEkj+M2Tlz+LSPf+IMOY+mA=;
 b=6qtUaGdDI9jVxrq7nw0ul7y7KHNjMnLjk9RJWUW6JooNXQCD3dMrFQbkk1HrPWfdOVoV8A77P
 ZbKn+kiOMLzBEVGgmMWp6/e32akF66p3yDZa9ZZuwmlCNEb8Uf2gLJp
X-Developer-Key: i=nathbappai@gmail.com; a=ed25519;
 pk=slmb/9yXbet+KTiT3EYLCp0p0MEOYa3EdjUXP+HXfjg=
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-100741-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[vger.kernel.org,lists.sr.ht,gmail.com,intel.com,oss.qualcomm.com];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[23];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[nathbappai@gmail.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,msgid.link:url]
X-Rspamd-Queue-Id: 66FE53594F2
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

This patch series add support for various components in Xiaomi Redmi
Note 8.

Most notably:
- IR transmitter
- USB-C OTG
- Vibrator

Also, fix some bindings warning as reported due to previous commits.
These are tested with linux-next tag next-20260320.

Signed-off-by: Biswapriyo Nath <nathbappai@gmail.com>
---
Changes in v3:
- Fix dispcc-sm6125 binding by adding qcom,gcc reference.
- Link to v2: https://patch.msgid.link/20260329-ginkgo-add-usb-ir-vib-v2-0-870e0745e55e@gmail.com

Changes in v2:
- Move bindings fixes to first in the series and add fixes tag.
- Link to v1: https://patch.msgid.link/20260325-ginkgo-add-usb-ir-vib-v1-0-446c6e865ad6@gmail.com

---
Biswapriyo Nath (7):
      arm64: dts: qcom: sm6125: Use 64 bit addressing
      dt-bindings: clock: qcom,sm6125-dispcc: reference qcom,gcc.yaml
      arm64: dts: qcom: sm6125-xiaomi-ginkgo: Enable vibrator
      arm64: dts: qcom: sm6125: Enable USB-C port handling
      arm64: dts: qcom: sm6125-xiaomi-ginkgo: Add PMI632 Type-C property
      dt-bindings: leds: irled: ir-spi-led: Add new duty-cycle value
      arm64: dts: qcom: sm6125-xiaomi-ginkgo: Add IR transmitter

 .../bindings/clock/qcom,dispcc-sm6125.yaml         |  17 +--
 .../devicetree/bindings/leds/irled/ir-spi-led.yaml |   2 +-
 .../boot/dts/qcom/sm6125-xiaomi-ginkgo-common.dtsi |  56 +++++++
 arch/arm64/boot/dts/qcom/sm6125.dtsi               | 168 +++++++++++----------
 4 files changed, 154 insertions(+), 89 deletions(-)
---
base-commit: 785f0eb2f85decbe7c1ef9ae922931f0194ffc2e
change-id: 20260325-ginkgo-add-usb-ir-vib-4a51bd9ff64b

Best regards,
--  
Biswapriyo Nath <nathbappai@gmail.com>


