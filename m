Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 223557B28EE
	for <lists+linux-arm-msm@lfdr.de>; Fri, 29 Sep 2023 01:42:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232203AbjI1XmP (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 28 Sep 2023 19:42:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37380 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231542AbjI1XmO (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 28 Sep 2023 19:42:14 -0400
Received: from mail-oo1-xc35.google.com (mail-oo1-xc35.google.com [IPv6:2607:f8b0:4864:20::c35])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 75033195
        for <linux-arm-msm@vger.kernel.org>; Thu, 28 Sep 2023 16:42:12 -0700 (PDT)
Received: by mail-oo1-xc35.google.com with SMTP id 006d021491bc7-57b574c6374so5771968eaf.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 28 Sep 2023 16:42:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1695944532; x=1696549332; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=3RV2WVrYFvmUIy/kF4sgLaI/igSwAmnqnqr5+CNVDt8=;
        b=eIm0Tr3UrWUjzJ4jN6/2IK7vGtk83w/aM+dkwIMq+AwB2ci1Gu09xf9F9GMwaILj70
         n4QvEnSrxRKunYK7/hD7XS4qnfKHiKUaPe20ZtTX7CsoKDMIVZZO8CFpNReTVXNSUq67
         RXlmxi/OVy4WJv6gtNUzW8faa2GmV5dV2N214=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695944532; x=1696549332;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3RV2WVrYFvmUIy/kF4sgLaI/igSwAmnqnqr5+CNVDt8=;
        b=W2EQ7iCn9JCi36pzNM0CDd9sAZ3gNXWuXYHNPu6cza8BhurvQSPqRXjNHh23kBjAe/
         09NezDe6yijrexZ1prvccqvjQXdFhhg226YIptciWcrubpagdv6BYir0fMIq3w1rr873
         LIH2GhKP9sB6VylfMAsPs9dydU0Fug4UFwNNrsRtfvbWFhwraJYTDM63IJy50RLzkAAa
         /rdRlOK7uhO/M8YS//Wd2lxeKkPgsj8Aka/h2RFgSmokJIuesIEcCb4JCbN86pFgcdIG
         dKo7l4PW+yAOwYuHgvHtOSmxLa+EoqwTKYRw8BSJJHmzxQHodz0OBZJ2+R0RwMy5PN+s
         f0/A==
X-Gm-Message-State: AOJu0YyiVSl8TXwEr+5QoWjbg5hCvLNQxNBSQTHnAopisszeNtGgjvEk
        1QgQqOYRV+wYiaotpRadCquJyg==
X-Google-Smtp-Source: AGHT+IHBsCldxysDZTajanQY+g4dIkq4a5ohe3XveIhxwgWt0zJyzNyJaoBdNbO8ZXRuiDiGJefhMw==
X-Received: by 2002:a05:6358:2808:b0:13e:ea2a:40aa with SMTP id k8-20020a056358280800b0013eea2a40aamr1895209rwb.8.1695944531707;
        Thu, 28 Sep 2023 16:42:11 -0700 (PDT)
Received: from www.outflux.net (198-0-35-241-static.hfc.comcastbusiness.net. [198.0.35.241])
        by smtp.gmail.com with ESMTPSA id t6-20020a639546000000b0057a868900a9sm13316234pgn.67.2023.09.28.16.42.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Sep 2023 16:42:10 -0700 (PDT)
Date:   Thu, 28 Sep 2023 16:42:09 -0700
From:   Kees Cook <keescook@chromium.org>
To:     Vinod Koul <vkoul@kernel.org>
Cc:     Hector Martin <marcan@marcan.st>, Sven Peter <sven@svenpeter.dev>,
        Alyssa Rosenzweig <alyssa@rosenzweig.io>,
        Ludovic Desroches <ludovic.desroches@microchip.com>,
        Tudor Ambarus <tudor.ambarus@linaro.org>,
        Lars-Peter Clausen <lars@metafoo.de>,
        Zhou Wang <wangzhou1@hisilicon.com>,
        Jie Hai <haijie1@huawei.com>, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Green Wan <green.wan@sifive.com>,
        Orson Zhai <orsonzhai@gmail.com>,
        Baolin Wang <baolin.wang@linux.alibaba.com>,
        Chunyan Zhang <zhang.lyra@gmail.com>,
        Patrice Chotard <patrice.chotard@foss.st.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Laxman Dewangan <ldewangan@nvidia.com>,
        Jon Hunter <jonathanh@nvidia.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Peter Ujfalusi <peter.ujfalusi@gmail.com>,
        Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
        Masami Hiramatsu <mhiramat@kernel.org>,
        Yu Kuai <yukuai3@huawei.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jordy Zomer <jordy@pwning.systems>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Nathan Chancellor <nathan@kernel.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Tom Rix <trix@redhat.com>, linux-kernel@vger.kernel.org,
        asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
        dmaengine@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-tegra@vger.kernel.org, llvm@lists.linux.dev,
        linux-hardening@vger.kernel.org
Subject: Re: [PATCH 00/21] dmaengine: Annotate with __counted_by
Message-ID: <202309281641.47911CC@keescook>
References: <20230817235428.never.111-kees@kernel.org>
 <169590216841.152265.1942803099201042070.b4-ty@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <169590216841.152265.1942803099201042070.b4-ty@kernel.org>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, Sep 28, 2023 at 05:26:08PM +0530, Vinod Koul wrote:
> 
> On Thu, 17 Aug 2023 16:58:37 -0700, Kees Cook wrote:
> > This annotates several structures with the coming __counted_by attribute
> > for bounds checking of flexible arrays at run-time. For more details, see
> > commit dd06e72e68bc ("Compiler Attributes: Add __counted_by macro").
> > 
> > Thanks!
> > 
> > -Kees
> > 
> > [...]
> 
> Applied, thanks!

Thanks! I've dropped them from my tree. :)

Also, I found 1 more, which I'll send separately.

-Kees

-- 
Kees Cook
