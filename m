Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4B5984AD4BF
	for <lists+linux-arm-msm@lfdr.de>; Tue,  8 Feb 2022 10:25:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1354204AbiBHJYY (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 8 Feb 2022 04:24:24 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35430 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238987AbiBHJYX (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 8 Feb 2022 04:24:23 -0500
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com [IPv6:2a00:1450:4864:20::331])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0798DC03FEC6
        for <linux-arm-msm@vger.kernel.org>; Tue,  8 Feb 2022 01:24:22 -0800 (PST)
Received: by mail-wm1-x331.google.com with SMTP id l12-20020a7bc34c000000b003467c58cbdfso919416wmj.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 08 Feb 2022 01:24:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=U4eTC6qoUMprkOAPi/nq4R8RnDpnU3YMicKdHmccZLQ=;
        b=OjSkWWAHIdktAsoxsPi8byPQ2FeJ3bEHJsUZ77uP4OKAnFUO5xzu8gJgEUWd9BJvBz
         aO9juV01Jl+Jg51nPtatv0IZ7mhfSBtVI2MgFLAD7hRQhDhCKaCghTlC7XJOB4AytX2/
         UAC8qQsvDpuYIsar6dqeLQttRFVBOCGRSP/kOjCVp0iPeQVX5eWrBKnmGyMClgEKMPaQ
         uRN+U37PNeVifs+mA5ddKOWgc4VOK+8xIYZhqyAJQgcBY5ZQN+1I5Ajxr+QzVIjxBQax
         q7lAMPJoX4Cm4+OenG6xR9SaqiNfcTMbrnGzlg7YTuXhm7VnbLDUwDnsqIjtdsDoePeS
         agyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=U4eTC6qoUMprkOAPi/nq4R8RnDpnU3YMicKdHmccZLQ=;
        b=4LL3jjkRVUtOL0TZ/7cbKpAHvdRNZApcKiaQZJsuMqokdqx5P2u8IspiqlnDQUZzE0
         lko5dOPNF+f/MyFvcsC4GJpe86rmUKyaQ3OqOhknE1AOtj2lzLxDFyxd/+AxBtpFgZAP
         Oo9xPO/Vcu1h3De52IyMFzB4nPQqJU8J7AlFwJxCDlKMD+lamI70EnFG6B47byg/g62/
         e5ioVImB/4vT4o60JGU3JhNOP0IJv7/4diV/9drAx0TmzFJZq3z+5HsbbPpnqZhsqr+q
         8OWGsCg+zippycQm36iOECQwO67dNs7I1EONP4Ig8FNQ6WUJKJy+qCMjGvgbACLbDF4S
         h9XQ==
X-Gm-Message-State: AOAM532lM8A8Y75sK4sPIgGZLQ3ea4Spf5dbevbJGV4F3MoT4RHIAyqj
        oZhmIP5WeV23u/hHranaBGjbeg==
X-Google-Smtp-Source: ABdhPJyETs0h54mjP52R9i4urCVEkYxAlnNZHIWK+XSjvKFVpOSKSwgint1uilZINo2Imx/EJawJvw==
X-Received: by 2002:a05:600c:4e90:: with SMTP id f16mr274231wmq.175.1644312260622;
        Tue, 08 Feb 2022 01:24:20 -0800 (PST)
Received: from google.com (cpc155339-bagu17-2-0-cust87.1-3.cable.virginm.net. [86.27.177.88])
        by smtp.gmail.com with ESMTPSA id j46sm27994wrj.58.2022.02.08.01.24.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Feb 2022 01:24:19 -0800 (PST)
Date:   Tue, 8 Feb 2022 09:24:17 +0000
From:   Lee Jones <lee.jones@linaro.org>
To:     Luca Weiss <luca.weiss@fairphone.com>
Cc:     linux-arm-msm@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Daniel Thompson <daniel.thompson@linaro.org>,
        Jingoo Han <jingoohan1@gmail.com>,
        dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/4] backlight: qcom-wled: Add PM6150L compatible
Message-ID: <YgI2wXYHjrcsF40f@google.com>
References: <20211229170358.2457006-1-luca.weiss@fairphone.com>
 <20211229170358.2457006-3-luca.weiss@fairphone.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20211229170358.2457006-3-luca.weiss@fairphone.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, 29 Dec 2021, Luca Weiss wrote:

> PM6150L contains WLED of version 5. Add support ofr it to the driver.
> 
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> ---
>  drivers/video/backlight/qcom-wled.c | 1 +
>  1 file changed, 1 insertion(+)

Applied, thanks.

-- 
Lee Jones [李琼斯]
Principal Technical Lead - Developer Services
Linaro.org │ Open source software for Arm SoCs
Follow Linaro: Facebook | Twitter | Blog
