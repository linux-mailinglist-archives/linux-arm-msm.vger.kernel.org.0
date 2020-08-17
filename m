Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1AFB32478AF
	for <lists+linux-arm-msm@lfdr.de>; Mon, 17 Aug 2020 23:18:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728073AbgHQVSy (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 17 Aug 2020 17:18:54 -0400
Received: from mail-il1-f193.google.com ([209.85.166.193]:40084 "EHLO
        mail-il1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727022AbgHQVSy (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 17 Aug 2020 17:18:54 -0400
Received: by mail-il1-f193.google.com with SMTP id p18so11981253ilm.7;
        Mon, 17 Aug 2020 14:18:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=geakMjJ0wC5hy5d3euSCjFu1HAbmBgNytwcQ+UliUsk=;
        b=tio+qStx9VDj9nop/pJW/iK469CJy6anu3rcLAAozBNnoZcLPLp3u5sx179Jzub2Eb
         yalBEagjciwyBI1W28G1cSRXT8BeG/+D6PaLAlcb+nqiqXIwyHL21eeC12pSIIVHdmOT
         J9aHHUgji15zZwiG6zXu5VM9iDZD9FAwpo2Wnr1mwaIUQbmZfk48JVro2/HjlcvQl5mN
         xwlMSy5vpSZgKLlT3I6C54PxSrEtrqAok0rbKwpyP5a+D28pAqeKB+ymQ0F6Zyui39qN
         nC8/3YQ4Ec91KhbIa7uB3+kAoGHHNRGNIu2YnOzumjw3Xe5c6Xyi7imyQVqOffX6sAmc
         7sew==
X-Gm-Message-State: AOAM530iTnMJmdH0oHh6CPahJLBAGnkAPNMPyRTnUcrRtRvCUqjOJgOm
        Ms8Cp82LB9u4vO4HtouSKw==
X-Google-Smtp-Source: ABdhPJzgYo1j7hVzM+6ZhuRDNmWl1GrhNDq9PAyoWLoOxviTDWJK7503lqqSnTedMJ9QvkwK4yUYKA==
X-Received: by 2002:a92:cbc1:: with SMTP id s1mr10494025ilq.248.1597699132910;
        Mon, 17 Aug 2020 14:18:52 -0700 (PDT)
Received: from xps15 ([64.188.179.249])
        by smtp.gmail.com with ESMTPSA id s3sm9759604iol.49.2020.08.17.14.18.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Aug 2020 14:18:52 -0700 (PDT)
Received: (nullmailer pid 1580937 invoked by uid 1000);
        Mon, 17 Aug 2020 21:18:51 -0000
Date:   Mon, 17 Aug 2020 15:18:51 -0600
From:   Rob Herring <robh@kernel.org>
To:     Hsin-Hsiung Wang <hsin-hsiung.wang@mediatek.com>
Cc:     Mark Brown <broonie@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Stephen Boyd <sboyd@kernel.org>, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        srv_heupstream@mediatek.com
Subject: Re: [PATCH 2/3] regulator: bindings: Add document for MT6315
 regulator
Message-ID: <20200817211851.GA1579018@bogus>
References: <1596445047-2975-1-git-send-email-hsin-hsiung.wang@mediatek.com>
 <1596445047-2975-3-git-send-email-hsin-hsiung.wang@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1596445047-2975-3-git-send-email-hsin-hsiung.wang@mediatek.com>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, Aug 03, 2020 at 04:57:26PM +0800, Hsin-Hsiung Wang wrote:
> Add device tree binding information for mt6315 regulator driver.
> Example bindings for mt6315 are added.
> 
> Signed-off-by: Hsin-Hsiung Wang <hsin-hsiung.wang@mediatek.com>
> ---
>  .../bindings/regulator/mt6315-regulator.txt        | 45 ++++++++++++++++++++++
>  1 file changed, 45 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/regulator/mt6315-regulator.txt

Bindings should be DT schema format now.

Rob
