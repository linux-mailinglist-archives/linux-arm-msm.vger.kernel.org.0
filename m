Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E8D5C13F987
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 Jan 2020 20:31:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730129AbgAPTbe (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 16 Jan 2020 14:31:34 -0500
Received: from mail-ot1-f65.google.com ([209.85.210.65]:40278 "EHLO
        mail-ot1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729010AbgAPTbe (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 16 Jan 2020 14:31:34 -0500
Received: by mail-ot1-f65.google.com with SMTP id w21so20427414otj.7;
        Thu, 16 Jan 2020 11:31:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=PlRiaY/Cg3ejfSAUDDuZd3aB1y/ppEi3jqWY+7TrCNo=;
        b=n3iQwp4Iox7coZPy6YWCIymRKalXOQx2WSwJTYWdDWDEZVWx0qlBwv6FgcX0to5MVz
         D4AAXOIumHeUHvBnWPdTLGGVHoU5sEH2E2mUo+2w4LsQ/kA6dgaGP349WXokqLMvn7hZ
         ZOd57fudaY1fnTOptWyl4cenMu1kwGP1xvb9ulllJzYA1FJq6uTk8+yvYrWl6klsQ/Ht
         us91nLCWoF3OwulWPeZf2rodsOoPagkHHtrGJuThjew0UKMC4EGi+2CPGd9l9S0ILd65
         NewOh2xG8+ZqJiW2HQFe870bIvkzc67jFlkLx3pJFLBraO0Ekc6yEwf98xTKrYgdon8o
         VqOQ==
X-Gm-Message-State: APjAAAVOemnUeYIIoU+7KeF3vHf0rfQoyYVeePK40y0Y1gN1bmV+L3yT
        9Rl9eFdKetDSiBXjf4fDzQ==
X-Google-Smtp-Source: APXvYqy6E9T0byX756tK96Hg0t5Fuinh4r76yE+g1o4eRVmW1Hizyadv81FqET3Qo3ogkxT9Rgt/FA==
X-Received: by 2002:a9d:6181:: with SMTP id g1mr3450824otk.104.1579203093287;
        Thu, 16 Jan 2020 11:31:33 -0800 (PST)
Received: from rob-hp-laptop (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id q13sm8034721otc.5.2020.01.16.11.31.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Jan 2020 11:31:32 -0800 (PST)
Received: (nullmailer pid 5311 invoked by uid 1000);
        Thu, 16 Jan 2020 19:31:30 -0000
Date:   Thu, 16 Jan 2020 13:31:30 -0600
From:   Rob Herring <robh@kernel.org>
To:     Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
        gregkh@linuxfoundation.org, jackp@codeaurora.org, balbi@kernel.org,
        bjorn.andersson@linaro.org, linux-kernel@vger.kernel.org,
        Sriharsha Allenki <sallenki@codeaurora.org>,
        Anu Ramanathan <anur@codeaurora.org>,
        Shawn Guo <shawn.guo@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        Mark Rutland <mark.rutland@arm.com>,
        Jorge Ramirez-Ortiz <jorge.ramirez.ortiz@gmail.com>,
        devicetree@vger.kernel.org,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Subject: Re: [PATCH 02/19] dt-bindings: phy: Add Qualcomm Synopsys Hi-Speed
 USB PHY binding
Message-ID: <20200116193130.GA2483@bogus>
References: <20200115141333.1222676-1-bryan.odonoghue@linaro.org>
 <20200115141333.1222676-3-bryan.odonoghue@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200115141333.1222676-3-bryan.odonoghue@linaro.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, 15 Jan 2020 14:13:16 +0000, Bryan O'Donoghue wrote:
> From: Sriharsha Allenki <sallenki@codeaurora.org>
> 
> Adds bindings for QCS404 USB PHY supporting Low-Speed, Full-Speed and
> Hi-Speed USB connectivity on Qualcomm chipsets.
> 
> [bod: Converted to YAML. Changed name dropping snps component]
> 
> Signed-off-by: Sriharsha Allenki <sallenki@codeaurora.org>
> Signed-off-by: Anu Ramanathan <anur@codeaurora.org>
> Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> Signed-off-by: Shawn Guo <shawn.guo@linaro.org>
> Cc: Andy Gross <agross@kernel.org>
> Cc: Bjorn Andersson <bjorn.andersson@linaro.org>
> Cc: Kishon Vijay Abraham I <kishon@ti.com>
> Cc: Rob Herring <robh+dt@kernel.org>
> Cc: Mark Rutland <mark.rutland@arm.com>
> Cc: Jorge Ramirez-Ortiz <jorge.ramirez.ortiz@gmail.com>
> Cc: linux-arm-msm@vger.kernel.org
> Cc: linux-kernel@vger.kernel.org
> Cc: devicetree@vger.kernel.org
> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> ---
>  .../bindings/phy/qcom,qcs404-usb-hs.yaml      | 78 +++++++++++++++++++
>  1 file changed, 78 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/phy/qcom,qcs404-usb-hs.yaml
> 

My bot found errors running 'make dt_binding_check' on your patch:

warning: no schema found in file: Documentation/devicetree/bindings/phy/qcom,qcs404-usb-hs.yaml
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/phy/qcom,qcs404-usb-hs.yaml: ignoring, error parsing file
Documentation/devicetree/bindings/display/simple-framebuffer.example.dts:21.16-37.11: Warning (chosen_node_is_root): /example-0/chosen: chosen node must be at root node
Documentation/devicetree/bindings/phy/qcom,qcs404-usb-hs.yaml:  while scanning for the next token
found character that cannot start any token
  in "<unicode string>", line 64, column 1
Documentation/devicetree/bindings/Makefile:12: recipe for target 'Documentation/devicetree/bindings/phy/qcom,qcs404-usb-hs.example.dts' failed
make[1]: *** [Documentation/devicetree/bindings/phy/qcom,qcs404-usb-hs.example.dts] Error 1
Makefile:1263: recipe for target 'dt_binding_check' failed
make: *** [dt_binding_check] Error 2

See https://patchwork.ozlabs.org/patch/1223565
Please check and re-submit.
