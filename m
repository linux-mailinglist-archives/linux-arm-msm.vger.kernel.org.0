Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 87A4535A642
	for <lists+linux-arm-msm@lfdr.de>; Fri,  9 Apr 2021 20:53:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234742AbhDISxE (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 9 Apr 2021 14:53:04 -0400
Received: from mail-ot1-f52.google.com ([209.85.210.52]:45036 "EHLO
        mail-ot1-f52.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234572AbhDISxE (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 9 Apr 2021 14:53:04 -0400
Received: by mail-ot1-f52.google.com with SMTP id y19-20020a0568301d93b02901b9f88a238eso6619296oti.11;
        Fri, 09 Apr 2021 11:52:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=MJqvo/odRMTqv+5Mpa3AMWORYIs56xJLHTyILHT+fDU=;
        b=Xm7eBePFTH8b/A5uPrjPus8x6Y4xIyT0/Tw5WS+kWOVjxnoUx69pQbqvJjybvqtAfE
         +k2Wnk5HKJVrK5OHDBBZknlkC9eXnhdVEJiewvL6B1hxs0dWhOD3AoiVUgAzOQZXm7aF
         +eFsyBN23ae/vV1mmvGXO0V5CYQGtw7QMsmwkTNLnnxHDRMmpXECZ93u/OeMEpuLrK0c
         VUejlOnYTh1pqSZmlsFLHewR1jRtq9D0h+n+pCXiEYrtw74Y69brVzzkrIVUto3k+YCO
         czUdwOPXTR5Kzu6o4+qug84peYH4PsYZ2SV2Bj38O/80hVqAvVuWe5J8zLGxW8d+RQn/
         GqTw==
X-Gm-Message-State: AOAM530C/TmjsUgxhf4s/ejvUpqIMyAZvAgDkOUk8Qa1AsV1ULrAD7o4
        EI5FMpKGdyeWFZT+dcmhg1nUM/V8lg==
X-Google-Smtp-Source: ABdhPJwpK4STmGa1myks43cGTezKDhifAFa5gxJWFspnnWEuVaAAzS8O14W6OB1fVGGNxiu5okjqBA==
X-Received: by 2002:a9d:7f0d:: with SMTP id j13mr13146968otq.270.1617994369353;
        Fri, 09 Apr 2021 11:52:49 -0700 (PDT)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id n15sm667288oos.1.2021.04.09.11.52.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Apr 2021 11:52:48 -0700 (PDT)
Received: (nullmailer pid 3953245 invoked by uid 1000);
        Fri, 09 Apr 2021 18:52:47 -0000
Date:   Fri, 9 Apr 2021 13:52:47 -0500
From:   Rob Herring <robh@kernel.org>
To:     Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, bjorn.andersson@linaro.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Rob Herring <robh+dt@kernel.org>
Subject: Re: [PATCH 14/15] dt-bindings: remoteproc: qcom: pas: Add binding
 for SDX55
Message-ID: <20210409185247.GA3953200@robh.at.kernel.org>
References: <20210408170457.91409-1-manivannan.sadhasivam@linaro.org>
 <20210408170457.91409-15-manivannan.sadhasivam@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210408170457.91409-15-manivannan.sadhasivam@linaro.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, 08 Apr 2021 22:34:56 +0530, Manivannan Sadhasivam wrote:
> Add devicetree binding for SDX55 remoteproc.
> 
> Cc: Rob Herring <robh+dt@kernel.org>
> Cc: devicetree@vger.kernel.org
> Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> ---
>  Documentation/devicetree/bindings/remoteproc/qcom,adsp.txt | 4 ++++
>  1 file changed, 4 insertions(+)
> 

Acked-by: Rob Herring <robh@kernel.org>
