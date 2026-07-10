Return-Path: <linux-arm-msm+bounces-118348-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id R/HMMao1UWpIAwMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-118348-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Jul 2026 20:10:50 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E7EE73D3E0
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Jul 2026 20:10:50 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=dkavSFY6;
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-118348-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-118348-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5C75F304DBB3
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Jul 2026 18:07:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C142B37DAA6;
	Fri, 10 Jul 2026 18:07:26 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D43937B415;
	Fri, 10 Jul 2026 18:07:23 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783706846; cv=none; b=US62I42sZSloN3+dqyhhqZh/ctqp8i6GCVXmvGV35OAVByQecna34zdfImBm4OdXVhEt2D3z5zNgmAnz5vNkuPsqRoBHZmmJn3Etxsm4OlGABh8/D+P77VrA24PWmQs+fZsUKBB7QswMZJwXnrFnG+oX7ICJe72kBu1qUFCDLfM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783706846; c=relaxed/simple;
	bh=lcpICsyTNqKGxTwAISCqIqc1zQK9fexyXV9marLETHk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=NllHFZwTt4CqObPcMlLXDuXfRSr3grbLPnQe3bCYzC9sYOPSAOD9T0pwNtmS7FSpup1PmC559PJYVm/n3MSlGrOxIE0v/UD752WL/5jUajjO5DUUQKgsGA7u0lfoDg+FdSW3G1HOxY+96lufIHeXe2z+i/6hHSR6/RVH4eAMwdI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dkavSFY6; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EEDBA1F00A3F;
	Fri, 10 Jul 2026 18:07:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783706843;
	bh=4G+nAEbDkSf79QMV/VmVVdOvQKG969j3uYzdvbfr1YQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=dkavSFY62Auhika3QZ0PRVc9ADe2tkbwq27tSizdqnfHX5gERCYyQe9zNd5RrT88i
	 P3FzInuzog0a8hTeSNMcLExpSuYi3ftDEtQJabZHKhZE/1SH5CTjylRJKvcorRNlVS
	 UMWZKqFoldUpyeC9xTgE9wKLkuFXoD0lcwVsC9YmpbJIyFpJe7wifI1CGNuCXak9EF
	 O9S1FDP5sWdmT4kbRgYr357br2cTvPyY3NtyEuqT7BtleRnlCdGmCDipdLmuFSmRSx
	 LPYR8OwT/Ga3KBKzZLX3pl0M1w/iVzlG3isCSHWt8V//Dlyk/2hRg5ZLDY6N+zbuHH
	 fWzRyd2UFwIQw==
From: Bjorn Andersson <andersson@kernel.org>
To: Mathieu Poirier <mathieu.poirier@linaro.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	Val Packett <val@packett.cool>
Cc: =?UTF-8?q?Matti=20Lehtim=C3=A4ki?= <matti.lehtimaki@gmail.com>,
	Luca Weiss <luca@lucaweiss.eu>,
	Vladimir Lypak <vladimir.lypak@gmail.com>,
	=?UTF-8?q?Barnab=C3=A1s=20Cz=C3=A9m=C3=A1n?= <barnabas.czeman@mainlining.org>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	~postmarketos/upstreaming@lists.sr.ht,
	linux@mainlining.org,
	phone-devel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-remoteproc@vger.kernel.org,
	llvm@lists.linux.dev
Subject: Re: [PATCH v2] remoteproc: qcom_wcnss: Fix handling the lack of PD regulators in v3
Date: Fri, 10 Jul 2026 13:07:07 -0500
Message-ID: <178370682982.2572738.1804514769753985254.b4-ty@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260201210230.911220-1-val@packett.cool>
References: <20260201210230.911220-1-val@packett.cool>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.66 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:mathieu.poirier@linaro.org,m:nathan@kernel.org,m:nick.desaulniers+lkml@gmail.com,m:morbo@google.com,m:justinstitt@google.com,m:val@packett.cool,m:matti.lehtimaki@gmail.com,m:luca@lucaweiss.eu,m:vladimir.lypak@gmail.com,m:barnabas.czeman@mainlining.org,m:konrad.dybcio@oss.qualcomm.com,m:dmitry.baryshkov@oss.qualcomm.com,m:~postmarketos/upstreaming@lists.sr.ht,m:linux@mainlining.org,m:phone-devel@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-remoteproc@vger.kernel.org,m:llvm@lists.linux.dev,m:nickdesaulniers@gmail.com,m:mattilehtimaki@gmail.com,m:vladimirlypak@gmail.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[linaro.org,kernel.org,gmail.com,google.com,packett.cool];
	TAGGED_FROM(0.00)[bounces-118348-lists,linux-arm-msm=lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[20];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[andersson@kernel.org,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andersson@kernel.org,linux-arm-msm@vger.kernel.org];
	FREEMAIL_CC(0.00)[gmail.com,lucaweiss.eu,mainlining.org,oss.qualcomm.com,lists.sr.ht,vger.kernel.org,lists.linux.dev];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,lkml];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 0E7EE73D3E0


On Sun, 01 Feb 2026 17:55:03 -0300, Val Packett wrote:
> The changes introduced to handle single power domain platforms have
> swapped the info pointer increment from num_pd_vregs to num_pds, which
> would shift the info pointer past the end of the array for pronto-v3,
> which does not list power domain regulators in vregs.
> 
> This showed up as a difference between GCC- and LLVM-compiled kernels
> on SDM632 devices, where only with LLVM one would get the
> "regulator request with no identifier" error, because the out-of-bounds
> memory ended up being zeroed. Fix by skipping the increment when there
> are more power domains than regulators.
> 
> [...]

Applied, thanks!

[1/1] remoteproc: qcom_wcnss: Fix handling the lack of PD regulators in v3
      commit: 3dbc90b9c22ea96e37bf55f6011e63b5123ec668

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

