Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F06CB365BD4
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 Apr 2021 17:05:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232627AbhDTPFX (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 20 Apr 2021 11:05:23 -0400
Received: from mail-oi1-f180.google.com ([209.85.167.180]:46075 "EHLO
        mail-oi1-f180.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231758AbhDTPFW (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 20 Apr 2021 11:05:22 -0400
Received: by mail-oi1-f180.google.com with SMTP id n184so13210556oia.12;
        Tue, 20 Apr 2021 08:04:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=/40Ife2HakA3yCHKOMukbL0H3dwMZMqE/U8mfbjnhGc=;
        b=shw0oHQOm/3Pwoiu4E7XBADLxcbCTFm01MOf3SXgDH+cuBVhc8QQBInk4OURjXJR5X
         yFMrFvbRj/DFMut8zfS7TRI7yE1h4rNhGk49RmLrNIT5wLx3DAfWFjCPDtCs5DboQlvb
         w8ht4N7PqoBrpj2F07muxE58DD7dLRaKyn8UutBNB9xkasquOmClbj+Q8OER++I4ajp3
         IkHOEx7an27t70ivCOhxP0WZ0oHA0wu1GgW5umCbqZbAmWeJgkxYvirf6xkACMZ+x+3j
         o+H3YgjUI0xXOE7PNX8q2mT4crk7eLXpCW+VEQDEiLF+cPdybuXfDMpgX2X4gc/JEdIv
         wM6w==
X-Gm-Message-State: AOAM531jKjtS/TQWMC6lpfkLmyiF7nZDncqvs/ZhRe8p/LQg7yE3Mofr
        /3Ntu9wSN4H+7c86MYFCxA==
X-Google-Smtp-Source: ABdhPJzouKpQCUm3M9KEZYxnvvmG0zz9zp/Nnsm4o5hzipfuqdCueXkBB567FHAuHLcRgoMW1K0rxQ==
X-Received: by 2002:aca:5909:: with SMTP id n9mr3360379oib.66.1618931088906;
        Tue, 20 Apr 2021 08:04:48 -0700 (PDT)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id b22sm4331286ots.59.2021.04.20.08.04.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Apr 2021 08:04:47 -0700 (PDT)
Received: (nullmailer pid 3325942 invoked by uid 1000);
        Tue, 20 Apr 2021 15:04:46 -0000
Date:   Tue, 20 Apr 2021 10:04:46 -0500
From:   Rob Herring <robh@kernel.org>
To:     Bartosz Dudziak <bartosz.dudziak@snejp.pl>
Cc:     Rob Herring <robh+dt@kernel.org>, Andy Gross <agross@kernel.org>,
        linux-kernel@vger.kernel.org,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-clk@vger.kernel.org
Subject: Re: [PATCH v2 4/5] dt-bindings: arm: qcom: Document MSM8226 SoC
 binding
Message-ID: <20210420150446.GA3325677@robh.at.kernel.org>
References: <20210418122909.71434-1-bartosz.dudziak@snejp.pl>
 <20210418122909.71434-5-bartosz.dudziak@snejp.pl>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210418122909.71434-5-bartosz.dudziak@snejp.pl>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Sun, 18 Apr 2021 14:29:08 +0200, Bartosz Dudziak wrote:
> Document the MSM8226 SoC device-tree binding.
> 
> Signed-off-by: Bartosz Dudziak <bartosz.dudziak@snejp.pl>
> ---
>  Documentation/devicetree/bindings/arm/qcom.yaml | 6 ++++++
>  1 file changed, 6 insertions(+)
> 

Acked-by: Rob Herring <robh@kernel.org>
