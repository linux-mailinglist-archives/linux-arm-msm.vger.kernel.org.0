Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0B68962E008
	for <lists+linux-arm-msm@lfdr.de>; Thu, 17 Nov 2022 16:38:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233899AbiKQPiK (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 17 Nov 2022 10:38:10 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50522 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239636AbiKQPiA (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 17 Nov 2022 10:38:00 -0500
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com [IPv6:2a00:1450:4864:20::52b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B547E697D4
        for <linux-arm-msm@vger.kernel.org>; Thu, 17 Nov 2022 07:37:52 -0800 (PST)
Received: by mail-ed1-x52b.google.com with SMTP id f7so3075179edc.6
        for <linux-arm-msm@vger.kernel.org>; Thu, 17 Nov 2022 07:37:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=gyfLDCXcuLa+C4OYIAkICRz8xqfia7ngJD8kmgn0ZTA=;
        b=KKmMVS1epMfQldi2MnGOupMKOvuYohhAkJLmOxrz7u/rOjbIqz7Xu6iQoHWwPB7iX3
         PRmGp1LE9EMO/7OYGm2Y+cEzoGjl5LFrbONA9pqRLgBoLrCeDX7d1ZpYFf4w5H6tIEFu
         4bGiHKdGQcsjlZQYzTKeaoRYPJwhBocOj1c5k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gyfLDCXcuLa+C4OYIAkICRz8xqfia7ngJD8kmgn0ZTA=;
        b=4niS3ACCVA9xDkS59TGpRF+CI3X1+7xJGe3QTD6IIAKZsw2gXG3rGPHooSfR+t9l8n
         NFjICh/y5CfMhurPaliJia5dc5dzNyVq53Swzn3abyhF34lxhGqhpzWLP99CpPtj7WDf
         oZy9IbbiOybrxXtU8QwRDqatUaCzZ5AIV1d6k4txfSd8Q7w0EWuhDzhCFf8phOs1+wxE
         nwHIBTQwLkI/VcsLIjtLU4m9ibUVLYd0rY6E9/zw/Cr6/tNzRmecNPfYvYpkfh3RwaRz
         s7po3E8Gq9nBE8zrxC/7B7oMvGU0tqoY7oJmRfcDY11bRyMdyfDhWEZGD4p/e4ZKoVem
         bjXA==
X-Gm-Message-State: ANoB5pmaC8vujdi3EjlMpPDcV9N6/2La0QieA7udL6XxhlokLmbXmu37
        QfZvOYZ+3MU2g25rRk6DZgQmcY6k4atMPANl
X-Google-Smtp-Source: AA0mqf7ZFFC8bpZ8iaPARdjwirWSb7k8b36nlVuaGyao1B6/yZIhfPe00MawVcW/aGrTDv+peC91NA==
X-Received: by 2002:aa7:d7cc:0:b0:45b:4a4b:478c with SMTP id e12-20020aa7d7cc000000b0045b4a4b478cmr2567424eds.317.1668699470430;
        Thu, 17 Nov 2022 07:37:50 -0800 (PST)
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com. [209.85.221.44])
        by smtp.gmail.com with ESMTPSA id ew5-20020a056402538500b004619f024864sm659334edb.81.2022.11.17.07.37.48
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 17 Nov 2022 07:37:49 -0800 (PST)
Received: by mail-wr1-f44.google.com with SMTP id x5so449075wrt.7
        for <linux-arm-msm@vger.kernel.org>; Thu, 17 Nov 2022 07:37:48 -0800 (PST)
X-Received: by 2002:a5d:53c4:0:b0:236:7741:fa7b with SMTP id
 a4-20020a5d53c4000000b002367741fa7bmr1851138wrw.138.1668699468263; Thu, 17
 Nov 2022 07:37:48 -0800 (PST)
MIME-Version: 1.0
References: <20221117094251.1.I74849cf9699b8ff2e47f6028e28861101297549b@changeid>
 <20221117094251.2.Ibfc4751e4ba044d1caa1f88a16015e7c45c7db65@changeid>
In-Reply-To: <20221117094251.2.Ibfc4751e4ba044d1caa1f88a16015e7c45c7db65@changeid>
From:   Doug Anderson <dianders@chromium.org>
Date:   Thu, 17 Nov 2022 07:37:35 -0800
X-Gmail-Original-Message-ID: <CAD=FV=Vd4UFabWeEsd7cDhhpnFkjTuYhc38zwAbfyxq2AHnhYA@mail.gmail.com>
Message-ID: <CAD=FV=Vd4UFabWeEsd7cDhhpnFkjTuYhc38zwAbfyxq2AHnhYA@mail.gmail.com>
Subject: Re: [PATCH 2/2] Adding DT binding for zombie
To:     Owen Yang <ecs.taipeikernel@gmail.com>
Cc:     LKML <linux-kernel@vger.kernel.org>, Harvey <hunge@google.com>,
        Bob Moragues <moragues@chromium.org>,
        Andy Gross <agross@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Stephen Boyd <sboyd@codeaurora.org>,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Bjorn Andersson <andersson@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On Wed, Nov 16, 2022 at 5:44 PM Owen Yang <ecs.taipeikernel@gmail.com> wrote:
>
>     creating first device tree binding for zombie case.
>
>     Documentation/devicetree/bindings/arm/qcom.yaml
>
>     Series-to: LKML <linux-kernel@vger.kernel.org>
>     Series-cc: Douglas Anderson <dianders@chromium.org>
>     Series-cc: Bob Moragues <moragues@chromium.org>
>     Series-cc: Harvey <hunge@google.com>
>
> Signed-off-by: Owen Yang <ecs.taipeikernel@gmail.com>
> ---
>
>  Documentation/devicetree/bindings/arm/qcom.yaml | 10 ++++++++++
>  1 file changed, 10 insertions(+)

There are a few problems with this patch.

1. The patch does not apply to the top of the upstream Qualcomm tree
(it gets merge conflicts). You should be sending your patches against
the upstream Qualcomm dts tree, which is where they will land. For
instance, since you're sending patches with patman you could make sure
you're targeting the right tree with something like this:

git remote add linux_qcom
git://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git
get fetch --no-tags linux_qcom
git checkout -b 221117-send-zombie linux_qcom/for-next
git cherry-pick ${PATCH1_TO_SEND}
git cherry-pick ${PATCH2_TO_SEND}
...
git cherry-pick ${PATCHN_TO_SEND}
patman

2. Because you were based on the wrong tree, you got Bjorn's email
address wrong. You need his @kernel.org address. If you were targeting
the correct tree then it would have been auto-fixed up for you by the
.mailmap.

3. A minor detail, but "bindings" should be patch #1 and the device
tree should be patch #2.

4. If I were picking the right place to add Zombie in the bindings, I
would put it right after the "Villager" entries. Then all the Google
sc7280 devices are next to each other and sorted by name.

5. Somehow your patch description contains a bunch of "patman"
commands directly. I think maybe this is because you indented them and
thus patman didn't process the commands? Please try sending again
after getting rid of the indentation. Also the
"Documentation/devicetree/bindings/arm/qcom.yaml" line doesn't belong
in the description.

6. The ${SUBJECT} of your patch (which comes from the first line of
the patch description) needs tags. It probably should be:

dt-bindings: arm: qcom: Add initial sc7280-zombie entries

7. The patch description should ideally be a proper sentence (with the
first word capitalized, for instance), like:

Add an entry in the device tree binding for sc7280-zombie.

8. Just to be consistent with other Chromebooks and to handle the case
when we later add extra revs, please add "(newest rev)" for all of
your descriptions in the yaml.
