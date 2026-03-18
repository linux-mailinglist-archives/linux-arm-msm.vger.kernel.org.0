Return-Path: <linux-arm-msm+bounces-98513-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uO2RJ+64umlWawIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-98513-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Mar 2026 15:38:38 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 41FC02BD4BE
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Mar 2026 15:38:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 2ADC03046215
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Mar 2026 14:35:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5FFE93DEAE0;
	Wed, 18 Mar 2026 14:34:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Tjcsd4RQ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C0DC3DEAD4;
	Wed, 18 Mar 2026 14:34:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773844482; cv=none; b=sD6JlgvT8OAYHAf93mb0H56oowCP5XsBVxHLdQ7akQsn19oNKKycNA6RmfXyT6XmpAblz7JcxveN0xe8tiiivP2wbjaP8KLweRD8mGBzTjNhF8Vtll4htJcBqiULHhigEBIIhSe4Zehdp1dqoplE4O2jeHIiud7FGtp3gYjh7uY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773844482; c=relaxed/simple;
	bh=xtoifRTN1TTM3w+ERGdLox8K2UmKoVQLCW6DXie/wAQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Ygt5+IRFucmQlvrlmw9OyCvianuZtv/g5GRT7/1m33QeNMjsY9dqcbTpB8CphK4uh6BpYBQIb5j1pLGq4dXfNCvsOdIUDEGk1LWH6XKJtxnWCCkeVHtWWgARP0CV9u0FfYWXNlGpBfC0d3FFs1MsRxigWhni6cxRKYHczbkkIGE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Tjcsd4RQ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D0FC5C2BCAF;
	Wed, 18 Mar 2026 14:34:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773844481;
	bh=xtoifRTN1TTM3w+ERGdLox8K2UmKoVQLCW6DXie/wAQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Tjcsd4RQvDGFLBERmnyr0+W/0p/uroNYyJIBOAMXIWL30TD4Z8jx3oOIf7/0KSlZp
	 rC34XfDtJRpx+l4safSvSoZARjTWlV9fSu9YG77oFM8DHwQtIq3UKcnQAypxI6blNc
	 Qy0C86Pei3MbqWVVcmR792KpsRuvyavLEAT/ovlmB0Z09H78mO0EN26uTXZaYGZu6H
	 g4UNABHbSGj5NzVJHe+Pm9U4TzC1n+wdejsyIDeoLSHoD6LvnpaKokZAyyulv3xVNF
	 ombdPijLFoqIhmRCJRCNT1sVoSuKP9OsNUAoAgll8rA+HxrWy/5t+UESDbwBZE6EYO
	 mUIE2lb9lQF8g==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Tobias Heider <tobias.heider@canonical.com>
Cc: =?UTF-8?q?J=C3=A9r=C3=B4me=20de=20Bretagne?= <jerome.debretagne@gmail.com>,
	Dale Whinham <daleyo@gmail.com>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: add missing denali-oled.dtb to Makefile
Date: Wed, 18 Mar 2026 09:34:31 -0500
Message-ID: <177384446632.22424.14837123103284088888.b4-ty@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260226140429.232544-3-tobias.heider@canonical.com>
References: <20260226140429.232544-3-tobias.heider@canonical.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[gmail.com,vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-98513-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andersson@kernel.org,linux-arm-msm@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 41FC02BD4BE
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


On Thu, 26 Feb 2026 15:04:30 +0100, Tobias Heider wrote:
> The device tree was originally added in
> 0d72ccaa1e840b4c8723a929b2febbedcf5f80cd.
> The original patch on the mailing list also added the new device
> tree to the Makefile but that part seems to have been dropped
> (by accident) when it got merged.
> 
> 
> [...]

Applied, thanks!

[1/1] arm64: dts: add missing denali-oled.dtb to Makefile
      commit: 5bfaf79ebe69c4b93b322c3112ec87d746457721

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

