Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AB92C4327FD
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 Oct 2021 21:53:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233058AbhJRTzQ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 18 Oct 2021 15:55:16 -0400
Received: from mail-oo1-f41.google.com ([209.85.161.41]:47023 "EHLO
        mail-oo1-f41.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230159AbhJRTzP (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 18 Oct 2021 15:55:15 -0400
Received: by mail-oo1-f41.google.com with SMTP id c29-20020a4ad21d000000b002b6cf3f9aceso296326oos.13;
        Mon, 18 Oct 2021 12:53:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=Jc2FxaRgL1njdwtsQI/o3XdkSBi4yk7Rx3B3v7i1+VQ=;
        b=FXJQ+C11dzFaS5kbGF13yWYhlLsfymO3df4+ghb5V4IbqYV3OdtPl6PxtxnVW3YLea
         3PYyfHdbTAKg2ojEbNozcl0+0W6UgdFaMX3ZKDdAAzk9e9v/p2DoR5uR9XMELAiwMsZv
         UaqqeZ1U0iozTaPQmzu9qiJATkJ3pwRQVtjC4kcxEi0TVXmfqztWNdEleVGcPY6b6+W/
         iapROvkLsdQ7+sdws96AQeRj59R3U1kxPd5gQJuTJdo7wL1PvpvJlC05LNQZxO44HO4L
         ill7QhVmlF8eeuduA37pUFjNBsfjobMkiXJU/sopCCzfF6Gd6lX5NjSls0IbpOm2jLNs
         MqlA==
X-Gm-Message-State: AOAM532MilbKSwf2lRyUNIdBv6gyZna5SsW1CAU7MJ0wqEoWJRcdPHzF
        bOejDLc5Hv3U/0MQWsCKtQ==
X-Google-Smtp-Source: ABdhPJw+7j5G+H31RvX9lnlVmSu7O6kxudvN3FnoGLCqWlzGxVhv4fst1OMZZ2iotKqHSJScjGdXAg==
X-Received: by 2002:a4a:4548:: with SMTP id y69mr1401994ooa.52.1634586783676;
        Mon, 18 Oct 2021 12:53:03 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net. [66.90.148.213])
        by smtp.gmail.com with ESMTPSA id l10sm3132430otj.9.2021.10.18.12.53.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Oct 2021 12:53:03 -0700 (PDT)
Received: (nullmailer pid 2842981 invoked by uid 1000);
        Mon, 18 Oct 2021 19:53:02 -0000
Date:   Mon, 18 Oct 2021 14:53:02 -0500
From:   Rob Herring <robh@kernel.org>
To:     Luca Weiss <luca@z3ntu.xyz>
Cc:     Rob Herring <robh+dt@kernel.org>,
        David Collins <collinsd@codeaurora.org>,
        linux-kernel@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht,
        linux-arm-msm@vger.kernel.org, konrad.dybcio@somainline.org,
        Liam Girdwood <lgirdwood@gmail.com>,
        devicetree@vger.kernel.org,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Mark Brown <broonie@kernel.org>, Andy Gross <agross@kernel.org>
Subject: Re: [PATCH v2 02/11] dt-bindings: regulator: qcom,rpmh: Add
 compatible for PM6350
Message-ID: <YW3QnsAsQ/7m9kQK@robh.at.kernel.org>
References: <20211007212444.328034-1-luca@z3ntu.xyz>
 <20211007212444.328034-3-luca@z3ntu.xyz>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211007212444.328034-3-luca@z3ntu.xyz>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, 07 Oct 2021 23:24:29 +0200, Luca Weiss wrote:
> Add compatible string for pm6350 used in sm6350 boards.
> 
> Signed-off-by: Luca Weiss <luca@z3ntu.xyz>
> ---
>  .../devicetree/bindings/regulator/qcom,rpmh-regulator.yaml      | 2 ++
>  1 file changed, 2 insertions(+)
> 

Acked-by: Rob Herring <robh@kernel.org>
