Return-Path: <linux-arm-msm+bounces-116906-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id ryz8AyzfS2o8bwEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-116906-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 06 Jul 2026 19:00:28 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 605947139F2
	for <lists+linux-arm-msm@lfdr.de>; Mon, 06 Jul 2026 19:00:27 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=proton.me header.s=protonmail header.b=VipuLJ4u;
	dmarc=pass (policy=quarantine) header.from=proton.me;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-116906-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-116906-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id EF2BD167EC3
	for <lists+linux-arm-msm@lfdr.de>; Mon,  6 Jul 2026 14:45:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 27E223F825B;
	Mon,  6 Jul 2026 14:45:10 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-24418.protonmail.ch (mail-24418.protonmail.ch [109.224.244.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 273C3225775;
	Mon,  6 Jul 2026 14:45:04 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783349110; cv=none; b=C38/wEIxo5NiKX1VMjlkI5rTET9mg6cnc4fwLRuujiRoCJOKtcRGLMRToj/dMh8E4qNPOvBJY8VoK9uygN+tGhWC7WN+X2iBNzjshi1FfP4sroMEMNscC94txZs5hBJYQlyCzFWupGxTl1wzGHEIU+QjzfotkamQy/IvoWX09Fo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783349110; c=relaxed/simple;
	bh=AsCqUSepLV1EVCdAVb1gjnK16IGOCWPNy8kXiha5vOI=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=SfFogNiTb29OiIo3XOxW15tm0G5iMSroHIz7guQosTavvIlxTeC7T6XFeI5ntHB8rfst3Q82TKmK//e1WknE0gYRe5PUmqHAL5AaN7ZUMRo2C/9uKnhqMzmR7x7nrWvsmt1Fz4Ai2Cy21WQWaTc8ckdx9vY7nDpEHN4Xnyde/vM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me; spf=pass smtp.mailfrom=proton.me; dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b=VipuLJ4u; arc=none smtp.client-ip=109.224.244.18
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1783349097; x=1783608297;
	bh=AsCqUSepLV1EVCdAVb1gjnK16IGOCWPNy8kXiha5vOI=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=VipuLJ4un5PyrPcU0KPcGiK0xJEfiUV3xhrpBqr6mg8Mps1BbtBjxAM5646uVOKIy
	 SlksiiSCQ4zT91kZrt2NMczhh5luxT2AaTiVzcPgJFBMOQkWgrhjcTPhaVxRzqJAuX
	 iF/4etLGMFunrq4FAQ5Dq13xGej6umdPTOu+JTsxCWybEDAk/+Vl+3gkCr/4gQtmqD
	 MY4lCSXXMGSjQgsHN+hWWv1d7NbqwLMzz0bJw+JnB+eSGjRfgt1aCO0qX9GMDWITnT
	 qC5d5gzcCEqZL+J3mqXcDsGcx2iqvZgwEMJiTm3gWploRJZijlDPERGrnjggRphVZS
	 /tpVlyzwY0cLQ==
Date: Mon, 06 Jul 2026 14:44:51 +0000
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, Bjorn Andersson <andersson@kernel.org>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>, Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Rob Clark <robin.clark@oss.qualcomm.com>, Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>, "Joerg Roedel (AMD)" <joro@8bytes.org>, Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>, Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
From: Esteban Urrutia <esteuwu@proton.me>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, iommu@lists.linux.dev, linux-arm-kernel@lists.infradead.org, linux-phy@lists.infradead.org
Subject: Re: [PATCH 7/8] phy: qcom: qmp-combo: Correct pre-emphasis table for QMP v4 DP PHYs
Message-ID: <9a203e5e-5d16-400d-a507-8b68df8eb017@proton.me>
In-Reply-To: <4635a665-f605-4647-810d-c9d83a271a86@oss.qualcomm.com>
References: <20260622-sm8450-qol-v1-0-37e2ee8df9da@proton.me> <20260622-sm8450-qol-v1-7-37e2ee8df9da@proton.me> <4635a665-f605-4647-810d-c9d83a271a86@oss.qualcomm.com>
Feedback-ID: 147889766:user:proton
X-Pm-Message-ID: 4d9a7c56b233fd2d39549ef51db60aa12ffaa5e3
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[proton.me,quarantine];
	R_DKIM_ALLOW(-0.20)[proton.me:s=protonmail];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-116906-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:konrad.dybcio@oss.qualcomm.com,m:andersson@kernel.org,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:bmasney@redhat.com,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:robin.clark@oss.qualcomm.com,m:will@kernel.org,m:robin.murphy@arm.com,m:joro@8bytes.org,m:vkoul@kernel.org,m:neil.armstrong@linaro.org,m:dmitry.baryshkov@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:linux-clk@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:devicetree@vger.kernel.org,m:iommu@lists.linux.dev,m:linux-arm-kernel@lists.infradead.org,m:linux-phy@lists.infradead.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[esteuwu@proton.me,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[23];
	RCVD_COUNT_THREE(0.00)[3];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[esteuwu@proton.me,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[proton.me:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[proton.me:from_mime,proton.me:dkim,proton.me:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 605947139F2

On 6/23/26 7:36 AM, Konrad Dybcio wrote:
> It seems like 8350/8450 should be using what this driver calls
> v5 tables, with this fixup:
Any updates on this?

Regards,
Esteban


