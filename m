Return-Path: <linux-arm-msm+bounces-98589-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +IL1Lyluu2nGjwIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-98589-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Mar 2026 04:31:53 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D8FF2C5833
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Mar 2026 04:31:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id CE0D83101B98
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Mar 2026 03:31:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B5339331A66;
	Thu, 19 Mar 2026 03:31:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JVRenmJd"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 910F923DEB6;
	Thu, 19 Mar 2026 03:31:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773891089; cv=none; b=CzV26Jxx6CsTxuSCJgu7YgzB4leMXMaUGTYzblX3KpX9OUPcQGrr5qhP0sa08xP5kOj0mSnTZyVVzoEuOn29tff7PQV1QoynxCIGduQFjGlXkIdX7RNBfYLbQvcLJWqQuifsjyD6jfs4tTgPB/JmjrlURIbj7So3GY88Q1Rl1n8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773891089; c=relaxed/simple;
	bh=/UFC/XqQJZCaZl+lcVbpBLkGMXAoJmbd0lMmanCsrGc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=V4vlbQwbr63tIZDvJA8cffrGPpjbUbnbC2UC8SpCTF1nIMSF3clW/5mlessRLcyCIfgIpxii29JBNn+qEQHxqu8lZNy5V8uXthfM+SKzwobBcEUeE3yKigo9nn9sn8KOns0XT7kwTFlna0rTvDW8QcyEzAl2VQH/Y6M7wg4C2fY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JVRenmJd; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8B0CFC2BCB1;
	Thu, 19 Mar 2026 03:31:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773891089;
	bh=/UFC/XqQJZCaZl+lcVbpBLkGMXAoJmbd0lMmanCsrGc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=JVRenmJdskGgbXyEBzfC1Ol+0l5QWYTwsyQHt4AAYAEP9LuvzpKwF/b+sbpWAd1EW
	 MBmLLODj4grLzreuMGplzQCzEkxo93WmxY519kxroDGiBBTl9dkPFoNNZX7EMq0lrw
	 k4FLojffw9IEkWHaUyAxwf6f+LQ0nCsjALVEq6ugvtAcX5i6s5Gsem4SjPhJ58aZVM
	 6iKR7VviD4zoBdEeFo6C3igJdaD4lIgbXpvQOAgA9PASTcjyv/c6hr2dlCgbq76hcl
	 0Qi8pkiNCHazRlYef1UivF3JGUNDq+GaeIH6ZKpD91ooFfUlWIlpNweDeRlERMNWdj
	 +LUL2TZ9utLfw==
From: Bjorn Andersson <andersson@kernel.org>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Paul Adam <adamp@posteo.de>
Cc: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	~postmarketos/upstreaming@lists.sr.ht,
	phone-devel@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: Re: [PATCH v5 0/3] Add wiko-chuppito devictree
Date: Wed, 18 Mar 2026 22:31:12 -0500
Message-ID: <177389107882.16612.1366763008526406982.b4-ty@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260311-wiko-chuppito-v5-0-0a8656cca1b3@posteo.de>
References: <20260311-wiko-chuppito-v5-0-0a8656cca1b3@posteo.de>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-98589-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.992];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andersson@kernel.org,linux-arm-msm@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 2D8FF2C5833
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


On Wed, 11 Mar 2026 19:46:04 +0100, Paul Adam wrote:
> Add bindings vor Wiko SAS and wiko-chuppito
> which are used in the devicetree.
> 
> Then introduce an initial device tree for Wiko PULP 4G.
> Includes support for:
> - UART
> - USB (no OTG)
> - Internal storage
> - MicroSD
> - Volume keys + Power button
> - Touchscreen
> - Backlight
> - Accelerometer: Invensense MPU6880
> - Magnetometer: Asahi Kasei AK09911
> - Hall sensor: Rohm BU52021HFV
> - Proximity sensor
> - Vibrator
> - Earpiece
> - Microphone 1
> - Headphones
> - Wifi
> - Bluetooth
> - GPU
> 
> [...]

Applied, thanks!

[1/3] dt-bindings: vendor-prefixes: add WIKO SAS
      commit: 4d829608e382770606525150bbdcc2fad16d3027
[2/3] dt-bindings: arm: qcom: add wiko,chuppito compatible string
      commit: a770fc0ff7f65cdfe130976e07e755310c590d3c
[3/3] arm64: dts: qcom: msm8916-wiko-chuppito: add initial devicetree
      commit: a7a064c0c0cfe15a9f96e62c17cdb640286272bc

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

