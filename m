Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 385A934B89D
	for <lists+linux-arm-msm@lfdr.de>; Sat, 27 Mar 2021 18:50:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230126AbhC0Rtk (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 27 Mar 2021 13:49:40 -0400
Received: from mail-ot1-f53.google.com ([209.85.210.53]:38431 "EHLO
        mail-ot1-f53.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230043AbhC0RtY (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 27 Mar 2021 13:49:24 -0400
Received: by mail-ot1-f53.google.com with SMTP id w21-20020a9d63950000b02901ce7b8c45b4so8316292otk.5;
        Sat, 27 Mar 2021 10:49:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=TxaunK5j0AXYmEl9gm7hQTywtQwjsTwkNENu1sYzuWg=;
        b=kGUa3xLeHKpsNE6JO0MAs4CNFEj+h4zwLUKL35e/YtXZIHENneyatwiMeXZKTaFdli
         wy4y3gf+7Oo1kfc5VbKfFC5UNKpx9aIoXZlhIROM9yQxL4hUAdrAnu3GjeGjxdvt73fN
         KW242ZILlCBgswxeHe+F+TcV6QuHQVoPCFLC72Xlmuqyz0WQpP8Eqq8dt7YdSMK2BcW7
         ossLlTgLDnmpIo7s5ziCQkjnHExrr9fVDSWH9OhrKcGN2LwD5VR/kARL6KmHlF95wyRr
         vKT42ZigeNtDQf2Dp2nsKmob+AcprmzEE8LgmMrRDpUR+Z83sCLAIgF73if6gc8a6GEj
         ylXQ==
X-Gm-Message-State: AOAM532xRBk6sQKzlmiIMiCmUqtPjzffCt+l4F86qqOVDQrFOhZX7Bxy
        BwKC5UlyrnJr20ZdINt2jrQXhUAc4A==
X-Google-Smtp-Source: ABdhPJzInKw7gY5QxpVn3hB/WrPt6eoCS2xzvi8DJ9n9ZJu/bkCOiGOmJa+fuqSeP7GNmqUCWofv8A==
X-Received: by 2002:a05:6830:210e:: with SMTP id i14mr16544186otc.229.1616867364377;
        Sat, 27 Mar 2021 10:49:24 -0700 (PDT)
Received: from robh.at.kernel.org ([172.58.107.88])
        by smtp.gmail.com with ESMTPSA id c25sm3106350otk.35.2021.03.27.10.49.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 27 Mar 2021 10:49:23 -0700 (PDT)
Received: (nullmailer pid 309331 invoked by uid 1000);
        Sat, 27 Mar 2021 17:49:20 -0000
Date:   Sat, 27 Mar 2021 11:49:20 -0600
From:   Rob Herring <robh@kernel.org>
To:     Souradeep Chowdhury <schowdhu@codeaurora.org>
Cc:     linux-arm-kernel@lists.infradead.org,
        Rajendra Nayak <rnayak@codeaurora.org>,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>,
        Sibi Sankar <sibis@codeaurora.org>, vkoul@kernel.org,
        Rob Herring <robh+dt@kernel.org>,
        Andy Gross <agross@kernel.org>
Subject: Re: [PATCH V2 1/5] dt-bindings: Added the yaml bindings for DCC
Message-ID: <20210327174920.GA309261@robh.at.kernel.org>
References: <cover.1616651305.git.schowdhu@codeaurora.org>
 <5cd274f98b38d4b85c1ce212720b6b680f4a00f0.1616651305.git.schowdhu@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5cd274f98b38d4b85c1ce212720b6b680f4a00f0.1616651305.git.schowdhu@codeaurora.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, 25 Mar 2021 13:32:32 +0530, Souradeep Chowdhury wrote:
> Documentation for Data Capture and Compare(DCC) device tree bindings
> in yaml format.
> 
> Signed-off-by: Souradeep Chowdhury <schowdhu@codeaurora.org>
> ---
>  .../devicetree/bindings/arm/msm/qcom,dcc.yaml      | 49 ++++++++++++++++++++++
>  1 file changed, 49 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/arm/msm/qcom,dcc.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>
