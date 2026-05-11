Return-Path: <linux-arm-msm+bounces-106964-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MGxLE+v0AWoFmwEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-106964-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 May 2026 17:25:31 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E3D655111EA
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 May 2026 17:25:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id E6BCD300B1FF
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 May 2026 15:16:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A72792D5C83;
	Mon, 11 May 2026 15:13:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="AWSGSXCd"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 088651448D5
	for <linux-arm-msm@vger.kernel.org>; Mon, 11 May 2026 15:13:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778512429; cv=none; b=dZLlq9F+lriKzOoJ8YZwqHrRzMHfu4/uNkqHkR+GsLCg3j7CVpFJ8fQxd1jElkzMh1LMMKbMw5NBJ8nEBHuwS+F+31MKkx86INOIEFwKEGbevh296QT6LtFDMShLTF5PA3zqGX4zcyFPsCLSWeV8212B+vwAOD+7Obp2PQUwUsI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778512429; c=relaxed/simple;
	bh=FkQxkdx6NpWn1SXtNQA4F8xiEiWEC/338KGmSq+nuJY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fb6s050lqwb2G5ShJiyD2S5PA0HZE2vy1ZZgxMA+yNVjPNcNMld3gzQjyCTdO3iujzLu/lxMj5i6BNLvhorvcnuu7sHu6bvutPvxal85vbOhS4aPmXIqrzHz2z6FCph5+PzD6R+lcCzj5FiVJk+w9HZ36aox/H7AIYIqUaJJlUA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=AWSGSXCd; arc=none smtp.client-ip=209.85.218.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-bd0fc4c336eso143753266b.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 11 May 2026 08:13:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1778512424; x=1779117224; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=l9pYvX3asH6XTX0dQ1uMh3EDUuzB4crPP1Ft5gtsnFY=;
        b=AWSGSXCdlp1pp7hiEx8RVdrVGEfM3J7XlKEjn0yw4mBKU2XJ6V1ju85nmmM1XXEKuU
         wgU8b3wCgCMkbxDhcJ6nHpjFYUPkeQpZBLbG/QcRdMCAyGCpkVUZ+nFe4XDK1zzIFpdK
         FKfW0Jteb64pN2/m9J6+xBiWyetkt9uUh+taI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778512424; x=1779117224;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=l9pYvX3asH6XTX0dQ1uMh3EDUuzB4crPP1Ft5gtsnFY=;
        b=SXS7s/wP/SwfxNaNiADOoVXJ6cTW3XNn2+2wolMpnoT+5XMe924G5BTgDu+s++mFjb
         how9mlk9GHG8FN7Lw/dPwpV+Sg0vDdGu/tehoREtxvz8GngoOtKP3HMm121Zz5CtT1I/
         W2ZXgkPqIpzNMmvlAtD90mJdH5SM5FQgwnFwlgRBWMIfZZZx95lddEOpHFWWBuqA/GWY
         eSs02m8qwW47T7vslvC6z3OIRcrt2RSaZGAZTDJs8MB0YkHsdaP9arMCbFm5T2bqmHzt
         2FYRtoLOmEdNK3/7vP+m068goIa5EQk9afrI3M8sTTo6JMuSliLJInDcC+UX8SciFFP+
         P7KQ==
X-Gm-Message-State: AOJu0Yz/k/xCLsMQUOqNcxGEtdPuiFyBYG+kLVwv6ZfIf9B9nJAkVtjW
	SdNE7yrExiYsccfp/9dv0/hHTIy2xSILZlbpMhlv2srFgfHJHsBdYl/47vemc3lFJlrJbzWxE7i
	3g26B/A==
X-Gm-Gg: Acq92OEX4GRvwfl7CYNPkLG0Io69mh31O8dqeTwCnbpWjHRG2Aq+upizv6eb7oh6KsD
	juJ7r9IPxAcCa29m0wbPXf+19ICukx+UxwFPC/SzFxEjejXYoweCPBG98gHxrDeaYXSzB6lgrDx
	gm44edWM0XXtfIL+8NU5lt8MnyOEK02ahze+79pxtyZ6Dqi9xzMkQPABR0AD6s6YtZulSfn9KDa
	Jy5RXL/PvpLt03QgLUD/GxVdhNFiOWyCtGqyORGCHPn7TNUUcSUgJY1pTJoHrYdFUpYWzgkdGEG
	A/remOb/1CUFqq6WOLe2tZ6y/CgLXXwS5QYj2JWW2tEVK5BBYtFh6Dy/jeniso53Ae6Z4Eh6YuC
	QL6/omKA5U1iJQPanfz3Ss4gn3oJIgMH96wLGgQmiP7zPgbYwxSW3gxFYPPk9ft8NrhkRDsYo23
	9O23OPn5TDuY5NTNx3dFyxcZL/qI6qpSwIcklTw8l8Y+/NrixcpjKzXs7TDpHxP2Qxws+MlBQK
X-Received: by 2002:a17:907:868a:b0:bcb:ea69:39c8 with SMTP id a640c23a62f3a-bcbea694c4fmr617114566b.38.1778512423692;
        Mon, 11 May 2026 08:13:43 -0700 (PDT)
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com. [209.85.221.53])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-67ef0e0d132sm3922590a12.20.2026.05.11.08.13.41
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 11 May 2026 08:13:41 -0700 (PDT)
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-43fe62837baso2301258f8f.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 11 May 2026 08:13:41 -0700 (PDT)
X-Received: by 2002:a05:6000:4312:b0:451:2157:6291 with SMTP id
 ffacd0b85a97d-4515dc80b1dmr39799947f8f.41.1778512420550; Mon, 11 May 2026
 08:13:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1778498477.git.harrison.vanderbyl@gmail.com> <44d976999b592fb4993bd95238e56cc4d9e228f7.1778498477.git.harrison.vanderbyl@gmail.com>
In-Reply-To: <44d976999b592fb4993bd95238e56cc4d9e228f7.1778498477.git.harrison.vanderbyl@gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Mon, 11 May 2026 08:13:28 -0700
X-Gmail-Original-Message-ID: <CAD=FV=VJ_-OhOAnACsmQ3RzQgQ_0ip4HZU6Fv8hUN77sveQT4Q@mail.gmail.com>
X-Gm-Features: AVHnY4KsV6EE8Of350PAcbRuc32IkH8Mw1KggIyzHzpCciYVn1nsxyj9zV3Q38U
Message-ID: <CAD=FV=VJ_-OhOAnACsmQ3RzQgQ_0ip4HZU6Fv8hUN77sveQT4Q@mail.gmail.com>
Subject: Re: [PATCH v1 6/8] drm/panel-edp: Add panel for Surface Pro 12in
To: Harrison Vanderbyl <harrison.vanderbyl@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, Neil Armstrong <neil.armstrong@linaro.org>, 
	Jessica Zhang <jesszhan0024@gmail.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Queue-Id: E3D655111EA
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[chromium.org,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[chromium.org:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,linaro.org,gmail.com,linux.intel.com,kernel.org,suse.de,ffwll.ch,lists.freedesktop.org];
	TAGGED_FROM(0.00)[bounces-106964-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[chromium.org:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dianders@chromium.org,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCPT_COUNT_SEVEN(0.00)[11];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,mail.gmail.com:mid,chromium.org:dkim]
X-Rspamd-Action: no action

Hi,

On Mon, May 11, 2026 at 7:42=E2=80=AFAM Harrison Vanderbyl
<harrison.vanderbyl@gmail.com> wrote:
>
> Add an entry for the BOE NE120DRM-N28 panel,
> used in the Microsoft Surface Pro 12-inch.
>
> The values chosen were tested to be working fine
> for wake from sleep and hibernation.
>
> Signed-off-by: Harrison Vanderbyl <harrison.vanderbyl@gmail.com>
> ---
>  drivers/gpu/drm/panel/panel-edp.c | 1 +
>  1 file changed, 1 insertion(+)

Please follow the convention for recent similar patches and include
the EDID in the commit message.

-Doug

