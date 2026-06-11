Return-Path: <linux-arm-msm+bounces-112775-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 9Eg4EeXVKmpOxwMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-112775-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Jun 2026 17:36:05 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id B7DFB6731E2
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Jun 2026 17:36:04 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b="Pq35oQ/N";
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-112775-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-112775-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 206533134FE1
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Jun 2026 15:35:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D774F411688;
	Thu, 11 Jun 2026 15:35:31 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 529C7221721;
	Thu, 11 Jun 2026 15:35:29 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781192131; cv=none; b=KTEIheJO09YQGKv5VxSkUnCbbigzSBJgkXwuVtMxcduo9hV2FpjaNZKxTUqLUQIE6pabviAcd/lEklTCMMPSEDuH5heLmRyiWS5I61Y7LynXjX2RzJV293QFxCIw5MpNCMVqJR5zz1GDq6fuEI4D3aL/pqWencMyn006rYGV4jc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781192131; c=relaxed/simple;
	bh=XEcJQN8qffhtnGuiZRjbzT9oYCBQ3g3mFvw8QYWTv+w=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=cw4GzeYr/TTZ2izD3zFtRCNSoQHHRjA+UB0irlaraPdraP1yaBfyTDr6NGjy4RMslC1AfbQG53hEI6EON4M9DquVuiqDtYffjqpS3ndp7UOC0s5S7c6C8XGcTx/SUxF+jcXstHVcjO2OQ7/4pjFDMMBGcQwACgME1vg2mdwvPjA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Pq35oQ/N; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9402A1F00893;
	Thu, 11 Jun 2026 15:35:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781192128;
	bh=xnJQlXZOWC+jOjrcQkFBjbeYmjtNcm9aHaBpBxcxKqg=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=Pq35oQ/NiG5weBjn9iQBl6YVhoixe+hd107D/ItX3lNTEu5ROi3tDqzjFw99ftlaO
	 RxiLbQE1R99E/K0EfmPCHw0ZUgRRPGInQJzsKOLasSqEHH5wQtHZoUPyXR8twWBJlZ
	 Jn5JyKxMvFLJ6JCLvh4ebjf+mgmlfMFMM/VHbCpNi8/ap/O0bgWBTgjn/ySCfvKd9M
	 d4PDTBszdpfLTOgj+nerbmhBLg6ZejRizNrKCgdxAO/4Nz1t7x+CIMdnFRTikqBjIX
	 ChRCWYICowIRcUKqeVO+2msjyVJ88dkcxxmb8cQp84A1EtI9lEaBEvN+9B2uD1wGIO
	 kFiyxF9AnymqA==
From: Vinod Koul <vkoul@kernel.org>
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzk@kernel.org>, 
 YijieYang <yijie.yang@oss.qualcomm.com>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260610-topic-purwa_phy_shutup_warning-v2-1-951c1fbfe9b2@oss.qualcomm.com>
References: <20260610-topic-purwa_phy_shutup_warning-v2-1-951c1fbfe9b2@oss.qualcomm.com>
Subject: Re: [PATCH v2] dt-bindings: phy: sc8280xp-qmp-pcie: Disallow
 bifurcation register on Purwa
Message-Id: <178119212522.568088.5851258082110691034.b4-ty@kernel.org>
Date: Thu, 11 Jun 2026 21:05:25 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13.0
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.66 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-112775-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:neil.armstrong@linaro.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:konradybcio@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-phy@lists.infradead.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:yijie.yang@oss.qualcomm.com,m:konrad.dybcio@oss.qualcomm.com,m:conor@kernel.org,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER(0.00)[vkoul@kernel.org,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[12];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[vkoul@kernel.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: B7DFB6731E2


On Wed, 10 Jun 2026 11:45:12 +0200, Konrad Dybcio wrote:
> Neither of the two Gen4x4 PHYs found on Purwa supports bifurcation.
> The PHY is however physically laid out as if it were to, since there
> are two separate ports (A/B).
> 
> Split out a new if-then block to un-require the bifurcation register
> handle to squash this warning:
> 
> [...]

Applied, thanks!

[1/1] dt-bindings: phy: sc8280xp-qmp-pcie: Disallow bifurcation register on Purwa
      commit: b3ee497970c63cea37976aeaa84bac39611fe0eb

Best regards,
-- 
~Vinod



