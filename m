Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C285A1634A6
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Feb 2020 22:19:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726776AbgBRVTH (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 18 Feb 2020 16:19:07 -0500
Received: from mail-ot1-f65.google.com ([209.85.210.65]:36638 "EHLO
        mail-ot1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726482AbgBRVTH (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 18 Feb 2020 16:19:07 -0500
Received: by mail-ot1-f65.google.com with SMTP id j20so21025780otq.3;
        Tue, 18 Feb 2020 13:19:06 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=CEprnubCzTtFH2kEj0Xp6JjvSDETKIIdT0CSWCcyBW8=;
        b=kVcMOGKK5ExNa6TDJDa9BGTQlzGFL/VLnDKPpTkKNjGmfcH95A+aaXdrlTR4ghQ7bz
         jGk+llPxh8w1aWQ4uR7xpaXD1n7+eq4o7TpVKfnCoTTeCM8IBatCivOC6IDyJNyDBz+V
         sBHEGLr3jEi4j3HWYlJS5xW3L0tfodeKB6SLd+Rbg7yYVnE7XIP2cj7bO+5hakPNjtZk
         ZWjvQBGkVd1Co1x0CkBYEtejCh/8vom1ryZFo9jNnZCog5qBHhn0yfvhRiHPmb4fTsDv
         L44CcIXT61C69acyuWlpjvYrsDXc40xYGFp6rEDyZJe2dL72dkSLki3juyhXrroSZwpf
         0VHg==
X-Gm-Message-State: APjAAAWwxUmOFQ+wbDSCQOqKGJKtyg++OMVOqPJYVPk+EJdkNrA48iZr
        TpW2zBX+AVguiLyPW0Rv1g==
X-Google-Smtp-Source: APXvYqybXVyGew1U/Qdm6Ql5rJ3ez5H4g1Nw7s9ewtILrIB0urAUCtN7DUY4qOUY25SltRSFxq4zqQ==
X-Received: by 2002:a05:6830:139a:: with SMTP id d26mr17893745otq.75.1582060746503;
        Tue, 18 Feb 2020 13:19:06 -0800 (PST)
Received: from rob-hp-laptop (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id p65sm10876oif.47.2020.02.18.13.19.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Feb 2020 13:19:05 -0800 (PST)
Received: (nullmailer pid 22622 invoked by uid 1000);
        Tue, 18 Feb 2020 21:19:05 -0000
Date:   Tue, 18 Feb 2020 15:19:05 -0600
From:   Rob Herring <robh@kernel.org>
To:     Akash Asthana <akashast@codeaurora.org>
Cc:     robh+dt@kernel.org, agross@kernel.org, mark.rutland@arm.com,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, mgautam@codeaurora.org,
        rojay@codeaurora.org, skakit@codeaurora.org, swboyd@chromium.org,
        Akash Asthana <akashast@codeaurora.org>
Subject: Re: [PATCH V4 1/3] dt-bindings: geni-se: Convert QUP geni-se
 bindings to YAML
Message-ID: <20200218211905.GA22559@bogus>
References: <1581932212-19469-1-git-send-email-akashast@codeaurora.org>
 <1581932212-19469-2-git-send-email-akashast@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1581932212-19469-2-git-send-email-akashast@codeaurora.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, 17 Feb 2020 15:06:50 +0530, Akash Asthana wrote:
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
> Changes in V4:
>  - Resolve below compilation error reported from bot.
> 
> /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/soc/qcom/
> qcom,geni-se.yaml: properties:clocks:minItems: False schema does not allow 2
> /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/soc/qcom/
> qcom,geni-se.yaml: properties:clocks:maxItems: False schema does not allow 2
> Documentation/devicetree/bindings/Makefile:12: recipe for target
> 'Documentation/devicetree/bindings/soc/qcom/qcom,geni-se.example.dts' failed
> make[1]: *** [Documentation/devicetree/bindings/soc/qcom/
> qcom,geni-se.example.dts] Error 1
> Makefile:1263: recipe for target 'dt_binding_check' failed
> make: *** [dt_binding_check] Error 2
> 
>  .../devicetree/bindings/soc/qcom/qcom,geni-se.txt  |  94 ---------
>  .../devicetree/bindings/soc/qcom/qcom,geni-se.yaml | 209 +++++++++++++++++++++
>  2 files changed, 209 insertions(+), 94 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/soc/qcom/qcom,geni-se.txt
>  create mode 100644 Documentation/devicetree/bindings/soc/qcom/qcom,geni-se.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>
