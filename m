Return-Path: <linux-arm-msm+bounces-83108-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id D0E5EC81BEE
	for <lists+linux-arm-msm@lfdr.de>; Mon, 24 Nov 2025 17:59:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id E6F404E65F4
	for <lists+linux-arm-msm@lfdr.de>; Mon, 24 Nov 2025 16:58:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A10DC3168E0;
	Mon, 24 Nov 2025 16:58:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ScZdq11e"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEE10314B70
	for <linux-arm-msm@vger.kernel.org>; Mon, 24 Nov 2025 16:58:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764003509; cv=none; b=AlXsbCP3sMQ8emXnJWDS+DS7MiX/F6ho3nMG36oeAriaV8pIt+6RX080+XObRTq3QZY3U0QoIovR9UNv/5FRIlFV5jBkiKPD+YMxDCVW+XeW3fz8JV71uu2DkX+ETqpr4585kT6+XF7XLPehtvvQVgyDaTWpWWOe8zHXBH5qM4E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764003509; c=relaxed/simple;
	bh=mzIkqaZYWn0NPCfAXhc6sYEViAsZnALq97AMGCDXm6Q=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=CJHbvxMs/mRIGwSZzncxP0roT1xJ50WwoKVuAcT23sWvwCWuHtrMI+nbDfD87/XUMWEFrgPelCYarrKa+OJDwZerT5RBwe3h9TX6oQmUv9Xitazrz7lXEbdsO+4NMCna2p5N/ux3BrT1cFLWdDyQhABLiQCmo58HDh/IS7gbujg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ScZdq11e; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-42b2a0c18caso2844300f8f.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 24 Nov 2025 08:58:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1764003506; x=1764608306; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yTJo7Ag5Rh1YYyTzRB5qqC3xfHvME3432kS9IzmBK20=;
        b=ScZdq11eUCmBK1JIQOjqOlNRl0M1SUO+U3V/168Tpc6DBPSI3vDeDi8iSm56xEpkNQ
         dSg1ShYAx4xR0A69g3nDXyjNJo6lxHbVfhvB/7GWW+OZUyuNrCCko7BjPT0fDzVJqZfd
         Q4z+dpQwp0/ruXJls7NThBIMtfNXr+T8eGLtmW5KH6jqnYAIGP06PxgzzWSMzHJRNOix
         g6kTlA4J9Jg/bkEHkl6bhbRhSJa4fXBIaHyw1wm6JTQPzYP2NTL0/05YrEY8IC7j4iuW
         n1pgY0+3ZugY5/IOfEEczBSQVH0dJjXtPp5h54LFDdrWdJKAnKlHKvI0gHk0JlqO5LvG
         kVSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764003506; x=1764608306;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=yTJo7Ag5Rh1YYyTzRB5qqC3xfHvME3432kS9IzmBK20=;
        b=dGFix80GFGg06gqLPymjDbLVYGL+gjB8vvHA/Bwa9de0IrtVsuBYOJN413KVpGW464
         Ol6/Grq6GQfn40x4Bm+3NIvD7qQrrU1CFZ2rrjUVwiZlyyyjXaiLsGd0Eal1Yil0Brgf
         7lTNsl6r1V4ZI4DBsotIy5vUOVI3CSckzPH2ulMTtTrae6QnOYjXmUyCeGnCynFoXcje
         wC88oyjm50rdqpx3W1tj3+6o/T4UehSyfHQfQcIOwhkMdnVu2REpUsHrrbGLEfRMAGfm
         7myLd5hlzbi756ug4VXCeO4sPmpL8kUTdouITh56qlWkYwmLBx26KGMu3sU0bTpDDq1p
         krjw==
X-Gm-Message-State: AOJu0YyZRGs+FdnKhdSmkQ1wI45jvN7DCGls8pCcFZtJTQz412eV44JQ
	i4R4qLuraZHf3RrAE7VxcvJBknt7QD++ClDePxqaEZPsP/+z9t65TqytvlrPpcmTtTc=
X-Gm-Gg: ASbGncvtqRBEfy8O4wzqHsbFG5EftK9aO14fCNIHOrKtwR2eCY1rxe7AB62eb3AyXIZ
	GcA4MOu3hn88WubVY8SFbMLKVqUvYzexNa4NLvF5hi9SvbDgVbxCzLO1uYPHTG4PZVKlEQBYzuH
	pFQu+13JcdwxinVY1KKHCpc/+xWNzwFJggyd+1vU4Hpe3Afkky3Hkv6Yan6SwN+SpAdyWipFQ4w
	vSsxmztG7fzIICnF1fDOgckhosaT139Df5BOscJLWpcDR7y1mJv8xqXwo6eRMjlakSIjuwWwO2h
	mYAsLLGifLI7eLBurU2fW/8aVB9uNnWQqIDApev9MyXFxfprrgAU5N3yO5EDQJvKAWrVH7RnvgI
	TLh3sJR4Sez5NYWcvyXWSOU0IJC4LJU/ciYI0Tt5Fe3p55u7sDIZd9XJKgW1/Zw4YfBKIDnV1x1
	WAwPu9aDY9DZbeiehtNiERiwsR3OeqJQPVidalJ7sTkg==
X-Google-Smtp-Source: AGHT+IEYt+7gqBmSSxDw8oqYvg2HN9dgXWjs0bNrU1ocMijbefqOJSUkx6pNNwHfyRGDyKSx1gSW1w==
X-Received: by 2002:a05:6000:1a8f:b0:42b:5567:857b with SMTP id ffacd0b85a97d-42cc1d19e16mr12827554f8f.48.1764003506122;
        Mon, 24 Nov 2025 08:58:26 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:3d9:2080:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42cb7fb9022sm29398499f8f.36.2025.11.24.08.58.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Nov 2025 08:58:25 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Georg Gottleuber <ggo@tuxedocomputers.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Ettore Chimenti <ettore.chimenti@linaro.org>, 
 Srinivas Kandagatla <srini@kernel.org>, stefan.schmidt@linaro.org, 
 stephan.gerhold@linaro.org, wse@tuxedocomputers.com, cs@tuxedo.de
In-Reply-To: <20251121142623.251118-1-ggo@tuxedocomputers.com>
References: <20251121142623.251118-1-ggo@tuxedocomputers.com>
Subject: Re: (subset) [PATCH v3 0/7] Add TUXEDO Elite 14 Gen1 (X1E78100)
Message-Id: <176400350522.514667.5379863973279531790.b4-ty@linaro.org>
Date: Mon, 24 Nov 2025 17:58:25 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3

Hi,

On Fri, 21 Nov 2025 15:26:12 +0100, Georg Gottleuber wrote:
> Initial support for TUXEDO Elite 14 Gen1 laptop. It is based on Qualcomm
> Snapdragon X Elite SoC (X1E78100).
> 
> Changes in v3:
> - add DisplayPort audio to dts
> - add el2.dtb to Makefile
> - change dts firmware paths
> - fix dt-binding (x1e78100 instead of x1e80100)
> - improve commit message for elite14gen1 dt-bindings
> - remove smb2360_1 from dts (only one USB-C port is present)
> - remove "VA MIC BIAS1" from dts
> - remove regulator-always-on from vreg_edp_3p3 (display) in dts
> - rename vendor prefix of ASL Xiamen Technology to asl-tek
> - sort dts
> 
> [...]

Thanks, Applied to https://gitlab.freedesktop.org/drm/misc/kernel.git (drm-misc-next)

[1/7] dt-bindings: vendor-prefixes: Add ASL Xiamen Technology
      https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/ee4f232dd1ff8e11a18c6dab6f7a3a89eee62436
[2/7] dt-bindings: display: bridge: simple: document the ASL CS5263 DP-to-HDMI bridge
      https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/0eebd421ac09686f9646ea635ee8920d55ee5d26
[3/7] drm/bridge: simple: add ASL CS5263 DP-to-HDMI bridge
      https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/d525f967e7a40c08af3e752281ede72e9922b87f

-- 
Neil


