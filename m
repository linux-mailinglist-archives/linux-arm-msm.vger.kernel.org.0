Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 669BF1CE375
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 May 2020 21:00:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731247AbgEKTAb (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 11 May 2020 15:00:31 -0400
Received: from mail-oi1-f195.google.com ([209.85.167.195]:44984 "EHLO
        mail-oi1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729215AbgEKTAa (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 11 May 2020 15:00:30 -0400
Received: by mail-oi1-f195.google.com with SMTP id a2so15856411oia.11;
        Mon, 11 May 2020 12:00:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=aZMD3ItdlPXSVduXUBnanRL+x6fZ2m8A7BobRhNFhs0=;
        b=W5tMx6Xr66HapZObboDaq2Af0Az2ZQgbf/mh6hPecejYSSYyRMXfqL0Hl65UR4CQbL
         hNgNZu8JQ7DOXE0kln03UvidoctK5+fjSzjtIoWq2JAHcejFbxRV92YJDqXn6ytkMim8
         gUOAw67006mI6hqe5zIo1SqHxrI+V5ed58cvBI5+qlqQCMz/vBnK0dWwXnPgY3GVTSnD
         7noU4EVl7jBVJtU94URhEHqm4NmnIzlq2X8USIFylRJFiB45h6VAchGgzaqz0v7imVGW
         xPBfOxwdWI8dYX+N7Ah1bbjKo7rUgyNx1m40oMOio0FOxoC9hjP/2ndYbjhcixd0QOfw
         4zQQ==
X-Gm-Message-State: AGi0PuZZsBJ5BOjmUEHSdJ/Wcb5TzgsUNz9KcuESvAj2DHaGfKyNG1IB
        rlJ0tQCk+tRIgB+c9snUMQ==
X-Google-Smtp-Source: APiQypKw94zjMY8P6RGUuqMA7iJdKp3NfRS6OATP4++4t5HzwUuOnVidMzEwb/topSN5gRb/3iL5DQ==
X-Received: by 2002:a05:6808:3d1:: with SMTP id o17mr21394072oie.85.1589223628483;
        Mon, 11 May 2020 12:00:28 -0700 (PDT)
Received: from rob-hp-laptop (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id m16sm2984191oou.44.2020.05.11.12.00.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 May 2020 12:00:27 -0700 (PDT)
Received: (nullmailer pid 8113 invoked by uid 1000);
        Mon, 11 May 2020 19:00:27 -0000
Date:   Mon, 11 May 2020 14:00:27 -0500
From:   Rob Herring <robh@kernel.org>
To:     Sibi Sankar <sibis@codeaurora.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        mka@chromium.org, agross@kernel.org, evgreen@chromium.org,
        ohad@wizery.com, dianders@chromium.org,
        linux-remoteproc@vger.kernel.org, robh+dt@kernel.org,
        linux-kernel@vger.kernel.org, bjorn.andersson@linaro.org
Subject: Re: [PATCH v2 1/7] dt-bindings: remoteproc: qcom: Add SC7180 MPSS
 support
Message-ID: <20200511190027.GA7985@bogus>
References: <20200421143228.8981-1-sibis@codeaurora.org>
 <20200421143228.8981-2-sibis@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200421143228.8981-2-sibis@codeaurora.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, 21 Apr 2020 20:02:22 +0530, Sibi Sankar wrote:
> Add MPSS PAS support for SC7180 SoCs.
> 
> Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> Signed-off-by: Sibi Sankar <sibis@codeaurora.org>
> ---
>  Documentation/devicetree/bindings/remoteproc/qcom,adsp.txt | 3 +++
>  1 file changed, 3 insertions(+)
> 

Acked-by: Rob Herring <robh@kernel.org>
