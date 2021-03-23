Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6E2E1346D2D
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Mar 2021 23:34:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233908AbhCWWdp (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 23 Mar 2021 18:33:45 -0400
Received: from mail-il1-f171.google.com ([209.85.166.171]:33281 "EHLO
        mail-il1-f171.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234126AbhCWW37 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 23 Mar 2021 18:29:59 -0400
Received: by mail-il1-f171.google.com with SMTP id u10so19628216ilb.0;
        Tue, 23 Mar 2021 15:29:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=wCODdCR6oRu3u40S/wC2T3hBtUKy4Q9nyQKSqWlvMyQ=;
        b=a8hClFm4yj8Uvq+2qocJZYQZRPHYtHB6aIm7b81PhVtLU+zAEx0c0pMArRyDiN03x6
         mBGzD5RIYClvq03l3HgZAl8JOzm+XiCL613gXhDD92Xa+mNay2AMvCcmBZlfooQExNaj
         YPjt34r3XFs0z+/951ZlH96pjxehSZ1XIIBvirSAdOSTqNLDsrZ/nHQYQitYBSdZcsAi
         57qkqehUmN0ZkZvQXz/M8ilCvOhYqcKuQUVORh6Kp8qnc/69XFfDoTaP6XfvaGRQ/2GG
         w7ZYN/d8jbRI7O4pii/vgFN8mfQ/wvvAdldhL4QwVrVUwY7Ax6JRyocnrspOM5Serb1V
         f+KA==
X-Gm-Message-State: AOAM5313pj6ZDqPVXE86NpKHYLUnnQeyJwZQwS0tMuoh2sPKGsKGIF2L
        BxwGsn0f1eeSvN7niif9SA==
X-Google-Smtp-Source: ABdhPJzgVzUJHH8xeOtn9yXIWkiP8JxI5S1dOFjNSpIy5iA1J6YZYHYaP17+hJvQFMTDbpcg5rxmhw==
X-Received: by 2002:a92:c102:: with SMTP id p2mr304870ile.227.1616538599244;
        Tue, 23 Mar 2021 15:29:59 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.253])
        by smtp.gmail.com with ESMTPSA id z10sm115235ilm.19.2021.03.23.15.29.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Mar 2021 15:29:58 -0700 (PDT)
Received: (nullmailer pid 1461925 invoked by uid 1000);
        Tue, 23 Mar 2021 22:29:55 -0000
Date:   Tue, 23 Mar 2021 16:29:55 -0600
From:   Rob Herring <robh@kernel.org>
To:     Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc:     vigneshr@ti.com, linux-kernel@vger.kernel.org, richard@nod.at,
        miquel.raynal@bootlin.com, devicetree@vger.kernel.org,
        boris.brezillon@collabora.com, linux-arm-msm@vger.kernel.org,
        linux-mtd@lists.infradead.org, robh+dt@kernel.org,
        Daniele.Palmas@telit.com, bjorn.andersson@linaro.org
Subject: Re: [PATCH v8 2/3] dt-bindings: mtd: Add a property to declare
 secure regions in NAND chips
Message-ID: <20210323222955.GA1461867@robh.at.kernel.org>
References: <20210323073930.89754-1-manivannan.sadhasivam@linaro.org>
 <20210323073930.89754-3-manivannan.sadhasivam@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210323073930.89754-3-manivannan.sadhasivam@linaro.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, 23 Mar 2021 13:09:29 +0530, Manivannan Sadhasivam wrote:
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

Reviewed-by: Rob Herring <robh@kernel.org>
