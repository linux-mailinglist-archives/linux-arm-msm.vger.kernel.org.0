Return-Path: <linux-arm-msm+bounces-94364-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SIZ6NIsToWnKqAQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-94364-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Feb 2026 04:46:19 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 76FFF1B25E3
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Feb 2026 04:46:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id A8B69303AC9F
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Feb 2026 03:46:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AF3E63370F0;
	Fri, 27 Feb 2026 03:46:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Q6rB3D9d"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C764336EF7;
	Fri, 27 Feb 2026 03:46:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772163971; cv=none; b=jxBK9vujRIxy3cgdpgLIvl3KLTdYhzj11TgIR6gBQf23N3m94qefo38JJM0q395RFmo5U3vo6Ai08roQLjfA6RUiFXQ9HqQ81c3HfnblMeR+8hVB8Kjzq3kdHKzaKQ2buP55pec2cPfElnCer1XyyuIXbhpxrfAVVN8UjrjK4LY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772163971; c=relaxed/simple;
	bh=aUxI0A7t7gqwGsCkkqu95YuwqNyiPQye9v5lLI9WqFI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=sxtsKD6b1QbqA/UYspRyssx9RZ53b7FYUfBE8JKwtdyMHxTV9AR5oHUQUINHJ8d37k9dH7NslRM75aAqkg66cOp+ZDMvWiobqjdBCu2a95S1/nOT5QqFsVQWAhF7aF+BYu7Z0LelJ0AcGx/rlDUOpF11bMBjtdqtIXk8zFY/TyE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Q6rB3D9d; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 880E4C116C6;
	Fri, 27 Feb 2026 03:46:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772163971;
	bh=aUxI0A7t7gqwGsCkkqu95YuwqNyiPQye9v5lLI9WqFI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Q6rB3D9d/RyH7FKzvW0vrws0HLN+e5cy793fzfEiCV7RyQeoIfbwVaCCGU6SxE94v
	 +lk+edHycXKJhNG33qLq1Wke7MR/FFIaF7DhdbzUX4Wn1CQprwHDWPpXZzWj8CYgnl
	 AbIsr4SR+Xj0EZ7U8MpSEHZEdvap/5cy+Wy3ENqFlTryYAbfNiL/Y7KxL7rO2+CKZ6
	 eSVS1O7KKtHtLoRJBpShEgaXUBmHF/7yoBIljyLcUQhyjSJpsnMBTX4Q8mS+KzL1tS
	 D+h0J2245/tztz6hJCJ+Onv8duC5p/4dinFT9B1ZVLL03cKtQTcR9RdimyCeb1VON2
	 koRUe4Lo2VkqA==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jens Glathe <jens.glathe@oldschoolsolutions.biz>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Maud Spierings <maud_spierings@hotmail.com>,
	"Colin K. Williams" <colin@li-nk.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: (subset) [PATCH v3 0/4] arm64: qcom: x1-vivobook-s15: add X1P42100 variant, restructure dts files
Date: Thu, 26 Feb 2026 21:46:04 -0600
Message-ID: <177216396220.866892.4162682453263558957.b4-ty@kernel.org>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260214-b4-vivobook-v3-0-3c88065bbf77@oldschoolsolutions.biz>
References: <20260214-b4-vivobook-v3-0-3c88065bbf77@oldschoolsolutions.biz>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-94364-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,hotmail.com,li-nk.org,oss.qualcomm.com];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.997];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andersson@kernel.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 76FFF1B25E3
X-Rspamd-Action: no action


On Sat, 14 Feb 2026 09:32:52 +0100, Jens Glathe wrote:
> This patchset adds the X1P42100 variant of the ASUS Vivobook S15 [1]. To avoid
> redundant code, it pulls the part that is identical to both variants into
> x1-asus-vivobook-s15.dtsi.
> 
> I have maintained the X1P42100 variant on my tree for about a year now, it has
> been tested by quite a few users. Also added sound (not in this patchset) and
> users operate this successfully.
> 
> [...]

Applied, thanks!

[1/4] dt-bindings: arm: qcom: Add ASUS Vivobook X1P42100 variant
      commit: 1fdbcc6d3f39a67e65d1fbdb91af43ae6b576110
[3/4] arm64: dts: qcom: x1-vivobook-s15: create a common dtsi for Hamoa and Purwa variants
      commit: da35a8931fccda7a165a2ec07f3bd48664eadaf4
[4/4] arm64: dts: qcom: x1-vivobook-s15: add Purwa-compatible device tree
      commit: b0829cd6a633d1cd18d1560937dd0455bb8d4d28

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

