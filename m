Return-Path: <linux-arm-msm+bounces-117740-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id SU3tJddtTmpBMgIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-117740-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 08 Jul 2026 17:33:43 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C27172814C
	for <lists+linux-arm-msm@lfdr.de>; Wed, 08 Jul 2026 17:33:42 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=n86my4xW;
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-117740-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 104.64.211.4 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-117740-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 6C89430D5AB2
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Jul 2026 15:05:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6850E43440D;
	Wed,  8 Jul 2026 14:57:53 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AE3A4343F1;
	Wed,  8 Jul 2026 14:57:52 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783522673; cv=none; b=rWXOM8SlnRdywP8b11gqUt/Huze85SOy/HwjkJLSpJG4ENyBqL5rjSEdYyfIzDVjETvZ/F31KTDTsQnvSnhnUzqPQ6UxxlazBP8HOgEELhE421Rg989f6ohnTFJT+DKJxiSZ64/dy4p7oJjnGAUrdGs0Lky6wOkvyWN6SBnHAIk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783522673; c=relaxed/simple;
	bh=U5S/YiRi/3tgNM9x6G2f69v+REfmpT1uYoIgUerDaDQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Si+YOVDXJMLaI6uPACTK9WrFKtYoygW9lWat7YwdW2Twey+4Onv/EWgfTzF4b28QVzyBRcHIc0IpA78HKJAk9E0dJr7saIWIeEAtF0TvSeq9sziQfgtj0lvaUmOwXGDfUOF/qhC6diuVEBOCbEuGtv/+UMtTlpdwSZcImnaO4Tg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=n86my4xW; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 43E941F00A3D;
	Wed,  8 Jul 2026 14:57:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783522672;
	bh=pDk7JZvek6Wa8+duF9L5o3h5GoZgz6SZRsJfOait/4E=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=n86my4xWY0oRxgZyGlufudhBAr4UqIq0TmjaaLX2vUFDopfZ9m9rrPXhvRFLpoB+E
	 0M1yCEh7NCgE2wgTioVRmtFN6zMMwfENZPbp4dEJCscCLmoG4Hd2V/jj//eMIKjDhP
	 DCQ25hVnvRStPQ5iFbFmwS00ETe8a542cUZpIyILt8g3Gpc56egQFBKEvndlqsDpbt
	 eFlOdrE6/EI3yVP95McTzWn5oU+RVv4spWkcciovBip7sMjMailpCZwmG9EOzfiRa5
	 Xd7K2VtCKK4VH9dZzZ9Pf4tcEXts0QfG8afrlaAKlI+hFh5GjCmaR7J48YchjlhL/7
	 EkAWvlkagUNKQ==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: Re: [PATCH v3 0/3] arm64: qcom: sm8650: misc enhancements
Date: Wed,  8 Jul 2026 09:56:52 -0500
Message-ID: <178352261621.2235436.10047342474988179608.b4-ty@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260615-topic-sm8650-upstream-cpu-props-v3-0-eeb6e9fa7581@linaro.org>
References: <20260615-topic-sm8650-upstream-cpu-props-v3-0-eeb6e9fa7581@linaro.org>
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
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-117740-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:neil.armstrong@linaro.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:konrad.dybcio@oss.qualcomm.com,m:krzysztof.kozlowski@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[andersson@kernel.org,linux-arm-msm@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[4];
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
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 8C27172814C


On Mon, 15 Jun 2026 18:48:55 +0200, Neil Armstrong wrote:
> Misc enhancements for the SM8650 platform:
> - update the cpus capacity-dmips-mhz
> - add the CPU cache sizes
> - correct the soundwire ports
> 
> 

Applied, thanks!

[1/3] arm64: dts: qcom: sm8650: update the cpus capacity-dmips-mhz
      commit: bb016ddb9061a89c72448f4dbe356350f5cac0ea
[2/3] arm64: dts: qcom: sm8650: add CPU cache size properties
      commit: 884ff1172a70f47697c5033701b4c86f23abdb57
[3/3] arm64: dts: qcom: sm8650: fix soundwire ports properties
      commit: c0bec4b58b8e740236d9ac338821f78dbf784546

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

