Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 40E4C34B55B
	for <lists+linux-arm-msm@lfdr.de>; Sat, 27 Mar 2021 09:14:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230299AbhC0IOK (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 27 Mar 2021 04:14:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53840 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230236AbhC0IOI (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 27 Mar 2021 04:14:08 -0400
Received: from mail-qk1-x72c.google.com (mail-qk1-x72c.google.com [IPv6:2607:f8b0:4864:20::72c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6AF3FC0613B1
        for <linux-arm-msm@vger.kernel.org>; Sat, 27 Mar 2021 01:14:08 -0700 (PDT)
Received: by mail-qk1-x72c.google.com with SMTP id x14so7664450qki.10
        for <linux-arm-msm@vger.kernel.org>; Sat, 27 Mar 2021 01:14:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=GA1NAt/P4hZZ77ii+4lem0NtMczgvNhopIy4dEXQnn4=;
        b=gWOM71jfvcbF0JmzQu4+alNMYqbWw7LFkVDmzdziMODAxYp0L/e/wyrBN+KWvDuIib
         BZsR/kBUBiUcRvSi0W7uROyovLXYUFyfJAAUnEEY26oXjUG77x+E+ci4OMv24l2qrwc5
         Qsdw0H2dGDilhVy4zlx8h+DV5SXeGmqoY6YA7H3M8X/pygadRG0ENXMj1cMNC+BCbwuU
         1wE9b1APJSzeSYgsYiSbMKFSCsTB3aUKJyvOCNcxvZMHTG2pxqN4d4EEWUyS1rqC+6ee
         OO9S0qKLcNeW6bKFWfRERAgAwqDKrEkSapyfL+q1aAqZDlRTb5M5Z406yVhMr8ZiMBmW
         DmUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=GA1NAt/P4hZZ77ii+4lem0NtMczgvNhopIy4dEXQnn4=;
        b=Z4Pzet8J5sZEa1BDVGLmi1CfICoPwS3bl1Wlf8Z0OF/wxVH8mjgCnF4oPLJ3byfN3s
         5JyCMRbz3fExG1eEM3IldsokY4ksDidZlteUTGCHohym3utXXipg/PXc1LAFkL/0bTvV
         43tSyHVqSPMXLchszJPV0toe+ESfASWZVrQgEDCAS5Uq8JYB9gWDUwibDCSeJBguJ3kE
         XVAIpjiF8bkskh8umlmV4Up+SzPCMg8Y19eE0BwW6Dbpr4ffBTi6UouUXfQHGDY9Ds7+
         d97ZhFawUWKnO45ZzntbDlonFOQl1DrqIjJFUefMHUk67KO2fMOPYFX1AllJoTcU6ISc
         q38A==
X-Gm-Message-State: AOAM531kMB8mIyXCfVliswxtfWrapv+Putuk/1Z8njKol3MYyDfbmDrE
        vLV1oaWS+Rlda6p4Y6EZ4M0s2qennqYZFM3S6UZqQv54z18=
X-Google-Smtp-Source: ABdhPJztjaHLPVnoSuTcEvbZbcNybX85qv9Zaf+aKVXDTvagf+tHDV169uNcVzNrQPppxtfwqJDD81egywmRNcYhUA4=
X-Received: by 2002:a05:620a:1326:: with SMTP id p6mr17259918qkj.217.1616832847499;
 Sat, 27 Mar 2021 01:14:07 -0700 (PDT)
MIME-Version: 1.0
References: <20210325111144.2852594-1-dmitry.baryshkov@linaro.org>
 <20210325111144.2852594-7-dmitry.baryshkov@linaro.org> <4217c4a2-cb15-ef08-8c39-9a5f164d2b41@codeaurora.org>
In-Reply-To: <4217c4a2-cb15-ef08-8c39-9a5f164d2b41@codeaurora.org>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date:   Sat, 27 Mar 2021 11:13:56 +0300
Message-ID: <CAA8EJpoNThCf-R8+CmjNWC9bGin8x60v-AjZrsm2x=ZE+UDjgw@mail.gmail.com>
Subject: Re: [PATCH v1 06/15] clk: qcom: videocc-sc7180: drop unused enum entries
To:     Taniya Das <tdas@codeaurora.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        "open list:DRM DRIVER FOR MSM ADRENO GPU" 
        <linux-arm-msm@vger.kernel.org>,
        "open list:COMMON CLK FRAMEWORK" <linux-clk@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Tanya,

On Sat, 27 Mar 2021 at 04:49, Taniya Das <tdas@codeaurora.org> wrote:
>
> Hi Dmitry,
>
> Thanks for the patch for cleanup.
> It is okay to remove TEST source, but you can still keep the sleep clock
> source as it could be still connected to certain RCGs and could be used
> to derive low frequencies if required.
>
> As these sources are generated from the HW plans it would be good if we
> keep them as they are except the TEST source.

Please note that I've barely removed the unused enum entry, which is
not used in any of clock parent maps. So I'd suggest to either add it
to relevant clock parent maps and to the videocc bindings or to drop
unused enum entry.

>
> On 3/25/2021 4:41 PM, Dmitry Baryshkov wrote:
> > Drop unused enum entries from the list of parent enums.
> >
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > ---
> >   drivers/clk/qcom/videocc-sc7180.c | 2 --
> >   1 file changed, 2 deletions(-)
> >
> > diff --git a/drivers/clk/qcom/videocc-sc7180.c b/drivers/clk/qcom/videocc-sc7180.c
> > index 276e5ecd4840..f5d04791a3cd 100644
> > --- a/drivers/clk/qcom/videocc-sc7180.c
> > +++ b/drivers/clk/qcom/videocc-sc7180.c
> > @@ -19,8 +19,6 @@
> >
> >   enum {
> >       P_BI_TCXO,
> > -     P_CHIP_SLEEP_CLK,
> > -     P_CORE_BI_PLL_TEST_SE,
> >       P_VIDEO_PLL0_OUT_EVEN,
> >       P_VIDEO_PLL0_OUT_MAIN,
> >       P_VIDEO_PLL0_OUT_ODD,
> >
>
> --
> QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
> of Code Aurora Forum, hosted by The Linux Foundation.
>
> --



-- 
With best wishes
Dmitry
