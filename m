Return-Path: <linux-arm-msm+bounces-115446-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id bdr+NcXGQ2oehgoAu9opvQ
	(envelope-from <linux-arm-msm+bounces-115446-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Jun 2026 15:38:13 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 67EB26E4EDA
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Jun 2026 15:38:13 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=L9knhPPQ;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-115446-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-115446-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id D8D893024E60
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Jun 2026 13:38:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B05B7325483;
	Tue, 30 Jun 2026 13:38:10 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B37482FDC28
	for <linux-arm-msm@vger.kernel.org>; Tue, 30 Jun 2026 13:38:09 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782826690; cv=none; b=Gph/f7sjTriGJeTFJV238yEr1DJ1IW53Tv9/wrQ5O2J45A0OkS/vMtjS3boy4NllIpKeoLG/Ng06/8wDYHVKy8Fx/8Do4dB4LqhLqpFTcWwJMqXqwJ23ARfJfxdpaDfMSVYotvg4hYvuJs3as0C9THCDlIysI45CiwFOkrmG468=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782826690; c=relaxed/simple;
	bh=lUFn8v5YRDsmKM4TDlx5GnOTpc3PavcaCR8q92eez74=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=h7mO2c8tuouB0DdeX7rhcXm5Qo61BnPbyHJlIjneHK++m+s4WtfGdHDlnZNH0nJiUeIKyLdfDnRpiDXc2cD5GS4xk29oB+kffHj16oDYkj2WORyt/xsc4hxKeB6ovDtM7jhtuDRcPZPpfIcLimpbnu4NbQplwKSYkzqJOaFtonA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=L9knhPPQ; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5E4D21F00A3E
	for <linux-arm-msm@vger.kernel.org>; Tue, 30 Jun 2026 13:38:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782826689;
	bh=lUFn8v5YRDsmKM4TDlx5GnOTpc3PavcaCR8q92eez74=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=L9knhPPQSDqyoXbkfBNrE65wyPXWe/8DavDXKbDJ3qGPSdVvpYUk/xqDBnbxNIOwG
	 YvhS5XcuaEJ8lvuD5DIHmuB4+WuL+kVJC+kXEF2fWPbwRYMDDQN1ntWu5f+194Z/5X
	 QTCAcu1yzkW0nLX6f6SYXbLUEblPG6YIixStzpKSx9OUSkWOmIfgFhQLuM4UYWjF9+
	 gwYpPIbKiXSnWweDm2dAsDlkV1M2lGCDbaWK4akmwNjCvnkIQZU03IlTdvxBdiq7Pg
	 erTHWPmuaa2QBdUbMh9mFnm8LHE/gaX150krXNXP3NW+Tgp8WY0YbVGGU8ooKXWfzB
	 vMluGZWlvHlLQ==
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-5aebf9a50b8so462729e87.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 30 Jun 2026 06:38:09 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RqWgqt0GlaK9orvoMFGHaw9hIL2UoNwjtqpmFZL2rCKPdoKVTbA17sbKPlCShHfoBPEdZKsV2DCjfDYiRQ6@vger.kernel.org
X-Gm-Message-State: AOJu0YxW0Se9ZHYT7wkKETiYzE0KsMxsP1g3dIiJ5iL5AINCaozMi25U
	95cme+27l4c/LcPmRsOyVSlF0Srbv79SjNfgdgenqqwMfakoLVgCIA2WCt8nXtvpXi+BFyfsu1v
	bczqBzTptYcrC3kurTNPnAxOWUvwbr08=
X-Received: by 2002:a05:6512:800b:10b0:5ae:c003:4b8b with SMTP id
 2adb3069b0e04-5aec10cda2emr186923e87.59.1782826688214; Tue, 30 Jun 2026
 06:38:08 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260623122732.6439-1-johannes.goede@oss.qualcomm.com>
In-Reply-To: <20260623122732.6439-1-johannes.goede@oss.qualcomm.com>
From: Linus Walleij <linusw@kernel.org>
Date: Tue, 30 Jun 2026 14:37:55 +0100
X-Gmail-Original-Message-ID: <CAD++jL=K-LeY56Zm14Fd7YFhuDBmu_9c1hHLPWx03kJX7x99ZA@mail.gmail.com>
X-Gm-Features: AVVi8CfNRGKTkTnPcOf2haEeMR-5L9o1eLlK2Wu1gD8o5DDoLSVDoKw3EmNYPMo
Message-ID: <CAD++jL=K-LeY56Zm14Fd7YFhuDBmu_9c1hHLPWx03kJX7x99ZA@mail.gmail.com>
Subject: Re: [PATCH 1/2] pinctrl: qcom: Drop unnecessary bitmap_fill() call
To: Hans de Goede <johannes.goede@oss.qualcomm.com>, Bartosz Golaszewski <brgl@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>, linux-arm-msm@vger.kernel.org, 
	linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-5.16 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-115446-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:johannes.goede@oss.qualcomm.com,m:brgl@kernel.org,m:andersson@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-gpio@vger.kernel.org,s:lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER(0.00)[linusw@kernel.org,linux-arm-msm@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[kernel.org:+];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linusw@kernel.org,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,vger.kernel.org:from_smtp,mail.gmail.com:mid,qualcomm.com:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 67EB26E4EDA

On Tue, Jun 23, 2026 at 1:27=E2=80=AFPM Hans de Goede
<johannes.goede@oss.qualcomm.com> wrote:

> Drop an unnecessary bitmap_fill() call from msm_gpio_irq_init_valid_mask(=
),
> this is unnecessary because gpiochip_allocate_mask() already does this.
>
> Signed-off-by: Hans de Goede <johannes.goede@oss.qualcomm.com>

Acked-by: Linus Walleij <linusw@kernel.org>

Bartosz will apply this patch!

Yours,
Linus Walleij

