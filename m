Return-Path: <linux-arm-msm+bounces-118518-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 99I9F6ieUmpLRgMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-118518-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sat, 11 Jul 2026 21:51:04 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D57D0742BCB
	for <lists+linux-arm-msm@lfdr.de>; Sat, 11 Jul 2026 21:51:03 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=S9xKZS1A;
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-118518-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-118518-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 6C55E3012572
	for <lists+linux-arm-msm@lfdr.de>; Sat, 11 Jul 2026 19:50:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4B0A2331EB1;
	Sat, 11 Jul 2026 19:50:07 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1305A32C957;
	Sat, 11 Jul 2026 19:50:05 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783799407; cv=none; b=JFGRJtuwX4UeZ5zfdJaIIgdKEHm0NQlyHItlicxHILZU7oyNZOJAJj0bWGfzfx5BZw/c/HZ9R37J7xTQg0ncNOPzRD+Gzk/kqm1ho+r29EOSzMX40ri9sAJyNTEOuy372YOyVrx/58xCvd7X/WVnx/eikbuA0PRZb/mThOYuKY0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783799407; c=relaxed/simple;
	bh=RQRWcT0CFjSsdkfjLAKCex6QiqQoLY7VOCjbz8nKe5w=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=HBnPWe07vvZueES/PnZfW0x6sBgq8WN9YlUB4X4zFiseyvcqAjXUH1YVGSVJ3+V7Bv2vqI1SOkaFY7fRTp5Jkhb/66pAFKuyZSTb+HE5hKCfemx7yxZlcPS7Dk55VZwzygvWvDlICjZHVp5XQIOr/dywyMSzWvpAiaMhyS49zHg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=S9xKZS1A; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A49431F000E9;
	Sat, 11 Jul 2026 19:50:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783799405;
	bh=8MeqxyuSFOsfA7kp2hQbDLGK4Y258AvNZPf0lyCyxsQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=S9xKZS1AxJRSq75MmrZbbaBfjl45aPKS4vPveMu/Eaa0RTSt4MMbBv7RGamjCFgoF
	 /iu6UALf5m3eQZTPuFu+nZHv2xC5AXD5JLoQ2FKXpIb8qi4QVet771OKAb2kgTJM94
	 cSqFjfogApolQM5CVLth/anoOAOYmVthO6C9bX9cTC5HmP48LYsgjaANqgNHTKsEyy
	 1NafuQXxAU7yrqdJr3/vuKG4PHzzztfn8OKXLukau0GhP/1Zcr9h0IET2YWgJ8A7VN
	 Y74oWMLTkE8fIISQ5ZiFCVax1ChIqyUFIJsOjPiMS6KgaaUE+5YHvf1vv9VzqDk+hF
	 N5jfRpwUrsi/A==
From: Bjorn Andersson <andersson@kernel.org>
To: Suzuki K Poulose <suzuki.poulose@arm.com>,
	James Clark <james.clark@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Mike Leach <mike.leach@arm.com>,
	Jie Gan <jie.gan@oss.qualcomm.com>
Cc: coresight@lists.linaro.org,
	linux-arm-kernel@lists.infradead.org,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v3 0/3] Enable CTCU and ETR devices for multiple QCOM platforms
Date: Sat, 11 Jul 2026 14:49:44 -0500
Message-ID: <178379938589.163099.8612045419740937512.b4-ty@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260204-enable-ctcu-and-etr-v3-0-0bb95c590ae1@oss.qualcomm.com>
References: <20260204-enable-ctcu-and-etr-v3-0-0bb95c590ae1@oss.qualcomm.com>
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
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-118518-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:suzuki.poulose@arm.com,m:james.clark@linaro.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:tingwei.zhang@oss.qualcomm.com,m:konradybcio@kernel.org,m:mike.leach@arm.com,m:jie.gan@oss.qualcomm.com,m:coresight@lists.linaro.org,m:linux-arm-kernel@lists.infradead.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:konrad.dybcio@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER(0.00)[andersson@kernel.org,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[15];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andersson@kernel.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: D57D0742BCB


On Wed, 04 Feb 2026 10:22:00 +0800, Jie Gan wrote:
> The DT‑binding patch adds platform‑specific compatibles for the
> CTCU device, and the following Qualcomm platforms are included:
> Kaanapali
> Pakala(sm8750)
> Hamoa(x1e80100)
> Glymur
> 
> [...]

Applied, thanks!

[1/3] dt-binding: document QCOM platforms for CTCU device
      commit: 1ab1005cb6beb278df53b23f7cf520b4d6bd56cb
[2/3] arm64: dts: qcom: hamoa: enable ETR and CTCU devices
      commit: f77ef7a6a97eb29020be430d3125e3b0e0e713f8
[3/3] arm64: dts: qcom: sm8750: enable ETR and CTCU devices
      commit: 55d6c80716b1ceb39fb8143976dfb1dda4e43a2e

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

