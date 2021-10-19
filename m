Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C7E4A433133
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 Oct 2021 10:38:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234727AbhJSIk6 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 19 Oct 2021 04:40:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40098 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234592AbhJSIk6 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 19 Oct 2021 04:40:58 -0400
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com [IPv6:2a00:1450:4864:20::52d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 95BEFC06161C
        for <linux-arm-msm@vger.kernel.org>; Tue, 19 Oct 2021 01:38:45 -0700 (PDT)
Received: by mail-ed1-x52d.google.com with SMTP id z20so9655248edc.13
        for <linux-arm-msm@vger.kernel.org>; Tue, 19 Oct 2021 01:38:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=aleksander-es.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Nn9Mwq+okLSAl8vqqnBdoFkCYEOhhyNqu+HDZ6XCHxc=;
        b=yyObmymfj7sBB3+G77KW/d5K+aLCkr4pdwLVeMJvuGnXd2Q1fX/WxDJU7sGNa9AvSK
         SaLwT9/Puf35MpAuvgpYpYXMTXhLpG4uY8sp2EldaQ9hPt+u+cAaPirUbAu9dOapMHZM
         d9yBLzYQdLvvdeo0sGFKVPj/QaW470YCLjymZHCO3tKKcu6zEYgeJZ1RyIKpPdwstfDO
         Eg3IG+SKd71VoSUXiN55Dk/99KkC8juLJX96OvZ61q8Y+VBvJDPalw2xDJF5O0Iqz+tB
         c0gdYvleqLT08THjcWMiZLDeOuyvntaqyd+GKNbzh2wa4Qz5FzQ0yw4U6Pq3Jf6yIZz9
         r8bA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Nn9Mwq+okLSAl8vqqnBdoFkCYEOhhyNqu+HDZ6XCHxc=;
        b=6sB4TOIhor2UyWp4IAY9SY3bjIdiiyZnFRyrJOpnMzbJdttnerL1xN2Rb31JQPpvcW
         g+fetJtitWvKKxR+ZHzlYxULfflsIhaFaHQ5WZNf1yN58XpYflHq4MNnlo4yQStJAoDC
         sJCrtuJrSM8WxoSDB1s644opqNHmGMbbtWOXGoVAHFJQ8xW4Pi77DgSguglUeGcJwzl/
         E1kRDC6Hz+xW9+wZho6bgQfS1vONDvUiZGKJ5no6CJ6nh9Vbdmk5dEDvn/iSJIokUVnB
         bBXvaDDGGZku0M6fijcVdCfWhgXyahckS9lQ1ZlchFLPYXkK7NTkSLGrm0W42l0zG/iO
         IkeA==
X-Gm-Message-State: AOAM532Quyvq0ZFLgAra9WIgwPS5ZQaXlvHULiEF1UT7B2mwqzCiVFKb
        UoqKlyLN01piiJIOKZmo6CrBJBVTfkWVRAQOtU595g==
X-Google-Smtp-Source: ABdhPJw0YORBJaFWUITJjymT4mHis9QpFRLrCx/kQdj4Kmsh7WoukFI69lWoYNNkrVK9nM7D1Lp2S62QdZZHznth2zw=
X-Received: by 2002:a17:907:1c0c:: with SMTP id nc12mr35473380ejc.548.1634632724000;
 Tue, 19 Oct 2021 01:38:44 -0700 (PDT)
MIME-Version: 1.0
References: <CAAP7ucLJYfftfCuKxnW8Q7-duyEuGgHA5gk+h2JyyAzNq75QSA@mail.gmail.com>
 <da0ed6cf2c0a07295a09758259521b03a7bcdc19.camel@bootlin.com>
 <CAAP7ucLu9JJjo+gN6fsSZVGKHX6VGoYkgBmsA0s9qsA-hdH6=A@mail.gmail.com>
 <2c34a05884cd68eb08e061e9d4d1aa572d78f03c.camel@bootlin.com>
 <CAAP7ucLVBn3Vk25jqL18Qxtsd=PmCpTiNY5j_pgai4BBbTOGWA@mail.gmail.com>
 <CAMZdPi8QXrjN6VYU1VrGeOBhvVSnxopioM7POEOcS5ywsSFDHQ@mail.gmail.com>
 <CAAP7ucKL+5oUmidVp1W-oOyfuuYR3F-11GuNdxLX9iYijaL6_A@mail.gmail.com>
 <CAAP7uc+5=GMGgz3MKfSWaAtes1WwCCx+6iYhb058ZUr0=A52cg@mail.gmail.com>
 <CAMZdPi9cbDVWVxvimg-uc_TRvskrxbjEQ4AxdLjA57Ewm2tSPA@mail.gmail.com>
 <bd875c3b9d19f8827362b129999d84cd04ad90ae.camel@bootlin.com>
 <CAMZdPi_J7ePh22v7J3WgqO9X3Y1KffTm__TfL9jGHj61H2x9QA@mail.gmail.com> <1f846b0be78560c1299fa26d351b66567be403e1.camel@bootlin.com>
In-Reply-To: <1f846b0be78560c1299fa26d351b66567be403e1.camel@bootlin.com>
From:   Aleksander Morgado <aleksander@aleksander.es>
Date:   Tue, 19 Oct 2021 10:38:32 +0200
Message-ID: <CAAP7ucJBed_5rCdyjWC9x8EkXn5+E7p4P46=ukAaC1vTFLdDAQ@mail.gmail.com>
Subject: Re: Sierra Wireless EM9191 integration issues in mhi+wwan
To:     Thomas Perrot <thomas.perrot@bootlin.com>
Cc:     Loic Poulain <loic.poulain@linaro.org>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        Hemant Kumar <hemantk@codeaurora.org>,
        Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hey,

> > What is done in the downstream driver?
>
> As we encountered issues with the generic event ring configuration, I
> tried with a configuration equivalent to that of the vendor driver,
> that uses the same ring for data, control and diag stuff.
>


This is the event ring configuration in the MBPL driver from Sierra,
with NUM_MHI_EVT_RING_ELEMENTS=2048:

static struct mhi_event_properties event_config[] = {
/*    num                        intmod  msi chan    pri brs type
hw_ev   c_m off  */
    { NUM_MHI_EVT_RING_ELEMENTS,  1,      1,  0,      1,  2,  1,
0,      0,  0},
    { NUM_MHI_EVT_RING_ELEMENTS,  1,      2,  100,    1,  3,  0,
1,      0,  0},
    { NUM_MHI_EVT_RING_ELEMENTS,  1,      3,  101,    1,  3,  0,
1,      0,  0},
//    { 240,  1,      3,  101,    1,  2,  0,      1,      0,  0},
//    { 240,  1,      4,  0,      1,  2,  1,      0,      0,  0},
};

And this is the event ring configuration we're using in the upstream
integration:

static struct mhi_event_config modem_sierra_em919x_mhi_events[] = {
       /* first ring is control+data and DIAG ring */
       MHI_EVENT_CONFIG_CTRL(0, 2048),
       /* Hardware channels request dedicated hardware event rings */
       MHI_EVENT_CONFIG_HW_DATA(1, 2048, 100),
       MHI_EVENT_CONFIG_HW_DATA(2, 2048, 101)
};

I have tried to add a non-ctrl ring copying the setup of the Foxconn
SDX55, but did not help in my case:
    MHI_EVENT_CONFIG_CTRL(0, 128),
    MHI_EVENT_CONFIG_DATA(1, 128),
    MHI_EVENT_CONFIG_HW_DATA(2, 1024, 100),
    MHI_EVENT_CONFIG_HW_DATA(3, 1024, 101)

-- 
Aleksander
https://aleksander.es
