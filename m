Return-Path: <linux-arm-msm+bounces-118096-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id arbNH9T3T2ogrQIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-118096-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 09 Jul 2026 21:34:44 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A39B7350BC
	for <lists+linux-arm-msm@lfdr.de>; Thu, 09 Jul 2026 21:34:44 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=MQ4Hi1rT;
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-118096-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-118096-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4E9A7305C193
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Jul 2026 19:33:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 02A7B3BFE34;
	Thu,  9 Jul 2026 19:33:02 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 632653BBFCA;
	Thu,  9 Jul 2026 19:33:00 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783625581; cv=none; b=F7LaNQdK5bAVdRBzvCE4VTpA1OBx4fDwuomH1s5iEjl2u28c2jJf9JUHBQ4RNKpf9svX5ood4gX+e8A8CMdMQD9hFHNPd8yjYoTJhfbtv57ODDpq1+TLD4wVRa0IbfM/9ougmZJ5XeT1dCZUFyIUO5uKDWU1viZZDTpSFdURALU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783625581; c=relaxed/simple;
	bh=3Yav75tMKEREx391TGlRti6ewxaMEaWve/hfw83hmTI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ZXGmgCKsbrTGCzzxsRPWCErpGqeP092o9g6ISIAYdXCKa6CNbR6kVrx5bL8edDjnvwiv2zc2jLd/EUOiHIEDD9NudySU+p6Hu2W4GW7Rji3NwFmOBQuOUjPm6zeRP2h2kQu8F88+IYglt0qmxXxVHkPNmQ9ZGbPI4OmZrG8gp5k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MQ4Hi1rT; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 35E741F00A3F;
	Thu,  9 Jul 2026 19:32:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783625580;
	bh=cLUcMQ4PyzPc+R+4vch0y6Yau7lgliCUcpfK+IDlCVI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=MQ4Hi1rTvFsp0uCHf0qxul4rZypSyz6vLhJs2PlDquT5ssJDMOt8KS3OXivWOZYjY
	 sbO69TwX0MkMVxY4qVjR1pbVOUgEZSRmt3Q4qyrXl5xNQdAE8+owjSBxKftkI7YkXV
	 +6kU6k587WyrlTC7Zh/E4RojjZbeoxibAZPTqXU6nnOggdNU0ipbfNS6S3gG190kF1
	 AfFHfHhdztiOGVOQdPUFmCi8BD3OhCWqQfPJmj6ziOh12T5DPzYCgFB5ys6mVgNNXL
	 usPfOReQ+VbtNq/XJST9XNDSoFoEAyZCaCUHxfyIavdyuNwqPRFCeeGbnaYM3iTaGO
	 dOq5sKOG+qH1w==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Abel Vesa <abel.vesa@oss.qualcomm.com>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: qcom: eliza: Enable first QUPv3 wrapper by default
Date: Thu,  9 Jul 2026 14:32:54 -0500
Message-ID: <178362531887.2423236.14255233587171205101.b4-ty@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260709-dts-qcom-eliza-enable-qupv3-1st-v1-1-e9a6904d0dea@oss.qualcomm.com>
References: <20260709-dts-qcom-eliza-enable-qupv3-1st-v1-1-e9a6904d0dea@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-5.16 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-118096-lists,linux-arm-msm=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[andersson@kernel.org,linux-arm-msm@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:dmitry.baryshkov@oss.qualcomm.com,m:abel.vesa@oss.qualcomm.com,m:konrad.dybcio@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andersson@kernel.org,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 1A39B7350BC


On Thu, 09 Jul 2026 12:12:11 +0300, Abel Vesa wrote:
> Since each serial engine will be enabled as needed in each board dts,
> there is no point of disabling the first QUPv3 wrapper in SoC dtsi.
> 
> So enable it by default. This is also now in line with the other SoCs, and
> also with the second QUPv3 wrapper.
> 
> 
> [...]

Applied, thanks!

[1/1] arm64: dts: qcom: eliza: Enable first QUPv3 wrapper by default
      commit: 2b36a8327827a80523fc4ac08cb80b42765fca55

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

