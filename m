Return-Path: <linux-arm-msm+bounces-39136-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E8969D8C9F
	for <lists+linux-arm-msm@lfdr.de>; Mon, 25 Nov 2024 20:11:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E86C728A787
	for <lists+linux-arm-msm@lfdr.de>; Mon, 25 Nov 2024 19:11:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B63DE1B6D18;
	Mon, 25 Nov 2024 19:11:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="URsTvXtI"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 889BC40C03;
	Mon, 25 Nov 2024 19:11:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732561891; cv=none; b=Wsg6l5hALZ/FB0UizRWALZiStE72mEW4xTbcD7MVQJ95UE7XI+SkQh2WMFEe8wrXDA8W/ZyLcMgXJFHEAzrgzqxSIY+RZNSee/c1hUBTES3m64UPYGGglNi34fUERFm1gmth1s4EOsCIzO7dAzlqZ0rjs3GBnuRv4eSXRWEd2Hc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732561891; c=relaxed/simple;
	bh=eFUTVbLHQaMj7xbeYC7nH7CHXsIUv43Pb2cwsd9S9X4=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=bLMb1u2/NTXQbzoO4NZXgCWma8lWeT9nPa/Px8hBKwufNcbwMPDyZaFBUD6tcYb7b6dX1BuIykuawbzf1pydooLNx0qyarYiQUpAFnyHJF0V3eY4X9xT1Ke0n6OgB7joIsMPGfEWL3K17o+AbJKT7n7TcKnJo+TMwRX3AKX4vro=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=URsTvXtI; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 0ADA5C4CECE;
	Mon, 25 Nov 2024 19:11:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1732561891;
	bh=eFUTVbLHQaMj7xbeYC7nH7CHXsIUv43Pb2cwsd9S9X4=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=URsTvXtICky+cYvwmMQh/znQ2zUfi51g7JaSoz8xIKxbmaUbChqU41od8klBB42kv
	 Wcd5zlMMy91tkXqVUw7xdC7RyfEMnHJQVPYOVILa7MFkmvCKn7bwnxaPENsehRkwGS
	 foVLg/slZCDJue6fSSjWYA/lAVssHT7IjAqHKax3EVwTb85HzwTUFIuq5yox1wKwYp
	 0sXBwlOMWuNr2XzGk06yjNzs780ceTySxoBr4mABG5PsGuSCyFjdhpkUImlxI/q/ES
	 2Ze62LrjbTWYvcbX7fcxwhpB3OdvrTVeU188uFXcatKV18YsvLy/kYNUualmCC+DI1
	 tVOt/pt0U1pMA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ED2C2D3B7C1;
	Mon, 25 Nov 2024 19:11:30 +0000 (UTC)
From: Maud Spierings via B4 Relay <devnull+maud_spierings.hotmail.com@kernel.org>
Subject: [PATCH v4 0/3] Asus vivobook s15 improvements
Date: Mon, 25 Nov 2024 20:11:16 +0100
Message-Id: <20241125-asus_qcom_display-v4-0-61a4da162406@hotmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIANTLRGcC/4XNTQ6CMBAF4KuQrq1pp+XPlfcwhhRopQlQbLGRE
 O5uIS40krh8k/e+mZGTVkuHTtGMrPTaadOHwA8RqhrR3yTWdcgICHBKaYKFe7jiXpmuqLUbWjH
 hSsZKpZAzxgkKu8FKpZ+bebmG3Gg3GjttLzxdr28N2I7mKSY4i0WuVA6cCHFuzNgJ3R5DC62eh
 78GBEOQUqksTpPQ+zXYp8H3DBYMQqBMgZU0B/JtLMvyAn/F1wY8AQAA
X-Change-ID: 20241116-asus_qcom_display-ce5ff7293340
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Douglas Anderson <dianders@chromium.org>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 Maud Spierings <maud_spierings@hotmail.com>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1732561888; l=1871;
 i=maud_spierings@hotmail.com; s=20241110; h=from:subject:message-id;
 bh=eFUTVbLHQaMj7xbeYC7nH7CHXsIUv43Pb2cwsd9S9X4=;
 b=Id8inyzU8O10Eg3QvPqZBZb3O9cdwzrt+zEAv1gLliZeIDkn0BpXbQbU3ituB1KbKD2Oq/Un1
 KL8Rilx5LdnBnDuxOrqAA70SGOU/b3GC+LmHg1q/9QWAS1Lm1gdygyJ
X-Developer-Key: i=maud_spierings@hotmail.com; a=ed25519;
 pk=CeFKVnZvRfX2QjB1DpdiAe2N+MEjwLEB9Yhx/OAcxRc=
X-Endpoint-Received: by B4 Relay for maud_spierings@hotmail.com/20241110
 with auth_id=273
X-Original-From: Maud Spierings <maud_spierings@hotmail.com>
Reply-To: maud_spierings@hotmail.com

Improves several parts of the devicetree:
1. The eDP panel bindings
2. Add a lid switch
3. Add bluetooth and describe wlan (depends on [1])

[1]: https://lore.kernel.org/all/20241007-x1e80100-pwrseq-qcp-v1-0-f7166510ab17@linaro.org/

---
I seem to get a warning that the pci17cb vendor is undocumented (wlan)
I can find this compatible in
Documentation/devicetree/bindings/net/wireless/qcom,ath12k.yaml
But pci17cb doesn't really seem like a vendor name to me, I have ignored
this warning for now.

Changes in v4:
- Fixed the pin parameters for the backlight enable pin
- Fixed the wcn_sw_en drive-strength, this was not in the acpi table I
  checked.
- Fixed the ordering of several nodes in the bluetooth/wifi patch
- Link to v3: https://lore.kernel.org/r/20241124-asus_qcom_display-v3-0-002b723b1920@hotmail.com

Changes in v3:
- Fixed commit message formatting (line wrapping)
- Fixed bad indentation (lid switch pinctrl)
- Fixed bluetooth addition and added wifi description
- Link to v2: https://lore.kernel.org/r/20241123-asus_qcom_display-v2-0-a0bff8576024@hotmail.com

Changes in v2:
- Add missing gpiokeys include in the lid switch patch
- Add depends on for the bluetooth patch
- Link to v1: https://lore.kernel.org/r/20241123-asus_qcom_display-v1-0-85a9ff9240aa@hotmail.com

---
Maud Spierings (3):
      arm64: dts: qcom: x1e80100-vivobook-s15: Use the samsung,atna33xc20 panel driver
      arm64: dts: qcom: x1e80100-vivobook-s15: Add lid switch
      arm64: dts: qcom: x1e80100-vivobook-s15: Add bluetooth

 .../boot/dts/qcom/x1e80100-asus-vivobook-s15.dts   | 203 ++++++++++++++++++++-
 1 file changed, 202 insertions(+), 1 deletion(-)
---
base-commit: 5f48de798324665d18f539ee09a61de1a9221f33
change-id: 20241116-asus_qcom_display-ce5ff7293340

Best regards,
-- 
Maud Spierings <maud_spierings@hotmail.com>



