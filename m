Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 52B0154FF0E
	for <lists+linux-arm-msm@lfdr.de>; Fri, 17 Jun 2022 23:03:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245608AbiFQU4e (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 17 Jun 2022 16:56:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33702 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234370AbiFQU4e (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 17 Jun 2022 16:56:34 -0400
Received: from mail-oa1-x34.google.com (mail-oa1-x34.google.com [IPv6:2001:4860:4864:20::34])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ACB855DA56
        for <linux-arm-msm@vger.kernel.org>; Fri, 17 Jun 2022 13:56:32 -0700 (PDT)
Received: by mail-oa1-x34.google.com with SMTP id 586e51a60fabf-fe32122311so6936757fac.7
        for <linux-arm-msm@vger.kernel.org>; Fri, 17 Jun 2022 13:56:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:in-reply-to:references:from:user-agent:date:message-id
         :subject:to:cc;
        bh=MH/iAqLtqToQAlEnXkpP3+J+Zy8At+koA/Z9dM2NOZc=;
        b=kyEDKtsqodmuTT86QxhNaU7tgoCtWme2N7wlYwiTpVGVYAYBBqt1DAq/mT9BFnwPWo
         bQ1PITdzjrSdMZlt5iD9XIjog5xhqmEIF916e+ohiHDHLGfApEbwoww3ZTPADsLwjxZ2
         TEwBBCfZPVd4+eGNaGntLIlezdWVPhYRn3l0U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:in-reply-to:references:from
         :user-agent:date:message-id:subject:to:cc;
        bh=MH/iAqLtqToQAlEnXkpP3+J+Zy8At+koA/Z9dM2NOZc=;
        b=8Nq2rn1lX1Q1aT6mNzczi3P936QUF4mu8jSuvMur3ddOnsyDa5CK8fwBkuHdNOWsye
         L84oqUAPw9WzHrEb76cj+HalxmGzfxH1EFKVXedoNNlckx+aAbY/Mq9DhNWniTuVHlj5
         E4eNcSX3NY+13xIHK2EMSKBX9KCyxQGEOZi2cAri2beliNrroSbDH/SdsWN4n40gCZvO
         CBH8VM+dCmFvtCxWfqBF7e07mQNqDrAf1aNe7Y+PFI1lj33ryv5a9vPfZDK/epOOwRLB
         4Ypxf7loW0y0Ky/cfB7I2GUhz5L22Axp41DqG8iUFDI1er0vC+eWpE/Z/D0bDmAm7T0E
         9gWg==
X-Gm-Message-State: AJIora9Yn7DBW3NafAxW8CBbhhyJw4hKfY/J3hT3LOKdJEWiYCBXdIjb
        BWOk7B1T48h3Hmf9pF1+7gu7rKhxMIwSuabQoGkdymyrwRg=
X-Google-Smtp-Source: AGRyM1vd690rXJ51SuzzgfI8BhKCCRgUEbObgJqZvik2f2hM6fajZLbLknhknAJbbPVwWpZOvXMPEzWPFbnPZniESuA=
X-Received: by 2002:a05:6870:b48a:b0:101:40eb:63a3 with SMTP id
 y10-20020a056870b48a00b0010140eb63a3mr6284144oap.193.1655499392048; Fri, 17
 Jun 2022 13:56:32 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 17 Jun 2022 13:56:31 -0700
MIME-Version: 1.0
In-Reply-To: <20220617103608.605898-3-dmitry.baryshkov@linaro.org>
References: <20220617103608.605898-1-dmitry.baryshkov@linaro.org> <20220617103608.605898-3-dmitry.baryshkov@linaro.org>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date:   Fri, 17 Jun 2022 13:56:31 -0700
Message-ID: <CAE-0n53pK-YDLkBTyHiF_AL_BEdOjCAt2RdqLemONzVsXx+Asw@mail.gmail.com>
Subject: Re: [PATCH 2/3] drm/msm/hdmi: make hdmi_phy_8996 OF clk provider
To:     Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>
Cc:     David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, Vinod Koul <vkoul@kernel.org>,
        linux-phy@lists.infradead.org
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

Quoting Dmitry Baryshkov (2022-06-17 03:36:07)
> On MSM8996 the HDMI PHY provides the PLL clock to the MMCC. As we are
> preparing to convert the MSM8996 to use DT clocks properties (rather
> than global clock names), register the OF clock provider.
>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
