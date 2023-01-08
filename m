Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BC1F0661A1A
	for <lists+linux-arm-msm@lfdr.de>; Sun,  8 Jan 2023 22:41:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231446AbjAHVk7 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 8 Jan 2023 16:40:59 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44526 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231383AbjAHVk5 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 8 Jan 2023 16:40:57 -0500
Received: from mail-qt1-f176.google.com (mail-qt1-f176.google.com [209.85.160.176])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 645DBDAF;
        Sun,  8 Jan 2023 13:40:56 -0800 (PST)
Received: by mail-qt1-f176.google.com with SMTP id j15so1071159qtv.4;
        Sun, 08 Jan 2023 13:40:56 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=h+U9PiThMNgkwfd7b2ynY4msHhZSjh3lHEWccNwB6o8=;
        b=SxFmKxLVSKryz3T0UThdYPFxneURhg8wVzgOu5IRPXp+ifRJj2YPJQcs/bKIN6dYPf
         deeqwllPMKwKBzgzLxWUFA5UQZZ5gzdWixEZ5G2zrZSQO2k7JgWD+/A4VFAE8ypKAOxx
         ceoH51M8TtYvMZdE1lMj+q4Sgb3at52eaHr4A1/0cJrfmf0JMosKumx+++HdZ61/S5wT
         D34GUVDdgHxjqLay2qeSnfSLVsA6TbLRAepQT+6J9Z3iUIOnjtU1yCCxT1L7bOqYW8cE
         9LJn0eylN+op01mqvjYClymkwHDc37FSdfP5XLKxu0r5QJCIqpM7oK0XT++n+/bOLlK/
         8SAg==
X-Gm-Message-State: AFqh2kpLbi/JnbxxPbqwEPCe0x4WgkxV93IQmQMlx5uBmwg+nThMav9m
        UcHi97rOObNSRzqBdgufdY5NLjCyAw==
X-Google-Smtp-Source: AMrXdXt1ncnv7OACvCIkor/xf2tHZ5UZSRp+M+XlzxQ8jLtlUv/ujSTvKtuXF3vY8h2VFwrV0gK70A==
X-Received: by 2002:ac8:7386:0:b0:3a8:1896:e2fc with SMTP id t6-20020ac87386000000b003a81896e2fcmr88708769qtp.35.1673214055480;
        Sun, 08 Jan 2023 13:40:55 -0800 (PST)
Received: from robh_at_kernel.org ([2605:ef80:80a5:9b51:39ae:24d1:33f3:811e])
        by smtp.gmail.com with ESMTPSA id i25-20020ac860d9000000b003a7fc70d59csm3705947qtm.41.2023.01.08.13.40.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Jan 2023 13:40:55 -0800 (PST)
Received: (nullmailer pid 316562 invoked by uid 1000);
        Sun, 08 Jan 2023 21:40:52 -0000
Date:   Sun, 8 Jan 2023 15:40:52 -0600
From:   Rob Herring <robh@kernel.org>
To:     Stephan Gerhold <stephan@gerhold.net>
Cc:     Bjorn Andersson <andersson@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org
Subject: Re: [PATCH 3/4] dt-bindings: arm: qcom,ids: Add a bunch of older SoCs
Message-ID: <20230108214052.GA313089-robh@kernel.org>
References: <20230104115348.25046-1-stephan@gerhold.net>
 <20230104115348.25046-4-stephan@gerhold.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230104115348.25046-4-stephan@gerhold.net>
X-Spam-Status: No, score=-1.3 required=5.0 tests=BAYES_00,
        FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,
        SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, Jan 04, 2023 at 12:53:47PM +0100, Stephan Gerhold wrote:
> Sync the SoC IDs in qcom,ids.h with relevant entries from Qualcomm's LK
> bootloader [1] that is used for almost all older Qualcomm SoCs.
> 
> Several of these are already supported, e.g.:
>   - MSM8960 -> APQ8060, MSM8260, ...
>   - MSM8976 -> APQ8076
>   - MSM8956 -> APQ8056
> Others are currently being worked on, e.g.:
>   - MSM8909(W) -> APQ8009(W), MSM8905, MSM8209, ...
>   - MSM8939 -> MSM8239, ...
> 
> And even all remaining ones added are close enough to what is already
> supported so that future support is realistic (if someone steps up to
> do the work).
> 
> Add all of them at once to avoid having to add them one by one in the
> future. This will also benefit other projects making use of the same
> dt-bindings, e.g. bootloaders where adding support for all these SoCs
> is a bit easier than on Linux.

The promise was in accepting the properties upstream is we'd only be 
adding these for bootloaders with dtbs that we can't otherwise update or 
change. Do all of those meet this criteria? Seems unlikely.

Rob
