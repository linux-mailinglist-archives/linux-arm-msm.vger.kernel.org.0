Return-Path: <linux-arm-msm+bounces-98479-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iETLA6GuumlXagIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-98479-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Mar 2026 14:54:41 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 60E222BC697
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Mar 2026 14:54:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 773BD3046D81
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Mar 2026 13:51:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 608C23DCD83;
	Wed, 18 Mar 2026 13:50:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aV8I7UUg"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C79E3DBD6D;
	Wed, 18 Mar 2026 13:50:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773841850; cv=none; b=Q4UAS8YAJVU8Ja5NA4hziRaf1cCXJRpSdAIXEAOnxFjlzxN2NuhgK4BPWZvJ/DW2DJqcPz2gfcLrLA44rvDqon1z14wEeO+2zy9VJEigzs3J3D+WNLr5tgmt+r9Alhq1kCuLYSNu7LSkww+hfazwgVk18JBBa9kl7KDhdtnbnLc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773841850; c=relaxed/simple;
	bh=kcRB/zY2HbBMecuJj6Pmw3F1Bx/+LXX6E9CQ9LpIhzQ=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=VF722pXNTSkggvSg7rpiOAZwx3MfwRHMfE8/+TCf59gF4wUDY2Le3dcvmr6ytv5iV1HiOi2UYCpkQwmiN+w9Oy5k4IMSflsusXzAWKjyivD2yHFSL17SBBshvE0CGqzWJJ+62rAI3ejqxcKGRXW8/GyihUO1AmiNfwyZ4iey1r8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aV8I7UUg; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BF6F4C19424;
	Wed, 18 Mar 2026 13:50:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773841849;
	bh=kcRB/zY2HbBMecuJj6Pmw3F1Bx/+LXX6E9CQ9LpIhzQ=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=aV8I7UUgjzrrw/wOofrT68oJQoie6L0crbAGHNrs1K12h4gZQ1llOy/+sk0FDDjTl
	 V3Ro/i4n6fvnG17uTwwg04NHT92JLIiwNqM60Gw2xTlQ2+mTZHuCYcSgFWhqb1zSNB
	 p2Xt70gDRb//BnsaIam/aRQkQmfwMHpRdwsj1LXyMMsrh0pDKDSKyDQc4LZ3TZeiAN
	 6g7PpTLFusNKI0KUonNyBfb5ZHBeYLSTXcj23PJyJnro8hH8Z80mtmQyJkmWYmM4NA
	 J72Ev5cHTkRurSv9PgEw6UMnLpFfT1h+li3JfYNwo6UiYZpyfvwmO5JBHTrOWj81vm
	 hLJSx4kv45S9g==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: Re: [PATCH v4] arm64: dts: qcom: x1-crd: add USB DisplayPort audio
Date: Wed, 18 Mar 2026 08:50:10 -0500
Message-ID: <177384182890.14526.14528740000024549733.b4-ty@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260209093237.33287-2-krzysztof.kozlowski@oss.qualcomm.com>
References: <20260209093237.33287-2-krzysztof.kozlowski@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-98479-lists,linux-arm-msm=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 60E222BC697
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


On Mon, 09 Feb 2026 10:32:38 +0100, Krzysztof Kozlowski wrote:
> Add support for playing audio over USB DisplayPort (the two left USB-C
> ports on the CRD device).
> 
> 

Applied, thanks!

[1/1] arm64: dts: qcom: x1-crd: add USB DisplayPort audio
      commit: 90b7cc18e9333879991f178c3f78bd1b93e2e8e7

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

