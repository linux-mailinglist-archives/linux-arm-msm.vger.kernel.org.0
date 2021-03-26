Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E694D349DB9
	for <lists+linux-arm-msm@lfdr.de>; Fri, 26 Mar 2021 01:23:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230098AbhCZAWp (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 25 Mar 2021 20:22:45 -0400
Received: from mail-io1-f48.google.com ([209.85.166.48]:40613 "EHLO
        mail-io1-f48.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230210AbhCZAWo (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 25 Mar 2021 20:22:44 -0400
Received: by mail-io1-f48.google.com with SMTP id n21so3733643ioa.7;
        Thu, 25 Mar 2021 17:22:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=/Z9y5tszJooFvK4t9UwKKq6ZF4ZawJui8BA9xur9v4E=;
        b=iiXBVDQ5rY8FS/6T28VAfgM+ati+YN/042uXUpkrqcGnwo38zBoxmL6iivDqhrS0hX
         ffGXkrD2gHDOVmSn0d3Q+7owfWm5GHR7WlP4lzODQ78b37LVSv8dp3s7XIMS9/QeE6GG
         XNLL67kLROinVVF8yvWRcQ7zH6exFU03C3VV+w3BegYiKeUL4DjjlaQBNKhKes1DeWp8
         15YUtMBjn/ZWvHRPD1oF8lSD4WIHCcLF6JV2cl7xfSQNdjdQclkOvkar2tbW8rKmIRzM
         U6GamoVEE4bNSWhVQgnIRAO+fHw1QpU1+6ZCM053PAtCxRN86LBJ0hnrxi6/j/XPRLbq
         yHKg==
X-Gm-Message-State: AOAM533Jx12+laAKhj899FfoJLIZ8PTbXB+AktUnJNukUauNk+pSXrO1
        f2io+bt1JQFscZDUR5mo/g==
X-Google-Smtp-Source: ABdhPJwRixmNeNMk7cA7qKskUIITWXFr7CSBWCfKbeLHiTAOe7TUsklFN00KHczAUOfF6FEA3Aq7rg==
X-Received: by 2002:a5e:c908:: with SMTP id z8mr8427719iol.136.1616718163509;
        Thu, 25 Mar 2021 17:22:43 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.253])
        by smtp.gmail.com with ESMTPSA id o23sm3470287ioo.24.2021.03.25.17.22.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Mar 2021 17:22:42 -0700 (PDT)
Received: (nullmailer pid 2023409 invoked by uid 1000);
        Fri, 26 Mar 2021 00:22:39 -0000
Date:   Thu, 25 Mar 2021 18:22:39 -0600
From:   Rob Herring <robh@kernel.org>
To:     Sandeep Maheswaram <sanm@codeaurora.org>
Cc:     linux-phy@lists.infradead.org, Stephen Boyd <swboyd@chromium.org>,
        Vinod Koul <vkoul@kernel.org>,
        Doug Anderson <dianders@chromium.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        Manu Gautam <mgautam@codeaurora.org>,
        linux-usb@vger.kernel.org,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Wesley Cheng <wcheng@codeaurora.org>,
        Matthias Kaehlcke <mka@chromium.org>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        linux-kernel@vger.kernel.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [PATCH 1/3] dt-bindings: usb: qcom,dwc3: Add bindings for SC7280
Message-ID: <20210326002239.GA2022866@robh.at.kernel.org>
References: <1615978901-4202-1-git-send-email-sanm@codeaurora.org>
 <1615978901-4202-2-git-send-email-sanm@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1615978901-4202-2-git-send-email-sanm@codeaurora.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, 17 Mar 2021 16:31:39 +0530, Sandeep Maheswaram wrote:
> Add the compatible string for sc7280 SoC from Qualcomm.
> 
> Signed-off-by: Sandeep Maheswaram <sanm@codeaurora.org>
> ---
>  Documentation/devicetree/bindings/usb/qcom,dwc3.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 

Acked-by: Rob Herring <robh@kernel.org>
