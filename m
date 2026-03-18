Return-Path: <linux-arm-msm+bounces-98481-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cI3OC96uumlXagIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-98481-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Mar 2026 14:55:42 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CC6E2BC6D2
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Mar 2026 14:55:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 640A2304F47B
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Mar 2026 13:52:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 553743DD53D;
	Wed, 18 Mar 2026 13:50:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LG7yxZoB"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 303963DCDA4;
	Wed, 18 Mar 2026 13:50:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773841853; cv=none; b=QM1dtqVOPTUe42aWu2aXaSH4OAhaL86JOw84LUvuulVJ4RvEFUSm6Cglpwmp80LDWNFIW4yGlgKSW4+jSNbNYfvw8bIZmEPtPyon1Bo8QOrJzHPdb4vHFJLrCFdN9OdNgXNGjGT/1R84DB3fturEX/hijXKoPNRf1UuaJD5YPTA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773841853; c=relaxed/simple;
	bh=8PObLaOZ2wIUFEnV+ru2YPcYizaGwodlup+bePW8+qU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=RTP/qWHDtx4dWLJtLp0e2BeKh4W/XLsP8o5+WcjYW6Z+I1lCdJ/7T0Q2ytCFcIO/P1Vleh4wTXhGy9Da6yIw8cvjFvO+Kd+bjJ/lT+tYaMdCheVwZmtsd2/2v1il+PWMbvgw39Q7MwTrdNSEWmsfgj6TbDZkppcweAxycKiBTwg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LG7yxZoB; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8CD3DC19424;
	Wed, 18 Mar 2026 13:50:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773841852;
	bh=8PObLaOZ2wIUFEnV+ru2YPcYizaGwodlup+bePW8+qU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=LG7yxZoBpCkaanuWE+MBgRsqyK7pY0qguJRGuMYLOY5JflbmI0extXzwNEudDCCVA
	 +gnb3uRrNzf9XUnm0YlwAtTSzvyBrcM4KSxM0V81Jlo9qtICvPcu+av0XhPPkM6I8Z
	 sS3RJhYqMeqgLP9BFc7EdnpiHTd6wnN+eQXZFb1uC58AtGU67eYxnB08xUu+eKDTO1
	 Ljb5gV+7/lh18YMP2Rkn5lWqC1+1KXLZC3h0rKZ6ZcbmXto8KezoKX3DkE5LklZ5KK
	 8Yi5P2qOVBQb0/Mt4JVQ63MJDNayvjvRkuP0rxrxLFPGQIxu1pkl/VEdESaHORRuRL
	 95y2jv27NSeGA==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bhushan Shah <bhushan.shah@machinesoul.in>,
	Bharadwaj Raju <bharadwaj.raju@machinesoul.in>,
	Luca Weiss <luca.weiss@fairphone.com>
Cc: ~postmarketos/upstreaming@lists.sr.ht,
	phone-devel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: qcom: kodiak: Add I2S1 pinctrl definitions
Date: Wed, 18 Mar 2026 08:50:12 -0500
Message-ID: <177384182895.14526.14738211356860995805.b4-ty@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260211-kodiak-i2s1-v1-1-b3a7fad8014e@fairphone.com>
References: <20260211-kodiak-i2s1-v1-1-b3a7fad8014e@fairphone.com>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-98481-lists,linux-arm-msm=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andersson@kernel.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 4CC6E2BC6D2
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


On Wed, 11 Feb 2026 13:18:57 +0100, Luca Weiss wrote:
> Add the pinctrl definitions to configure gpio6-gpio9 of the lpass_tlmm
> for I2S output.
> 
> 

Applied, thanks!

[1/1] arm64: dts: qcom: kodiak: Add I2S1 pinctrl definitions
      commit: ff9c117c32bc6ace7de1cba1a323e80c29629e23

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

