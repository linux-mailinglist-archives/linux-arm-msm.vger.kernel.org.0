Return-Path: <linux-arm-msm+bounces-107455-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wDTTGTHRBGr0PQIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-107455-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 May 2026 21:29:53 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id F27D4539F38
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 May 2026 21:29:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id AB09B3057D7A
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 May 2026 19:08:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EFEA53B19B1;
	Wed, 13 May 2026 19:08:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Ff8NRavc"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A8763B19DB;
	Wed, 13 May 2026 19:08:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778699331; cv=none; b=FQvhUz+belbVkfdY1fH2PTeLEtt8KZU6KonqScDllKgBPlqWKI1+ARc8KVR4veN1CKAA9KDzgA1cnxrTHko/LqZtWK9OXDGkiFwVju6rOoZqyQlIQf0v3BEBzyBsAtw4lyYVv0bxFcoyb93ZelS75eLPrCagxLkVa7XSJTGdqkw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778699331; c=relaxed/simple;
	bh=dgOBvMMQqfv+b+OjD1d+8s4GSWXeMPgrOQ4Tfm4YYXE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=luxbTzM/Oz2f9RVOmHXfDDg+d+ouy3lPuDK3owO9rqnfxuNgRltch5Rnxpcqm6pHIg3T/+UhI0jGcIOrPTGmiWB8XXlv27UkCv/nqWFlNMfayJbabZ7YMpzSpBf4QXqv6tTtDkuGc4KnYQ4M+liGFHp/TXD1a1VMX1qr/+xUfMA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Ff8NRavc; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 91034C2BCC6;
	Wed, 13 May 2026 19:08:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778699330;
	bh=dgOBvMMQqfv+b+OjD1d+8s4GSWXeMPgrOQ4Tfm4YYXE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Ff8NRavcuwyUAVyB0+VLJpY36UTBDS2n2CViSllsG8tIvD1Y03HN8GNbmPZyBrusJ
	 9jhdS3PghDcwAl3tSaPPLKo5J+MbYIlSS870ndSzqhyP97LW5y3pF8bGkAxnVQLIyr
	 zazKW2uoliKqCtuREmJBmJrSDQBRVSavzeKmb2Kbu2/demw5pvyOccAvzczyt5PrsE
	 BwMmi3nO9tuPxU5nLsaAWU6qQ206yhEod9Z/6HLlbETJpuXvDiLi+tRKpvMtRm7Uua
	 DxWlkR4F3Bcpu/0RD9Ml531/hVG+tycd/dE0w+U4Jy+UuTZ+mMVOXNYp7AgPpCqlJ6
	 f0Czp9tkaQzyA==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Kees Cook <kees@kernel.org>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	Jonathan Cameron <jic23@kernel.org>,
	Francisco Munoz Ruiz <francisco.ruiz@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-hardening@vger.kernel.org,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v2 0/3] Retrieve System Cache Table (SCT) descriptors from a shared memory region.
Date: Wed, 13 May 2026 14:08:39 -0500
Message-ID: <177869930353.1496076.4629367562375349504.b4-ty@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260407-external_llcc_changes2set-v2-0-b5017ce2020b@oss.qualcomm.com>
References: <20260407-external_llcc_changes2set-v2-0-b5017ce2020b@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: F27D4539F38
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-107455-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andersson@kernel.org,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Action: no action


On Tue, 07 Apr 2026 14:51:46 -0700, Francisco Munoz Ruiz wrote:
> On newer Qualcomm platforms, SCT initialization and programming are
> handled entirely by firmware outside of Linux. The kernel is expected
> to consume the pre-initialized descriptor data rather than configure
> the SCT itself. The LLCC driver therefore only needs to locate and
> parse the descriptor table provided by firmware.
> 
> This change implements support for this mechanism in the llcc-qcom
> driver, enabling SCT consumption on platforms that expose SCT
> programming through firmware. The existing behavior for SoCs where
> the kernel programs SCT directly remains unchanged.
> 
> [...]

Applied, thanks!

[1/3] dt-bindings: cache: qcom,llcc: Document Hawi SoC
      commit: cb4a414bacbfdcb837048146b8979032d87e4961
[2/3] soc: qcom: llcc-qcom: get SCT descriptors from fw-populated memory
      commit: ac23106a9b9a0f6ed90002ae3d6fe7c14e97e6bf
[3/3] soc: qcom: llcc-qcom: Capitalize LLCC/EDAC in comments and diagnostics
      commit: 06a84c2d3ca4b9b54724e79717c2cfd9a59947d9

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

