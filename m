Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EDB1C3CA20C
	for <lists+linux-arm-msm@lfdr.de>; Thu, 15 Jul 2021 18:13:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229973AbhGOQQb (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 15 Jul 2021 12:16:31 -0400
Received: from mail-il1-f178.google.com ([209.85.166.178]:46032 "EHLO
        mail-il1-f178.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229516AbhGOQQb (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 15 Jul 2021 12:16:31 -0400
Received: by mail-il1-f178.google.com with SMTP id b6so5465136iln.12;
        Thu, 15 Jul 2021 09:13:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=fJJ10Jxt+U222lwghvVNlytA03/Ewg2Zrbx7UCQk4Q8=;
        b=FoEmROYxyd2ULPVPivDtohFao+/Ckx19rEH5wSaget2t1WUFiFBPH6BJFm/FKmwwkQ
         GuDH4JoyFNclYn/eZitjtLEDRkNECbNiRTsHLAm7YuqJDrBn0hPq609owtizFEzby0ZO
         TzMgT2PyFg//0L+oEk+NO2fl6MpbVm+V0PoTcZyUsKp6uJylfqgESA0CtCzUGdfIYdn1
         fHJfW0+KNYwWrWLoyaYTS2YPTj0e6NdpQ1zduICBk1n2gy/RUPQ/oh0wretN3sdkL+Ky
         0Q37XgwCexn6RWAqb9DZMfI/w7HhZyG0a6ygpMlLnKBDeE3IsRl9AOe7hUdx+qC6mnGp
         eCpA==
X-Gm-Message-State: AOAM533P58Hwus0o1scb9KYK6/cI5NYXG5ZyAkd8JcdTTd9Bzkut7kir
        hb+7KBzWsuNODh+l8FAG2w==
X-Google-Smtp-Source: ABdhPJyxYflRKyZsbAnB50CIKk1kKa92bbxmQMdqoQ2pHFwa+7hpO/ancuVqqyfJzgBFG+UvjwS4XA==
X-Received: by 2002:a92:d84a:: with SMTP id h10mr3096159ilq.55.1626365616921;
        Thu, 15 Jul 2021 09:13:36 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.248])
        by smtp.gmail.com with ESMTPSA id l8sm3687529iok.26.2021.07.15.09.13.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Jul 2021 09:13:36 -0700 (PDT)
Received: (nullmailer pid 1172820 invoked by uid 1000);
        Thu, 15 Jul 2021 16:13:34 -0000
Date:   Thu, 15 Jul 2021 10:13:34 -0600
From:   Rob Herring <robh@kernel.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     linux-kernel@vger.kernel.org, Sibi S <sibis@codeaurora.org>,
        Andy Gross <agross@kernel.org>, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, Rob Herring <robh+dt@kernel.org>
Subject: Re: [PATCH v2 1/3] dt-bindings: soc: qcom: aoss: Add SC8180X and
 generic compatible
Message-ID: <20210715161334.GA1172755@robh.at.kernel.org>
References: <20210709174142.1274554-1-bjorn.andersson@linaro.org>
 <20210709174142.1274554-2-bjorn.andersson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210709174142.1274554-2-bjorn.andersson@linaro.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, 09 Jul 2021 10:41:40 -0700, Bjorn Andersson wrote:
> Add a generic compatible for all versions of the AOSS QMP to the
> binding, in order to allow a single implementation for them and then add
> a specific compatible for the Qualcomm SC8180x platform.
> 
> Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> ---
> 
> Changes since v1:
> - Mention the generic compatible in $subject and message.
> 
>  Documentation/devicetree/bindings/soc/qcom/qcom,aoss-qmp.txt | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
> 

Acked-by: Rob Herring <robh@kernel.org>
