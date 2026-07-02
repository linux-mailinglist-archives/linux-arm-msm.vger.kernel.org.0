Return-Path: <linux-arm-msm+bounces-116138-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id D3ynL8/3RmorgAsAu9opvQ
	(envelope-from <linux-arm-msm+bounces-116138-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 03 Jul 2026 01:44:15 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 90BFF6FD750
	for <lists+linux-arm-msm@lfdr.de>; Fri, 03 Jul 2026 01:44:15 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=bzxR+vRc;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-116138-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-116138-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id BE30D303F1CD
	for <lists+linux-arm-msm@lfdr.de>; Thu,  2 Jul 2026 23:42:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 02C2441228D;
	Thu,  2 Jul 2026 23:41:10 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAA3940B36D;
	Thu,  2 Jul 2026 23:41:08 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783035669; cv=none; b=BWOEDlFNaPFlo00SVZS6OsVfuiLM942befU9GKJ4D0NdDvqSmEAredhFpEC5ixT+zCnleK42KB2J9HflO61pE3aJd0+8o2OcRfvPFGoRYyGXhxFmLOHAfp99NxwPjoy1QGEVhL6M1AnNEgYijISC7x/qTjuB62mhXuwRYbnOtVU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783035669; c=relaxed/simple;
	bh=O93p7dJkG+TJZHyjAmGra3uVL95lR+0Zrd9Fet5+brI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=R8H8IXCzwK47RQ0UTai7V8ZGJxqhA0vKfEYXpAgleRHCCvs48H0EmlcPryZIZy0hkYluhIwkvtlhFFBPNRcKdj0G5YA2KktDgDB2/lVgMXqsj5x2v9Dg3rNjSL0wR+xB1IzZQmAdINqFffNC1KuhHPuvjA1MG3+SMY2Qs0TF0a8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bzxR+vRc; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3BA1D1F00A3A;
	Thu,  2 Jul 2026 23:41:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783035668;
	bh=DD8gYBpUnNvqzw0MpLNyg/okBNMVbs4Lz/SJ1NV3aQw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=bzxR+vRcUWqwmC6LRTAxYX7pz8rv4665sIrptsGIh2ZgiyF4NzKE2l+Tv8qmbl9EZ
	 jt4e0n8de+JNRMHaCpfb4voDJ3aeJO8fVW4i7EgojalrFJurBB/Hyvb3EYfH1CZBHE
	 zVzD0A7BaocBmdo4XaLaoB1OgDyRg3LTYfhjHm1GYN9pbmZ9SczsZzF3N/WnLl0Z8+
	 TgPPDk3ncUp8MpgAULNfjY6ODv9BjEm3NnFDHCGEexDHpBydX3RmXPuJLrF5JMHWVs
	 ne1mwAShkLn/+ep8PvCrpkbaLYkobeCGNuFprod2YNIsAJ76zVJtT4UCZUeq+QoHas
	 gShggGJAUl+4Q==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Swati Agarwal <swati.agarwal@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v8 0/2] Enable secondary USB controller in host mode
Date: Thu,  2 Jul 2026 18:40:43 -0500
Message-ID: <178303563660.359079.10721371545120012417.b4-ty@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260406110113.1709886-1-swati.agarwal@oss.qualcomm.com>
References: <20260406110113.1709886-1-swati.agarwal@oss.qualcomm.com>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-116138-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:swati.agarwal@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 90BFF6FD750


On Mon, 06 Apr 2026 16:31:11 +0530, Swati Agarwal wrote:
> Enable secondary USB controller in host mode.
> 
> Changes in v8:
> Removed unsed nodes.
> 
> Changes in v7:
> Split Driver and DT patch for USB1 controller and USB1 HUB support
> 
> [...]

Applied, thanks!

[1/2] arm64: dts: qcom: lemans-evk: Rename hd3ss3220_ instance for primary port controller
      commit: 0215d65882b46a22780f6d27d21c94b2550527a0
[2/2] arm64: dts: qcom: lemans-evk: Enable secondary USB controller in host mode
      commit: 224d718f2f6b084e9d362f98dcb3ba9feabe28fe

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

