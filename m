Return-Path: <linux-arm-msm+bounces-117714-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id yojAEQxpTmqgMAIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-117714-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 08 Jul 2026 17:13:16 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 99E76727D11
	for <lists+linux-arm-msm@lfdr.de>; Wed, 08 Jul 2026 17:13:15 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=NLgHOiUI;
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-117714-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-117714-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 03E4E3233DC0
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Jul 2026 15:00:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C576B4D990A;
	Wed,  8 Jul 2026 14:57:27 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 914874D98EB;
	Wed,  8 Jul 2026 14:57:26 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783522647; cv=none; b=L1wPohRSifagLz/H6lzSeJS6FpR49Prco5LyKIIeRIKz41rcgbHZLLyc5ZKBfVzV1WlAuGwLICpT3Tn/+bkpsBmvAQP5zy0a8byVr4YhOIBDe8UjkgkKoNKaNZD9yap/4W6Q6aVfFxJJRkTT0WrdrcTzS6LsBWadKPlHc+8eXpQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783522647; c=relaxed/simple;
	bh=cWuHuvMQn7cryUZl4aEK3DqyJlk+k8ROK6uoBZLTmEI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=IQIc4cC05LuJjZD/EFhUkdgPh/VvcdTy4mOE0HX9HAfcxebixA9z/ySNZIzQW2Tdm6GRqwLcYCkv6hUni125vFcQ80uzBufkRtqaztW0sZ+mmx9JJEi7FfCp68KtcBzUhzBabC2YGVDbS2qxzWZ6biUZgQaEV+QzVrWqghUUrYs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NLgHOiUI; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5A4691F00A3E;
	Wed,  8 Jul 2026 14:57:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783522646;
	bh=1AEOGD7tepPpdow0CgoXEhawh84QbbF6h38DG4xEU5c=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=NLgHOiUIswsH7+b+3J+XDbYvMBbNMsOYVocAcY3T2e70bCPxOQC+F0a0EIVN/NKFU
	 uiRSpHTd8Icf7qCaxerJQnsjLmJIvM24GQHP8WrNGMLZm7KfNjr+iLEDHjOMJZPsGJ
	 oF5SDpk0NzKmzCBbeO2GHgGFrh6Gq3CyKFGgIWjqZ0fB1vDxyTnQMWjGKh+Yw3eg4G
	 Dj75Y8V9XV1DxMZaM69N7O3LI40YHWYCKQt5F7G8ZasUj5+4Ngjo6Xjr6cYkVK1GA9
	 OrN6ixuARFM/+pFFNBHlqV5jtSkc9bKZToa4M8PPSviKSmvk244w1XfJP0CQ7Qm2Ah
	 IfzlfhCDyczcQ==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Johan Hovold <johan@kernel.org>,
	=?UTF-8?q?J=C3=A9r=C3=B4me=20de=20Bretagne?= <jerome.debretagne@gmail.com>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	Jens Glathe <jens.glathe@oldschoolsolutions.biz>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Stephan Gerhold <stephan.gerhold@linaro.org>
Subject: Re: [PATCH v3 00/10] Microsoft Surface Pro 9 5G update
Date: Wed,  8 Jul 2026 09:56:26 -0500
Message-ID: <178352261604.2235436.45961494988805206.b4-ty@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260604-surface-sp9-5g-for-next-v3-0-6aa6f6612c10@gmail.com>
References: <20260604-surface-sp9-5g-for-next-v3-0-6aa6f6612c10@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.66 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:johan@kernel.org,m:jerome.debretagne@gmail.com,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:konrad.dybcio@oss.qualcomm.com,m:jens.glathe@oldschoolsolutions.biz,m:brgl@kernel.org,m:stephan.gerhold@linaro.org,m:conor@kernel.org,m:jeromedebretagne@gmail.com,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[andersson@kernel.org,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[14];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-117714-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[kernel.org:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andersson@kernel.org,linux-arm-msm@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 99E76727D11


On Thu, 04 Jun 2026 18:18:36 +0200, Jérôme de Bretagne wrote:
> This series updates the support for the Microsoft Surface 9 5G
> (Arcata), bringing it more up-to-date and aligned with the other
> sc8280xp models such as the Lenovo ThinkPad X13s.
> 
> As highlights, it finally enables the built-in screen, it fixes
> Display Port alt mode on the top left-side USB-C port, it enables
> the volume up/down keys and the lid switch.
> 
> [...]

Applied, thanks!

[01/10] arm64: dts: qcom: sc8280xp-arcata: Enable backlight
        commit: e53655dac60665ffc736914f336493c5f45977a0
[02/10] arm64: dts: qcom: sc8280xp-arcata: Enable the eDP display
        commit: 587ea6a79584b5323e5eb3e2435c858177cca49c
[03/10] arm64: dts: qcom: sc8280xp-arcata: add USB-C orientation GPIOs
        commit: 784b0cdc237d98f1ae7c6adec0165676c98a2614
[04/10] arm64: dts: qcom: sc8280xp-arcata: Fix top USB-C DP alt mode
        commit: 16065c4ec1e7ca595f4fa363dc2251c6bdf1f6b3
[05/10] arm64: dts: qcom: sc8280xp-arcata: Enable 4-lane DP support
        commit: f4360ff09b75b31a7d9d8088f8c3cae361709cbb
[06/10] arm64: dts: qcom: sc8280xp-arcata: Add volume up/down GPIO keys
        commit: 0e5e1b74ccc902a7dc9e3eb5cbe299362bf1fa13
[07/10] arm64: dts: qcom: sc8280xp-arcata: Add lid switch
        commit: d7879682e7fc86a03cb26632c4316211be8b30d4
[08/10] arm64: dts: qcom: sc8280xp-arcata: model the PMU of the on-board wcn6855
        commit: e1cf7b2332ddd90d65f74ab48f5e237ac7304b3d
[09/10] arm64: dts: qcom: sc8280xp-arcata: Switch to uefi rtc offset
        commit: 1ba745a53172ae43a6b92ff288d449d888feb853
[10/10] arm64: dts: qcom: sc8280xp-arcata: Drop duplicate DMIC supplies
        commit: 3d7646cea76fc08126534b428b299c326b3c66ca

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

