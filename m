Return-Path: <linux-arm-msm+bounces-107180-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cAqNFt2MA2pN7AEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-107180-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 May 2026 22:26:05 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 53A355291AF
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 May 2026 22:26:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 07BB6305015D
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 May 2026 20:24:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EA3D03CB2FC;
	Tue, 12 May 2026 20:23:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="e0NvnRhQ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5FF13C276D;
	Tue, 12 May 2026 20:23:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778617417; cv=none; b=fl+C88RCm/3pIVt1MjpsYQZNBaTZfZpVGwU5oWAnmHXUQGiYCUPQLE8SPOpdd4g+UuyYY0HpTmG2CSX7iQZFkikcYG5uluGR0+g2+70Q7FpoFnsFTcH7RJcWdB8KetQdh0L9cT651UdPs16Bv+QUzTtwZqkRst28P7DDOFQziw8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778617417; c=relaxed/simple;
	bh=Ln2gI1hcndZSho8Ih8uFJiVbv3RJPUjem9kyui/66G4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=oH43aCgjujk1e9km5DbF/R2Ol/Mego2r2jQPo9hJBHs06dldasECakABFyQ+70pAdkFRFZcglW2Ofp4ql4ApU3pFNjP5NajGcmTc56Kf6kAylm4kQJK4Nj1De6F0LkN49gDmhKaBa5o5t9tqeaykYMrFGWSudJT1VA0nShNZgRM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=e0NvnRhQ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 57B3AC2BCC7;
	Tue, 12 May 2026 20:23:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778617417;
	bh=Ln2gI1hcndZSho8Ih8uFJiVbv3RJPUjem9kyui/66G4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=e0NvnRhQp10LujODCHxZGIl0R9PMRA+MZ/qwuVIcZ5SfmLM4ehrCP0oHhxa4HWuZh
	 Gtvl6ajmj7vN4023nTkKG6SIfNUTFsxtV10D3/7Re1AFEEFKnmW+U7CPg6xJTyGSrQ
	 wpN8jFueoSbh3sSAFtfW1+CNOigeeerBuyewnSBSIqdf6UjlSMkuzrv8J0MFssbxAK
	 JSHGNJBsmeXlmWRirbVkhK5zFEuIZ0zLBxgfCO8ehrhSN9mIsA60BbduOmxGZ6Rd9h
	 rrx+MRdHbvkLPHi2iJmSkvzJ0DDa9FGU8aws5Vc+YEUgQDv6nHvOr5Uz/IReBDvUXm
	 koRYUZQ5nMv1g==
From: Bjorn Andersson <andersson@kernel.org>
To: Herbert Xu <herbert@gondor.apana.org.au>,
	"David S. Miller" <davem@davemloft.net>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Abel Vesa <abel.vesa@oss.qualcomm.com>,
	Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>,
	cros-qcom-dts-watchers@chromium.org,
	Eric Biggers <ebiggers@google.com>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
	Tengfei Fan <tengfei.fan@oss.qualcomm.com>,
	Bartosz Golaszewski <brgl@kernel.org>,
	David Wronek <davidwronek@gmail.com>,
	Luca Weiss <luca.weiss@fairphone.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Melody Olvera <quic_molvera@quicinc.com>,
	Alexander Koskovich <akoskovich@pm.me>,
	Abel Vesa <abelvesa@kernel.org>,
	Harshal Dev <harshal.dev@oss.qualcomm.com>
Cc: Brian Masney <bmasney@redhat.com>,
	Neeraj Soni <neeraj.soni@oss.qualcomm.com>,
	Gaurav Kashyap <gaurav.kashyap@oss.qualcomm.com>,
	linux-arm-msm@vger.kernel.org,
	linux-crypto@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
	Manivannan Sadhasivam <mani@kernel.org>
Subject: Re: (subset) [PATCH v5 00/13] Add explicit clock vote and enable power-domain for QCOM-ICE
Date: Tue, 12 May 2026 15:22:47 -0500
Message-ID: <177861739384.1242344.560063660272912565.b4-ty@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260416-qcom_ice_power_and_clk_vote-v5-0-5ccf5d7e2846@oss.qualcomm.com>
References: <20260416-qcom_ice_power_and_clk_vote-v5-0-5ccf5d7e2846@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 53A355291AF
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-107180-lists,linux-arm-msm=lfdr.de];
	FREEMAIL_TO(0.00)[gondor.apana.org.au,davemloft.net,kernel.org,oss.qualcomm.com,chromium.org,google.com,gmail.com,fairphone.com,linaro.org,quicinc.com,pm.me];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[33];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Action: no action


On Thu, 16 Apr 2026 17:29:17 +0530, Harshal Dev wrote:
> When the kernel is booted without the 'clk_ignore_unused' and
> 'pd_ignore_unused' command‑line flags, votes for unused clocks and power
> domains are dropped by the kernel post late_init and deferred probe
> timeout. Depending on the relative timing between the ICE probe and the
> kernel disabling the unused clocks and power domains occasional unclocked
> register accesses or 'stuck' clocks are observed during QCOM‑ICE probe.
> When the 'iface' clock is not voted on, unclocked register access would
> be observed. On the other hand, if the associated power-domain for ICE
> is not enabled, a 'stuck' clock is observed.
> 
> [...]

Applied, thanks!

[02/13] soc: qcom: ice: Allow explicit votes on 'iface' clock for ICE
        commit: 0d5dc5818191b55e4364d04b1b898a14a2ccac38

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

