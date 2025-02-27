Return-Path: <linux-arm-msm+bounces-49704-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 798E0A4819D
	for <lists+linux-arm-msm@lfdr.de>; Thu, 27 Feb 2025 15:38:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CE74D1898757
	for <lists+linux-arm-msm@lfdr.de>; Thu, 27 Feb 2025 14:27:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BC09627003D;
	Thu, 27 Feb 2025 14:27:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=trvn.ru header.i=@trvn.ru header.b="EfjiAiV/"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from box.trvn.ru (box.trvn.ru [45.141.101.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D75522C35C;
	Thu, 27 Feb 2025 14:27:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.141.101.25
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740666429; cv=none; b=iwpOIoFdokLUqPDvfiYvSHNS2i8FZkM+zlpSTr/Rh/nOLUfxOVC+VbZ6FzsIQMn3TPSs7RqtNxpjsSI8fj5g2cQbelHBC6Y8MqnWzO56txW4WWLfXdVHtfZOTA0nA3XPdd+ydlSIG98+V1Ii5l8NKzD8GdiBwS/2ebVIQZy/QCo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740666429; c=relaxed/simple;
	bh=opU+u0pR30TlhE0rUPVWl+UjMJILCqoaWKI63CQIgW8=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=ezUGzoLxoof4WD6XcH9td+uEpdohSg6y8h7vQuFzDeuf2g38XTOZrxVYiwGqL//M1zv6O+3XjQig4BBKhjPQsSgfEjOzprbxv0WCi8hf8pMpazxt6X33Q4snnBc3YWCxU29QQjafLo+Zt6wRpQyFSgzYzNMO81ek1T7UkSO4Od0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=trvn.ru; spf=pass smtp.mailfrom=trvn.ru; dkim=pass (2048-bit key) header.d=trvn.ru header.i=@trvn.ru header.b=EfjiAiV/; arc=none smtp.client-ip=45.141.101.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=trvn.ru
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=trvn.ru
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=trvn.ru; s=mail;
	t=1740666424; bh=opU+u0pR30TlhE0rUPVWl+UjMJILCqoaWKI63CQIgW8=;
	h=From:Subject:Date:To:Cc:From;
	b=EfjiAiV/joOtveePGxbi/pITX9OS3nucam/wMz5JNWVhPq2D2mWMR/8xotzeYRHJE
	 gqwjdfJGWDom7vK+7BRGXktjAQMg/+XWaHm5JCfkA1poqT7pRTwT8kCJdpnk4V2Apv
	 9wuiKClx4rE71CQDv6cah0iGOnf6TnptoTE6msf9PGzoeceg2Uz2eLlzyMTAJLcQUe
	 lHgMalM7x+962/bdpGIwkORv62CJ38i6KUHszXXWpZGhnxXf1AZ5opPDDMRvJhq4Hd
	 UkG2Sjp91FvvX91BXiYVt1dU9amqYrMSL1bNSXgyGMfrgYR35lh2bsu2L/dpduBG3+
	 ODiWTDPfRQczg==
Received: from authenticated-user (box.trvn.ru [45.141.101.25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by box.trvn.ru (Postfix) with ESMTPSA id 7CFC61CA2;
	Thu, 27 Feb 2025 19:27:03 +0500 (+05)
From: Nikita Travkin <nikita@trvn.ru>
Subject: [PATCH v2 0/2] {vision/navigation}-mezzanine: Fix overlay root
 node
Date: Thu, 27 Feb 2025 19:26:47 +0500
Message-Id: <20250227-qcom-nonroot-overlays-v2-0-bde44f708cbe@trvn.ru>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIACd2wGcC/4WNQQ6CMBBFr0K6dkyZhkpceQ/DAsogTbSj09pIC
 He3cgGX7yX//VVFEk9RnatVCWUfPYcCeKiUm/twI/BjYYUaG41o4eX4AYGDMCfgTHLvlwjDRFi
 PxgzUOlW2T6HJf/butSs8+5hYlv0m1z/7r5hr0IDWWTpZ3bTGXJLkcJS36rZt+wLloeoyuAAAA
 A==
X-Change-ID: 20250226-qcom-nonroot-overlays-bfe21d33be8c
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Nikita Travkin <nikita@trvn.ru>
X-Developer-Signature: v=1; a=openpgp-sha256; l=1993; i=nikita@trvn.ru;
 h=from:subject:message-id; bh=opU+u0pR30TlhE0rUPVWl+UjMJILCqoaWKI63CQIgW8=;
 b=owEBbQKS/ZANAwAIAUMc7O4oGb91AcsmYgBnwHY0EAtJMoKl/y/ihk2Z+Yl8rmecAual2KZh2
 tRJIhuynViJAjMEAAEIAB0WIQTAhK9UUj+qg34uxUdDHOzuKBm/dQUCZ8B2NAAKCRBDHOzuKBm/
 dTHOD/4tJBIOouXws5AAp9yhrRd0kUM4v/Snldt+8Ol7vOGt1BlRUh2uIrl0YCUSUecrf+PKXTO
 McmnxvZS4ekrAjXo8VrHZLHn0VnHpNZVn3GTl+FNMgLeYuuvWDRs/MhEHwTyykOwkC4rkNURwTn
 hAvcl5UVvzcKUJABb12190KUfqR6KX/rPkNneZ5vv/23sgj2OmXuoYYTg2N5AWAmpOMNei8ojyt
 Ali0MuRD3AhBcgrn80IFTLHZ80/KzOQoqYqTuOxAr48Kc9CyihnGHWtpJ+QTPhOvOz1YfAZ0fx/
 7R/0v8Qw78EmLvHeyg4noGwbyywrxTtxO628HF6Rz6j2olZbEpfax3W2dLQPRkKxKj5a0LJYR/o
 j4V4j/B4VpavyZ8C2jpkL1TvZVb3Xixo9CgCIq5HFisLaYZCDxJ7C4FhfUSm8WofH+/sDkRgX+s
 EIWHo1vRJGJWURsF49qJEYSj3pZhcgAB/Xa8YHLyJteFNh3XFhy8rB9AsVu9ByvVx4MzJeE/3Vz
 +NhxboRpEHE8ngRv4YPa8vUXylPWiWjfr8mI+DvkQOMPQYytrQR/Vna1qdp4uwp5Tf9Av3QQlSC
 ntIjbTd0huvjCAo1r4raqc1QiD8AgtZ0kzxNeHXlKNgjNBbycfwDGB8R9pYBx8E5N1HB95GxIcg
 HuEiYl3SzF1M0RA==
X-Developer-Key: i=nikita@trvn.ru; a=openpgp;
 fpr=C084AF54523FAA837E2EC547431CECEE2819BF75

While considering to propose WoA EL2 dt overlays upstream I was looking
at existing overlays and noticed that some of them are broken: they put
seemingly meaningful fixups into the overlay's "/" node, which places
them into the overlay "metadata" itself, not into a fixup fragment to be
applied to the actual dtb. This series fixes those two by changing to
full path "&{/}" which should work as it was initially intended.

See demonstration of the problem below:

$ cat base.dts
/dts-v1/;
/ {
	compatible = "fake,board";
	fake,value = <42>;
};

$ cat extra.dtso
/dts-v1/;
/plugin/;

/ {
	foo;
	bar { baz; };
};
&{/} { whatever-comes-next-after-baz; };

$ dtc base.dts -o base.dtb
$ dtc extra.dtso -o extra.dtbo
$ fdtoverlay -i base.dtb -o combine.dtb extra.dtbo
$ dtc base.dtb
/dts-v1/;

/ {
	compatible = "fake,board";
	fake,value = <0x2a>;
};

$ dtc extra.dtbo
/dts-v1/;

/ {
	foo;

	bar {
		baz;
	};

	fragment@0 {
		target-path = "/";

		__overlay__ {
			whatever-comes-next-after-baz;
		};
	};
};

$ dtc combine.dtb
/dts-v1/;

/ {
	whatever-comes-next-after-baz;
	compatible = "fake,board";
	fake,value = <0x2a>;
};

In the resulting dtb foo bar and baz are missing.

Signed-off-by: Nikita Travkin <nikita@trvn.ru>
---
Changes in v2:
- Just revert the original commits (Bryan)
- Link to v1: https://lore.kernel.org/r/20250226-qcom-nonroot-overlays-v1-0-26c6e7605833@trvn.ru

---
Nikita Travkin (2):
      arm64: dts: qcom: qrb5165-rb5-vision-mezzanine: Drop CMA heap
      arm64: dts: qcom: sdm845-db845c-navigation-mezzanine: Drop CMA heap

 arch/arm64/boot/dts/qcom/qrb5165-rb5-vision-mezzanine.dtso    | 11 -----------
 .../boot/dts/qcom/sdm845-db845c-navigation-mezzanine.dtso     | 11 -----------
 2 files changed, 22 deletions(-)
---
base-commit: be5c7bbb3a64baf884481a1ba0c2f8fb2f93f7c3
change-id: 20250226-qcom-nonroot-overlays-bfe21d33be8c

Best regards,
-- 
Nikita Travkin <nikita@trvn.ru>


