Return-Path: <linux-arm-msm+bounces-96071-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QPnmIA26rWk+6gEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-96071-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sun, 08 Mar 2026 19:03:57 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E6AC6231842
	for <lists+linux-arm-msm@lfdr.de>; Sun, 08 Mar 2026 19:03:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 7702F300DA62
	for <lists+linux-arm-msm@lfdr.de>; Sun,  8 Mar 2026 18:03:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AF9AB31D362;
	Sun,  8 Mar 2026 18:03:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b="nxr2Vru9"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-4316.protonmail.ch (mail-4316.protonmail.ch [185.70.43.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B44F42C86D;
	Sun,  8 Mar 2026 18:03:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.70.43.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772993034; cv=none; b=VQKl/xTWPwpSnQsExWDjUAV94NuDw7j+/z9cYRtj1pz8amEp7J+1um+bHnrUhZsxkPRJxJjKxHcjL10IvxBeEBWIPPVImkTZDjBaINOaFuB7Ts3oVsKlMNEpyuto8W9qQ4L+2KJe3MWrILsUAwcRvjyu0i7VStzc4IHx2sQNj0s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772993034; c=relaxed/simple;
	bh=uYV0qrTRo4nbjoJfT6Y7U1F+OR0Pkvjp/cL0jF9YRro=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=E0Pj+hAo29gGfBbEHVvtCxG2RReVkfEPdARJwG3chAz/ZqSByTopkQXDBQcbwZ1mqFDhR521fRduVPijmwUcUdRnUzxUWeqmDjrV/57//Xq6mvzvWqTqmWIqy47zQCgJAM41vaAGe6Im77e5LrOJko+U1enJVsfz6raQ/cKTZFQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me; spf=pass smtp.mailfrom=pm.me; dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b=nxr2Vru9; arc=none smtp.client-ip=185.70.43.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pm.me
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pm.me;
	s=protonmail3; t=1772993030; x=1773252230;
	bh=uYV0qrTRo4nbjoJfT6Y7U1F+OR0Pkvjp/cL0jF9YRro=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=nxr2Vru9JquMzEm6/dZn0G1/vz2VTAeIZabdR4h2iM3RodYunobqcd/lFMCjS+AGX
	 8RISCDCYeR8qV7DwOHjwVNT/RNH6AK+HpACauvQMyxIL/fDM8wC3rS6Zf1K82N16Qg
	 T9cT1LLByZNpTy9mzPefpK9HYq448Q8+JeQBik00XoS9QxHR89lFyl9NcWWsjRovi2
	 KHTsdoe5DDYhkWV4Oap7OtY8RlLK2hcnhprgTdeNRxyKyEHfRdLMKZ29CfROWnD7sS
	 4P1pFoAo0aOL9VwJEhjukt3NN8lxOdpjAWfGcabzKna07d5otIbFv5g0mvC5pxhTUm
	 h2q0RGDYJAMQQ==
Date: Sun, 08 Mar 2026 18:03:45 +0000
To: Krzysztof Kozlowski <krzk@kernel.org>
From: Alexander Koskovich <AKoskovich@pm.me>
Cc: Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Dmitry Baryshkov <lumag@kernel.org>, Thara Gopinath <thara.gopinath@linaro.org>, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: qcom: sm8250: Add missing CPU7 3.09GHz OPP
Message-ID: <N51k53pJOUTOpQrfJsuk9rZdo_VxhPtCdG1Aj-8uqmoS1Bl7q7FUarMhq5b5sZwAzJrH6SvH5n1KeK7T2mSn3ssMThLiEdmKNfccXata1-U=@pm.me>
In-Reply-To: <cf549a55-0818-4be6-b28f-c90a2dc09a5b@kernel.org>
References: <20260307-sm8250-cpu7-opp-v1-1-435f5f6628a1@pm.me> <cf549a55-0818-4be6-b28f-c90a2dc09a5b@kernel.org>
Feedback-ID: 37836894:user:proton
X-Pm-Message-ID: 04fa153b8a4780b230a9275ef3ba1d7336883fd0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Queue-Id: E6AC6231842
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[pm.me,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[pm.me:s=protonmail3];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-96071-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	DKIM_TRACE(0.00)[pm.me:+];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[AKoskovich@pm.me,linux-arm-msm@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-0.933];
	RCPT_COUNT_SEVEN(0.00)[11];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo]
X-Rspamd-Action: no action

On Sunday, March 8th, 2026 at 4:48 AM, Krzysztof Kozlowski <krzk@kernel.org=
> wrote:

> git grep "ASUS ROG Phone" gives me zero results so this is insufficient
> argument considering you are changing multiple other devices which might
> not support that.

Also I'm not 100% sure that this applies to all SM8250 devices, should I ju=
st fold this into the ROG 3 DTS submission later and put it in the board sp=
ecific DTS? As I can't validate it on any other SM8250.

Thanks,
Alex

