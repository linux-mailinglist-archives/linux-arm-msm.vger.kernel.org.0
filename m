Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C79B036FD3C
	for <lists+linux-arm-msm@lfdr.de>; Fri, 30 Apr 2021 17:05:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230116AbhD3PD0 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 30 Apr 2021 11:03:26 -0400
Received: from mail-ot1-f49.google.com ([209.85.210.49]:37659 "EHLO
        mail-ot1-f49.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229750AbhD3PD0 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 30 Apr 2021 11:03:26 -0400
Received: by mail-ot1-f49.google.com with SMTP id c8-20020a9d78480000b0290289e9d1b7bcso50590059otm.4;
        Fri, 30 Apr 2021 08:02:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=ihZB6yDiM7/1BLJJs/4skMaPojPVqSkyPXWsToa7Z7E=;
        b=p6qwYW9wcK+yxBC4VVYN/DPj8Fxiu9C2CRnCn3sudLHqhyLhr7IDlz5A7RbrTJPkTO
         awZMmbBq9A5+6PXvcSIGFjPG0vNBN+jaKoN4uh9+pgqi0+BniE5Kq34iT45WvpmFRwrC
         p5HJEYJqi/wcLtttagEpIodVSCuShMJEEVETGlz92doQN9V8u/jNogtyo1fZ9T9Hy1zb
         DtEIItG0f7q1Peb1eSdjvnK+P1I8dHBo0Iav6XigCNNoulbLyC3QXfuODvqjuURortMC
         8U5sEPoSKNc/dPkRN9eRXyno+hZ6r5BO25tEpolzApeBl3AO5bJv6VpXX4Y7fQynqFOi
         S3Aw==
X-Gm-Message-State: AOAM5335n2w3L+ZV29F77Vf6llB6h8+33JjyPj4FJwEqE+xr9EG56VGE
        fyNWFYqctzGTHqbjMoAQOA==
X-Google-Smtp-Source: ABdhPJwH9oo3aLQiqeBbk/J+VM/LSrW/6BkULhZAPr8wFTJTS7hl+WkVHK+SVf8Pok+emEfMk2KAGQ==
X-Received: by 2002:a9d:6e8f:: with SMTP id a15mr3969921otr.169.1619794957696;
        Fri, 30 Apr 2021 08:02:37 -0700 (PDT)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id p65sm819330oia.46.2021.04.30.08.02.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Apr 2021 08:02:36 -0700 (PDT)
Received: (nullmailer pid 3318259 invoked by uid 1000);
        Fri, 30 Apr 2021 15:02:35 -0000
Date:   Fri, 30 Apr 2021 10:02:35 -0500
From:   Rob Herring <robh@kernel.org>
To:     Sibi Sankar <sibis@codeaurora.org>
Cc:     bjorn.andersson@linaro.org, robh+dt@kernel.org,
        linux-remoteproc@vger.kernel.org, agross@kernel.org,
        ohad@wizery.com, rishabhb@codeaurora.org, ulf.hansson@linaro.org,
        devicetree@vger.kernel.org, dianders@chromium.org,
        mathieu.poirier@linaro.org, rjw@rjwysocki.net,
        sidgup@codeaurora.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, swboyd@chromium.org
Subject: Re: [PATCH 04/12] dt-bindings: remoteproc: qcom: Add QMP bindings
Message-ID: <20210430150235.GA3318229@robh.at.kernel.org>
References: <1618574638-5117-1-git-send-email-sibis@codeaurora.org>
 <1618574638-5117-5-git-send-email-sibis@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1618574638-5117-5-git-send-email-sibis@codeaurora.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, 16 Apr 2021 17:33:50 +0530, Sibi Sankar wrote:
> Add Qualcomm Mailbox Protocol (QMP) binding to replace the power domains
> exposed by the AOSS QMP node.
> 
> Signed-off-by: Sibi Sankar <sibis@codeaurora.org>
> ---
>  Documentation/devicetree/bindings/remoteproc/qcom,q6v5.txt | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)
> 

Acked-by: Rob Herring <robh@kernel.org>
