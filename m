Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 67CFC16686A
	for <lists+linux-arm-msm@lfdr.de>; Thu, 20 Feb 2020 21:35:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728967AbgBTUfM (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 20 Feb 2020 15:35:12 -0500
Received: from mail-oi1-f196.google.com ([209.85.167.196]:45048 "EHLO
        mail-oi1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728400AbgBTUfL (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 20 Feb 2020 15:35:11 -0500
Received: by mail-oi1-f196.google.com with SMTP id d62so28879700oia.11;
        Thu, 20 Feb 2020 12:35:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=dj2rW5WH1XuuP/JPuEpJptUF9hTbGtr1qjFfIR5yvb8=;
        b=a/4JLjgY/SWobmQX4TKwmiHuGGIrs/92IxMdk3X4eaTJJwQM0dI3aZ2nKNgng3Wiym
         HW1sY+c0qAAadC8EjdDaBcmhTzovB6N0674JoZX9r/0gONJrSAbA+2Z92qyib2m3vLB+
         pBRQEMHOtW5kenInzZhPw+JHBHoieBBtvXWnTb1hxUzmz9K63yrwK6S2eqLc/RN9Opju
         L38LOOd/f2BwCYDRarQLUzBbXbO7C59KSNF+SNvVPo7yOGo9b9NoqeJ1XFauZhUEusVL
         kzjLXylo3MvYNfjp8NnEuCRr82ULStQV3V5Z4FFMT75c64bOkYsfeABmH0lZW8abco+A
         sCUA==
X-Gm-Message-State: APjAAAX5WYgnfjBRBbJ928vuv6veHzRUhVOfq4lBQqjA8Qe1PAfCpgEt
        HqmC+QPeecWhn0Xd8vTOlg==
X-Google-Smtp-Source: APXvYqxwJ/2yGaYe0f1ffh3BnhSHPhuRw7WYXDEqylBf6OGb/cfcQC8kdGy9BeTH3mgWz4ApoOvUbg==
X-Received: by 2002:a05:6808:249:: with SMTP id m9mr3532186oie.5.1582230910787;
        Thu, 20 Feb 2020 12:35:10 -0800 (PST)
Received: from rob-hp-laptop (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id e5sm182426otk.74.2020.02.20.12.35.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Feb 2020 12:35:10 -0800 (PST)
Received: (nullmailer pid 15161 invoked by uid 1000);
        Thu, 20 Feb 2020 20:35:09 -0000
Date:   Thu, 20 Feb 2020 14:35:09 -0600
From:   Rob Herring <robh@kernel.org>
To:     Sharat Masetty <smasetty@codeaurora.org>
Cc:     freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        dianders@chromium.org, linux-arm-msm@vger.kernel.org,
        Sharat Masetty <smasetty@codeaurora.org>,
        linux-kernel@vger.kernel.org, bjorn.andersson@linaro.org,
        mka@chromium.org, dri-devel@freedesktop.org
Subject: Re: [PATCH] dt-bindings: arm-smmu: update the list of clocks
Message-ID: <20200220203509.GA14697@bogus>
References: <1582186342-3484-1-git-send-email-smasetty@codeaurora.org>
 <1582186342-3484-2-git-send-email-smasetty@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1582186342-3484-2-git-send-email-smasetty@codeaurora.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, 20 Feb 2020 13:42:22 +0530, Sharat Masetty wrote:
> This patch adds a clock definition needed for powering on the GPU TBUs
> and the GPU TCU.
> 
> Signed-off-by: Sharat Masetty <smasetty@codeaurora.org>
> ---
>  Documentation/devicetree/bindings/iommu/arm,smmu.yaml | 3 +++
>  1 file changed, 3 insertions(+)
> 

My bot found errors running 'make dt_binding_check' on your patch:

Documentation/devicetree/bindings/display/simple-framebuffer.example.dts:21.16-37.11: Warning (chosen_node_is_root): /example-0/chosen: chosen node must be at root node
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/iommu/arm,smmu.example.dt.yaml: iommu@d00000: clock-names: ['bus', 'iface'] is too short
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/iommu/arm,smmu.example.dt.yaml: iommu@d00000: clocks: [[4294967295, 123], [4294967295, 124]] is too short

See https://patchwork.ozlabs.org/patch/1241297
Please check and re-submit.
