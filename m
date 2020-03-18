Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 51BE918A784
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Mar 2020 23:03:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726871AbgCRWDz (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 18 Mar 2020 18:03:55 -0400
Received: from mail-il1-f196.google.com ([209.85.166.196]:43931 "EHLO
        mail-il1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726619AbgCRWDz (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 18 Mar 2020 18:03:55 -0400
Received: by mail-il1-f196.google.com with SMTP id d14so319531ilq.10;
        Wed, 18 Mar 2020 15:03:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=CLoQVPlkFQlDLsX88susr2K6YisyFa9CiuJkaW6E9dA=;
        b=UMcptopukAum83IYaNJoip+VggBL1p4Ny5I574HW1bAJhAOQuEWKqLtuRSzIwyshU3
         bDVrj14MIZcLLX7D/UBUzEGERSzn8jFnE73n7Cx1gzI1QH0zm3nlPf+cOi7isO421zSi
         dAQJvkgEOp1v+Pl1SOFyhDAOAUwLKkfaql2PfRpxfg9KrHcBD4lijynlSd8VqnRFdbl9
         UZP2W5EiVbRn2azsStwVAk1oEI4jXOJER4+JJF5NFIchSkcf3voVxy2paNoWmTsqOp1Z
         iRUcKFW6kobkL5Icx7OjhbPextLI9RlWw5biPaf0+tDm51WrEaxqP8aCjReiM76Z3Tuz
         Su9Q==
X-Gm-Message-State: ANhLgQ0ERduPvaVSztagbjZN06S8DtppM8LINahhqPz3meoHbuyyLZXO
        J5ySeePnB4uAcilkcLUhmA==
X-Google-Smtp-Source: ADFU+vv4evE0zvIh+m02yfxSH4HvSOfUSbGzEPyA/4x25WbIY5vIBPXUgkquwrjgTTv7rlSougLazw==
X-Received: by 2002:a05:6e02:c62:: with SMTP id f2mr204406ilj.167.1584569034577;
        Wed, 18 Mar 2020 15:03:54 -0700 (PDT)
Received: from rob-hp-laptop ([64.188.179.250])
        by smtp.gmail.com with ESMTPSA id l26sm69517ioc.1.2020.03.18.15.03.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Mar 2020 15:03:53 -0700 (PDT)
Received: (nullmailer pid 15282 invoked by uid 1000);
        Wed, 18 Mar 2020 22:03:52 -0000
Date:   Wed, 18 Mar 2020 16:03:52 -0600
From:   Rob Herring <robh@kernel.org>
To:     Wesley Cheng <wcheng@codeaurora.org>
Cc:     agross@kernel.org, bjorn.andersson@linaro.org, kishon@ti.com,
        robh+dt@kernel.org, mark.rutland@arm.com, p.zabel@pengutronix.de,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, Wesley Cheng <wcheng@codeaurora.org>
Subject: Re: [PATCH 1/4] dt-bindings: phy: Add binding for qcom,usb-hs-7nm
Message-ID: <20200318220352.GA12501@bogus>
References: <1584147293-6763-1-git-send-email-wcheng@codeaurora.org>
 <1584147293-6763-2-git-send-email-wcheng@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1584147293-6763-2-git-send-email-wcheng@codeaurora.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, 13 Mar 2020 17:54:50 -0700, Wesley Cheng wrote:
> This binding shows the descriptions and properties for the
> 7nm Synopsis HS USB PHY used on QCOM platforms.
> 
> Signed-off-by: Wesley Cheng <wcheng@codeaurora.org>
> ---
>  .../devicetree/bindings/phy/qcom,usb-hs-7nm.yaml   | 74 ++++++++++++++++++++++
>  1 file changed, 74 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/phy/qcom,usb-hs-7nm.yaml
> 

My bot found errors running 'make dt_binding_check' on your patch:

warning: no schema found in file: Documentation/devicetree/bindings/phy/qcom,usb-hs-7nm.yaml
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/phy/qcom,usb-hs-7nm.yaml: ignoring, error parsing file
Documentation/devicetree/bindings/phy/qcom,usb-hs-7nm.yaml:  while scanning a block scalar
  in "<unicode string>", line 59, column 5
found a tab character where an indentation space is expected
  in "<unicode string>", line 73, column 1
Documentation/devicetree/bindings/Makefile:12: recipe for target 'Documentation/devicetree/bindings/phy/qcom,usb-hs-7nm.example.dts' failed
make[1]: *** [Documentation/devicetree/bindings/phy/qcom,usb-hs-7nm.example.dts] Error 1
Makefile:1262: recipe for target 'dt_binding_check' failed
make: *** [dt_binding_check] Error 2

See https://patchwork.ozlabs.org/patch/1254748
Please check and re-submit.
