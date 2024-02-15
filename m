Return-Path: <linux-arm-msm+bounces-11122-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id BD3E9855831
	for <lists+linux-arm-msm@lfdr.de>; Thu, 15 Feb 2024 01:10:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id B630CB287F8
	for <lists+linux-arm-msm@lfdr.de>; Thu, 15 Feb 2024 00:10:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9B2F13FC2;
	Thu, 15 Feb 2024 00:10:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="SdvlYcED"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com [209.85.208.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D01EF33D5
	for <linux-arm-msm@vger.kernel.org>; Thu, 15 Feb 2024 00:10:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707955840; cv=none; b=S4rXFpCetZyVJZSXMsvyWTnu+pp/914y4mKGvyw5AqUtBXlHYeddoUIC/90uKTJg5l+5uT2RHtldpMg64k53DWacR9XxcIU8vPuTuPL4HJnglCJRcqoLwHyJ7IVFVzb2fxWSjeKIwiG7JjV7nD2L2XG3xbSZunNHMUieJhTJEaU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707955840; c=relaxed/simple;
	bh=MoY8zd5LHcnN/kn1Yc6yYVDv8A/j96P+/bHPEamCQx4=;
	h=MIME-Version:In-Reply-To:References:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jFjriB+NoYQxlFoQWwRen7FkqqIdq+8ltTzUprYBx0xf0euaTjZ63C/hHewwYWaC1YnWG2i12YC4btXjXL7dVcRJX8dCESTkMmJiycdv4pQOhoRRyGno5GUlxjywO6mjmBjQEk593bQJkj6pY/FAY1ycRA8XVDpYQaKY31h6zoE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=SdvlYcED; arc=none smtp.client-ip=209.85.208.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-2d0e521de4eso3372911fa.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 14 Feb 2024 16:10:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1707955837; x=1708560637; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:user-agent
         :from:references:in-reply-to:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MoY8zd5LHcnN/kn1Yc6yYVDv8A/j96P+/bHPEamCQx4=;
        b=SdvlYcED3qwr7cguSIyCzChQfqvWlAKphF/UNNj8vFjYHejLKdYQmvhVZzxqUHofVW
         NBy+6NmvTUg1NCvcWyzZhZmTNz0IphCPOHCs6n8zBMwW/HX/q9pFdukp1dhETyKb5Ub/
         fbt346SdNL2yBC/3GQBdWTLVQdEhmNg+yUjlY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707955837; x=1708560637;
        h=content-transfer-encoding:cc:to:subject:message-id:date:user-agent
         :from:references:in-reply-to:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=MoY8zd5LHcnN/kn1Yc6yYVDv8A/j96P+/bHPEamCQx4=;
        b=GVi9I1CNVsHKqrmFVqb8IEHlKWcc9lFS3AKKgt46mIeWAZQndL+c0eWMKYNHaFr1j5
         MUGW1JS9vl2RA+t8IW5Yh4PAmU7qlFaZtp1hTKEOGVGqQo73O2pV+x4JutySydEnHCse
         oBTsmdmerEZ2ePPTFroGbn64DnISrL66NWX9v1Beio7TYeQLjkfr/bQC2yLnxuuqMXSq
         sHfJDCMcWjycEgOtljhVmD4rfA7Gl5YvoUqPKZ4ZznK/U4HM+YsPOd0sVS35wqnWnqs2
         GAa2hbmZ53ON0/P70hg6sqKPL+DnaUvLQr4c7XdBO1EQ1ak/cagJXLdtLBk6hdMKdCR5
         r5nw==
X-Forwarded-Encrypted: i=1; AJvYcCX10F15QqPYqms3D/J+ATUMlG8/Xz6gQhlxInFl6qKjHaFUdqn3BPpqUnhZfz1ABasJJQtfRC6pqq9rIuxv3/5qVJwfA6bZsjTUkqITUA==
X-Gm-Message-State: AOJu0YxBj96fy41LfQ4SKFXPwJGqt7QvK5bko0/OQQVsKgz/tzEK2Olp
	434K1J8n3yZsdSYvSGgSvtOfy6ZWfSgb4y6AeAo3fIjNQ8FcXDqWkQi9MxLEuJPKXrOh2g0uXOd
	nyc37PbOO2mmSGz2N7xAQwoyR2YPr0En2oG0F
X-Google-Smtp-Source: AGHT+IGyK/V+b6ReG/wqHqXSPazELs/LPvoaEiaFNzPjPQahgGbt5hpPQ9anxbvIUKEHmI0AXlLFR3H6hDqkCDMBBq0=
X-Received: by 2002:a05:6512:3584:b0:511:ab1b:1db9 with SMTP id
 m4-20020a056512358400b00511ab1b1db9mr212121lfr.33.1707955836868; Wed, 14 Feb
 2024 16:10:36 -0800 (PST)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 14 Feb 2024 16:10:36 -0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <CAD=FV=WE4bgwTWTKjPbQR9RCt-SEVZXfQtXoaXAjvTiZiMr=wA@mail.gmail.com>
References: <20240210070934.2549994-1-swboyd@chromium.org> <20240210070934.2549994-19-swboyd@chromium.org>
 <CAD=FV=WE4bgwTWTKjPbQR9RCt-SEVZXfQtXoaXAjvTiZiMr=wA@mail.gmail.com>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date: Wed, 14 Feb 2024 16:10:36 -0800
Message-ID: <CAE-0n53H-WPSr4tnmjq2Z54daKYD3PPzmxy28GsYAd29MTXiWA@mail.gmail.com>
Subject: Re: [PATCH 18/22] dt-bindings: chrome: Add binding for ChromeOS Pogo
 pin connector
To: Doug Anderson <dianders@chromium.org>
Cc: chrome-platform@lists.linux.dev, linux-kernel@vger.kernel.org, 
	patches@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	Pin-yen Lin <treapking@chromium.org>, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Benson Leung <bleung@chromium.org>, Guenter Roeck <groeck@chromium.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Quoting Doug Anderson (2024-02-13 17:17:34)
> Hi,
>
> On Fri, Feb 9, 2024 at 11:10=E2=80=AFPM Stephen Boyd <swboyd@chromium.org=
> wrote:
> >
> > Describe the set of pins used to connect the detachable keyboard on
> > detachable ChromeOS devices. The set of pins is called the "pogo pins".
> > It's basically USB 2.0 with an extra pin for base detection. We expect
> > to find a keyboard on the other side of this connector with a specific
> > vid/pid, so describe that as a child device at the port of the usb
> > device connected upstream.
>
> Can you remind me what the side effects would be if a different
> VID/PID shows up there? I know it's not an end-user scenario, but I
> have a pre-production "coachz" keyboard that's actually programmed
> incorrectly and shows up as the wrong PID. Presumably I could either
> throw the old hardware away or figure out a way to re-program it and
> it's really not a big deal, but just curious what happens...

As far as I know nothing happens besides ChromeOS userspace treats the
keyboard as "external" so things like smarter base detection, e.g.
wraparound keyboard detection or kickstand mode, may not work. I think
you get a popup box telling you the keyboard isn't the trusted one.

