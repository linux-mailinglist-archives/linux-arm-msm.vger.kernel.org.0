Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3432E4151B2
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Sep 2021 22:53:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237592AbhIVUzA (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 22 Sep 2021 16:55:00 -0400
Received: from mail-ot1-f43.google.com ([209.85.210.43]:46041 "EHLO
        mail-ot1-f43.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233797AbhIVUy7 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 22 Sep 2021 16:54:59 -0400
Received: by mail-ot1-f43.google.com with SMTP id l7-20020a0568302b0700b0051c0181deebso5361096otv.12;
        Wed, 22 Sep 2021 13:53:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=y/dW/pq8FDrzQ29yuJPeTe3zSm6g3RQWR6NZqaLCOlU=;
        b=AkRQW5f1o3qSOu0oMLBnSK5B1gnPs4gyRJ+PuXIkx1sFZyK8LdRRbQG36WoSJsVkbF
         jlt5cDbCY6c77U33VFCZf5kHzHtLtJwtKSmZdzRdVcO4clIjTWZLc55xEH64Z/MfsVY+
         sWyakOguwUdXdqS3ALhlQ6P8Y26luKLw03nOxWuDABOewKN6v00+5i45JXU8wOQE0lSV
         3ZCbVXLbIgaETzgpKZHo7edyl4GOvfVfaozOqmMqjxbYWU5s0yG5xmtXzCBOdC9zO3Lb
         tD6eulWJr/ZpYClROMXlf6y5ESr7hg1/ve+7LGKPvPCUtOSQbueQW0f/8OwAP64oVni+
         cbxA==
X-Gm-Message-State: AOAM532S4gEpusau4kJogJ6wtvokMvp0Qp2nbXev0HJVTxRLk4THZzt3
        kh/BF3+WuK9SOThJzGlDTRESBT46vg==
X-Google-Smtp-Source: ABdhPJzYpS0XKU9QDOprKDSj4NBKQ9FB5qBjzMjBU8ppQuAMVj9yY6NrqzRfylfaQ+3yRQ+ARZEZpQ==
X-Received: by 2002:a9d:470b:: with SMTP id a11mr992113otf.337.1632344008987;
        Wed, 22 Sep 2021 13:53:28 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net. [66.90.148.213])
        by smtp.gmail.com with ESMTPSA id g23sm755177otl.23.2021.09.22.13.53.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Sep 2021 13:53:28 -0700 (PDT)
Received: (nullmailer pid 1274894 invoked by uid 1000);
        Wed, 22 Sep 2021 20:53:27 -0000
Date:   Wed, 22 Sep 2021 15:53:27 -0500
From:   Rob Herring <robh@kernel.org>
To:     Shawn Guo <shawn.guo@linaro.org>
Cc:     Stephen Boyd <sboyd@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Loic Poulain <loic.poulain@linaro.org>,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 2/2] clk: qcom: Add Global Clock Controller driver for
 QCM2290
Message-ID: <YUuXxzGnc9iU/eYN@robh.at.kernel.org>
References: <20210919023308.24498-1-shawn.guo@linaro.org>
 <20210919023308.24498-3-shawn.guo@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210919023308.24498-3-shawn.guo@linaro.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Sun, Sep 19, 2021 at 10:33:08AM +0800, Shawn Guo wrote:
> Add Global Clock Controller (GCC) driver for QCM2290.  This is a porting
> of gcc-scuba driver from CAF msm-4.19, with GDSC support added on top.
> 
> Because the alpha_pll on the platform has a different register
> layout (offsets), its own clk_alpha_pll_regs_offset[] is used in the
> driver.
> 
> Signed-off-by: Shawn Guo <shawn.guo@linaro.org>
> ---
>  drivers/clk/qcom/Kconfig                     |    7 +
>  drivers/clk/qcom/Makefile                    |    1 +
>  drivers/clk/qcom/gcc-qcm2290.c               | 3047 ++++++++++++++++++
>  include/dt-bindings/clock/qcom,gcc-qcm2290.h |  188 ++

Really this should be in the binding patch.

Acked-by: Rob Herring <robh@kernel.org>

>  4 files changed, 3243 insertions(+)
>  create mode 100644 drivers/clk/qcom/gcc-qcm2290.c
>  create mode 100644 include/dt-bindings/clock/qcom,gcc-qcm2290.h

