Return-Path: <linux-arm-msm+bounces-99313-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oFxtBL5SwWkPSQQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-99313-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Mar 2026 15:48:30 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id A27C22F5389
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Mar 2026 15:48:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 47ADE30216FC
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Mar 2026 14:39:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F3AFA3B3BE2;
	Mon, 23 Mar 2026 14:38:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="N4uq/lXv"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D11863B38BC;
	Mon, 23 Mar 2026 14:38:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774276725; cv=none; b=CkRGMNaLyGjO/+sc3C2GRJOZmB0ErW8vKfxtVPgNnPUsjURv1DHWS9Mt1GlR5st9xuYHlP0ZvQgbMgJEKeZsonBjQOI4JhASCxmGrLKbzJuSDnSaHf1uXi3OtEHQZ6fORF+KoEA2Ad+EvBfh97uZaoIwh+5OUjTgVDNhJGTIVFs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774276725; c=relaxed/simple;
	bh=ejKY2qKRohDskwOoFvH55RgMfsd1HX5nQ2ns57ecbXo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=LatVwWqFjuwXco93R8T0retDz8EWZfDBLr/JSEEaJ7NOqk+oQNkaCAx+YchP3FKekZeRauVrutlEoRBoUve22QkurzNxdfwu4ZFdU5mhhoNdszgTJaVSCESy6r3d4w7EmYfMbwyeNOPbo0jnuobUQpNc5UqR8AAFC80Yc+Ha+Y8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=N4uq/lXv; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DE798C2BC9E;
	Mon, 23 Mar 2026 14:38:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774276725;
	bh=ejKY2qKRohDskwOoFvH55RgMfsd1HX5nQ2ns57ecbXo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=N4uq/lXv74sSkaXMq4FmI3o7H9SR9ya1att5v7AbtMH9TbgztJoEdkHljfLJ/AMS9
	 2YLdM414gp3F/iAp8k+yhuCKVfMD1HyU4dlWkaB2ijq3Kxttm9ykM6JcDcWVwEm367
	 RG2EeyXuDnfq5ig1VygtsmTEVaIiOGA25N2o8RdVuzZUzBfltiYX2YsB/2S8o6NRey
	 Et/bQW53EvbuZcX7a7BDQIII2LUDlB2F0rJHDiIdE1IIyk7P7XOmkvD3lteW9kw/++
	 YRwJdWJBwpssjP2D6+Poi3DfmlDQlIh0x7kbmTqSzVvpe+nc6J6SucIJ3Kv3y8ReJu
	 fLZlt3qP/TNHQ==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	kernel test robot <lkp@intel.com>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v2] firmware: qcom_scm: don't opencode kmemdup
Date: Mon, 23 Mar 2026 09:38:26 -0500
Message-ID: <177427670520.11515.5174250222484813451.b4-ty@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260310140255.2520230-1-mukesh.ojha@oss.qualcomm.com>
References: <20260310140255.2520230-1-mukesh.ojha@oss.qualcomm.com>
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
	TAGGED_FROM(0.00)[bounces-99313-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andersson@kernel.org,linux-arm-msm@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6]
X-Rspamd-Queue-Id: A27C22F5389
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


On Tue, 10 Mar 2026 19:32:55 +0530, Mukesh Ojha wrote:
> Lets not opencode kmemdup which is reported by coccinelle tool.
> Fix it using kmemdup.
> 
> cocci warnings: (new ones prefixed by >>)
> >> drivers/firmware/qcom/qcom_scm.c:916:11-18: WARNING opportunity for kmemdup
> 
> 
> [...]

Applied, thanks!

[1/1] firmware: qcom_scm: don't opencode kmemdup
      commit: e32701726c0e6312aabd83aa1c00f59b0d7df276

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

