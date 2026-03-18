Return-Path: <linux-arm-msm+bounces-98485-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yN+vIHGvumlXagIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-98485-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Mar 2026 14:58:09 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BC182BC796
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Mar 2026 14:58:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id E84833010228
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Mar 2026 13:52:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E853E3DFC79;
	Wed, 18 Mar 2026 13:50:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="roUco1Go"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C47393DA5B7;
	Wed, 18 Mar 2026 13:50:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773841858; cv=none; b=TNByrYk+1htWlbTnGmKeYDLlXpnyNEKG5WQUFaDZOGyMBetaYjO2qdf639xQI/xB7wIEFW6pF6mrd/cwR/YqSguzKAymF9uYgAjCH20pqqgpuXRA+Z0KgMcSxxg25st3gjGnlfHpNHf7L+SlReKyk1zkDGP/9faxryPHGX4TzvI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773841858; c=relaxed/simple;
	bh=jSu0uIpCVXJ1HgTQAKx99exuYgXmJJZk8yKbuxV+3hw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=hhQgr56qcH8XQMsLIh6DQ5V8Pozamd+fBwEmifBCYofJLTNHfvl00wyWcJdJnqrij/Tz9E5THwJqbzu816eLvkthRJRmj4mGAY3ukG+N/IxkyLkv9c/SBOtvAvjTAnS8St7xYfXc73Iw0uDuWu/rJ6wSspLrFQ+g48fAjjVAQck=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=roUco1Go; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3EC6FC19421;
	Wed, 18 Mar 2026 13:50:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773841858;
	bh=jSu0uIpCVXJ1HgTQAKx99exuYgXmJJZk8yKbuxV+3hw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=roUco1Go5OnspfnpqnhtDxlWbMrXh9sBjNYC2UpvfNVoQlSqKZs7feB2xozZ54L8o
	 m7hemoCTD4wIFtNqrJQfVPFAEKKRh7km+IN2BEOrwrSllNKf9PZ4L6P4Ulblzxz3ZH
	 3z+6G963EFl+5Y6H19xoSMwmGW2s3eoy2NPespsLvZIEPtmbxBLr2P+jz4dAb6oZD0
	 CFczCacrjL4MSFCoDX2on9s0/C7PwX0zos5mhRzobuP4F52BgIVeFeJIcI3yKMWz/V
	 hB7A7BgtqKx0Al71mKVDOvwfTS+hpMKKnWQA5U+PKZIXmOjqvtJTvsfZpDLo8shxt1
	 5oX5PFZSDXTIg==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Biswapriyo Nath <nathbappai@gmail.com>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	~postmarketos/upstreaming@lists.sr.ht,
	phone-devel@vger.kernel.org,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: Re: [PATCH v2 0/5] Fix volume up and add RTC, PRNG, UART in xiaomi-ginkgo
Date: Wed, 18 Mar 2026 08:50:16 -0500
Message-ID: <177384182917.14526.9177017363053932457.b4-ty@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260121-xiaomi-ginkgo-features-v2-0-fb3ee94922d0@gmail.com>
References: <20260121-xiaomi-ginkgo-features-v2-0-fb3ee94922d0@gmail.com>
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
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-98485-lists,linux-arm-msm=lfdr.de];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andersson@kernel.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 9BC182BC796
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


On Wed, 21 Jan 2026 13:26:16 +0000, Biswapriyo Nath wrote:
> The patch series fixes an issue and adds some components.
> 
> Changes:
> - Fix volume up button gpio and power source in xiaomi ginkgo.
> - Enable RTC from pm6125 in xiaomi ginkgo.
> - Add prng node in sm6125.
> - Add debug uart node in sm6125.
> - Enable debug uart in xiaomi ginkgo.
> 
> [...]

Applied, thanks!

[1/5] arm64: dts: qcom: sm6125-xiaomi-ginkgo: Fix volume up button
      commit: 3f5a8c7e7c3ea1c12bb78eb2ca1acf836fe2b416
[2/5] arm64: dts: qcom: sm6125: Add PRNG node
      commit: c6f654984a95ce3022ded8c9abfb933b36c90459
[3/5] arm64: dts: qcom: sm6125: Add debug UART node
      commit: f49c03d9a17ae7dec694d9ec40bd00c03ec350ba
[4/5] arm64: dts: qcom: sm6125-xiaomi-ginkgo: Enable debug UART
      commit: e8f6f80bf10870d7b73c0436db10a61e3833196d
[5/5] arm64: dts: qcom: pm6125: Enable RTC by default
      commit: 7cfb1637ef685b27e5e07daf5912d8434c12ade2

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

