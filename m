Return-Path: <linux-arm-msm+bounces-102525-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WHu6CP/q12nnUggAu9opvQ
	(envelope-from <linux-arm-msm+bounces-102525-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 09 Apr 2026 20:07:59 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B600C3CE724
	for <lists+linux-arm-msm@lfdr.de>; Thu, 09 Apr 2026 20:07:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 75D1830037F6
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Apr 2026 18:07:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0FFC1318ED9;
	Thu,  9 Apr 2026 18:07:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxsw.ie header.i=@nxsw.ie header.b="lah4rGvv"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-07.mail-europe.com (mail-0701.mail-europe.com [51.83.17.38])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBAD91A682F
	for <linux-arm-msm@vger.kernel.org>; Thu,  9 Apr 2026 18:07:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=51.83.17.38
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775758076; cv=none; b=dMMgsnQA3gvo2WApEzgQSQP6U7tSr3tyvVwq5YiS1lg920gmrcWVv3hqWvtH/kggpMK4Iv6NH3p/RcyublCa8sLjkwkgO5kxHCN9iY+32yftAdi0HgDQLIxvrWB0FTdjWlEWW+P7M9onvb+5KE29twCZ57dYFYR9M0uUN56s+xE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775758076; c=relaxed/simple;
	bh=p5k3U6hSJnLNBM7BUwcadVlzQ2VzvGpy63Ep1dyT7jI=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=H+rNytz9jaNfkZNYg1w71UAx924VmMhC/t7dsSitxnyVTbo5zZKjq7sFXfw48uaTkji9c4pv8p5LQrV//rcwL5k1WkhYMd+zP4WNa+AdNyvL8CwUtra0J05fKwLRwk2pmDD5S1lc9bh0mZSFS/wADYidBDrRBjJgeg/L3tY8JRU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=nxsw.ie; spf=fail smtp.mailfrom=nxsw.ie; dkim=pass (2048-bit key) header.d=nxsw.ie header.i=@nxsw.ie header.b=lah4rGvv; arc=none smtp.client-ip=51.83.17.38
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=nxsw.ie
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nxsw.ie
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxsw.ie;
	s=protonmail; t=1775758055; x=1776017255;
	bh=p5k3U6hSJnLNBM7BUwcadVlzQ2VzvGpy63Ep1dyT7jI=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=lah4rGvvWdek1UWLhwrgdeakR9f0HS1pE+rL9nCAD4Jjm7y2fsBkZz6B9Xm8PFDLJ
	 qNuQkoWeDwADU9HwXaPC7JmgvsQGpS12cnc7j42OL09UyBUxmmjjwFLftIToMpiUA5
	 xTLgfsxmX7U+EVWPjFyDljwmIxMq2hW47DL5/j+L1m7+s0mVVZTFQdoCtfTySQH9vA
	 GwGdyhTZ2AO2kNyS2jDdB89w8ZvdRCW+AIauyTxMGyxUQaMzxZU3mzXEryAAnoC95h
	 Ws4un1pNivZX0Zloq6WUYPzukmSdzQEedg+vG5nRz5EFqvQlQ+re99uk4tRhoLRDsG
	 uGlU+gckP0M4w==
Date: Thu, 09 Apr 2026 18:07:25 +0000
To: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, Bjorn Andersson <andersson@kernel.org>
From: Bryan O'Donoghue <bod.linux@nxsw.ie>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>, Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org
Subject: Re: [PATCH 1/2] clk: qcom: common: Add option to link clock controller to power domain
Message-ID: <c70dbffe-974c-45f6-8612-978a8279dd83@nxsw.ie>
In-Reply-To: <20260331140142.892579-2-vladimir.zapolskiy@linaro.org>
References: <20260331140142.892579-1-vladimir.zapolskiy@linaro.org> <20260331140142.892579-2-vladimir.zapolskiy@linaro.org>
Feedback-ID: 136405006:user:proton
X-Pm-Message-ID: bf73ea641a7969ddeda8e72163ca8381daab1bde
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[nxsw.ie,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[nxsw.ie:s=protonmail];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[nxsw.ie:+];
	RCVD_COUNT_THREE(0.00)[3];
	TAGGED_FROM(0.00)[bounces-102525-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bod.linux@nxsw.ie,linux-arm-msm@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[8];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: B600C3CE724
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 31/03/2026 15:01, Vladimir Zapolskiy wrote:
> +=09if (desc->use_rpm && desc->cc_gdsc) {

Why desc->use_rpm at all ?

Your later patch enumerates desc->cc_gdsc so if that pointer is=20
populated you want the rest of this code to run.

And the only cc_gdscs you've enumerated are the ones you want to link.

---
bod


