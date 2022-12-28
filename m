Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4C5A96583DF
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 Dec 2022 17:53:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232002AbiL1QxW (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 28 Dec 2022 11:53:22 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44530 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231183AbiL1Qwn (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 28 Dec 2022 11:52:43 -0500
Received: from mail-pl1-x62e.google.com (mail-pl1-x62e.google.com [IPv6:2607:f8b0:4864:20::62e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CC92E1DDF0
        for <linux-arm-msm@vger.kernel.org>; Wed, 28 Dec 2022 08:47:24 -0800 (PST)
Received: by mail-pl1-x62e.google.com with SMTP id d7so16498207pll.9
        for <linux-arm-msm@vger.kernel.org>; Wed, 28 Dec 2022 08:47:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=20heIbwArwzJZx617fL3Bywm94hV8d0YJO2Vs/U/I44=;
        b=FZsMOHQJQn/nyu2ewUl+t3Z16WbE4SFe8elYLjjLQUYE3T3MO+x6Y34R1OpxRptkOW
         23GPjz3fyivGHaZjAkNThOZcrpYnKCZtxow802YIyreKKne+/YzzQEdoNEXaOPvNfC53
         3WbnHBE3UO+WpeXILK1gyhIM4ONIw5yVksc1ANfya95Bw6Hisuugcv5T/sX7YU0yYzBG
         JK65qajqiW1yXt5g85RwfQx8qSBzXfXmmwM7wobyb+lvUEpTZkXVnQ2F3CuGxRGyMf5e
         LUHMvP5nWZfT37zPRGChdfSq5pyvY1MdNhCJwU8SY+2PRYwS0TxJLL7aNGKfjL6bkWsf
         uEsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=20heIbwArwzJZx617fL3Bywm94hV8d0YJO2Vs/U/I44=;
        b=Cg1KFLiEWLJ/GHdhprrws/TAodeclW8SHPmzGIiLasoMsIM/ghSNq+GrdICB7J12T2
         P2zLfjb6AqsdTafQEjWPYUNheLH2IRd+l8GWBD0AzVJ0+3GfNYf+P8Ht5za2nKJLIbCp
         yZHzQGHHhwVvScqH9QQffv8BffOaTo19llM7Z+G8r7X+Ozse3OQ4HkxzauWtOPUcFG1M
         zTHZcGLvfwLNYdD5iWgMp8Yx89msps0BUwqzn22suO7RDCzUFbklOLdhamnLPvXDjDxN
         9zKmpa/z5ipv3mCRAEnulTFgBg0uB2BIMQroLZmz1XpeNqJVqM3Ek50GJcR2wPdJ5En5
         o3rQ==
X-Gm-Message-State: AFqh2kqB+jadwfQ6GhO1bAHMjNRI8GhRMZ3R6rPYPQkfpwIJqx3//idy
        VLcIqHARf28uw1tGZM4YSCW/GosR/IlF1+8=
X-Google-Smtp-Source: AMrXdXtFKZAfe8GZaSjUc16vjEtsrMue4bvQYgI7FCpW2FFQe2IDhQPxlL7lS/FSgLrjpptRy+vvSg==
X-Received: by 2002:a17:902:ed0b:b0:192:7b0b:9c06 with SMTP id b11-20020a170902ed0b00b001927b0b9c06mr9754198pld.8.1672246044274;
        Wed, 28 Dec 2022 08:47:24 -0800 (PST)
Received: from thinkpad ([117.217.178.100])
        by smtp.gmail.com with ESMTPSA id s6-20020a170902ea0600b001913c5fc051sm11283591plg.274.2022.12.28.08.47.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Dec 2022 08:47:23 -0800 (PST)
Date:   Wed, 28 Dec 2022 22:17:11 +0530
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     Borislav Petkov <bp@alien8.de>
Cc:     andersson@kernel.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, tony.luck@intel.com,
        quic_saipraka@quicinc.com, konrad.dybcio@linaro.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        james.morse@arm.com, mchehab@kernel.org, rric@kernel.org,
        linux-edac@vger.kernel.org, quic_ppareek@quicinc.com,
        luca.weiss@fairphone.com, ahalaney@redhat.com, steev@kali.org
Subject: Re: [PATCH v5 00/17] Qcom: LLCC/EDAC: Fix base address used for LLCC
 banks
Message-ID: <20221228164711.GB256211@thinkpad>
References: <20221228084028.46528-1-manivannan.sadhasivam@linaro.org>
 <Y6wcFjqpBUoxAkdk@zn.tnic>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Y6wcFjqpBUoxAkdk@zn.tnic>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, Dec 28, 2022 at 11:36:06AM +0100, Borislav Petkov wrote:
> On Wed, Dec 28, 2022 at 02:10:11PM +0530, Manivannan Sadhasivam wrote:
> > Patches 1/17, 2/17 and 3/17 can be merged independently to EDAC tree. Rest of
> > the patches should be merged to qcom tree due to LLCC dependency.
> 
> Why make it more complicated than it has to be?
> 
> How about I review the EDAC bits and once they look ok, whoever takes
> care of the qcom tree can pick them up too and route the whole pile
> through there?
> 

Well, some maintainers prefer to pick the independent patches through their
tree. That's why I moved those patches to the start of the series.

> This way there's no needless dependency between trees...
> 

If you are fine with all patches going through qcom tree, I do not have any
issue :)

Thanks,
Mani

> Hmm.
> 
> -- 
> Regards/Gruss,
>     Boris.
> 
> https://people.kernel.org/tglx/notes-about-netiquette

-- 
மணிவண்ணன் சதாசிவம்
