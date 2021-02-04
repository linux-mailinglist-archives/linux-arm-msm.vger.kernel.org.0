Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9207030F5D5
	for <lists+linux-arm-msm@lfdr.de>; Thu,  4 Feb 2021 16:09:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237152AbhBDPHz (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 4 Feb 2021 10:07:55 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33946 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237130AbhBDPHI (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 4 Feb 2021 10:07:08 -0500
Received: from mail-qv1-xf2b.google.com (mail-qv1-xf2b.google.com [IPv6:2607:f8b0:4864:20::f2b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A5649C061788
        for <linux-arm-msm@vger.kernel.org>; Thu,  4 Feb 2021 07:06:28 -0800 (PST)
Received: by mail-qv1-xf2b.google.com with SMTP id ew18so1843304qvb.4
        for <linux-arm-msm@vger.kernel.org>; Thu, 04 Feb 2021 07:06:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=LFbwFaTMPKHadriK/BpIPtRIBqmNI/eMhQjTkmh9eEo=;
        b=wy2NLH1ZxuF5t4/LRsF6R3dRYHexjM/pQomx51Lhf0vFNZi915fJmK+KylJxE6mETt
         DpqLgpZ//Shkd1TQrSgHf0Y8QJKTOLCOWHKjsd+Holdq50ZPLbhALtIjqecMRlkQ1nHR
         7tOWMSCWxLIKNoLrpKIGIswH8lbnng4CXULMgpFyfQBQG001Xpv3pZPX22ai040P7+nK
         Is3P0YBEpy28/YpM+itFPDB848jUSkKZGG242dPl8LaZKEDWpTjrB+7bhdvq8JP25GLY
         ybTHKNSW9QVm93hvafXxYzxNaXiwzn7Srpm2XXN5Tpt1RR7VHj4BMoQedVYljsLFuT7o
         sKXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=LFbwFaTMPKHadriK/BpIPtRIBqmNI/eMhQjTkmh9eEo=;
        b=YVDQcI+P42mgxDUCmIW50IfnlvPUrHkrI+1/qPmO4oKmE16XnVxbPD/2T1tNP8Bf5d
         vNS9vstt9byn3oa5iLWvfapSrvc2xos8Ek9qZ/G2O89Ap2SJZyXdrjrmf/Wg5Vs+Eynb
         dHlGG2wb2GIeOIo92svnuUFYlQ2io2l09DNz2JVRUYx6ZTRaYb3QO1CL1vNJOFHR14Ih
         7s0MLWCkt57ia7CQCHXh8ViE6pwYNmybmps7oQK/46N6h2QwG65qcnMb5O2hvxEYhYsj
         l/zN4mQ8CJwrCUn2kPw1Mm9WQ6DqXpRngGtyJDGSx9PhNxtOebWSssNL4akksrjGHMwM
         zcow==
X-Gm-Message-State: AOAM532osjkfc7QJ4J/gm0mXVf/z7hWylz/SPEmZXP26KuyB++C3LXJ6
        tIKFgp8zOTKI2JqxMR/55Dq5gInho2KTYbIZExYdPg==
X-Google-Smtp-Source: ABdhPJxdGaXWetnPk2IYHVvnVzKo4th0undMW1WSbXMLT10MLtsQMQQCswIadudiQkTdk+Auslt1nL9OsmQovtF7LMA=
X-Received: by 2002:a0c:cb11:: with SMTP id o17mr7932307qvk.23.1612451187866;
 Thu, 04 Feb 2021 07:06:27 -0800 (PST)
MIME-Version: 1.0
References: <20210117013114.441973-1-dmitry.baryshkov@linaro.org> <64f62684-523d-cbd5-708b-4c06e7d03954@linaro.org>
In-Reply-To: <64f62684-523d-cbd5-708b-4c06e7d03954@linaro.org>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date:   Thu, 4 Feb 2021 18:06:16 +0300
Message-ID: <CAA8EJpqxtqxy5Z8KGt_wQGLvXKWhmLXi845VQ+w2_ps71fKVhg@mail.gmail.com>
Subject: Re: [PATCH v5 0/2] PCI: qcom: fix PCIe support on sm8250
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>
Cc:     "open list:DRM DRIVER FOR MSM ADRENO GPU" 
        <linux-arm-msm@vger.kernel.org>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        PCI <linux-pci@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, 26 Jan 2021 at 23:11, Dmitry Baryshkov
<dmitry.baryshkov@linaro.org> wrote:
>
> Rob, Lorenzo, gracious poke for this patchset.

Dear colleagues, another gracious ping. I'm not insisting on getting
this into 5.12 (it would be good though), but I'd kindly ask for these
patches to be reviewed/acked.

> On 17/01/2021 04:31, Dmitry Baryshkov wrote:
> > SM8250 platform requires additional clock to be enabled for PCIe to
> > function. In case it is disabled, PCIe access will result in IOMMU
> > timeouts. Add device tree binding and driver support for this clock.
> >
> > Canges since v4:
> >   - Remove QCOM_PCIE_2_7_0_MAX_CLOCKS define and has_sf_tbu variable.
> >
> > Changes since v3:
> >   - Merge clock handling back into qcom_pcie_get_resources_2_7_0().
> >     Define res->num_clks to the amount of clocks used for this particular
> >     platform.
> >
> > Changes since v2:
> >   - Split this clock handling from qcom_pcie_get_resources_2_7_0()
> >   - Change comment to point that the clock is required rather than
> >     optional
> >
> > Changes since v1:
> >   - Added Fixes: tags, as respective patches have hit the upstream Linux
> >     tree.
> >
> >
>
>
> --
> With best wishes
> Dmitry



-- 
With best wishes
Dmitry
