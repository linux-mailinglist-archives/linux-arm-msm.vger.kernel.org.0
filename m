Return-Path: <linux-arm-msm+bounces-117105-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id q6qKEmJxTGqLkgEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-117105-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 07 Jul 2026 05:24:18 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 55A80717091
	for <lists+linux-arm-msm@lfdr.de>; Tue, 07 Jul 2026 05:24:17 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=LNCdqvHE;
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-117105-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 104.64.211.4 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-117105-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id A3EA33018201
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Jul 2026 03:22:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 308133A4F58;
	Tue,  7 Jul 2026 03:22:12 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F20338B7CD;
	Tue,  7 Jul 2026 03:22:10 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783394532; cv=none; b=hy0VdzsZaaPNUt80sSuamonkj9GC/tjfRgeCUWxBIsitnyPmoYM4/eckKc8ZN94WHd6hbuuqB5S07xnXlav1ouUC1WPP3uvDe/JVny8AHxuU4wpn3hW3Mc6XlzKmJmGAwwPRwfs1vtSYKseddUwgX0DzkP2+ojORmkqKevoS2xE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783394532; c=relaxed/simple;
	bh=Hra3RAanWkVOLdJ9Lq7JBRqQ2C0CWOjwd1sQ425QeGs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=cLtEv6mjsnrPO406CeYLovc/vCUdy1nDDR36XXOlF5get9rndzey7nnzot+wWiTxYm//I6e1RLHXA7GEYZAo+rSaZF//sRIasC8+x+J/3aKFK/HaCkZ/49VqGy3QzwXcgcO4AE49xYhK6XqwhVL+m08IvH2Yqxt4noM7/RHUM0U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LNCdqvHE; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2BEB11F00ACA;
	Tue,  7 Jul 2026 03:22:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783394527;
	bh=SoyiIyJ+MXdRUIVIC/mCwrPONUYaOdlbk8J1sYpF5mU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=LNCdqvHE/KESo+yUJi9XNeCI2PHj3BsW3GNudGfSsbtJ1Mmn5IxquRCD/Cs32Ac49
	 f2oPHWZOLkR/tiRCxUB2sjXViZ1bwV/sg5zRY6/oN8uzL8bGXklZnGz62gN0nPH/CU
	 TzilOWsq2IS7pLCjsZr4uVITyIEWCWWMchxH59B4jZCHremhqe9/bHCHbOtZWfGdF+
	 J/jZ5L5Dyv/FmJ/a8rKc0it/gTdHRoNc8ItnJK8+4OQTfgbWEibMIS46qaBENCV2sz
	 CWiMfzQILBb3fsrwTRaQN4E8ckYYAtNPke29UdTNyJYpsg0nutz+HU/cdL4PLjj5G3
	 2WZPilxS8V2/w==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Vinayak Katoch <vinayak.katoch@oss.qualcomm.com>
Cc: Bharath Kumar <bkumar@qti.qualcomm.com>,
	Chenna Kesava Raju <chennak@qti.qualcomm.com>,
	Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: qcom: glymur: Add memory-region for audio PD
Date: Mon,  6 Jul 2026 22:21:40 -0500
Message-ID: <178339449916.1938770.1898562510699107674.b4-ty@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260701-glymur-audio-v1-1-2c3862d95a09@oss.qualcomm.com>
References: <20260701-glymur-audio-v1-1-2c3862d95a09@oss.qualcomm.com>
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
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-117105-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:vinayak.katoch@oss.qualcomm.com,m:bkumar@qti.qualcomm.com,m:chennak@qti.qualcomm.com,m:ekansh.gupta@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
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
	RCPT_COUNT_SEVEN(0.00)[11];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 55A80717091


On Wed, 01 Jul 2026 15:35:31 +0530, Vinayak Katoch wrote:
> Reserve memory region for audio PD dynamic loading and remote heap
> requirements. Add the required VMID list for memory ownership
> transfers.
> 
> 

Applied, thanks!

[1/1] arm64: dts: qcom: glymur: Add memory-region for audio PD
      commit: 67641246eabd0629b11e767c233d92b855a64f45

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

