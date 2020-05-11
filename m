Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EA5C51CE378
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 May 2020 21:00:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731198AbgEKTAw (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 11 May 2020 15:00:52 -0400
Received: from mail-ot1-f66.google.com ([209.85.210.66]:37402 "EHLO
        mail-ot1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729215AbgEKTAw (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 11 May 2020 15:00:52 -0400
Received: by mail-ot1-f66.google.com with SMTP id z17so8457977oto.4;
        Mon, 11 May 2020 12:00:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=j7xRIk08LHaTIuVFVtGkI3fwGt5b1JCXDy7E9EOvWFM=;
        b=WCILvaf1UV3BfgbifA5qXpPDB8rqff3oE+CiRsNdI8sgVfdMjXe8xv/nqq2J/bK8/Z
         jC4p3V2Hjzf8dyzz3blc6G7aJPrS7MxpLpuGZfK467gr1A9HSdKZxlBBmXxVvheXvCMN
         D4GYE8vvqi/rfxguQSY2T0tdaziMGCUCkwX1qL/W+dhrQ0Ia1TGmo26QI42b6CSI4K1+
         metRcD53fyZFIT3uRSpC+dqDmmukFqgZRdFl162qz8Aya4sVFF+g8Bh6PZpVqoyBS3Fv
         oeSPD9NqVyhJ621cttkvFQ+MrjJqUi4uT/v/y/G+AwaNvSR8yWJ3fDAKqSOjr09O0iR2
         n3yg==
X-Gm-Message-State: AGi0PuYodtNx9ol6dShBc/sFDxm8Lerw8y2g9h3volf2RgVQh8xUoAgF
        epkejHelNEbpsiAcZ0099Q==
X-Google-Smtp-Source: APiQypK4m+nEx51SAOpCo4hXspoWSJO375okq4FXdsc/DLg4tc2+uL6CuiP0XGg8DZ3PkTTIbfCRXQ==
X-Received: by 2002:a9d:6c48:: with SMTP id g8mr12906647otq.226.1589223651507;
        Mon, 11 May 2020 12:00:51 -0700 (PDT)
Received: from rob-hp-laptop (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id 43sm2883948otv.36.2020.05.11.12.00.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 May 2020 12:00:50 -0700 (PDT)
Received: (nullmailer pid 8731 invoked by uid 1000);
        Mon, 11 May 2020 19:00:50 -0000
Date:   Mon, 11 May 2020 14:00:50 -0500
From:   Rob Herring <robh@kernel.org>
To:     Sibi Sankar <sibis@codeaurora.org>
Cc:     linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        dianders@chromium.org, agross@kernel.org, mka@chromium.org,
        bjorn.andersson@linaro.org, robh+dt@kernel.org,
        linux-remoteproc@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        evgreen@chromium.org, ohad@wizery.com
Subject: Re: [PATCH v2 3/7] dt-bindings: remoteproc: qcom: Use memory-region
 to reference memory
Message-ID: <20200511190050.GA8671@bogus>
References: <20200421143228.8981-1-sibis@codeaurora.org>
 <20200421143228.8981-4-sibis@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200421143228.8981-4-sibis@codeaurora.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, 21 Apr 2020 20:02:24 +0530, Sibi Sankar wrote:
> Use memory-region property to reference mba and mpss memory regions.
> 
> Signed-off-by: Sibi Sankar <sibis@codeaurora.org>
> ---
>  .../devicetree/bindings/remoteproc/qcom,q6v5.txt          | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
