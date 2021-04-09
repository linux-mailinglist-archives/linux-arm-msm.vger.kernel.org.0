Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8480635A634
	for <lists+linux-arm-msm@lfdr.de>; Fri,  9 Apr 2021 20:52:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234478AbhDISwN (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 9 Apr 2021 14:52:13 -0400
Received: from mail-ot1-f41.google.com ([209.85.210.41]:40516 "EHLO
        mail-ot1-f41.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233332AbhDISwN (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 9 Apr 2021 14:52:13 -0400
Received: by mail-ot1-f41.google.com with SMTP id w31-20020a9d36220000b02901f2cbfc9743so6633693otb.7;
        Fri, 09 Apr 2021 11:51:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=NIrTfXnfmHsSq3bLGwV3nuEchCpnAAO5Sn0vt3rU7IE=;
        b=CmKC13ftMUHDgfTUmVkGPOUDzk2uCCGZw9DBElnNfxrDJVYFqcq1Dl8M1T23L8VL94
         8kOf8ltkhPLPBjRoizj8p2XKkczTJZzztM8YorpTTH2zUAEs+GVhAKBz15C8n4pT08Fu
         vUARg4WGhhdmdau1V4myO7jNsvCvqMBd2N0QI9AoMoa2PDcAoeGX1teKCv6M57II5sFW
         Kx4lDmo+5lBdlSRcTUmhkYIH2n45pXETOYNUtRSXFNPuDHykHGC9fcgwdk3qA2SHT1GZ
         VXu3t/LeyXd40U/prd3adVtSzfvA8w2HOGV7QqCgJu81KxvSrVRwcY0OnI3McDdUuJby
         ifvQ==
X-Gm-Message-State: AOAM531fmAee9HDTmdYO6STWUFuAkVWYSiu4VPTze/uvpcbosR1oNNaw
        6Ayt2Z++xxrSIp3WbEDUD0Q+3bHNOA==
X-Google-Smtp-Source: ABdhPJydwvmEiEkCdUhlBibxbcMAuhfBIf8lXuYP9s/SWfw5brea3s4tJgho7A2VZS9q1cVXTjJL/Q==
X-Received: by 2002:a9d:39ca:: with SMTP id y68mr13435243otb.84.1617994318369;
        Fri, 09 Apr 2021 11:51:58 -0700 (PDT)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id w2sm670324oov.23.2021.04.09.11.51.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Apr 2021 11:51:57 -0700 (PDT)
Received: (nullmailer pid 3951777 invoked by uid 1000);
        Fri, 09 Apr 2021 18:51:56 -0000
Date:   Fri, 9 Apr 2021 13:51:56 -0500
From:   Rob Herring <robh@kernel.org>
To:     Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc:     linux-kernel@vger.kernel.org, bjorn.andersson@linaro.org,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Rob Herring <robh+dt@kernel.org>
Subject: Re: [PATCH 06/15] dt-bindings: firmware: scm: Add compatible for
 SDX55
Message-ID: <20210409185156.GA3951730@robh.at.kernel.org>
References: <20210408170457.91409-1-manivannan.sadhasivam@linaro.org>
 <20210408170457.91409-7-manivannan.sadhasivam@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210408170457.91409-7-manivannan.sadhasivam@linaro.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, 08 Apr 2021 22:34:48 +0530, Manivannan Sadhasivam wrote:
> Add devicetree compatible for SCM present in SDX55 platform.
> 
> Cc: Rob Herring <robh+dt@kernel.org>
> Cc: devicetree@vger.kernel.org
> Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> ---
>  Documentation/devicetree/bindings/firmware/qcom,scm.txt | 1 +
>  1 file changed, 1 insertion(+)
> 

Acked-by: Rob Herring <robh@kernel.org>
