Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7BB8E355939
	for <lists+linux-arm-msm@lfdr.de>; Tue,  6 Apr 2021 18:31:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244002AbhDFQcE (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 6 Apr 2021 12:32:04 -0400
Received: from mail-oi1-f179.google.com ([209.85.167.179]:46841 "EHLO
        mail-oi1-f179.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243985AbhDFQcD (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 6 Apr 2021 12:32:03 -0400
Received: by mail-oi1-f179.google.com with SMTP id m13so15701784oiw.13;
        Tue, 06 Apr 2021 09:31:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=YP3e4a3p21hXudocTBXWvAjnARys/nIu9ypDgjHtU/0=;
        b=pfzYdy24paxOMB60LUD043jbJFWCPaJ6/DxofXYawGx1Be2kbNHX72n4yPlMK9RvNo
         RUDN4RpWmsJYsC2Tzjckr9evaQtka2vOGCXH5ZH3WVJEaNo8xG3Lo//sDsO4lVpPFq/v
         gJv9ZtVqM1VC6zesH20T1og2gfpiTrxNS6F92AzcJbXyOS3vnyJn99CPpQ7KlW6ZmKhO
         +Zdibxt72YggyNHnwI29xfkslUCsVILd4cVvaztXtigUnEUe0pH4+2nFNHllxvmJS8o/
         zSLpygXPkiHf77zIUvUtMAAGLot9P67wDvs6P5E3Vq7FdAaTihicDL8qHp41K3e0eXQW
         nrqw==
X-Gm-Message-State: AOAM531GopoldhQVjNM8LJqT1FM8Ww5NCuoQU1aeVswGd3zMVziRn425
        r3HpwjM+Tph9vc616T90uQ==
X-Google-Smtp-Source: ABdhPJwO1ar3Q3AELO4z6vtDhDYzr71jD2j5comjLfYe2J0Q90uxLsBEobt+OhPckaWtee8I7biRzg==
X-Received: by 2002:aca:180c:: with SMTP id h12mr4132885oih.109.1617726714839;
        Tue, 06 Apr 2021 09:31:54 -0700 (PDT)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id 3sm4276319ood.46.2021.04.06.09.31.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Apr 2021 09:31:54 -0700 (PDT)
Received: (nullmailer pid 1920001 invoked by uid 1000);
        Tue, 06 Apr 2021 16:31:52 -0000
Date:   Tue, 6 Apr 2021 11:31:52 -0500
From:   Rob Herring <robh@kernel.org>
To:     Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc:     Daniele.Palmas@telit.com, robh+dt@kernel.org,
        linux-arm-msm@vger.kernel.org, bjorn.andersson@linaro.org,
        boris.brezillon@collabora.com, devicetree@vger.kernel.org,
        vigneshr@ti.com, linux-mtd@lists.infradead.org,
        miquel.raynal@bootlin.com, linux-kernel@vger.kernel.org,
        richard@nod.at
Subject: Re: [PATCH v9 2/4] dt-bindings: mtd: Add a property to declare
 secure regions in NAND chips
Message-ID: <20210406163152.GA1919684@robh.at.kernel.org>
References: <20210401151508.143075-1-manivannan.sadhasivam@linaro.org>
 <20210401151508.143075-3-manivannan.sadhasivam@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210401151508.143075-3-manivannan.sadhasivam@linaro.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, 01 Apr 2021 20:45:06 +0530, Manivannan Sadhasivam wrote:
> On a typical end product, a vendor may choose to secure some regions in
> the NAND memory which are supposed to stay intact between FW upgrades.
> The access to those regions will be blocked by a secure element like
> Trustzone. So the normal world software like Linux kernel should not
> touch these regions (including reading).
> 
> So let's add a property for declaring such secure regions so that the
> drivers can skip touching them.
> 
> Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> ---
>  Documentation/devicetree/bindings/mtd/nand-controller.yaml | 7 +++++++
>  1 file changed, 7 insertions(+)
> 


Please add Acked-by/Reviewed-by tags when posting new versions. However,
there's no need to repost patches *only* to add the tags. The upstream
maintainer will do that for acks received on the version they apply.

If a tag was not added on purpose, please state why and what changed.

