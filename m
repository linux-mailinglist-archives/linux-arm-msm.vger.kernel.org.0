Return-Path: <linux-arm-msm+bounces-100830-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aF0UMKigymmx+gUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-100830-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Mar 2026 18:11:20 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F25835E7A2
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Mar 2026 18:11:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 3943F3087839
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Mar 2026 16:02:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4AA3B377EB0;
	Mon, 30 Mar 2026 16:01:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RWbukxfa"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28561377EA1
	for <linux-arm-msm@vger.kernel.org>; Mon, 30 Mar 2026 16:01:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774886512; cv=none; b=gsAv4GhCcGSblq6yGrcOYhhFT2OppZmOs0lBP6wrob/Oxu2/Rv79mD4Hr4Pdf3+4Xi57CMYprdei+CFbllvbKLzaKrwq1VZkb1eYsxebICLPuCDB7psZfkZqAPlSq6MUYiJsH4ugrnV2vOpS/wIKt16ih7xLhwBm0JwOwkBPAXU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774886512; c=relaxed/simple;
	bh=XzOIgKcBPZptJbJaElUyeAQyoV0I2Oh3dIPut+AYZkk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ANKOp+nEkITh5aoTKTF41GUuks5CayKF+K91Xrg9bqIff/kUdPdrMkX+mizhS5U+n4r+/V4q8Ou1Xekn9VfgnxvcxDuy63ud7XKBvBrCXXJvcFkRdr6CwG3ra7nfMjqH09wc+wCsLyy17KJGSuEzVhu1tOr5a4d0w+UAgPFIyuE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RWbukxfa; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 520F0C4AF0C;
	Mon, 30 Mar 2026 16:01:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774886511;
	bh=XzOIgKcBPZptJbJaElUyeAQyoV0I2Oh3dIPut+AYZkk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=RWbukxfabqPM2/V/1qQ0K9zK0ceNiHuLA41V+9xpp7MZqbZy8IJ+A3ypLeX1QwgJW
	 FM6/rWWwJXRcUbv6MXblotWcQBjPpXuW5aVRoAFv25zsi8mb/HdhxkP3pDc7tNVKwm
	 ixVkSnJT67xr+F4AIJsxQs3RNUq1pnoksTuaFWPlTAkcajuVHFoX4AGjkLai9kHy3s
	 Fd9d3Cik++2vjeJ3aukWskGJsEv9/Gfp8ymna6Mx0PCUM6EQxi+FsmZhyvepYNsjah
	 u5EHKYzzhM3nMt6oGQr9GM/GuvU9yt6YIZx1HiZus3YSg2YkMUuSqJHIe6u7q3cEaq
	 8SmtCJ+KMcfdQ==
From: Bjorn Andersson <andersson@kernel.org>
To: konrad.dybcio@oss.qualcomm.com,
	mani@kernel.org,
	konradybcio@kernel.org,
	linux-arm-msm@vger.kernel.org,
	Alok Tiwari <alok.a.tiwari@oracle.com>
Cc: alok.a.tiwarilinux@gmail.com
Subject: Re: [PATCH] soc: qcom: llcc: fix v1 SB syndrome register offset
Date: Mon, 30 Mar 2026 11:01:11 -0500
Message-ID: <177488647751.633011.11126744090499269185.b4-ty@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260330095118.2657362-1-alok.a.tiwari@oracle.com>
References: <20260330095118.2657362-1-alok.a.tiwari@oracle.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-100830-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andersson@kernel.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 1F25835E7A2
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


On Mon, 30 Mar 2026 02:51:11 -0700, Alok Tiwari wrote:
> The llcc_v1_edac_reg_offset table uses 0x2304c for trp_ecc_sb_err_syn0,
> which is inconsistent with the surrounding TRP ECC registers (0x2034x)
> and with llcc_v2_1_edac_reg_offset, where trp_ecc_sb_err_syn0 is 0x2034c
> adjacent to trp_ecc_error_status0/1 at 0x20344/0x20348.
> 
> Use 0x2034c for llcc v1 so the SB syndrome register follows the expected
> +0x4 progression from trp_ecc_error_status1. This fixes EDAC reading the
> wrong register for SB syndrome reporting.
> 
> [...]

Applied, thanks!

[1/1] soc: qcom: llcc: fix v1 SB syndrome register offset
      commit: 24e7625df5ce065393249b78930781be593bc381

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

