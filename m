Return-Path: <linux-arm-msm+bounces-102536-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EBNzHv/w12n6UwgAu9opvQ
	(envelope-from <linux-arm-msm+bounces-102536-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 09 Apr 2026 20:33:35 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E460E3CEB51
	for <lists+linux-arm-msm@lfdr.de>; Thu, 09 Apr 2026 20:33:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id B6D7F300C9A9
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Apr 2026 18:33:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4A586241695;
	Thu,  9 Apr 2026 18:33:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxsw.ie header.i=@nxsw.ie header.b="WvFCyP2z"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-106105.protonmail.ch (mail-106105.protonmail.ch [79.135.106.105])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A64DF9443
	for <linux-arm-msm@vger.kernel.org>; Thu,  9 Apr 2026 18:33:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=79.135.106.105
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775759611; cv=none; b=pLTlfIE7wZpFN68gK9OlYGpVUheCXflRVqWIBpRICdlDtyp2OtzB+d+dODoB4uEs7F0MpQLDjgzVhj4jXsClzauLKLLvYnDEx7GYqDky+qXWQwmV0F+rENpGXQrui+iEayFWnDA3Zn1BmCpDPlZG3LBcG2gmuYNjQfscHJ8XYGk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775759611; c=relaxed/simple;
	bh=h+jIv/VR/qg/OkeoRAmJZWO/7TJ5eC4zehTmarVjkRk=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=OWAloJ4DbE4TBSw6UDekkV096BvkjfmJizLnxPJXPdSAUGilIuHAcAN2vhVg6Qy4KFe168bn8YgLeIzlCSSXeh/Qdupcg7tiUHGZnqv0wAwaf3eoCCuP17KJjQY6lGly1I7qIKgubkEaGJi6aOKFMpREUn8HD23d1ouWhg3MeZE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=nxsw.ie; spf=pass smtp.mailfrom=nxsw.ie; dkim=pass (2048-bit key) header.d=nxsw.ie header.i=@nxsw.ie header.b=WvFCyP2z; arc=none smtp.client-ip=79.135.106.105
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=nxsw.ie
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxsw.ie
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxsw.ie;
	s=protonmail; t=1775759596; x=1776018796;
	bh=1dCRk6aG+bHFM1iAlVcJctJP9zr01ilEISWMWsZ2g4I=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=WvFCyP2zZNizTaaPcKKMVhrApyAviH1GJfF9SOl4YV7Ngi/yfJCgcs1tgq4a1BEPZ
	 S4h46AlX5puJo4qJg5FnykEDj+kaz3j5m9SW9QQPl9wwGC5g9ffAmMqIRP3qpcgArk
	 89w8gmcdL+GILe55PDfbz6S9ToN0P18dgdJPwlITZR3rdrXZ/rfS2QadN/Zdjds2/D
	 icBEmgFUL+clVaDPq546y7vVdbja7RgNE2RLnKvnjDj6IHPtQgWrZrE2BSoNskwMFv
	 ETsNUXGdg/a+XIJpFn0QUOtu6RrsBbVfz1WpQBle7dD09LP2pFaIf21CxqeY/KR6GL
	 daazVynr0D7hQ==
Date: Thu, 09 Apr 2026 18:33:13 +0000
To: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, Bjorn Andersson <andersson@kernel.org>
From: Bryan O'Donoghue <bod.linux@nxsw.ie>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>, Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org
Subject: Re: [PATCH 2/2] clk: qcom: camcc: Make Titan GDSC a power domain of clock controller
Message-ID: <70042f4f-c4ef-4185-b0c6-397d27164a32@nxsw.ie>
In-Reply-To: <20260331140142.892579-3-vladimir.zapolskiy@linaro.org>
References: <20260331140142.892579-1-vladimir.zapolskiy@linaro.org> <20260331140142.892579-3-vladimir.zapolskiy@linaro.org>
Feedback-ID: 136405006:user:proton
X-Pm-Message-ID: 0809d2fc0d58a5fb56662dd71162decc07573094
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[nxsw.ie,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[nxsw.ie:s=protonmail];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-102536-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	DKIM_TRACE(0.00)[nxsw.ie:+];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bod.linux@nxsw.ie,linux-arm-msm@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[8];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: E460E3CEB51
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 31/03/2026 15:01, Vladimir Zapolskiy wrote:
> +=09.cc_gdsc =3D &cam_cc_titan_top_gdsc,

So.

You can represent this in one of two ways.

- By making the GDSC a depends of the sensor
   Obviously a PITA to keep doing.

- By making the link from CAMCC to the GDSC
   The question is, is it valid for CAMCC or indeed
   any clock controller to be both a provider and
   a consumer of the same power-domain.

The other question I have is; in this setup you have
does the GDSC you've made a link to switch on/off as
it should ? Have you checked ?

I think you can make the argument both ways.

- The sensor should consume the PD provided by the
   controller - like CAMSS and CCI does.

or

- Lets optimise the representation of the dependencies
   so that the consumers don't need to know about it.

The self-referential nature of the change seems a bit odd to me but, at=20
the same time, I find the over-representation of power dependencies like=20
pointless spinning of wheels too...

---
bod



