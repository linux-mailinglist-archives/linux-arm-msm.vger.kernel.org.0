Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0C4BA13F990
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 Jan 2020 20:32:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730712AbgAPTcg (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 16 Jan 2020 14:32:36 -0500
Received: from mail-ot1-f67.google.com ([209.85.210.67]:46527 "EHLO
        mail-ot1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729010AbgAPTcg (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 16 Jan 2020 14:32:36 -0500
Received: by mail-ot1-f67.google.com with SMTP id r9so20455882otp.13;
        Thu, 16 Jan 2020 11:32:35 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=RxlCLhbJ67g6d1Lku8kWlZFcusZ3prtEclwXhvs0VlY=;
        b=tAnVKUpgHckYnGCCnQWqILjEdY0RI6BOO9IJNLf4J6r64Tiyv1gMcP3dLdxnmAyrgw
         IhbBgjuQfoOUsh4EbdGYeZWnNKqrIhijx7VUQtpmPJOECJPZz1x22dJMJQiWDy0ikm/0
         7tq5JAFrwCYv+zbIiLs3ZAyOEdvMKPxzhkfC3Ok6qoPy3nofuBGMOTyfXszB0SYeV7Pn
         DUV1hnqS6ikgyKSCy0UzFNuFvIV4oQT/Rzj6H6MpXnRN7ObR2ECmLg8Zt0lcuQch/JN6
         7OKsEytWDpNhYAQ6UBC2qQU8ya2n4gpMK9EO/3Db6sFWkR2o5VO8iUjlPTIDU4/tys33
         fFsg==
X-Gm-Message-State: APjAAAXF3QRGqkKhC8cz9MSCVWRWjGor7Lk+lAylDyM2mcBWOsPo2THW
        mW/KD+4x3+5P4GrqGWuARg==
X-Google-Smtp-Source: APXvYqyxmgpxwTv05e9N4FFkdBsR/fQwNWrywFKB3CnoSsw+nSs2rDzXaBnZeNuZ8C1h8ax5pKA9vQ==
X-Received: by 2002:a9d:7090:: with SMTP id l16mr3443912otj.187.1579203154757;
        Thu, 16 Jan 2020 11:32:34 -0800 (PST)
Received: from rob-hp-laptop (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id 101sm8049386otj.55.2020.01.16.11.32.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Jan 2020 11:32:34 -0800 (PST)
Received: (nullmailer pid 6992 invoked by uid 1000);
        Thu, 16 Jan 2020 19:32:33 -0000
Date:   Thu, 16 Jan 2020 13:32:33 -0600
From:   Rob Herring <robh@kernel.org>
To:     Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
        gregkh@linuxfoundation.org, jackp@codeaurora.org, balbi@kernel.org,
        bjorn.andersson@linaro.org, linux-kernel@vger.kernel.org,
        Jorge Ramirez-Ortiz <jorge.ramirez-ortiz@linaro.org>,
        Jorge Ramirez-Ortiz <jorge.ramirez.ortiz@gmail.com>,
        Mark Rutland <mark.rutland@arm.com>,
        devicetree@vger.kernel.org,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Subject: Re: [PATCH 04/19] dt-bindings: Add Qualcomm USB SuperSpeed PHY
 bindings
Message-ID: <20200116193233.GA5583@bogus>
References: <20200115141333.1222676-1-bryan.odonoghue@linaro.org>
 <20200115141333.1222676-5-bryan.odonoghue@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200115141333.1222676-5-bryan.odonoghue@linaro.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, 15 Jan 2020 14:13:18 +0000, Bryan O'Donoghue wrote:
> From: Jorge Ramirez-Ortiz <jorge.ramirez-ortiz@linaro.org>
> 
> Binding description for Qualcomm's Synopsys 1.0.0 SuperSpeed phy
> controller embedded in QCS404.
> 
> Based on Sriharsha Allenki's <sallenki@codeaurora.org> original
> definitions.
> 
> [bod: converted to yaml format]
> 
> Signed-off-by: Jorge Ramirez-Ortiz <jorge.ramirez-ortiz@linaro.org>
> Cc: Jorge Ramirez-Ortiz <jorge.ramirez.ortiz@gmail.com>
> Cc: Rob Herring <robh+dt@kernel.org>
> Cc: Mark Rutland <mark.rutland@arm.com>
> Cc: Bjorn Andersson <bjorn.andersson@linaro.org>
> Cc: Jorge Ramirez-Ortiz <jorge.ramirez.ortiz@gmail.com>
> Cc: devicetree@vger.kernel.org
> Cc: linux-kernel@vger.kernel.org
> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> ---
>  .../devicetree/bindings/qcom,usb-ss.yaml      | 74 +++++++++++++++++++
>  1 file changed, 74 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/qcom,usb-ss.yaml
> 

My bot found errors running 'make dt_binding_check' on your patch:

warning: no schema found in file: Documentation/devicetree/bindings/qcom,usb-ss.yaml
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/qcom,usb-ss.yaml: ignoring, error parsing file
Documentation/devicetree/bindings/display/simple-framebuffer.example.dts:21.16-37.11: Warning (chosen_node_is_root): /example-0/chosen: chosen node must be at root node
Documentation/devicetree/bindings/qcom,usb-ss.yaml:  while scanning a plain scalar
  in "<unicode string>", line 61, column 11
found a tab character that violates indentation
  in "<unicode string>", line 62, column 1
Documentation/devicetree/bindings/Makefile:12: recipe for target 'Documentation/devicetree/bindings/qcom,usb-ss.example.dts' failed
make[1]: *** [Documentation/devicetree/bindings/qcom,usb-ss.example.dts] Error 1
Makefile:1263: recipe for target 'dt_binding_check' failed
make: *** [dt_binding_check] Error 2

See https://patchwork.ozlabs.org/patch/1223564
Please check and re-submit.
