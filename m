Return-Path: <linux-arm-msm+bounces-117098-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id l+S8KQJyTGrCkgEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-117098-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 07 Jul 2026 05:26:58 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 00991717121
	for <lists+linux-arm-msm@lfdr.de>; Tue, 07 Jul 2026 05:26:57 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=XeuqV41J;
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-117098-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-117098-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E44CA3030EB4
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Jul 2026 03:22:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 576F637C912;
	Tue,  7 Jul 2026 03:22:10 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E4C53939CE;
	Tue,  7 Jul 2026 03:22:02 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783394530; cv=none; b=dAQrQcmspPIplOEK4Vn5uclHDOvur7y2CB79883UBRg2tzvZ7tT5sXgGuSpfiYUyR/l7vRZvvUPJj6wpV5yMwNUOA7888xdZLcjqbDwdXyhy3AktUrQEV6OmrbaRPh3y7YkegPoWvd7LPO3CRkZgCieBrT5JViWpLvecZqahM1E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783394530; c=relaxed/simple;
	bh=alD8ixMGRxbs1Hk1JLHgYGriAC3javRRISp62eklITM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=q5hqSOpnaJ30Fg/cC2JjbZsfUR0YPt0emvBTICAEWzL8ekn613fD6ULqK1jiTqBi3E9+dEa8Df5tw4Sq2UQZjNneiVYiPqhcUzu00vF5l85yhMz1GzWX0MmxMCAe6dZ3A5/5V59OHsqa29GgDNmG/XDT6FJWPO0kOZQUoBWOaq4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XeuqV41J; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6BB3B1F00A3F;
	Tue,  7 Jul 2026 03:22:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783394522;
	bh=HA7N9KpHswcKpQqz8xf8UbkRciS9EUGzhWxKHcOyI9Y=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=XeuqV41JHUNuQJSPYPXlDeE9eSy8+bmMatSD/CvVpJ5RUXw1Ao2AAFU+s6YVehmxH
	 xO+xk6Em1CkplcYAd+jEtte3HeCY/lV3gwtsIbHqBA6g89z9K3cuBoaDK+vaW6TL7R
	 DNJRc8Dzc2SWgURZ6FZ58pYL/fTu1hR7hfXBiE0YweD+I7b2SxavOzvuaOX4UAwDr9
	 fjOFjMcTtvSHG3Mmz5g7Sn4c3o0kOEvR4y51zLyCnaWP1JvgHxW9UKuxMTxz4HWbbG
	 Eu1NOOts22h1h5PVXxzrpyewv3CvTP++EUwYVKrvxoBIJuruhbUnwHN2ApSajI0r6+
	 gtQlwYBgxPFcA==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Pradyot Kumar Nayak <pradyot.nayak@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: qcom: glymur: add CPU capacity-dmips-mhz
Date: Mon,  6 Jul 2026 22:21:35 -0500
Message-ID: <178339449924.1938770.12997475707179403824.b4-ty@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260706-add-cpu-capacity-dmips-mhz-v1-1-85deced44b20@oss.qualcomm.com>
References: <20260706-add-cpu-capacity-dmips-mhz-v1-1-85deced44b20@oss.qualcomm.com>
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
	TAGGED_FROM(0.00)[bounces-117098-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:pradyot.nayak@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
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
	RCPT_COUNT_SEVEN(0.00)[8];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 00991717121


On Mon, 06 Jul 2026 12:25:59 +0530, Pradyot Kumar Nayak wrote:
> The Glymur SoC has two distinct core types within the same Oryon
> microarchitecture generation:
> 
>   - qcom,oryon-2-2 (cpu0-cpu5, cluster 0)
>   - qcom,oryon-2-1 (cpu6-cpu11, cluster 1; cpu12-cpu17, cluster 2)
> 
> Without capacity-dmips-mhz the Energy Aware Scheduler treats all 18
> cores as equal, leading to suboptimal task placement and frequency
> selection. In particular, heavy tasks may be pinned to cluster 0  driving
> them to maximum frequency/voltage while cluster 1/2 sit idle.
> 
> [...]

Applied, thanks!

[1/1] arm64: dts: qcom: glymur: add CPU capacity-dmips-mhz
      commit: e1a6af9411568dd4b135892d0f0905d676816196

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

