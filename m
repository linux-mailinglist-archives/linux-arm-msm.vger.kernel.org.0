Return-Path: <linux-arm-msm+bounces-73505-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7264EB57333
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Sep 2025 10:39:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0190216188B
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Sep 2025 08:39:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3CAB42D5925;
	Mon, 15 Sep 2025 08:39:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="asYBn+zG"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4AD87261C
	for <linux-arm-msm@vger.kernel.org>; Mon, 15 Sep 2025 08:39:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757925593; cv=none; b=NyJ/yFpwNbJk1MPLHqfyuMydukOWKyZIbLIxsMWQ1EcsRJP76X+iwNtuAvJpvv99gIjBRhGtvnZOKcET5oVHuo8eSzsSzLM8v+cE5/raAASnvjk9s3YmuWus3FQsBO+2F6E15EZrIyaytgbCtfxHYrcPCX69mzPLp1IRBCsw3yo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757925593; c=relaxed/simple;
	bh=Ja+DWURKVC/MhjrBt/JOedxNP3etC5XulOORUTF4wgY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Dv8tW6KzR0oAbjdSZTK0GcrxqbxpgXG2UsVhRuQI8NAZ/U4Bdxwbk5wu/TA6SzLNpAY/XofrgCXMd3Qt2+mqFom/ycZ4ac0qFrmh9vKT1kWtsswMsGIjcP9ZIHc30xpp+1Uv654OhUi81MHugl9sOdPkRmbhuOfBZY9iPxDVyNQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=asYBn+zG; arc=none smtp.client-ip=209.85.210.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-7762021c574so1680817b3a.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 15 Sep 2025 01:39:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1757925591; x=1758530391; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=jEX9XijT6dZdXfDNPrPyYoF9pF2to+I4KU0mZQv7Zoo=;
        b=asYBn+zGUNoQjOHi44jaWV5WqQDgUAPofDMhJ23uVkXSKfnYMy2UQ5dggH9hd97B+T
         0aS1+z9hLsoLpNYQSHOzN5ZbvSvk8gjbTOn8X+3ncfB38bVNa6djj5dq7KKOqPTRgR2n
         FvyDyrrCn6gj+MGuj1Bdihml88jR7nThjLtbftfF4Bzx3AHA0CjzyKcsE0I5zqMRILJA
         1i79KwkQMpqSentWGFPPS8SFNjoEw4m25+YcOinJ3A1K4/Gr7B1mWqpdZdnnOUYwH1jm
         GB8/nS0jTf/KDONuRr6XSzCeGovKAwo+5Xs7bULFki/q/wTQxbtosgJvFfl0Qib6qPfk
         dU+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757925591; x=1758530391;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jEX9XijT6dZdXfDNPrPyYoF9pF2to+I4KU0mZQv7Zoo=;
        b=iA7LitSBR/1L7DNTbWK2nVlEtVDrXbm+8ynBJluZldX9hno5E/L9uYUHnu36IM8AjP
         UkJrwgCAGOHiR8ltI0Te5hUHF8xCoUvcjOn/fBJpdz0u2PawDqnUqew8y3Zz0PLkdLzl
         lAAFE7J5obXExANsTG6Qx0ZFcNZb+YYblOf+51p7OTajL+mPsnyzt4he863+kkgSxYOJ
         mMFWKPahaxa9j03cIYBb7M+1TmidZVUEJvlBioCPe5KAfO8JsYK5qwSvWYOUPJW9al0L
         cOxGVeu1PsUZUngtevnsFpeCQFsMpPxHU8aNrTrOQ0LeZd4QKkcTkJC52WaciOSWmaET
         aHFg==
X-Forwarded-Encrypted: i=1; AJvYcCUJxq7slMuTgGZmuco9785UVaION7feLr8WzmO6lvmOWcLcmUFUT1Sv5TS0UWQrNv6UDkDUP3/wUZ1S8reg@vger.kernel.org
X-Gm-Message-State: AOJu0YzugpilPcsLYu1C45crrOLguj0n2j6IoyX1A2dbvIwZ5147aNvg
	6ktjKgGoAEfapXKTu2m9vFH4U54iVnXR+lEFhJk5zs4r6+8eGBjMB5hWgu04uRwxPkiwYaqLTp0
	TEQtY9bGCMuHyLT/n6IiIcjCctQtLZtAYl1950qcc
X-Gm-Gg: ASbGncsybl2yOG/u0yNJXKhakbofkoKttuWgWn6wiwIZjEvzn/uirpwrOdidROntOpY
	3zSS0gVtEqavpDMUJq/MSUkipTSpeDICW2jJg5f5h4vWVq5Vn/GKbLF4w4peys6A1sLXAhbFAHZ
	TESoOusZFA5wGq1RZNA5TMl2RMrguCs5FP6orBVtOGl9LWlsbRWK2zcUnVwRSgEVF2QQOvDsF5p
	Zxk7VqpL72JmVzysioZfCypD3oSFUdXuYJlW/+23g==
X-Google-Smtp-Source: AGHT+IFQWa1Lq5s3wHqivhZWy3fXCUWg+0nXwEU0qlOA4xFoXSjxKquMoaAEWKKfO/WgYI37H9Hf7stft0DUGFXxn+A=
X-Received: by 2002:a17:902:ebc5:b0:256:3dfa:1c98 with SMTP id
 d9443c01a7336-25d23e13e2emr141646225ad.11.1757925590740; Mon, 15 Sep 2025
 01:39:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250905091301.2711705-1-verhaegen@google.com> <aL5t33Ztwse6HoQP@vaman>
In-Reply-To: <aL5t33Ztwse6HoQP@vaman>
From: George Verhaegen <verhaegen@google.com>
Date: Mon, 15 Sep 2025 09:39:23 +0100
X-Gm-Features: Ac12FXwunFCBoJSIg5TZc6taVzPDODNO9kbuJ_l3vtZMfjpWrOJmHmPUWle_GzA
Message-ID: <CAAntYmJbFo+PZGVamNYjOav03UrZ0i6a6fMiRdfTJ=LgsHiCZQ@mail.gmail.com>
Subject: Re: [PATCH v5 0/3] ALSA: compress_offload: Add 64-bit safe timestamp API
To: Vinod Koul <vkoul@kernel.org>
Cc: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>, 
	Mark Brown <broonie@kernel.org>, Cezary Rojewski <cezary.rojewski@intel.com>, 
	Peter Ujfalusi <peter.ujfalusi@linux.intel.com>, 
	Bard Liao <yung-chuan.liao@linux.intel.com>, 
	Ranjani Sridharan <ranjani.sridharan@linux.intel.com>, 
	Kai Vehmanen <kai.vehmanen@linux.intel.com>, 
	Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>, Srinivas Kandagatla <srini@kernel.org>, 
	Daniel Baluta <daniel.baluta@nxp.com>, Orson Zhai <orsonzhai@gmail.com>, 
	Baolin Wang <baolin.wang@linux.alibaba.com>, Chunyan Zhang <zhang.lyra@gmail.com>, 
	Kunihiko Hayashi <hayashi.kunihiko@socionext.com>, Masami Hiramatsu <mhiramat@kernel.org>, 
	kernel-team@android.com, linux-sound@vger.kernel.org, 
	linux-kernel@vger.kernel.org, patches@opensource.cirrus.com, 
	linux-arm-msm@vger.kernel.org, sound-open-firmware@alsa-project.org, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"

On Mon, 8 Sept 2025 at 06:47, Vinod Koul <vkoul@kernel.org> wrote:
> Please updated tinycompress changes with this once this is picked up by
> Takashi-san

For reference, link to pull request:
https://github.com/alsa-project/tinycompress/pull/29

Thanks,
  Joris (George)

