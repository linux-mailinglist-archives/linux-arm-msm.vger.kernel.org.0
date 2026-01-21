Return-Path: <linux-arm-msm+bounces-89940-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yCdiK/Y7cGmgXAAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-89940-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 Jan 2026 03:37:42 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B5DB4FDFB
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 Jan 2026 03:37:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id E49E9A2CFD6
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 Jan 2026 02:37:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B6F9D346E4F;
	Wed, 21 Jan 2026 02:36:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="tELJxsNq"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87AAC346ACE;
	Wed, 21 Jan 2026 02:36:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768962963; cv=none; b=NDsUJYJa6IhvxnVqJfkEvo1e1+/vaWPWaVYzGSIaFM/vNxBKAjMGeAOYB9fy3InfMnpQs+pevoXhUFJtVvyPewkeiMTJ1aCocCAB2MpCAezDfVZbFqILcKszUc3WNI7h4PWsGRWdIaL2Ky3cks5U9kGFixxqh72bq3nbwQt09wQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768962963; c=relaxed/simple;
	bh=XGS/C4+dQ/MQcbeNze+TLdbIkN63FPlGdIp9X0YopKQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=MVMWNnaX8PZUE8HhuzDKECI9+Z+rKGkBuZEYQv67vo5YHX4TEx288hg2nn/hpoOokdHcMxCBlgP7VtRlYh90qGkavnKY0xIKUDBY94NSNKyKqd1hZaNugGfazBh2O4EEQmVeufHuBC2NFEDw4oF4KdzheuNhpN2+vmLvOeZHU/0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=tELJxsNq; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BF703C2BC87;
	Wed, 21 Jan 2026 02:36:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768962963;
	bh=XGS/C4+dQ/MQcbeNze+TLdbIkN63FPlGdIp9X0YopKQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=tELJxsNqzZMYdqxd+6NcnANbM+4awqj5BUrHvwLfi1q3teM32VjaTW3BmbTjdidPx
	 hTIxnzdwEsjDGbJE8/tCufDDLBNwYJf7mZw+vLAdNGetoMzytYHkfSG+GEvUlCb3Ko
	 1tg5U41FUe0oEVMw5cALlHkO3grXdTOg/BY1nUqr9Ce0sl68NkM1TTPIcgm3siG0dm
	 +UOZi1kSSEB4K/Z53IWJMbf2FRZtLc7dOney/F94r4wvcQqwsino0JBdBiHpChjWWg
	 QitmQFqAQ6oSVVKx9k3ThuHK8F2ledH9Ey1l9rlC2AFJZ0MvwW9lQnOjXrtTNedBjM
	 eT0exqfYTgQyg==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jonathan Cameron <jic23@kernel.org>,
	David Lechner <dlechner@baylibre.com>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>,
	Rudraksha Gupta <guptarud@gmail.com>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-iio@vger.kernel.org,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: (subset) [PATCH v4 0/6] ARM: dts: qcom: msm8960: expressatt: Add more peripherals
Date: Tue, 20 Jan 2026 20:35:52 -0600
Message-ID: <176896294106.1060469.2033786103404524478.b4-ty@kernel.org>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251124-expressatt_nfc_accel_magn_light-v4-0-9c5686ad67e2@gmail.com>
References: <20251124-expressatt_nfc_accel_magn_light-v4-0-9c5686ad67e2@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-0.46 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-89940-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,baylibre.com,analog.com,gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[14];
	MIME_TRACE(0.00)[0:+];
	DMARC_POLICY_ALLOW(0.00)[kernel.org,quarantine];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	R_SPF_SOFTFAIL(0.00)[~all:c];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andersson@kernel.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	ASN(0.00)[asn:7979, ipnet:2a01:60a::/32, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ams.mirrors.kernel.org:rdns,ams.mirrors.kernel.org:helo]
X-Rspamd-Queue-Id: 2B5DB4FDFB
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


On Mon, 24 Nov 2025 15:35:21 -0800, Rudraksha Gupta wrote:
> Intro:
> =================
> The following is now working on the Samsung Galaxy Express SGH-I437, an
> old 2012 Android phone:
> - Light Sensor
>     - Proximity is currently floating, even though it matches downstream
>       GPIO pin
> - Magnetometer
>     - Regardless of orientation:
>         - X axis seems to always be negative
>         - Y and Z axis seems to always be positive
> - NFC
> - Accelerometer
> 
> [...]

Applied, thanks!

[1/6] ARM: dts: qcom: msm8960: Add GSBI2 & GSBI7
      commit: 4535af3dc91c43c16c31e4e2ad9e79cead0ef308
[2/6] ARM: dts: qcom: msm8960: expressatt: Add Light/Proximity Sensor
      commit: 72c6158e17cd3ef2069423ae70a24b955b1c0b72
[3/6] ARM: dts: qcom: msm8960: expressatt: Add NFC
      commit: 7f07c27808e68af92cbf6d352f675248c3ea7cab
[4/6] ARM: dts: qcom: msm8960: expressatt: Add Magnetometer
      commit: 3649a120a7106aca89a4eddbddbc2e5a85aa64f9
[6/6] ARM: dts: qcom: msm8960: expressatt: Add Accelerometer
      commit: 7f45d77240f9fc9948ba4d9c4eec3b97c3e2c51d

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

