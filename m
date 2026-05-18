Return-Path: <linux-arm-msm+bounces-108251-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eDbbEShJC2o7FQUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-108251-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 May 2026 19:15:20 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id DF3F857180A
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 May 2026 19:15:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 20A44301436A
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 May 2026 17:15:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 15B3A382390;
	Mon, 18 May 2026 17:15:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="mm9hTExn"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-qt1-f169.google.com (mail-qt1-f169.google.com [209.85.160.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 527B6382F31
	for <linux-arm-msm@vger.kernel.org>; Mon, 18 May 2026 17:15:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779124511; cv=none; b=X+XW/i0nQ9a4g05WGEb92Jsd2sPOGXWknhoqzUpJNUK3DazrGfX1VKr4BRmezSrK+p6zbpZYS6GVOmX+VKAUBQk4kyd/uWVkr6+Q0CUWCLiqmcxXeRhOXeR50MszFkE6Fj+pO6pmkeiTct4Rwgc5jf53Sjjkb6yiOKiik2jWfdA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779124511; c=relaxed/simple;
	bh=sOJxMZchOv0WgrC6+6PbayYyvo16Eg4LJgmrDhVE/y0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=F4tESGavlYJPZ9GKOl2FWAy7McNCAy6RKIESWWNUUyZcIyhR4QZjMi8auRNX+hlJCzEvtTQ9to5d5OhUXGLqrlrX+hqyf89qwrK2bzRyABrf3Lc+IgnbUTw88Il9rFVlZjWRzmgLjOoZOEeOzLNPg9uSpZgt6YdQfZyn8dvsKjE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=mm9hTExn; arc=none smtp.client-ip=209.85.160.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-qt1-f169.google.com with SMTP id d75a77b69052e-5102582e23eso22202351cf.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 18 May 2026 10:15:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1779124508; x=1779729308; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0QbJKB2lw5vG8p4X0Zp1dtcwqkjeJLsy09spRbfmWxU=;
        b=mm9hTExnfF+2r2s8jzDBgvHvJeJ1IFWPnnxSJgd6WQUrWB6gDJtVudsOTuUhclRP9x
         RBbySeBJUJvSqMk6OV709roynaEKyXi0tdxs7PCaUbebNmJ0KaZTJXYbMxbvnutH90ZS
         6AAaS3dFcShKdCmUMak5M8uz1bQD6n9H37ZbE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779124508; x=1779729308;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=0QbJKB2lw5vG8p4X0Zp1dtcwqkjeJLsy09spRbfmWxU=;
        b=Wk9Oj09SVIFwxjrPYcpjQmg7p7rLGeYTElTXCUs+9VhACF2RdGuIkCb955cjXdfFB0
         lLVzd2VZUDblq+8g8R1EAgxANbQqpC0MnyGXzgg20n5cw1tCcfpwNdHQyvjRDZlL2iHk
         nAfxKZ0cVzqhv3wdEuC1RQ35D3AO5A4rq8atiVhMFfjZ3NzpcNJwzwDl3UfHkN3b9fjg
         pyDACWTCMCxXZcwHq0doGzRNnxZTRW1MuOojIbHQXLIBdWvqmtU+4xZ7fr3x+pX3IO90
         LAl5w4tgDNddLI41g/yNYd9gHC5tGzFR7jlva/8iHprZaHpL32/8y3liYwy1oXTsOuHE
         lOCw==
X-Forwarded-Encrypted: i=1; AFNElJ9/4B+evnwYn6+7z4BVz7vLlTgpN6rV6E5TKP5W0bgvs8a/QVjw+xbJ45yQ1+E9ezMnD4dHcIa+GDIRKIug@vger.kernel.org
X-Gm-Message-State: AOJu0Yxh3qaJ8avCmrN9RfkzPmVuX+HC5IwvibXcnWGqQfppxigsA/G5
	ozxbzi3D8WYk1Z0Cp+WRPYUz+VL+wcwNpJ62k+Wberh+c3y3v90i6BOsOxYx4Ryp3fj1xmOsGBH
	LRjI=
X-Gm-Gg: Acq92OFQOoG7g4H72Wu3kN68CHb+8bipUzOz+6vOKWJdNQ8R5Ep4g2qenPARdhLBN/G
	6yvxRUh2GKiXLWbSIhzJLL5F2DAUiUIZ44GKddm4LAK60UCyqXHHlcDTDgRrm5flxFqfQxcrqDX
	lFJwSpIHAUnFpXI+pusGC+Ueo9iREvbYpi6CdZDmS+dW9sJaHuaRiycSoYtDvqxaqPCl8PA5e6R
	XkcUShTwC4R0MqWvDARCvZ+obSsWLTPblAMOK6AHqz3myr3a/LEk8Ti8hN2pwHdjVY14FoN4gjI
	e6ayI3Uuu+eKTlWcsz3GqBbft1ywD9sFe0S7aCXZxrcWL/CEgkVITMPXc3cT1/D9R9/uhVEa/RS
	UFPsbUFn3qqrGAZGnPgNGOALGSpnBNe7gR/HrHt1QGZT/bjLy9bbAcXthNT7GeW3gkwJlBojj76
	imjQBFrTwLk5DATcFc15+2Tak7JRHW90D6h8CFMBI3C/asOFISkfD0hK2gYJ3EWzBnQdF+JjhCf
	/X/6eQpxqQ=
X-Received: by 2002:a05:622a:4184:b0:50e:defb:77db with SMTP id d75a77b69052e-5165a01210fmr210914351cf.10.1779124508150;
        Mon, 18 May 2026 10:15:08 -0700 (PDT)
Received: from mail-qv1-f46.google.com (mail-qv1-f46.google.com. [209.85.219.46])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-516456b6cf7sm138682161cf.8.2026.05.18.10.15.06
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 18 May 2026 10:15:07 -0700 (PDT)
Received: by mail-qv1-f46.google.com with SMTP id 6a1803df08f44-8b4eb1fd5d0so35313056d6.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 18 May 2026 10:15:06 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ856n82KiobjT57uQ4IxXkhe/86UE5BB3uE2ztfh5IAzT7h/tNDBkSsiRMMO67yzfCnivH5pg1Vot3ldKmB@vger.kernel.org
X-Received: by 2002:a0c:ea46:0:b0:8be:1620:a95a with SMTP id
 6a1803df08f44-8ca0f67c3d3mr193127066d6.27.1779124505831; Mon, 18 May 2026
 10:15:05 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1778822464.git.harrison.vanderbyl@gmail.com> <9e749a3a483e4a3c684eac3ee6a4b241c94a0362.1778822464.git.harrison.vanderbyl@gmail.com>
In-Reply-To: <9e749a3a483e4a3c684eac3ee6a4b241c94a0362.1778822464.git.harrison.vanderbyl@gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Mon, 18 May 2026 10:14:54 -0700
X-Gmail-Original-Message-ID: <CAD=FV=W-T3gnhsPY1TPaShBcj6MtXhPntAm=ecZ8pK9aKg=LFg@mail.gmail.com>
X-Gm-Features: AVHnY4IADEBlAYng-Vk8ynfnLq-alsFZFnj4hN5gU5NdDYItYKJ7p8Mb41QcTng
Message-ID: <CAD=FV=W-T3gnhsPY1TPaShBcj6MtXhPntAm=ecZ8pK9aKg=LFg@mail.gmail.com>
Subject: Re: [PATCH v2 5/7] drm/panel-edp: Add panel for Surface Pro 12in
To: Harrison Vanderbyl <harrison.vanderbyl@gmail.com>
Cc: andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, 
	Herbert Xu <herbert@gondor.apana.org.au>, davem@davemloft.net, 
	neil.armstrong@linaro.org, maarten.lankhorst@linux.intel.com, 
	mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch, 
	jikos@kernel.org, bentiss@kernel.org, luzmaximilian@gmail.com, 
	hansg@kernel.org, ilpo.jarvinen@linux.intel.com, 
	Jessica Zhang <jesszhan0024@gmail.com>, linux-arm-msm@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-crypto@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	linux-input@vger.kernel.org, platform-driver-x86@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[chromium.org,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[chromium.org:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-108251-lists,linux-arm-msm=lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,gondor.apana.org.au,davemloft.net,linaro.org,linux.intel.com,suse.de,gmail.com,ffwll.ch,vger.kernel.org,lists.freedesktop.org];
	RCPT_COUNT_TWELVE(0.00)[27];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dianders@chromium.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[chromium.org:+];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,mail.gmail.com:mid]
X-Rspamd-Queue-Id: DF3F857180A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi,

On Thu, May 14, 2026 at 10:43=E2=80=AFPM Harrison Vanderbyl
<harrison.vanderbyl@gmail.com> wrote:
>
> Add an entry for the BOE NE120DRM-N28 panel,
> used in the Microsoft Surface Pro 12-inch.
>
> The values chosen were tested to be working fine
> for wake from sleep and hibernation.
>
> Panel edid:
>
> 00 ff ff ff ff ff ff 00 09 e5 c9 0c a0 06 00 07
> 0a 22 01 04 a5 19 11 78 07 9f 15 a6 55 4c 9b 25
> 0e 50 54 00 00 00 01 01 01 01 01 01 01 01 01 01
> 01 01 01 01 01 01 62 53 94 a0 80 b8 2e 50 18 10
> 3a 00 fe a9 00 00 00 1a 13 7d 94 a0 80 b8 2e 50
> 18 10 3a 00 fe a9 00 00 00 1a 00 00 00 fd 00 18
> 5a 5b 88 20 01 0a 20 20 20 20 20 20 00 00 00 fc
> 00 4e 45 31 32 30 44 52 4d 2d 4e 32 38 0a 00 0a
>
> Signed-off-by: Harrison Vanderbyl <harrison.vanderbyl@gmail.com>
> ---
>  drivers/gpu/drm/panel/panel-edp.c | 1 +
>  1 file changed, 1 insertion(+)

Reviewed-by: Douglas Anderson <dianders@chromium.org>

Pushed to drm-misc-next:

[5/7] drm/panel-edp: Add panel for Surface Pro 12in
      commit: 02f48ffdf96c83ca3e6600fe5dec872b34b68775

