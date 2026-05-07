Return-Path: <linux-arm-msm+bounces-106391-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QGtAD36S/Gn3RQAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-106391-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 07 May 2026 15:24:14 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CE624E9320
	for <lists+linux-arm-msm@lfdr.de>; Thu, 07 May 2026 15:24:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 30DD230014AD
	for <lists+linux-arm-msm@lfdr.de>; Thu,  7 May 2026 13:19:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BB6833F20EB;
	Thu,  7 May 2026 13:19:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qvY9cOSH"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91F1B3F7876
	for <linux-arm-msm@vger.kernel.org>; Thu,  7 May 2026 13:19:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778159960; cv=none; b=CQPreiEeZbwrdJHL32wR4PAEStPDN2bdPPyJ/lunXOqDSZGFV2T3eVErJ1+sSedsQbmGS+oGiM0UK0Ri06ZAUOv+xXuMcOV/D3J56XI/3ht9pbe3n3SDz/wOrp87jTYpr6LHlJkpo7AouJF+tfWqWgATzTIkVYiMUuoNyOyTa0I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778159960; c=relaxed/simple;
	bh=fPwNhyRAwFMgDzAdRmQIq6ca+zK6juoRQZWfylMk6Z0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Rb0aGb5zs4dQ6idNMNQPJFrP07GzeOFM17PuzbIJtgZ40pXJjfzUeGtlNLSSnZTRRQnEytAerGHnNLxihP/McpIxwqcCIKSg3II7jfT+7a7bGhY1OZ899ATgJl8NukV6jAtqg716DndiOMuPIIolISMFgZTyWCF8tJk1MIKn0zE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=qvY9cOSH; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3DB4DC2BCB2
	for <linux-arm-msm@vger.kernel.org>; Thu,  7 May 2026 13:19:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778159960;
	bh=fPwNhyRAwFMgDzAdRmQIq6ca+zK6juoRQZWfylMk6Z0=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=qvY9cOSHYhoEotDehkc1mWryJavx2wv8OPJSLdv2HT91Q7TAqNWBLMdfU4C/SkEyq
	 1lYavLyPWxS2zg1cJMzJNiyT8cILbLTQ4NgihBueBFxdGRtdAUmjDg5G+Wi4MXBk2y
	 e4GlIZ9hleoT0RcFE9Np64dN8i0JlLS7kw6Bf2AWIZEGK2VHAOoDF2mhQzc3l0VGjc
	 foElrHyf/E5blge2ZvOPrSY5z5Q/TzPzBiAQhkLLTjAMQ/6BWQZ4EFfgvTFprkgAgx
	 Ga5IX6L5g59FrMXFEyyw1Hv+tI+okuLNT1OAKzlbem5nifl/26FSz7sBRnjQ3Mg0D+
	 M1sDHvkC1ZHVQ==
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-5a86c1fe573so755201e87.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 07 May 2026 06:19:20 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ8HfznBRvYR9etSYzbasiGMNEF56UnEy8JCb36zvEsdm51iaD3PLtBAJwQiTeYA0uRfrnD18KCbZJHNzwsJ@vger.kernel.org
X-Gm-Message-State: AOJu0Yy4s+LIiyvOzwN1F6MMD1ghAZMHBdX+vZS42RFQbFEW8c6TvSwf
	Q6cBJuAdGCfdTcfN5Ho3Bki1Wydqsy7DUwzuiJ516DkcrODaGlkonq8DjKQpj4GcCkC6+4xrnVS
	MP6LrOdsr+WOpJPbQnbimWbtTJ++JbGs=
X-Received: by 2002:a05:6512:3f24:b0:5a8:722d:801e with SMTP id
 2adb3069b0e04-5a887ced6fdmr3202505e87.39.1778159958992; Thu, 07 May 2026
 06:19:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260506090006.10905-1-bartosz.golaszewski@oss.qualcomm.com>
In-Reply-To: <20260506090006.10905-1-bartosz.golaszewski@oss.qualcomm.com>
From: Linus Walleij <linusw@kernel.org>
Date: Thu, 7 May 2026 15:19:07 +0200
X-Gmail-Original-Message-ID: <CAD++jLkoTFFh34fshdwmhFce-3Lw6G1DQgK9ozMps2_9uJ4+Tw@mail.gmail.com>
X-Gm-Features: AVHnY4KWCiHOlPju_5c5S-XjpeQAtRUmN-36ezU6K_BDyp9OPaiyyVLssuyiwCo
Message-ID: <CAD++jLkoTFFh34fshdwmhFce-3Lw6G1DQgK9ozMps2_9uJ4+Tw@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: qcom: nord: remove duplicated pin function
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Maulik Shah <maulik.shah@oss.qualcomm.com>, 
	Shawn Guo <shengchao.guo@oss.qualcomm.com>, 
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
	Pankaj Patil <pankaj.patil@oss.qualcomm.com>, brgl@kernel.org, 
	linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, kernel test robot <lkp@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Queue-Id: 9CE624E9320
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[kernel.org:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-106391-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linusw@kernel.org,linux-arm-msm@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,mail.gmail.com:mid,qualcomm.com:email,intel.com:email]
X-Rspamd-Action: no action

On Wed, May 6, 2026 at 11:00=E2=80=AFAM Bartosz Golaszewski
<bartosz.golaszewski@oss.qualcomm.com> wrote:

> The qdss_cti function is initialized twice in the nord_functions array.
> Remove the duplicate entry.
>
> Fixes: c24dd0826f06 ("pinctrl: qcom: add the TLMM driver for the Nord pla=
tforms")
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202605061633.BJLI5voT-lkp@i=
ntel.com/
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

Patch applied!

Yours,
Linus Walleij

