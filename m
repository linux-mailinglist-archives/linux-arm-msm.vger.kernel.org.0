Return-Path: <linux-arm-msm+bounces-85329-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D5558CC1F52
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Dec 2025 11:24:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id BD11030419BA
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Dec 2025 10:23:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3432233B6E4;
	Tue, 16 Dec 2025 10:23:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="nfC3ZT23"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f65.google.com (mail-wr1-f65.google.com [209.85.221.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27FA933B6D5
	for <linux-arm-msm@vger.kernel.org>; Tue, 16 Dec 2025 10:23:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.65
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765880595; cv=none; b=SeR6whd1aKBYyhciNHn4HqtzLrDxcT+zkN7mxhKjupHUBQZXfuIzC30opSmoOz2LZhlCyMZkakL+shJC7BHMk/6NphwhzMinLfAE9WZxtxAIpR8tjqlvJzYSH4Bf0fZpIoSZPowjwJRcjau6lqDLi+nGK79bvY8TShqkwtm083U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765880595; c=relaxed/simple;
	bh=GzXFDo5IY5tF/4y98oUYhUu76Y9hSnuKCvwUardhPFs=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=XEcq76XbsOHz52JD50J37FyJCsd8dABGcPkieWIaJYPfroq4ZQSX35byxtBNHcf4mUPuf4HMyoQANPm8VNEp0VDaFTD4kxCC/QleDICpmQp85T2Q/WLlZIpqXS0S6hx6g9lqbPhkrRfEAB7RvQzipXQ2eKflUxHF1+ZQwlsypR0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=nfC3ZT23; arc=none smtp.client-ip=209.85.221.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f65.google.com with SMTP id ffacd0b85a97d-42fed090e5fso1521563f8f.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 16 Dec 2025 02:23:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1765880591; x=1766485391; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4IZdqT3f5FjLJw92pQmwl5xRGES7bj8LR/OQmW30pQg=;
        b=nfC3ZT234EotRGpj+zunwZsWh8l0L++0Dgh16MXctiVYjPUGdPFYnKv3VvUfr4I4uc
         f/MrzrgsvgpMB83loFwvsWFtRj6BMpEFoLUFgGxBQYWB9gQEq+5AWQk1/V3sPUuz5irb
         ua/UpngCjjkrTjihHIP9jVkb8DxSGblVDZkgMIlP1A3y6UMsh1g7WMfOhMWJHK3CUPWW
         SYWxmr9YdOs3/151YSCgNFPyhiI3cgtgKCcYEWBJ0RSZPCnBl/cHMR2UfWgOl3ixgXWL
         x1IIOoCxOB9Q2KJrTWvG1HO43nrFQmmebwq6DDpCpGi5B9rrP8iB0Yv71IhdBLl9gm/p
         Nz0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765880591; x=1766485391;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=4IZdqT3f5FjLJw92pQmwl5xRGES7bj8LR/OQmW30pQg=;
        b=Lpurqwqybqh4j3dg5ZKyP1WhGt+XO6j1hzGH1Rlu8+5aNarSPdJoto8U5EEjhe3mj0
         /FUsrkdg90QDVjrJxEr3L7MRq32Gmqpp6XfQsDRt7oKXlVqDww57V6MsivZxr/vxPuG9
         u+2NrXM5PS0Nz4ecwIilDNm9tsFs+slzwWoysVfo9njRJFLTVoGNesWn///+Q9lQ9GqB
         ZWxc7iHz7SxNR2VeWEaZ90Ozs5Ytgq+5Q+VEXb2OaneVQ1+X6pHsJHfPfeJSFPpl8q7X
         tWPL1ouSs4UWj/pWwXI6xXr3G2ZBPjwSx9B0poWxy886U1KAK4/ZeXBnlRCHbLPprG5T
         9sTQ==
X-Gm-Message-State: AOJu0Yx9ZUURaTi+oD2OBy7U19Peu/fNlHezL/Jlsm2bA1aBikIWNIr2
	1PttFNjmJ+NprphKihDldCix5CwbTSlPESmU2Yb1k4gBVj8+WktvgIsgqLWJfWSWAjZJH3DxI7b
	WJGMr
X-Gm-Gg: AY/fxX7saxBpmXyWRIi0V9UfD4igzbb3f/SDbiMvRzruZldJmCPT4Rl4wuXeDQvoksr
	jaQGMo2o8h1pjUJG3gYWPJQDURaHlWxA/lJO0I7Jo87LbDGjuJmH8iQrzb0DgB4nsdUQZCR6+He
	lq85Wn3FxO/PWTq2m3ECVbUsXsBVW0krbzarlVEsZfT/NHnByzG4zRNhZ3i6qbOOV3scO+HK09s
	Ig5KJguNFRmlClKPsGbu8Qd7/cteJiaQLR4uGNwsONpNUOFcGgUgZ6ZnBJhzLjk8RCPp/erCp+6
	P1PTJFsMMSaCcCKA4ns3TLENPES+V9JShyyWuUqUiFvoX52LV3RVKvEtTrLTgHJdCR3h3ScmluL
	RFPn/0NG+aDi5GDYFjhvgvDaHikPgW5FJA/a3RyK0cJF6zvtUIPVULOggD1uaWoadq3eLojfpEv
	ewxOXlYXGujtQ+QwxpjLPKxH/c3N0o1dc=
X-Google-Smtp-Source: AGHT+IHdYoe0Jxs5on7xWo5sC0mu4jrv63ZGB+gV2yfNBNXsZdkj2vvC6F2crM2qJ3WTRAF/bSMiFw==
X-Received: by 2002:a05:6000:2909:b0:42b:3131:5437 with SMTP id ffacd0b85a97d-42fb46e1b5fmr12776263f8f.34.1765880591356;
        Tue, 16 Dec 2025 02:23:11 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:3d9:2080:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-430f984a268sm14996292f8f.1.2025.12.16.02.23.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Dec 2025 02:23:10 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Sumit Semwal <sumit.semwal@linaro.org>, 
 Casey Connolly <casey.connolly@linaro.org>, 
 Jessica Zhang <jesszhan0024@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 Dmitry Baryshkov <lumag@kernel.org>, Vinod Koul <vkoul@kernel.org>, 
 Petr Hodina <phodina@protonmail.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
 David Heidelberg <david@ixit.cz>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, Krzysztof Kozlowski <krzk@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>, 
 Amit Pundir <amit.pundir@linaro.org>, Casey Connolly <casey@connolly.tech>, 
 Joel Selvaraj <foss@joelselvaraj.com>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
 Bjorn Andersson <andersson@kernel.org>
In-Reply-To: <20251214-pixel-3-v7-0-b1c0cf6f224d@ixit.cz>
References: <20251214-pixel-3-v7-0-b1c0cf6f224d@ixit.cz>
Subject: Re: (subset) [PATCH v7 0/8] Add support for Pixel 3 and Pixel 3 XL
Message-Id: <176588059015.2230787.12554234444654203091.b4-ty@linaro.org>
Date: Tue, 16 Dec 2025 11:23:10 +0100
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

On Sun, 14 Dec 2025 15:51:16 +0100, David Heidelberg wrote:
> This adds initial device tree support for the following phones:
> 
>  - Google Pixel 3 (blueline)
>  - Google Pixel 3 XL (crosshatch)
> 
> Both phone boards use the same identifiers and differ only slightly
> in their connected peripherals.
> 
> [...]

Thanks, Applied to https://gitlab.freedesktop.org/drm/misc/kernel.git (drm-misc-next)

[2/8] dt-bindings: panel: sw43408: adjust to reflect the DDIC and panel used
      https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/dbb5d6010c1ecf01560af405c5b503f4cf2b1149
[3/8] drm/panel: sw43408: Introduce LH546WF1-ED01 panel compatible
      https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/be85d4124dbe6ed597c7a6a16e53d8b98684fab6
[4/8] drm/panel: sw43408: Separate reset sequence into own function
      https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/5f0cc92fa0dab7cbb999dedc653f5857a62b2022
[5/8] drm/panel: sw43408: Remove manual invocation of unprepare at remove
      https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/cbc1e99a9e0a6c8b22ddcbb40ca37457066f9493
[6/8] drm/panel: sw43408: Switch to devm_regulator_bulk_get_const
      https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/ed2b818a24760d7adc92d2e9b0e135f2c33edd8c
[7/8] drm/panel: sw43408: Improve wording when reset-gpios aren't available
      https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/29e208a08a8ebb0f214e815eee0a7beff778864f

-- 
Neil


