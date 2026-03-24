Return-Path: <linux-arm-msm+bounces-99548-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uDFjJm0JwmliZAQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-99548-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Mar 2026 04:47:57 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CDDA301D6A
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Mar 2026 04:47:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1DE023142485
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Mar 2026 03:42:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A9D0B3A451D;
	Tue, 24 Mar 2026 03:42:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oypLsDXL"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86BFF3A3808;
	Tue, 24 Mar 2026 03:42:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774323744; cv=none; b=DPkQNhQDzodNSX47xqkWODiP2KMbGHjS1mccFhNpa2s9mmBx0zK7GFRoj6Dr8AcoNkrdXScc8+QkmPUwHqhinVA+h3xh2ztSylVp1/BvDg5z78NiWk+/beOmg0nJm/WAOHK/D3lm4vZDe8uTlUWogsIhOXuiMDl/K+bZQzTOEGM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774323744; c=relaxed/simple;
	bh=DwlMuUldPnUoE1+doEHJYG9HavjeB/IryHDgqrJnCMw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=GcALTxsZxyPf+BkuI2+rqfWNONFICKe0piQH7NQAEgByYxINwwykv78JNXjKpZovzMrQUKaBacc4tyIeATnTefUDtnHlaSd1kY16c7Tau+4PhRClqO5t2aOhhz6/2z7GD00eszceVKlMFSJAe4rc5nMYRUe870hngKOAsKSNZ/A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oypLsDXL; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9BC62C19424;
	Tue, 24 Mar 2026 03:42:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774323742;
	bh=DwlMuUldPnUoE1+doEHJYG9HavjeB/IryHDgqrJnCMw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=oypLsDXL0cpWnk+99nTP7hTlJvJFDHs5//ngE8oO9SHFhOKDlghpM+o2iDK7Dn15p
	 mqGPT8YtYZFJURn6uiXmRU87rI601lSAAUl6CUbrGHIQJCN8EPFi3T3E8yTd8fCmW+
	 rNeZcLhzxivN6hvZt21WBDSogtYAba9KEy3OLK62nPqdVNGXIZ04yK2WkDm7rRRQfN
	 idCMzEa5N3hE8eZOTGIAARyBwnBSFynyJMI66zP5BWP7pt+w4q8iZ00FZprs/qD06g
	 7umBl0O2TbUBF8uJGUM2TF+7wPzPeRy2EwlzAO8/G10t9QGZpx0aLNobEsG0CCtLYz
	 GpVTc61RS5ung==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Swati Agarwal <swati.agarwal@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6 0/4] Enable tertiary USB controller in OTG mode
Date: Mon, 23 Mar 2026 22:42:07 -0500
Message-ID: <177432372694.35532.9315075607383431142.b4-ty@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260306091355.1178333-1-swati.agarwal@oss.qualcomm.com>
References: <20260306091355.1178333-1-swati.agarwal@oss.qualcomm.com>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-99548-lists,linux-arm-msm=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 3CDDA301D6A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


On Fri, 06 Mar 2026 14:43:51 +0530, Swati Agarwal wrote:
> Enable tertiary USB controller in OTG mode on lemans EVK platform.
> 
> Changes in v6:
> Moved Rename vbus regulator for USB primary controller patch before adding
> USB2 VBUS.
> 
> Changes in v5:
> Renaming of vbus regulator for USB primary controller as per schematics and
> in sync with tertiary USB controller.
> 
> [...]

Applied, thanks!

[1/4] arm64: dts: qcom: lemans-evk: Enable GPIO expander interrupt for Lemans EVK
      commit: 8fa0facd43544a3be8fb82cfe8259d0d658b2b06
[2/4] arm64: dts: qcom: lemans-evk: Rename vbus regulator for Primary USB controller
      commit: 595fc1cf192a2a2359c80bc3e2e0cdb3033e100c
[3/4] arm64: dts: qcom: lemans: Add role-switch support and HS endpoint for tertiary USB controller
      commit: 41792df8a0c727fef9a72be7350b4b16030d0743
[4/4] arm64: dts: qcom: lemans-evk: Enable the tertiary USB controller
      commit: bfd9e48da5c277c411d639add6c0bcabfdd73fa6

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

