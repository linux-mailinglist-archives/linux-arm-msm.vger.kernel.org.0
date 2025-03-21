Return-Path: <linux-arm-msm+bounces-52160-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id ECBDDA6B8C0
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 Mar 2025 11:27:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7104E188AEF5
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 Mar 2025 10:27:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6AD65210F53;
	Fri, 21 Mar 2025 10:27:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fooishbar.org header.i=@fooishbar.org header.b="TdZlsUHs"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-qk1-f170.google.com (mail-qk1-f170.google.com [209.85.222.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73A531F91CD
	for <linux-arm-msm@vger.kernel.org>; Fri, 21 Mar 2025 10:27:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742552827; cv=none; b=lR9F+gCFNopheG5dAkLVeHVj/1/6qssNMp6v5WAsTm1Dn+DIb7yJ1b4IKVqEESLbohhmuuNihCQgSjh/nOyijClgtJubYwXv1IJ5h5jKOHftYu2EK7IYVRTkAHFohdHXkHU8eMNpgNM8XTRfaFBN3rKwWF6qxVQ278Xw4eDvALc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742552827; c=relaxed/simple;
	bh=C6XBFDQAIe6jgF6F40xRB15uQkrbHzlxj9SySg4AP08=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fA2Tw2xcOH56CdVHS9AEHMtOJMOrmngFDiZ4J51zpXcb91hOJ6q89/bBdumoGpXvw+SdTK3Qhqk196idlInrlLWhP96M2vEPSGKch6nYn1MAkBnAqSqdA9Sge6WbSzfO1wy8g9IF+MHWiPpjmS5GyivogGTLQUGKUsljrExvE+E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fooishbar.org; spf=pass smtp.mailfrom=fooishbar.org; dkim=pass (2048-bit key) header.d=fooishbar.org header.i=@fooishbar.org header.b=TdZlsUHs; arc=none smtp.client-ip=209.85.222.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fooishbar.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fooishbar.org
Received: by mail-qk1-f170.google.com with SMTP id af79cd13be357-7c5ba363f1aso106925885a.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 21 Mar 2025 03:27:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fooishbar.org; s=google; t=1742552823; x=1743157623; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=C6XBFDQAIe6jgF6F40xRB15uQkrbHzlxj9SySg4AP08=;
        b=TdZlsUHsbgNrvFWKr74ib1rO52+3/liwAwS1JFqwx6yapEeDkX3o9P8hqbxg4TWr87
         70MyY/R5x2Tom9e/G9Du9krSwiYhS3PpQlCLIuDQ8Kpcibsr7kl7i3+mL2f/5eIal170
         pvfI6WO93waEO1YCmhromQZ8XjMKa5pytw+HplISM6cIZ3Jyc8FWLZ7i4lKIJ0EExGbZ
         LqL9h1XwDRbi1qN5IavNQBl7pF/liW2j5ZbkZ+6vKEwh242vW6XCL5kaHH1+4HDcVZqC
         MDDlqXfQ9iW0jfpRsd4WAeRqtHHRFhz+BNdJ3oyo/P6PqeyPLo9ogk86aLgGZSrfhuRZ
         HE9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742552823; x=1743157623;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=C6XBFDQAIe6jgF6F40xRB15uQkrbHzlxj9SySg4AP08=;
        b=HZhfzVEJY91kPG/hqSicotgdT5z7JcDGlgg5I7lPIK70Wq7CxHbOKePAFd+V5+H68v
         gfX+naHX6XiLtxVJME/AaZ20DLeCAE0lD+PGAZtKnRHDx9YSfkFNgkS4fIgLKf0UCAsI
         m+bs2wsHqXjE8iSOz/BmyUE37+w0Kisncbgr6iMIZgNv7xygONnRPOCdhM4cqw1nDE6G
         AlcYfD3vyT9/kqIToBuowBqvMnTv5U62S7HMOnXXf5izJtuwvu7eEXr01Y/ycolhOJYs
         Ci9TtCUZLgiytBLFUWQ+MIKEfGWnIbZK8q8cNh3L/7LGZRTxeWVXiF7I+DLw+gf5cL6f
         plvQ==
X-Forwarded-Encrypted: i=1; AJvYcCXvgvgN6rtcqP7+v10NIyIVPMK7NXhiYwHESfwVWfEqiEXn8xH7tWwDje8ebtBBRQ+fStVR+jw1IZPPFTKj@vger.kernel.org
X-Gm-Message-State: AOJu0YxFfDEOkRmeyIRtOLsjTKRTt7DyQdrRFz4Li+Vt4TGdO/Uz0L84
	zRrwQwlGXjR9aW1hi5mS5xxd3GJIPKA28VMuTWO7kK8KEU2aPyvbGleE3dB013fa9DPvsRWEadh
	JwISULtwspzFxNraU/dPnM3mqAk2FvKSkub9VFQ==
X-Gm-Gg: ASbGncsO3MPn4udbG9hDUkbJU0CFR/VVpE30xYhbXQj8z5kEife13etuHPOFRxlobfg
	dr3TmwDYIieZNOThpnh1bNArmMB0mjZv88jo1l2amyq2GcJB5B4A1qZnMhK1xhMg/jzTWp6Xydn
	MdCfzoljeUKNlTY2dlx/sX80sN
X-Google-Smtp-Source: AGHT+IGtKZxKAoZgtR0aBlIVmyFJdz4vLgELnLl5z6u4LuYLjXNoyuq0UVrTF+CIIc7xPDTVRmAHZ+SRVPvG/7TyZXI=
X-Received: by 2002:a05:620a:4055:b0:7c5:a423:f5b0 with SMTP id
 af79cd13be357-7c5ba13361dmr406693385a.7.1742552823192; Fri, 21 Mar 2025
 03:27:03 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250314085858.39328-1-vignesh.raman@collabora.com> <20250314085858.39328-2-vignesh.raman@collabora.com>
In-Reply-To: <20250314085858.39328-2-vignesh.raman@collabora.com>
From: Daniel Stone <daniel@fooishbar.org>
Date: Fri, 21 Mar 2025 10:26:52 +0000
X-Gm-Features: AQ5f1JpymW7UP78_0g_Z-sNByprYGBFX-xYqr_OlbVrsK0-Hob7Zk88vIu6Znbc
Message-ID: <CAPj87rMjF84yyPqBshuGu=8qx6Xhq9Z-HgEnQe=tRtbu3E8OtQ@mail.gmail.com>
Subject: Re: [PATCH v1 1/3] drm/ci: uprev mesa
To: Vignesh Raman <vignesh.raman@collabora.com>
Cc: dri-devel@lists.freedesktop.org, daniels@collabora.com, 
	helen.fornazier@gmail.com, airlied@gmail.com, simona.vetter@ffwll.ch, 
	robdclark@gmail.com, guilherme.gallo@collabora.com, 
	sergi.blanch.torne@collabora.com, valentine.burley@collabora.com, 
	lumag@kernel.org, quic_abhinavk@quicinc.com, mripard@kernel.org, 
	jani.nikula@linux.intel.com, linux-mediatek@lists.infradead.org, 
	linux-amlogic@lists.infradead.org, linux-rockchip@lists.infradead.org, 
	amd-gfx@lists.freedesktop.org, linux-arm-msm@vger.kernel.org, 
	intel-gfx@lists.freedesktop.org, virtualization@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Vignesh,

On Fri, 14 Mar 2025 at 08:59, Vignesh Raman <vignesh.raman@collabora.com> wrote:
> LAVA was recently patched [1] with a fix on how parameters are parsed in
> `lava-test-case`, so we don't need to repeat quotes to send the
> arguments properly to it. Uprev mesa to fix this issue.

Thanks a lot; the series is:
Acked-by: Daniel Stone <daniels@collabora.com>

Cheers,
Daniel

