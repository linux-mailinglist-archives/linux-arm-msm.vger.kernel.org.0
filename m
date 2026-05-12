Return-Path: <linux-arm-msm+bounces-107200-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MMYGHJ6OA2qM7QEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-107200-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 May 2026 22:33:34 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D02CF52943B
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 May 2026 22:33:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 255AE3164F5F
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 May 2026 20:26:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 060203D646C;
	Tue, 12 May 2026 20:23:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="s1pCaq2Z"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D633A3D5C06;
	Tue, 12 May 2026 20:23:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778617434; cv=none; b=XjdMQeDFDUUpM6DKOBTEHV9OjnVKU6qJ23nEv4NICeyt7cblcvc/R6Byeh9YrziQulyIP2pwHGl66naEGSxSZWkJ0M5hmUYu1poOq3ACLFDAl6TENxy6PqmQY7A+NH3XC3yyDTMO9YchQZev5x3XP8Xaz/+hVH3paWI9Ad9xjbw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778617434; c=relaxed/simple;
	bh=mQk0s8mtv63bM0yo010w4D1GeTlfHBqmaw3KLvodcYo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=tZa1RVWIQB2vUw055ZQwq1YcPKkUbPONZ/NmjKzUK9/wV6WrApVq1AY5BeFwoyjD4rSLbmwix8dl4p/EDR00yE46mH1IeBes6j3KNPJG1OkxHVPqeFYDq/y4hPwoWz5nsJFBqOVjnPDPDtoF1XUFufuyba+sCpAZojH8ov1vUmc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=s1pCaq2Z; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B7FFFC2BCC7;
	Tue, 12 May 2026 20:23:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778617434;
	bh=mQk0s8mtv63bM0yo010w4D1GeTlfHBqmaw3KLvodcYo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=s1pCaq2Zp9RIToquoqBsMPwGEXyKj/KJtUMgB/zRqwxNJ4TFvcKuhIY/b/TnCCmgx
	 ZjHxCOv6RnRspjNQGG7ZdBBjf5KJCY/PqIQ/uKDtfq7fA2nrLVm0hXViWfGeZ1sAOn
	 1yAFe2CRxI5vW4JnEAoP3BgA8Bt4bgTCaMp8dgE8xSANeuMSAmpSkMetYLMlMcMx+y
	 cKVXr3GWCefd8KnpBIONk4ANv7qsRc7AgDujy5kaDu7DW+sAXfzE9BcXmcLSAcGGvY
	 dQ5JIPi2IT2/fUOPieVLpPXxCMEwK7NllpS+1FKzP8ojMso514C2gvrHUsCSDvIKEk
	 qbwQJIZ0FENQA==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jeff Johnson <jeff.johnson@oss.qualcomm.com>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	David Heidelberg <david@ixit.cz>,
	Paul Sajna <sajattack@postmarketos.org>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	phone-devel@vger.kernel.org,
	~postmarketos/upstreaming@lists.sr.ht,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH 0/4] arm64: dts: qcom: sdm845-lg: Devicetree followup
Date: Tue, 12 May 2026 15:23:07 -0500
Message-ID: <177861739366.1242344.3815215725258355687.b4-ty@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260408-judyln-followup-v1-0-823467519b59@postmarketos.org>
References: <20260408-judyln-followup-v1-0-823467519b59@postmarketos.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: D02CF52943B
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-107200-lists,linux-arm-msm=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andersson@kernel.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Action: no action


On Wed, 08 Apr 2026 19:41:11 -0700, Paul Sajna wrote:
> Re-send 3 patches that got dropped from 20260331-judyln-dts-v7-0-87217b15fefb@postmarketos.org
> 
> (https://lore.kernel.org/linux-arm-msm/177541802142.2061229.9094394728986735362.b4-ty@kernel.org/)
> 
> Re-enable qcom,snoc-host-cap-skip-quirk
> 
> To:
> 
> [...]

Applied, thanks!

[1/4] arm64: dts: qcom: sdm845-lg-common: Add camera flash
      commit: 4eacad2d8e3bd1115a65fd62ce5e08825706fa52
[2/4] arm64: dts: qcom: sdm845-lg-common: Change ipa gsi-loader to 'self', add memory-region
      commit: d2735f569053092ca2a47367dce1594b985409e5
[3/4] arm64: dts: qcom: sdm845-lg-{judyln, judyp}: Reference memory region in fb
      commit: 3f779220c64796df483c4cd47154d4ff1104a2e2
[4/4] arm64: dts: qcom: sdm845-lg: Enable qcom,snoc-host-cap-skip-quirk
      commit: 0f7c65c11f59332ec6d02bf0482a283510efd03a

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

