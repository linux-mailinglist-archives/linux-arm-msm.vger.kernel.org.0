Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 165F62E8108
	for <lists+linux-arm-msm@lfdr.de>; Thu, 31 Dec 2020 16:40:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726356AbgLaPkQ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 31 Dec 2020 10:40:16 -0500
Received: from mail-oo1-f53.google.com ([209.85.161.53]:40086 "EHLO
        mail-oo1-f53.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726080AbgLaPkQ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 31 Dec 2020 10:40:16 -0500
Received: by mail-oo1-f53.google.com with SMTP id 9so4381554ooy.7;
        Thu, 31 Dec 2020 07:40:00 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=aqRUTrB98zq19oUfqeTfRGQXti0Kp3OgPKPcu5cHQTM=;
        b=M/SjJFSAUhwgApfUeLMUUySfsuWpzzWRA9QNR6qlAATZjvpc8J2W5LkgrJuGZXWKAe
         +T0Y5jpz7vu0xJbw7TWfTWmOBq4aw0VzDt479jbdn2+KEIeYsinYkVaRdlmOR34myLQy
         gc81Qy96WP2O7Xi+PT7sog5cQbzoC3dRL9089pIdoznDdMQHAH7Muw06/hWcVCXKfE4J
         wLwjEqRXL9hYkZ19sZnhhE1nHlnjE6K3B/DJOmT1xyrTsbtcC2xvGWFoF3uWAA2B1Ooj
         qBnhLx2q6vISnIYjtxa6VIwX0gM5zT+XBdfK6aD6ezdYcuQXH2DeoT4XBe/R+7A/U8Ee
         chpA==
X-Gm-Message-State: AOAM532XKfA5bdV5P7Ek7ursEjMLIp30U5geJw3MfPNNBXe7WY+hEAFd
        h9tXky8OW4S/krkFXOzZrw==
X-Google-Smtp-Source: ABdhPJx1uK9oxb1Sht+XTOoCn6qCnv276YFq7AbTWO1nihXVsG+83XjUs8P2ZFTe9vA3Jk0ICL3Vjg==
X-Received: by 2002:a4a:e1b5:: with SMTP id 21mr39831446ooy.64.1609429175023;
        Thu, 31 Dec 2020 07:39:35 -0800 (PST)
Received: from robh.at.kernel.org ([64.188.179.253])
        by smtp.gmail.com with ESMTPSA id f201sm10955753oig.21.2020.12.31.07.39.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 31 Dec 2020 07:39:33 -0800 (PST)
Received: (nullmailer pid 1836008 invoked by uid 1000);
        Thu, 31 Dec 2020 15:39:31 -0000
Date:   Thu, 31 Dec 2020 08:39:31 -0700
From:   Rob Herring <robh@kernel.org>
To:     Hsin-Hsiung Wang <hsin-hsiung.wang@mediatek.com>
Cc:     Stephen Boyd <sboyd@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        Mark Brown <broonie@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
        srv_heupstream@mediatek.com,
        Project_Global_Chrome_Upstream_Group@mediatek.com
Subject: Re: [PATCH v5 1/4] dt-bindings: spmi: modify the constraint
 'maxItems' to 'minItems'
Message-ID: <20201231153931.GA1833986@robh.at.kernel.org>
References: <1608691469-20919-1-git-send-email-hsin-hsiung.wang@mediatek.com>
 <1608691469-20919-2-git-send-email-hsin-hsiung.wang@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1608691469-20919-2-git-send-email-hsin-hsiung.wang@mediatek.com>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, Dec 23, 2020 at 10:44:26AM +0800, Hsin-Hsiung Wang wrote:
> The constraint of 'maxItem: 1' might be larger than 1, so we modify it
> to 'minItem: 0'.
> 
> Signed-off-by: Hsin-Hsiung Wang <hsin-hsiung.wang@mediatek.com>
> ---
>  Documentation/devicetree/bindings/spmi/spmi.yaml | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/spmi/spmi.yaml b/Documentation/devicetree/bindings/spmi/spmi.yaml
> index 173940930719..f1a26391ffde 100644
> --- a/Documentation/devicetree/bindings/spmi/spmi.yaml
> +++ b/Documentation/devicetree/bindings/spmi/spmi.yaml
> @@ -25,7 +25,7 @@ properties:
>      pattern: "^spmi@.*"
>  
>    reg:
> -    maxItems: 1
> +    minItems: 0

0 is never right. That's 'reg' not present.

>  
>    "#address-cells":
>      const: 2
> -- 
> 2.18.0
> 
