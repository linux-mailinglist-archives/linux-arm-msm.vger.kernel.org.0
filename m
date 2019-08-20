Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id F3FFE96A7F
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 Aug 2019 22:28:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729950AbfHTU2k (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 20 Aug 2019 16:28:40 -0400
Received: from mail-ot1-f65.google.com ([209.85.210.65]:35181 "EHLO
        mail-ot1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728283AbfHTU2k (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 20 Aug 2019 16:28:40 -0400
Received: by mail-ot1-f65.google.com with SMTP id g17so6298219otl.2;
        Tue, 20 Aug 2019 13:28:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=GWHSKKLiPrrzxMRu4jBXpjBSpRmJsAIvVFhGhsKC1gE=;
        b=bRkgTpOU2Pi2w1+g/TUMoqdC8tANARk6M8if1FoNVZyki3uzy01Jz4flcwQUYQ4f8N
         PwTr7doPN/FSf4GM1t+6WV7y3ETveNdA5W+TQobQE3OMVJkxlEJkdpUGxeCrS/qKuNZj
         VBkNIeo5IXO/QwVwczKjThYwq4yeT5Xs6Zjy1eZOSXwxVgQhG0YZ+VxASGxXmoS5Qgx1
         +7IHNcR+I9C2WvOvQYX9YuB22Js0G5wxulvNR4mVtCeiJO4rNvGkvgShRfwra8YJSe2s
         bzevQNXVuK9I67s1KvfyQMLzqSzI2Zfg2X6eb8cWwoV1+Si64189/SPqmw4hcs6VGlAJ
         6XfQ==
X-Gm-Message-State: APjAAAX4kwcwbl2xc3Or4ikqYYR01VG7QBoFSrmXuxt1j0nkm4xHEd+v
        mggv2a4PAwAUXW79Eljr1HKyEkE=
X-Google-Smtp-Source: APXvYqyQhofV1YOE9JnnO6tzm1Ctxk6PRoJ2680ik9MjZKDEqNOa7FF1feTwUsfspR6eB7nnDytYng==
X-Received: by 2002:a9d:7356:: with SMTP id l22mr7283408otk.31.1566332919308;
        Tue, 20 Aug 2019 13:28:39 -0700 (PDT)
Received: from localhost (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id y88sm5763803ota.32.2019.08.20.13.28.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Aug 2019 13:28:38 -0700 (PDT)
Date:   Tue, 20 Aug 2019 15:28:38 -0500
From:   Rob Herring <robh@kernel.org>
To:     Vinod Koul <vkoul@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Sugaya Taichi <sugaya.taichi@socionext.com>,
        Arnd Bergmann <arnd@arndb.de>,
        Maxime Ripard <maxime.ripard@bootlin.com>,
        Olof Johansson <olof@lixom.net>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: arm: Add kryo485 compatible
Message-ID: <20190820202838.GA14358@bogus>
References: <20190820171020.22673-1-vkoul@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190820171020.22673-1-vkoul@kernel.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, Aug 20, 2019 at 10:40:20PM +0530, Vinod Koul wrote:
> Kryo485 is found in SM8150, so add it it list of cpu compatibles
> 
> Signed-off-by: Vinod Koul <vkoul@kernel.org>
> ---
>  Documentation/devicetree/bindings/arm/cpus.yaml | 1 +
>  1 file changed, 1 insertion(+)

Applied, thanks.

Rob
