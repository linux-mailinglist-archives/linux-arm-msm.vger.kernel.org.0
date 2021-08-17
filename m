Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9C7FF3EF410
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Aug 2021 22:49:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235763AbhHQU3O (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 17 Aug 2021 16:29:14 -0400
Received: from mail-ot1-f52.google.com ([209.85.210.52]:35569 "EHLO
        mail-ot1-f52.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235132AbhHQU3G (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 17 Aug 2021 16:29:06 -0400
Received: by mail-ot1-f52.google.com with SMTP id f16-20020a056830205000b00519b99d3dcbso5422194otp.2;
        Tue, 17 Aug 2021 13:28:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=Z4dBHooq1bASpBqTk3MDB5KAaY77sV0YTYXYdfTE/+k=;
        b=Pf/lSK6K0poX/cfBR1jQZtY/kCDdhKT+VnyAdUiZkryk3V77S65SBHbSD9ltALxE0+
         FIeH1tfFukIJeZDpb4NHMEDAjA5TAsppnhclrqkpx5qFrivhtQn25IaRn+un93sE174q
         uA+aNc7es8Z9PoIO/3O21qqVp6yuWa3A1IDiYVbr15pzyoBhGK7bs6qDdgIGWdph7ABk
         +ueC2N5UIKSi5XOeTVAzp5/NG81f1cwNZM2bJ6rrXrL2V92uZ9PJ+Du1w5qhV7mob66R
         lMino++q86CoIGJ+Lk6JxsDzPL3wzmBKkQyihr3/tCYaOqFWa27w4veGz6mEZiBANYRB
         TMJA==
X-Gm-Message-State: AOAM530X6b5BIeo0L1W0eCNzCnBVSpHtAGMXCjNzVggwz04sHSM0zv6L
        l5iIh0vvhorfpRxx+RxB1A==
X-Google-Smtp-Source: ABdhPJxHnvFWpPjxlRsJ+Lu3AR9GDkxDl4XHBhooeU0CeF0YsA72ZCUdu6+P8HPKdmkEsbdjHekbjQ==
X-Received: by 2002:a9d:5cb:: with SMTP id 69mr4144339otd.90.1629232112710;
        Tue, 17 Aug 2021 13:28:32 -0700 (PDT)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id k16sm630386oor.16.2021.08.17.13.28.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Aug 2021 13:28:32 -0700 (PDT)
Received: (nullmailer pid 785019 invoked by uid 1000);
        Tue, 17 Aug 2021 20:28:31 -0000
Date:   Tue, 17 Aug 2021 15:28:31 -0500
From:   Rob Herring <robh@kernel.org>
To:     Sireesh Kodali <sireeshkodali@protonmail.com>
Cc:     phone-devel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht,
        robh+dt@kernel.org, bjorn.andersson@linaro.org, agross@kernel.org,
        linux-arm-msm@vger.kernel.org, jassisinghbrar@gmail.com,
        sivaprak@codeaurora.org, Vladimir Lypak <junak.pub@gmail.com>,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH 3/4] dt-bindings: firmware: qcom-scm: Document msm8953
 bindings
Message-ID: <YRwb7ypyByrBsLX6@robh.at.kernel.org>
References: <20210810164347.45578-1-sireeshkodali@protonmail.com>
 <20210810164347.45578-4-sireeshkodali@protonmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210810164347.45578-4-sireeshkodali@protonmail.com>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, 10 Aug 2021 16:44:39 +0000, Sireesh Kodali wrote:
> From: Vladimir Lypak <junak.pub@gmail.com>
> 
> SCM driver on MSM8953 requires 3 clocks.
> 
> Signed-off-by: Vladimir Lypak <junak.pub@gmail.com>
> Signed-off-by: Sireesh Kodali <sireeshkodali@protonmail.com>
> ---
>  Documentation/devicetree/bindings/firmware/qcom,scm.txt | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 

Acked-by: Rob Herring <robh@kernel.org>
