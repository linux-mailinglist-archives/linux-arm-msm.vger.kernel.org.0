Return-Path: <linux-arm-msm+bounces-119131-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id KEH0JXPwVmoBDQEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-119131-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Jul 2026 04:29:07 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C2F875A0DC
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Jul 2026 04:29:07 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=egWuM8ma;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-119131-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-119131-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9EB2B3070CCC
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Jul 2026 02:29:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 838193A7F60;
	Wed, 15 Jul 2026 02:29:01 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 253F1381EAF
	for <linux-arm-msm@vger.kernel.org>; Wed, 15 Jul 2026 02:28:59 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784082541; cv=none; b=TmlMOd4P/a4q8qK0Fgil9pexVUJlbDq+gEAf0gNgzJjdrAPuGh3ze08nh3l0gav63nLDYVcqRQzvSdtcVOMz3axa+kPYZvxLEIklGRcUk8ORH/BTcOvhiPb2UdLucqNlpBWEFXb948bGEdzESj7q6yf/xM7tbPOq7N+otL6MzrU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784082541; c=relaxed/simple;
	bh=6L/E+zHPBkzyXInpwFnUmel39o3tWspQop5yMbWE4rU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=CEm7ApSNrDas3cRqcwYwWsGXdgO1rwVds5Wmjyx/cMHJjJCPwrhuC/GNhX7Dve97JXMQkoG4SRsbZKkYvabGehTkeAKH3gNFYLbJT6onAD6W1gBKjUULRL/Z0jUMqShtkksI0QS05v5dlrrax90+mJ9Axsge/6fuBKH4KkacNkI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=egWuM8ma; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BBF2A1F00A3E
	for <linux-arm-msm@vger.kernel.org>; Wed, 15 Jul 2026 02:28:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784082539;
	bh=1kXcTL8/0Zn1GMktmg0UnKx75NkFUMHQp0ZSVhtetpc=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=egWuM8max8h35yBWwETK4lVYSrr9hacKPVe35TOiw/mkJU9+2cO8o+0OG29AvHcPu
	 hy+ELlIX3HaBshGFA5P1lYHpcogrP9DqWYRXWlTrT+UcWCGyg3EawM2ZirtrAAB5Zo
	 6xEoPGIf/m/hG+gor1w8VBC4M83XBlSPuVlmrTqz09oVTR3OINqI7Wo1KdBo1d0auI
	 AwBa0Nvn22Pj75BYf8SclgsV/E/yL8PYLbp5/Bvb721bM4xMza0OzVGvwjfR+yedtI
	 CdGXt2f+7AZuYOnCpRGQd6jSUBpLXFxGQ9MBQXOEogEQPfcU7stOwM+1aEhqTa4rjO
	 2DM828rLtEJcQ==
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-69c5eb6dfd3so6148243a12.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 14 Jul 2026 19:28:59 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RphFN/tjK5c71uBCKTAjq4GMiXBuqH3zvgb4rP2hJMQ4v0e0y0lbpOO24Iu1kFpe5kqHf7wmsdxyrZEeSnu@vger.kernel.org
X-Gm-Message-State: AOJu0YzEP+7GNJaisV8Rjs2+WK/okSrvc/OlgIe6ljisVW9IR9xErf8F
	RusRUh/B1+kfoLLIsS/EkcnRbn11h8cKAuttfjLPoHjchoGB353Sx268SLo+eoR/MpADH61OJK0
	VeJvvytRiP1qxoA5Lvfh48YD9DQWXRg==
X-Received: by 2002:a17:906:9c96:b0:c16:2750:fc56 with SMTP id
 a640c23a62f3a-c1667a76e98mr289795166b.41.1784082538444; Tue, 14 Jul 2026
 19:28:58 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260109043352.3072933-1-mr.nuke.me@gmail.com>
 <178370682987.2572738.13491033810212556744.b4-ty@kernel.org>
 <20260714214519.GA2851152-robh@kernel.org> <CADi83T6kdqo-x0bcCGspni_e6ysEY6sud1AmZ4-utveA0rpLQA@mail.gmail.com>
In-Reply-To: <CADi83T6kdqo-x0bcCGspni_e6ysEY6sud1AmZ4-utveA0rpLQA@mail.gmail.com>
From: Rob Herring <robh@kernel.org>
Date: Tue, 14 Jul 2026 21:28:47 -0500
X-Gmail-Original-Message-ID: <CAL_JsqKN0J_03_o8Na8-y=x7ny9g7vhSqa73XSu_d_D8P45dVw@mail.gmail.com>
X-Gm-Features: AUfX_mzXuqLXie6CLWuLJ3TNxvl1OVaHyYiBnb4zldxw9L1dxTkVeP02-_OzU2s
Message-ID: <CAL_JsqKN0J_03_o8Na8-y=x7ny9g7vhSqa73XSu_d_D8P45dVw@mail.gmail.com>
Subject: Re: (subset) [PATCH v2 0/9] remoteproc: qcom_q6v5_wcss: add native
 ipq9574 support
To: Alexandru Gagniuc <mr.nuke.me@gmail.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, linux-remoteproc@vger.kernel.org, 
	Mathieu Poirier <mathieu.poirier@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Stephen Boyd <sboyd@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, linux-arm-msm@vger.kernel.org, 
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>, 
	linux-clk@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.66 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-119131-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	FORGED_RECIPIENTS(0.00)[m:mr.nuke.me@gmail.com,m:andersson@kernel.org,m:krzk+dt@kernel.org,m:mturquette@baylibre.com,m:linux-remoteproc@vger.kernel.org,m:mathieu.poirier@linaro.org,m:conor+dt@kernel.org,m:konradybcio@kernel.org,m:sboyd@kernel.org,m:p.zabel@pengutronix.de,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-clk@vger.kernel.org,m:mrnukeme@gmail.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[robh@kernel.org,linux-arm-msm@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[robh@kernel.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,vger.kernel.org:from_smtp,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 3C2F875A0DC

On Tue, Jul 14, 2026 at 5:50=E2=80=AFPM Alexandru Gagniuc <mr.nuke.me@gmail=
.com> wrote:
>
> Hi Rob
>
>
> On Tue, Jul 14, 2026, 17:45 Rob Herring <robh@kernel.org> wrote:
>>
>> On Fri, Jul 10, 2026 at 01:07:04PM -0500, Bjorn Andersson wrote:
>> >
>> > On Thu, 08 Jan 2026 22:33:35 -0600, Alexandru Gagniuc wrote:
>> > > Support loading remoteproc firmware on IPQ9574 with the qcom_q6v5_wc=
ss
>> > > driver. This firmware is usually used to run ath11k firmware and ena=
ble
>> > > wifi with chips such as QCN5024.
>> > >
>> > > When submitting v1, I learned that the firmware can also be loaded b=
y
>> > > the trustzone firmware. Since TZ is not shipped with the kernel, it
>> > > makes sense to have the option of a native init sequence, as not all
>> > > devices come with the latest TZ firmware.
>> > >
>> > > [...]
>> >
>> > Applied, thanks!
>> >
>> > [1/9] remoteproc: qcom_q6v5_wcss: drop unused clocks from q6v5 struct
>> >       commit: 22afc6163c0c7a144d24a09352b87719d64d5f65
>> > [2/9] dt-bindings: remoteproc: qcom,ipq8074-wcss-pil: convert to DT sc=
hema
>> >       commit: 2a756ac4d98efc97503629fcaddb2e7c46255824
>> > [4/9] dt-bindings: remoteproc: qcom: add IPQ9574 image loader
>> >       commit: bc33b5b5e23a389e660c3d696cd2e043fdf33ef7
>>
>> Why is a 6 month old patchset with reported errors being applied?
>> Anyways, linux-next is now broken. Please fix.
>
>
> I must have missed the error reports. Can you please point me in the righ=
t direction? I'll get on this ASAP.

"make dt_binding_check" on linux-next.

Rob

