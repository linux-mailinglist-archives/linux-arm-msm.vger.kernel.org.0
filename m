Return-Path: <linux-arm-msm+bounces-100827-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KMmoEDChymmx+gUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-100827-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Mar 2026 18:13:36 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id DA61E35E86D
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Mar 2026 18:13:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 7EFF53058BF7
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Mar 2026 16:01:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 421A0377016;
	Mon, 30 Mar 2026 16:01:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="f2O5/Zje"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5C8C37700A;
	Mon, 30 Mar 2026 16:01:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774886510; cv=none; b=FiTAKkoaAnDD2f+l7w8sgieTyISQBx//PiuOC+efaQ0Ik/+Ki3yT9069Mc19TcZ9meBrkdMoVcLGEvFTLnLYSoRWoRsc+ollxyefCJtEtObr0f+N5cl+J8+/nHmnnnmyxPwuIcsKh06c3QK+3YGwSVqHij4VZXhdUQTOgBmgBdo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774886510; c=relaxed/simple;
	bh=qk2eONxbgOF726Wv9i78z59aXx3CO92vebTpA44z15E=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=H2JNtiKuQZeEpsdVj7hLUoFfqqQ2QdGDdkgsBv0ly+OGxHRixY5irlNAeWkS1tPz6VSHPCtA9OKVEtLAxUkHxPvqYLQF4XelRR0QBSY7tgxXOxFXyB18Cr6vFp93CorRMNLXIwA/5zN4I97TZa0Hji8jkHj1HTXNdIFp6TpX6qA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=f2O5/Zje; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 11D1CC19423;
	Mon, 30 Mar 2026 16:01:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774886509;
	bh=qk2eONxbgOF726Wv9i78z59aXx3CO92vebTpA44z15E=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=f2O5/ZjejYR35T0S5aZVpzG5TbhOpu8f8Xp2jnepeqrUIdUHeBXWbecwcRf6Ttktr
	 rXuJzJ4dBCqzosOKZdC8gYP6ist/1U0Jf9y6pE+oSaaRGqRMxftWzdeuvxR2qRSRFF
	 +KBGIRJv3V6PsXhdc1vn3Uj3XLcPzJ+A5eKEGds60O41vIugRrL2ma+w/c0Y3U2YKF
	 Uycf6noMCcvndUZ0/Jt7oBux2CoT8SUIEp2HsoQ8b1XIVwYnGJVSBqr3AltywEqGuz
	 tDC45ywno6pPJGhtRZjxv5rzL9UEWpaYggOIQoEPsXCTjGLs7JpP1RWgQwkwogzPpA
	 THzq6+bqea2CQ==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Abel Vesa <abel.vesa@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] soc: qcom: pd-mapper: Add support for Eliza
Date: Mon, 30 Mar 2026 11:01:08 -0500
Message-ID: <177488647764.633011.17886535242293660876.b4-ty@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260327-eliza-soc-pd-mapper-v1-1-17334d6ab82d@oss.qualcomm.com>
References: <20260327-eliza-soc-pd-mapper-v1-1-17334d6ab82d@oss.qualcomm.com>
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
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-100827-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[kernel.org:+];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andersson@kernel.org,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: DA61E35E86D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


On Fri, 27 Mar 2026 16:22:33 +0200, Abel Vesa wrote:
> Add support for the Qualcomm Eliza SoC to the protection domain mapper.
> 
> It has the same exact protection domain configuration as SM8550 SoC,
> so reuse that.
> 
> 

Applied, thanks!

[1/1] soc: qcom: pd-mapper: Add support for Eliza
      commit: 79c9ede455820e179608f9d52584c74d19e13fb0

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

