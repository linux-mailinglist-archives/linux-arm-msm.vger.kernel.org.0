Return-Path: <linux-arm-msm+bounces-51425-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E1F8A6142C
	for <lists+linux-arm-msm@lfdr.de>; Fri, 14 Mar 2025 15:55:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B64213B7F23
	for <lists+linux-arm-msm@lfdr.de>; Fri, 14 Mar 2025 14:54:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CF28B2010E1;
	Fri, 14 Mar 2025 14:55:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ibRlZnVY"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3B071DD0F6;
	Fri, 14 Mar 2025 14:55:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741964107; cv=none; b=F/mIxwPu21YFx5NP0swrAJYQBcKjcXKQ1JAg53DmpxbI6UQA6wQVCPihcfhw/uGTY73d3clhVEr7nXjWElQmijO+/Cgx8MzjVpP1jGl9nHFaLGb/YPAhRJ6YwCUPgqd0f4V3u3VAeQjVmU7D6NWKuaZUtb0g2vRatA3LeFZL4R4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741964107; c=relaxed/simple;
	bh=OdRwL9wibjHgxeSnK/wuK1cRL6Nw7BFn6J3Acbb0H7Y=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=SoTzbhQx65fTEFv1yL5L44dR7xO/bs37/vbIy7EBvM6cgLeB/xR0NdoSRz6L9t2nkDTZ2VubRgOrbWP88vEHoQmJoJaU5/HoeFjjLcvxyAA34vL48WtornLlJv8+vCf65NI0GtQZity9jsZX3hTNVlp/XHgTeL9YfdqiBsp3Ijw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ibRlZnVY; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 326ACC4CEEB;
	Fri, 14 Mar 2025 14:55:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741964107;
	bh=OdRwL9wibjHgxeSnK/wuK1cRL6Nw7BFn6J3Acbb0H7Y=;
	h=From:To:Cc:Subject:Date:From;
	b=ibRlZnVYUR8sZZzChhJlo0gbZrAYG1n9LqH2qJJ8M/7uO+B2flJoCvU2byzSOCnn/
	 ovuodgd28xjA3hUOezITytgO8BR6K2EFeJ2+RkKx9l9czemRXtYjFbblWr5zaYJ3oc
	 T+m3YIFPeF9Se8LGkkM5JMgLRXyiY/L5Geffm570M7FIKjndzjsPdVclFsX+N6mxp6
	 E9pvbFdDS1Aa5y7titRHZRAZNexTg7TBFUZ42dSGwvvHoopcjUwbpw9kcU+pPqMiBG
	 U2pcYx7BLP3G/e3zcKql/AyBfT7RjKn6jGZBE8Miu45BSqav37XOTpTQcJXKBxpsho
	 QrriFnj1XXZDQ==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan+linaro@kernel.org>)
	id 1tt6RG-000000002yU-1lEC;
	Fri, 14 Mar 2025 15:55:06 +0100
From: Johan Hovold <johan+linaro@kernel.org>
To: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Johan Hovold <johan+linaro@kernel.org>
Subject: [PATCH v2 0/8] arm64: dts: qcom: x1e: mark l12b and l15b always-on
Date: Fri, 14 Mar 2025 15:54:32 +0100
Message-ID: <20250314145440.11371-1-johan+linaro@kernel.org>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The l12b and l15b supplies are used by components that are not (fully)
described (and some never will be) and must never be disabled.

Mark the regulators as always-on to prevent them from being disabled,
for example, when consumers probe defer or suspend.

Note that there are likely votes from other processors for these rpmh
regulators (at least for l15b) but the OS should not rely on that in any
case.

Included is also a patch that adds the missing HID supplies for the
T14s. It was a corresponding change for the CRD that made me look into
this to make sure these supplies were not disabled during suspend or on
probe deferrals.

Johan


Changes in v2
 - rebase on x1-crd and t14s dtsi renames


Johan Hovold (8):
  arm64: dts: qcom: x1e80100-crd: mark l12b and l15b always-on
  arm64: dts: qcom: x1e78100-t14s: mark l12b and l15b always-on
  arm64: dts: qcom: x1e001de-devkit: mark l12b and l15b always-on
  arm64: dts: qcom: x1e80100-dell-xps13-9345: mark l12b and l15b
    always-on
  arm64: dts: qcom: x1e80100-hp-x14: mark l12b and l15b always-on
  arm64: dts: qcom: x1e80100-yoga-slim7x: mark l12b and l15b always-on
  arm64: dts: qcom: x1e80100-qcp: mark l12b and l15b always-on
  arm64: dts: qcom: x1e78100-t14s: fix missing HID supplies

 arch/arm64/boot/dts/qcom/x1-crd.dtsi          |  2 +
 arch/arm64/boot/dts/qcom/x1e001de-devkit.dts  |  2 +
 .../qcom/x1e78100-lenovo-thinkpad-t14s.dtsi   | 45 +++++++++++++++++++
 .../dts/qcom/x1e80100-dell-xps13-9345.dts     |  2 +
 .../dts/qcom/x1e80100-hp-omnibook-x14.dts     |  2 +
 .../dts/qcom/x1e80100-lenovo-yoga-slim7x.dts  |  3 +-
 arch/arm64/boot/dts/qcom/x1e80100-qcp.dts     |  2 +
 7 files changed, 57 insertions(+), 1 deletion(-)

-- 
2.48.1


