Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B05DA518965
	for <lists+linux-arm-msm@lfdr.de>; Tue,  3 May 2022 18:11:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239198AbiECQPQ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 3 May 2022 12:15:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55702 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239192AbiECQPO (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 3 May 2022 12:15:14 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id EE2E935AB9
        for <linux-arm-msm@vger.kernel.org>; Tue,  3 May 2022 09:11:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1651594301;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=wp9YHmXDYvM0vTO+lxeqnR+ljJmF4tJFHnGldB3QeSU=;
        b=Bk9aUhOkiOiaB5D4QjW5L25a8F93aNIh6YPoYQrYUlNRZjflin9FEv2RTfM1YMPaFJANDW
        9AasesA+3vOlj/vkc4L3LUglmuJdfzJOrmIkXCM0oJxacSBdzfvFIdG3xAX5D3K/AA3JBQ
        ZuDQGI8VCeMOcSVclPPLJNQKZfIrGkI=
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-393-AAthxQRpPue1k0pIaX9Nvw-1; Tue, 03 May 2022 12:11:13 -0400
X-MC-Unique: AAthxQRpPue1k0pIaX9Nvw-1
Received: by mail-qv1-f71.google.com with SMTP id m8-20020a0c9d08000000b00456549a0589so12659300qvf.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 03 May 2022 09:11:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=wp9YHmXDYvM0vTO+lxeqnR+ljJmF4tJFHnGldB3QeSU=;
        b=2OBzwfxaEBBXVlK9qMMqXjIACDqW5dJrVJUqdlyN7805bfP1VZ5L1F1BXfH5jdQyx1
         9MPsLboqG/4ghgkD42biBSmkLF/zPj1uH+wJJzLgsHzDfZJa8of4EffyeN207aRl60iV
         LiUKpxnxg64No3Gta99z7M4wwAGWOm4oROIjtpdCRBHtY2vx0RFDf6rajyTJmMTsKy6w
         ms6nWEShmdf4zj+7iBnPG9aBNfxC/BjiAmj/HJgcWND/PlfD6Dm5cr3HvN2rlYFEWrmA
         pgKXZrJ+Qm5iL6rDZV9MX1g8X5Pu5wbcvkLGMlny3x/sxw0GML0ODPdrWiVNUusBKsiz
         f4qA==
X-Gm-Message-State: AOAM5325tj84a54RHeeZou3v7ZwohjDZEEza6GYqOT53WRDBNt3RkHPc
        ESHiQN6Ro+Ibi5Qe2P78ZzoqxemRVBfvdRNGBjQ6lBaro56YJfqfHXI8SCYOhHhIlUkz3oSGpVJ
        v3zANt/WNqmnY5brCxsCUIXpyUQ==
X-Received: by 2002:a05:6214:1c8a:b0:443:bc78:25ef with SMTP id ib10-20020a0562141c8a00b00443bc7825efmr14197039qvb.2.1651594273450;
        Tue, 03 May 2022 09:11:13 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy9Rhyqa7jIDuuJrIMnnrirw3u18xc4X+9oWAePPIds5Soeh/PXfrbwcmifKRoacw+7Ubd3rA==
X-Received: by 2002:a05:6214:1c8a:b0:443:bc78:25ef with SMTP id ib10-20020a0562141c8a00b00443bc7825efmr14197011qvb.2.1651594273166;
        Tue, 03 May 2022 09:11:13 -0700 (PDT)
Received: from x1 (c-98-239-145-235.hsd1.wv.comcast.net. [98.239.145.235])
        by smtp.gmail.com with ESMTPSA id f22-20020ac84716000000b002f39b99f679sm5846102qtp.19.2022.05.03.09.11.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 May 2022 09:11:12 -0700 (PDT)
Date:   Tue, 3 May 2022 12:11:11 -0400
From:   Brian Masney <bmasney@redhat.com>
To:     Ondrej Mosnacek <omosnace@redhat.com>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>,
        linux-arm-msm@vger.kernel.org, linux-crypto@vger.kernel.org,
        linux-kernel@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH] crypto: qcom-rng - fix infinite loop on requests not
 multiple of WORD_SZ
Message-ID: <YnFUH6nyVs8fBgED@x1>
References: <20220503115010.1750296-1-omosnace@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220503115010.1750296-1-omosnace@redhat.com>
User-Agent: Mutt/2.0.7 (2021-05-04)
X-Spam-Status: No, score=-3.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, May 03, 2022 at 01:50:10PM +0200, Ondrej Mosnacek wrote:
> The commit referenced in the Fixes tag removed the 'break' from the else
> branch in qcom_rng_read(), causing an infinite loop whenever 'max' is
> not a multiple of WORD_SZ. This can be reproduced e.g. by running:
> 
>     kcapi-rng -b 67 >/dev/null
> 
> There are many ways to fix this without adding back the 'break', but
> they all seem more awkward than simply adding it back, so do just that.
> 
> Tested on a machine with Qualcomm Amberwing processor.
> 
> Fixes: a680b1832ced ("crypto: qcom-rng - ensure buffer for generate is completely filled")
> Cc: stable@vger.kernel.org
> Signed-off-by: Ondrej Mosnacek <omosnace@redhat.com>

Reviewed-by: Brian Masney <bmasney@redhat.com>

We should add '# 5.17+' to the end of the stable line.

