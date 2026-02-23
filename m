Return-Path: <linux-arm-msm+bounces-93797-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EMOpHhmxnGmxJwQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-93797-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Feb 2026 20:57:13 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C53917C977
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Feb 2026 20:57:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 25112304AC18
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Feb 2026 19:56:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 691DA376BE1;
	Mon, 23 Feb 2026 19:56:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mKUCvslZ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45EF7376BCA;
	Mon, 23 Feb 2026 19:56:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771876588; cv=none; b=P9WndI7utQ617cb+Q7C79jS+C+BUINz6/fpUKPDXfMxrG+Sh1TEhz5h48EtmtKdvcUdlOiroTXgdedioIv6UYwj3bH6jB/Q+ptCPgg4e3JP6y61W5BySqbaUC8etXMF4EMWeXArAfV82PXK/81jLvPmwE8NBaq9m0WjJqyfAarA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771876588; c=relaxed/simple;
	bh=/oVSYWSHu+BFWFPUiF7msb/XXUCGerJ6ev7U81/+LaA=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=dWLAdtAycd5LVI765o2g+bVO5qzoMP9RKcHPq2qasg8sLBlpXcsRRFh2gNQJSEGgd5XPXwwblsnaCP8Hh9IfoBFsb5JOlxeBlSpmSaUX1cjI3X09zHwdV4WQenMjvlQ5haGkyRSQToAjAfi6BgI0+fejLGL7VvApGtsO6wCE+e8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mKUCvslZ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2F4BDC19421;
	Mon, 23 Feb 2026 19:56:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771876588;
	bh=/oVSYWSHu+BFWFPUiF7msb/XXUCGerJ6ev7U81/+LaA=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=mKUCvslZgX/gFyO7Lp3RxXzFHdfgTr9MkonfQTlNQVgHL41T+ret5v2JWaKfpHESp
	 8Ak9ZFCRXzJpiO5HJiW6MszF+dCx/L5ggkaNHO/otwcuX2CDPSSkf9oko5BMJ8Pl2u
	 ZuISEC1KQai5oTukv09iRIvA5aXxIpo8O4nUJEYj4eTi8MPNZTRg2x7/EzETT7/XDN
	 cY1BePyV38wgBb+c5wfyW9KiDONqqiZBXSMK7zD8yRWTitSAjUc+uv7cqT2AtycEzg
	 eK8x+L6gv3Cojth3GYHQszlXCSiB8b+4BVTwW66Td3oioSBLnVbIJl2nNPW4Jv1/jq
	 lsW4XjBwf8OEg==
From: Bjorn Andersson <andersson@kernel.org>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Taniya Das <taniya.das@oss.qualcomm.com>,
	linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: Re: (subset) [PATCH v2 1/2] dt-bindings: clock: qcom,glymur-dispcc: De-acronymize SoC name
Date: Mon, 23 Feb 2026 13:56:09 -0600
Message-ID: <177187657315.166046.12894923898022984507.b4-ty@kernel.org>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260217130047.281813-3-krzysztof.kozlowski@oss.qualcomm.com>
References: <20260217130047.281813-3-krzysztof.kozlowski@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-93797-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andersson@kernel.org,linux-arm-msm@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 3C53917C977
X-Rspamd-Action: no action


On Tue, 17 Feb 2026 14:00:48 +0100, Krzysztof Kozlowski wrote:
> Glymur is a codename of Qualcomm SoC, not an acronym.
> 
> 

Applied, thanks!

[1/2] dt-bindings: clock: qcom,glymur-dispcc: De-acronymize SoC name
      commit: eba8bcf96e763ba250a993b053d6ecaaaa1f4cf3
[2/2] clk: qcom: De-acronymize Glymur SoC name
      commit: 85072bcd4f3fe65fe5819de1a2a677f59d811dbe

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

