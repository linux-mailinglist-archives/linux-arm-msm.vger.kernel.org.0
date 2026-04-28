Return-Path: <linux-arm-msm+bounces-104937-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mP+3HuWG8GnuUQEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-104937-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Apr 2026 12:07:33 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C4AEE4823B2
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Apr 2026 12:07:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C997B328C614
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Apr 2026 09:28:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B72D638E5D4;
	Tue, 28 Apr 2026 09:27:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MEZHm19g"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A6E838A71F
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Apr 2026 09:27:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777368465; cv=none; b=KV46jTUFv0tvYMtPdFsWTbDvM7wr+nic6/jZYkG/k/tbDuwLa4P+QHFqLmXKy1eDaG3cS8boqx7wEOWd9SmnsL0zirp/9etzfERm5xFWH05HLHXFvgAJ2W7hex8e/s/O2/yj0nMqe5LEReEF629fDNMf07T4kkghd1pNTitH3EY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777368465; c=relaxed/simple;
	bh=JLPg9I2TfzrfbOLy6uXjaM76yTogNYLPST+TWWZ8VZc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XamU9iWXY+CN8Q9AA3769Mxc2FQYaCqMS8A64fp3zsNZ3NB64CTTtGjsNtPQWg60AMsMfb6JrwrKRgbel6Ke4NvBSn/8Eu/hNf6E+NKmX8Y7wTcax1teITFlmqzSIwJMYcmaPPUkYuKIeXi+hG13KyCsoDLIS9T1XfnYygP9vbs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MEZHm19g; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 34EEFC2BCB8
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Apr 2026 09:27:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777368465;
	bh=JLPg9I2TfzrfbOLy6uXjaM76yTogNYLPST+TWWZ8VZc=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=MEZHm19gvZpwO9u3ndneAVtCNM4tyEd/w6l1ikZE8f7b+7m8O8nrIBHZx3cq2a4SP
	 WErQQtPfw3VpSnkv6JOBohBk4Dvw+FZUrs8gPyyuaDMiqiXL34VaT9t3kgHFqKR7j6
	 XGjhKCsZAdsX7df+bmHEvpl0uTjkPUpPi0DiFu+2ZTlumJOnI+sYfR3dUUzjBXXc4G
	 mQ7begPvK17AGMAgjyUvAWQBpTxa7FyMM1OpS7F/DlH27LvXwjgFUuOcUJiyiaNIvJ
	 uzTIX5eE15cPAkjhZycxsRAbJEVCwZ1nQ/HpHWMVjOmemcfxK7Ls3T+tw8D6136E5t
	 1ZPsx2nC9AUnQ==
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-5a3d1561e38so9189206e87.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 28 Apr 2026 02:27:45 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ+oBAx9Dy1wsnBSw0vDTwPAVEV8bWLqHNBATwRsYmzzrO7yeaM3axjSI7Jb5LSU/qTUD6SbaRGc94pmMVkI@vger.kernel.org
X-Gm-Message-State: AOJu0Yz7s8SBjhF/f13FWMm0J9j/OmoAE6iNAV9HWWExguHYqG1m1MYp
	XX4jAtX7WabkEXtEZKiI0qNM8luOsq0jdt6BXtSEUOU0U6bwten6xHIiNwjXsxzZvmXGFo7LSWc
	0amuZraT3hWylc2xgdpL9dEhxiqBRm9s=
X-Received: by 2002:a05:6512:39c9:b0:5a2:c914:8af7 with SMTP id
 2adb3069b0e04-5a74641075dmr832234e87.5.1777368463886; Tue, 28 Apr 2026
 02:27:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260415-ipq9650_tlmm-v1-0-bd16ccb06332@oss.qualcomm.com>
In-Reply-To: <20260415-ipq9650_tlmm-v1-0-bd16ccb06332@oss.qualcomm.com>
From: Linus Walleij <linusw@kernel.org>
Date: Tue, 28 Apr 2026 11:27:32 +0200
X-Gmail-Original-Message-ID: <CAD++jLmxJUPNjXkFi490GSPwB-bHs4tdJmMFwxyCX07N=kxGHA@mail.gmail.com>
X-Gm-Features: AVHnY4ItGCSX_rPtMRPswLMsDRdapaHild8dXsI33WcyNIcmsp3xn1n67AlJGXQ
Message-ID: <CAD++jLmxJUPNjXkFi490GSPwB-bHs4tdJmMFwxyCX07N=kxGHA@mail.gmail.com>
Subject: Re: [PATCH 0/2] Introduce TLMM driver for Qualcomm IPQ9650 SoC
To: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org, 
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Queue-Id: C4AEE4823B2
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[kernel.org:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-104937-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linusw@kernel.org,linux-arm-msm@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email,mail.gmail.com:mid]

On Wed, Apr 15, 2026 at 1:29=E2=80=AFPM Kathiravan Thirumoorthy
<kathiravan.thirumoorthy@oss.qualcomm.com> wrote:

> The IPQ9650 is Qualcomm's SoC for Routers, Gateways and Access Points.
> Add the pinctrl support for the same.
>
> Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualc=
omm.com>

Patches applied for v7.2!

Yours,
Linus Walleij

