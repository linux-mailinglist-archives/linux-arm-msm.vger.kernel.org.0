Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CEA2269B321
	for <lists+linux-arm-msm@lfdr.de>; Fri, 17 Feb 2023 20:30:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229886AbjBQTaF (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 17 Feb 2023 14:30:05 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48658 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229826AbjBQT37 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 17 Feb 2023 14:29:59 -0500
Received: from mail-pj1-x102b.google.com (mail-pj1-x102b.google.com [IPv6:2607:f8b0:4864:20::102b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EDC935CF0E
        for <linux-arm-msm@vger.kernel.org>; Fri, 17 Feb 2023 11:29:55 -0800 (PST)
Received: by mail-pj1-x102b.google.com with SMTP id u14-20020a17090a4bce00b002341fadc370so2337109pjl.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 17 Feb 2023 11:29:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112; t=1676662195;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=+gBiM75b0nfMIiLxq2ZBVu9HnrCJpvcncwyrtZol7gE=;
        b=nn7Ikcx+AhCSBXUrxALUEA90+ZRht/f179MrYayohi42ujDEqFvXIEkhUbbezCIAYS
         LETFjs93h2CLcIL1mzThtqRgL9gZDO6egSXyG8gcoENYXuU5vOUZFXVxUlpGPrIV7HCT
         4SjiQkUd3KvqwITNjCdYn0jBGLueyAf5jV7/NmTDukvgjF0T1PmDV8pN7owqwzpBjZg4
         ouiIa+vPr7IvlECBlOddCsJT14mLYzmRmwVl4ciK8+vgI6tmuQDTVpGuWB1Mbg0fMAEb
         pt1b6dFG9kCJcBX5E/radAudPfZcxZvokRUG5ZAlEF2WJlopFk4WxXj3K3yuwxxhm3Pg
         ZivQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1676662195;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+gBiM75b0nfMIiLxq2ZBVu9HnrCJpvcncwyrtZol7gE=;
        b=dASkHVjVH/L1ewYNaFv7QVMH8QK9pYI3M2qAl3TathkO0uktCHwhqETMnyjs5113yF
         lpzjuONe9NtBG18leKD4Gk7ACMBctzoZhn3gUsPS+LObXpcP/snCU1TVvN1oMPouhKjJ
         XO9A147FDTfhy2xYqtdwWAMIKou7qhdKKpJtPzRP9jJOCGo8bKuU1kgQUycbklnDrH45
         op7AMHmjj7dXJozPU/JbDWEZtT7BLZri4GmAwBp5bh7CONM6aB58aIB50OxYGH3OhxLg
         460AJqa+wQB71USEPwOHJHoBgRXdJU0Bi1spmZ3HmuBnmcO53cUwpBCr1x6rEuo2mD9Y
         F8jw==
X-Gm-Message-State: AO0yUKUrseJ5W/xQvanjvzyDMzj41Dwp48AQAh/gs65nfdNYqwMfn7pz
        5AVgRmkN9hw4e2VLB2k6Mazlp4z3FC6ylBVD+wW1zJS85blKKJdn
X-Google-Smtp-Source: AK7set9lub9hc2trQuQPhFPQGWpdONR1+SeJm23cjV+1ksEROtIGRB3a1KNr1s60wVecKyposORZ8bEroisfF0mmzRk=
X-Received: by 2002:a17:903:328e:b0:19b:c39:3ba5 with SMTP id
 jh14-20020a170903328e00b0019b0c393ba5mr780415plb.29.1676662194894; Fri, 17
 Feb 2023 11:29:54 -0800 (PST)
MIME-Version: 1.0
References: <20230217184239.21450-1-pvorel@suse.cz> <20230217184239.21450-2-pvorel@suse.cz>
In-Reply-To: <20230217184239.21450-2-pvorel@suse.cz>
From:   Saravana Kannan <saravanak@google.com>
Date:   Fri, 17 Feb 2023 11:29:18 -0800
Message-ID: <CAGETcx-6s+En0MWsiZroBBRUdZra4V7Z4GrRtMxcotN6mxiaSg@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] arm64: defconfig: Switch msm8996 clk drivers to module
To:     Petr Vorel <pvorel@suse.cz>
Cc:     linux-arm-msm@vger.kernel.org,
        Bjorn Andersson <andersson@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-17.6 required=5.0 tests=BAYES_00,DKIMWL_WL_MED,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        ENV_AND_HDR_SPF_MATCH,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        USER_IN_DEF_DKIM_WL,USER_IN_DEF_SPF_WL autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, Feb 17, 2023 at 10:42 AM Petr Vorel <pvorel@suse.cz> wrote:
>
> Switch to module, because there is a support for probe defer on the
> power-domains. This should be working since 2b28a1a84a0e ("driver core:
> Extend deferred probe timeout on driver registration")

Oh hey! Good to know my patches are actually useful to someone :)

-Saravana

>
> Suggested-by: Bjorn Andersson <andersson@kernel.org>
> Signed-off-by: Petr Vorel <pvorel@suse.cz>
> ---
>  arch/arm64/configs/defconfig | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
> index 03762b376bb2..3a3d4a0c2c50 100644
> --- a/arch/arm64/configs/defconfig
> +++ b/arch/arm64/configs/defconfig
> @@ -1107,7 +1107,7 @@ CONFIG_IPQ_GCC_6018=y
>  CONFIG_IPQ_GCC_8074=y
>  CONFIG_MSM_GCC_8916=y
>  CONFIG_MSM_GCC_8994=y
> -CONFIG_MSM_MMCC_8996=y
> +CONFIG_MSM_MMCC_8996=m
>  CONFIG_MSM_GCC_8998=y
>  CONFIG_QCS_GCC_404=y
>  CONFIG_SA_GCC_8775P=y
> --
> 2.39.1
>
