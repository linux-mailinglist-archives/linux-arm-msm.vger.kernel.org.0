Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C1BF15F3811
	for <lists+linux-arm-msm@lfdr.de>; Mon,  3 Oct 2022 23:48:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230028AbiJCVsd (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 3 Oct 2022 17:48:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58518 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229733AbiJCVsB (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 3 Oct 2022 17:48:01 -0400
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com [IPv6:2a00:1450:4864:20::530])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3EB532873C
        for <linux-arm-msm@vger.kernel.org>; Mon,  3 Oct 2022 14:46:58 -0700 (PDT)
Received: by mail-ed1-x530.google.com with SMTP id z97so16375538ede.8
        for <linux-arm-msm@vger.kernel.org>; Mon, 03 Oct 2022 14:46:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=zAYgLaSnCGfa8SU+NH6gwotTtGoSsucybfqj2dUgdAM=;
        b=RVCHdxanJVyFUUSS93q51N8+I1tKBI9oAEVRe7ilmYWZ9MVp144gXBv1kYTZdfHXIo
         9lc93g5a6zAwnxi+IvV2eQNDN8yVYIRsARw/tGeVX/FTGHISN76GQUHSB3tL9GTLt00u
         eaJXvON2TmHWt2QX/iHVvDkb5d9bfrmez1YjXEUlbBiEdj27TfLdfIFFL5y6gpQ+HB9g
         6Kokd8mvIrOqXQULEHmMy46RbGcqbunOiWoiW2Wx86hYFaA4BXH7JGY8TsdecRAaO+fZ
         zdlQsot4zbqHoFw4uG+RwUovIZPv27RaBx1HSDOxt7kpH+qPCULMl4xg+lh8TgQkDJci
         hOqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=zAYgLaSnCGfa8SU+NH6gwotTtGoSsucybfqj2dUgdAM=;
        b=ZyFLIqRkt3VADfYODUZNV0zb0Gl2GNnXY5duAYxvNZjaC1udBuYRiVh0YhIaXQOYLc
         eRR/JOOudftEd9pOZQKAQHu9KVhDT2tNqY/UQDm26BO8HysBcm8fWyJHkST6oupK2X9H
         alfXgn+48v47fuzHXO8WSP63FODS3W7FnZbvvBbyk1kRge7vKOM/ANqrsQIi4FOz3fdN
         U0rLA8T7PXJHvJXl5+1Rlmq7cyggf/i+n42BPP41XqnB3kDoTH2tG1sjd88kaf/93hNz
         CGIdmZcDjvze9+DXwfHRjCH7vP1F+K/3Q4Iv3EVAGD/8Jx1yxnwVW5KmGHerrlLuEOVs
         3PeA==
X-Gm-Message-State: ACrzQf2bNUpFfDcck8jX5qU3gcvr+ptdqG2+0udSuPz3MxjSm0k/QFnL
        agCKwmbG+7ICnO7BxVLzXjnI39gSj0OdkreDSeDPZQ==
X-Google-Smtp-Source: AMsMyM5UrjbvOzcq6FmvgXykvlePJByBD7ZIVQlTnIbpQrim0/itLwb6Rh67og69RE+wWbcGISW74QVzBjgoCyQJcgw=
X-Received: by 2002:a05:6402:2690:b0:452:3a85:8b28 with SMTP id
 w16-20020a056402269000b004523a858b28mr20040077edd.158.1664833616720; Mon, 03
 Oct 2022 14:46:56 -0700 (PDT)
MIME-Version: 1.0
References: <20220927191736.299702-1-marex@denx.de> <20220927191736.299702-2-marex@denx.de>
In-Reply-To: <20220927191736.299702-2-marex@denx.de>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Mon, 3 Oct 2022 23:46:45 +0200
Message-ID: <CACRpkdZRq0oOXfn0-SHG5Rv0=f_Lb=-+Yy0ST_tY9+JPqxwV6Q@mail.gmail.com>
Subject: Re: [PATCH 2/3] ARM: dts: qcom: Drop MMCI interrupt-names
To:     Marek Vasut <marex@denx.de>
Cc:     linux-arm-kernel@lists.infradead.org,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        Yann Gautier <yann.gautier@foss.st.com>,
        devicetree@vger.kernel.org, linux-mmc@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, Sep 27, 2022 at 9:17 PM Marek Vasut <marex@denx.de> wrote:

> The pl18x MMCI driver does not use the interrupt-names property,
> the binding document has been updated to recommend this property
> be unused, remove it.
>
> Signed-off-by: Marek Vasut <marex@denx.de>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
