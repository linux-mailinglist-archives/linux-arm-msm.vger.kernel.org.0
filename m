Return-Path: <linux-arm-msm+bounces-118042-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 8S0DKDO6T2p8nQIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-118042-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 09 Jul 2026 17:11:47 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 001C7732ABA
	for <lists+linux-arm-msm@lfdr.de>; Thu, 09 Jul 2026 17:11:46 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=Lrvz6pae;
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-118042-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-118042-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id BA8AB310AC60
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Jul 2026 14:53:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 72DFE38238F;
	Thu,  9 Jul 2026 14:53:04 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 020C5309F08
	for <linux-arm-msm@vger.kernel.org>; Thu,  9 Jul 2026 14:53:03 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783608784; cv=none; b=oT0Us20IGX8UH8pJoacvM7VTqw2h5ez/L+oGMQbvjcspqCbl0ceTL4PEeob+BN1dmda7O0FZC/dlggRdbzrPlJYeLTH8TyzDBmn7xkAHRjhb3tjfXBrGRLDMgpnOK2kI0bHnjj4BoLdXP27D6K6ie0ymic7xSWgiFNIfSFflF9g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783608784; c=relaxed/simple;
	bh=RLFiKybwqiRfaIacMSYfLnz5IphLQABbZGpGEz+/ci8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=s0p1ZeIKhUA7CjpV43ugeWFBEaH+2B4oshrBss9eaBVAVyUVdeiYBV4xDlM8ruIe/iuGrc6RhJFpILFud/E0Y4zzSH/cUfzV1Qq1QdzpBw2Br03jvwl2ZScM80kCUel9qmRPuapLWjo6gWTg41fEouef0R/tfqch1k0Fx2TzIR4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Lrvz6pae; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DB4F71F00ACF
	for <linux-arm-msm@vger.kernel.org>; Thu,  9 Jul 2026 14:53:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783608782;
	bh=RLFiKybwqiRfaIacMSYfLnz5IphLQABbZGpGEz+/ci8=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=Lrvz6paed3fAUCv4rxFJJF8EyiDAKbAb9Klc6AOxsnMDoEjb3SMjPKEc7SWpgnLiT
	 8L7nOZt8uUArhb2WiOyn1uI/SKvkafbxvilEBiqC6ylYrsxJdMiYbuZ0IyUfpQunRX
	 lLCgaXDsJpN+wg5pPf3ACZ4vSPWhTHEH8+xJ287AR/gJFA5OdSw4PMqRyonIJ9Nuo7
	 iDE+d+yHerGm+DifXN56RCUsVXV9VWYO5Scsln0RM4ikpF2uyH0y8kyYABFOXFuPJG
	 sUevqLxyb7qr+LTtwXCiEPPaC2Zh/QhwYThjTjsptZ0USKUgkU+6cymV7LWg4G7oqn
	 Xod0v+10zmdIg==
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-39c7895ce05so17343201fa.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 09 Jul 2026 07:53:02 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RpSmOGlKlFG7XyD6Up+Kpq4DJ5ym6LEqyRf0uYQTiym4InD8FePhQSYmXtHXmXJqqgnfAMQ6cSm4c9Jh4Qi@vger.kernel.org
X-Gm-Message-State: AOJu0YzEhiRc5BeDHLq+DNTo+YExdk+5QrQQy/DNUrTwaAuMhJ0eFpqT
	OznhXDKgVV+URPeq0Z6Mrx8ZsRaM3wSinUzsn5hrH4uyr2qQIHgOs2EOxYR/oulajs3oQHVuRnL
	gRBNxNi1nnwp5jW4XI4+XnckebOB8UCA=
X-Received: by 2002:a05:6512:1418:b0:5ae:bce4:b696 with SMTP id
 2adb3069b0e04-5b011457496mr1654043e87.15.1783608781260; Thu, 09 Jul 2026
 07:53:01 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260706-fix_sticky_-einval_after_pm_runtime_api_failure-v3-0-92feb5a7b926@oss.qualcomm.com>
 <20260706-fix_sticky_-einval_after_pm_runtime_api_failure-v3-1-92feb5a7b926@oss.qualcomm.com>
 <CAJZ5v0i4Zc4HNUdgJ_2=4=wv7vRDTugo71qsWnZxVRRqV+W8mw@mail.gmail.com>
 <9d271393-c500-46a9-8795-f1371585445c@sirena.org.uk> <CAJZ5v0g9AxpqUQUQ-vwG2LN3pfT3qXi3_S=So42=VdVtzg-=Dw@mail.gmail.com>
 <f6532e0f-a0b3-490d-8313-d6f5b72e8236@sirena.org.uk>
In-Reply-To: <f6532e0f-a0b3-490d-8313-d6f5b72e8236@sirena.org.uk>
From: "Rafael J. Wysocki (Intel)" <rafael@kernel.org>
Date: Thu, 9 Jul 2026 16:52:49 +0200
X-Gmail-Original-Message-ID: <CAJZ5v0jp6kds4tCPYgSSXUR8gY6RZeduDo4KT_C4SDe1LkO1vg@mail.gmail.com>
X-Gm-Features: AUfX_mx_i-Ak0IpYfFQhE7YA2IxINgGGdh6jGUVBYlO8uF8CkL_5A8zDw-EN5zc
Message-ID: <CAJZ5v0jp6kds4tCPYgSSXUR8gY6RZeduDo4KT_C4SDe1LkO1vg@mail.gmail.com>
Subject: Re: [PATCH v3 1/2] PM: runtime: Only set runtime_error on suspend
 callback failures
To: Mark Brown <broonie@kernel.org>, Praveen Talari <praveen.talari@oss.qualcomm.com>
Cc: Dilip Kota <dkota@codeaurora.org>, Stephen Boyd <swboyd@chromium.org>, 
	Girish Mahadevan <girishm@codeaurora.org>, Alok Chauhan <alokc@codeaurora.org>, 
	bjorn.andersson@oss.qualcomm.com, 
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, Len Brown <lenb@kernel.org>, 
	Pavel Machek <pavel@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Danilo Krummrich <dakr@kernel.org>, Douglas Anderson <dianders@chromium.org>, linux-spi@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	Mukesh Kumar Savaliya <mukesh.savaliya@oss.qualcomm.com>, aniket.randive@oss.qualcomm.com, 
	chandana.chiluveru@oss.qualcomm.com, jyothi.seerapu@oss.qualcomm.com, 
	linux-pm@vger.kernel.org, driver-core@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-5.16 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-118042-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:broonie@kernel.org,m:praveen.talari@oss.qualcomm.com,m:dkota@codeaurora.org,m:swboyd@chromium.org,m:girishm@codeaurora.org,m:alokc@codeaurora.org,m:bjorn.andersson@oss.qualcomm.com,m:konrad.dybcio@oss.qualcomm.com,m:lenb@kernel.org,m:pavel@kernel.org,m:gregkh@linuxfoundation.org,m:dakr@kernel.org,m:dianders@chromium.org,m:linux-spi@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:mukesh.savaliya@oss.qualcomm.com,m:aniket.randive@oss.qualcomm.com,m:chandana.chiluveru@oss.qualcomm.com,m:jyothi.seerapu@oss.qualcomm.com,m:linux-pm@vger.kernel.org,m:driver-core@lists.linux.dev,s:lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[22];
	FORGED_SENDER(0.00)[rafael@kernel.org,linux-arm-msm@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[kernel.org:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[rafael@kernel.org,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,vger.kernel.org:from_smtp,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 001C7732ABA

On Mon, Jul 6, 2026 at 7:30=E2=80=AFPM Mark Brown <broonie@kernel.org> wrot=
e:
>
> On Mon, Jul 06, 2026 at 04:10:34PM +0200, Rafael J. Wysocki (Intel) wrote=
:
> > On Mon, Jul 6, 2026 at 3:21=E2=80=AFPM Mark Brown <broonie@kernel.org> =
wrote:
>
> > > I've got a bunch of other stuff in flight for that driver - I'll need=
 to
> > > check but just in case perhaps a tag I could pull in?
>
> > I'm wondering though if the patches in the series really depend on each=
 other.
>
> > There doesn't appear to be any code dependency between them.
>
> That would also work, a bit annoying for any bisects possibly but so
> long as we land both in the same release we should be good.

So I've applied the first patch only as 7.3 material.

If you need it to be exposed on an immutable branch, please let me know.

Thanks!

