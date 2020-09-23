Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6C259276195
	for <lists+linux-arm-msm@lfdr.de>; Wed, 23 Sep 2020 22:02:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726562AbgIWUCd (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 23 Sep 2020 16:02:33 -0400
Received: from mail.kernel.org ([198.145.29.99]:47670 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726381AbgIWUCd (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 23 Sep 2020 16:02:33 -0400
Received: from mail-oo1-f48.google.com (mail-oo1-f48.google.com [209.85.161.48])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 293B82376F;
        Wed, 23 Sep 2020 20:02:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1600891352;
        bh=Hfj5AJiotfbwQi0kMDqrpWXz9xdg2XtkK2YtPtockBI=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=CPA4TVx3vS+R9PSYZ9Rg/4PQOffM91B88SzaKWnMX5Z+YAxruNqYhgk+vsf5tEdIC
         6oKkIgfvpUbMfE5L1ns80Y2fRE+EAtRw5wvzRI9iUC2TWxyIheG92n7xazGiXS6bCP
         PipsE8pts773ENz+lGaKyitmINzT6D+W4CCPiRdw=
Received: by mail-oo1-f48.google.com with SMTP id r10so187118oor.5;
        Wed, 23 Sep 2020 13:02:32 -0700 (PDT)
X-Gm-Message-State: AOAM5310UVJH9e4vAj0t8WiTdpCV+yGpq51ci+68ebSQLWBX7dGdFFl7
        Tr8OfWtfkVMM+zcJNLBMCbG2HRCac77oUnaYKA==
X-Google-Smtp-Source: ABdhPJyo8orKX4m2ejKI3lDZOCiQVidclBviAUSxjSDNv9CpOD2NSnth0Z9GiZENKPHCTtwCRcB3aPJwDChQhgeOYXs=
X-Received: by 2002:a4a:d306:: with SMTP id g6mr948766oos.25.1600891351344;
 Wed, 23 Sep 2020 13:02:31 -0700 (PDT)
MIME-Version: 1.0
References: <20200916104135.25085-1-stephan@gerhold.net> <20200916104135.25085-6-stephan@gerhold.net>
 <20200923153548.GA789614@bogus> <20200923155018.GA87584@gerhold.net>
In-Reply-To: <20200923155018.GA87584@gerhold.net>
From:   Rob Herring <robh@kernel.org>
Date:   Wed, 23 Sep 2020 14:02:19 -0600
X-Gmail-Original-Message-ID: <CAL_Jsq+Z=g7GfuRqwpPAwKDWXrOnCEe4M_UjaeNPfUMSmKpBZQ@mail.gmail.com>
Message-ID: <CAL_Jsq+Z=g7GfuRqwpPAwKDWXrOnCEe4M_UjaeNPfUMSmKpBZQ@mail.gmail.com>
Subject: Re: [PATCH 05/10] dt-bindings: remoteproc: qcom,q6v5: Deprecate
 regulators for PDs
To:     Stephan Gerhold <stephan@gerhold.net>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Ohad Ben-Cohen <ohad@wizery.com>,
        Rajendra Nayak <rnayak@codeaurora.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        devicetree@vger.kernel.org,
        "open list:REMOTE PROCESSOR (REMOTEPROC) SUBSYSTEM" 
        <linux-remoteproc@vger.kernel.org>,
        ~postmarketos/upstreaming@lists.sr.ht
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, Sep 23, 2020 at 9:51 AM Stephan Gerhold <stephan@gerhold.net> wrote:
>
> On Wed, Sep 23, 2020 at 09:35:48AM -0600, Rob Herring wrote:
> > On Wed, Sep 16, 2020 at 12:41:30PM +0200, Stephan Gerhold wrote:
> > > Newer platforms vote for necessary power domains through the power
> > > domain subsystem. For historical reasons older platforms like MSM8916
> > > or MSM8974 still control these as regulators.
> >
> > Do you plan to change these platforms? If not then I wouldn't really
> > call this deprecated.
> >
>
> Yes, MSM8916 is changed as part of this patch series.
>
> It should also be done for MSM8974, but because I don't have any test
> devices with it I'm not able to do it myself.
>
> Actually the old binding likely works only because of other side effects
> (other drivers voting for the same resources), so I personally I would
> definitely call it deprecated.

Okay.

Reviewed-by: Rob Herring <robh@kernel.org>
