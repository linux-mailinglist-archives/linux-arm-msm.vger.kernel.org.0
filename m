Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CAA283BE264
	for <lists+linux-arm-msm@lfdr.de>; Wed,  7 Jul 2021 07:13:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230120AbhGGFPh (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 7 Jul 2021 01:15:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57164 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230108AbhGGFPg (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 7 Jul 2021 01:15:36 -0400
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com [IPv6:2a00:1450:4864:20::22d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1692BC061574
        for <linux-arm-msm@vger.kernel.org>; Tue,  6 Jul 2021 22:12:57 -0700 (PDT)
Received: by mail-lj1-x22d.google.com with SMTP id a6so1091204ljq.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 06 Jul 2021 22:12:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=tbekPJYhk51AiCb/jp2mDu1SGe+rJ18xe7z1A6805jM=;
        b=fe4Ocl93rz7pECRQ1CotlTG3DMZJWB6KbfvEAGDDz0pOLoDd2Czs1C0Q4gG/WnxjWt
         Ha8o6slBnBLB7Qo6BIky+i7Zh+Q0BxgBpPGfZogc4KGXDNwc1AkFN4hh6k8V/l704Dw7
         VRjZ8Ju1F//y4ZLQyIKuT5gvxcdgpp117aEO/EzjqJDt968i7gZdxIZ3x7gtgnhffLQW
         vEwORBnDSzBQHh8yo4L+R4a1uV43BNTtsgrIDsCumj1nGDqr5juzpDznHSwSYOWhQjKM
         Cd+wjmNzLuYNzLJznG0bn+vtfDqtg0IKN56SXueZKGTMkAsKYLVfANKfcE0CXCTJbLHp
         h7Bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=tbekPJYhk51AiCb/jp2mDu1SGe+rJ18xe7z1A6805jM=;
        b=V4KAUE+E0BcLjdhE0VEVwu9Met9FQ3NOGHJycMaM4R4GdJeveVr0UaWiHXlX6Yzeiq
         RcYWO0zWuK25SAjzadn5yqSD/jy/YQENTfp1TCpkyveQ/cC0rGyvh+xPB/COSsbEUWcO
         Xg7FNXo8+XlkNwxdDlcSheprwhGyf507FnrLaDMy5oRMWvKuQAUrLlegFTiYTRS/j05+
         H7uFjNp72BfL3DsJ6qLkXUqcGU7u2a6VroSIbbwvOzeher8Dmg3AGOIwb3XeMAnnDAYu
         c0tRtamIrM7Df52jZ6O2KVCMAX/C+i/ebvEKfV9l33mz7Bx4Aa9HwnNZ5GIKVW4/Yq3w
         ph/A==
X-Gm-Message-State: AOAM531wxS43CDlCtRyOr3AHUQQleB0YnBfwxxKbx+hybOlwyIcvuQrN
        aGqASL7i4ozcvRCsO4atxPSxYje4Z0//DflaRdlcNg==
X-Google-Smtp-Source: ABdhPJxbc3+AxHLhFeAT5cU6slD5V2CJU2jO01d5xbmQ1yKB7QPxdlU4achffWzuXV4bC2pvaZA0xymSpnPwlr5oNvE=
X-Received: by 2002:a05:651c:2c1:: with SMTP id f1mr3244451ljo.128.1625634775403;
 Tue, 06 Jul 2021 22:12:55 -0700 (PDT)
MIME-Version: 1.0
References: <20210610214431.539029-1-robdclark@gmail.com> <2016473f-2b38-f049-1e8d-04bdf5af6cea@linaro.org>
 <CAF6AEGu6Wt+FDh_Kp8GrZB9TV7ufTuidmqBfkzA9rcCJc7zSQQ@mail.gmail.com>
In-Reply-To: <CAF6AEGu6Wt+FDh_Kp8GrZB9TV7ufTuidmqBfkzA9rcCJc7zSQQ@mail.gmail.com>
From:   John Stultz <john.stultz@linaro.org>
Date:   Tue, 6 Jul 2021 22:12:47 -0700
Message-ID: <CALAqxLWDqQeD-eieHXtePuXpxN1s3=jCNJP2pJD-YswsLP-mJw@mail.gmail.com>
Subject: Re: [PATCH v5 0/5] iommu/arm-smmu: adreno-smmu page fault handling
To:     Rob Clark <robdclark@gmail.com>
Cc:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        "list@263.net:IOMMU DRIVERS <iommu@lists.linux-foundation.org>, Joerg
        Roedel <joro@8bytes.org>," <iommu@lists.linux-foundation.org>,
        freedreno <freedreno@lists.freedesktop.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Jordan Crouse <jordan@cosmicpenguin.net>,
        Rob Clark <robdclark@chromium.org>,
        Akhil P Oommen <akhilpo@codeaurora.org>,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@somainline.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Douglas Anderson <dianders@chromium.org>,
        Eric Anholt <eric@anholt.net>,
        "Isaac J. Manjarres" <isaacm@codeaurora.org>,
        Joerg Roedel <jroedel@suse.de>,
        Jonathan Marek <jonathan@marek.ca>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Krishna Reddy <vdumpa@nvidia.com>,
        "Kristian H. Kristensen" <hoegsberg@google.com>,
        Lee Jones <lee.jones@linaro.org>,
        "moderated list:ARM SMMU DRIVERS" 
        <linux-arm-kernel@lists.infradead.org>,
        open list <linux-kernel@vger.kernel.org>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Robin Murphy <robin.murphy@arm.com>,
        Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>,
        Sharat Masetty <smasetty@codeaurora.org>,
        Will Deacon <will@kernel.org>,
        Zhenzhong Duan <zhenzhong.duan@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Sun, Jul 4, 2021 at 11:16 AM Rob Clark <robdclark@gmail.com> wrote:
>
> I suspect you are getting a dpu fault, and need:
>
> https://lore.kernel.org/linux-arm-msm/CAF6AEGvTjTUQXqom-xhdh456tdLscbVFPQ+iud1H1gHc8A2=hA@mail.gmail.com/
>
> I suppose Bjorn was expecting me to send that patch

If it's helpful, I applied that and it got the db845c booting mainline
again for me (along with some reverts for a separate ext4 shrinker
crash).
Tested-by: John Stultz <john.stultz@linaro.org>

thanks
-john
