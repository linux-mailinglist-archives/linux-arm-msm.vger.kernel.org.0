Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 33960424639
	for <lists+linux-arm-msm@lfdr.de>; Wed,  6 Oct 2021 20:44:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239153AbhJFSqD (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 6 Oct 2021 14:46:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41726 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231624AbhJFSqD (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 6 Oct 2021 14:46:03 -0400
Received: from mail-pg1-x531.google.com (mail-pg1-x531.google.com [IPv6:2607:f8b0:4864:20::531])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B4423C061753
        for <linux-arm-msm@vger.kernel.org>; Wed,  6 Oct 2021 11:44:10 -0700 (PDT)
Received: by mail-pg1-x531.google.com with SMTP id r2so3264220pgl.10
        for <linux-arm-msm@vger.kernel.org>; Wed, 06 Oct 2021 11:44:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=BRycDukXp/mwG19rK+ZZveffPObZScVLwnEXUPao+Qo=;
        b=dGB+k3+qNGd/+wJJNrFG9vCJplDjNmludJHXOhGA5rXke971izpN7UhxeJcT7MNDPU
         AurJjZzVIWgAnLKC90k7BjSi3YpMjvNigLRvvhQKqNUaqW1VamZ5EXwSRHbGXOf+W6Sl
         7IgiMMLRziARhtyyA04yPxDlEfYp9b7VVlC8xItUwdkHt28eRNLm0cSzhn8ErxRsZzN9
         Vzr60PxAm7X84mDEgluZbigKV4U1V5zB6W8UcVbJ15tsptEN/EEgUJFkjJmGC+eDIrhT
         3s81ngvG2Z6YEmtsllnNN9jazLwe+9HKLKs/aYEZc10CuW/FmiADaE2phMwt3Mi0h8yP
         69eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=BRycDukXp/mwG19rK+ZZveffPObZScVLwnEXUPao+Qo=;
        b=N9rpNsDcorA/dLfdJZB3Gyrj5ceugaqZmnOmOKxFPkw9EOhAs2JngQQ30n/woJGf4E
         98MWTsNuKDs7dD1PiyTlZKGMT6bvaBpbZiTyhFoeTWtqYMkwI7pAnbF0P76WX3caphOU
         r+6gQBFFqPJxoxwoLXKZInYF83fYpf0IOseI01RAhzNowsKS0Yk6sIo0BLTpdG51iwNs
         J95yHWdo7fhRt9bwJE1VS2gSLeGqD/MJVwUnGq/LyozY95Gcj2TZT8nfKXcm54VeGEPz
         4hL73fGdrOgA1DCkwCKukTESMrOuiAdZWSiL66CtcASMCTzUStnfNioNlzmxGmNrrc64
         Qsyg==
X-Gm-Message-State: AOAM532Ej0IOtN2dYQLtGOptzelWy7w3fMMpiThtWrXSH65AgSszoy/c
        909gMcIU1rvMI+WfOnZRLrXT
X-Google-Smtp-Source: ABdhPJyhBGw4InI09Ed/EIPnI9X+8ylbqAVBx0qlJ5UmeYYxO0j8y0mJwfvwwTP9TeW0ZeaCxJn6mw==
X-Received: by 2002:a62:5101:0:b0:44c:5cc3:e088 with SMTP id f1-20020a625101000000b0044c5cc3e088mr19739203pfb.72.1633545850115;
        Wed, 06 Oct 2021 11:44:10 -0700 (PDT)
Received: from thinkpad ([117.202.189.72])
        by smtp.gmail.com with ESMTPSA id 11sm20828595pfl.41.2021.10.06.11.44.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Oct 2021 11:44:09 -0700 (PDT)
Date:   Thu, 7 Oct 2021 00:14:04 +0530
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     Robert Marko <robimarko@gmail.com>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Kathiravan T <kathirav@codeaurora.org>, agross@kernel.org,
        robh+dt@kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org,
        open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] arm64: dts: qcom: ipq8074: add SMEM support
Message-ID: <20211006184404.GD33862@thinkpad>
References: <20210902214708.1776690-1-robimarko@gmail.com>
 <YUf3aKn78+41Cb/G@builder.lan>
 <CAOX2RU5b46H7nqm6G4mHLSqEhGiWktwWjUKF5w10Ut+AdKea-A@mail.gmail.com>
 <632a7d28c23a8497d35ea009bfe89883@codeaurora.org>
 <CAOX2RU5+jeXiqz8oss8Sd-BWa059uAv5xu=7nx_YF4RYpG2S6w@mail.gmail.com>
 <YUurqDL/S15RziCQ@builder.lan>
 <20211006182419.GC33862@thinkpad>
 <CAOX2RU43D72yx1Kyb0jRMMOLgBd1OMscWLH-dEdp0P=L-5quHQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAOX2RU43D72yx1Kyb0jRMMOLgBd1OMscWLH-dEdp0P=L-5quHQ@mail.gmail.com>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, Oct 06, 2021 at 08:26:10PM +0200, Robert Marko wrote:
> On Wed, 6 Oct 2021 at 20:24, Manivannan Sadhasivam
> <manivannan.sadhasivam@linaro.org> wrote:
> >

[...]

> > Sorry, missed this earlier. I did face the probe deferral issue before and
> > submitted a small series for fixing that:
> >
> > https://lore.kernel.org/linux-mtd/20210302132757.225395-1-manivannan.sadhasivam@linaro.org/
> >
> > These 2 patches are in mainline now. Robert, can you make sure that you have
> > these 2 patches in your tree?
> 
> Hi Mani,
> Yes, I have those patches as I am running this on top of 5.15-rc4 currently.
> 

Hmm. So if both SMEM and NAND drivers are added to the probe deferral list then
the issue is likely not related to probe ordering.

Can you nail down the point where the board starts rebooting?

Thanks,
Mani

> Regards,
> Robert
> >
> > Thanks,
> > Mani
> >
> > > Thanks,
> > > Bjorn
