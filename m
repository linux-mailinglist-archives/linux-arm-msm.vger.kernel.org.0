Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 076862F6AF5
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 Jan 2021 20:30:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726509AbhANTak (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 14 Jan 2021 14:30:40 -0500
Received: from mail-oo1-f50.google.com ([209.85.161.50]:38035 "EHLO
        mail-oo1-f50.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725781AbhANTak (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 14 Jan 2021 14:30:40 -0500
Received: by mail-oo1-f50.google.com with SMTP id i18so1640928ooh.5;
        Thu, 14 Jan 2021 11:30:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=b5khkTttCRV6xEewwgfTa+OQE8BKGtgueu8OCH3Y+jA=;
        b=tKuIsm2mS8zydZhl9s2yl2mJVT+Naesnq48abrF5+kk3rNnnIg556Ui6Els/KpMu81
         8K6+MRtjYQpw/X3iaDMgpHKtpjHAO8O9FXJWugEjHihgOtcZIZ1/RrknC6dTiVUVg6eq
         4RydMIpZdcDjN9MsgjztQxn+UOSFK0reClQcbZqiIVobthaVK7oFkFvyqM8lsiU79zL3
         UQz4VDAG8iIdeGXSwcNxWFZGVOK7OODnZTOyVNhjFiX9epEfVDqVUjYGz/ede0hDlUfk
         zPWNp6j4Alp/KA7d1S6UnVoxi+GIv1R6nAJMxW/slUjhbhW+oX776lfu6JSeDLJRa1q1
         edMg==
X-Gm-Message-State: AOAM533bx25fjQXcv8lx23Wf9MTumYws/gHwyWeT9uABPrkn7BGrogRL
        cLK7WGyJNAeHatdcXfmYpA==
X-Google-Smtp-Source: ABdhPJxXVazhZPUDi17HAz3tpnncSgDcMQkO/K+v3aY6Da9JAFj2JsJi3qaXFb8RRO/uevm+oSYm6A==
X-Received: by 2002:a4a:e687:: with SMTP id u7mr5723042oot.20.1610652599444;
        Thu, 14 Jan 2021 11:29:59 -0800 (PST)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id i126sm1212612oif.22.2021.01.14.11.29.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Jan 2021 11:29:58 -0800 (PST)
Received: (nullmailer pid 3430148 invoked by uid 1000);
        Thu, 14 Jan 2021 19:29:57 -0000
Date:   Thu, 14 Jan 2021 13:29:57 -0600
From:   Rob Herring <robh@kernel.org>
To:     Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc:     vkoul@kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, robh+dt@kernel.org,
        agross@kernel.org, kishon@ti.com, bjorn.andersson@linaro.org,
        devicetree@vger.kernel.org
Subject: Re: [PATCH v2 1/2] dt-bindings: phy: qcom,qmp: Add SDX55 USB PHY
 binding
Message-ID: <20210114192957.GA3430087@robh.at.kernel.org>
References: <20210111113010.32056-1-manivannan.sadhasivam@linaro.org>
 <20210111113010.32056-2-manivannan.sadhasivam@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210111113010.32056-2-manivannan.sadhasivam@linaro.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, 11 Jan 2021 17:00:09 +0530, Manivannan Sadhasivam wrote:
> Add devicetree YAML binding for Qualcomm QMP Super Speed (SS) PHY found
> in SDX55.
> 
> Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> ---
>  .../devicetree/bindings/phy/qcom,qmp-phy.yaml | 27 +++++++++++++++++++
>  1 file changed, 27 insertions(+)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
