Return-Path: <linux-arm-msm+bounces-109146-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +B5UHDddD2oLJgYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-109146-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 May 2026 21:29:59 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0241F5AB760
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 May 2026 21:29:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 516E4304893E
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 May 2026 19:28:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 253872727F3;
	Thu, 21 May 2026 19:28:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GnmQALKB"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 099EE3F20F9;
	Thu, 21 May 2026 19:28:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779391722; cv=none; b=MUq6oIK+QsmTUbxA1vISWadau8Uih6aYeCAX4VeyZNZV2U1+b22n2AmgxAk/eu8H0PYLeH24THMfS8laqfXXlS53OP5TJA5kL6tCVTDsabXcBySViF/e0KbaU5p8vQ67kPWcy0UAO+mabCPVUkXwgTg67zE+WqQoaSte4SuZdd0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779391722; c=relaxed/simple;
	bh=4Hz0C7+wNv3xXi07v0gwJ4tl/nKHeui9hTytDYnSgn8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=YyT1wDk9k62WjyvdLc4lmkFS1MXuVORz+BGIIMejE5Ue+ZTr2Z3xLIByjy544eJ8Gir9Pw50uB7kOFSAAWkjRpR/KNK4B93TbfcEGHjwT1jztAOWRcT7dePawSAO61t2zn7KwrDfWBTB5VM/cyPBmI5JOGRL0+z1rnefNvScUmw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GnmQALKB; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 11A6E1F00A3B;
	Thu, 21 May 2026 19:28:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779391718;
	bh=9HroMEPw/Wa3yaBiZRi7Ge/B5SjHUU0CglZwWATGv+4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=GnmQALKBN5tbenlGBHpbLg2heRYByuNoLQ1U5Rw4Xi0XRVXxmgr0UABXyWsMII3Ic
	 xa3z42jBPruujlpti6g7/tz6MHwP9ab8kHKZFOe434c/M/EWzmd4Ax4iRMDvtixqua
	 BgtNzeowEcyMOJgCcmI5MCF3z/Vaq28BCN+Z5Oh71/iUmTfTyM9wDVl+VqTqkobhN6
	 SIZToQEPhL76qJ3vVyiGQqej0wQ2FdCr3mm6zv1sPh55f4gIz5onIrfPkPLT2ii0OM
	 K+aHoRwS/zFgqzGMKkKcWTdLFLoA5sMhrfkxpnS/CnrO9px8lPeiidA//+muI7tPFv
	 zCAq9O73rUqSg==
From: Bjorn Andersson <andersson@kernel.org>
To: Shawn Guo <shengchao.guo@oss.qualcomm.com>
Cc: Konrad Dybcio <konradybcio@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] soc: qcom: socinfo: Add PMIC PMAU0102
Date: Thu, 21 May 2026 14:28:27 -0500
Message-ID: <177939170556.182385.2422863350479004971.b4-ty@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260419131523.1232835-1-shengchao.guo@oss.qualcomm.com>
References: <20260419131523.1232835-1-shengchao.guo@oss.qualcomm.com>
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
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-109146-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[kernel.org:+];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andersson@kernel.org,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Queue-Id: 0241F5AB760
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


On Sun, 19 Apr 2026 21:15:23 +0800, Shawn Guo wrote:
> Add PMAU0102 found on Nord boards to pmic_models array.
> 
> 

Applied, thanks!

[1/1] soc: qcom: socinfo: Add PMIC PMAU0102
      commit: a92d3fdb44c2b9d2b8dc463e287030e03ea00699

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

