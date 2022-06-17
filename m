Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2000954FE30
	for <lists+linux-arm-msm@lfdr.de>; Fri, 17 Jun 2022 22:16:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233252AbiFQUPt (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 17 Jun 2022 16:15:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50294 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229794AbiFQUPs (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 17 Jun 2022 16:15:48 -0400
Received: from mail-oa1-x2e.google.com (mail-oa1-x2e.google.com [IPv6:2001:4860:4864:20::2e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F37CE5C64D
        for <linux-arm-msm@vger.kernel.org>; Fri, 17 Jun 2022 13:15:47 -0700 (PDT)
Received: by mail-oa1-x2e.google.com with SMTP id 586e51a60fabf-fe32122311so6827067fac.7
        for <linux-arm-msm@vger.kernel.org>; Fri, 17 Jun 2022 13:15:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:in-reply-to:references:from:user-agent:date:message-id
         :subject:to:cc;
        bh=b27oiy6RHsUuT4Jjsfq7MJzNlUIQ2e5S3fHVAYvBtmE=;
        b=MA73/fhxKHTJ8uYDabaVtaMIiRBaepXPKVxGSSWGPGPA2K1mqga8UkOGtOeNIJJqIO
         4OOgQtLefRA+PHn0QrdoZTC2XY0RYPEac/Mb+GH7iF3qNpejDkZY6/2x8aZICMuKDH2S
         z7MCvFPVqJMwu5Xb67PjrtVxFReaJimZerCZU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:in-reply-to:references:from
         :user-agent:date:message-id:subject:to:cc;
        bh=b27oiy6RHsUuT4Jjsfq7MJzNlUIQ2e5S3fHVAYvBtmE=;
        b=ERP+dsY3xc7ipq8mpYkmnaS88A4HFytLivwBnVPnyI+VH4zEg6Zz10dDB5UCIHhEDr
         9lr+dgGWmnJZ+b5oQw+cBuIWaJ6/rs11+jgYkDWsgw0QkM6aNc/izCk+JK1i9jGSrf7c
         mGMvRC+g98GF84aWKaxUoPCwnuMBKyift42WfsbpmeMPAzlzGelEFeAqrZx7rspMjEIZ
         kxuHZqQHzTa379YJyKz6ykcOm5gcLGMgqZKRTpgKNsY/3PorGMydvh+EEzjdbLyYIrlJ
         Y6FvlGv0I30oXcFSvMwa/3FYTzn3e5F/oL1VDKi2ofqWTMHfH0znTsXZirnAkhSFvZH3
         evag==
X-Gm-Message-State: AJIora9yp7WWGRZ5ucDo82MCGj2A0IymElbq9Q/dCHEX9VJCLIv2lNTS
        6ryLw2vi3nrjAtejTkWPXVX3Trox0/bkMUmNP7m51Q==
X-Google-Smtp-Source: AGRyM1vYWj5adjCr3oqYPXmSERpaa+NbEphqPPLnMroCJl0YCDYzfPeLgt++eJ4q9h+s/lTqKE32SR9fXSpMZc8eeNE=
X-Received: by 2002:a05:6870:b381:b0:fe:2004:b3b5 with SMTP id
 w1-20020a056870b38100b000fe2004b3b5mr6489018oap.63.1655496947391; Fri, 17 Jun
 2022 13:15:47 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 17 Jun 2022 13:15:47 -0700
MIME-Version: 1.0
In-Reply-To: <20220617194921.1098725-1-dmitry.baryshkov@linaro.org>
References: <20220617194921.1098725-1-dmitry.baryshkov@linaro.org>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date:   Fri, 17 Jun 2022 13:15:47 -0700
Message-ID: <CAE-0n52VABr2xTbEtVyat8CLV=vzgRB3JQV+Undw56ECiHR-Ow@mail.gmail.com>
Subject: Re: [PATCH 1/2] drm/msm/dp: remove unused stubs
To:     Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>
Cc:     David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
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

Quoting Dmitry Baryshkov (2022-06-17 12:49:20)
> Refactoring DP code transformed several functions into empty stubs.
> Remove them.
>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
