Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8B04D7CFDC1
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Oct 2023 17:25:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346204AbjJSPZC (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 19 Oct 2023 11:25:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57726 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1346183AbjJSPZB (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 19 Oct 2023 11:25:01 -0400
Received: from mail-yw1-x112f.google.com (mail-yw1-x112f.google.com [IPv6:2607:f8b0:4864:20::112f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4C84A124
        for <linux-arm-msm@vger.kernel.org>; Thu, 19 Oct 2023 08:24:59 -0700 (PDT)
Received: by mail-yw1-x112f.google.com with SMTP id 00721157ae682-5a81ab75f21so83078797b3.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 19 Oct 2023 08:24:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1697729098; x=1698333898; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=J36Azv4uFKfg/u6mhROMjBfFW8n3utMKNNnMSljqYeE=;
        b=VGveyvSvsLKS++qcGlCJY8A1pPq1gp7P3srPDzA18+MJK0rG0BCN21A6x5Tzy16lkU
         7EH6I5h2SvXa1gd9zwkF0ednBzal4bCTSHwVoV1CRmeyKLWDR2XlUB0a6AfMcHyfyR5R
         +qqrZhUHl8DmVQtPFvvfTDumVzsB1RM6f1E44o6CTrmPSzLt0rna837cqBjrGCtXip8j
         qyOGTqsHSZ0rvBy2HgmZl6GVq8ULfsJIZXClOZ7A0wykBS+LBrTOV9QVb/Qsp6Eq0YIU
         xDlBbRAwQdTbdiSIgMGb8OMJMU4gDjLHBDnNukqXcSpKM4NgPkJzx8MlT6fhze7wSPRf
         XR+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697729098; x=1698333898;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=J36Azv4uFKfg/u6mhROMjBfFW8n3utMKNNnMSljqYeE=;
        b=rDzlBbsOaWKf4vhKZgQQgoPY8eMv7XVTENyE06ttkFZgzx/bQJsUq0IsjLoWzZxg6F
         aEUn6K2uuirkH5DSgdvhZi1Rnsl9yTyIK7S1wdo0ZzcKfKfryel6ir+5T+w5J/Juk8e9
         K4FbeofIVdzsIACy2zGh9kzVCJY/lQ1IBgz9LvgcHHHZIAcy9TFSVwsOT7rm6Hz9LqWh
         lQIPwvn3NJoLFc6IVR4BbekXub2ZDVIk45o8fwjPAmDJOu+iawQOuQ/N6lDQM6z6NyV1
         J6uPpeppX24spk7AIcqKpg2JjX40/SWumwJGP1Uhs1EefgFnOdN1seqQKopAYxDFlBmQ
         t60w==
X-Gm-Message-State: AOJu0Yz2Wi267RiM89o1nyCV5KvncHq3veKznKGYffvQYVw2pHf1Ztfv
        GLQlTou7FPmXNO6crjVWCRdVv0yu/Oe6+4cFsTk81EQ3FJCpGeRvbW8=
X-Google-Smtp-Source: AGHT+IHoS3lOcMrgJgOvXlMdvEHQhDGEb0EgVhhsMBQfKYrpGUPWK2pq2iY+oQNE+Hf0v59dLYODm4po1Lsi9OCNyeU=
X-Received: by 2002:a05:690c:dc4:b0:5a7:aa54:42b1 with SMTP id
 db4-20020a05690c0dc400b005a7aa5442b1mr3552884ywb.28.1697729098464; Thu, 19
 Oct 2023 08:24:58 -0700 (PDT)
MIME-Version: 1.0
References: <20231019144311.1035181-1-dmitry.baryshkov@linaro.org> <ZTFEVpNOkGedJGoj@gerhold.net>
In-Reply-To: <ZTFEVpNOkGedJGoj@gerhold.net>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date:   Thu, 19 Oct 2023 18:24:47 +0300
Message-ID: <CAA8EJpruauNB6c7O1p3fRJRLPmL7bH=PoSffJiBoWn=pSOwryQ@mail.gmail.com>
Subject: Re: [PATCH] thermal/qcom/tsens: drop ops_v0_1
To:     Stephan Gerhold <stephan@gerhold.net>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Amit Kucheria <amitk@kernel.org>,
        Thara Gopinath <thara.gopinath@gmail.com>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Zhang Rui <rui.zhang@intel.com>, linux-arm-msm@vger.kernel.org,
        linux-pm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, 19 Oct 2023 at 17:59, Stephan Gerhold <stephan@gerhold.net> wrote:
>
> On Thu, Oct 19, 2023 at 05:43:11PM +0300, Dmitry Baryshkov wrote:
> > Since the commit 6812d1dfbca9 ("thermal/drivers/qcom/tsens-v0_1: Fix
> > mdm9607 slope values") the default v0.1 implementation of tsens options
> > is unused by the driver. Drop it now to stop compiler complaining about
> > the unused static const. If the need for the default v0.1 ops struct
> > arives, this commit can be easily reverted without further
> > considerations.
> >
> > Fixes: 6812d1dfbca9 ("thermal/drivers/qcom/tsens-v0_1: Fix mdm9607 slope values")
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>
> Seems like I remember correctly that there was a patch for this already
> that wasn't picked up yet(?):
> https://lore.kernel.org/linux-arm-msm/20230617113837.3224912-1-trix@redhat.com/
>
> It doesn't have the Fixes tag though. I think both patches are fine.
> Thanks for fixing this. :-)

I'm perfectly fine with either of the patches being picked up.

>

-- 
With best wishes
Dmitry
