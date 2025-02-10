Return-Path: <linux-arm-msm+bounces-47492-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A1A4DA2FDC2
	for <lists+linux-arm-msm@lfdr.de>; Mon, 10 Feb 2025 23:50:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DA3DE1888CFE
	for <lists+linux-arm-msm@lfdr.de>; Mon, 10 Feb 2025 22:50:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AD52B2586FA;
	Mon, 10 Feb 2025 22:50:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="Fn1WTRYx"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-qv1-f42.google.com (mail-qv1-f42.google.com [209.85.219.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB2C22586DE
	for <linux-arm-msm@vger.kernel.org>; Mon, 10 Feb 2025 22:50:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739227840; cv=none; b=Ummxk/w6Fkt/cPOH7V/93Y5WJO31ocklCys+ikZ1Q7vaMxCUstdFcSodzgok83kWPaLxgvT9Myy2i22KtA/8m+wq+M3nghfYTQrGxON6QssgBKHSBFfkGYJ80ZV+O7P8Sa0oDUccc/a0o6Ojg3JeeJrJg46yuVtGVIPhvSu+IMw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739227840; c=relaxed/simple;
	bh=5zbZ0mjlc5mJspBqAdHsl+XIcsIzXXEkeeddcLU17Ww=;
	h=MIME-Version:In-Reply-To:References:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XdjbpvnKGLpMe//7okCLkaXO1qT+fy8Nhp4Kxa4MmX2TW+n8WksdBJRzOJVf+COXV3YpIDk79jGx+e/VKndlvpg44+vxFAnKMwwYXl8b546TJt9QM1BjXVgk8RMXG8FT5bRynlURBX8Hm66r/k9yAfKNzPisRO4+7HKHc9kmgHw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=Fn1WTRYx; arc=none smtp.client-ip=209.85.219.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-qv1-f42.google.com with SMTP id 6a1803df08f44-6dd420f82e2so63139346d6.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 10 Feb 2025 14:50:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1739227837; x=1739832637; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:user-agent:from:references
         :in-reply-to:mime-version:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5zbZ0mjlc5mJspBqAdHsl+XIcsIzXXEkeeddcLU17Ww=;
        b=Fn1WTRYxcY/IF+pLgssEdlj4HJBpjPUtmFK36ZDZGyP0aHwRFj22JO9P/0V4RjcdUb
         nIlz+Z7/f892FtYCN26Fl4MB91dA/W6Gy5EtCxH1Wu2HepQ3jf5Tq9oo/RG2nz6qKQFL
         eBbEcXJ8LqbRwhIU0xYjPIqCUekQ4MytyxNtw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739227837; x=1739832637;
        h=cc:to:subject:message-id:date:user-agent:from:references
         :in-reply-to:mime-version:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5zbZ0mjlc5mJspBqAdHsl+XIcsIzXXEkeeddcLU17Ww=;
        b=mcphllMWLO4cittFrCUocDfVGKNKtZ4vcZnTfekfGcFdCoXSYkkub8N7RAoxPU/RTU
         fPQbaMcWu7HYLRnjofLwbXRn34RI9c+7/Uz7A1SQziHjZCFqeusMYssDtmgETHMoW30G
         pZIvPiLxU48w8Pcn9iSqmtIn/flgAICTfGnblzg/4XCBKFSr4woJdT/2LwhpbyJTC/hw
         bvbRPiT6TAtBl+t70cfjHu/gkqaTmPSey2Z4uPwIymeRQloC5fq+Y8qwkRFlT0Y7WLRI
         SvTFd/xGEISr//2u1lW3KY9ROWg77fBRZfkaWlOohFGXfU1lLCXLCY6p3pu9+gLRjxo3
         bSCg==
X-Forwarded-Encrypted: i=1; AJvYcCWwX9YFekUkZd4gNoF7TXP5o1024U9JwQjsd4jI7aT/pyMcHifZMc+BP/vgea12jKfTt8bx77ifU0M8M4x2@vger.kernel.org
X-Gm-Message-State: AOJu0YxaoOZR2Ro59PTCPMtFDAN5+ExtB4YC6Xoh36W0NsvdSakYl2r9
	TNMqKZBls27GxdFFPZWYyE4769ld0h5pMzDi4oc50yETsgE5vuXidgaW3U7zSz6VESXYp3KtrRg
	UI8i2fUK2aPU8U+SP7LWHpsmNENY+DaFI2X9W
X-Gm-Gg: ASbGnctpFU+Q7K/ubBCRVHosDwPw5icFwiSlCbFTNr8g4ThWq4AUTe+4Pi+huolT5aT
	Dv4QVMcttIYZkaujOTHqla7kgvjLz6xxEcbMOJ+Z5tYY83fiO3i3e0L+zlcD6Z+iLY3rCDWZFcP
	s5j5p3xwwIyf861TQkWoNFoAwd
X-Google-Smtp-Source: AGHT+IGL4SmQgIAC10xipCYbVaexIQbpQQDDIqhx2hGeOo7wq1KUJ/UwijMW6vgDIGzhCGOUFwEwrakNbbsm+km09q4=
X-Received: by 2002:a05:6214:240f:b0:6df:99f7:a616 with SMTP id
 6a1803df08f44-6e4455d2fdemr247845286d6.2.1739227837669; Mon, 10 Feb 2025
 14:50:37 -0800 (PST)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 10 Feb 2025 16:50:37 -0600
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 10 Feb 2025 16:50:37 -0600
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <87895166-659e-475f-99bf-5791a6e1ac3b@oss.qualcomm.com>
References: <20250205233016.1600517-1-swboyd@chromium.org> <20250205233016.1600517-2-swboyd@chromium.org>
 <74527323-31ff-4ed0-b19f-e535f26abf2b@oss.qualcomm.com> <CAE-0n50DXcAXQMaLtsamvxHjUrkJVBz42G6gtgKgW9Rh=qd31Q@mail.gmail.com>
 <87895166-659e-475f-99bf-5791a6e1ac3b@oss.qualcomm.com>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.12.dev1+gaa8c22fdeedb
Date: Mon, 10 Feb 2025 16:50:37 -0600
X-Gm-Features: AWEUYZmtYYT334_kTXnpfDawnzC3OarpU1PJNDWzV_jXYgahC0sPCiJwqwU3_-I
Message-ID: <CAE-0n51zc65GSm5J9TbHe_g4reos2h_iv-ozMU6CCrAuOt3Kww@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] dt-bindings: chrome: Add binding for ChromeOS Pogo
 pin connector
To: Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
	Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	patches@lists.linux.dev, cros-qcom-dts-watchers@chromium.org, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Benson Leung <bleung@chromium.org>, devicetree@vger.kernel.org, 
	chrome-platform@lists.linux.dev, Pin-yen Lin <treapking@chromium.org>
Content-Type: text/plain; charset="UTF-8"

Quoting Konrad Dybcio (2025-02-10 11:09:57)
> On 6.02.2025 9:43 PM, Stephen Boyd wrote:
> >
> > Do you have a device that could use such a generic binding? I can't
> > really design something in the abstract without two or more concrete use
> > cases. Coming up with something generic looks like a quagmire, because
> > as you say the signals going through the pins could be anything: i2c,
> > 1-wire, etc.
>
> Right, we can't be overly generic either. FWIW I'm not standing in the way
> of this patch getting merged.
>

Ok, got it. I've renamed this to google,usb-pogo-keyboard and made it
keyboard specific. I'll send v3 shortly.

