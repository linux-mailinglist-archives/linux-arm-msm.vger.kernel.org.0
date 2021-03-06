Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A619F32FD3D
	for <lists+linux-arm-msm@lfdr.de>; Sat,  6 Mar 2021 21:54:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229642AbhCFUsI (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 6 Mar 2021 15:48:08 -0500
Received: from mail-qv1-f49.google.com ([209.85.219.49]:45121 "EHLO
        mail-qv1-f49.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229597AbhCFUrs (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 6 Mar 2021 15:47:48 -0500
Received: by mail-qv1-f49.google.com with SMTP id s17so2761284qvr.12;
        Sat, 06 Mar 2021 12:47:47 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=USA6yGPFLU+Kfx6KrvY7RmblXm9+Tds9Q8SW8BMwarA=;
        b=OmGgX8xMD1VS+mC4MnZqkULv4kYPn6iyqO6KYRK1hM9UXgX8VQqXUodobeDxAuYOKx
         W0RDaBk2jPC9xjMGX7auwZi8YvXFp+Yz0MLSsgxgJBM9lQUttFYb3Wwl2IhEpu7hmrP1
         vdXCA4lFEWk3tZP5h6wMEhNDZkreUOjxAFoEWcD8Cr9+M/5V247/sqhV8BnGNHfh0Fan
         t6eF6iYQtBEl6znh4N7/3vlYW8ZhXgjcZKBwPGfM3+NWT+Sbi8PJM8zMNckgZLpbYnhd
         fnjuel2UfATquyG9C2YayJp1ICy234YwJ3ormyTbaYFq7d27hY+uKSSMp85GSnwJ96CC
         5LLw==
X-Gm-Message-State: AOAM530hcVWuaue5Be6IgsvbJUUnjiwSpEaNS3EGJb7ohwppxN+UpHF5
        ismlaAsNSd0IWpeDi14i2g==
X-Google-Smtp-Source: ABdhPJwyIGRqqmtCL9lgb3ALX6ri+HOiRo/Cw2B2IDPZRcumiy9u87rmdB7d8I/fg5ZMQDtcb9H6cQ==
X-Received: by 2002:a0c:b92c:: with SMTP id u44mr14884260qvf.34.1615063667525;
        Sat, 06 Mar 2021 12:47:47 -0800 (PST)
Received: from robh.at.kernel.org ([172.58.27.98])
        by smtp.gmail.com with ESMTPSA id t128sm4611003qka.46.2021.03.06.12.47.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 06 Mar 2021 12:47:46 -0800 (PST)
Received: (nullmailer pid 1187854 invoked by uid 1000);
        Sat, 06 Mar 2021 20:47:40 -0000
Date:   Sat, 6 Mar 2021 13:47:40 -0700
From:   Rob Herring <robh@kernel.org>
To:     Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
Cc:     linux-arm-kernel@lists.infradead.org,
        Sibi Sankar <sibis@codeaurora.org>,
        Rajendra Nayak <rnayak@codeaurora.org>,
        Andy Gross <agross@kernel.org>,
        Stephen Boyd <swboyd@chromium.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/9] dt-bindings: arm: msm: Add LLCC for SC7280
Message-ID: <20210306204740.GA1187806@robh.at.kernel.org>
References: <cover.1614244789.git.saiprakash.ranjan@codeaurora.org>
 <f3b32d437d7c1165a74ceec2cd52ff56b496e5a3.1614244789.git.saiprakash.ranjan@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f3b32d437d7c1165a74ceec2cd52ff56b496e5a3.1614244789.git.saiprakash.ranjan@codeaurora.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, 25 Feb 2021 15:00:17 +0530, Sai Prakash Ranjan wrote:
> Add LLCC compatible for SC7280 SoC.
> 
> Signed-off-by: Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
> ---
>  Documentation/devicetree/bindings/arm/msm/qcom,llcc.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 

Acked-by: Rob Herring <robh@kernel.org>
