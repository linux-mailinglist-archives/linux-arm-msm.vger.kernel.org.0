Return-Path: <linux-arm-msm+bounces-2504-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 2ED947FDA9F
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Nov 2023 15:58:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6015B1C20A43
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Nov 2023 14:58:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 46B98358A4;
	Wed, 29 Nov 2023 14:58:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dkim=none
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-oi1-f170.google.com (mail-oi1-f170.google.com [209.85.167.170])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 35881A3;
	Wed, 29 Nov 2023 06:58:48 -0800 (PST)
Received: by mail-oi1-f170.google.com with SMTP id 5614622812f47-3b843fea0dfso3900458b6e.3;
        Wed, 29 Nov 2023 06:58:48 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701269927; x=1701874727;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Om8QH0PgH6JybOzR4agW39ICVCA3hclLDw5NauxCXtE=;
        b=E8fa01i4+bCx9eNPeg/8VKnLnO4NlrdbNy4FqndnldSJ69C5ZbGiEk4RoZ3SJvVQ5D
         9y3FDnpYHr+oPaYZ+O9B5uZk0B/mlprV92zZ+RSDWok8wLcwi5xQFAsgcWXfbYSlpoKG
         FxczfgNKBWEqorjRCrXSCaRl6ppYRhWcQHIs4Uq/LRatZYFV3Vu8dR19rKES9NpBmWMK
         3vaJQ4UUV4fvQDBudoOxEy5Ph+1fxCoda70LXu0u/6MBh7z8JP1GTo0DvA/J5f1vswfG
         KGbPuDqMkx63QlZWgrfcD6weFC3/S9p/OG59HqfzExYU3cVDbJeKg3O6bPwMdcDYDGtr
         Eawg==
X-Gm-Message-State: AOJu0Yyi7VczYE8oAVKDnrlR74j0HhhpGtpoIupgfa0AYak7x+LKq9Gn
	7POZG+FAHTJzAFOwwBFZaQ==
X-Google-Smtp-Source: AGHT+IFaDKlAMO0TTBe2DgTuEmwhSM1mq/2uExerm3hYow5K6ag6Zf/td6nyVFVGAKaudl9+l3aL7g==
X-Received: by 2002:a05:6808:34c:b0:3a7:1e86:e83f with SMTP id j12-20020a056808034c00b003a71e86e83fmr19018621oie.51.1701269927374;
        Wed, 29 Nov 2023 06:58:47 -0800 (PST)
Received: from herring.priv (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id m23-20020a056808025700b003b29c2f50f0sm2248202oie.18.2023.11.29.06.58.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Nov 2023 06:58:46 -0800 (PST)
Received: (nullmailer pid 2464542 invoked by uid 1000);
	Wed, 29 Nov 2023 14:58:45 -0000
Date: Wed, 29 Nov 2023 08:58:45 -0600
From: Rob Herring <robh@kernel.org>
To: Stephan Gerhold <stephan.gerhold@kernkonzept.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konrad.dybcio@linaro.org>, Jiri Slaby <jirislaby@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org, linux-serial@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: serial: qcom,msm-uartdm: Vote for
 shared resources
Message-ID: <20231129145845.GA2459716-robh@kernel.org>
References: <20231128-serial-msm-dvfs-v1-0-4f290d20a4be@kernkonzept.com>
 <20231128-serial-msm-dvfs-v1-1-4f290d20a4be@kernkonzept.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231128-serial-msm-dvfs-v1-1-4f290d20a4be@kernkonzept.com>

On Tue, Nov 28, 2023 at 10:43:32AM +0100, Stephan Gerhold wrote:
> Document power-domains, operating-points-v2 and interconnects to allow
> making performance state votes for certain clock frequencies of the UART
> DM controller. The interconnect path to DRAM is needed when UART DM is
> used together with a DMA engine.
> 
> Voting for these shared resources is necessary to guarantee performance
> with power management enabled. Otherwise these resources might run at
> minimal performance state which is not sufficient for certain UART
> baud rates.

I find the subject a bit strange because voting is a QCom term/concept 
and somewhat outside the scope of the binding. The justification is 
really just that the h/w has these resources. In any case,

Reviewed-by: Rob Herring <robh@kernel.org>

> Signed-off-by: Stephan Gerhold <stephan.gerhold@kernkonzept.com>
> ---
>  .../devicetree/bindings/serial/qcom,msm-uartdm.yaml         | 13 +++++++++++++
>  1 file changed, 13 insertions(+)

