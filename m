Return-Path: <linux-arm-msm+bounces-107194-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +GpwMWSOA2qM7QEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-107194-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 May 2026 22:32:36 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 178755293E3
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 May 2026 22:32:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id A187730864C7
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 May 2026 20:25:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B9D153D25A7;
	Tue, 12 May 2026 20:23:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lkWxgq/r"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 966BA3D1CCC;
	Tue, 12 May 2026 20:23:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778617429; cv=none; b=t3AmJb813wfAmenfNPhe83npsVX6PXkPe4Epdrkdza+aSItwOWbT5ahwNXYQK1a1tEoloBC4iuXKsD6aKYTQtCEbK+j8aRJgCSrC30trmQWiv0NwmPPTcwxIiL7JnC3IT/xBMlQBSB+fzCca7AfAPD7hyz9kS4Hpf4icPBfdLLI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778617429; c=relaxed/simple;
	bh=pRDKmY+PbXKvtePgEVuGEJbHXcStxT6RTsuZeZHS/rQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=lkmvIy0xMbl8MDORTf7038LBTXO+k9HRq6yatJCipSnNdsPPYKskog0QnNidR3DvZNgsJmb2ycR+Vrllwqd/H4GtZl1QWYaOycfxnHJ2VctH9UXpEI9AiL/oVj8WIjpUoW1/c2dDNURTPfTsVRG8T1ZIo6aCq437SlkHtAKrm+g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lkWxgq/r; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B5231C2BCC7;
	Tue, 12 May 2026 20:23:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778617429;
	bh=pRDKmY+PbXKvtePgEVuGEJbHXcStxT6RTsuZeZHS/rQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=lkWxgq/rPg65t+8fOMO7VkGHjCKnwmyoz+PgkZBv9EsfBtoW1gHcjPYV0jnH1DREm
	 wAVzYixKJh6TD4T1LFrHvj1ocFTffMvrkLVk9WuKPmAcED88vDAWKYayivoWX4fMpk
	 kft4tb06WxxAxY5F5XuInkdjXo47s7v9O6frfSdcTI/ao6Nq65RPMCaMEZ1yy9n0Si
	 5DsF3cRYAxCiKd+0QKMyeHR3nlHMp++uwv3bTw4iJ0NMFtEvV71Q3EaNtFCkFHJb2T
	 7sXuDU4dpRjVVajU8aukKkppJdy7aujuyPqcST3HlNwDlbpIxErTqSYEKwTNHEDVui
	 fHVGyNYkFFOvA==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Le Qi <le.qi@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	kernel@oss.qualcomm.com
Subject: Re: [PATCH v4 0/2] arm64: dts: qcom: QCS615 Talos EVK audio support
Date: Tue, 12 May 2026 15:23:01 -0500
Message-ID: <177861739342.1242344.10363023412612381424.b4-ty@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260324060405.3098891-1-le.qi@oss.qualcomm.com>
References: <20260324060405.3098891-1-le.qi@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 178755293E3
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-107194-lists,linux-arm-msm=lfdr.de];
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
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Action: no action


On Tue, 24 Mar 2026 14:04:03 +0800, Le Qi wrote:
> This series adds initial audio support for the QCS615-based Talos EVK
> platform. It introduces the GPR (Generic Pack Router) node in the SoC
> device tree and enables a sound card node with the DA7212 codec on the
> Talos EVK board.
> 
> With these changes, playback through headphones and capture from the
> headset microphone have been tested and verified to work.
> 
> [...]

Applied, thanks!

[1/2] arm64: dts: qcom: talos: Add GPR node, audio services, and MI2S1 TLMM pins
      commit: d962cd7c49fa210e53dfeed04028ac9ef112ae70
[2/2] arm64: dts: qcom: talos-evk: Add sound card support with DA7212 codec
      commit: 141d7ea5036e70f670aba1e6704be74552a3c964

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

