Return-Path: <linux-arm-msm+bounces-116606-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id vLtoG/jGSmr6HQEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-116606-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sun, 05 Jul 2026 23:04:56 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E38470B6BD
	for <lists+linux-arm-msm@lfdr.de>; Sun, 05 Jul 2026 23:04:56 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=MOjimGGE;
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-116606-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-116606-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id C07BC308C884
	for <lists+linux-arm-msm@lfdr.de>; Sun,  5 Jul 2026 21:00:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0E56A3B635E;
	Sun,  5 Jul 2026 20:58:23 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF2C93A9854;
	Sun,  5 Jul 2026 20:58:21 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783285102; cv=none; b=BP0BqcAswh+FVgXsIjDhoQiDJXbTMBZ42DfR4y/6D+Z2OaGWagmlV82lv6yhbU+410+Qo3MBD7T8kMom6BR3AnwIg1XFgQGUjuh3SReUc4IXT52CPDvgOpOg7kDHBRA/olmJWQwyzuKHkbxfjKhRWuuNOQw0LG4TN+W2apQpunE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783285102; c=relaxed/simple;
	bh=XC9lm0U2NuDSV5piV+/BIzeaTFSDE1CZg3dKXyS3+00=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=GFM4RPBvNggPuY6ViP0OA8vrgVubpR14ClOvdWZVI62C0mOPwVlz09cMgdv8tLzXhBmGg47czoF+oCJ7LWvSwd7WMUOMkA7uIJq7bnMWbijKqdGM+YuWU5j3Joiji0scrvNqHJ3CpbiU3+XXSzkPJwOEnSB1e09s68+rE2CeS4k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MOjimGGE; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C62E81F00AC4;
	Sun,  5 Jul 2026 20:58:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783285101;
	bh=pq4Faq6yvcgMquNohFZPCZPDa8Typk1OjjiMj6EcRBI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=MOjimGGEr/O2Z+6+3Hz0g7Nbb0sq9vnxM3e/UbtuoJ4OPK8szx2N4A5a4OA6Cmzkm
	 J4Oqfdl4Ri2kgPLE92P8OwtIXB5MbvFdrdfQ1Nxn6KLvl2sYEbs0Me7rrm2aYY/phg
	 Me2AYkQkMKkIOjQbfcp8phIV1roXZ7Me8Vln+KvVx1mRri00EhRWCb2019+ussRyQM
	 C8ZOI07vsAfZCtnFUVJpWkpn9JPgKN9m7pZShsHNukIGJhtYS0oPbPpLFLc21md036
	 5p9FtLHUsYFp/hRtmzM3tC4BrTSnM8Rz/tJA52SoBVdL3f+UmWBbXQ+0wVQbuI4zsX
	 z7LahW2EHrYKQ==
From: Bjorn Andersson <andersson@kernel.org>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH] arm64: dts: qcom: hamoa: Add interconnects to primary USB3 controller
Date: Sun,  5 Jul 2026 15:58:00 -0500
Message-ID: <178328508264.1157743.11331399764906051229.b4-ty@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260410-topic-hamoa_usb_icc-v1-1-461e64304067@oss.qualcomm.com>
References: <20260410-topic-hamoa_usb_icc-v1-1-461e64304067@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-5.16 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-116606-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:konradybcio@kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:konrad.dybcio@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[andersson@kernel.org,linux-arm-msm@vger.kernel.org];
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
	FROM_NEQ_ENVFROM(0.00)[andersson@kernel.org,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 1E38470B6BD


On Fri, 10 Apr 2026 15:32:13 +0200, Konrad Dybcio wrote:
> Add the interconnect paths to enable drivers to vote on them, ensuring
> the necessary NoC bandwidth is available.
> 
> This hasn't been done before, as prior to commit 05566ebcc0cd
> ("clk: qcom: gcc-x1e80100: Keep GCC USB QTB clock always ON"), this
> would cause an inexplicable crash upon resume from system suspend.
> 
> [...]

Applied, thanks!

[1/1] arm64: dts: qcom: hamoa: Add interconnects to primary USB3 controller
      commit: 9594ee0e018dd8657e601b866ae3789ba9eb2e74

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

