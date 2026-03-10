Return-Path: <linux-arm-msm+bounces-96447-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WMUdLl+Hr2lvaAIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-96447-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Mar 2026 03:52:15 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 632EE24476B
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Mar 2026 03:52:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id BA4BA31B12C9
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Mar 2026 02:47:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4E3C03BA23A;
	Tue, 10 Mar 2026 02:47:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="tnfbkFeL"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29D933B4E8B;
	Tue, 10 Mar 2026 02:47:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773110836; cv=none; b=smaDLtsriWn7yxpt56mqRNpAT8cor/ysAVSiX7q696DpFUF0+30R0Hu3t2hjBr2Ew2zlNvNDw3HYjR5rler45BqKj/UwTjAsnMrWSzGp3tPPywi2HL1oXtKj+cQ+ZGGuOzgyBkNhaNHG3ARBPZc0GGQwdDf6QfLUWzbtTOLg79c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773110836; c=relaxed/simple;
	bh=hagCR+t+FamRhY2o/aWKz7eO7C6fVm/woirCAMqyzQg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=iJA9AfL3LGObH9+/FVI4XelFBOJu9EfSc1qWgUFJyyhpmqkHH7H9anUrD/2SxbmMJ9Ss/fqHSxKEtIeztiL8ocpnLtRnl8ieFmUaRoyq2qMX6WB557qmni0GtyDlvKxqdeeOr7slzzenL1sQCfnIN7adPr7RZxoni5ts3fj5mgY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=tnfbkFeL; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 912FBC4CEF7;
	Tue, 10 Mar 2026 02:47:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773110836;
	bh=hagCR+t+FamRhY2o/aWKz7eO7C6fVm/woirCAMqyzQg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=tnfbkFeLXBQ/E9/aLmFpu8adJpkm4qHT90vRde58QDKOlRcMVWUBA1curzLOl3D0m
	 i4J7iVONwa/UAhhwp4HiRxXsMfZ3lApK+zM1jfdm4AR9P4OKEe916LJ3YhRa7gdoix
	 1Jt7MTH7drn6Ua40qBC3ANf4Qp2tOcutktnQ+7R0WL+LXeH8gIDoho7TPOwKfaIDk+
	 tmb1ga9dN2Fn/uObBZvqu650xIGKdV/KEfOOq8NO5WxXpnfZJw+ATbHo7O8myZAsAH
	 3ORKCahGOwRu1lxQX5Bb9gFalvO0ZuCadDFb4Y/wGIgst5vDpTVS26FS7oDJYfqVef
	 dZK/h7VmSXh+Q==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Le Qi <le.qi@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	kernel@oss.qualcomm.com
Subject: Re: [PATCH v2] arm64: qcom: pd-mapper: Add QCS615 power domain mappings
Date: Mon,  9 Mar 2026 21:45:36 -0500
Message-ID: <177311073320.23763.2731294958925756793.b4-ty@kernel.org>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260130061231.310113-1-le.qi@oss.qualcomm.com>
References: <20260130061231.310113-1-le.qi@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 632EE24476B
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-96447-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCPT_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andersson@kernel.org,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Action: no action


On Fri, 30 Jan 2026 14:12:31 +0800, Le Qi wrote:
> Add the QCS615 domain table to the in-kernel pd-mapper so that audio
> subsystems no longer rely on the userspace pd-mapper daemon.
> This enables proper initialization of ADSP and CDSP domains directly
> from the kernel.
> 
> 

Applied, thanks!

[1/1] arm64: qcom: pd-mapper: Add QCS615 power domain mappings
      commit: 7a7d24a14a009691a1af6bfe45b210521635db5b

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

