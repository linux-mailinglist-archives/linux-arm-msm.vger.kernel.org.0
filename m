Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 855DF17AE82
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Mar 2020 19:51:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726222AbgCESvi (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 5 Mar 2020 13:51:38 -0500
Received: from mail-pf1-f194.google.com ([209.85.210.194]:43257 "EHLO
        mail-pf1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725946AbgCESvf (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 5 Mar 2020 13:51:35 -0500
Received: by mail-pf1-f194.google.com with SMTP id c144so3186073pfb.10
        for <linux-arm-msm@vger.kernel.org>; Thu, 05 Mar 2020 10:51:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=b2SYpooN63pazq0FfnqZHc+uxwAjM4uCksmrGzVts2w=;
        b=T6R/TbBMZV7uHQBepmxCCgBZMqhYWNOwyyeTy6uM9j1D7K8dLSXPY8913e8XdQFyyg
         E6BBrRRQnHNtFaJCY1Nq+VriqP8MXlCgyeUSLUrHSh0mDaOmKtQgks/c4kQVmyH+B3e/
         /okMrvgeUcd/pXFsCkPBD9L9oB07xFAkt2LE4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=b2SYpooN63pazq0FfnqZHc+uxwAjM4uCksmrGzVts2w=;
        b=hh0syj41KRr+BwirFn7camOp77IA3dyy+dXbCpAkFyxjSv9kNgxpMAkYFqWOXbYnpI
         lUbdfAj7CpRrlk5441flTRJHZd8oJDqWUd4V77vXHTCpCs725t5JJ8c28iYUKO2jO0mA
         PQ1uvcPILr5LMtoY0LamM8513uVwa77/0ZtLBQyJdnVMy3qH6HCqnkjTDszLEyoDD7zs
         AKxXLAwIth+VNRvUkIrQR1T7URYWClAwvOx9VlMVNUp6jUfr1u1mTZLND3O++et35ecC
         M9Wf/R2KhBB7dW5okoHuImtLV3ODSqWp1ubeBLM8aBvn0Jn4oKV5umTiICO+1y5KYR8F
         42wA==
X-Gm-Message-State: ANhLgQ2MniNNTmBjAkVWc3860DHSQI1i2V4Lx+giSfBN0ta6fBZucA2a
        NE2Hduf8QyuyIw6O8gXAcb9vzQ==
X-Google-Smtp-Source: ADFU+vuQNeWvfy1Ogmc1Uka7w7eUI2r4KaKy912PspK9k/vyYD+DBZjUL7iC552BrrUD9Cmofq3a7g==
X-Received: by 2002:a63:de4c:: with SMTP id y12mr8908651pgi.107.1583434294313;
        Thu, 05 Mar 2020 10:51:34 -0800 (PST)
Received: from localhost ([2620:15c:202:1:4fff:7a6b:a335:8fde])
        by smtp.gmail.com with ESMTPSA id f81sm29905073pfa.44.2020.03.05.10.51.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Mar 2020 10:51:33 -0800 (PST)
Date:   Thu, 5 Mar 2020 10:51:32 -0800
From:   Matthias Kaehlcke <mka@chromium.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Kishon Vijay Abraham I <kishon@ti.com>,
        Sandeep Maheswaram <sanm@codeaurora.org>,
        Andy Gross <agross@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Stephen Boyd <swboyd@chromium.org>,
        Doug Anderson <dianders@chromium.org>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: Re: [PATCH v4 0/8] Add QUSB2 PHY support for SC7180
Message-ID: <20200305185132.GT24720@google.com>
References: <1580305919-30946-1-git-send-email-sanm@codeaurora.org>
 <20200203185649.GK3948@builder>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20200203185649.GK3948@builder>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, Feb 03, 2020 at 10:56:49AM -0800, Bjorn Andersson wrote:
> On Wed 29 Jan 05:51 PST 2020, Sandeep Maheswaram wrote:
> 
> Kishon, afaict this is all reviewed, let me know when you're taking the
> phy pieces and I'll pick up the dts changes.

The series has a few minor comments. Sandeep, could you respin the
series so that it can be landed?

Thanks

Matthias

> > Converting dt binding to yaml.
> > Adding compatible for SC7180 in dt bindings.
> > Added generic QUSB2 V2 PHY support and using the same SC7180 and SDM845.
> > 
> > Changes in v4:
> > *Addressed Rob Herrings comments in dt bindings.
> > *Added new structure for all the overriding tuning params.
> > *Removed the sc7180 and sdm845 compatible from driver and added qusb2 v2 phy. 
> > *Added the qusb2 v2 phy compatible in device tree for sc7180 and sdm845. 
> > 
> > Changes in v3:
> > *Using the generic phy cfg table for QUSB2 V2 phy.
> > *Added support for overriding tuning parameters in QUSB2 V2 PHY
> > from device tree.
> > 
> > Changes in v2:
> > Sorted the compatible in driver.
> > Converted dt binding to yaml.
> > Added compatible in yaml.
> > 
> > Sandeep Maheswaram (8):
> >   dt-bindings: phy: qcom,qusb2: Convert QUSB2 phy bindings to yaml
> >   dt-bindings: phy: qcom,qusb2: Add compatibles for QUSB2 V2 phy and
> >     SC7180
> >   phy: qcom-qusb2: Add generic QUSB2 V2 PHY support
> >   dt-bindings: phy: qcom-qusb2: Add support for overriding Phy tuning
> >     parameters
> >   phy: qcom-qusb2: Add support for overriding tuning parameters in QUSB2
> >     V2 PHY
> >   arm64: dts: qcom: sc7180: Add generic QUSB2 V2 Phy compatible
> >   arm64: dts: qcom: sdm845: Add generic QUSB2 V2 Phy compatible
> >   arm64: dts: qcom: sc7180: Update QUSB2 V2 Phy params for SC7180 IDP
> >     device
> > 
> >  .../devicetree/bindings/phy/qcom,qusb2-phy.yaml    | 182 +++++++++++++++++++++
> >  .../devicetree/bindings/phy/qcom-qusb2-phy.txt     |  68 --------
> >  arch/arm64/boot/dts/qcom/sc7180-idp.dts            |   6 +-
> >  arch/arm64/boot/dts/qcom/sc7180.dtsi               |   2 +-
> >  arch/arm64/boot/dts/qcom/sdm845.dtsi               |   4 +-
> >  drivers/phy/qualcomm/phy-qcom-qusb2.c              | 143 +++++++++++-----
> >  6 files changed, 291 insertions(+), 114 deletions(-)
> >  create mode 100644 Documentation/devicetree/bindings/phy/qcom,qusb2-phy.yaml
> >  delete mode 100644 Documentation/devicetree/bindings/phy/qcom-qusb2-phy.txt
> > 
> > -- 
> > QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
> > of Code Aurora Forum, hosted by The Linux Foundation
> > 
