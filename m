Return-Path: <linux-arm-msm+bounces-94727-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kKw4DSAppGnYZAUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-94727-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sun, 01 Mar 2026 12:55:12 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 85BD61CF77D
	for <lists+linux-arm-msm@lfdr.de>; Sun, 01 Mar 2026 12:55:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 10DA6300E71A
	for <lists+linux-arm-msm@lfdr.de>; Sun,  1 Mar 2026 11:55:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E7E2830BB85;
	Sun,  1 Mar 2026 11:55:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PX4854F2"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3EF81A9FB0;
	Sun,  1 Mar 2026 11:55:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772366107; cv=none; b=bKArC05IQsxBmDVnHqY2p0QkKnlZpfP9MqU6NX8iIzVdLY5PnAyI3fhTm0AuDHEds9wHYADzxnarXMcyfxnWKefF8B7snkuTSZSphU4ksPhKnfSm0eV0a6mr3PLNDLBF+9Z+DGr8oKjWgaeyaq/WsS3K+gxk0tXwRdsiW9TQ4jI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772366107; c=relaxed/simple;
	bh=DPLY//7CwUPnnKyD4ykJigxIS7uxw6pdw/ZLRK4Rqto=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lgSESpRUEdEhTB9UnwXmSqvDDfQzPdMAQgALQMJsDOGFjqQb7BM9MFpNmq94hP33G0Osg37VOtI0nixAw6oBpkRk+a4qBqoC2Hi2EFAcPv4IxWQOw7OzREjrENo6ATFF7nGyUck/F/9pXWGUBshoSoNA7Wz1JSiRHV8STlFDBjs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PX4854F2; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E0992C116C6;
	Sun,  1 Mar 2026 11:55:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772366107;
	bh=DPLY//7CwUPnnKyD4ykJigxIS7uxw6pdw/ZLRK4Rqto=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=PX4854F2YlRvuWDGgwc85O9fqgjQWuN6QjJezudZvIgpaiZ70Jmp6ity00ogJG2AM
	 u6mQvrYuh4brTJTD58jWqqK7Wraq7XRjk9gKxd9QSPQFJ4CFqdnsPZRtjk9pV5XlJw
	 StKDBO3pMcav/LBK3VgF41mjZehJDyW5YiAGpvFaNrv7nI0ZnkZ8gQurPqe/9/I44z
	 0WfLht4etWBA0fhVP605I0yE8CEbKlvxim+qHKnI69zsnH6DCXFqVmPnL0uup9K0L5
	 0i03c6eSG7D0wxRYTu0469EM3u1uzpSvI36Y0u2QgU0K3GZHsLa8P9/QRx3MV2q8Rt
	 gKFjTUVny/H0Q==
Date: Sun, 1 Mar 2026 12:55:04 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Val Packett <val@packett.cool>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Adam Skladowski <a39.skl@gmail.com>, Dmitry Baryshkov <lumag@kernel.org>, 
	Marijn Suijten <marijn.suijten@somainline.org>, linux-arm-msm@vger.kernel.org, phone-devel@vger.kernel.org, 
	~postmarketos/upstreaming@lists.sr.ht, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
	Yedaya Katsman <yedaya.ka@gmail.com>
Subject: Re: [PATCH v2 6/6] arm64: dts: qcom: sm6125: Add missing MDSS core
 reset
Message-ID: <20260301-colorful-hornet-of-luck-e17c4f@quoll>
References: <20260228204638.11705-1-val@packett.cool>
 <20260228204638.11705-7-val@packett.cool>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260228204638.11705-7-val@packett.cool>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-94727-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[17];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,somainline.org,vger.kernel.org,lists.sr.ht,oss.qualcomm.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzk@kernel.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 85BD61CF77D
X-Rspamd-Action: no action

On Sat, Feb 28, 2026 at 05:41:32PM -0300, Val Packett wrote:
> To make sure the display subsystem starts in a predictable state, we
> need to reset it. Otherwise, unpredictable issues can happen, e.g.
> on the xiaomi-laurel-sprout smartphone DSI would not work on boot.
> 
> Wire up the reset to fix.
> 
> Fixes: 0865d23a0226 ("arm64: dts: qcom: sm6125: Add display hardware nodes")

This maybe is the only place you can add fixes tag, because original DTS
was so incomplete that it could not reliably work, so here I could
accept a fixes.

Best regards,
Krzysztof


