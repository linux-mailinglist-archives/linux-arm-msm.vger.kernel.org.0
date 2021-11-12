Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B06ED44ECB9
	for <lists+linux-arm-msm@lfdr.de>; Fri, 12 Nov 2021 19:42:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235571AbhKLSow (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 12 Nov 2021 13:44:52 -0500
Received: from mail-ot1-f52.google.com ([209.85.210.52]:44958 "EHLO
        mail-ot1-f52.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229892AbhKLSov (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 12 Nov 2021 13:44:51 -0500
Received: by mail-ot1-f52.google.com with SMTP id u18-20020a9d7212000000b00560cb1dc10bso15144593otj.11;
        Fri, 12 Nov 2021 10:42:00 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=vcgR1nbufCoCbRuAa8zswFRoB//aqIyQ2E43eUuCpvY=;
        b=iZW6N1pSoMuApese+yWGKnDLezceqYi7BAxMKdf3IpoMSv0YTqYdF8NfiYVfQrYAvo
         UmZRIfChn8ZN51Oa8J63Q/FhSckYLAZ8JyrwiEqK/cMm9Pn+EeO/szRdQrm59Un349O+
         p7X29hL5foZ5Ih849zyxeVHnCJrO/+1qtuNrpk6eao3UbJ8dKtd2PIINrbG/hb7Jgqtd
         OhVKvvM4vfqZ32+TrfR27YcWbBOmbg70O3GJFIdQyaMG5VAyUfUpaG4U+jfnUfaqwMDQ
         3VGxlNIet7Q44Xz/JA5S+88CkxLXw5NDgSLfAQSJyLSbXGTlbZD0KuhbUQKgXNWg/hXu
         9WDQ==
X-Gm-Message-State: AOAM53243QDr+jtZGq/f3bHsJVBreHEiFopmMFO6AVsLSwuJlFjekaNH
        mTdAygTMnfsv/xlrG33D8A==
X-Google-Smtp-Source: ABdhPJzFnFwbxtWBlX5ksSuUmXfL7XL/+HW0ccs5ZAZrL43wYYjI/Yi9v/+FK15zydRYZgg+WFgiSg==
X-Received: by 2002:a05:6830:25c2:: with SMTP id d2mr10917364otu.51.1636742520434;
        Fri, 12 Nov 2021 10:42:00 -0800 (PST)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net. [66.90.148.213])
        by smtp.gmail.com with ESMTPSA id e2sm1187521ooh.40.2021.11.12.10.41.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Nov 2021 10:41:59 -0800 (PST)
Received: (nullmailer pid 3152154 invoked by uid 1000);
        Fri, 12 Nov 2021 18:41:58 -0000
Date:   Fri, 12 Nov 2021 12:41:58 -0600
From:   Rob Herring <robh@kernel.org>
To:     Rakesh Pillai <pillair@codeaurora.org>
Cc:     ohad@wizery.com, agross@kernel.org, swboyd@chromium.org,
        bjorn.andersson@linaro.org, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, mpubbise@codeaurora.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        sibis@codeaurora.org, kuabhs@chromium.org, robh+dt@kernel.org,
        p.zabel@pengutronix.de, mathieu.poirier@linaro.org
Subject: Re: [PATCH v8 2/3] dt-bindings: remoteproc: qcom: Add SC7280 WPSS
 support
Message-ID: <YY61dp43htii+Nk0@robh.at.kernel.org>
References: <1635860673-12146-1-git-send-email-pillair@codeaurora.org>
 <1635860673-12146-3-git-send-email-pillair@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1635860673-12146-3-git-send-email-pillair@codeaurora.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, 02 Nov 2021 19:14:32 +0530, Rakesh Pillai wrote:
> Add WPSS PIL loading support for SC7280 SoCs.
> 
> Signed-off-by: Rakesh Pillai <pillair@codeaurora.org>
> ---
>  .../bindings/remoteproc/qcom,sc7280-wpss-pil.yaml  | 217 +++++++++++++++++++++
>  1 file changed, 217 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/remoteproc/qcom,sc7280-wpss-pil.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>
