Return-Path: <linux-arm-msm+bounces-104732-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6Dg/NrZc72m3AgEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-104732-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Apr 2026 14:55:18 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 898DD472E8B
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Apr 2026 14:55:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id DBBE4300682F
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Apr 2026 12:55:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 84EE23BA24E;
	Mon, 27 Apr 2026 12:55:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="usmxR9/q"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6152B3BA251
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Apr 2026 12:55:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777294516; cv=none; b=Jo/3b+iPugw8ZJwo+4NwCriQ0P6gAhe2n61Hi6Eh/ndTk8hbrPIZmDP4lCCgENiyriRfJXW0odKKnuDk61U1ZUqxm2SDcaNcRsvLVoPrrcqEbiECSp2XjgEJeqjcz+nYoJcmOiwk6kDgwQJZ0FO4Fp3JwdZmiMI9ptRmy7Piaxc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777294516; c=relaxed/simple;
	bh=MYPDzK6WL7gmukXGZ1ttISrpMiOIPfOfWxa0BiDPH74=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XHU3nJEjTdoF8w7q5LQ0MNrpcjL2rp0QJ4d1UnMlRSbuesG0Cz2PU3Y1X/SMeZt08HUteFUJyIVWpWqF4Z0i7fw9dQlVGxHmFiThs4cPcbIbVzrFtLLw47OqVz0qx8pybo9PqSz3V4t3D2pwAtkY1ULn/PvZQZn05Yr3SveCPZQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=usmxR9/q; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EE7C2C2BCC6
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Apr 2026 12:55:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777294516;
	bh=MYPDzK6WL7gmukXGZ1ttISrpMiOIPfOfWxa0BiDPH74=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=usmxR9/qQoXaPx3mtYGtQPAnB3UFrzDK/qiJcfnj4ynLQ3q0baJrYkx3GagR76Wvq
	 5dEMD/CPb2318RI3aXR829UJM07T8hWtT8y+6kiDFbxyId38bukIz8Htg6/OE5JmN+
	 mUCXJo/eDsOOCk2gwJb4r4wyUYJUv1VpedgVeV2xzodhpDhwGac9kw9qIlCO9FKGan
	 x2fx2DxEEUE/XjAHGyruLiZMXKPSWSneY/XUAryrpWH0j4GBKe+gCDvaEqkbCe3123
	 sm0bgca/Pi0f5wIcXeD1IyBystu/qQLYgseWnUcXMz/fIiNa199IXAe42Em2lVv8Fg
	 Oon6ikEoXUpbw==
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-671ae79e617so13077640a12.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 27 Apr 2026 05:55:15 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ9h8OP2t6tnAKLUU3+MYlxsrg4dXu/Qb9xjdFf7pW3e4U1asNfGHtUiK9n1rnZnHLLAc3pjpDmXhovJetT1@vger.kernel.org
X-Gm-Message-State: AOJu0YwHvPVjGXpfzVwXSQlh7TvL0S9liUJfwDiqS5BRGt5gy8q9cXO2
	OAs++Ks7x3P+rZW0jAGK43AYZd234e1xd59SDi1p3Wuy5CijtEykhlfyZDytBu0F9DjljTsPmLT
	buOHGW2GTT5XDG7hsBuLELj7aqj8NWw==
X-Received: by 2002:a05:6402:e9c:b0:673:f729:c7a1 with SMTP id
 4fb4d7f45d1cf-673f729efcdmr16468604a12.14.1777294514447; Mon, 27 Apr 2026
 05:55:14 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260427011346.230844-1-shengchao.guo@oss.qualcomm.com>
In-Reply-To: <20260427011346.230844-1-shengchao.guo@oss.qualcomm.com>
From: Rob Herring <robh@kernel.org>
Date: Mon, 27 Apr 2026 07:55:02 -0500
X-Gmail-Original-Message-ID: <CAL_JsqKZgymcwkHkrLrimqMPK+picCZ36VO=-nbAjYcZ=nzU=w@mail.gmail.com>
X-Gm-Features: AVHnY4LEddmzSApTkYRtVQL2zO3qxHUiP7N6KHFwZLViMM2a8bmZNrsHWa2qvnw
Message-ID: <CAL_JsqKZgymcwkHkrLrimqMPK+picCZ36VO=-nbAjYcZ=nzU=w@mail.gmail.com>
Subject: Re: [PATCH v2] dt-bindings: firmware: qcom,scm: Document SCM for Nord SoC
To: Shawn Guo <shengchao.guo@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Dmitry Baryshkov <lumag@kernel.org>, 
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>, 
	Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Queue-Id: 898DD472E8B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[kernel.org:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-104732-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[robh@kernel.org,linux-arm-msm@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,qualcomm.com:email]

On Sun, Apr 26, 2026 at 8:14=E2=80=AFPM Shawn Guo
<shengchao.guo@oss.qualcomm.com> wrote:
>
> Document SCM on Qualcomm Nord SoC which is compatible with 'qcom,scm'.
>
> Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
> ---
> Changes in v2:
>  - Improve commit log to make the compatibility explicit
>  - Link to v1: https://lore.kernel.org/all/20260420023243.1239927-1-sheng=
chao.guo@oss.qualcomm.com/
>
>  Documentation/devicetree/bindings/firmware/qcom,scm.yaml | 1 +
>  1 file changed, 1 insertion(+)

Missing the correct lists. Please resend so checks run and it's in PW.

