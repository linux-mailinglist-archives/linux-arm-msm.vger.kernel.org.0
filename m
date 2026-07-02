Return-Path: <linux-arm-msm+bounces-116135-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id qB/2Lp/3RmobgAsAu9opvQ
	(envelope-from <linux-arm-msm+bounces-116135-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 03 Jul 2026 01:43:27 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E96D6FD719
	for <lists+linux-arm-msm@lfdr.de>; Fri, 03 Jul 2026 01:43:27 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b="kC8/VT2M";
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-116135-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-116135-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id A9AF9304A174
	for <lists+linux-arm-msm@lfdr.de>; Thu,  2 Jul 2026 23:42:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 35A123D953D;
	Thu,  2 Jul 2026 23:41:07 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E2693D9532;
	Thu,  2 Jul 2026 23:41:06 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783035667; cv=none; b=A6vLPd2JzdQf1XNU09Zxjf9srMgARqqHJi1TA7huGFDvXUWsgztNf9iliHYPO022cExXVJYupGjJOGHfVZRDFgVwC603eK/BimBSLSRjrwzEuUnyUmCzF6uqIZu0R7buZwKyVoqJnayoAKX/5JEnQDXdWuIxpONg/kHPW4Ln3+Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783035667; c=relaxed/simple;
	bh=aGAxY1FdQYTnz3CDTkY/tX0nlrTTOjnsIV+UNqpjE6s=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=N2dsJjnmD5KvFkkYn/aWiJJ7nubOQTylRLveLlQfnKyQlgcLUjBOdJlGENA0rU4XnLaOvOCbN89XsTjwCZIzs2LssaIDouAFlxCRU5K/2KYos3uLFcsa99v65aGaLgjiFes803HrEQ9tpX+Jwm44e+m7WE9KrZffDEyoq+LGCpc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kC8/VT2M; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 54CA21F00A3D;
	Thu,  2 Jul 2026 23:41:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783035665;
	bh=rDkA+ndU7z77XDHB+OxSF0A3MJ+FBONElwBRBczNxAc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=kC8/VT2MyZKzd9iM1DlZf9h6Op2JTYEFdip0IZSGMNzMZv0MNZIiGdjABqCeLikzs
	 0HOMg4A09mTiRyjm+8magUr3Np1Mz4Jsj4O1EcZ8q/cuSRFbqOX0iZ8lOuDBN+e70g
	 exCR21dDyyplwBexficArtv+fi1COT1uxyQ0HjyRwpMDti24HVXoRLNRfxWqBs6zUr
	 u4epYEXtmktu6+NAtejJ0WzE2WZiBRtlFkSWIcfhe5WiGc9kv78UVqxHucPXHyz7MP
	 YlojzlFcjFcizZG55YsIF4wK/fVwhNxJL5PpjPx1XzQqTG+aR+NNz0TQ+YqXeYw7v/
	 bjMbor+grpBwQ==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Mahadevan P <mahadevan.p@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: qcom: qcs6490-rb3gen2: Enable 4-lane DisplayPort Alt Mode
Date: Thu,  2 Jul 2026 18:40:40 -0500
Message-ID: <178303563661.359079.9150820789126381547.b4-ty@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260420-kodiak_4k-v1-1-83dfc66b8f06@oss.qualcomm.com>
References: <20260420-kodiak_4k-v1-1-83dfc66b8f06@oss.qualcomm.com>
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
	TAGGED_FROM(0.00)[bounces-116135-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:mahadevan.p@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
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
X-Rspamd-Queue-Id: 6E96D6FD719


On Mon, 20 Apr 2026 15:30:02 +0530, Mahadevan P wrote:
> Add the mode-switch property to the QMP combo PHY so that mode-switch
> events are routed to it, allowing the PHY to enter DisplayPort Alternate
> Mode. Expand the DP data-lanes assignment from two to four lanes to make
> use of the full link bandwidth available in this configuration.
> 
> 

Applied, thanks!

[1/1] arm64: dts: qcom: qcs6490-rb3gen2: Enable 4-lane DisplayPort Alt Mode
      commit: d5e3237dafb91c87e0204decddd22e6378b32769

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

