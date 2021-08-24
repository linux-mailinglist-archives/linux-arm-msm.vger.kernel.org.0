Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E75EA3F62F9
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Aug 2021 18:43:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229866AbhHXQoY (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 24 Aug 2021 12:44:24 -0400
Received: from mail-ot1-f45.google.com ([209.85.210.45]:39487 "EHLO
        mail-ot1-f45.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231347AbhHXQoY (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 24 Aug 2021 12:44:24 -0400
Received: by mail-ot1-f45.google.com with SMTP id m7-20020a9d4c87000000b0051875f56b95so47713160otf.6;
        Tue, 24 Aug 2021 09:43:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=7LuGzuC+oFnu9L7kihYjrWqcEekc7X7ZwPNXVobfSZs=;
        b=knyT2Q5hf/Ph5n2iClk3C5BeQndOuH/bBz5no+r+GGpk3Sgdr4+Ei0xGARFfBP2dCy
         X159h+gb6F2GgQYKI3hq/MJryQauOS5AUdZIEPvqF897MrKt0coT9tkQqkmfFV3ygjq6
         HPeVdzwstyjIu5XILGrbpb5X1cBU5UEGTwxNyQFgGFSZ2nBb6bF8Yqqt1VPg8+wZusK0
         Fn35mT4hvJTbd2Aj/yEZJDqL0pQ+PKyLCCtmYpDDR5NyIYoxFHIJFSkCT/ZB20xFW1Wx
         imFha0mr7zIs2Ne/3PRkT7N8qfgGTUBFzUc9J2Bxge4WbDBDNd5fC6GTAOXUkTe4U/r9
         1PYQ==
X-Gm-Message-State: AOAM532g2FCeWFlrEXsUz4aP3ScxneMdub+aiN+wWoSoXQ6HirwuuVIN
        WvVP87YZ9axzFUfVDioc6w==
X-Google-Smtp-Source: ABdhPJzcy39BSF4IWPd7qDtNjvmDHo0SsFmgmh2z2Rs+J2gYOsrqgsVuKghOj8It+Ra0jbmJFYqEqQ==
X-Received: by 2002:aca:afc3:: with SMTP id y186mr3326658oie.65.1629823419743;
        Tue, 24 Aug 2021 09:43:39 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net. [66.90.148.213])
        by smtp.gmail.com with ESMTPSA id j17sm4635463ots.10.2021.08.24.09.43.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Aug 2021 09:43:39 -0700 (PDT)
Received: (nullmailer pid 601487 invoked by uid 1000);
        Tue, 24 Aug 2021 16:43:38 -0000
Date:   Tue, 24 Aug 2021 11:43:38 -0500
From:   Rob Herring <robh@kernel.org>
To:     Konrad Dybcio <konrad.dybcio@somainline.org>
Cc:     martin.botka@somainline.org, Jassi Brar <jassisinghbrar@gmail.com>,
        Andy Gross <agross@kernel.org>, marijn.suijten@somainline.org,
        Rob Herring <robh+dt@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        linux-arm-msm@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        angelogioacchino.delregno@somainline.org,
        jamipkettunen@somainline.org
Subject: Re: [PATCH 6/6] dt-bindings: mailbox: qcom-ipcc: Add compatible for
 SM6350
Message-ID: <YSUhulJ7vsHXSuFo@robh.at.kernel.org>
References: <20210820203105.229764-1-konrad.dybcio@somainline.org>
 <20210820203105.229764-7-konrad.dybcio@somainline.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210820203105.229764-7-konrad.dybcio@somainline.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, 20 Aug 2021 22:31:05 +0200, Konrad Dybcio wrote:
> Add IPCC compatible for SM6350 SoC.
> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@somainline.org>
> ---
>  Documentation/devicetree/bindings/mailbox/qcom-ipcc.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 

Acked-by: Rob Herring <robh@kernel.org>
