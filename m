Return-Path: <linux-arm-msm+bounces-114347-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id a8RCBxHbO2oHeQgAu9opvQ
	(envelope-from <linux-arm-msm+bounces-114347-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Jun 2026 15:26:41 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D1C46BE972
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Jun 2026 15:26:40 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=proton.me header.s=protonmail header.b="f2sejHT/";
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-114347-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-114347-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=proton.me;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7884E302AE1C
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Jun 2026 13:26:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 77A083B2FFF;
	Wed, 24 Jun 2026 13:26:26 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-24417.protonmail.ch (mail-24417.protonmail.ch [109.224.244.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35D0A38B7D6
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Jun 2026 13:26:21 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782307586; cv=none; b=dNBfCvmWgy1ztQx9ux42GzIKuNU81GI1e6GeFjfsr7EmHfbkkkKtPO35avAPbN9EsHlx0ZqfEZyat7rsfBsoeMYfx3YpJ18S+lF9DYVbOlgmVtiL7ErhQaVZJ90q0CZmObZrlj0eJ/74Xt3kYrziL/QnfBcTQtzdXh3fYJoo1KU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782307586; c=relaxed/simple;
	bh=wIb9R7eOTXQ3L9z9i9MDpz2gfdRkQpGrhD1+tSfI5os=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=WqIdq6ySw5X3wG2NRFDgG9qe0P7nAtFu87sf/QXRd2jotTMElCC9JrZ2iVsh8VYGaoRj8W+MwZd9i/XERybI2+/Rz9zEQmbvERp53RwwnYHwLHjr2+1BDKXZ1KRAPXgtVNCZmVZkfU7ewkxzEInEzLckbioaLahRXm0UvdVGlIY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me; spf=pass smtp.mailfrom=proton.me; dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b=f2sejHT/; arc=none smtp.client-ip=109.224.244.17
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1782307573; x=1782566773;
	bh=wIb9R7eOTXQ3L9z9i9MDpz2gfdRkQpGrhD1+tSfI5os=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=f2sejHT/WrS3zPqG/Iq9XEFBDxWynyuPFUJ25mgIiAxiwbD/aNM7z56IwOvNTa0nR
	 Y5g7F63y/jN6cgwYlftaw2XTy2sJhj/G17X7juo32bZ2b5lsFIEtb6pe0pgIuydBCA
	 89xsMu9F0phcow/MV64e2lbCs9A6j+oLpTmTS2sJjIesL41+Q1UshtSkA+6b+gCbFP
	 rwlV6PkYZm967+4L1H7Yuyz3RhO0RfESjr0HZPbSw42AuhPFg65LEKmjtSM8i/RbC4
	 YxM7sW1UEuR9SLsSn41NkWaQhm1uzFzZivQsFUKEbdMeeHrSR8y44skr1uq2awYt3S
	 yZC0lHiUXb/OQ==
Date: Wed, 24 Jun 2026 13:26:06 +0000
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, Bjorn Andersson <andersson@kernel.org>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>, Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Rob Clark <robin.clark@oss.qualcomm.com>, Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>, "Joerg Roedel (AMD)" <joro@8bytes.org>, Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>
From: Esteban Urrutia <esteuwu@proton.me>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, iommu@lists.linux.dev, linux-arm-kernel@lists.infradead.org, linux-phy@lists.infradead.org
Subject: Re: [PATCH 2/8] arm64: dts: qcom: sm8450: Remove unneeded reserved memory nodes
Message-ID: <b3541802-3035-40ee-8327-a65bd5d2dfee@proton.me>
In-Reply-To: <6123a923-21dd-4f69-9ac5-02165963027c@oss.qualcomm.com>
References: <20260622-sm8450-qol-v1-0-37e2ee8df9da@proton.me> <20260622-sm8450-qol-v1-2-37e2ee8df9da@proton.me> <e1e492ab-884e-442b-8410-cc100c54fd5f@oss.qualcomm.com> <6123a923-21dd-4f69-9ac5-02165963027c@oss.qualcomm.com>
Feedback-ID: 147889766:user:proton
X-Pm-Message-ID: df186333b5a853f68028d7d86cfc27a4db0a8a20
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
	TAGGED_FROM(0.00)[bounces-114347-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:konrad.dybcio@oss.qualcomm.com,m:andersson@kernel.org,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:bmasney@redhat.com,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:robin.clark@oss.qualcomm.com,m:will@kernel.org,m:robin.murphy@arm.com,m:joro@8bytes.org,m:vkoul@kernel.org,m:neil.armstrong@linaro.org,m:linux-arm-msm@vger.kernel.org,m:linux-clk@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:devicetree@vger.kernel.org,m:iommu@lists.linux.dev,m:linux-arm-kernel@lists.infradead.org,m:linux-phy@lists.infradead.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[esteuwu@proton.me,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[22];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,vger.kernel.org:from_smtp,proton.me:dkim,proton.me:mid,proton.me:from_mime]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 5D1C46BE972



On 6/23/26 7:03 AM, Konrad Dybcio wrote:
>> This is mentioned in the memory map description, but is not part
>> of it.
>>
>> I booted up a 8450 HDK and it doesn't even have MTE, so it's
>> probably valid
>=20
> i.e. it doesn't report MTE to Linux. I don't know if it's Gunyah
> trapping it.
Then, should device trees delete these memory regions on a case-by-case
basis, or be left as is?

Regards,
Esteban


