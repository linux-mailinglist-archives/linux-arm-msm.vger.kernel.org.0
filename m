Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DA09555DBF5
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Jun 2022 15:25:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241947AbiF0Xts (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 27 Jun 2022 19:49:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33374 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239739AbiF0Xts (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 27 Jun 2022 19:49:48 -0400
Received: from mail-pj1-x102c.google.com (mail-pj1-x102c.google.com [IPv6:2607:f8b0:4864:20::102c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3E0D3E0CC
        for <linux-arm-msm@vger.kernel.org>; Mon, 27 Jun 2022 16:49:47 -0700 (PDT)
Received: by mail-pj1-x102c.google.com with SMTP id m14-20020a17090a668e00b001ee6ece8368so4803164pjj.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 27 Jun 2022 16:49:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=AqgAK6vW0sjwljhDhF+wDDYOvFeDeqUAJsWDqLfwnOY=;
        b=XwGc2CSDj85YQw3/ioBITivk3gVbW4vBmhsm/WgaJYuwbcetHTmEcccRdL5+qdaiE9
         Jr7rtHML6/RJK82HnK30L18MtdtwDN60y/8phzk7bLAnRweyXiHbZw9jqYH84rZfMTOz
         d/HJJ4EX+bu7oZOiv+fe9DBrPxU0v8NbCUnmA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=AqgAK6vW0sjwljhDhF+wDDYOvFeDeqUAJsWDqLfwnOY=;
        b=7Bm1t4UuK0ivwqOD8tcz6mgaHEHz1pwpk4TkM+kx7cRl3/c1IEZLsSrG9S1xG+czs8
         f9H8PnpIXfZzIjGJl6gcLzwn8cQZUAo+qLrxhO0ILE78dewDN1B6Cjo65tDJb7RfK/2s
         nVgst41ZFuGYXaPEF0ZgT8d48hleCBjfPe946MdYcbahcTi22F3s5Lx2+McGgZIod1RG
         /UnAMttjDWMqbLd/4zv+Xkdv2CfzGC0be6OF4672e7CVptJb/MOZlBRV/wig4LxjkxwL
         vXRBFiy/UHYt2yMfEXmvoyguTmT9FmzlP0/hwaEyVV3XzGqXtdbKBso6T7RXa740UPsR
         f8SA==
X-Gm-Message-State: AJIora9EqjUEAK6LpiQcqCSTcVj5DbUCqGd02NTgkeo8reCF88JulQNz
        lZ5Tb73qZ30dcIA6FOIhAf/xDHsltYInKg==
X-Google-Smtp-Source: AGRyM1s/Xm5LgTVErGnjTuMVaP9oB8WtNcqcZYYUR5VgkZ7hJjKQh5Eh7nLPgHV2RLHc01b93JXeUw==
X-Received: by 2002:a17:902:f688:b0:16a:81d4:17e0 with SMTP id l8-20020a170902f68800b0016a81d417e0mr1962080plg.174.1656373786783;
        Mon, 27 Jun 2022 16:49:46 -0700 (PDT)
Received: from localhost ([2620:15c:11a:202:f31c:687c:3a61:62c5])
        by smtp.gmail.com with UTF8SMTPSA id s1-20020a170903214100b0016a01637620sm7762769ple.76.2022.06.27.16.49.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Jun 2022 16:49:46 -0700 (PDT)
Date:   Mon, 27 Jun 2022 16:49:45 -0700
From:   Matthias Kaehlcke <mka@chromium.org>
To:     Douglas Anderson <dianders@chromium.org>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Stephen Boyd <sboyd@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] soc: qcom: cmd-db: replace strscpy_pad() with strncpy()
Message-ID: <YrpCGa3OTtgBr0vN@google.com>
References: <20220627161642.1.Ie7b480cd99e2c13319220cbc108caf2bcd41286b@changeid>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220627161642.1.Ie7b480cd99e2c13319220cbc108caf2bcd41286b@changeid>
X-Spam-Status: No, score=-2.5 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, Jun 27, 2022 at 04:17:00PM -0700, Douglas Anderson wrote:
> Commit ac0126a01735 ("soc: qcom: cmd-db: replace strncpy() with
> strscpy_pad()") breaks booting on my sc7280-herobrine-herobrine
> device. From printouts I see that at bootup the function is called
> with an id of "lnbclka2" which is 8 bytes big.
> 
> Previously all 8 bytes of this string were copied to the
> destination. Now only 7 bytes will be copied since strscpy_pad() saves
> a byte for '\0' termination.
> 
> We don't need the '\0' termination in the destination. Let's go back
> to strncpy(). According to the warning:
>   If a caller is using non-NUL-terminated strings, strncpy() can still
>   be used, but destinations should be marked with the __nonstring
>   attribute to avoid future compiler warnings.
> ...so we'll do that.
> 
> Fixes: ac0126a01735 ("soc: qcom: cmd-db: replace strncpy() with strscpy_pad()")
> Signed-off-by: Douglas Anderson <dianders@chromium.org>

Reviewed-by: Matthias Kaehlcke <mka@chromium.org>
