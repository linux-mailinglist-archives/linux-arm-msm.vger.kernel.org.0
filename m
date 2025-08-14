Return-Path: <linux-arm-msm+bounces-69099-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C29DB25A2C
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 Aug 2025 05:58:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 43D262A3881
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 Aug 2025 03:58:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4524D1DFE0B;
	Thu, 14 Aug 2025 03:57:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="EKHSha6q"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B1C519B5A7
	for <linux-arm-msm@vger.kernel.org>; Thu, 14 Aug 2025 03:57:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755143875; cv=none; b=Pe0jewURvQcfapzRUPhUNyql36iW+NSz9hHDx7avqehgIB8ABdBcl3U4Y9+8LQJSt5oOnIxWlgmKfjnz2bVIcRU42Wox09fHeFIrl0+vkZ6WxetZ809CQIhjZXF+1zEmUMfcbWSTDyjwFAbLB2tANoJsJE4HLVjHo11Yrry26Bw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755143875; c=relaxed/simple;
	bh=KuAzkdu+nBeW4XQJu6RSp1V8OBm3suYsUZfkIRqSD68=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YQzT3pzo4obvRlaKGqYu9r4x38eVvQuxaaZG8A7qFUcfWZ6pGXxQykUE4ZnY9TZGcdQeWczcoT8kstJ7C9FloJFsh75CPh+iFOpcVG05dyRommACbeS6foXh/OJT+PcCmNaeIrASCrxO5WbqUjiKPL3+vcbsXlJr7a3uzvmOKik=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=EKHSha6q; arc=none smtp.client-ip=209.85.167.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-55ce5253adcso512413e87.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 13 Aug 2025 20:57:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1755143871; x=1755748671; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KuAzkdu+nBeW4XQJu6RSp1V8OBm3suYsUZfkIRqSD68=;
        b=EKHSha6qdcBlsS3gXN4Cw+T6fWwdA1YCyfFc5q8C+8u6tYxjS3yl3WEbF+GocUde6a
         Yr4akzI6BV7tlc0LbiOXzgB/ACP7W21rMCxsdytPp7bq7N3Oot9ZRftp5aDUg4ZN4OKs
         loF7b7jyJYM9Acbf/YX0K99D2wwAo400Usa/0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755143871; x=1755748671;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KuAzkdu+nBeW4XQJu6RSp1V8OBm3suYsUZfkIRqSD68=;
        b=T5ZkYP58VE9xgLjPdcSa3ZptXVFfzIaBt4abr+iYCHOkEUTc8ODZKfbzfyDII3L50z
         BfbGmK09WaKmj1eoEA5/+JGZe3KF9VoytqSr/22zia6dLt5eDRF8HdJid8cnKNIkVGKo
         4g9Cth+vrZ4O0ltq+VNjPhbjkFfqzgorVNUTVV1OUhyUN9HF2rtIanjGshIWNstRYlGc
         m/2pHq55jKMaautSEc0QnsJmebVF+9UTPPMBTCys4P8Z58Ee2aNQKfzArGUX1voO0FWM
         qfpubkpoTSVNHzvp8QQRNRvhXLPFC5tvj0AV2VjHzB6bmZTEmC17iKQTNdib9BgNT0FA
         HUZw==
X-Forwarded-Encrypted: i=1; AJvYcCWeathO+txqw1Se8vT6dbpsGwmGTwHJfoRx5qcYIyETXmpP+/upE3+AZuBG6rjV5jMfb1KcxqsX0jIHSdj6@vger.kernel.org
X-Gm-Message-State: AOJu0YxLdtk6OfS8TKzO9eW5V1RRyo707f5rBiNfLxGO4poBOqN7zsfb
	vfs46wHLJz6sybbugQKEezIT0PdYrYy398zeWoHtdS7k7+LlVzMPBUi6FLtoaFek58mHGHei2G6
	DPmpFJyXcZKRRlzNkpmMf2BXyIRDBmoIagHV56E9V
X-Gm-Gg: ASbGncs17YSjgmgCn5HtNyelISsnejggTpxCMZMmaAsycSwizkzLyxES4eqPSiEnbv6
	mu3f71Ba8l/qVzou+Jy1zjoCR7LM3DuYbSSE8MT+ON+kcb2uzBhILRLjOOvNLDHpnoxqWftMbfk
	zmT27G89h3toIugqpYEu36tbo0RYhRwka4hpUGqfsohcKc6mA/NEhM5tw417PsgIU7mH/lBKuey
	abbqym6bO6P2yiGo1mxZLTI6qLTByESLhYs8bIRqX5dsA==
X-Google-Smtp-Source: AGHT+IF+5iKv8rMK9YHb6myK/q855kRCdUIsQfOlyE7uVil4m3zuwOKJ3gr0xAyECxLHg6Jl7SqsZkrMsfX9UPSHH2s=
X-Received: by 2002:a05:6512:b8a:b0:55b:8211:cc88 with SMTP id
 2adb3069b0e04-55ce508ddefmr488807e87.51.1755143871084; Wed, 13 Aug 2025
 20:57:51 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250812-pinctrl-gpio-pinfuncs-v4-0-bb3906c55e64@linaro.org> <20250812-pinctrl-gpio-pinfuncs-v4-4-bb3906c55e64@linaro.org>
In-Reply-To: <20250812-pinctrl-gpio-pinfuncs-v4-4-bb3906c55e64@linaro.org>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Thu, 14 Aug 2025 11:57:40 +0800
X-Gm-Features: Ac12FXwH4SzGC_raZvHd6w5DhOOOwcWIZ0DYC3dWkFgv22xak8lk2qDrshBunvY
Message-ID: <CAGXv+5EDj4JEKAFC-Sv8kyiBNy8SViEXaepdssG5QTu_HtYQHw@mail.gmail.com>
Subject: Re: [PATCH v4 04/15] pinctrl: mediatek: mt7988: use PINCTRL_PIN_FUNCTION()
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Linus Walleij <linus.walleij@linaro.org>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Alexey Klimov <alexey.klimov@linaro.org>, 
	Lorenzo Bianconi <lorenzo@kernel.org>, Sean Wang <sean.wang@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Paul Cercueil <paul@crapouillou.net>, Kees Cook <kees@kernel.org>, 
	Andy Shevchenko <andy@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, 
	David Hildenbrand <david@redhat.com>, Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, 
	"Liam R. Howlett" <Liam.Howlett@oracle.com>, Vlastimil Babka <vbabka@suse.cz>, 
	Mike Rapoport <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>, 
	Dong Aisheng <aisheng.dong@nxp.com>, Fabio Estevam <festevam@gmail.com>, 
	Shawn Guo <shawnguo@kernel.org>, Jacky Bai <ping.bai@nxp.com>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, NXP S32 Linux Team <s32@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Tony Lindgren <tony@atomide.com>, 
	Haojian Zhuang <haojian.zhuang@linaro.org>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Danilo Krummrich <dakr@kernel.org>, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, linux-mediatek@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org, 
	linux-hardening@vger.kernel.org, linux-mm@kvack.org, imx@lists.linux.dev, 
	linux-omap@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 12, 2025 at 8:36=E2=80=AFPM Bartosz Golaszewski <brgl@bgdev.pl>=
 wrote:
>
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>
> We have a dedicated initializer macro for defining pin functions for
> mediatek drivers so use it here.
>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>

