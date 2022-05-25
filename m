Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F35E1534072
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 May 2022 17:36:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244971AbiEYPge (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 25 May 2022 11:36:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46824 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229893AbiEYPgd (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 25 May 2022 11:36:33 -0400
Received: from mail-pl1-x631.google.com (mail-pl1-x631.google.com [IPv6:2607:f8b0:4864:20::631])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4682E11175
        for <linux-arm-msm@vger.kernel.org>; Wed, 25 May 2022 08:36:31 -0700 (PDT)
Received: by mail-pl1-x631.google.com with SMTP id c2so18899000plh.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 25 May 2022 08:36:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=unaVWSxtLrzCkT7W9EU0i2EBbETN7X+EN7c1UsSwH0s=;
        b=cWwtlMdgHkYd3Z+MwZZVGkeHqFjikelNov58vRx+64+U+d9LBp/xb37sfwuSNvtjbM
         8JdgqMgu4KCvBW5J2GpD5+kCrnAtM/4hbC+PtGgKva2buhfiVBNoTY2AWsI+n0QO+3Hn
         ZncYx0anRN4G6RGyGSj4YiYwoA6pLOQjn2ov0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=unaVWSxtLrzCkT7W9EU0i2EBbETN7X+EN7c1UsSwH0s=;
        b=NhKv8hvtKyIIAAYGodzHrhxKaz8jS5fFLzLoFKWBJQXS/OuxuSNep+ocX3IvnxQ/3o
         v0cwx/qivNt5y3Hcw60e8bhzzzX3lKO3GbtOt5w+h8/wX8zeZ/lymw+MXEbT5dKhSvIS
         yrLaMWucFZCY46fTrjkufr9Y7L5VEDD5C+vgBATuGw0togUAwFkFY+2VijL8BjE1qwDa
         6PJ3L1tWBl404N6b3AWGWk0JLe8pVpjiKn8NkCFj+9VS/qGaU/IN3sCdbS+pofpAx5YD
         x6n36OyqevPgAmgsG1y34NGFqJvPxklXgr3/gXoXkAH7gJEuSGCjYgDLGeXfmKXp9tzA
         MfFQ==
X-Gm-Message-State: AOAM5317RGayJT8AMXdxUbfMF/sMEZCaiXHeWLDQg37yAq1l8Jw12WC4
        Z8C4NihTR2bdNCY9nkOlpQUSLg==
X-Google-Smtp-Source: ABdhPJy4QdbW/q506bxZQtetCefQdh5dhyoeRjlnF43bNKBXbqVDO0aUKxNaNJWTslH4nppq38BrPA==
X-Received: by 2002:a17:90b:3e8a:b0:1e0:4f19:c63b with SMTP id rj10-20020a17090b3e8a00b001e04f19c63bmr11061632pjb.237.1653492990862;
        Wed, 25 May 2022 08:36:30 -0700 (PDT)
Received: from localhost ([2620:15c:11a:202:4d83:f549:9abd:427])
        by smtp.gmail.com with UTF8SMTPSA id t13-20020a63b24d000000b003fa321e9463sm6669598pgo.58.2022.05.25.08.36.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 May 2022 08:36:30 -0700 (PDT)
Date:   Wed, 25 May 2022 08:36:29 -0700
From:   Matthias Kaehlcke <mka@chromium.org>
To:     Judy Hsiao <judyhsiao@chromium.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Srini Kandagatla <srinivas.kandagatla@linaro.org>,
        dianders@chromium.org, cychiang@google.com, judyhsiao@google.com,
        tzungbi@chromium.org, swboyd@chromium.org,
        linux-arm-kernel@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [v3 3/3] arm64: dts: qcom: sc7280: include
 sc7280-herobrine-audio-rt5682.dtsi in villager and herobrine-r1
Message-ID: <Yo5M/Y5IbIPpFtO8@google.com>
References: <20220525014308.1853576-1-judyhsiao@chromium.org>
 <20220525014308.1853576-4-judyhsiao@chromium.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220525014308.1853576-4-judyhsiao@chromium.org>
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, May 25, 2022 at 01:43:08AM +0000, Judy Hsiao wrote:
> Include sc7280-herobrine-audio-rt5682.dtsi in villager and herobrine-r1 as
> these boards use rt5682 codec.
> 
> Signed-off-by: Judy Hsiao <judyhsiao@chromium.org>

Reviewed-by: Matthias Kaehlcke <mka@chromium.org>

and you for v2 you also had:

Reviewed-by: Douglas Anderson <dianders@chromium.org>
