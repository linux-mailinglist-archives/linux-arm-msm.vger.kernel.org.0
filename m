Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 436C9314678
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Feb 2021 03:36:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230499AbhBICfy (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 8 Feb 2021 21:35:54 -0500
Received: from mail-ot1-f49.google.com ([209.85.210.49]:32972 "EHLO
        mail-ot1-f49.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230492AbhBICfv (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 8 Feb 2021 21:35:51 -0500
Received: by mail-ot1-f49.google.com with SMTP id 63so16228081oty.0;
        Mon, 08 Feb 2021 18:35:35 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=Y5safjvRgj9GHHZ2zJi/YLqH2MR5Su17Tc9OO2lTlVg=;
        b=nEKZB9O3znyslG0I2CjgArMEvt42MV+8c4sg256DWbP7oc5oZc9YvNmj1lYgq8ZfZ8
         2snDOVQxCMduokk077LyFHDSrx64wrjfIAJl6AUVBbRlPXo9JM9yijSaNfwI3g4Af/H5
         My8VrcQbxjvbVTtcQ4tmQCO/X2lV0oDj6GOcWhOTgK2TBybxrd/ktqByvc2O4RIgIF+b
         6ICDDfdAJ4WhKTWF1EsQnvk+ZAJBqnhwGnrzWF6A51bh4xmbv+kS7cEIkllJM1OmDfrC
         9UyA07ImgGna7pqn0Z7X9xbM4EosPltuxVfh+lpRTpn8wt0hPQ7wLlLXbFH8JaCeRFp6
         mEpA==
X-Gm-Message-State: AOAM531Crc6LJEwVYgo4vda2kQ5Vnf4ccbrIKlP8xMFtgf8Ya0lglB5l
        jq9S8HoskebdDrGOEO8vOQ==
X-Google-Smtp-Source: ABdhPJyXe34B/dmmlH3wPlJGQks54kNwPrB5WXNEzTi0qCD5xvw++8dWBuOlbQ3uC5AlUfaa4UBAUQ==
X-Received: by 2002:a05:6830:22d5:: with SMTP id q21mr14567578otc.189.1612838110065;
        Mon, 08 Feb 2021 18:35:10 -0800 (PST)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id s33sm4001812ooi.39.2021.02.08.18.35.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Feb 2021 18:35:09 -0800 (PST)
Received: (nullmailer pid 2565809 invoked by uid 1000);
        Tue, 09 Feb 2021 02:35:08 -0000
Date:   Mon, 8 Feb 2021 20:35:08 -0600
From:   Rob Herring <robh@kernel.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Andy Gross <agross@kernel.org>, Ohad Ben-Cohen <ohad@wizery.com>,
        devicetree@vger.kernel.org,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh+dt@kernel.org>, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: remoteproc: qcom: pas: Add SC8180X
 adsp, cdsp and mpss
Message-ID: <20210209023508.GA2565753@robh.at.kernel.org>
References: <20210121014452.1612594-1-bjorn.andersson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210121014452.1612594-1-bjorn.andersson@linaro.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, 20 Jan 2021 17:44:51 -0800, Bjorn Andersson wrote:
> Add compatibles for the Audio DSP, Compute DSP and Modem subsystem found
> in the Qualcomm SC8180x to the Peripheral Authentication Service
> remoteproc binding.
> 
> Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> ---
>  Documentation/devicetree/bindings/remoteproc/qcom,adsp.txt | 3 +++
>  1 file changed, 3 insertions(+)
> 

Acked-by: Rob Herring <robh@kernel.org>
