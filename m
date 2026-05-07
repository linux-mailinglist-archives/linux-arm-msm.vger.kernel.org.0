Return-Path: <linux-arm-msm+bounces-106536-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OPltJAL9/GmxVwAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-106536-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 07 May 2026 22:58:42 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 317C24EF0CB
	for <lists+linux-arm-msm@lfdr.de>; Thu, 07 May 2026 22:58:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7610A30063A9
	for <lists+linux-arm-msm@lfdr.de>; Thu,  7 May 2026 20:54:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1D083332906;
	Thu,  7 May 2026 20:54:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=packett.cool header.i=@packett.cool header.b="QN6Q+Vye"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from out-173.mta0.migadu.com (out-173.mta0.migadu.com [91.218.175.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E2BD2F532F
	for <linux-arm-msm@vger.kernel.org>; Thu,  7 May 2026 20:54:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778187244; cv=none; b=TEEf92K2J3ttyhN3FLCAQjcO4Tb1A0A1f0owdPJ+aUnFju4bIcMhKB4heUBdLCtYVAnNrzJoIzhX8GLdpJj30QNFvI7Caof9Aymj8TO1rBlgNEbDEODaYAi4jakYWtgumAfnIEvTRWDDt20De54GVlNZbr69ai0TchGTkLATQpI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778187244; c=relaxed/simple;
	bh=9vUg0xkiSDkepEoN8IDASAjds+I8c1f9uvf6Obg1TMM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=KU7vNK8g8nINrAyWBku1n84UiNmCKFPQh12zJVioYkv2/BXpEEnJfBDiVLC1ZHQvBt5jePK14NnhuTMdtSFte4gPtpqa1mWwRuDGtA5d1jnenp9MNuBF4CwWzOS9AcfZ0EV9GAvMxgL1sGUCBSqskYWlt1XgzEEy+CDjC66+l28=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=packett.cool; spf=pass smtp.mailfrom=packett.cool; dkim=pass (2048-bit key) header.d=packett.cool header.i=@packett.cool header.b=QN6Q+Vye; arc=none smtp.client-ip=91.218.175.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=packett.cool
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=packett.cool
Message-ID: <68f52289-eb4e-4f01-a705-a0f490c08594@packett.cool>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=packett.cool;
	s=key1; t=1778187230;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=6k+wfspzFKv3Ve/IAsYT1QG5E45d6fJFzLS1REhNuj0=;
	b=QN6Q+VyeR9Ug7qTHsaWRnn2Z4rpxVKz/eOGs4G66Weqcf65haee64UAIQ4zdhXGPtRbIUU
	dv0/QsdrEhJYzrwK4eBSKhhIrgLR0tOuDeCi/i/NN95Sib4pksKgEmyss3NtYr4c8JKAqq
	cA7wGyrIlr/MQtbb+YdvHokKPRuEmhNFQc5IhyNt8pc3iFAuCoh8p4G54VYkfAYoFzc/cm
	jayyTIy1QOJouGaxHNcLFmtCW4evQ1LgU3xcAWVD4fPow2DQ8zMeYx10O4gUCRKQ3iAPYa
	9wNJ4aTo0GKOtTi8ucnePrUZzGEMRbXykWybAjhwsnKVV7jBCPt0LYRwFZwZEA==
Date: Thu, 7 May 2026 17:53:34 -0300
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: (subset) [PATCH v2 1/2] dt-bindings: arm: qcom: Add SM7325
 Motorola Edge 30 (dubai)
To: Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260403054417.167917-1-val@packett.cool>
 <177818606041.73000.17657106462085102010.b4-ty@kernel.org>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Val Packett <val@packett.cool>
In-Reply-To: <177818606041.73000.17657106462085102010.b4-ty@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT
X-Rspamd-Queue-Id: 317C24EF0CB
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[packett.cool,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[packett.cool:s=key1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-106536-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	DKIM_TRACE(0.00)[packett.cool:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[val@packett.cool,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCPT_COUNT_SEVEN(0.00)[11];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[]
X-Rspamd-Action: no action


On 5/7/26 5:34 PM, Bjorn Andersson wrote:
> On Fri, 03 Apr 2026 02:33:08 -0300, Val Packett wrote:
>> Motorola Edge 30 (motorola,dubai) is a smartphone based on the
>> SM7325 SoC.
> Applied, thanks!
>
> [1/2] dt-bindings: arm: qcom: Add SM7325 Motorola Edge 30 (dubai)
>        commit: 839d20f9f3da93f65c000187ee68387598bdecb5
> [2/2] arm64: dts: qcom: Add Motorola Edge 30 (dubai) DTS
>        commit: dd1316efdbc5a998b901b1c5f27da73d45060795

the.. v2?? but I've sent the v3 yesterday :(

~val


