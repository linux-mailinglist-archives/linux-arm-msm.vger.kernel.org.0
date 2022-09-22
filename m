Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F2BA85E5FB8
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 Sep 2022 12:21:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231445AbiIVKVC (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 22 Sep 2022 06:21:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40148 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231454AbiIVKU7 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 22 Sep 2022 06:20:59 -0400
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com [IPv6:2a00:1450:4864:20::42d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6885FDCCD6
        for <linux-arm-msm@vger.kernel.org>; Thu, 22 Sep 2022 03:20:57 -0700 (PDT)
Received: by mail-wr1-x42d.google.com with SMTP id s14so12755161wro.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 22 Sep 2022 03:20:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date;
        bh=6sV4IF1wLSw//pDLHYCBfBqE1hSLB1xpdVDSwgnvdOw=;
        b=MH00jCSAwDeZQy5J9S5RPwa4RCE+0+jOV+1xXnwRqw4SyfBq/U/EOOBZZlClST2sEy
         wvotUAf+BpQpbVC1OE0EUrw+nbgiKFXZLJjSWBf6fpxys5pVZ5Ajd/n3TrKHMxlyq7QR
         twt7VJquNyHnSiS1AziDMpRlWJ/PbVQbnHLXQ70gAp5RsFXumbP/EEEXp6fUjXY/kSdb
         bwMYNRI2/D7UUFbhWez8Qovj6klpGlD8sGgshNRob45V8/3WGOWYCO49XRfGkDAob4T2
         wzuijinnFgFLjuy1ah+ZSKgNnJ5sIrzAFh6HL3tMx8e2mNIEUhD/TOZr4H3ukw3a9c2K
         PcWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date;
        bh=6sV4IF1wLSw//pDLHYCBfBqE1hSLB1xpdVDSwgnvdOw=;
        b=GoT+PrxXEZySyFFOPLyymmaF8Jfns5SAVdpEOveCTOOdAhaDEsIScMhVTjcNBv12qw
         sWNFbTNJ7bdrJbIteNsQ9Q0bPOwOSVBLCrTetwZQUaK4K00SQdGhGeI2wH8xCuRVM8uW
         r7ySMVk37mejfIXLo0ELaJE5zMzb7J4SFDFn4Jv9F7eY2oXr0XYZXc/6ATgdauI80uaL
         f7/MbKR5d3HNA0WoHRGTU1HHwkPQ/6xUkGvGR0C79rdqO7G/tsM0uBs3kufWceVKW2ZL
         ll3oM9cxn1ym9iUlu1GGOgsbPMvHfUOQbqFszl+Idf6e5pGCVPw+1HLEiWAgaggP9hnU
         vgTA==
X-Gm-Message-State: ACrzQf2s4me7dUkgGsBGEITYRCbQNZcfubkL0upRnZufiKsQb/3NHHBj
        vLH68OPMrLI/Pp7qLg7SP5s4bw==
X-Google-Smtp-Source: AMsMyM5RP4LC33bEHoOHdwjemykgfCkChqb/iZSJnmjLuKFWJeoJVCtXEqfzWpFXRLjB/dE9bynq8Q==
X-Received: by 2002:a5d:4444:0:b0:22a:2a64:a0fd with SMTP id x4-20020a5d4444000000b0022a2a64a0fdmr1555646wrr.293.1663842055575;
        Thu, 22 Sep 2022 03:20:55 -0700 (PDT)
Received: from google.com (cpc155339-bagu17-2-0-cust87.1-3.cable.virginm.net. [86.27.177.88])
        by smtp.gmail.com with ESMTPSA id g17-20020a5d4891000000b0022a2bacabbasm4913089wrq.31.2022.09.22.03.20.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Sep 2022 03:20:55 -0700 (PDT)
Date:   Thu, 22 Sep 2022 11:20:53 +0100
From:   Lee Jones <lee.jones@linaro.org>
To:     Caleb Connolly <caleb.connolly@linaro.org>
Cc:     Luca Weiss <luca.weiss@fairphone.com>,
        linux-arm-msm@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        Jonathan Cameron <Jonathan.Cameron@huawei.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        linux-kernel@vger.kernel.org, Lee Jones <lee@kernel.org>
Subject: Re: [PATCH v3 1/2] mfd: qcom-spmi-pmic: convert hex numbers lowercase
Message-ID: <Yyw3Ba08SWNVTIfI@google.com>
References: <20220915113523.44074-1-luca.weiss@fairphone.com>
 <YylwxQSulh7C48T7@google.com>
 <CN1UV8GZPKW8.3KT1X7WYEM4K5@otso>
 <b7551b18-887a-c895-b347-776bb537ae9f@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b7551b18-887a-c895-b347-776bb537ae9f@linaro.org>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, 21 Sep 2022, Caleb Connolly wrote:

> 
> 
> On 21/09/2022 07:12, Luca Weiss wrote:
> > Hi Lee, hi Caleb
> > 
> > On Tue Sep 20, 2022 at 9:50 AM CEST, Lee Jones wrote:
> > > On Thu, 15 Sep 2022, Luca Weiss wrote:
> > > 
> > > > There are some IDs that are written in uppercase. For consistency
> > > > convert them to lowercase.
> > > > 
> > > > Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> > > > ---
> > > > Changes since v2:
> > > > * Split out to separate patch
> > > > 
> > > >   include/soc/qcom/qcom-spmi-pmic.h | 6 +++---
> > > >   1 file changed, 3 insertions(+), 3 deletions(-)
> > > 
> > > These aren't MFD patches.  Please reword the subject.
> > 
> > Do you have any suggestion what subject to use then? The most I can
> > think of is "soc: qcom: " which is sometimes used for other files in
> > this include directory.
> > I've used the current subject because the previous two patches touching
> > this file had this subject also.
> 
> This file just contains platform data which used to be in the qcom SPMI
> PMIC driver. In hindsight, maybe it would have been better suited in
> include/linux/mfd but I don't think it matters too much. I guess it makes
> sense to follow convention for the directory and treat it like the other
> platform headers, maybe something like:
> 
> soc: qcom: spmi-pmic: convert hex numbers to lowercase

Agree.

-- 
DEPRECATED: Please use lee@kernel.org
