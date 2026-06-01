Return-Path: <linux-arm-msm+bounces-110661-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cIczJV/RHWqjewkAu9opvQ
	(envelope-from <linux-arm-msm+bounces-110661-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 01 Jun 2026 20:37:19 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F6EF62417C
	for <lists+linux-arm-msm@lfdr.de>; Mon, 01 Jun 2026 20:37:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4C57730F074D
	for <lists+linux-arm-msm@lfdr.de>; Mon,  1 Jun 2026 18:19:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 06DA73EC2FF;
	Mon,  1 Jun 2026 18:19:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aBiZcztI"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18D0B3E958F;
	Mon,  1 Jun 2026 18:18:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780337942; cv=none; b=sr03NzL7cBpSaFNR4LkJ5li3prm1eTOr0KRgWgktGrz3U98UympuFyyDoYmf823T/KgQAdjAgmG5VS+vLkvB+5Id8VogWdGEhW0LxoATIG+/JsdfyBUOaL6aCjKNrZlzpPScDe1CA0uTT9+7qSM9kuKFlpNT0pSOdvYhXEmN8nM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780337942; c=relaxed/simple;
	bh=lr6HcdGr1QzRL6wfJHQh8cxNuLhQix0yqgV2m04LAic=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=pSKpGIDZRg4y4oUkMsPYPmH71/gM1St7lU7OxHrJ8HHw/CYqZhJ2Hf/T1JtP5YWZXaIBfvn1lsutVwS0eqLsJafU4IfR4u08fzn9C2hmFfY4f+4+GYTBVwM+D+jH1/EnzrzHSe98CMgg3HZR63JSw8aJDdlc0H8age9/2qfmB3Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aBiZcztI; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 688E51F00893;
	Mon,  1 Jun 2026 18:18:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780337939;
	bh=iMISu2h/AgRe7VgUkohykNIi0GENGLQBh4R77ViK9FI=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=aBiZcztIRD88L9SrmOCad2y+PyD4vjdMzVZjKAslidwnKbfuGmLf8aSkloOFXfh8v
	 ivj8IJIU7BOVpr+wtaUSj3SzBBy6wNBY8IC/OHNF+pY/gshJch4HVRFExPQzgjIEMm
	 r8uW5lUbAe89iaYPotFXo0HIYxL987CArGIw6aKCyjucSqken3wPZiM1bXa2EBg/sq
	 ZexQBZ+AUFwKacqVfUih85yeQWNim9uJ5f+3tC9m5Hf6HiD4+bl9c0FQFk1GYfHIFG
	 zKogkLB2oE7iZ6fHn2s+/ogwhhLcHaN6vxA6NIUrWrdMKLC5zdYj6MP3Q6AoumltWJ
	 YzbOrBTPPhumg==
From: Benjamin Tissoires <bentiss@kernel.org>
To: linux-kernel@vger.kernel.org, linux-input@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 Harrison Vanderbyl <harrison.vanderbyl@gmail.com>
Cc: jikos@kernel.org, andersson@kernel.org, konradybcio@kernel.org, 
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
 dmitry.baryshkov@oss.qualcomm.com
In-Reply-To: <20260529011619.9586-1-harrison.vanderbyl@gmail.com>
References: <20260529011619.9586-1-harrison.vanderbyl@gmail.com>
Subject: Re: (subset) [PATCH v3 0/2] Add support for Microsoft Surface Pro
 12in
Message-Id: <178033793717.13972.8775821998832280559.b4-ty@b4>
Date: Mon, 01 Jun 2026 20:18:57 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15.2
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[vger.kernel.org,gmail.com];
	TAGGED_FROM(0.00)[bounces-110661-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bentiss@kernel.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: 1F6EF62417C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Fri, 29 May 2026 11:16:14 +1000, Harrison Vanderbyl wrote:
> Changes in v3:
> 
> Rebase:
>  - Rebased on next-20260528
>  - Removed ice device tree changes
> 
> Device tree:
>  - Fixed C++ style comment in &i2c9 to use /* */ style
>  - Flattened mdss_dp3 port into &mdss_dp3_out directly
>  - Whitespace and formatting nits
> 
> [...]

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/hid/hid.git (for-7.2/core), thanks!

[1/2] hid: Pen battery quirk for Surface Pro 12in
      https://git.kernel.org/hid/hid/c/3a1e4e77e3ee

Cheers,
-- 
Benjamin Tissoires <bentiss@kernel.org>


