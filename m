Return-Path: <linux-arm-msm+bounces-113261-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id vs/IMSB/MGpSTwUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-113261-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Jun 2026 00:39:28 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F13968A6AE
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Jun 2026 00:39:28 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=Rw6A3U1x;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-113261-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-113261-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 26519301300A
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Jun 2026 22:38:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1AEDC38A715;
	Mon, 15 Jun 2026 22:37:59 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 147BA30EF63
	for <linux-arm-msm@vger.kernel.org>; Mon, 15 Jun 2026 22:37:58 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781563079; cv=none; b=XuaMVb/u3JWme3N/Fw2xNANnhpdqaaoDslD84p6/OW/+dokYdwgzBNKgW2ote2s/+/+3U/BdiybgIa7pDFxChgFKEH9fCi3nFuQ0WVDdJ9dWhG3SanA0hZzMTMs6xR/XciQdlROyKGGX3dTBJw7bzSVc6qFxy5hlj+2tkve5Eb0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781563079; c=relaxed/simple;
	bh=RscLxi0QYmrCI78yKOUvn8h+FU7Yg2NfqSl2zoSsVf0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=haXxBjFy7YTcpmE/orw93wI/P7DW8JdRmftXY0frFgZ2OMYDYn0P5MO1/cM1HF9DdYdd/tzTz6X8zCJW3DSuKsUStpMwTqf8mdzm/7VKh/WzpSIyf6krlizPCqPJ5dO0vYFcmbdDfDxKBxEQlu/K8MGXUx5SKRySiN+68s46L0k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Rw6A3U1x; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EA3711F00A3E
	for <linux-arm-msm@vger.kernel.org>; Mon, 15 Jun 2026 22:37:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781563078;
	bh=RscLxi0QYmrCI78yKOUvn8h+FU7Yg2NfqSl2zoSsVf0=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=Rw6A3U1x/wop81nloJSdctNjl2bKN231dgCCDM1nAc1DtPE5szsqJhTINMQ2Gag5W
	 DdaK2KxOkkc9Md3y5/xA1nluIzRQ/EV2ue1WhIhNy2iTjrkMtNNnlH+HwYV9ddg16r
	 dWq3aLoKPdUokAl/CaC2fi7FdEDidWGIhNpGXuYCtHPgAcW5viDeRoxc5x2vchOZeX
	 97bkZydJETppMa6w0vd+WrenOMUL1d8Au8W6d5vS47MG9dTwf/5n8qXc/89Z0pEB+Q
	 Vod8WIO031310I2PG04GgiRzpMMGh0mNDsL2dK63WQE+8IFPwwbV7pF2yHs5Mj9plb
	 xF43zZMgAqnPg==
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-5aa68d9dc18so5285378e87.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 15 Jun 2026 15:37:57 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ/eU4Elw5TtrzfcyfEsfrpR2SJXsiTwvEA/JNMCujQtJC9W7wSsJAPhCjygnflJRKbhDB4AYC46tzEhVZLj@vger.kernel.org
X-Gm-Message-State: AOJu0YwH/O//8iYO2zh8Pac20cgjHopG6PSSMm0CM8Siol34NBRRq8er
	Sb68kRndx8BLggSMlc4ExuspMCIO+65fyb6/Y0vcxRlKxAECM6CtvoxqXeZ833YBXEPxSIJcIkD
	9Y6jBOnmg+Bbb7uTZlyVNrp+m/iePc3E=
X-Received: by 2002:ac2:4c51:0:b0:5aa:fd6:87aa with SMTP id
 2adb3069b0e04-5ad2db1bb11mr4694994e87.4.1781563076625; Mon, 15 Jun 2026
 15:37:56 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260522204644.4101640-1-ajay.nandam@oss.qualcomm.com>
 <CAD++jL=gPF9jzPe90sy0W6ogEWq6LqTnbRfnoH5qxwGnBTiGMg@mail.gmail.com> <CAMRc=MfLspdy3Ncx7_dq57KXYs2ge=ZCp3jO2D7z6Gd=8XN9XQ@mail.gmail.com>
In-Reply-To: <CAMRc=MfLspdy3Ncx7_dq57KXYs2ge=ZCp3jO2D7z6Gd=8XN9XQ@mail.gmail.com>
From: Linus Walleij <linusw@kernel.org>
Date: Tue, 16 Jun 2026 00:37:44 +0200
X-Gmail-Original-Message-ID: <CAD++jLmjMHws+AFx-3NXM13d4nn-+1tH77EQeDgQnz6A18ZYrw@mail.gmail.com>
X-Gm-Features: AVVi8CeAElTDayrdXfL-RLwKe3zLGpjMEDm0Ry4tNFXJhq_w-eGCtGWHR26JRLw
Message-ID: <CAD++jLmjMHws+AFx-3NXM13d4nn-+1tH77EQeDgQnz6A18ZYrw@mail.gmail.com>
Subject: Re: [PATCH v6 RESEND 0/2] pinctrl: qcom: lpass-lpi: Switch to PM
 clock framework
To: Bartosz Golaszewski <brgl@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>, linux-arm-msm@vger.kernel.org, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	mohammad.rafi.shaik@oss.qualcomm.com, 
	Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-5.16 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-113261-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:brgl@kernel.org,m:andersson@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-gpio@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:mohammad.rafi.shaik@oss.qualcomm.com,m:ajay.nandam@oss.qualcomm.com,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[linusw@kernel.org,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linusw@kernel.org,linux-arm-msm@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,vger.kernel.org:from_smtp,mail.gmail.com:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 3F13968A6AE

On Mon, Jun 15, 2026 at 5:54=E2=80=AFPM Bartosz Golaszewski <brgl@kernel.or=
g> wrote:

> > Actually the volume of Qualcomm patches has gone up the recent
> > months so I'm starting to feel like I need a Qualcomm submaintainer
> > who does the nice things that Geert does for Renesas and Krzysztof
> > does for Samsung Exynos and collect the Qcom/MSM patches and
> > send pull request to me. Think about it! (I know very well Bjorn and
> > Krzysztof have enough to do alread, so maybe someone else?)
>
> Hi!
>
> I've been volunteered to do this. If you agree, should I have a separate =
tree
> like for Renesas and Samsung and make pull-requests to you?

Excellent choice, I trust this maintainer a lot :D

Yes just set up some tree on kernel org (or use a branch on one
of your existing ones if it makes more sense) and send signed
pull request from there.

Chain of trust with GPG keys is already in place.

Yours,
Linus Walleij

