Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5F82F1E32AC
	for <lists+linux-arm-msm@lfdr.de>; Wed, 27 May 2020 00:32:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2392184AbgEZWcz (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 26 May 2020 18:32:55 -0400
Received: from mail-il1-f193.google.com ([209.85.166.193]:46103 "EHLO
        mail-il1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2390326AbgEZWcy (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 26 May 2020 18:32:54 -0400
Received: by mail-il1-f193.google.com with SMTP id w18so22087878ilm.13;
        Tue, 26 May 2020 15:32:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=928GpvkLEJh+YGMSyYO49uiM+aTF3bi6DMzRK99UBSU=;
        b=fXHfq4fvZMKDKTdUDV2lBn3ValUW9Tb4tGP1b9KoE51z5we3dX46MAvh4WEIzklKfB
         3OwV7OHiK61981A2uzDc8eMR2LkImDDji3kZh+OHv7CcoNge1NUTiOybayOmNUvft3WK
         odm3KRjeNVHQiLRf4aar11rTHl0x9/uPSnbKigCxZVmuxhIYAff07laEYchZKP70BX9B
         Nugf6ALLraJ1+x4tfVF3wUI/mxfOGiNkRCY2d/uKqdetfZuOHzgZTygne6+70Azu3JDx
         pSyEzzltj2mF4kvg3k9EmkH3mSEfUSy0uElVZ4fTiy36lwOEVifiEhhWfXkX9fxIucsv
         jVEg==
X-Gm-Message-State: AOAM532MTLQVixkYgoa6PrNhkiq9OEeBT4C4DBT70oBS+MvwrKmhVJ+H
        JVj0OEmMPRHVjviyo0P34Ku0p+U=
X-Google-Smtp-Source: ABdhPJwUHVDK3hBsS63DM8ukfIZHbC24RoZDf2tPj4rnmICEFfuERSeT0Sf9QQ8cqdWT8nlSDlDqDQ==
X-Received: by 2002:a05:6e02:68d:: with SMTP id o13mr3406469ils.230.1590532373005;
        Tue, 26 May 2020 15:32:53 -0700 (PDT)
Received: from xps15 ([64.188.179.252])
        by smtp.gmail.com with ESMTPSA id p75sm502306ilb.23.2020.05.26.15.32.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 May 2020 15:32:52 -0700 (PDT)
Received: (nullmailer pid 506665 invoked by uid 1000);
        Tue, 26 May 2020 22:32:51 -0000
Date:   Tue, 26 May 2020 16:32:51 -0600
From:   Rob Herring <robh@kernel.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, Ohad Ben-Cohen <ohad@wizery.com>,
        linux-remoteproc@vger.kernel.org,
        Stephen Boyd <swboyd@chromium.org>,
        Andy Gross <agross@kernel.org>,
        Rob Herring <robh+dt@kernel.org>
Subject: Re: [PATCH v5 1/5] dt-bindings: remoteproc: Add Qualcomm PIL info
 binding
Message-ID: <20200526223251.GA506612@bogus>
References: <20200513055641.1413100-1-bjorn.andersson@linaro.org>
 <20200513055641.1413100-2-bjorn.andersson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200513055641.1413100-2-bjorn.andersson@linaro.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, 12 May 2020 22:56:37 -0700, Bjorn Andersson wrote:
> Add a devicetree binding for the Qualcomm peripheral image loader
> relocation information region found in the IMEM.
> 
> Reviewed-by: Stephen Boyd <swboyd@chromium.org>
> Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> ---
> 
> Changes since v4:
> - Fixed reg in example to make it compile
> 
>  .../bindings/remoteproc/qcom,pil-info.yaml    | 44 +++++++++++++++++++
>  1 file changed, 44 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/remoteproc/qcom,pil-info.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>
