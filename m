Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 357E820E879
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Jun 2020 00:13:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731375AbgF2WHm (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 29 Jun 2020 18:07:42 -0400
Received: from mail-il1-f194.google.com ([209.85.166.194]:40503 "EHLO
        mail-il1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730358AbgF2WHl (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 29 Jun 2020 18:07:41 -0400
Received: by mail-il1-f194.google.com with SMTP id e18so5226053ilr.7;
        Mon, 29 Jun 2020 15:07:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=nnDzFwxtFG9f7VF90LCCUZA5nyXTH/oVzSfnrfIHYp4=;
        b=G3NfjryIXlZhHvIqA0mDh+iYoivTLsTreT8fJknrWjf8UqlzDEs0Qnck6wOisb6e/d
         +xZsYosHuABCchrPUbB5RemRXI1JLQ7gPdkix5zHgYDh9gggO9ji+J+K9DnbZekmcCbQ
         8ZQYCTCjNevT7aBYdDmYi5RSc9nsjtxi088hD6vHHw/i2q3nYbPo8JpzLS1ZGxe/slld
         Y/McOQWLQWyiWhU95kzNIcqCesQw1nKZIw8Fj6O5GroINhO5zXQAjTdjaiB9Ilucvv1w
         Z4d7fgC5bsJxMKt3iQVGHUTw11fI2xp7WVQvO32yY+1Z8dcqu/uXWuZch/vR1MBKNMcv
         5kFA==
X-Gm-Message-State: AOAM531n3XHp2aYu/5R9GdV1VDHYcfqv2BrdZaAJW1HeZlrTQZiPsia3
        4+syKsUGhPIV8HoxjqmX2A==
X-Google-Smtp-Source: ABdhPJx4cPfy3pr5C+e02wlBVD5JeOddg6MDYpBU+7VS+0bIZyME4z2DTGIFLncaLT9VHWLyYw3ZtA==
X-Received: by 2002:a92:c8c5:: with SMTP id c5mr8979452ilq.47.1593468460223;
        Mon, 29 Jun 2020 15:07:40 -0700 (PDT)
Received: from xps15 ([64.188.179.255])
        by smtp.gmail.com with ESMTPSA id m2sm634034iln.1.2020.06.29.15.07.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jun 2020 15:07:39 -0700 (PDT)
Received: (nullmailer pid 3027667 invoked by uid 1000);
        Mon, 29 Jun 2020 22:07:37 -0000
Date:   Mon, 29 Jun 2020 16:07:37 -0600
From:   Rob Herring <robh@kernel.org>
To:     Wesley Cheng <wcheng@codeaurora.org>
Cc:     jackp@codeaurora.org, gregkh@linuxfoundation.org,
        rdunlap@infradead.org, linux-kernel@vger.kernel.org,
        linux-usb@vger.kernel.org, lgirdwood@gmail.com,
        linux-arm-msm@vger.kernel.org, broonie@kernel.org,
        robh+dt@kernel.org, devicetree@vger.kernel.org, agross@kernel.org,
        mark.rutland@arm.com, heikki.krogerus@linux.intel.com,
        bjorn.andersson@linaro.org
Subject: Re: [PATCH v4 2/6] dt-bindings: usb: Add Qualcomm PMIC type C
 controller dt-binding
Message-ID: <20200629220737.GA3027039@bogus>
References: <20200626185516.18018-1-wcheng@codeaurora.org>
 <20200626185516.18018-3-wcheng@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200626185516.18018-3-wcheng@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, 26 Jun 2020 11:55:12 -0700, Wesley Cheng wrote:
> Introduce the dt-binding for enabling USB type C orientation and role
> detection using the PM8150B.  The driver will be responsible for receiving
> the interrupt at a state change on the CC lines, reading the orientation/role,
> and communicating this information to the remote clients, which can include
> a role switch node and a type C switch.
> 
> Signed-off-by: Wesley Cheng <wcheng@codeaurora.org>
> ---
>  .../bindings/usb/qcom,pmic-typec.yaml         | 126 ++++++++++++++++++
>  1 file changed, 126 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/usb/qcom,pmic-typec.yaml
> 


My bot found errors running 'make dt_binding_check' on your patch:

Documentation/devicetree/bindings/usb/qcom,pmic-typec.example.dts:40.54-42.31: Warning (unit_address_vs_reg): /example-0/pm8150b/typec@1500/connector/ports/port@1/endpoint@0: node has a unit name, but no reg or ranges property
Documentation/devicetree/bindings/usb/qcom,pmic-typec.example.dts:43.51-45.31: Warning (unit_address_vs_reg): /example-0/pm8150b/typec@1500/connector/ports/port@1/endpoint@1: node has a unit name, but no reg or ranges property


See https://patchwork.ozlabs.org/patch/1317984

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure dt-schema is up to date:

pip3 install git+https://github.com/devicetree-org/dt-schema.git@master --upgrade

Please check and re-submit.

