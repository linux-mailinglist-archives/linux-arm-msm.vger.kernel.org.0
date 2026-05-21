Return-Path: <linux-arm-msm+bounces-109133-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CHBkLZU7D2qZIAYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-109133-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 May 2026 19:06:29 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 54FAC5A9DCA
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 May 2026 19:06:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7E9FB32C5789
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 May 2026 16:22:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BEF2A348860;
	Thu, 21 May 2026 16:21:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="Zv6M4JX4"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-vs1-f42.google.com (mail-vs1-f42.google.com [209.85.217.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61C3F374E67
	for <linux-arm-msm@vger.kernel.org>; Thu, 21 May 2026 16:21:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779380478; cv=none; b=V1WNeV7KkZVwX8vD5fozT7kP6/QJ+zBA/4m0aDPGLQBP5bNBvAmk/rZkhrbpMRxEIJqaSTqj3WyKddfdoc4fqwEKtIBqSxnggBMQGVuzdUoYToDjMCVYRBlEcFBbWD7y5QpckyO3+i9Gl4KccUZTsE/t1B8Z1aZFd8xDDmHD4w0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779380478; c=relaxed/simple;
	bh=TA/NhmMxKYmBehgXdZK41pkzgulG3RVOxZ3XCI+/ZPg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=KCTSl11+oZxIXyxP5UXSQUzAWzaZqNy0AqU3hC2Cv/oJeFX/FFBoHr0EYV+5gwopVlsBGc9U+VNfRCO9uvydu25zlxTv3yHTsff3RF7Br2OUx95d8ENjz2jJWWyDGA/5aqt+bQbv+k00+hSoPEuSZzdVnVGqnn5BTBgTPBEV/4Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=Zv6M4JX4; arc=none smtp.client-ip=209.85.217.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-vs1-f42.google.com with SMTP id ada2fe7eead31-6314d2e31d6so2168803137.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 21 May 2026 09:21:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1779380476; x=1779985276; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=H7TyF/EJGvHCS2MVisqdtPtRiJMUTpIaFtZ3CYa/KXY=;
        b=Zv6M4JX4DHrwMb7OagecP661EkZNzgqPb+lN3PYcpQhlMsctMexZfCQ6gv+FmG3TQN
         gHYFrQXprdPMF09Ri2hkHx53pPjFLS7Q1BjphBSLj75jZNbJqqIYC/3xMQePRgelH9if
         /W5FZAL+yy0Zac5GwN/pAmrgvBAWnGTJ0XVX4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779380476; x=1779985276;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=H7TyF/EJGvHCS2MVisqdtPtRiJMUTpIaFtZ3CYa/KXY=;
        b=caDUTnnamoumSWqO3Ef7NiGNVd6a0KacEwQAESvUescB0bfsJfXayHzBBnS1c5Jll/
         qj8d210AQzRuWVRRCHqXKp+gnspLbd+O3ugibOQegqH6T53dBxfL/plreTYlXkNeuU85
         Gbxk5KYypyb4QkuwTCY87fr/95RlFYCjvb8Hui1Gm0sa0TtztYWMGBH1jx5u87CfJKNC
         d0tPtiCLYDM/XZfYpe6jQiOGhxaqfUHZQWN99Bkf/lM4rUT1fpYEHWleGU2aDirD47qV
         y9KvE5UDgQwyR6AaoZIWlDQmsW9brRsI+R1L7P9gXHV3yLWf+B2E8zlIQL2pGIwjBGzb
         BZKg==
X-Forwarded-Encrypted: i=1; AFNElJ8/Qbmj0lTWcQRraLUImrhVSqiqP5/SsW7WQ5ZR29uIKKIAjJl2DBcvqRAcOO+M9yS8ljZIAnyytetFlY5X@vger.kernel.org
X-Gm-Message-State: AOJu0YygkyOp8OE3lvPfeLdhIpsAwHzuJEsnXmoxhFE5gMHegYXe5Z1p
	/rREIrUZlBSQLq+mBTeyvdpID3J+6/zCMQNM/bugjE5rHSrEFZkneI7HAmvpfopRD2e2L+aRLL4
	sM58=
X-Gm-Gg: Acq92OHk/CHeAb1SK7yyksAeVMfzggLSUuELWjRx3CvM1A6vY6iQqO8GyISNtitl7q4
	Ist7pxnoovw8oQPRO52ydQONib6NYRwE48m75ej6BZc9PzmN7UIdC7Hd8JZVErPNIRsk+PbrrKn
	iVePFIfRKYvqpZG3Z8a1ayzKwU+GG6WvqzpIDH/1RZOp9FhU0Ab6Qnbv79D5hKU2yL+bPjD5rLl
	Tq7vPzRa513ErULoyRHdBJ3L1d49P8mL19VeVDzVYM0vk2JeAcoSDkZBru5jms/xKwKapGtH0J7
	7p8bE+WXB5y8TjRhDzoKMBndR/qfyamQ9vx2UNTsZDKenEwNzOFTUYX6TxYl0TPLOcgN2tGfF6g
	Sxyi/ybDHf0rxmBIhuC9QjLO9AMH2VtTJOZYzcdS85f7laeSZvc/J6fGm+sw5ReEXeo2jIv5Afn
	lcA5SWCSi67HVtdPayNZt6SyXpLfyr/JCtI6YfBZ39H1KAyb8zrqrTa6FJveYku36luP8eQL7kd
	azp
X-Received: by 2002:a05:6102:6441:b0:631:ea6b:23e1 with SMTP id ada2fe7eead31-6739b4fec55mr2432801137.23.1779380476229;
        Thu, 21 May 2026 09:21:16 -0700 (PDT)
Received: from mail-vk1-f172.google.com (mail-vk1-f172.google.com. [209.85.221.172])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-679eb834beasm1142789137.1.2026.05.21.09.21.13
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 21 May 2026 09:21:15 -0700 (PDT)
Received: by mail-vk1-f172.google.com with SMTP id 71dfb90a1353d-57533363201so2002904e0c.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 21 May 2026 09:21:13 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ/4QPSZ0VUfyAZkmCQlDCozV3zs6z+4ejYjet0E1+RidxDXpmyZrW6cKZB9Xc4NQ+i+NwpJbOf2yOojE3xV@vger.kernel.org
X-Received: by 2002:a05:6122:909:b0:573:a779:62cf with SMTP id
 71dfb90a1353d-5842700f977mr1997646e0c.7.1779380472617; Thu, 21 May 2026
 09:21:12 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260520-surface-sp9-5g-for-next-v1-0-9df52552bf87@gmail.com> <20260520-surface-sp9-5g-for-next-v1-1-9df52552bf87@gmail.com>
In-Reply-To: <20260520-surface-sp9-5g-for-next-v1-1-9df52552bf87@gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Thu, 21 May 2026 09:21:01 -0700
X-Gmail-Original-Message-ID: <CAD=FV=Va8xWkE3vSPG2rDnDqHHjjQhnGvQFbDCQ1gy7K9dOokg@mail.gmail.com>
X-Gm-Features: AVHnY4Jr92XPJH5Azjlc2EoNETWBXe5PFgKtRtjwUT48hIrAsQVbIHC8sZGU4zw
Message-ID: <CAD=FV=Va8xWkE3vSPG2rDnDqHHjjQhnGvQFbDCQ1gy7K9dOokg@mail.gmail.com>
Subject: Re: [PATCH 01/11] drm/panel: edp: Add LG LP129WT232166 panel
To: jerome.debretagne@gmail.com
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Jessica Zhang <jesszhan0024@gmail.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	Krzysztof Kozlowski <krzk@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[chromium.org,none];
	R_DKIM_ALLOW(-0.20)[chromium.org:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-109133-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[linaro.org,gmail.com,linux.intel.com,kernel.org,suse.de,ffwll.ch,lists.freedesktop.org,vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[18];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dianders@chromium.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[chromium.org:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,chromium.org:email,chromium.org:dkim]
X-Rspamd-Queue-Id: 54FAC5A9DCA
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi,

On Wed, May 20, 2026 at 9:40=E2=80=AFAM J=C3=A9r=C3=B4me de Bretagne via B4=
 Relay
<devnull+jerome.debretagne.gmail.com@kernel.org> wrote:
>
> From: J=C3=A9r=C3=B4me de Bretagne <jerome.debretagne@gmail.com>
>
> Add an entry for the eDP LG LP129WT232166 panel used in
> the Microsoft Surface Pro 9 5G.
>
> edid-decode (hex):
>
> 00 ff ff ff ff ff ff 00 30 e4 b2 06 a1 25 10 00
> 00 1f 01 04 a5 1b 12 78 01 ef 70 a7 51 4c a8 26
> 0e 4f 53 00 00 00 01 01 01 01 01 01 01 01 01 01
> 01 01 01 01 01 01 00 00 00 00 00 00 00 00 00 00
> 00 00 00 00 00 00 00 00 00 00 00 fd 00 18 78 f1
> f1 48 01 0a 20 20 20 20 20 20 00 00 00 fe 00 4c
> 47 44 5f 4d 50 31 2e 30 5f 0a 20 20 00 00 00 fe
> 00 4c 50 31 32 39 57 54 32 33 32 31 36 36 01 23
>
> 70 13 79 00 00 03 01 14 56 16 01 88 3f 0b 4f 00
> 07 80 1f 00 7f 07 55 00 47 00 07 00 03 01 14 56
> 16 01 08 3f 0b 4f 00 07 80 1f 00 7f 07 2b 08 47
> 00 07 00 00 00 00 00 00 00 00 00 00 00 00 00 00
> 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
> 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
> 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
> 00 00 00 00 00 00 00 00 00 00 00 00 00 00 2c 90
>
> Signed-off-by: J=C3=A9r=C3=B4me de Bretagne <jerome.debretagne@gmail.com>
> ---
>  drivers/gpu/drm/panel/panel-edp.c | 1 +
>  1 file changed, 1 insertion(+)

Reviewed-by: Douglas Anderson <dianders@chromium.org>

Touched up the subject line and pushed to drm-misc-next

[01/11] drm/panel-edp: Add LG LP129WT232166 panel
        commit: 31ac8899d1a9284fb50bd42c409f224788220e27

