Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0E00635E34F
	for <lists+linux-arm-msm@lfdr.de>; Tue, 13 Apr 2021 17:58:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238461AbhDMP7Q (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 13 Apr 2021 11:59:16 -0400
Received: from mail-ot1-f53.google.com ([209.85.210.53]:35458 "EHLO
        mail-ot1-f53.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230329AbhDMP7Q (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 13 Apr 2021 11:59:16 -0400
Received: by mail-ot1-f53.google.com with SMTP id v24-20020a9d69d80000b02901b9aec33371so16568909oto.2;
        Tue, 13 Apr 2021 08:58:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=NCg6juRjawDZurZPMiPe5DGO2tjGv8Z93z5kbvheWfg=;
        b=KXY9BnVgmGLTvk0WKM8lSacuVGV/P3n/JgpO8VBHmncuAREYpZNowOkWkWK68ULjwm
         ECvC7LdFwjLHGlmWNqVA3kIeqXs0q0dfTEULjxQoK5u2B3u2U6rd4VVf6gLCN31FN3VX
         U9B18XfQEA4NJ1lW1XBj1HLdVpSYfSw5klS/iU5vMEoNoRsTqO0JhqNPbdgJc1WjAGyS
         QuQMmYf6E5S4L4jtUnZ1mRBybv7K53BnhGfKWUG94Q5YG5pGo1FTdycK72sAHVoUCuT4
         YD86KVPMSDDKw3icVn3dTWjYC2jkbHVz5bPezL5BXXyOTYrXqEPcFR34tOZYB25iqjdD
         VMhw==
X-Gm-Message-State: AOAM531eP7ZlJ0enXzqBVwq0MllW0VcJvykoubkAH5lMB6uaHMSo5uVS
        WeuqORAxa+FfDFlpNu75JQ==
X-Google-Smtp-Source: ABdhPJxXk1vqV70OIkwKIF3fe5RrxTUT5VOgZ5gL/xcK6pbcL0ELeve5t75+q4h9TS9M6BSfNNVhHA==
X-Received: by 2002:a9d:7699:: with SMTP id j25mr28921386otl.177.1618329536595;
        Tue, 13 Apr 2021 08:58:56 -0700 (PDT)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id w2sm2923588oov.23.2021.04.13.08.58.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Apr 2021 08:58:55 -0700 (PDT)
Received: (nullmailer pid 1747120 invoked by uid 1000);
        Tue, 13 Apr 2021 15:58:54 -0000
Date:   Tue, 13 Apr 2021 10:58:54 -0500
From:   Rob Herring <robh@kernel.org>
To:     Guru Das Srinagesh <gurus@codeaurora.org>
Cc:     devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Lee Jones <lee.jones@linaro.org>,
        Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH v3 2/3] dt-bindings: mfd: pm8008: Add bindings
Message-ID: <20210413155854.GA1747055@robh.at.kernel.org>
References: <cover.1618278453.git.gurus@codeaurora.org>
 <3e126ba39cff60a66095911ceec08575dd658410.1618278453.git.gurus@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3e126ba39cff60a66095911ceec08575dd658410.1618278453.git.gurus@codeaurora.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, 12 Apr 2021 19:00:26 -0700, Guru Das Srinagesh wrote:
> Add bindings for the Qualcomm Technologies, Inc. PM8008 MFD driver.
> 
> Signed-off-by: Guru Das Srinagesh <gurus@codeaurora.org>
> ---
>  .../devicetree/bindings/mfd/qcom,pm8008.yaml       | 121 +++++++++++++++++++++
>  1 file changed, 121 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/mfd/qcom,pm8008.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>
