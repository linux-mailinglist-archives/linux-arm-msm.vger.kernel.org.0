Return-Path: <linux-arm-msm+bounces-14810-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E8BE886A82
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 Mar 2024 11:39:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 1977FB2402D
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 Mar 2024 10:38:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 187C53D0B3;
	Fri, 22 Mar 2024 10:38:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="JiihL1+/"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yb1-f175.google.com (mail-yb1-f175.google.com [209.85.219.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 400C43B788
	for <linux-arm-msm@vger.kernel.org>; Fri, 22 Mar 2024 10:38:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711103929; cv=none; b=bPafkHlCW0AuwE12CTM0mEXk8VDPxG3NRaGnvTuePJxul26irVAjKa1qCIfAZcHc/OloDwk+rMr4dz0y7TkJy1HLT/4dKFC+Ut5lWvqG8//88obNgfHj6OcoSLsjYh9JyYZGqH/GqvVMEhUvnJpi8FtHOSb1B+f3/cg8lYRAt6I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711103929; c=relaxed/simple;
	bh=Hq2/eEOuWhpmKCsuwoD25OCbkTU9eHjsACQjFbIL5J4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fiY58NdublntdYxaDbM7xErJm6bgyz6H3d+nRs6nxTAFMJa0wnjNXfYQubV4dKtz3GQl2mGnoKRnXFYZO3LEuNbxJy0kA8ItCXD8/KAguzJ+x9QbdxQ5NradqyuRiAOrnwVJb7P6hrOe8ywSDo+Jx6v9wrPs00JK7eGVz6MTal4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=JiihL1+/; arc=none smtp.client-ip=209.85.219.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yb1-f175.google.com with SMTP id 3f1490d57ef6-dd161eb03afso1649059276.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 22 Mar 2024 03:38:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1711103925; x=1711708725; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=EW5QX/PBiLajaatZ/82NErGaCFABadkL02aA8JURVjA=;
        b=JiihL1+/6U2Cx7eJN6b4Oe67iNFFFwpMCixX/BSNlEZziujtNC4bsDiR9/+lxJy7AU
         rhESgenhwWlEL6pwXxuSKhrD88LMs5SO/ztC1aZ8D7V3oLww0qjE4XWA2kZgjc6mbsas
         ytdavUNjY1u2pDaiNesQGnGiJDq532WBuZudF1qkTElflgRSWQgZf67M7ej3kqhao0jx
         jDwxeTLj3YRuG7SwuntosDcRg+U1OCkZEhKRvuU2AGYktjqC347VbPZu1wzginm7/8L6
         qRDUy6AH8GmHh6qUOakmNrWj6QcY9HXDADUt+gWDIpZOpzJw0tQTO0+gamIKnhygF4rY
         +5tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711103925; x=1711708725;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EW5QX/PBiLajaatZ/82NErGaCFABadkL02aA8JURVjA=;
        b=AhXy8eVaUi6BkD20kdnloPO46MdDs/diiu2eqTC+46Y3sOkgyOoA+ZXAq9bYvAH12I
         YZNw/GRKI71eY3Zsbth4rZD+9JQPv/dOt85QT9/oSVqi+g+K4KmvloMLoIZBadzsxB5N
         SfdrkElrv8tS0lUiII3EQfYLZ+5RA23Fnjz6OV87CHN94OmKSM6ShDB7a2n1nIydwcaN
         sTHvFcHIZ2m/WPT25KfuKv0E4RCYof4nk7dvCjOVOahoyRknrDsZvtkyfZvRRLAoz8yZ
         Vhxsvyth67oSduJ/ZKUOuFXR0U9WSbiZOoJK7kVG4xCvIjBWeXIjfbgGOgMJ2FVPr7cp
         qWkQ==
X-Forwarded-Encrypted: i=1; AJvYcCXEf5E2KjExGkdCl4kgdlGhR7AknDfm/xuKxK7K1RjYXmr7revbe+uaNdw/ZD+uEhn1uMCTM7JxHxD2RNUrFrisHWCBnKVRoT+YcAEv2Q==
X-Gm-Message-State: AOJu0YzZUd3du0U51flE00k0+IA7uvsQJ95md4hRACshhMz5PIXELmDB
	FMoNoDjyNC5YXVISoZPtgrP4IWjbmp7MlpuNths0tAc+FBz+0f6z6pBlXDLGzcVPOHs3XTIt08Y
	2LLqksGvHbbal9oJKATtbOtzzYrr2ncYaTHF/6A==
X-Google-Smtp-Source: AGHT+IHSKsoTSx1uARV4yY9pfYF30+iJm9yZmLK1Rm0y026834WCXCVGtwW6NoGV0aiUmgbWwwTt9TMD1a0SiQcBybI=
X-Received: by 2002:a5b:651:0:b0:dc6:2e29:4262 with SMTP id
 o17-20020a5b0651000000b00dc62e294262mr1579006ybq.58.1711103925350; Fri, 22
 Mar 2024 03:38:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240322-topic-sm8x50-upstream-pcie-1-phy-aux-clk-v2-0-3ec0a966d52f@linaro.org>
 <20240322-topic-sm8x50-upstream-pcie-1-phy-aux-clk-v2-2-3ec0a966d52f@linaro.org>
In-Reply-To: <20240322-topic-sm8x50-upstream-pcie-1-phy-aux-clk-v2-2-3ec0a966d52f@linaro.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 22 Mar 2024 12:38:34 +0200
Message-ID: <CAA8EJpq1JSLdzpkbjSPjfFWvMEKgFBifjkOjAMQJUO40-bFnSw@mail.gmail.com>
Subject: Re: [PATCH v2 2/7] phy: qcom: qmp-pcie: refactor clock register code
To: Neil Armstrong <neil.armstrong@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konrad.dybcio@linaro.org>, 
	Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Fri, 22 Mar 2024 at 11:43, Neil Armstrong <neil.armstrong@linaro.org> wrote:
>
> The PCIe Gen4x2 PHY found in the SM8[456]50 SoCs have a second clock,
> in order to expose it, split the current clock registering in two parts:
> - CCF clock registering
> - DT clock registering
>
> Keep the of_clk_add_hw_provider/devm_add_action_or_reset to keep
> compatibility with the legacy subnode bindings.
>
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> ---
>  drivers/phy/qualcomm/phy-qcom-qmp-pcie.c | 15 +++++++++++----
>  1 file changed, 11 insertions(+), 4 deletions(-)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


-- 
With best wishes
Dmitry

