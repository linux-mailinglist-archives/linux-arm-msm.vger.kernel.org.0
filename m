Return-Path: <linux-arm-msm+bounces-107183-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mKa3HaaMA2pN7AEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-107183-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 May 2026 22:25:10 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C36F52917B
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 May 2026 22:25:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 85CE53064C95
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 May 2026 20:24:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 33D4B3CBE7A;
	Tue, 12 May 2026 20:23:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SaEpqpWZ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F44D3C8199;
	Tue, 12 May 2026 20:23:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778617420; cv=none; b=XCGpy1xkNW7yk5s47g2a4Pk2n2KoWHKK12FfYViI9VuIRY7OLE61kcsISkPP1/PBdXAJfWNtGqUdPCiUo+sVBWDJlEDxRXHr3NQoPwFRwsG7orFOpfhcNHxL29a8pPfwR0A30c7cYEz9UrpgQlImH+Rsma6QLcaUAio0ORvdA4U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778617420; c=relaxed/simple;
	bh=HLzLHGrw1kXS7D6X0mtrlc7A7wZrV6Q5JPpXN1iVuic=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=aX7XrUz0w/JRYEIJ1ABJHS/WZ6ALsjvPjIQcZ02OhcsT4k3uO1cIwNQQ9Q1R4wZ/sSl1kF1zB6SQ+oVeKlSKIJ5MjzQkDXlCWbaP7c2pKdMlN/9vEbAUERQOCcIGrXA616Qvw6ajV6QC23mHPFSuk7pMlVLCyGBRloVN4qVFfs8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SaEpqpWZ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A1AB3C2BCB0;
	Tue, 12 May 2026 20:23:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778617418;
	bh=HLzLHGrw1kXS7D6X0mtrlc7A7wZrV6Q5JPpXN1iVuic=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=SaEpqpWZvFM+gycfJQhO2rRdHeRefJ1BDre2f+xqy3IPNyTGQNGWdm4iXj6dP5knC
	 k9pAnEFX7SYOSbDGJFeVyuKsw371VXmelnJAhMhbl2yP76pc5Yk23Qm/2IYGlDDBsx
	 BfDg9ogAK+llNcjxs89sOZLvP2R/Xm6Ue5D+cl6eqOt1pf163NOkMik3GM4immS1FD
	 DAv1myxsOIyrC5VOIXI3ZPERRPryQKU09aQSDJnWnh9hvOusiOGTy9tocFX+mzqFbS
	 5npcR6WYILcLljCYQCOctdiwBMgGBvzkCgchB2FV0YXDqcnCoc9cV0KgcM+p/2ZmQg
	 JsSq/PGPI0e3Q==
From: Bjorn Andersson <andersson@kernel.org>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Hans de Goede <johannes.goede@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: Re: [PATCH] clk: qcom: x1e80100-dispcc: Stop disp_cc_mdss_mdp_clk_src from getting parked
Date: Tue, 12 May 2026 15:22:48 -0500
Message-ID: <177861739368.1242344.14732791462236158411.b4-ty@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260425123351.6292-1-johannes.goede@oss.qualcomm.com>
References: <20260425123351.6292-1-johannes.goede@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 2C36F52917B
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-107183-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	RCPT_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andersson@kernel.org,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Action: no action


On Sat, 25 Apr 2026 14:33:51 +0200, Hans de Goede wrote:
> Parking disp_cc_mdss_mdp_clk_src at 19.2MHz causing the EFI GOP framebuffer
> to stop functioning. The EFI GOP framebuffer should keep working until
> the msm display driver loads, to help with boot debugging and to ensure
> display output when the msm module is not in the initramfs.
> 
> Switch disp_cc_mdss_mdp_clk_src over to clk_rcg2_shared_no_init_park_ops
> to keep the EFI GOP working after binding the x1e80100-dispcc driver.
> 
> [...]

Applied, thanks!

[1/1] clk: qcom: x1e80100-dispcc: Stop disp_cc_mdss_mdp_clk_src from getting parked
      commit: bc27dbefae6ed11376d991a2921eff806ffef67c

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

