Return-Path: <linux-arm-msm+bounces-4631-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id BCA5A81244C
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 Dec 2023 02:06:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 667741F21316
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 Dec 2023 01:06:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 741B6642;
	Thu, 14 Dec 2023 01:06:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="cw/Wz/qB"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com [IPv6:2a00:1450:4864:20::230])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BFC61E0
	for <linux-arm-msm@vger.kernel.org>; Wed, 13 Dec 2023 17:06:38 -0800 (PST)
Received: by mail-lj1-x230.google.com with SMTP id 38308e7fff4ca-2c9fbb846b7so87176531fa.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 13 Dec 2023 17:06:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1702515996; x=1703120796; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:user-agent:from:references
         :in-reply-to:mime-version:from:to:cc:subject:date:message-id
         :reply-to;
        bh=peKqQhahD9JRG6w67FwL0sZR7IqqMN+7cEJCPbXgpS8=;
        b=cw/Wz/qBmUDgWvZLY+mt8wuaD0gqN0/KuzCVbuYonRQULoYb6y6stZG5p5X1pukETH
         x8kD44ObrdpdQSS9gbw5DRGSheuDkfm++CnyjVR6KhDfeKIP4/k17QZlWEiw07eArlRX
         hwfHEvF3jnUWAb8NozrTA5cUbzZl1SxRupyJw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702515996; x=1703120796;
        h=cc:to:subject:message-id:date:user-agent:from:references
         :in-reply-to:mime-version:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=peKqQhahD9JRG6w67FwL0sZR7IqqMN+7cEJCPbXgpS8=;
        b=nafEDZu5yHhn4pkDC09c0czuW/JuaZmOWJZUO2R5FSARWWCYv6LZSkTqSgrjD2BTK3
         i8HGh2sn7/7odL91APV9FlTuNpnNDksBWgqSoXvNk/vWFtMH5ATPJL7i+vkdZAUsylj5
         HAvt7CtF9H71qKZ8u6qDo/1hbevCXC/vOQXo4JCQNKXIs/ebq2ZfJGLA/sv0g/kG48qJ
         nII7fCfLaqvDbnWV1JZIOftLVb/OFgWet8mX1FoFOs6Kex8LQ3vwSEYCVtwqHIjICnwO
         PNr8/pmA4ZtZI4g3wgI6cAD7+Bgnd7Gw7iLLVvWxUYBwPAHt+Xllx0HIF8Sy5EXLIUjj
         /amQ==
X-Gm-Message-State: AOJu0YwerDtchLTV1VCo0jkxLUHtGhaP/zbQkr8hJL62W3K1D1l+cqKW
	VVoj+fL7rLWuAuRLIaLDUfdDLJbv38IqTp7VhbyJrA==
X-Google-Smtp-Source: AGHT+IHvs8FX8jR+oHMtbXK5cvMpQXiJFEHExpih0ehnbtikW0K8fvGV2686+EyTLWM3fZDJz3SeNMCcCHHM7UeoTbg=
X-Received: by 2002:a2e:a373:0:b0:2cc:2591:bcd3 with SMTP id
 i19-20020a2ea373000000b002cc2591bcd3mr2000691ljn.106.1702515996638; Wed, 13
 Dec 2023 17:06:36 -0800 (PST)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 13 Dec 2023 17:06:36 -0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <20231213163501.1.I8c20f926d15c9ddc12e423e07df1e89db1105d93@changeid>
References: <20231213163501.1.I8c20f926d15c9ddc12e423e07df1e89db1105d93@changeid>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date: Wed, 13 Dec 2023 17:06:36 -0800
Message-ID: <CAE-0n52vfejT7a9Dh177dvD7G3cCx3paB7i_xgSCi=1Z4aE9nw@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: qcom: sc7180: Switch pompom to the generic edp-panel
To: Bjorn Andersson <andersson@kernel.org>, Douglas Anderson <dianders@chromium.org>
Cc: Andy Gross <agross@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Hsin-Yi Wang <hsinyi@chromium.org>, Konrad Dybcio <konrad.dybcio@linaro.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Rob Herring <robh+dt@kernel.org>, 
	cros-qcom-dts-watchers@chromium.org, devicetree@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Quoting Douglas Anderson (2023-12-13 16:35:02)
> Pompom has several sources for its panel. Let's switch it to the
> generic edp-panel compatible string to account for this.
>
> This fixes a problem where the panel wouldn't come up on some pompon
> devices after commit fb3f43d50d9b ("drm/panel-edp: Avoid adding
> multiple preferred modes"). Specifically, some models of pompom have a
> 1920x1080 panel which is _very_ different than the 1366x768 panel
> specified in the dts. Before the recent panel-edp fix on Linux things
> kinda/sorta worked because the panel-edp driver would include both the
> hardcoded and probed mode, AKA:
>
> * #0 1920x1080
>   60.00 1920 1944 1960 2000 1080 1083 1088 1111 133320
>   flags: nhsync, nvsync; type: preferred, driver
> * #1 1366x768
>   60.00 1366 1406 1438 1500 768 773 778 900 81000
>   flags: nhsync, nvsync; type: preferred, driver
>
> ...and, at least on ChromeOS, the userspace was consistently picking
> the first mode even though both were marked as "preferred". Now that
> the Linux driver is fixed we only get the hardcoded mode. That means
> we end up trying to drive a 1920x1080 panel at 1366x768 and it doesn't
> work so well.
>
> Let's switch over to the generic panel-edp.
>
> Fixes: fb3f43d50d9b ("drm/panel-edp: Avoid adding multiple preferred modes")
> Signed-off-by: Douglas Anderson <dianders@chromium.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>

