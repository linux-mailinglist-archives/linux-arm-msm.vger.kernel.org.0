Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A53C33E4901
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Aug 2021 17:40:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230502AbhHIPkb (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 9 Aug 2021 11:40:31 -0400
Received: from mail-io1-f49.google.com ([209.85.166.49]:42765 "EHLO
        mail-io1-f49.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230095AbhHIPkb (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 9 Aug 2021 11:40:31 -0400
Received: by mail-io1-f49.google.com with SMTP id h1so28030088iol.9;
        Mon, 09 Aug 2021 08:40:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:in-reply-to:references:subject:date
         :message-id;
        bh=As94hk4XEdH5kfCbYz6LcUTvcmBGi03P0gCwR26CciE=;
        b=YSue8cuN/i3TN4IxGFa8TYudSbC/TfAJxy5t3DQyk+2mDzqQe2U1J4zgeInFYC7SSF
         B4cxRbE3Y9yiqK7/BK3nILMWeQm2CYQCGLw+NFV5/vI8CylGqQKyKx2+ZKWEHEmWuCyo
         0TJ6fLqwzutLnmuomsRJj/ShaL2tHX1LYtZNsXGECHg1tb6cIk5DdZn/0/4H615IK5YH
         PZA7lO9XPAD3qe4UOcTBDFZH0dJsZg35+p5abXamCOWfnpcLqwaGefjHdBqEtRTvjoM1
         E7xxZ3EXlSTLYEy8u/oiTqogL1zCh5L3ZAVIbGnD1487M/206RB9Bc6Gv/rrkBfw0Uma
         5S+A==
X-Gm-Message-State: AOAM533TKiiy321SKdXdJy2EcDlUVN4QIs16Jq8CE8BohgbM4hDfJmhu
        AnA9Qvev8ROWX2X3LifY5w==
X-Google-Smtp-Source: ABdhPJwElvvFchy8n+O48fkEeMa07Kd4ZxR0GXYipP579UkeMGnPqKGkEc9DguQ5ddfmH74/SBXViA==
X-Received: by 2002:a5d:8990:: with SMTP id m16mr9628iol.170.1628523610558;
        Mon, 09 Aug 2021 08:40:10 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.248])
        by smtp.gmail.com with ESMTPSA id d9sm10370303ilu.9.2021.08.09.08.40.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Aug 2021 08:40:09 -0700 (PDT)
Received: (nullmailer pid 3895391 invoked by uid 1000);
        Mon, 09 Aug 2021 15:40:08 -0000
From:   Rob Herring <robh@kernel.org>
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     Thierry Reding <thierry.reding@gmail.com>,
        dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        Sam Ravnborg <sam@ravnborg.org>,
        Daniel Vetter <daniel@ffwll.ch>,
        David Airlie <airlied@linux.ie>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org
In-Reply-To: <20210808035053.58074-1-dmitry.baryshkov@linaro.org>
References: <20210808035053.58074-1-dmitry.baryshkov@linaro.org>
Subject: Re: [PATCH 1/2] dt-bindings: add bindings for the Sharp LS060T1SX01 panel
Date:   Mon, 09 Aug 2021 09:40:08 -0600
Message-Id: <1628523608.142555.3895390.nullmailer@robh.at.kernel.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Sun, 08 Aug 2021 06:50:52 +0300, Dmitry Baryshkov wrote:
> Add devicetree bindings for the Sharp LS060T1SX01 6.0" FullHD panel
> using NT35695 driver. This panel can be found i.e. in the Dragonboard
> Display Adapter bundle.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  .../display/panel/sharp,ls060t1sx01.yaml      | 51 +++++++++++++++++++
>  1 file changed, 51 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/panel/sharp,ls060t1sx01.yaml
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:

dtschema/dtc warnings/errors:
./Documentation/devicetree/bindings/display/panel/sharp,ls060t1sx01.yaml: $id: relative path/filename doesn't match actual path or filename
	expected: http://devicetree.org/schemas/display/panel/sharp,ls060t1sx01.yaml#
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/display/panel/sharp,ls060t1sx01.yaml: duplicate '$id' value 'http://devicetree.org/schemas/display/panel/sharp,ls043t1le01.yaml#'

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/patch/1514772

This check can fail if there are any dependencies. The base for a patch
series is generally the most recent rc1.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit.

