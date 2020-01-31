Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1EC0C14EE5A
	for <lists+linux-arm-msm@lfdr.de>; Fri, 31 Jan 2020 15:24:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728825AbgAaOYd (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 31 Jan 2020 09:24:33 -0500
Received: from mail-ot1-f67.google.com ([209.85.210.67]:46789 "EHLO
        mail-ot1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728730AbgAaOYd (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 31 Jan 2020 09:24:33 -0500
Received: by mail-ot1-f67.google.com with SMTP id g64so6648164otb.13;
        Fri, 31 Jan 2020 06:24:31 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=uuOjFG9xzi/UCtL9OZpkiDb03tcQtH0JcN37yDUJ4M8=;
        b=r13E1IeuTeLq0/bEUVaeLF+rS9dAzx7FeLSSrix7uFH5JIlbWDfJfOLGv7RpwRd/N6
         yupm5NpJD/xlEY5eY0ho3WzuIA3ulm7cnpDahiHrLN9wRK+s4DfWj5TOtaIs36S+MGPW
         qUzWCCpl2161GLrdPtzSCDFLzB3HEEnYicyfy27f9m/dbegVv7jgreBQhkV5Z60ZXjya
         4NUeu93NHiRoeS7kf2Stgh4jDFnBb46Oa0Aoiuixx3BHz8PX9nX0UQOMxdeCGOiaT6Rb
         PI/SV2CDMxEA3mtTCVjpb1vOCksm+0VZ89waUB2RDHjAW0rOtoOHPVSw0JAKD63PkItz
         yKmw==
X-Gm-Message-State: APjAAAWtBk4hsMvJd0WaRsYu2taZMzsjmepFGD7k09p6I961i/KCCl3P
        +uFyV3/OGT/1iFzMfvRdCA==
X-Google-Smtp-Source: APXvYqw1PGBub02UGDuqudnzKJy1HY8sizU4AhKy/SeKQ9FJhf2gfnVy/TBaUTwmPAfTgya8WLaYVA==
X-Received: by 2002:a9d:6a90:: with SMTP id l16mr7377981otq.353.1580480670866;
        Fri, 31 Jan 2020 06:24:30 -0800 (PST)
Received: from rob-hp-laptop (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id y6sm3045689oti.44.2020.01.31.06.24.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Jan 2020 06:24:30 -0800 (PST)
Received: (nullmailer pid 6089 invoked by uid 1000);
        Fri, 31 Jan 2020 14:24:29 -0000
Date:   Fri, 31 Jan 2020 08:24:29 -0600
From:   Rob Herring <robh@kernel.org>
To:     Akash Asthana <akashast@codeaurora.org>
Cc:     robh+dt@kernel.org, agross@kernel.org, mark.rutland@arm.com,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, mgautam@codeaurora.org,
        rojay@codeaurora.org, c_skakit@codeaurora.org,
        Akash Asthana <akashast@codeaurora.org>
Subject: Re: [PATCH V3] dt-bindings: geni-se: Convert QUP geni-se bindings to
 YAML
Message-ID: <20200131142429.GA5642@bogus>
References: <1580378322-32729-1-git-send-email-akashast@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1580378322-32729-1-git-send-email-akashast@codeaurora.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, 30 Jan 2020 15:28:42 +0530, Akash Asthana wrote:
> Convert QUP geni-se bindings to DT schema format using json-schema.
> 
> Signed-off-by: Akash Asthana <akashast@codeaurora.org>
> ---
> Changes in V2:
>  - As per Stephen's comment corrected defintion of interrupts for UART node.
>    Any valid UART node must contain atleast 1 interrupts.
> 
> Changes in V3:
>  - As per Rob's comment, added number of reg entries for reg property.
>  - As per Rob's comment, corrected unit address to hex.
>  - As per Rob's comment, created a pattern which matches everything common
>    to geni based I2C, SPI and UART controller and then one pattern  for each.
>  - As per Rob's comment, restored original example.
> 
>  .../devicetree/bindings/soc/qcom/qcom,geni-se.txt  |  94 ---------
>  .../devicetree/bindings/soc/qcom/qcom,geni-se.yaml | 211 +++++++++++++++++++++
>  2 files changed, 211 insertions(+), 94 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/soc/qcom/qcom,geni-se.txt
>  create mode 100644 Documentation/devicetree/bindings/soc/qcom/qcom,geni-se.yaml
> 

My bot found errors running 'make dt_binding_check' on your patch:

warning: no schema found in file: Documentation/devicetree/bindings/soc/qcom/qcom,geni-se.yaml
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/soc/qcom/qcom,geni-se.yaml: ignoring, error in schema: properties: clocks: minItems
Documentation/devicetree/bindings/display/simple-framebuffer.example.dts:21.16-37.11: Warning (chosen_node_is_root): /example-0/chosen: chosen node must be at root node
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/soc/qcom/qcom,geni-se.yaml: properties:clocks:minItems: False schema does not allow 2
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/soc/qcom/qcom,geni-se.yaml: properties:clocks:maxItems: False schema does not allow 2
Documentation/devicetree/bindings/Makefile:12: recipe for target 'Documentation/devicetree/bindings/soc/qcom/qcom,geni-se.example.dts' failed
make[1]: *** [Documentation/devicetree/bindings/soc/qcom/qcom,geni-se.example.dts] Error 1
Makefile:1263: recipe for target 'dt_binding_check' failed
make: *** [dt_binding_check] Error 2

See https://patchwork.ozlabs.org/patch/1231351
Please check and re-submit.
