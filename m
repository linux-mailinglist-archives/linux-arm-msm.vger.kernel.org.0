Return-Path: <linux-arm-msm+bounces-118095-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id QcT5ELv3T2obrQIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-118095-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 09 Jul 2026 21:34:19 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id BA1057350A7
	for <lists+linux-arm-msm@lfdr.de>; Thu, 09 Jul 2026 21:34:18 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=O8lLIwO4;
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-118095-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-118095-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id CAB98301F18D
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Jul 2026 19:33:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 43E583BBA0A;
	Thu,  9 Jul 2026 19:33:00 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3ED483B9952;
	Thu,  9 Jul 2026 19:32:59 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783625580; cv=none; b=t+tzoaYfPwktN5B3Qpf1xpx0XZoeSScBbb7JAeZkAwJAtdpAf+ooHlLJlmpR3BpyuXQMpr/3tAZTkYrqdWE3IOGxVd3iPi/qRimwj3SKoSPCwOFIGbCuZGBZ8lP1l7HmISX1KWFWTIB1xteB4m+JL+IRfp4H0AEhl7Uu2y1/v6g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783625580; c=relaxed/simple;
	bh=gVFuG7+vBpy63DDiHHNwlDwPc7yR8XEQeKmMBJcP2/A=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=OjHG/IobjztX+BSVktwKcimGl/9QCGLntQ/w6G9zqovkpgoiQGtK12DPkkjFxw8yTYRU9cdHdGA3+D4Uvz9locqlBhNZOiv6qZFuIsY/1qDbiIUmfzw8fvU31z/Y5AaaZKuQ5zo2MdWxUtlAI5fGV87f9OdQhKCw/qmkdrCyBbE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=O8lLIwO4; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0DAFD1F000E9;
	Thu,  9 Jul 2026 19:32:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783625579;
	bh=sngdqUCXqTLY0/tvNdwEAQ4+9TiWOAZtPzmnzyZ5zp0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=O8lLIwO4anUEdTcDCgb4CrWDpg9PYVf2hQZoO1X5m/qt4HUVxt6ELnnYmgTCgtk9A
	 dXYT2j2dWANZZ2XkYBzC+8a67ph8x5yhI2JmPb7LS3Dftl4lVJKeh/W0WhAyP7i41n
	 LTc9JGLMTOFxVdSZCGVZveRabzloi1XwPZTdaZOIEZxIHiX5g/XONaWXKl0F2yKeeS
	 hOH1kMAAPAq/c8jlSfMHPPbFxk+7yJZx3U+2OYEK9kOn93kvHSyg73OqZkbLUCu8GC
	 gObTDtU37Rm1jsfXFR5HhamoWa0XbODGFU2qK/Bcw8ptE8vrsoUj/vg4lT3DMzBBtX
	 PrdFSGEBC6WMQ==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Abel Vesa <abel.vesa@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: qcom: eliza: Add CPU and LLCC BWMONs
Date: Thu,  9 Jul 2026 14:32:53 -0500
Message-ID: <178362531886.2423236.15524151411935053875.b4-ty@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260708-dts-qcom-eliza-add-bwmon-v1-1-602a409f550f@oss.qualcomm.com>
References: <20260708-dts-qcom-eliza-add-bwmon-v1-1-602a409f550f@oss.qualcomm.com>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-118095-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:abel.vesa@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: BA1057350A7


On Wed, 08 Jul 2026 15:29:23 +0300, Abel Vesa wrote:
> Describe the CPU and LLCC bandwidth monitor nodes for Eliza, together
> with the corresponding OPP tables.
> 
> 

Applied, thanks!

[1/1] arm64: dts: qcom: eliza: Add CPU and LLCC BWMONs
      commit: 4e967cad02bce8983c4e826cd13ef0e730692832

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

