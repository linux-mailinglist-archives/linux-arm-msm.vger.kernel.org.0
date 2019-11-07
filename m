Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5BAA9F2381
	for <lists+linux-arm-msm@lfdr.de>; Thu,  7 Nov 2019 01:48:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728235AbfKGAsQ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 6 Nov 2019 19:48:16 -0500
Received: from mail-oi1-f196.google.com ([209.85.167.196]:44060 "EHLO
        mail-oi1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728171AbfKGAsP (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 6 Nov 2019 19:48:15 -0500
Received: by mail-oi1-f196.google.com with SMTP id s71so412114oih.11;
        Wed, 06 Nov 2019 16:48:15 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=p5oAp4t/zh6IVUuk9DJ8OXTNyjbvylXZwV+1yY1gfzI=;
        b=E2SwRJLkUM8SCC1mfA9imolaj4ZSkUmnCGvMl67kzbcQPpznKE0Vqka2Kl/4sxb1TO
         H9snLWdWsCbudMTDAxuSQHTGIYiv+QxjFAKqXN2/MSrlvd+w3KwIUO3tmD9WUYerogb5
         7WapIr6cJ0UDWhqFpG61IUG2swZOGuQ82VO7X3KstmtKUOmWVgrccKX98gu6hxi5Z9m+
         nWyij2u7SIWQkSK1ZZlH9T66R/yUW7nX5X20w7ybHaiKyzq/AQtt1zsZ6GYc5BbQc3T3
         BizhKF9fQjo7sxzVRgxzNa/RjGTQTxLYTmOG2IWBOisw7r++CwCuopIx2YjJWfZ6fNXv
         NSNw==
X-Gm-Message-State: APjAAAWnEzv4bpDaURU+EiwEH2Lb5RiWYTrolpjisDGXHPkGZSVDMHLt
        TTb6iXJxSGdVMm4o6bV22g==
X-Google-Smtp-Source: APXvYqxqkl3PXVa5CNpouODahR2Kwh6WOpG9bj019/ZCljqo+eJ9uEWybASHTc9aq4j1Um+zZVThHA==
X-Received: by 2002:aca:5dc2:: with SMTP id r185mr809926oib.33.1573087694723;
        Wed, 06 Nov 2019 16:48:14 -0800 (PST)
Received: from localhost (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id y30sm149355oix.36.2019.11.06.16.48.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Nov 2019 16:48:13 -0800 (PST)
Date:   Wed, 6 Nov 2019 18:48:13 -0600
From:   Rob Herring <robh@kernel.org>
To:     Rajendra Nayak <rnayak@codeaurora.org>
Cc:     agross@kernel.org, robh+dt@kernel.org, bjorn.andersson@linaro.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, mka@chromium.org,
        swboyd@chromium.org, Rajendra Nayak <rnayak@codeaurora.org>,
        Vinod Koul <vkoul@kernel.org>
Subject: Re: [PATCH v4 01/14] dt-bindings: qcom: Add SC7180 bindings
Message-ID: <20191107004813.GA19605@bogus>
References: <20191106065017.22144-1-rnayak@codeaurora.org>
 <20191106065017.22144-2-rnayak@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191106065017.22144-2-rnayak@codeaurora.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed,  6 Nov 2019 12:20:04 +0530, Rajendra Nayak wrote:
> Add a SoC string 'sc7180' for the qualcomm SC7180 SoC.
> Also add a new board type 'idp'
> 
> Signed-off-by: Rajendra Nayak <rnayak@codeaurora.org>
> Reviewed-by: Vinod Koul <vkoul@kernel.org>
> ---
> v4: Added schema for sc7180 IDP board
> 
>  Documentation/devicetree/bindings/arm/qcom.yaml | 6 ++++++
>  1 file changed, 6 insertions(+)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
