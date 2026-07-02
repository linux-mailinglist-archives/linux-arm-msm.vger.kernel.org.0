Return-Path: <linux-arm-msm+bounces-116126-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id QNgxIbz3RmohgAsAu9opvQ
	(envelope-from <linux-arm-msm+bounces-116126-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 03 Jul 2026 01:43:56 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 19AC06FD734
	for <lists+linux-arm-msm@lfdr.de>; Fri, 03 Jul 2026 01:43:56 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=RGHbJuKM;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-116126-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-116126-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 569FA302DF40
	for <lists+linux-arm-msm@lfdr.de>; Thu,  2 Jul 2026 23:41:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 06BE43E0C7B;
	Thu,  2 Jul 2026 23:40:59 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E04FA3D79FE;
	Thu,  2 Jul 2026 23:40:57 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783035658; cv=none; b=aNgs9O594f4bS0ltKLKIZaboAglJYNfpPfm0scCPE3rJwylg8nAw4CDGlBaXo1Gv8EEZdRfz31lPqUB/qMn2ZK7gjQo8AQ5NDDBbhJthLsRo+RHYEdualqI4iQi+Qy9ICANvayGtfenN6bsNiRaxFbYdopkGuEQq9QXqNgows7M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783035658; c=relaxed/simple;
	bh=a5qDTT1vAdJ5zW+rC2VpVB5wc13PzgKBANBcJcM+mYQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=M5jYE2P9d+MZ+Ljt+JxiyXeoedwA9uUa1/zU2QUlLVnku6Oliy+teWhFzRMerghU8/bYFLKhiIu/WsZMtp5V8ykk71G3GeYaFczCPHSUt7oq1/gEjDLW+jJNK2wnkbRgrnxkFg9HbHV2eK8LHQ2IXq0L+6Dt+TXi44nHz1u2M28=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RGHbJuKM; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E5E171F000E9;
	Thu,  2 Jul 2026 23:40:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783035657;
	bh=Ax6PNAj1kRbCmbXiqX/sgXM4yh+jpxRW7jnLP/dr5V8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=RGHbJuKMpAd3v/cCCwKeUjKCYQNXnrqEGbGQHcLcEd9xhYmYlbBwmo2Tf3CETtsBq
	 bZmPEIFRT7enTNq7n+3QbWmmDPYL8C/gDoiHzEMD739+YOPKEUtNPUR01BF1xh1zFV
	 md/btYnzpGU5eo6C0xEBiutcjLHk+Z6T+JmADkMD2ndKGdHptTgcR9gemhQ9fRwpWw
	 aqY7r3fPch+y9A0akx3dSbKof7H6H+n5AqCTTMxzsz1m8i4qmDD6MbrhBZCr6r29ay
	 HJNotI3oPaBtW/zIi1zTJv5R5W7aucLC8yhJq6bDNcPY7J7sbvt9+lG6KVYBLHXcul
	 Y3iUG2yi+RqnA==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Joe Sandom <jsandom@axon.com>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: Re: [PATCH v4 0/5] arm64: dts: qcom: add QCS8550 RB5Gen2 support
Date: Thu,  2 Jul 2026 18:40:31 -0500
Message-ID: <178303563663.359079.15659991488178026650.b4-ty@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260420-rb5gen2-dts-v4-0-b461909c2de8@axon.com>
References: <20260420-rb5gen2-dts-v4-0-b461909c2de8@axon.com>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-116126-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:jsandom@axon.com,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:konrad.dybcio@oss.qualcomm.com,m:neil.armstrong@linaro.org,m:dmitry.baryshkov@oss.qualcomm.com,m:krzysztof.kozlowski@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER(0.00)[andersson@kernel.org,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[12];
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
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 19AC06FD734


On Mon, 20 Apr 2026 10:13:12 +0100, Joe Sandom wrote:
> This series adds device tree support for the Thundercomm RB5Gen2
> development kit, based on the Qualcomm QCS8550 chipset.
> 
> Patches 1-3 prepares for the RB5gen2 device tree by adding MHI register
> regions and port labels to the PCIe controller nodes, as well as moving
> common IPA properties into sm8550.dtsi. Then update the existing HDK
> and QRD board files accordingly.
> 
> [...]

Applied, thanks!

[1/5] arm64: dts: qcom: sm8550: add PCIe MHI register regions
      commit: 347318325974e888dc18d9fd15dcc48f671886c9
[2/5] arm64: dts: qcom: sm8550: add PCIe port labels
      commit: a23536d85805e455cbb6b101f05e48ab672edf9d
[3/5] arm64: dts: qcom: sm8550: move IPA properties to SoC device tree
      commit: e60ad1f5206bc8029c0b087846e12c715792b201
[4/5] dt-bindings: arm: qcom: document QCS8550 RB5Gen2 board
      commit: c70e25c221cee14c4bcd51ff763b697a2d7096b4
[5/5] arm64: dts: qcom: qcs8550: add QCS8550 RB5Gen2 board support
      commit: 33cae252054a694269f9dcd41b354063193c8f59

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

