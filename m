Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 21C29131B00
	for <lists+linux-arm-msm@lfdr.de>; Mon,  6 Jan 2020 23:06:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726895AbgAFWF7 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 6 Jan 2020 17:05:59 -0500
Received: from mail-ot1-f66.google.com ([209.85.210.66]:46501 "EHLO
        mail-ot1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726742AbgAFWF7 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 6 Jan 2020 17:05:59 -0500
Received: by mail-ot1-f66.google.com with SMTP id r9so219058otp.13
        for <linux-arm-msm@vger.kernel.org>; Mon, 06 Jan 2020 14:05:58 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=dOrlWUldD83XBK01h071I64wECD6WdEMkunkhAq43Js=;
        b=Xl487YkWxuXFn02B2wm29goMTChsjj6RF9dmxjHAe3sMW6treSSuP3Ol7cFHRShfvb
         CgeQkD8xgNoC0UK0JLlj0cgMdBpeX6HAShofSz1RrrVMcDUGsbIdB0bumx3rBpLxgslU
         6vtIVUtzcmR4MgobS0dNmFcGUkBt1LIyjjuWwo5d1H2okyjd0SdwKdJqjtXC605HNirH
         758fmK7GWcihg8r1OQmPeLpOYuqbCvCXVkKdNMXFzLAHPaJbpmNrRwSWw/E445FHxppX
         KeC4WrzAfI7WSz0foLLHws6mckI9VH5ahwVIkQF4+ZpvLfdDaojc+GvLMuwN9PRw1Vbl
         EOhA==
X-Gm-Message-State: APjAAAV6J8uz6hYTFE8gB3T5nSkuAXTB0S9rBDzWOFHPT8Bgo2qQ5RTg
        L1YHLG2Lw+dTrC7PAWBLx09OJ08=
X-Google-Smtp-Source: APXvYqyVKS77B7zRp4YKONPA9aWccDYGe0xaoOX0jESQICEEmKm42iCga50SoWAvWI45NDfpPUBQxg==
X-Received: by 2002:a9d:51ca:: with SMTP id d10mr113904084oth.76.1578348357942;
        Mon, 06 Jan 2020 14:05:57 -0800 (PST)
Received: from rob-hp-laptop (ip-70-5-121-225.ftwttx.spcsdns.net. [70.5.121.225])
        by smtp.gmail.com with ESMTPSA id n7sm21669127oij.14.2020.01.06.14.05.56
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jan 2020 14:05:57 -0800 (PST)
Received: from rob (uid 1000)
        (envelope-from rob@rob-hp-laptop)
        id 2208aa
        by rob-hp-laptop (DragonFly Mail Agent v0.11);
        Mon, 06 Jan 2020 16:05:54 -0600
Date:   Mon, 6 Jan 2020 16:05:54 -0600
From:   Rob Herring <robh@kernel.org>
To:     Stanimir Varbanov <stanimir.varbanov@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        Vikash Garodia <vgarodia@codeaurora.org>,
        dikshita@codeaurora.org,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>
Subject: Re: [PATCH v4 07/12] dt-bindings: media: venus: Convert msm8996 to
 DT schema
Message-ID: <20200106220554.GA13282@bogus>
References: <20200106154929.4331-1-stanimir.varbanov@linaro.org>
 <20200106154929.4331-8-stanimir.varbanov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200106154929.4331-8-stanimir.varbanov@linaro.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon,  6 Jan 2020 17:49:24 +0200, Stanimir Varbanov wrote:
> Convert qcom,msm8996-venus Venus binding to DT schema.
> 
> Signed-off-by: Stanimir Varbanov <stanimir.varbanov@linaro.org>
> ---
>  .../bindings/media/qcom,msm8996-venus.yaml    | 153 ++++++++++++++++++
>  1 file changed, 153 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/media/qcom,msm8996-venus.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>
