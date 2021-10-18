Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D72A5431D9D
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 Oct 2021 15:52:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232414AbhJRNwy (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 18 Oct 2021 09:52:54 -0400
Received: from mail-ot1-f44.google.com ([209.85.210.44]:44786 "EHLO
        mail-ot1-f44.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234164AbhJRNug (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 18 Oct 2021 09:50:36 -0400
Received: by mail-ot1-f44.google.com with SMTP id d21-20020a9d4f15000000b0054e677e0ac5so2919728otl.11;
        Mon, 18 Oct 2021 06:48:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=P9P7R1XNzEWBUr0hzeiahpDSW/aXqZDcmDtXm87uoN4=;
        b=hp0RVuDBd5E4uwJZVsdAYhnut85lKXekRCi+1Y76vBVWW7ploqgPWt/+8aR9d+b6k4
         DIjVukRsf0WSWUZJv338keLfk+x/dByKqS4mJc48bXStgU6vCRqoV02206xJPswodWFw
         RUrBWWtOxLvFsRouiqzGk4Q5C2jrrrcEi5p0zpgziD7rTpGxSdKQlRUPIGMFCS4Q3gmg
         OXOW+hB2+5jChRYH864bR2+CVl8FdTNeaSOiaxL5b2MG+YxhZweKGHVVOjGZJXGxs3q8
         +HN8kNxgkDz5DXu7qzloge5Eu8+EdancSZr1EQV5fmxd7Y0fsCLnOmDxzAIw2rybFZjg
         qOFQ==
X-Gm-Message-State: AOAM530Tvs8z2B3ANZ38DMHspU5hFwyjV3/VlQk5lMywnRE5dzo4YmNs
        /t6D0oMWdMMh1sFFKJsxKrX6zmLjWQ==
X-Google-Smtp-Source: ABdhPJxrOvcBDwbkAPoOwt5BNMvnFSy5s+melOXyqckSyfS8b8a5yyiBvF2I+Uf9OjhpGATCsxYEVQ==
X-Received: by 2002:a9d:6346:: with SMTP id y6mr6554691otk.154.1634564904980;
        Mon, 18 Oct 2021 06:48:24 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net. [66.90.148.213])
        by smtp.gmail.com with ESMTPSA id z8sm2439731oof.47.2021.10.18.06.48.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Oct 2021 06:48:24 -0700 (PDT)
Received: (nullmailer pid 2251980 invoked by uid 1000);
        Mon, 18 Oct 2021 13:48:23 -0000
Date:   Mon, 18 Oct 2021 08:48:23 -0500
From:   Rob Herring <robh@kernel.org>
To:     David Heidelberg <david@ixit.cz>
Cc:     Daniel Vetter <daniel@ffwll.ch>,
        ~postmarketos/upstreaming@lists.sr.ht, Sean Paul <sean@poorly.run>,
        ~okias/devicetree@lists.sr.ht, linux-arm-msm@vger.kernel.org,
        Rob Herring <robh+dt@kernel.org>,
        dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Rob Clark <robdclark@gmail.com>,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        David Airlie <airlied@linux.ie>
Subject: Re: [PATCH v6] dt-bindings: drm/msm/gpu: convert to YAML
Message-ID: <YW17J03XTvJgfBfj@robh.at.kernel.org>
References: <20211017144350.70295-1-david@ixit.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211017144350.70295-1-david@ixit.cz>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Sun, 17 Oct 2021 16:43:50 +0200, David Heidelberg wrote:
> Conversion of text binding for Adreno GPU to the YAML format.
> 
> Signed-off-by: David Heidelberg <david@ixit.cz>
> ---
> v2:
>   - added compatbile description from Rob Clark
>   - dropped reg description
>   - reg numbers increased to 3 (since we also have uncommon cx_dbgc)
>   - specified interconnect-names items range
>   - defined zap-shader as an object and added it's properties
>   - enforce 0 clocks for Andreno >= 6xx since it's defined in GMU node
> 
> v3:
>  - fix patterns (add backslash before dot)
>  - add additional clocks
>  - adreno@ -> gpu@
>  - add few const and change enum to anyOf
>  - added clock & clock-names placeholder in non-conditional part
>  (description)
> 
> v4:
>  - clock & clock-names - true,false instead maxItems
>  - impl. #stream-id-cells, nvmem-cell-names, nvmem-cells
>  - dropped requirement on firmware-name in zap_shader
> 
> v5:
>  - maxOtems -> maxItems typo fix
> 
> v6:
>  - enum -> const to fix ordering
>  - opp-table is object
>  - spacing
>  - drop undocumented and unused #stream-id-cells
> 
>  .../devicetree/bindings/display/msm/gpu.txt   | 157 ----------
>  .../devicetree/bindings/display/msm/gpu.yaml  | 288 ++++++++++++++++++
>  2 files changed, 288 insertions(+), 157 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/display/msm/gpu.txt
>  create mode 100644 Documentation/devicetree/bindings/display/msm/gpu.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>
