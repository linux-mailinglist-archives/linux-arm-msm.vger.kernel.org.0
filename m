Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 519EC21E572
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Jul 2020 04:09:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726150AbgGNCJi (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 13 Jul 2020 22:09:38 -0400
Received: from mail-il1-f193.google.com ([209.85.166.193]:41404 "EHLO
        mail-il1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726149AbgGNCJi (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 13 Jul 2020 22:09:38 -0400
Received: by mail-il1-f193.google.com with SMTP id q3so12959121ilt.8;
        Mon, 13 Jul 2020 19:09:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=KPcWWEFayVvDQVr24WFW0Iat95lCbS98CRPSzZcM2HA=;
        b=SFw4/AYH1AOcgtAYPf/CYXijucCTKs8V3pYvuOoGzFYnnC7dL4IWKNgcNXqGig9SYG
         2UAzJH6bSCRKaLV7lqepn4A8Iu5snRSgJyDZvXpCUW+9aC7CXtXcZzpoK2SZc9hz73e4
         usXczK10ylDV/UlDan+yWVJwXbwrPdZC+Zzvwt/WWPzAufzMfUQk1Sb1tAhAv7ZSxHFv
         w8io4QeYjJmPNQHDjTIoS7mX1Mx9AUaDhbgsIu76StJSnYsxpBScNO4X6iT+NVrwCdjf
         LN4oVQHlVbPCjxusTSRTKzFUj0pQ5DrahopfOHOxvv7YiHASbwoMONXnY4JnCUGGpAJp
         w6rA==
X-Gm-Message-State: AOAM533bosifZDzRHTrmwdqk1KlevyfjHmRGZTcTFFF4Wfz/K5KEteue
        7sDKEBt3gtShBSaYykEydg==
X-Google-Smtp-Source: ABdhPJzQQad0wTSDAMPA9ATJ9hA1u98WVgnzC9LLhonu5X2eHqH93+QPB4bNhmGqkdB13vmALMiaJw==
X-Received: by 2002:a05:6e02:14c2:: with SMTP id o2mr2669736ilk.54.1594692576834;
        Mon, 13 Jul 2020 19:09:36 -0700 (PDT)
Received: from xps15 ([64.188.179.252])
        by smtp.gmail.com with ESMTPSA id i84sm9534158ill.30.2020.07.13.19.09.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2020 19:09:36 -0700 (PDT)
Received: (nullmailer pid 1132789 invoked by uid 1000);
        Tue, 14 Jul 2020 02:09:35 -0000
Date:   Mon, 13 Jul 2020 20:09:35 -0600
From:   Rob Herring <robh@kernel.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Baolin Wang <baolin.wang7@gmail.com>,
        linux-arm-msm@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
        Vinod Koul <vkoul@kernel.org>, linux-kernel@vger.kernel.org,
        Ohad Ben-Cohen <ohad@wizery.com>,
        linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
        Andy Gross <agross@kernel.org>
Subject: Re: [PATCH v2 1/4] dt-bindings: hwlock: qcom: Migrate binding to YAML
Message-ID: <20200714020935.GA1122169@bogus>
References: <20200622075956.171058-1-bjorn.andersson@linaro.org>
 <20200622075956.171058-2-bjorn.andersson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200622075956.171058-2-bjorn.andersson@linaro.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, 22 Jun 2020 00:59:53 -0700, Bjorn Andersson wrote:
> Migrate the Qualcomm TCSR mutex binding to YAML to allow validation.
> 
> Reviewed-by: Vinod Koul <vkoul@kernel.org>
> Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> ---
> 
> Changes since v1:
> - Actually remove the old binding doc
> 
>  .../bindings/hwlock/qcom-hwspinlock.txt       | 39 --------------
>  .../bindings/hwlock/qcom-hwspinlock.yaml      | 51 +++++++++++++++++++
>  2 files changed, 51 insertions(+), 39 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/hwlock/qcom-hwspinlock.txt
>  create mode 100644 Documentation/devicetree/bindings/hwlock/qcom-hwspinlock.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>
