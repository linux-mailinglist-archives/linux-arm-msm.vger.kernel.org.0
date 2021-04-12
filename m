Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C066935D126
	for <lists+linux-arm-msm@lfdr.de>; Mon, 12 Apr 2021 21:37:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239085AbhDLTgo (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 12 Apr 2021 15:36:44 -0400
Received: from mail-oi1-f179.google.com ([209.85.167.179]:41737 "EHLO
        mail-oi1-f179.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237770AbhDLTgn (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 12 Apr 2021 15:36:43 -0400
Received: by mail-oi1-f179.google.com with SMTP id x77so5207895oix.8;
        Mon, 12 Apr 2021 12:36:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=mvZBgfD16wXr6/2myqQH4t74jres/dZXoAcUjt/m7A8=;
        b=ETnCcJyl7DH3i5M4bq0wKquouVE7n1PacBLNoWWXx21ncEgfnsCST8D510pf+l2mqr
         X2jsS28r5lsJtdofrVsM6aBvLBO49OqS/7UuoCqrV70QQYRzZqadmtp6mN06W1o2buNK
         h75t3x4yZXIB6zsM3dW9XCtOF63PJscY3ADGS/1aM+9wTykaPiiKCH2BlzOcVQSbwWjQ
         9xTerjK2TnZMZTIoL+4cgjf2s+ogZORiiag+9eLhEj39c4oA4lr6605FPUJzFYP1bLH0
         kLdAl78sdShRwcPOgpWM7jrpzke61v1OleYF5LupCfzgGcYYvwtVfU3nZJk9hWMn1l4b
         tkWg==
X-Gm-Message-State: AOAM5329XctTOfVyo4VWY3LAeYacW9BMim+bi4JZ8+zo09HRcXKDKnIu
        ul53AKmEAAMM7cN4jYElhA==
X-Google-Smtp-Source: ABdhPJxKWddlgQ6qEl4npwvwhGxkKQ1LDHDx2zNYxknUhI2wZoE80IJk9tVtedzXAHOgrVls0q1a0A==
X-Received: by 2002:aca:ebd7:: with SMTP id j206mr604893oih.60.1618256184308;
        Mon, 12 Apr 2021 12:36:24 -0700 (PDT)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id x127sm2370110oix.36.2021.04.12.12.36.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Apr 2021 12:36:23 -0700 (PDT)
Received: (nullmailer pid 52928 invoked by uid 1000);
        Mon, 12 Apr 2021 19:36:17 -0000
Date:   Mon, 12 Apr 2021 14:36:17 -0500
From:   Rob Herring <robh@kernel.org>
To:     Guru Das Srinagesh <gurus@codeaurora.org>
Cc:     linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Lee Jones <lee.jones@linaro.org>, devicetree@vger.kernel.org,
        Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH v2 1/3] dt-bindings: mfd: pm8008: Add IRQ listing
Message-ID: <20210412193617.GA52875@robh.at.kernel.org>
References: <cover.1618015804.git.gurus@codeaurora.org>
 <d384009747961c04643a72ce3fc1b1aeca20d226.1618015804.git.gurus@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d384009747961c04643a72ce3fc1b1aeca20d226.1618015804.git.gurus@codeaurora.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, 09 Apr 2021 17:55:00 -0700, Guru Das Srinagesh wrote:
> Add a header file listing all of the IRQs that Qualcomm Technologies,
> Inc. PM8008 supports. The constants defined in this file may be used in
> the client device tree node to specify interrupts.
> 
> Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> Signed-off-by: Guru Das Srinagesh <gurus@codeaurora.org>
> ---
>  include/dt-bindings/mfd/qcom-pm8008.h | 19 +++++++++++++++++++
>  1 file changed, 19 insertions(+)
>  create mode 100644 include/dt-bindings/mfd/qcom-pm8008.h
> 

Acked-by: Rob Herring <robh@kernel.org>
