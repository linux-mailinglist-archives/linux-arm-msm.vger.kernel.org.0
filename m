Return-Path: <linux-arm-msm+bounces-99610-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oMQIC5tpwmlScwQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-99610-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Mar 2026 11:38:19 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 168933068A5
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Mar 2026 11:38:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 9A270300118E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Mar 2026 10:33:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3E2703E023C;
	Tue, 24 Mar 2026 10:33:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ecpgKo6y"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F2E63D1CD7
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Mar 2026 10:33:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774348398; cv=none; b=lzVBdpJDUuQJxubEYbuPz3Thf1nkD8zjz9yBFfoXEQFD0OgChpyF2WSgX/V4llLHeAItQOH8RsXp9xTDNTVmp2IHYhxXqfybvQJmnx5DCTjbA/S/kGmymvIZTU69GtrdWuCqlh1irYhVA34qbvF2OiSK1dNprAwV0BFvtzM5mlI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774348398; c=relaxed/simple;
	bh=LmpisUv802/GhgGZG903FCBdadHM4eGmqBbzVzxKKx4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jI8YzmZXtREIEEOY6ozXsSlspd6x73u/m3oYN1TfKanDRM4Vy7oSGUAosPyJfY1cK3cR/ox4NbvNt+YFWRQEOkg5meN2otKpH05lp33o1rhn/LNoqeU2ZZYUZpKGjmO/wcaSSTbYdL4koIUxK/Fh73QN+JtxBWbjtovpqnkkt8c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ecpgKo6y; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BC2FEC2BCB7
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Mar 2026 10:33:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774348397;
	bh=LmpisUv802/GhgGZG903FCBdadHM4eGmqBbzVzxKKx4=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=ecpgKo6ya3eT5Y1K3w2BraBxlqfSUlj1JB7q5KYFk+Uhlu+KtxAtNg90k04dWM1IM
	 rX2eziQOB49zwgtvrOjClWWaQFHZmC2lprJP6skHMSxa0639/PKQk4GJ4ng0mTknBJ
	 fWkfRc6P31tqk4IgjcsK9W6mwbcWkAbml4GMTZ86eCDDnAbxeZV+8nd2Y0FPLJQutS
	 C9GfFSR21InS47Fddtan+gPbGqRCfij9KU24AYyyOcuPfKCC8nd8tnJOJNY9XGuZJu
	 z6UGBqTKtlbo+fek1bpXBg6UliX6QZXUeEQl2DTVJPUjsZn+NKUazF3y5ROPKjZg7s
	 hcxGxQBvhHpYA==
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-5a298acb395so577109e87.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 24 Mar 2026 03:33:17 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWIfIkGhNN9l1bYew+IsNDaLXJWcTZYnGyaE5Dtc2aMP+Rn/CUOmGw69AIVxvRjpACZKYCXwKEj8x6FIXzN@vger.kernel.org
X-Gm-Message-State: AOJu0YxpgYiqjI5/ppK3nnfusIP/DxAX2fT6d/ZAlyjlCuID9y0xfYDg
	G9rc8Vv5x+GUkqrS92D6c4K3krgs8IwBctg2QiP+ky7PuQ+uiKs9bfFVr8xdMqfun63L7gODS/w
	NV2BtnUtgV4SFfaPAggGyPg4Z8ow10DwhlENBpwSLTA==
X-Received: by 2002:a05:651c:1b12:b0:38b:e048:57c with SMTP id
 38308e7fff4ca-38bf95e96e2mr54924081fa.7.1774348396362; Tue, 24 Mar 2026
 03:33:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260324023016.3889062-1-shuai.zhang@oss.qualcomm.com>
In-Reply-To: <20260324023016.3889062-1-shuai.zhang@oss.qualcomm.com>
From: Bartosz Golaszewski <brgl@kernel.org>
Date: Tue, 24 Mar 2026 11:33:04 +0100
X-Gmail-Original-Message-ID: <CAMRc=Mf4gVhwUZ8t1jQ_ohX9dfGcAX7ay3WGZP+LmsTM87xL8w@mail.gmail.com>
X-Gm-Features: AaiRm50RGYdcWdeA9UWdTl5rnczjpz6on9dz8mxFFSEpP8KT5oS2GIhb-D42Plo
Message-ID: <CAMRc=Mf4gVhwUZ8t1jQ_ohX9dfGcAX7ay3WGZP+LmsTM87xL8w@mail.gmail.com>
Subject: Re: [PATCH v3] Bluetooth: hci_qca: disable power control for WCN7850
 when bt_en is not defined
To: Shuai Zhang <shuai.zhang@oss.qualcomm.com>
Cc: Marcel Holtmann <marcel@holtmann.org>, Luiz Augusto von Dentz <luiz.dentz@gmail.com>, 
	linux-arm-msm@vger.kernel.org, linux-bluetooth@vger.kernel.org, 
	linux-kernel@vger.kernel.org, cheng.jiang@oss.qualcomm.com, 
	quic_chezhou@quicinc.com, wei.deng@oss.qualcomm.com, 
	jinwang.li@oss.qualcomm.com, mengshi.wu@oss.qualcomm.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[holtmann.org,gmail.com,vger.kernel.org,oss.qualcomm.com,quicinc.com];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_FROM(0.00)[bounces-99610-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[brgl@kernel.org,linux-arm-msm@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,mail.gmail.com:mid,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 168933068A5
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, Mar 24, 2026 at 3:30=E2=80=AFAM Shuai Zhang
<shuai.zhang@oss.qualcomm.com> wrote:
>
> On platforms using an M.2 slot with both UART and USB support, bt_en is
> pulled high by hardware. In this case, software-based power control
> should be disabled. The current platforms are Lemans-EVK and Monaco-EVK.
>
> Add QCA_WCN7850 to the existing condition so that power_ctrl_enabled is
> cleared when bt_en is not software-controlled (or absent), aligning its
> behavior with WCN6750 and WCN6855
>
> Signed-off-by: Shuai Zhang <shuai.zhang@oss.qualcomm.com>
> ---

Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

