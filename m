Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6DF63413B3D
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 Sep 2021 22:23:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234765AbhIUUYf (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 21 Sep 2021 16:24:35 -0400
Received: from mail-ot1-f47.google.com ([209.85.210.47]:41963 "EHLO
        mail-ot1-f47.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230348AbhIUUYf (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 21 Sep 2021 16:24:35 -0400
Received: by mail-ot1-f47.google.com with SMTP id 97-20020a9d006a000000b00545420bff9eso191478ota.8;
        Tue, 21 Sep 2021 13:23:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=lgAvX9X9XC9VFpomXK7W+0ui5lWfgyoXpRCOo5Lzu9k=;
        b=xPNWY7s1aF9Gcfo1AwMAOZyfwaxoYz8w133pEGgmZWw5pjhu5NZNhX+Xgj2/FlyP6B
         d/law9xshZN2ydSCsQ92mcVK+XWyL8pYtYU453aBTWXyVZtB1OGm36385RfwGfi/Zq+k
         vDGi6qnpp59jcAYpSvY+uMezypkrFZHrTmKn9Z+Q0a5a0ICzTUimh2pgnRBTAy8AEZsO
         cxoRdK7KvVCOayC+o6SvqR/Kp00hK2+QIIwCb89Bw+vRBvpsmMYsw9chgY61vsNdSJal
         6Rz1NV/T/ZFwVpY0lskGlQimSW+RyJkiNPfoOqW+fxfMSNC8I2GYDSkEhuGHKl5lt4WY
         L/4w==
X-Gm-Message-State: AOAM530IOb4SOkAU9MUQorTtyL/W/+LXSpFGvecH1gGBsINAiG/PVn8o
        aDZYzEmiowPg7fy47b2Ztw==
X-Google-Smtp-Source: ABdhPJxHYv381UDpx7saI/3Ft7MX/Sg4jJVlh1qreuy29pXrDifkI1sYb1CgYNa49e6HOP28QyEfuw==
X-Received: by 2002:a9d:72d5:: with SMTP id d21mr10336090otk.181.1632255786325;
        Tue, 21 Sep 2021 13:23:06 -0700 (PDT)
Received: from robh.at.kernel.org (rrcs-192-154-179-36.sw.biz.rr.com. [192.154.179.36])
        by smtp.gmail.com with ESMTPSA id d14sm4454otq.65.2021.09.21.13.23.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Sep 2021 13:23:05 -0700 (PDT)
Received: (nullmailer pid 3267613 invoked by uid 1000);
        Tue, 21 Sep 2021 20:23:03 -0000
Date:   Tue, 21 Sep 2021 15:23:03 -0500
From:   Rob Herring <robh@kernel.org>
To:     Shawn Guo <shawn.guo@linaro.org>
Cc:     Loic Poulain <loic.poulain@linaro.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Kathiravan T <kathirav@codeaurora.org>
Subject: Re: [PATCH 1/2] dt-bindings: soc: qcom: smd-rpm: Add QCM2290
 compatible
Message-ID: <YUo/J3SGZTgu8z3c@robh.at.kernel.org>
References: <20210914015349.29295-1-shawn.guo@linaro.org>
 <20210914015349.29295-2-shawn.guo@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210914015349.29295-2-shawn.guo@linaro.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, 14 Sep 2021 09:53:48 +0800, Shawn Guo wrote:
> Add compatible for the RPM on Qualcomm QCM2290 SoC.
> 
> Signed-off-by: Shawn Guo <shawn.guo@linaro.org>
> ---
>  Documentation/devicetree/bindings/soc/qcom/qcom,smd-rpm.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 

Acked-by: Rob Herring <robh@kernel.org>
