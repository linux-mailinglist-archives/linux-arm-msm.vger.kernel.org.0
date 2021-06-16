Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D8C263A8D38
	for <lists+linux-arm-msm@lfdr.de>; Wed, 16 Jun 2021 02:08:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231691AbhFPAKq (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 15 Jun 2021 20:10:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57530 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231307AbhFPAKq (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 15 Jun 2021 20:10:46 -0400
Received: from mail-oi1-x233.google.com (mail-oi1-x233.google.com [IPv6:2607:f8b0:4864:20::233])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 30F9EC06175F
        for <linux-arm-msm@vger.kernel.org>; Tue, 15 Jun 2021 17:08:41 -0700 (PDT)
Received: by mail-oi1-x233.google.com with SMTP id c13so483434oib.13
        for <linux-arm-msm@vger.kernel.org>; Tue, 15 Jun 2021 17:08:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=qCmyEQVqii6LsyuSPV+QSKBL2P0pCYgAFr/Ibzjgluw=;
        b=IMEhVAfO1aDyFd07H+YfV/YIDMH7VDz8G6IhfkgxvLbPEPtIGMoBmPDGZFzt2E2PRD
         T+V8PIwDsUUlu6m8w1v02VT/9yCRR1Ll5POzI9ow0w/lj67tU+MeqHkGogIaZ63OH9/P
         PD9VkyGBzZ4tdDSLqQLhXUAr61MMfkAHVmQWV3i6ym0TuGX2u+bamT5QtCTNwXe3pUI4
         cYGL+0HgRhDmvWsw/+JaAOet7sxZeRH/0G5smCEhnM10id/AUz/hIjLR7XZv/+tDaHVs
         Gl8g2UJg8CO4HJc+iydXoI84eYtLaln49Sr/EcwiONaYpDP8qddAE1HBG8QTDjR2qQ78
         pRzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=qCmyEQVqii6LsyuSPV+QSKBL2P0pCYgAFr/Ibzjgluw=;
        b=p1+SfxEFLyVNWESP3GuV7mUmJuQOpnNvdCFhgikaFHKcMywhpe/padqEv+DC5B8n4e
         BNjdEntSNOwAlW9zhbmpSC5OftWKSulMrpuOcsIMCWKOS/6+k/YE3o9VzcfUgxIA/SjO
         pdktyhdfyUdCZUGzUl5aIbEkbLEEaQaEhVIuJKVMEiZD0ZsdiyNEuIOfwxObaZ9oMF3Q
         Foic9mqxnjvUGQM6APLTvClGFw8tjw6qAtyB+SUeMW9t/Az51E2GgOxMInkVKZoxOppE
         3iNEaDHy32x4D4pI5zwLKL7xISyb9mnEGIrBtFUq2XcYbtbV2NQJCGwEmLgdrLRj7hBA
         uHjQ==
X-Gm-Message-State: AOAM530sxng4TQ9izp3Mka7egNDncIGgMaE7z5F27senQGF7pB5B+1Vl
        z3GXw6FnBW55tUsNE8fcAbUE8A==
X-Google-Smtp-Source: ABdhPJy0fdhDuyBoO6v1WeQRUNwSbxlbhglg+X31disSsmVH0VXlYLbR2W0TGiw/QG0R+gKqyxay5g==
X-Received: by 2002:aca:530f:: with SMTP id h15mr1175785oib.128.1623802120548;
        Tue, 15 Jun 2021 17:08:40 -0700 (PDT)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id b22sm108948oov.31.2021.06.15.17.08.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Jun 2021 17:08:40 -0700 (PDT)
Date:   Tue, 15 Jun 2021 19:08:37 -0500
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     sbhanu@codeaurora.org
Cc:     adrian.hunter@intel.com, ulf.hansson@linaro.org,
        robh+dt@kernel.org, asutoshd@codeaurora.org,
        stummala@codeaurora.org, vbadigan@codeaurora.org,
        rampraka@codeaurora.org, sayalil@codeaurora.org,
        sartgarg@codeaurora.org, rnayak@codeaurora.org,
        saiprakash.ranjan@codeaurora.org, sibis@codeaurora.org,
        okukatla@codeaurora.org, djakov@kernel.org, cang@codeaurora.org,
        pragalla@codeaurora.org, nitirawa@codeaurora.org,
        linux-mmc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        agross@kernel.org
Subject: Re: [PATCH V3] arm64: dts: qcom: sc7280: Add nodes for eMMC and SD
 card
Message-ID: <YMlBBeT1VK5snsM7@builder.lan>
References: <1623252028-20467-1-git-send-email-sbhanu@codeaurora.org>
 <YMLbsZUojmYjM/j0@builder.lan>
 <64166450ddc927d10ad4b37dadf218b6@codeaurora.org>
 <0ce40daf1f8146f47b1877fb2c83cd95@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0ce40daf1f8146f47b1877fb2c83cd95@codeaurora.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue 15 Jun 03:56 CDT 2021, sbhanu@codeaurora.org wrote:

> On 2021-06-14 17:00, sbhanu@codeaurora.org wrote:
> > On 2021-06-11 09:12, Bjorn Andersson wrote:
> > > On Wed 09 Jun 10:20 CDT 2021, Shaik Sajida Bhanu wrote:
[..]
> > > > diff --git a/arch/arm64/boot/dts/qcom/sc7280.dtsi
[..]
> > > > +		sdhc_1: sdhci@7c4000 {
[..]
> > > > +			sdhc1_opp_table: sdhc1-opp-table {
> > > 
> > > No need for "sdhc1-" in the node name.
> > ok
> Hi,
> 
> For Sd card also we have opp-table info so if we remove "sdhc1-" here and
> "sdhc2-" in Sd crad opp table we may have dublicate nodes so,
> it is better to keep sdhc1 and sdhc2 in node numbers right.
> 

Are you saying that /soc/sdhci@7c4000/opp-table needs to have a unique
name to not collide with /soc/sdhci@8804000/opp-table?

Regards,
Bjorn
