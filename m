Return-Path: <linux-arm-msm+bounces-102065-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QAoXHB6s1GmKwQcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-102065-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 07 Apr 2026 09:02:54 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D77C3AA99D
	for <lists+linux-arm-msm@lfdr.de>; Tue, 07 Apr 2026 09:02:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 14E95300A507
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Apr 2026 07:02:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 08384391E70;
	Tue,  7 Apr 2026 07:02:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Aj5esGEa"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9566391E42
	for <linux-arm-msm@vger.kernel.org>; Tue,  7 Apr 2026 07:02:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775545371; cv=none; b=Q7H0QzlfImXFT2LIrZjfhG8yXPCNkKYZIBFIoWIvbesDTFK3HdoiW/LEc/diUpi/PImHnp70v371GicfYi4vhBYrecNNhe3GxwEWVb0jILm8vGqGtdUlVNMv5ja5ofum3HdNpoAo0FMyQ21Fu/K0H1ZnzJeMzIxTxVNE9LNrYi8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775545371; c=relaxed/simple;
	bh=LUMUfngw5BmR4+GVbeaTttcxyJo2/uhE4b2TZgq/zj8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=h6XoM5UN25wc+Nrgz+fRLGcU6B3s/Uex73vBDvQXhaleRhd6+e3dxL/bwVfh0gQfLpHYLY0cc0ypWd6nZAl2B2n0Wng9bFIJ+pOMADT0967krAG6whp6sI1FPG+f8zJI6KA+tewv5lYkJnL1LAAHLWgSy9Qb3E3gi3pKEKDRVms=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Aj5esGEa; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8EA4AC2BCAF
	for <linux-arm-msm@vger.kernel.org>; Tue,  7 Apr 2026 07:02:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775545371;
	bh=LUMUfngw5BmR4+GVbeaTttcxyJo2/uhE4b2TZgq/zj8=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=Aj5esGEaJglc37W1ozidj6mAqq9Jcw1/T0LsYfZFMGjNlNAHMIdF0bM6QB/DtkUft
	 4IX/wtgeIownk0iIlX11Ddb/frnjbgjLROp0cghf95l0exOuV/iNbm5gnpWWChyW2z
	 dHe/UTuWk7tl0zyVNt9fbwO5aFQtcgTmAxrjM9L6gz+b/poQohZkKeYF1dLI5uPCzw
	 opicr56heMZNbC49J3Q83WGepCqBRBgju/ruzFg7xSpL5IRGXxPZcR7wke18ex/UUk
	 n+jGLQ936GZEZbj8Kzym7UkIQAJwrQBN4sjSnrPJ4ywVH/XRELCtawnA9lSwKZTNda
	 YBAUGWg/f+m1g==
Received: by mail-yx1-f45.google.com with SMTP id 956f58d0204a3-6501c4857b2so2296309d50.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 07 Apr 2026 00:02:51 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVm/W9gwGR19vylf/+jrcOMfio7fLqAmzrLXRv8DokdkRcIkBv4eV+bITgRVrNm7lEh/AoGUO9k+lLfYudH@vger.kernel.org
X-Gm-Message-State: AOJu0Yy2xKqhVbvbEMEUODMluz3jX4SW5kedmK63rJUgCLhWQgl4OZsj
	R8h6CphShFMMSp5XDaWKDicktPnkKkhyNxGa2csHluon+g30Otvy9cS7u8SwuEUXp7E9Bn3cjSR
	wL5OWummkrha0NDkdpIOV0AudN0EErzM=
X-Received: by 2002:a05:690e:138a:b0:650:4a79:f3db with SMTP id
 956f58d0204a3-6504a79fcf0mr14778469d50.51.1775545370947; Tue, 07 Apr 2026
 00:02:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260331200658.1306-1-mailingradian@gmail.com>
In-Reply-To: <20260331200658.1306-1-mailingradian@gmail.com>
From: Linus Walleij <linusw@kernel.org>
Date: Tue, 7 Apr 2026 09:02:39 +0200
X-Gmail-Original-Message-ID: <CAD++jL=0LvdaYVTrDGiCiPE=qZWzBpH5ZCNH9N28wBLOy-981A@mail.gmail.com>
X-Gm-Features: AQROBzDlAy5pLG3p0JqXUGeo80M2oiwNZ2fWncgiphyWDpp5mb6TpMvRT7vecLA
Message-ID: <CAD++jL=0LvdaYVTrDGiCiPE=qZWzBpH5ZCNH9N28wBLOy-981A@mail.gmail.com>
Subject: Re: [PATCH v5 0/4] SDM670 LPASS LPI pin controller support
To: Richard Acayan <mailingradian@gmail.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Srinivas Kandagatla <srini@kernel.org>, linux-arm-msm@vger.kernel.org, 
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-102065-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linusw@kernel.org,linux-arm-msm@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 1D77C3AA99D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, Mar 31, 2026 at 10:06=E2=80=AFPM Richard Acayan <mailingradian@gmai=
l.com> wrote:

> Richard Acayan (4):
>   dt-bindings: qcom: lpass-lpi-common: add reserved GPIOs property
>   dt-bindings: pinctrl: qcom: Add SDM670 LPASS LPI pinctrl
>   pinctrl: qcom: add sdm670 lpi tlmm

These three patches applied to the pinctrl tree for v7.1

>   arm64: dts: qcom: sdm670: add lpi pinctrl

Please funnel this patch through the SoC tree!

Yours,
Linus Walleij

