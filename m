Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B082B636316
	for <lists+linux-arm-msm@lfdr.de>; Wed, 23 Nov 2022 16:16:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238558AbiKWPQj (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 23 Nov 2022 10:16:39 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52498 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236495AbiKWPQe (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 23 Nov 2022 10:16:34 -0500
Received: from mail-io1-xd33.google.com (mail-io1-xd33.google.com [IPv6:2607:f8b0:4864:20::d33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 850D68C7AB
        for <linux-arm-msm@vger.kernel.org>; Wed, 23 Nov 2022 07:16:33 -0800 (PST)
Received: by mail-io1-xd33.google.com with SMTP id 11so13395116iou.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 23 Nov 2022 07:16:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=lGE6BKuj326AJ82T83DvVxZ0DYwNuIX7ccv1+9PqUqE=;
        b=WZGLoOztnyNm6C39o3//8Zo4itUR9eutcgsd+b04YMLSwhE1dh0oDlo2/fTIYVYSE+
         Ah7v66HYuXG5YuDNzQULF+r9op+hD0PrMQDpKTGDLBgbdZZQaBV1QdhOQC8jTJcFOPdy
         QkIVMl/glef61r/US/tqg2HWQ2rk1747Jvz0w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lGE6BKuj326AJ82T83DvVxZ0DYwNuIX7ccv1+9PqUqE=;
        b=TC8cEkr5JuLkN6C7Ws6zUsp+Rp0OkEEZ/UerE+3qdquHEhXP2N7W4lsjGyLBlnRprp
         pFmJU2mZFnWL9ZIMiXdYReS90zJMez5z/QLDPYt3bPbI8okrQo/igW8Hke4yp1xVjJYW
         zQNcfcCe6ZarkS8sDmShjBDxEFilcMVn6lzB8pBJwwzq0pEat7CRMEjyZ39LJzzzIa4S
         yA8i2TZwm1FzGvdwzEn2QRDy9Noc7/Mg7cwfwWYnIuyb7qPJ8hzXh6v7E3W0SNEvxgf5
         C9N6n5pyOGBUhc0TiP1CJAn1zy+AlPw+b25sZC6PUfvWqkBu2dCUXIIo/GSYyG3wVfOE
         UfBQ==
X-Gm-Message-State: ANoB5pkivtHrvo7tml8lWFkHEXCS4rMcgLWGJqE1S6Mjtq5nQZsjDHvp
        fc/ObNQts6tlByZsjaVdQGnrhA==
X-Google-Smtp-Source: AA0mqf4Lsureu2AtI9If7DngYBHjgZNdseAN09jEFxw3G0tFNpcnh/I/PPnfD5dd1xLf1dpoQGB4CA==
X-Received: by 2002:a02:710d:0:b0:374:646a:f97c with SMTP id n13-20020a02710d000000b00374646af97cmr12127605jac.55.1669216592901;
        Wed, 23 Nov 2022 07:16:32 -0800 (PST)
Received: from localhost (30.23.70.34.bc.googleusercontent.com. [34.70.23.30])
        by smtp.gmail.com with UTF8SMTPSA id 13-20020a056e0211ad00b003024928a9afsm5814197ilj.83.2022.11.23.07.16.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Nov 2022 07:16:32 -0800 (PST)
Date:   Wed, 23 Nov 2022 15:16:32 +0000
From:   Matthias Kaehlcke <mka@chromium.org>
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc:     Owen Yang <ecs.taipeikernel@gmail.com>,
        LKML <linux-kernel@vger.kernel.org>,
        Stephen Boyd <swboyd@chromium.org>, Harvey <hunge@google.com>,
        Bob Moragues <moragues@chromium.org>,
        Douglas Anderson <dianders@chromium.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH 2/2] arm64: dts: qcom: sc7280: Add DT for
 sc7280-herobrine-zombie
Message-ID: <Y345UBbuQDfu61Qm@google.com>
References: <20221123181043.1.Idfcba5344b7995b44b7fa2e20f1aa4351defeca6@changeid>
 <20221123181043.2.Ie435b31225d2dc284a34ac8e52fb84fffb39488c@changeid>
 <Y34wtwSlqc0y4Msz@google.com>
 <2495157e-c827-cbe4-2d88-1cd1f45d6d11@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <2495157e-c827-cbe4-2d88-1cd1f45d6d11@linaro.org>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, Nov 23, 2022 at 03:58:06PM +0100, Krzysztof Kozlowski wrote:
> On 23/11/2022 15:39, Matthias Kaehlcke wrote:
> > On Wed, Nov 23, 2022 at 06:11:13PM +0800, Owen Yang wrote:
> > 
> >> Subject: [2/2] arm64: dts: qcom: sc7280: Add DT for sc7280-herobrine-zombie
> > 
> > Please in include a version number for versions >1. If my accounting is correct
> > this is v3, so the next iteration should be v4.
> > 
> > You mentioned earlier that you are using patman. Add the following tag to
> > one of the patches in the series to get the version included in the subject:
> > 
> > Series-version: 4
> 
> It is a bit surprise that this patch is a v4...  because I do not
> remember v1 and v2... and v3. And no wonder since I was not CC-ed :/
> 
> It still surprised me how many people just cannot use
> scripts/get_maintainers.pl. Everywhere, in each company. There is a tool
> which they claim to use but they don't... or they base their patches on
> one year old kernel which is another surprise...

I suspect in this case the patches were based on a downstream tree. Owen is
probably newer to upstream kernel development, let's celebrate that more
people/companies get involved and guide them towards the upstream way of
doing things, which might not always be obvious to folks who are newer to
this :)
