Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 26E612E810D
	for <lists+linux-arm-msm@lfdr.de>; Thu, 31 Dec 2020 16:42:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727050AbgLaPmh (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 31 Dec 2020 10:42:37 -0500
Received: from mail-oi1-f172.google.com ([209.85.167.172]:35966 "EHLO
        mail-oi1-f172.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726698AbgLaPmh (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 31 Dec 2020 10:42:37 -0500
Received: by mail-oi1-f172.google.com with SMTP id 9so22160830oiq.3;
        Thu, 31 Dec 2020 07:42:21 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=7ZRD6+gK6uV7qY4ayTDAh6QuqyD8TOAxjhUKABzcOrc=;
        b=Rmn6T4Xo6FIpQkvEJG7g1f/ynC22L9wifW/uwA4eyVJIWnhjiPQquLBNKEm41ipRhx
         O4dsUOtqg3c02IiHYorY1rHb4v1HCP8VB9blhqgEiiw6uXT/Frtu8urm9jIqYskjC0hN
         mPy8bOXxNO/FDqEPv/FL3QOxF9i3CYU1FpZtKdK5rEMifLswXxk4DswRZN4uZ1CCzPUa
         OY1WYq7N6IeozPNKc8cK92aVOIx7017EwKkVcXnIuCRPA5dBS40B3Dzgkh3Fpe9yF7go
         qsyWejbH07bp2n1k3HraTYqSa7qoBamsyEK/9kkt1r3aoCFjJIagjRlQRW05kkkrrRzk
         RZTw==
X-Gm-Message-State: AOAM531ZOyvi0sOsnyQ6lTO2fKuz3kvKBS+RrDLVur84qATTVnhKdQtU
        o7FkJ/LGBMvhBvmU3/Uv6pK+5DkiYA==
X-Google-Smtp-Source: ABdhPJwqbag5+xGVSjUpUqGq4vOhtTuK2v8OIDRkh/Bn9LulVKav7Xx4HrzHXxyRkpHx2BgxYHBqkQ==
X-Received: by 2002:aca:4dc3:: with SMTP id a186mr8038426oib.107.1609429316278;
        Thu, 31 Dec 2020 07:41:56 -0800 (PST)
Received: from robh.at.kernel.org ([64.188.179.253])
        by smtp.gmail.com with ESMTPSA id 11sm11234456oty.65.2020.12.31.07.41.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 31 Dec 2020 07:41:55 -0800 (PST)
Received: (nullmailer pid 1839736 invoked by uid 1000);
        Thu, 31 Dec 2020 15:41:53 -0000
Date:   Thu, 31 Dec 2020 08:41:53 -0700
From:   Rob Herring <robh@kernel.org>
To:     Hsin-Hsiung Wang <hsin-hsiung.wang@mediatek.com>
Cc:     linux-kernel@vger.kernel.org, Ulf Hansson <ulf.hansson@linaro.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Mark Brown <broonie@kernel.org>, srv_heupstream@mediatek.com,
        Project_Global_Chrome_Upstream_Group@mediatek.com,
        linux-mediatek@lists.infradead.org,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Rob Herring <robh+dt@kernel.org>
Subject: Re: [PATCH v5 2/4] dt-bindings: spmi: document binding for the
 Mediatek SPMI controller
Message-ID: <20201231154153.GA1839701@robh.at.kernel.org>
References: <1608691469-20919-1-git-send-email-hsin-hsiung.wang@mediatek.com>
 <1608691469-20919-3-git-send-email-hsin-hsiung.wang@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1608691469-20919-3-git-send-email-hsin-hsiung.wang@mediatek.com>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, 23 Dec 2020 10:44:27 +0800, Hsin-Hsiung Wang wrote:
> This adds documentation for the SPMI controller found on Mediatek SoCs.
> 
> Signed-off-by: Hsin-Hsiung Wang <hsin-hsiung.wang@mediatek.com>
> ---
>  .../bindings/spmi/mtk,spmi-mtk-pmif.yaml      | 74 +++++++++++++++++++
>  1 file changed, 74 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/spmi/mtk,spmi-mtk-pmif.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>
