Return-Path: <linux-arm-msm+bounces-112342-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id WChdFdQfKWpDRAMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-112342-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Jun 2026 10:27:00 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A8F466724B
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Jun 2026 10:26:59 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=NwJkHWty;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-112342-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-112342-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 332BE3233DCC
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Jun 2026 08:18:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8A88A3A1684;
	Wed, 10 Jun 2026 08:17:54 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 823EA391E4C
	for <linux-arm-msm@vger.kernel.org>; Wed, 10 Jun 2026 08:17:53 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781079474; cv=none; b=ELVv7w5fMEGWqlTrH8gB7YuguvIKQL2pjCiDNaXpSttxCkrOVlJV7oNR9ifE985fZjQW3RGpPwLEANfjlVxgXogNuvmYFaMXUmWNxZ1b9q3ftm9KRswouAQJi2a7zW2XW7XsCZ1cdSSYUHebwBTh2VkVd01sDAo1GCBH+YhplvI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781079474; c=relaxed/simple;
	bh=EztlkaJd9gHp+3rz396EIvkoYHLVnmoIMg7Ox8UJMiw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=oDI3v9WoqInBcExLrME3fgG1TCVFotVmz67LIjLgS7mm1Wds9DVbFxtCmtL7dwC7NvDOEWXoExG5iU96kSxhv3gXuqEjxintoVLHLbz5qYCYLBNejAXmso+hBqzUpQAE6d9t1N3SHfvdCtKTbU+GtSzYvmU1/t0dFJdPKKkwRI4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NwJkHWty; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 361DA1F00899
	for <linux-arm-msm@vger.kernel.org>; Wed, 10 Jun 2026 08:17:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781079473;
	bh=EztlkaJd9gHp+3rz396EIvkoYHLVnmoIMg7Ox8UJMiw=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=NwJkHWtys4/Ts7sNo65xaI3Nci/MaGBDTPfUdh/5hYGSJvnLRtg7tHn8WHKmNepUt
	 Mu7zpGuT3175nI0QN8z3Iv4HvDZ0g11AgraPlhD6NekgKzH5k2k+089chzMCMsqeof
	 XzStHhVmnVT1bxdxQprX/cXyWl3FRs4TlhcQyeG2dSY1IeQmFTsB9qd9/Xorxe/ogg
	 1dIKFCR+pbVciXDH9ZEk+CubFJbUDYihHbsRE1XDAvsFsoilgCs5V4VHhdP0hlRenJ
	 OXrv4RbRSP0AWobRhxBnmbACaGpvP90/2D7Ww5sMKTGF4QmVVlmHaqyeFcYpkGCfyt
	 pPw+pVyAZ2oyw==
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-5aa68dbd44fso6722978e87.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 10 Jun 2026 01:17:53 -0700 (PDT)
X-Gm-Message-State: AOJu0YzleexOCcZDy2WF+J6GfVUVdRJZrEbpRg07nUk85jXqHq1eVQPa
	R7TUOdxSJx0X911FZCJAHSTxfdaOOznx7qhFKlKQET3KajMfR8qVybPkQpFPOFA1GRXIeO7BoVB
	WX7bBu4u2kd21Ps/H1GGEF+95sDict0+a+51vn7l84g==
X-Received: by 2002:a05:6512:1114:b0:5aa:7ad2:f4d5 with SMTP id
 2adb3069b0e04-5aa87bad505mr786523e87.38.1781079471995; Wed, 10 Jun 2026
 01:17:51 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260609075417.1160702-1-xiuzhuo.shang@oss.qualcomm.com>
 <20260610064232.2385866-1-xiuzhuo.shang@oss.qualcomm.com> <CAMRc=MdojC6T1RuqRNE-ssoRw1pKyUHyOS9AD0ROfCpPPOqw1A@mail.gmail.com>
 <c0eee7b4-50ee-4635-b8d6-fe9cb4ea05a8@oss.qualcomm.com>
In-Reply-To: <c0eee7b4-50ee-4635-b8d6-fe9cb4ea05a8@oss.qualcomm.com>
From: Bartosz Golaszewski <brgl@kernel.org>
Date: Wed, 10 Jun 2026 10:17:38 +0200
X-Gmail-Original-Message-ID: <CAMRc=Mfiedea-sjp_c7OHcgwXSY2NWHHx1ZhcF0qHk9qL8yx2g@mail.gmail.com>
X-Gm-Features: AVVi8Ccm_OV-7Z3UodygMzh6-MiEsifxELJBKPIHj2hdMprATO4EGMaRr9pt9Ek
Message-ID: <CAMRc=Mfiedea-sjp_c7OHcgwXSY2NWHHx1ZhcF0qHk9qL8yx2g@mail.gmail.com>
Subject: Re: [PATCH v2] Bluetooth: qca: Add BT FW build version to kernel log
To: Xiuzhuo Shang <xiuzhuo.shang@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-bluetooth@vger.kernel.org, 
	linux-kernel@vger.kernel.org, cheng.jiang@oss.qualcomm.com, 
	quic_chezhou@quicinc.com, wei.deng@oss.qualcomm.com, 
	shuai.zhang@oss.qualcomm.com, mengshi.wu@oss.qualcomm.com, 
	jinwang.li@oss.qualcomm.com, 
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>, 
	Marcel Holtmann <marcel@holtmann.org>, Luiz Augusto von Dentz <luiz.dentz@gmail.com>
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
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[13];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-112342-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xiuzhuo.shang@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:linux-bluetooth@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:cheng.jiang@oss.qualcomm.com,m:quic_chezhou@quicinc.com,m:wei.deng@oss.qualcomm.com,m:shuai.zhang@oss.qualcomm.com,m:mengshi.wu@oss.qualcomm.com,m:jinwang.li@oss.qualcomm.com,m:bartosz.golaszewski@oss.qualcomm.com,m:marcel@holtmann.org,m:luiz.dentz@gmail.com,m:luizdentz@gmail.com,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[brgl@kernel.org,linux-arm-msm@vger.kernel.org];
	FREEMAIL_CC(0.00)[vger.kernel.org,oss.qualcomm.com,quicinc.com,holtmann.org,gmail.com];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[brgl@kernel.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,mail.gmail.com:mid,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 9A8F466724B

On Wed, Jun 10, 2026 at 9:36=E2=80=AFAM Xiuzhuo Shang
<xiuzhuo.shang@oss.qualcomm.com> wrote:
>
> Hi Bart,
>
> The main change in v2 was the commit message =E2=80=94 I added the motiva=
tion and an example log line as
>
> Paul requested on v1. Carrying your Acked-by (given on v1) forward was ju=
st to avoid losing it. So
>
> v2 wasn't sent solely to collect a tag.
>

Well, I don't know it because you didn't add a changelog to v2. Please
add something like "Changes in v2:" in the future.

Bartosz

