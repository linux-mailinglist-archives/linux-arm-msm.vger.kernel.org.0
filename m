Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AA05D3C92D0
	for <lists+linux-arm-msm@lfdr.de>; Wed, 14 Jul 2021 23:08:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235149AbhGNVLi (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 14 Jul 2021 17:11:38 -0400
Received: from mail-io1-f51.google.com ([209.85.166.51]:43541 "EHLO
        mail-io1-f51.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235120AbhGNVLi (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 14 Jul 2021 17:11:38 -0400
Received: by mail-io1-f51.google.com with SMTP id k16so3836596ios.10;
        Wed, 14 Jul 2021 14:08:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=Z5aC/xNGPLZVKGpScwExw74ebefIhtn/rWcpqTAwDEw=;
        b=NsghyrzVw5LQlaevPf5sfiVUpyANgZ9a9PHTWSKnvn5+ybu7qK5CDFVyNowoXnzWUS
         UxbJRkq2wdrG6wnBHEdBlYNzkkZnkQfpg/ZBsw5GO2vXpd1EfSrkPHYR8XJzjiy8U0un
         hMqrunZo+75XMcZRmxL8o9Cazm9YTS+1I00VKMNV3/B1H9UAu/EOECo+W8YSu0Z/cQ20
         9i1lfTJqdfPLNqWI/GgcZdqLubQy8OqgiAZtN5gBy31LFykxG2NZnCWF5CfD6FyW2wfF
         +6aFSCZRpbtgoNZFVKREpcrDufQdqRWLOma1bV5YkbWKQE4hSEmnWmmhVZ+WhilME59s
         An7Q==
X-Gm-Message-State: AOAM531My0Gjrh6gI0T4xRhNkf0SFAXv8d6/vc0JXvKG7oIArIKhGrjY
        v1xWIfA/LWv2aOceVf+f3796UHOjkUln
X-Google-Smtp-Source: ABdhPJwvgJqL668Qul4ApNrxAJtsDyY6myGAu4WkvRNOjFn14sehvJHJs60+0s13mUNHx2BlfsbY/w==
X-Received: by 2002:a5d:80cf:: with SMTP id h15mr91378ior.30.1626296925575;
        Wed, 14 Jul 2021 14:08:45 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.248])
        by smtp.gmail.com with ESMTPSA id h12sm1977719ilj.6.2021.07.14.14.08.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Jul 2021 14:08:44 -0700 (PDT)
Received: (nullmailer pid 3527061 invoked by uid 1000);
        Wed, 14 Jul 2021 21:08:42 -0000
Date:   Wed, 14 Jul 2021 15:08:42 -0600
From:   Rob Herring <robh@kernel.org>
To:     Martin Botka <martin.botka@somainline.org>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        angelogioacchino.delregno@somainline.org,
        Michael Turquette <mturquette@baylibre.com>,
        linux-kernel@vger.kernel.org, martin.botka1@gmail.com,
        paul.bouchara@somainline.org, konrad.dybcio@somainline.org,
        marijn.suijten@somainline.org, Stephen Boyd <sboyd@kernel.org>,
        jamipkettunen@somainline.org, Andy Gross <agross@kernel.org>,
        Rob Herring <robh+dt@kernel.org>, linux-clk@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht, devicetree@vger.kernel.org
Subject: Re: [RESEND PATCH v2 2/3] dt-bindings: clk: qcom: smd-rpm: Document
 SM6125 compatible
Message-ID: <20210714210842.GA3526993@robh.at.kernel.org>
References: <20210629102624.194378-1-martin.botka@somainline.org>
 <20210629102624.194378-3-martin.botka@somainline.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210629102624.194378-3-martin.botka@somainline.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, 29 Jun 2021 12:26:22 +0200, Martin Botka wrote:
> Document the newly added compatible for sm6125 rpmcc.
> 
> Signed-off-by: Martin Botka <martin.botka@somainline.org>
> ---
>  Documentation/devicetree/bindings/clock/qcom,rpmcc.txt | 1 +
>  1 file changed, 1 insertion(+)
> 

Acked-by: Rob Herring <robh@kernel.org>
