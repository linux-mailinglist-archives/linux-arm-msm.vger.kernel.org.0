Return-Path: <linux-arm-msm+bounces-98514-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4BjUAC68ummqbQIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-98514-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Mar 2026 15:52:30 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 03CCA2BD8C3
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Mar 2026 15:52:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id C1AED306D079
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Mar 2026 14:36:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 762B63DFC89;
	Wed, 18 Mar 2026 14:34:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QJvKNkFg"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50C293DFC87;
	Wed, 18 Mar 2026 14:34:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773844484; cv=none; b=U2TPmgAf2Qce2kNuhw+uvkC3OfV6Rey06KVkYCJKeHlWf8MOguo8xuNlt+fue8xVSAV3ovth/5nQDGiQvrJ7levMDdKKUZOK6KtBnDSyuWsBopedd7WrYLNT02yYDuip/v0CETbdriDjqMyiP5R/ODKLycNoXPSeMZV87O5jRzg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773844484; c=relaxed/simple;
	bh=HanmwPMH1O0RI0PJY9z6T4zBlQz+KHanM1pduXungGA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Xucd0WN15fx2PAdIT9S3gSZxhLJQRPPhPLd9c6WAyhLvtJUcbDqo2THJ+PfDViPykZGRg8K70vDArgUSXhuoFUAHjgOVx7XcP663eHHBkpRsMQUtlDjLFwrziYl07bN3UxDeEjWnKdZXr7XqOWh2tQXZapXTqsyX2dn78U70Uzo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QJvKNkFg; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 37678C2BC87;
	Wed, 18 Mar 2026 14:34:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773844483;
	bh=HanmwPMH1O0RI0PJY9z6T4zBlQz+KHanM1pduXungGA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=QJvKNkFguGE7qplaKfC8UE+V/CymuWpbaCGlkM2VVN23jtMaprOmkHNDC2P3+F3f7
	 9X2Tuxc8XI6xJV7/yJKs7zcXpEtZDaU+sdXo0rTxJ6N+c3hvEZtL/85ot5AyC5Hh6s
	 Qv1nNRlJWJ0HwcYOP6PytFBXjNxuQ8oW56AQCnrnadsGoV4Q5xM++tjRG8ZMQTweM5
	 +7tvgWYUR1CzJ60KVATXUr2ZrMZ29AhpbbkXqLl8BQyTt2ie8HzcX2+lSjsqHACHkG
	 Nw7/kpyixmJuwGqi6XLy8nO/ahj/JkId41x0ukMRPfh92hlCAbWiJ+hTnF0dST4BQk
	 UJZ9R8mS5i/GQ==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Marcel Holtmann <marcel@holtmann.org>,
	Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
	Wei Deng <wei.deng@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-bluetooth@vger.kernel.org,
	linux-pm@vger.kernel.org,
	cheng.jiang@oss.qualcomm.com,
	shuai.zhang@oss.qualcomm.com,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH V4] arm64: dts: qcom: qcs8300-ride: Enable Bluetooth support
Date: Wed, 18 Mar 2026 09:34:32 -0500
Message-ID: <177384446641.22424.14287595183017921421.b4-ty@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260302024658.2836798-1-wei.deng@oss.qualcomm.com>
References: <20260302024658.2836798-1-wei.deng@oss.qualcomm.com>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[kernel.org,holtmann.org,gmail.com,oss.qualcomm.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-98514-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[16];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andersson@kernel.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 03CCA2BD8C3
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


On Mon, 02 Mar 2026 08:16:58 +0530, Wei Deng wrote:
> Enable BT on qcs8300-ride by adding a BT device tree node.
> 
> Since the platform uses the QCA6698 Bluetooth chip. While
> the QCA6698 shares the same IP core as the WCN6855, it has
> different RF components and RAM sizes, requiring new firmware
> files. Use the firmware-name property to specify the NVM and
> rampatch firmware to load.
> 
> [...]

Applied, thanks!

[1/1] arm64: dts: qcom: qcs8300-ride: Enable Bluetooth support
      commit: 2d600e615f53891f75f0607c530163384b045edb

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

