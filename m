Return-Path: <linux-arm-msm+bounces-98499-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IH5uFguyumlWawIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-98499-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Mar 2026 15:09:15 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A00B82BCB08
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Mar 2026 15:09:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 463583251A7A
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Mar 2026 13:55:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 667803E8C5D;
	Wed, 18 Mar 2026 13:51:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZuzwE6wt"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 434133E8C56;
	Wed, 18 Mar 2026 13:51:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773841880; cv=none; b=dLi4c71Ot4mm3eoRfYWB/12ELiRiwytdMaB+A8zT8GNoUj2mcngICvM6QCHynaA+Bt+abTetjpZjNsg+GFNxrRK6//bhOLc3Se2M4wncHyf8mLRhqAAdVAAS5Lx43FibJCp6MjAGe5g5hnzx3LCEBZ3FYvDABRHUCt+wPWAO9xU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773841880; c=relaxed/simple;
	bh=eRabq99M3xj9xoKIDM+R18YTgPDBCwl+S6wGL6ihD0A=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=gI6SpDxEtykqoErr4Gx0U+kOO7eOiviDrxnKdDkPIC8a7tJqsL7CaBxhonlCIqJUPmmGeLuuVzD9eQ3MgtzNOQ2i42tXPk9g1recy7kPiILU1aO12Iki5JtnLpG0ZB700EhNKTbCq0XWWhsoh5mZnrO/n9ETyVnZ/pnq1hGBcz4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZuzwE6wt; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C3245C2BC87;
	Wed, 18 Mar 2026 13:51:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773841879;
	bh=eRabq99M3xj9xoKIDM+R18YTgPDBCwl+S6wGL6ihD0A=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ZuzwE6wtjsbzJCf2+aTEn3CLmqcpeI7rUvkQEfNfhUyKrgaMZxqeV/bEqjAHC2dG+
	 Pdn6R5IPAKvvtZaE6xgKSSPmDjrzG6SegCSitbz4CPSGWfvE2WTxRfYqUVBY5mXc2a
	 RC+aO3yiTW0s5wqlyPu5RdpKe0cIYBrVWxxxF4GmTjXh27bgb/0p5jCGmR1307piP1
	 56c2N3nq84DV4DvQ7BH6Y51walPxhIOu+GY2x2xZCByIMdThCPMKwFa80jwHqHTXSC
	 sl40rYvIo1JVp0B2nEX8asCUKWr6AZ+El8sLzTIxAja6pduWHEMjMLIjSuQBjMgxHo
	 xH0LIk1M4VFbg==
From: Bjorn Andersson <andersson@kernel.org>
To: konradybcio@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	Xin Liu <xin.liu@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	tingwei.zhang@oss.qualcomm.com,
	jie.gan@oss.qualcomm.com,
	Abel Vesa <abel.vesa@oss.qualcomm.com>
Subject: Re: [PATCH v3] arm64: dts: qcom: hamoa: Add remoteproc IOMMUS in EL2 device trees
Date: Wed, 18 Mar 2026 08:50:30 -0500
Message-ID: <177384182873.14526.13138679628509416816.b4-ty@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260203063244.1498699-1-xin.liu@oss.qualcomm.com>
References: <20260203063244.1498699-1-xin.liu@oss.qualcomm.com>
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
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_FROM(0.00)[bounces-98499-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MIME_TRACE(0.00)[0:+];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andersson@kernel.org,linux-arm-msm@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[11];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: A00B82BCB08
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


On Mon, 02 Feb 2026 22:32:44 -0800, Xin Liu wrote:
> All the existing variants Hamoa boards are using Gunyah hypervisor
> which means that, so far, Linux-based OS could only boot in EL1 on
> those devices. However, it is possible for us to boot Linux at EL2
> on these devices [1].
> 
> When running under Gunyah, the remote processor firmware IOMMU streams
> are controlled by Gunyah. However, without Gunyah, the IOMMU is managed
> by the consumer of this DeviceTree. Therefore, describe the firmware
> streams for each remote processor.
> 
> [...]

Applied, thanks!

[1/1] arm64: dts: qcom: hamoa: Add remoteproc IOMMUS in EL2 device trees
      commit: 47c88db49f6ced5592331c38ef95978fe3497704

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

