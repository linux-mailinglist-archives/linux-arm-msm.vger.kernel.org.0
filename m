Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5E96B5A6E97
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Aug 2022 22:42:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229959AbiH3Um3 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 30 Aug 2022 16:42:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48262 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229560AbiH3Um2 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 30 Aug 2022 16:42:28 -0400
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com [IPv6:2a00:1450:4864:20::130])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2815424F29
        for <linux-arm-msm@vger.kernel.org>; Tue, 30 Aug 2022 13:42:26 -0700 (PDT)
Received: by mail-lf1-x130.google.com with SMTP id z25so17156146lfr.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 30 Aug 2022 13:42:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc;
        bh=cYIt8T5qTTPMHnPLf3xQ+OALuVf5JTfc65U2LdgUBRw=;
        b=u12h2y5bEzDK0Z7f56rEwzaTFo5dMxORpwCNdjTOvecDv5/T3+4AThU1ci+IcjwQQJ
         Zng+Ii9ZUZglYG8VQN4ZrxV8w7ZtWUy/Yz+KQqHEm/B63vwtNGPaR+AYLFZFbDjLXJNe
         kRkkFAeg8VgZKFONW7AYee4/1rlLY7a7bu7psGDgB/o7yYRC3P/WB36OpOatqYvHdl/U
         E1GCJ2q7/rHqZiQEeaDWR3h/Jw0zmaO3RtEZ8C3taZ/LBRSmqUTYZfrUxD51mrnSgSyp
         YwUQ3lUTUvUGJ2ZXPALH4QAnwbjKoBx0THf0GAgAsbDQVvgX33vVDsdu1cSoJbEblAWR
         u+rA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc;
        bh=cYIt8T5qTTPMHnPLf3xQ+OALuVf5JTfc65U2LdgUBRw=;
        b=DTUmo0r7sQOaKmnypspZGAN0tAAJWN6S9MYzAT8tijbOHYONjPrkVetAq4MwRreMG1
         TK3FeXMeqeRVm3Rvg+cQqvFuGA5WRfeeGvGnAKkeUHwf7lL9HWgqIGVlI5pHfE3v+XFi
         6O6KPWK0ycjC287KV5UFBTnTWkp8cmi8XuQJXfP4U7IU3/LI330l/uYemKPG2iqcJcwT
         PNBwaYaTzCXMYcubOmRCEEsr4NF9w8fgjBVqKKfhNnlrYBkU86c+sGb0Qn/Z4pXjvfvC
         JpRzWyOgpXSe5TWgbJK5jHrRAAs6GfzDwZ+jZJmcncSVb4uBhd19kpvVAfEOgpmx2IuC
         8l+Q==
X-Gm-Message-State: ACgBeo0i9p45OQfIVLnY8g91rBQNnSpzr5XIDH3/oP21TdQx78Q38o97
        TtrjKrf3i9WdxlOuDTrPJv6mcP+QGp3ZSw==
X-Google-Smtp-Source: AA6agR5kINkZTpU9ZCvAgVHkM73uJ9XuvJxMdXlcD3IzA7JJZGJdFWJiTcv47RB/1xYcEd6sZkrb9Q==
X-Received: by 2002:a05:6512:1510:b0:492:df5b:ff76 with SMTP id bq16-20020a056512151000b00492df5bff76mr7958543lfb.178.1661892144495;
        Tue, 30 Aug 2022 13:42:24 -0700 (PDT)
Received: from [192.168.1.211] ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id c25-20020a056512075900b00492dc1bb346sm1712622lfs.260.2022.08.30.13.42.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 30 Aug 2022 13:42:23 -0700 (PDT)
Message-ID: <d43b3936-dbc0-dbca-96de-449cec1fc024@linaro.org>
Date:   Tue, 30 Aug 2022 23:42:22 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.1.2
Subject: Re: [PATCH] drm/msm/dsi: Remove use of device_node in
 dsi_host_parse_dt()
Content-Language: en-GB
To:     Nathan Chancellor <nathan@kernel.org>,
        Rob Clark <robdclark@gmail.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc:     Sean Paul <sean@poorly.run>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Tom Rix <trix@redhat.com>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-kernel@vger.kernel.org, llvm@lists.linux.dev,
        patches@lists.linux.dev
References: <20220829165450.217628-1-nathan@kernel.org>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20220829165450.217628-1-nathan@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 29/08/2022 19:54, Nathan Chancellor wrote:
> Clang warns:
> 
>    drivers/gpu/drm/msm/dsi/dsi_host.c:1903:14: error: variable 'device_node' is uninitialized when used here [-Werror,-Wuninitialized]
>            of_node_put(device_node);
>                        ^~~~~~~~~~~
>    drivers/gpu/drm/msm/dsi/dsi_host.c:1870:44: note: initialize the variable 'device_node' to silence this warning
>            struct device_node *endpoint, *device_node;
>                                                      ^
>                                                      = NULL
>    1 error generated.
> 
> device_node's assignment was removed but not all of its uses. Remove the
> call to of_node_put() and the variable declaration to clean up the
> warning.
> 
> Fixes: 5f8cdece42ff ("drm/msm/dsi: switch to DRM_PANEL_BRIDGE")
> Link: https://github.com/ClangBuiltLinux/linux/issues/1700
> Signed-off-by: Nathan Chancellor <nathan@kernel.org>

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

