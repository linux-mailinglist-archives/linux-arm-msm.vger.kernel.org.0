Return-Path: <linux-arm-msm+bounces-115803-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id G0GoBNqCRWp9BQsAu9opvQ
	(envelope-from <linux-arm-msm+bounces-115803-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 01 Jul 2026 23:12:58 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AB916F1C52
	for <lists+linux-arm-msm@lfdr.de>; Wed, 01 Jul 2026 23:12:57 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=TQHxpVkP;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-115803-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-115803-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 96F253066C44
	for <lists+linux-arm-msm@lfdr.de>; Wed,  1 Jul 2026 21:07:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 545013A8739;
	Wed,  1 Jul 2026 21:07:37 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51B4A3AA1B6;
	Wed,  1 Jul 2026 21:07:36 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782940057; cv=none; b=FWQt+qsgTY1LsB7Y3sVp8vGM44RgVASsIlJt5yfbCpFvrQOp/+SQTRI/N0MDDgC7T9K0PEcvox8fNNmJF5u8Rox4WELOaIkbpM1M6RsrbpLxPF0Rha8htYKPGkZuWSSrMiAfMxlM5xBr10K9DFGvEoWjwNVmXA0K0t7LsqkECeY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782940057; c=relaxed/simple;
	bh=ByYszYPdC+psAWTW1wE3vbvgyyLcgxDdEtNdJqHLT5w=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=i2o7MI+W6HyYwHrTAmOSNBmNYkz8lSXltTwKv9rokMJATGn0aIVNM/RUo4a/V7ng3+CTWsHWkCZrG46hvVeSluUXdbIfhPWp+B/rxZrIiFHdMvbClYX18SajdPWPWgy4gTelzbNjgQWFrC4PJvoXC7LWCiCgTcn0DfcNZRe2TBI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TQHxpVkP; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4FBB31F00A3A;
	Wed,  1 Jul 2026 21:07:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782940056;
	bh=sfG7s89mfvljYpVWOaNelZwNwYWXPtSU+euAa/rOwBg=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=TQHxpVkPsNmamdUSK8oPd9dm5DS5uPpgVkAwzNTKuIbqMZZ8ZnWnsm6AMKtb1iS1y
	 3Cz4zryUD0GoJhSmJTWhCOaj1OOXIcbCQB+WtRxB9vDegQwGJqR48js2hxU2fT9QEK
	 6vOF8hBRdxLT76ATSgb6X2K9KKO72RF9dXSfYpa+MNH/s5Pm8YM5E09HSJeRwfEqJ1
	 LY16ji3IAKaYOd0zr7F4atjLAyrkoIo+uvPK0eZOHlqHIf/iK5dBz1M9Xoy8PgyHq0
	 fZnTzCc7c05K4YnyYnrz3WV3GsMShP/aKJzTe2rhL0NxwZH8UQ4TejpjZa81if9YuS
	 RM1SLLJILhtDA==
From: Srinivas Kandagatla <srini@kernel.org>
To: linux-arm-msm@vger.kernel.org, 
 Anandu Krishnan E <anandu.e@oss.qualcomm.com>
Cc: gregkh@linuxfoundation.org, quic_bkumar@quicinc.com, 
 linux-kernel@vger.kernel.org, quic_chennak@quicinc.com, 
 dri-devel@lists.freedesktop.org, arnd@arndb.de, 
 ekansh.gupta@oss.qualcomm.com, stable@kernel.org
In-Reply-To: <20260525085340.2734738-1-anandu.e@oss.qualcomm.com>
References: <20260525085340.2734738-1-anandu.e@oss.qualcomm.com>
Subject: Re: [PATCH v1] misc: fastrpc: fix channel ctx ref leak when
 session alloc fails
Message-Id: <178294005408.13032.9633451619945550985.b4-ty@kernel.org>
Date: Wed, 01 Jul 2026 22:07:34 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-5.16 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-115803-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:linux-arm-msm@vger.kernel.org,m:anandu.e@oss.qualcomm.com,m:gregkh@linuxfoundation.org,m:quic_bkumar@quicinc.com,m:linux-kernel@vger.kernel.org,m:quic_chennak@quicinc.com,m:dri-devel@lists.freedesktop.org,m:arnd@arndb.de,m:ekansh.gupta@oss.qualcomm.com,m:stable@kernel.org,s:lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[srini@kernel.org,linux-arm-msm@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[4];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[srini@kernel.org,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 6AB916F1C52


On Mon, 25 May 2026 14:23:40 +0530, Anandu Krishnan E wrote:
> fastrpc_channel_ctx_get() is called in fastrpc_device_open() before
> fastrpc_session_alloc(). If session alloc fails, the error path
> returns -EBUSY without calling fastrpc_channel_ctx_put(), leaking
> the reference. Fix by adding the missing put.
> 
> 

Applied, thanks!

[1/1] misc: fastrpc: fix channel ctx ref leak when session alloc fails
      commit: c48eabae708407d4f26eeb81f9fe8215741b78fb

Best regards,
-- 
Srinivas Kandagatla <srini@kernel.org>


