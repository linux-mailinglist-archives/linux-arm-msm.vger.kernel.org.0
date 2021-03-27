Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 73A6134B88B
	for <lists+linux-arm-msm@lfdr.de>; Sat, 27 Mar 2021 18:42:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230296AbhC0Rlb (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 27 Mar 2021 13:41:31 -0400
Received: from mail-oi1-f180.google.com ([209.85.167.180]:43737 "EHLO
        mail-oi1-f180.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230114AbhC0Rk4 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 27 Mar 2021 13:40:56 -0400
Received: by mail-oi1-f180.google.com with SMTP id n8so9037747oie.10;
        Sat, 27 Mar 2021 10:40:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=KxHyu9sOOMi23m2Vgop37IVSGKs6uDKyCyA/7ob/3Js=;
        b=uP58Hy4izW+oGU7/2qS04csBSVm9laUtJIV2faHdQEj8HdrcQ2jAZhM6qLezWEfUmn
         ent8JBCb7IcZNDNRiD5Bvhs0KXrGR139BJaWAaPzq0+w2ftjG5puTe33Dbv6YHR8ghus
         X4IkgfsKxsvefkeAu+LlIV9wPlGoQDML/K7lGII+7JQrkj/oCIXNnUav8DDvUN1ebwgL
         DL0EaHYmP0yCyfgRmOCeLNMBV3TKcXWPN6Cvp+g4WkJDOgsjzQ/sxW7zTIFoIHFX2Xrz
         vztMvsp79Samjc2bclbt5Lgp3TTwuV0N2F7DyQTeceCntEeu3GC8qQ49N2KmnodLFPqO
         zoiA==
X-Gm-Message-State: AOAM530Q5PJp5K0UJthoKKs2ZLvh7dgIVWaIC8T9o3E51+AGcGXiQOEM
        8p+tv3XhxaD9gLVqdZJZlQ==
X-Google-Smtp-Source: ABdhPJxKipn6azAqYioP1o8fMObms/f+AV18+k6Q66OQIWrM5hakLAdd3Q1xf67ggyFPJjEUv1u6Ng==
X-Received: by 2002:a54:4001:: with SMTP id x1mr14083326oie.76.1616866855696;
        Sat, 27 Mar 2021 10:40:55 -0700 (PDT)
Received: from robh.at.kernel.org ([172.58.107.88])
        by smtp.gmail.com with ESMTPSA id o23sm2950546otp.45.2021.03.27.10.40.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 27 Mar 2021 10:40:53 -0700 (PDT)
Received: (nullmailer pid 297952 invoked by uid 1000);
        Sat, 27 Mar 2021 17:40:49 -0000
Date:   Sat, 27 Mar 2021 11:40:49 -0600
From:   Rob Herring <robh@kernel.org>
To:     Rajendra Nayak <rnayak@codeaurora.org>
Cc:     srinivas.kandagatla@linaro.org, linux-kernel@vger.kernel.org,
        dianders@chromium.org, robh+dt@kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: nvmem: Add SoC compatible for sc7280
Message-ID: <20210327174049.GA297898@robh.at.kernel.org>
References: <1616651056-11844-1-git-send-email-rnayak@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1616651056-11844-1-git-send-email-rnayak@codeaurora.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, 25 Mar 2021 11:14:15 +0530, Rajendra Nayak wrote:
> Document SoC compatible for sc7280
> 
> Signed-off-by: Rajendra Nayak <rnayak@codeaurora.org>
> ---
>  Documentation/devicetree/bindings/nvmem/qcom,qfprom.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 

Acked-by: Rob Herring <robh@kernel.org>
