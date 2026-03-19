Return-Path: <linux-arm-msm+bounces-98588-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +C+EFxRuu2nGjwIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-98588-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Mar 2026 04:31:32 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 62D572C580E
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Mar 2026 04:31:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 80B1C300B2A7
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Mar 2026 03:31:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 86188175A7F;
	Thu, 19 Mar 2026 03:31:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="tjZp5ElD"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 614E213B293;
	Thu, 19 Mar 2026 03:31:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773891087; cv=none; b=KXHWKINcWFMqQAzlLpLcu1V3BRGhqto0z8HgYXBkTl/hVE3o3YTLJeBR5SE06EyfR3465cHSyv12hr5VqXuiI6QIDffAKHyUtSNmeAIMy4Rp62BM7AxsEQgX8tSvhdAN2iMw8yAT82Lyd85qhJiFtYmBOh8ZnNsZNaiaL1UX/4c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773891087; c=relaxed/simple;
	bh=+deWqqyX+5ETdJp5Km05ApruMdjtnVXohn/opMejJKQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=BpkGkeGE4FBXsPCDkk4eO08a/rleO24z0uvKXrv+QXmjwS0POkXysfceGqKIFIzs9HbpNePExZCjsoJG1Ch4MIa5RLkDisdi5JCjeWZNXE9eby462vVwHZ3kKVmaZshzv0qM5ouwxWDIYWcZwGvruW5uJ2wZcu2+eE2izrWL/s0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=tjZp5ElD; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3AE5AC19421;
	Thu, 19 Mar 2026 03:31:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773891087;
	bh=+deWqqyX+5ETdJp5Km05ApruMdjtnVXohn/opMejJKQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=tjZp5ElDGVPAZPh1EB25ES8YUl6b605o3b6Ih7Z6AXFVl6K9JOIx2dgYgJ4Axl/HU
	 5Ph6hsVSW1U9xsXd49FvXtJwqVP6tyqR2jT+7K8LO1Oo/YTzi5TF3mRqKVb3Yio+LT
	 H4puQ+wNg8Kro4a77cxbnFS+A5k5L31dLjUmVsG6QcDnjdL6nLw9c6uQ5cDI0R68fb
	 1hVufRUCdEFAhMH+0YDEfVE5gioHuqrg5Zc6jPaFaeQZ5piHD7b2X7NBSgVt6qXdEd
	 32L0Zomuq2OUf3ap0kauZtnB/qcHvEgUitud9vn75nSjJEWzPNN1uL28nT3ueofkiK
	 k2DTA8FyHgiRg==
From: Bjorn Andersson <andersson@kernel.org>
To: Abel Vesa <abel.vesa@oss.qualcomm.com>
Cc: Konrad Dybcio <konradybcio@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: defconfig: Enable Qualcomm Eliza basic resource providers
Date: Wed, 18 Mar 2026 22:31:11 -0500
Message-ID: <177389107880.16612.1378745657412302485.b4-ty@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260316-arm64-defconfig-enable-eliza-basic-providers-v1-1-7ae581670aa8@oss.qualcomm.com>
References: <20260316-arm64-defconfig-enable-eliza-basic-providers-v1-1-7ae581670aa8@oss.qualcomm.com>
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
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-98588-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	RCPT_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andersson@kernel.org,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.997];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 62D572C580E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


On Mon, 16 Mar 2026 13:23:52 +0200, Abel Vesa wrote:
> Enable the interconnect, pinctrl and Global Clock Controller (GCC)
> providers as built-in, and the Top Control and Status Register (TCSR)
> clock provider as module, on the Qualcomm Eliza SoC.
> 
> These are all necessary in order to be able to boot up Eliza-based MTP
> board with debug UART and rootfs on UFS storage.
> 
> [...]

Applied, thanks!

[1/1] arm64: defconfig: Enable Qualcomm Eliza basic resource providers
      commit: a37cd9efe3d21b2d21c85b38001a367e2a50c2bf

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

