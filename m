Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2403DB2782
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Sep 2019 23:50:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731407AbfIMVs6 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 13 Sep 2019 17:48:58 -0400
Received: from mail-ot1-f67.google.com ([209.85.210.67]:33172 "EHLO
        mail-ot1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731274AbfIMVs6 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 13 Sep 2019 17:48:58 -0400
Received: by mail-ot1-f67.google.com with SMTP id g25so29544331otl.0;
        Fri, 13 Sep 2019 14:48:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:from:subject:references
         :in-reply-to:cc:to;
        bh=F5i3pST068XlEsFhofNRZcjySyRikQYQGvU4JMBRh/0=;
        b=svSp+CpDn8T9ZeyawnQU7v+12egNyalUNEAWwMY0X5ArtH6yH5b5g9uxhAaoPV2sZR
         HEgZMokvqmNjyJCdVekiT9ZGplGLbC1vyntAWCYUj2sdZJ3meEZA1LexfA88tj1bzy6X
         qUQFksjR1mObNTtFtM1CWZS5caEb9OCMXUZcklfkKjnVTjFUi85NS53hJaHlN5UCWqUE
         2BeZVSEVrTH9QJ+MxtqveCsa45opSEskkKWfP5R1+GIzNWdxKngA6l5PUJImG3anCQlT
         duK/gklUZBqMmZi5/4zCpC61AHrwBn9Gqsl2bEez04+jjQFDH9ab7HXoCoAuP8YG/u0m
         fUYQ==
X-Gm-Message-State: APjAAAWOnnArA36CkfcoFO5ohjw4IgAweefYp9xWTn++zmgWGgXgy+p2
        sr+onItbBX7tUiRYgD/40Q==
X-Google-Smtp-Source: APXvYqzO/3Tphrwno2FqrPOfHIJwNFYOOudaWVHIj8NqaSgUaGGotTeyPmHQQmk+/bGFHefXZK8pYA==
X-Received: by 2002:a9d:4786:: with SMTP id b6mr946022otf.112.1568411337306;
        Fri, 13 Sep 2019 14:48:57 -0700 (PDT)
Received: from localhost (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id j20sm1274447oie.55.2019.09.13.14.48.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Sep 2019 14:48:56 -0700 (PDT)
Message-ID: <5d7c0ec8.1c69fb81.e5ca8.949d@mx.google.com>
Date:   Fri, 13 Sep 2019 16:48:56 -0500
From:   Rob Herring <robh@kernel.org>
Subject: Re: [PATCH V2 06/12] dt-bindings: clock: qcom: Add reset for WCSSAON
References: <1568375771-22933-1-git-send-email-gokulsri@codeaurora.org> <1568375771-22933-7-git-send-email-gokulsri@codeaurora.org>
In-Reply-To: <1568375771-22933-7-git-send-email-gokulsri@codeaurora.org>
Cc:     gokulsri@codeaurora.org, sboyd@kernel.org, agross@kernel.org,
        bjorn.andersson@linaro.org, david.brown@linaro.org,
        devicetree@vger.kernel.org, jassisinghbrar@gmail.com,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        mark.rutland@arm.com, mturquette@baylibre.com, ohad@wizery.com,
        robh+dt@kernel.org, sricharan@codeaurora.org,
        nprakash@codeaurora.org
To:     Gokul Sriram Palanisamy <gokulsri@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, 13 Sep 2019 17:26:05 +0530, Gokul Sriram Palanisamy wrote:
> Add binding for WCSSAON reset required for Q6v5 reset on IPQ8074 SoC.
> 
> Signed-off-by: Gokul Sriram Palanisamy <gokulsri@codeaurora.org>
> Signed-off-by: Sricharan R <sricharan@codeaurora.org>
> Signed-off-by: Nikhil Prakash V <nprakash@codeaurora.org>
> ---
>  include/dt-bindings/clock/qcom,gcc-ipq8074.h | 1 +
>  1 file changed, 1 insertion(+)
> 

Please add Acked-by/Reviewed-by tags when posting new versions. However,
there's no need to repost patches *only* to add the tags. The upstream
maintainer will do that for acks received on the version they apply.

If a tag was not added on purpose, please state why and what changed.

