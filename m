Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 249923C8BF8
	for <lists+linux-arm-msm@lfdr.de>; Wed, 14 Jul 2021 21:37:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230039AbhGNTkc (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 14 Jul 2021 15:40:32 -0400
Received: from mail-io1-f50.google.com ([209.85.166.50]:41600 "EHLO
        mail-io1-f50.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229650AbhGNTkc (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 14 Jul 2021 15:40:32 -0400
Received: by mail-io1-f50.google.com with SMTP id z9so3506892iob.8;
        Wed, 14 Jul 2021 12:37:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=yFXysK5QOV9gybtnN9RhupuFfhn+ypkE022RTON7Xkk=;
        b=AcZ8sdh/89HX5AimgEGcvQmxF/vpbwnwjEfn3TOZj2lLoVjckGd59FdQnXbmqUpzSe
         VL4palhUUOe5zVQ7jquna9RmAae+BG/98EXdG88R4LDsIwEBqzdhhIof1gscS5wjTkTJ
         OmgwFlhGQu5Gt5y2RTiWBHrBdMhqOVSzkwd2dyeyHOaZ+BOh+Jy3Tdd6IBlik4aCPaNN
         yyXLVYAo9gVoXXsslf3scUWr2+Tn1zEbmy0A68KYJB1hs3pnYag/D8ACtbME974ShHZH
         YS1fUFoaouwhOFRDeLjQxmONxU8aJ5n0hcuMjGvm9+W4s3Fwz09M5RSfDj5lbdAC5O/c
         pmkQ==
X-Gm-Message-State: AOAM5305RaoTzO0MWTs5M8FgyZB4PR1MftNHTgo+Z73gtB2IM+3PK3Qn
        4IoTCZDCKq5HSRQGAS/Qjg==
X-Google-Smtp-Source: ABdhPJzTVnCksi6USt4jMQ9BBc0xI6zwCtruKYr1fN/ZmcDbgZJEaOWxQ8Hm+smUBRc21truH7dzyA==
X-Received: by 2002:a5d:858b:: with SMTP id f11mr8297275ioj.156.1626291459021;
        Wed, 14 Jul 2021 12:37:39 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.248])
        by smtp.gmail.com with ESMTPSA id t2sm1758841ilq.27.2021.07.14.12.37.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Jul 2021 12:37:38 -0700 (PDT)
Received: (nullmailer pid 3160062 invoked by uid 1000);
        Wed, 14 Jul 2021 19:37:34 -0000
Date:   Wed, 14 Jul 2021 13:37:34 -0600
From:   Rob Herring <robh@kernel.org>
To:     Sibi Sankar <sibis@codeaurora.org>
Cc:     evgreen@chromium.org, ohad@wizery.com,
        saiprakash.ranjan@codeaurora.org, devicetree@vger.kernel.org,
        swboyd@chromium.org, joro@8bytes.org,
        linux-remoteproc@vger.kernel.org, agross@kernel.org,
        mathieu.poirier@linaro.org, bjorn.andersson@linaro.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        will@kernel.org, linux-arm-msm@vger.kernel.org, robh+dt@kernel.org,
        robin.murphy@arm.com, dianders@chromium.org, p.zabel@pengutronix.de
Subject: Re: [PATCH 3/9] dt-bindings: remoteproc: qcom: Add Q6V5 Modem PIL
 binding
Message-ID: <20210714193734.GA3159989@robh.at.kernel.org>
References: <1624564058-24095-1-git-send-email-sibis@codeaurora.org>
 <1624564058-24095-4-git-send-email-sibis@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1624564058-24095-4-git-send-email-sibis@codeaurora.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, 25 Jun 2021 01:17:32 +0530, Sibi Sankar wrote:
> Add a new modem compatible string for QTI SC7280 SoCs and introduce the
> "qcom,ext-regs" and "qcom,qaccept-regs" bindings needed by the modem
> sub-system running on SC7280 SoCs.
> 
> Signed-off-by: Sibi Sankar <sibis@codeaurora.org>
> ---
>  .../devicetree/bindings/remoteproc/qcom,q6v5.txt   | 32 ++++++++++++++++++++--
>  1 file changed, 30 insertions(+), 2 deletions(-)
> 

Acked-by: Rob Herring <robh@kernel.org>
