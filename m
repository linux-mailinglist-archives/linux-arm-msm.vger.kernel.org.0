Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 89CFE111B31
	for <lists+linux-arm-msm@lfdr.de>; Tue,  3 Dec 2019 22:55:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727516AbfLCVzK (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 3 Dec 2019 16:55:10 -0500
Received: from mail-oi1-f194.google.com ([209.85.167.194]:38162 "EHLO
        mail-oi1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727416AbfLCVzK (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 3 Dec 2019 16:55:10 -0500
Received: by mail-oi1-f194.google.com with SMTP id b8so4871430oiy.5;
        Tue, 03 Dec 2019 13:55:09 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=0HvGbtnOazLxYckIyLhbnt3XVOBEg9RbKR2LsgS5T48=;
        b=qp6VhJBcfo7dEnAUx4Z1kBW9paMmJ4D0nT/INAC+NnORMIKH/xktYb2JubsKy5LbYx
         QCcZrbrG0Dg1Uz9WIkGj47CgYCZtpjz7p/127k1rWx2pNKWAcLzx+vKb8+y7lanNRd9P
         6gWJoMOGrgVDQfvbQ594KlRQobZU3LdG5ipn7mTACYBSW0HL8xFY4VePPq9tGWVzwGET
         QtGP4qI2CKk82wpdJPrOYawUbRk+h/grd0HCoSWYLQFJ612Jfm+ph5gyPKsk+AubPlmP
         lJNDXNODUddv+FjSn9ViFg6caRsuGPhR9i0SWMQIfSYqLwJsI5kCFjohJWjsGP2VDMco
         BmhA==
X-Gm-Message-State: APjAAAVUEtdQ+Ys62yAroQYh3ESHiLhUPwlTXtUq/73HgVdoHsEuy6Iw
        xy58Y+b1vdQ5Nglc97BIrw==
X-Google-Smtp-Source: APXvYqxkIyItpuiIfEJzTZtNQt+zEm8pQYJoudw3fHuAg69JNZxr2sy0KkuEyQEtwrd7zXtE9jAFkw==
X-Received: by 2002:aca:d985:: with SMTP id q127mr142266oig.132.1575410109361;
        Tue, 03 Dec 2019 13:55:09 -0800 (PST)
Received: from localhost (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id l32sm1487033otl.74.2019.12.03.13.55.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Dec 2019 13:55:08 -0800 (PST)
Date:   Tue, 3 Dec 2019 15:55:08 -0600
From:   Rob Herring <robh@kernel.org>
To:     Sibi Sankar <sibis@codeaurora.org>
Cc:     bjorn.andersson@linaro.org, robh+dt@kernel.org,
        ulf.hansson@linaro.org, rnayak@codeaurora.org, agross@kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, mark.rutland@arm.com,
        swboyd@chromium.org, dianders@chromium.org,
        Sibi Sankar <sibis@codeaurora.org>
Subject: Re: [PATCH 4/6] dt-bindings: power: Add rpmh power-domain bindings
 for sc7180
Message-ID: <20191203215508.GA12365@bogus>
References: <20191118173944.27043-1-sibis@codeaurora.org>
 <0101016e7f99ca6c-a46ce88b-3c42-4222-8873-6cf0843b106f-000000@us-west-2.amazonses.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0101016e7f99ca6c-a46ce88b-3c42-4222-8873-6cf0843b106f-000000@us-west-2.amazonses.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, 18 Nov 2019 17:40:15 +0000, Sibi Sankar wrote:
> Add RPMH power-domain bindings for the SC7180 family of SoCs.
> 
> Signed-off-by: Sibi Sankar <sibis@codeaurora.org>
> ---
>  Documentation/devicetree/bindings/power/qcom,rpmpd.txt |  1 +
>  include/dt-bindings/power/qcom-rpmpd.h                 | 10 ++++++++++
>  2 files changed, 11 insertions(+)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
