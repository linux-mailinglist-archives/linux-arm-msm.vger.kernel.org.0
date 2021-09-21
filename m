Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ACD5B413B3B
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 Sep 2021 22:22:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234724AbhIUUYY (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 21 Sep 2021 16:24:24 -0400
Received: from mail-ot1-f47.google.com ([209.85.210.47]:39580 "EHLO
        mail-ot1-f47.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230348AbhIUUYY (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 21 Sep 2021 16:24:24 -0400
Received: by mail-ot1-f47.google.com with SMTP id j11-20020a9d190b000000b00546fac94456so213818ota.6;
        Tue, 21 Sep 2021 13:22:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=W/mQfdW30X5qlANCAQrL+4jKLNtRq78tPqCS/QKUkgw=;
        b=uhW4XgHrhzQ+r3CMsIJtbZ7CpL0YIchMmuZoFbiFr7JpScp+OoPdgdHppvVrs4zdvN
         5apCGZrCs6GGtfqhwh9tnO4MF7+DFoaNgyaAJLujFTyeG58SWIQV6s7Y42zIq4EUurSx
         85cSzvHUID2lyK9ZBfMT5vtt+AXaR9uj/ppkYCbj1cgLPN3rZXzbwXOEqwiz3/ki8Due
         xp8p1CEUiN7VlEFjLcCvSo6rTo6suEgrcsH+Ice809yk9Ni9kiDfkb9L5om/o0dEvDll
         cOGetP0TlI5D4+Di5paDBLgwoAZWOWMVlMD68bMdSpOv9rk4XYZBM5f6+GxCC2wZ+Ef1
         nwOA==
X-Gm-Message-State: AOAM532ICH4fUzi9CbOJeaekL1NwL7C4Q+IKYsKJ1nRKCwedaUwQ41OH
        3IrAWzhMmC5MP7J3IwzkeA==
X-Google-Smtp-Source: ABdhPJwFn6Uoh0NNkNyOwv+03Bq0kab24RLxehuYZUPw0ozZ/72MJ9O5hxFOX8nWlaPzsrZkxtDmow==
X-Received: by 2002:a9d:75d1:: with SMTP id c17mr9085620otl.168.1632255774875;
        Tue, 21 Sep 2021 13:22:54 -0700 (PDT)
Received: from robh.at.kernel.org (rrcs-192-154-179-36.sw.biz.rr.com. [192.154.179.36])
        by smtp.gmail.com with ESMTPSA id h12sm11287oie.12.2021.09.21.13.22.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Sep 2021 13:22:54 -0700 (PDT)
Received: (nullmailer pid 3267264 invoked by uid 1000);
        Tue, 21 Sep 2021 20:22:52 -0000
Date:   Tue, 21 Sep 2021 15:22:52 -0500
From:   Rob Herring <robh@kernel.org>
To:     Shawn Guo <shawn.guo@linaro.org>
Cc:     Sivaprakash Murugesan <sivaprak@codeaurora.org>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Loic Poulain <loic.poulain@linaro.org>,
        linux-arm-msm@vger.kernel.org,
        Jassi Brar <jassisinghbrar@gmail.com>,
        Rob Herring <robh+dt@kernel.org>
Subject: Re: [PATCH 2/3] dt-bindings: mailbox: qcom: Add QCM2290 APCS
 compatible
Message-ID: <YUo/HEnUXy8AOHi+@robh.at.kernel.org>
References: <20210914014050.28788-1-shawn.guo@linaro.org>
 <20210914014050.28788-3-shawn.guo@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210914014050.28788-3-shawn.guo@linaro.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, 14 Sep 2021 09:40:49 +0800, Shawn Guo wrote:
> Add compatible for the Qualcomm QCM2290 APCS block.
> 
> Signed-off-by: Shawn Guo <shawn.guo@linaro.org>
> ---
>  .../devicetree/bindings/mailbox/qcom,apcs-kpss-global.yaml       | 1 +
>  1 file changed, 1 insertion(+)
> 

Acked-by: Rob Herring <robh@kernel.org>
