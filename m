Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 10B722E7897
	for <lists+linux-arm-msm@lfdr.de>; Wed, 30 Dec 2020 13:39:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726681AbgL3MjF (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 30 Dec 2020 07:39:05 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36316 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726671AbgL3MjE (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 30 Dec 2020 07:39:04 -0500
Received: from mail-oi1-x22e.google.com (mail-oi1-x22e.google.com [IPv6:2607:f8b0:4864:20::22e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6795DC06179B
        for <linux-arm-msm@vger.kernel.org>; Wed, 30 Dec 2020 04:38:24 -0800 (PST)
Received: by mail-oi1-x22e.google.com with SMTP id w124so18550162oia.6
        for <linux-arm-msm@vger.kernel.org>; Wed, 30 Dec 2020 04:38:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=R9jIPa2I4bCuU7O494aqcFK9tSSf4TjrqtBdwe9PpRQ=;
        b=DmGaPO7zO2vhbitD4Cx7vxhmG+nZcYAuTP49bRLEFsX2xD0BdbbeJOKpBdU3W/blXm
         LjqvDxGfJpu1s25+QchduKu9jl8d3V4daP//ZcVg1hhclIK0ScLAR8NqV0325Cp2SO1i
         cl3wtaHpK5d2DiOJK5/sgmryyI5fToacD+oKRPfqzuR1vROIwdFLB7uf+t7WDqRkcB9e
         uRple4hkGFuJD5Hqrz3bhyVUqluaR1xcSR18mDGHwrMgytT0N9lluxe/xonixVmtL/jL
         SbraXod6FwPFkln38BVFs564cwhVjbsg6e+aBD9QyJYhspsK2THmErPw01eV4VPMN7O3
         ysuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=R9jIPa2I4bCuU7O494aqcFK9tSSf4TjrqtBdwe9PpRQ=;
        b=VByXEKy8r1t9h/rJyjJG/Anu6XP+ugal7h/wW/tJ8jJj4KmD2njaT85XxSiUgOsTvM
         r8nsmE79cVwLsoRyD0B3RsntG8UT7rVINrwR2t9gdmvacNp9sg0R3KT722pop+oTJXYY
         2wqqSGpLw3I/KEl7+uLLHu3QgsVyS0iqqEq7DNNmRWKcKjDR8o3Z1CvvMBOv+htEdJjx
         moVSfYeZHQMQS1fKVoSxvPGEgKq2CTiSp74d4o7nkDX6D0q69QI1YfEIbUVBuEwIR3Nl
         2Df/Abqlyim/AWXtm5sXYGXzDb+JpoEAvobPrNkn3bHxL+Jc83gieb0JZXkc7QMduDwL
         QX8Q==
X-Gm-Message-State: AOAM530rNA6UOqDopKh7i0qFs/uMXGIpPZHzaf+QZTFyLan6JEri2UQM
        HKjeApu1X3WA6fmmw/vyBB3fTtgLADeJhna70/tN/Q==
X-Google-Smtp-Source: ABdhPJx3o1Fg6Uz1Br6MK6JB7gTuc+iFC5OY86vXO+enbv8MnoJGCer/aDsqKPVfVFH5XIz9kV4DtcO04p1PoIqNDWg=
X-Received: by 2002:aca:b145:: with SMTP id a66mr5176334oif.92.1609331903737;
 Wed, 30 Dec 2020 04:38:23 -0800 (PST)
MIME-Version: 1.0
References: <20201230115408.492565-1-dmitry.baryshkov@linaro.org> <20201230123542.GA5679@thinkpad>
In-Reply-To: <20201230123542.GA5679@thinkpad>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date:   Wed, 30 Dec 2020 15:38:12 +0300
Message-ID: <CAA8EJppWi7POSXsHnBJ__TGDBQezU1YHcvSKk9=7wpoAfREh4Q@mail.gmail.com>
Subject: Re: [PATCH v2 0/2] PCI: qcom: fixup PCIe support on sm8250
To:     Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
        "open list:DRM DRIVER FOR MSM ADRENO GPU" 
        <linux-arm-msm@vger.kernel.org>, linux-pci@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Mani,

On Wed, 30 Dec 2020 at 15:35, Manivannan Sadhasivam
<manivannan.sadhasivam@linaro.org> wrote:
>
> On Wed, Dec 30, 2020 at 02:54:06PM +0300, Dmitry Baryshkov wrote:
> > SM8250 SoC requires another clock to be up to power up the translation
> > unit. Add necessary bindings and driver support.
> >
>
> So what is the exact issue you're facing?

IOMMU timeouts for PCIe0 device (WiFi)

-- 
With best wishes
Dmitry
