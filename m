Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4FAD72957B0
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 Oct 2020 07:13:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2502677AbgJVFMs (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 22 Oct 2020 01:12:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60330 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2444218AbgJVFMs (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 22 Oct 2020 01:12:48 -0400
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com [IPv6:2607:f8b0:4864:20::444])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BD2F8C0613D2
        for <linux-arm-msm@vger.kernel.org>; Wed, 21 Oct 2020 22:12:46 -0700 (PDT)
Received: by mail-pf1-x444.google.com with SMTP id b26so413834pff.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 21 Oct 2020 22:12:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=2Zb63bH1NbEum/OLuzSIrhnLWeKUO8Zod+ndrWM7EmA=;
        b=Ju9bd5gphU99uj/yh0ufc8gQO+ePImeOwBqeesvMqPmC3AyeC0tO/3AyY71FcT8+UJ
         lhZWTwfk556SigBHRAMOs+x8SrDWcBTfqbt/rKeOSeiEtgT6Omg8FDoJz9Y8tVjy/mhy
         W2gpzNN+/VLnHnzOpW4uuZITN/dre75uqO3aoFILFRAcb3Fyub7jadMs9KCSgq8W0A+W
         XvDueW/cbwwS/N78UYnh07M9h5ohJTKWRx8DJqlXS5WfrN/BMHxA/wyRdGF3bMBvo3G7
         Azv+j0mVpLtSIkuEjWr8jdSb/cEP4Ve+suem9ZNycndWhPZeLNj0QwF5kLLQh69akiXK
         Z4HQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=2Zb63bH1NbEum/OLuzSIrhnLWeKUO8Zod+ndrWM7EmA=;
        b=i6JXkyomZqaijna+wYxqZQhPRrnJKuWrnLVV8PrCr1lGLw3LklB0aXMHcdnmAkSQdd
         b7dl4Bkmv99zqxO7yrenxP1LMqwYqj2MCcrlKBozYvm8BRkCuCggHJTcWs8jcQ8Li+EC
         QAopY1lRVJrZHUxRnrWoS48hx0EopuQ7140t89+QpD30LBfFAEs0muvn+zJm8+m1t7BY
         LeppbLJWqhBheOY1Z/EpBoPA6zgI04+7QuraNKtrHQaoqdiUnsAH5LnisOuIjg/Iyfhg
         imRCkx2IxAdr1/WojKZ5t7fMrGkdBnxLcFp3v1yCg9YTffHaLehkt0Evg1aC3jqbNItW
         Agew==
X-Gm-Message-State: AOAM532AJ5odqJ8n15iPVHsw/HB4oxiieRlu5ZUgeA1SJQ+nSrlNkg9o
        FBasaBBLV8deP2G8pHHQvT1PMA==
X-Google-Smtp-Source: ABdhPJyeB2dOc+PbV3anGzAlbLWOVkX8Lfo6+NfKbVZ5BbJKHOgDEoPAhSmOXTX5LGmjkYXRJZQ01A==
X-Received: by 2002:a63:24c2:: with SMTP id k185mr870579pgk.421.1603343565998;
        Wed, 21 Oct 2020 22:12:45 -0700 (PDT)
Received: from localhost ([122.181.54.133])
        by smtp.gmail.com with ESMTPSA id q66sm505225pfc.109.2020.10.21.22.12.44
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 21 Oct 2020 22:12:45 -0700 (PDT)
Date:   Thu, 22 Oct 2020 10:42:43 +0530
From:   Viresh Kumar <viresh.kumar@linaro.org>
To:     Rob Clark <robdclark@gmail.com>
Cc:     Rajendra Nayak <rnayak@codeaurora.org>,
        Sean Paul <sean@poorly.run>,
        Linux PM <linux-pm@vger.kernel.org>,
        Vincent Guittot <vincent.guittot@linaro.org>,
        Rafael Wysocki <rjw@rjwysocki.net>,
        Stephen Boyd <sboyd@kernel.org>, Nishanth Menon <nm@ti.com>,
        Douglas Anderson <dianders@chromium.org>,
        Naresh Kamboju <naresh.kamboju@linaro.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        freedreno <freedreno@lists.freedesktop.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH V2 3/8] drm/msm: Unconditionally call
 dev_pm_opp_of_remove_table()
Message-ID: <20201022051243.gsjx2ksoilec4wo2@vireshk-i7>
References: <cover.1598594714.git.viresh.kumar@linaro.org>
 <6e4110032f8711e8bb0acbeccfe66dec3b09d5c1.1598594714.git.viresh.kumar@linaro.org>
 <20201005062633.ejpehkpeuwksrx3e@vireshk-i7>
 <20201021072404.y43tjzd2ehclrejp@vireshk-i7>
 <CAF6AEGvAK_mAxJB32vvPOD3jumpYprRtUBPT8GRBV8gty7fxFQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAF6AEGvAK_mAxJB32vvPOD3jumpYprRtUBPT8GRBV8gty7fxFQ@mail.gmail.com>
User-Agent: NeoMutt/20180716-391-311a52
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 21-10-20, 09:58, Rob Clark wrote:
> On Wed, Oct 21, 2020 at 12:24 AM Viresh Kumar <viresh.kumar@linaro.org> wrote:
> >
> > On 05-10-20, 11:56, Viresh Kumar wrote:
> > > On 28-08-20, 11:37, Viresh Kumar wrote:
> > > > dev_pm_opp_of_remove_table() doesn't report any errors when it fails to
> > > > find the OPP table with error -ENODEV (i.e. OPP table not present for
> > > > the device). And we can call dev_pm_opp_of_remove_table()
> > > > unconditionally here.
> > > >
> > > > While at it, also create a label to put clkname.
> > > >
> > > > Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
> > >
> > > Can someone please apply this and the other drm patch (2/8) ?
> >
> > Rob/Rajendra, can someone please have a look at these patches ?
> 
> Oh, sorry I missed that, could someone re-send it and CC
> freedreno@lists.freedesktop.org so it shows up in patchworks.. that is
> more reliable counting on me to not overlook something in my mail

I have just bounced it back to you and freedreno was already cc'd,
though I have bounced it there again.

-- 
viresh
