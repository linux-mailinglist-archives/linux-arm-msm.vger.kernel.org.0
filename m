Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 33C5E505EAA
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 Apr 2022 21:44:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1347748AbiDRTrB (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 18 Apr 2022 15:47:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36322 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1347751AbiDRTq5 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 18 Apr 2022 15:46:57 -0400
Received: from mail-oa1-x2d.google.com (mail-oa1-x2d.google.com [IPv6:2001:4860:4864:20::2d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EF59224BF3
        for <linux-arm-msm@vger.kernel.org>; Mon, 18 Apr 2022 12:44:17 -0700 (PDT)
Received: by mail-oa1-x2d.google.com with SMTP id 586e51a60fabf-e2442907a1so15231307fac.8
        for <linux-arm-msm@vger.kernel.org>; Mon, 18 Apr 2022 12:44:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:in-reply-to:references:from:user-agent:date:message-id
         :subject:to:cc;
        bh=rWmGGN3eFNbyG6C4vAA5Rpc6BDirEyH8qUGKkRRv6S8=;
        b=ELbjEgEXoHbw0AylxCtkrm4TA5gDV4ddY1yZLTC4sodhebYy7i2Iq4rC01GYgEZFux
         DROYmd/UX8PxRaRqMYNMxgowOrG1Bd0SWD9MOEw2hbzjGqVbVjW6LkIOoxj7zrEsJ7og
         94fssyli+ICXv57IeaRsmOjSdmgm8GR2AcjyU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:in-reply-to:references:from
         :user-agent:date:message-id:subject:to:cc;
        bh=rWmGGN3eFNbyG6C4vAA5Rpc6BDirEyH8qUGKkRRv6S8=;
        b=w8QG/3CnEAG74bbcKmYqwX1AZBaeCRpmwqbTMw9Oi57YOCoQIHYcsp0MeZ5V3u+0NJ
         WUclsEREmPzvQ+eYuXSDQx+0U7eHPzdbvBkGCGp4eezVgMChIWKN1FKUPw+Hab0Q438b
         Ow/+mWjdCI0P/v+OJ4tLGOh4K+7Mr9GvQM9tM7zTr/D2h79ke6ZdyZiCjOful+IvuWI7
         mqXzHP8/IJAPNCxQ7V9ZzIYYlMsKCp2lODPYUJjez8ReJeT9gayX7PNWqPibr0JH7Exf
         x1DHe7Rm7h27K23i5RX+uJrh615nKJ5ovz0fpOuQ84LfG6FbRDDr5GAJPnk2Y6waK2P7
         REQg==
X-Gm-Message-State: AOAM531+K0TMJlFScHDmrva8RH1Q22/3ycW/TZUPoHNCN4WHq4ktvCOC
        vQUf89zSTQ/sOHFdZhK9vp0NDd75aG0j90ssPO6QHIiBB+E=
X-Google-Smtp-Source: ABdhPJwrGJNGpDf85A+0m7ww69jnGF3BIsoKsONnlKr2bunRT6Y9MhKyWKXiQjCdah3pvAI1392EQj8dAnS4WUm+cfQ=
X-Received: by 2002:a05:6870:558e:b0:e1:db7c:26aa with SMTP id
 n14-20020a056870558e00b000e1db7c26aamr5070586oao.63.1650311057331; Mon, 18
 Apr 2022 12:44:17 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 18 Apr 2022 12:44:16 -0700
MIME-Version: 1.0
In-Reply-To: <20220415172238.1.I671bdf40fdfce7a35f6349fca0dc56145d4210ee@changeid>
References: <20220415172238.1.I671bdf40fdfce7a35f6349fca0dc56145d4210ee@changeid>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date:   Mon, 18 Apr 2022 12:44:16 -0700
Message-ID: <CAE-0n53X90fG6SrixDJEOZ-G8A_ryJErd6GbUxafGzeCAyWg3g@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: qcom: sc7280: Add SAR sensors to herobrine crd
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Matthias Kaehlcke <mka@chromium.org>,
        Rob Herring <robh+dt@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Andy Gross <agross@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Matthias Kaehlcke (2022-04-15 17:22:41)
> Enable the two SAR sensors of the CRD based on herobrine.
>
> Signed-off-by: Matthias Kaehlcke <mka@chromium.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
