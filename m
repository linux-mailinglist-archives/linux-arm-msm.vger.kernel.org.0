Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CD4C439C278
	for <lists+linux-arm-msm@lfdr.de>; Fri,  4 Jun 2021 23:31:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229982AbhFDVdj (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 4 Jun 2021 17:33:39 -0400
Received: from mail-ot1-f42.google.com ([209.85.210.42]:41730 "EHLO
        mail-ot1-f42.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230435AbhFDVdj (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 4 Jun 2021 17:33:39 -0400
Received: by mail-ot1-f42.google.com with SMTP id 36-20020a9d0ba70000b02902e0a0a8fe36so10449633oth.8;
        Fri, 04 Jun 2021 14:31:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=29KDNg6bdct+jVvkaUIPY5tx3C00HziQYhBFF6LbCFI=;
        b=iuHb5SnU2IbBzCqJMAkewfFfzngWSnNbqdujou4Cd6Ypjd7PIHn8Pg8fZRDzxcjSse
         e0G/m0piOIY8Ak5Gh+80N/7j0JKDkxbErdwldIAuFTsWuf/xgwolmsFPB5eQsstE7c5Y
         1qgiwvs0Zl1S9KyAoEkvyEzLj121QYnDAE3tm4GJVnlmav6qNN38HMTHc/YCIv1qif6p
         gQsEur6s4hgLrtwcHzs8EvzqpApXJe18hChLikYxUvwyDmNrUtpgXW8/0Ea37qxBJtR2
         JoU6rx8KOBDOx/4JBFamJvqRtUKtOC9FoJZrtVUbQUn4YxdSRhEljrMYT3plrAbTtFip
         fZsg==
X-Gm-Message-State: AOAM533BYxBYN3ys0eA+6F3wyUT19wpraIs2iPOv7mAp/3D/eJcY2lGY
        zpr+lRQh7B7+V0IBelWTr/EkQaM85Q==
X-Google-Smtp-Source: ABdhPJyyNUCIVUo3gBokt/OZHYOrLcTLLfjGQzTRvp1YwQ6PI4fEpZOWaUh3mbD0idVXZ+0Ac3yFxQ==
X-Received: by 2002:a9d:684d:: with SMTP id c13mr5179122oto.201.1622842296306;
        Fri, 04 Jun 2021 14:31:36 -0700 (PDT)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id m12sm726092oim.9.2021.06.04.14.31.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Jun 2021 14:31:35 -0700 (PDT)
Received: (nullmailer pid 3956200 invoked by uid 1000);
        Fri, 04 Jun 2021 21:31:34 -0000
Date:   Fri, 4 Jun 2021 16:31:34 -0500
From:   Rob Herring <robh@kernel.org>
To:     Bartosz Dudziak <bartosz.dudziak@snejp.pl>
Cc:     Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
        Kumar Gala <galak@codeaurora.org>,
        Russell King <linux@armlinux.org.uk>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, Jens Axboe <axboe@kernel.dk>,
        Andy Gross <agross@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, David Sterba <dsterba@suse.com>
Subject: Re: [PATCH v2 1/2] dt-bindings: arm: msm: Add SAW2 for MSM8226
Message-ID: <20210604213134.GA3956146@robh.at.kernel.org>
References: <20210530121803.13102-1-bartosz.dudziak@snejp.pl>
 <20210530121803.13102-2-bartosz.dudziak@snejp.pl>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210530121803.13102-2-bartosz.dudziak@snejp.pl>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Sun, 30 May 2021 14:18:02 +0200, Bartosz Dudziak wrote:
> Add the dt-binding compatible in the SPM AVS Wrapper 2 (SAW2) for the
> MSM8226 SoC platform.
> 
> Signed-off-by: Bartosz Dudziak <bartosz.dudziak@snejp.pl>
> ---
>  Documentation/devicetree/bindings/arm/msm/qcom,saw2.txt | 1 +
>  1 file changed, 1 insertion(+)
> 

Acked-by: Rob Herring <robh@kernel.org>
