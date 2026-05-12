Return-Path: <linux-arm-msm+bounces-107185-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MIM3LtuNA2pN7AEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-107185-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 May 2026 22:30:19 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 573845292F7
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 May 2026 22:30:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 73750313EE38
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 May 2026 20:24:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1A1603CCFAC;
	Tue, 12 May 2026 20:23:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eqC1YGBE"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB2783CC9EA;
	Tue, 12 May 2026 20:23:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778617422; cv=none; b=QUoe0mOhjmG0rFBToSBB/0yAr4BxrZHO9Ra4VPfTDqdLZq/V60GiMVR8sLsE+hMzsDffLxPgmAQHv8QdQa6+G00GLkxkZJCskNQxOPW2SqRpOLr5CPN6Fs2/ztjl5AMQVKKqYVWK7P+18YTNKabb5gvYul/PBl6I2890r5pMyHM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778617422; c=relaxed/simple;
	bh=GagSECi8ecOTwWXQkUrU8OvlPHIHOj0zJQYR/uTvBO8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Jck6voYhc92WbmclnUR8zM3DrE/XeJqEjblT0E8bjl1PKFV+ahJOfEKyCDvlh9W382jcFqbzR1nPLNvsMzvardIfIB4unUpi6KnXyIuvCsnIXN2358s/2VDGVh3Qw3+nt9oIMW4FEgazJ6isazO74wH8KcVOmkBr8tdDplsAtrs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eqC1YGBE; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 317F0C2BCF6;
	Tue, 12 May 2026 20:23:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778617421;
	bh=GagSECi8ecOTwWXQkUrU8OvlPHIHOj0zJQYR/uTvBO8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=eqC1YGBEM1WxajTe0qIRBqFdaHeuBrTmYgdjgqgA8pPEmF6E1khhBUMRB0ajZdEhe
	 SSctjPxJk3H2gHvpMW+EyJA/RHIEhIIry5Gr4FwMKrZA8WmnNC7puzA6c8k8jO3ow2
	 QoBs0o/ujBMMk4HxZHiQ+zX7qfvNpnWW7YOECHC/TwqFD0sOwx/DZxtpNDVeGziZPo
	 bH0w4ogkVvc3U/0EYde7ziVHxuFnCSG9JaGQpSIPc+o0ICa+pxVjgvmxGcfrRxkZi2
	 VCoXDzmG1iDKcYnuXhoQmeXJSUrjsSZzeTZjJtpQS66qF4SUd5i9rMpe54ilZe5+4a
	 VfnRD8OxihUoQ==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Komal Bajaj <komal.bajaj@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/2] arm64: qcom: Add SoC ID for Shikra IoT variants
Date: Tue, 12 May 2026 15:22:52 -0500
Message-ID: <177861739375.1242344.16950925404390248673.b4-ty@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260428-shikra-socid-v1-0-6ff16bad5ea2@oss.qualcomm.com>
References: <20260428-shikra-socid-v1-0-6ff16bad5ea2@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 573845292F7
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-107185-lists,linux-arm-msm=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Action: no action


On Tue, 28 Apr 2026 14:47:45 +0530, Komal Bajaj wrote:
> This is the initial posting for upstreaming Qualcomm Shikra SoC.
> There are three variants, distinguished by their respective SoC IDs -
> - CQ2390M: Shikra Retail with modem
> - CQ2390S: Shikra Retail without modem
> - IQ2390S: Shikra Industrial without modem
> 
> This serial adds the corresponding SoC IDs to enable proper
> identification of these variants in the kernel.
> 
> [...]

Applied, thanks!

[1/2] dt-bindings: arm: qcom,ids: Add SoC ID for Shikra IoT variants
      commit: 928f6a0b1d88e526d5e8a6734e95ef20705fa98b
[2/2] soc: qcom: socinfo: Add SoC ID for Shikra IoT variants
      commit: b828561684a217e3363c595108f5e8d560b9fb25

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

