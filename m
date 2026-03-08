Return-Path: <linux-arm-msm+bounces-96048-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IE7DHnFlrWlp2QEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-96048-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sun, 08 Mar 2026 13:02:57 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 02E2523019F
	for <lists+linux-arm-msm@lfdr.de>; Sun, 08 Mar 2026 13:02:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id F382C30825C2
	for <lists+linux-arm-msm@lfdr.de>; Sun,  8 Mar 2026 11:52:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 44D9C321F5F;
	Sun,  8 Mar 2026 11:52:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b="ayIyF9bm"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-06.mail-europe.com (mail-06.mail-europe.com [85.9.210.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1739306B11;
	Sun,  8 Mar 2026 11:52:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=85.9.210.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772970745; cv=none; b=oZBEBC61sZk1S/m6qd7QivwDvaHVYmjHAg+gcCe8BjZ7tGn1bODCwZPax8ekPc4b44X5wmbpAUb2cBi2VvyVb9FJ1w6FEUT/e137vgZmfq41Lm78GMqsIbQr0ZB3hj6uDhB+WfRe8EKlXvefPy+nIAkmozUTR2jsxEHmEYKtD4k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772970745; c=relaxed/simple;
	bh=itefZKbk9DIeIY29bgUp/9OpWv9UnV4si0vIARTZ5m8=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=aZFOA3Ts+/8mxEAtm0GD/gA/VJ9HeHcb4hwxSn+SqwJ6jOFYkkJghrQxfoxYpilwROIO7mN8EKV/23UlI3qEoHyFHmBCjUSgROLgeVTAUu/5tknOCFhOys39WMN6d6R2nZhLIVmNyNIONpeXzOjK4Bij3yh7uR1PlrkpymHllck=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me; spf=pass smtp.mailfrom=pm.me; dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b=ayIyF9bm; arc=none smtp.client-ip=85.9.210.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pm.me
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pm.me;
	s=protonmail3; t=1772970733; x=1773229933;
	bh=deOqS1v+V7VkWFrWEWsq7ObbQ1Jg2bAGdP/XlHX87yM=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=ayIyF9bm1eH+omWtJHdHQBSFtIOPnD1kEbttMKj2Bh5e8Hn8NFfRUuTDJwpNG1KGq
	 gO55wzquActNuIzjGhxJttFN8CaUvgECUxuvTscagtJ4jgIzqkQP0LNbwRfpZPbsBA
	 nPWxvJMR57DmM0sjAtkPAWbW0Nx8SCmEchGvVoCNcebXEGmub1qF1QUYn2zH9j7a14
	 SoSlvt5BR0ycSpgv1oAPUiY9SF33yzO6MIH2AwJLKhtDa31Zor2PVBFcOrgj2GbR3c
	 akDW9ZDWM3KAvsp+uGDhPItrvQKt8IeFINpuLA45hDu19wdRLEqDogWcI2G3jLOVR8
	 zGXrTmEfffseQ==
Date: Sun, 08 Mar 2026 11:52:07 +0000
To: Krzysztof Kozlowski <krzk@kernel.org>
From: Alexander Koskovich <AKoskovich@pm.me>
Cc: Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: qcom: sm8250: Add label for reserved-memory node
Message-ID: <yyLvPClplHmyd72RJgOMXVLx_z6GT8sDZP8FyzlHMV7MrCm26twtNmxebCmLwusqGABJQTrIIAe-AAwAW3uaIQ8Rw5TId1C4v5reyj71nmU=@pm.me>
In-Reply-To: <2b260d55-71cd-442f-bf9f-a9771a2765c7@kernel.org>
References: <20260308-sm8250-reserved-mem-v1-1-889eca3c11ca@pm.me> <2b260d55-71cd-442f-bf9f-a9771a2765c7@kernel.org>
Feedback-ID: 37836894:user:proton
X-Pm-Message-ID: aa3b8ca56e43e07eaa60d7cb891dc38ad227fa09
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Queue-Id: 02E2523019F
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[pm.me,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[pm.me:s=protonmail3];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[pm.me:+];
	RCVD_COUNT_THREE(0.00)[3];
	TAGGED_FROM(0.00)[bounces-96048-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[AKoskovich@pm.me,linux-arm-msm@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	NEURAL_HAM(-0.00)[-0.930];
	RCPT_COUNT_SEVEN(0.00)[9];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[]
X-Rspamd-Action: no action

On Sunday, March 8th, 2026 at 4:46 AM, Krzysztof Kozlowski <krzk@kernel.org=
> wrote:

> There is no user for this, so change is pointless. labels do not exist
> in DTBs, so drop the entire patch or provide here - in the same commit -
> proper user.

Want to submit the ROG 3 in a follow up change but was trying to get all de=
pendencies for it merged beforehand.

Should I just upload the devicetree and link to relevant patches?

>=20
> Best regards,
> Krzysztof
>=20
> 

