Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 244DE34B8F6
	for <lists+linux-arm-msm@lfdr.de>; Sat, 27 Mar 2021 19:41:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230204AbhC0Sk6 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 27 Mar 2021 14:40:58 -0400
Received: from mail-ot1-f43.google.com ([209.85.210.43]:46856 "EHLO
        mail-ot1-f43.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230043AbhC0Skq (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 27 Mar 2021 14:40:46 -0400
Received: by mail-ot1-f43.google.com with SMTP id 68-20020a9d0f4a0000b02901b663e6258dso8358942ott.13;
        Sat, 27 Mar 2021 11:40:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=hHt6PSxrlHFs/TcsPOGzWyFozJfb4YaTzOg244cprjE=;
        b=YAFsPZmAqJGB/nfP4M+a5KDR174PgbeYvqVU09CHPVL8blECTFP4/Bg6WI604TIr29
         ZD6Pgf4xB72RGDijB+HFvYkTC33hBreZaI9s0714WB5XbDmCw5GHyk5qpP8j2WmELWSg
         n8V2hczz/PEBB5tApWnG2evMW0UckYGP3hC2zYYAzTzglmpo0tH0U8sZpv5YMpk0Wiu2
         lm2VxR3rhvlpATk494CEMohKZZDSXql2ltLpik3N9QdonObYejGC2w+hZa2ei+DZu9j0
         snP3hgCa3RHMKVJXFD5eCTXQy/p+TAXkcMXfft2leh5wNsVUZO1HrlA2Zed97+SWkewm
         oOEQ==
X-Gm-Message-State: AOAM533/ZOH4ZhH6PZycYRFCcukWV0rLtW8Fs8lIOtXCn9dTAOUDJTJo
        lfe3RciJ76nf0imLw9E8vQ==
X-Google-Smtp-Source: ABdhPJyN3tLELFbxWavkz9vFGFgUcTMuA/7U2r5Kqfl0QUUdPny5S4iCkI6TPSXAtlQo9uo1GnNXbg==
X-Received: by 2002:a05:6830:1658:: with SMTP id h24mr16035807otr.263.1616870445680;
        Sat, 27 Mar 2021 11:40:45 -0700 (PDT)
Received: from robh.at.kernel.org ([172.58.99.41])
        by smtp.gmail.com with ESMTPSA id x23sm2711566ood.28.2021.03.27.11.40.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 27 Mar 2021 11:40:44 -0700 (PDT)
Received: (nullmailer pid 365213 invoked by uid 1000);
        Sat, 27 Mar 2021 18:40:41 -0000
Date:   Sat, 27 Mar 2021 12:40:41 -0600
From:   Rob Herring <robh@kernel.org>
To:     Bartosz Dudziak <bartosz.dudziak@snejp.pl>
Cc:     Andy Gross <agross@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org,
        Michael Turquette <mturquette@baylibre.com>
Subject: Re: [PATCH 4/5] dt-bindings: arm: qcom: Document MSM8226 SoC binding
Message-ID: <20210327184041.GA365184@robh.at.kernel.org>
References: <20210326145816.9758-1-bartosz.dudziak@snejp.pl>
 <20210326145816.9758-5-bartosz.dudziak@snejp.pl>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210326145816.9758-5-bartosz.dudziak@snejp.pl>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, 26 Mar 2021 15:58:15 +0100, Bartosz Dudziak wrote:
> Document the MSM8226 SoC device-tree binding.
> 
> Signed-off-by: Bartosz Dudziak <bartosz.dudziak@snejp.pl>
> ---
>  Documentation/devicetree/bindings/arm/qcom.yaml | 6 ++++++
>  1 file changed, 6 insertions(+)
> 

Acked-by: Rob Herring <robh@kernel.org>
