Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6088A197FED
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Mar 2020 17:41:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729601AbgC3PlA (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 30 Mar 2020 11:41:00 -0400
Received: from mail-io1-f65.google.com ([209.85.166.65]:34037 "EHLO
        mail-io1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729489AbgC3PlA (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 30 Mar 2020 11:41:00 -0400
Received: by mail-io1-f65.google.com with SMTP id h131so18240526iof.1;
        Mon, 30 Mar 2020 08:40:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=FrZskpAncwXlTmer8dNjyojk8sFLFkrvun4f6jCecoI=;
        b=IyU4xKvhHM4zH+Vlx2S1R/uAfQUz6ZcBeTTLEVTk5/e4+P1ERSt87GrrFuNJfXk4aI
         7YpvMOrFT/+DF2qZkOx0EH7Uz3ueGSwoGo/Mi/iRubHZ3ANUDSt05HuMGWfwRSIWrgWk
         yMfYgsZzWYsWdxPhSubwPLAXT5x3WV7gMGOKvhqHXYS7t45NOqH9lvyLV3ZCjwkySZFT
         H0TM2WJ0bd3kWTLJJsC5zD4JTKqY3VTTP7vrD0OCVUhz0sveON/fYhMU4R8YVhvfyFaR
         yJSgBZdvqXLmf5zqDwxpkXVxFov5ITtLqERl6juF4oX/3Y3FQdzsap9+GBTsfZdEwmUc
         jf0Q==
X-Gm-Message-State: ANhLgQ0W/HMN7sMQqhFhi5MM1gFw21hgFRP4nK/4OAR3/igOb+gNqUWO
        x+MSjSLT0h+7HOaeZY+okA==
X-Google-Smtp-Source: ADFU+vtYbOnj6T9VKwympEk/Igl3zqimx0Szkm1G0rEgizbRyrQ7fVa90Ym/eEv6H01RXEsxKQD8/g==
X-Received: by 2002:a6b:8d4c:: with SMTP id p73mr10903567iod.14.1585582858637;
        Mon, 30 Mar 2020 08:40:58 -0700 (PDT)
Received: from rob-hp-laptop ([64.188.179.250])
        by smtp.gmail.com with ESMTPSA id m14sm5078251ilr.16.2020.03.30.08.40.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Mar 2020 08:40:58 -0700 (PDT)
Received: (nullmailer pid 23073 invoked by uid 1000);
        Mon, 30 Mar 2020 15:40:56 -0000
Date:   Mon, 30 Mar 2020 09:40:56 -0600
From:   Rob Herring <robh@kernel.org>
To:     Robert Marko <robert.marko@sartura.hr>
Cc:     agross@kernel.org, bjorn.andersson@linaro.org, kishon@ti.com,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        robh+dt@kernel.org, devicetree@vger.kernel.org,
        Robert Marko <robert.marko@sartura.hr>,
        John Crispin <john@phrozen.org>,
        Luka Perkov <luka.perkov@sartura.hr>
Subject: Re: [PATCH v4 2/3] dt-bindings: phy-qcom-ipq4019-usb: add binding
 document
Message-ID: <20200330154056.GA22114@bogus>
References: <20200328135345.695622-1-robert.marko@sartura.hr>
 <20200328135345.695622-2-robert.marko@sartura.hr>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200328135345.695622-2-robert.marko@sartura.hr>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Sat, 28 Mar 2020 14:53:49 +0100, Robert Marko wrote:
> This patch adds the binding documentation for the HS/SS USB PHY found
> inside Qualcom Dakota SoCs.
> 
> Signed-off-by: John Crispin <john@phrozen.org>
> Signed-off-by: Robert Marko <robert.marko@sartura.hr>
> Cc: Luka Perkov <luka.perkov@sartura.hr>
> ---
>  .../bindings/phy/qcom-usb-ipq4019-phy.yaml    | 45 +++++++++++++++++++
>  1 file changed, 45 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/phy/qcom-usb-ipq4019-phy.yaml
> 

My bot found errors running 'make dt_binding_check' on your patch:

Documentation/devicetree/bindings/phy/qcom-usb-ipq4019-phy.yaml:  while scanning a block scalar
  in "<unicode string>", line 37, column 5
found a tab character where an indentation space is expected
  in "<unicode string>", line 39, column 1
Documentation/devicetree/bindings/Makefile:12: recipe for target 'Documentation/devicetree/bindings/phy/qcom-usb-ipq4019-phy.example.dts' failed
make[1]: *** [Documentation/devicetree/bindings/phy/qcom-usb-ipq4019-phy.example.dts] Error 1
make[1]: *** Waiting for unfinished jobs....
warning: no schema found in file: Documentation/devicetree/bindings/phy/qcom-usb-ipq4019-phy.yaml
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/phy/qcom-usb-ipq4019-phy.yaml: ignoring, error parsing file
Makefile:1262: recipe for target 'dt_binding_check' failed
make: *** [dt_binding_check] Error 2

See https://patchwork.ozlabs.org/patch/1263219

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure dt-schema is up to date:

pip3 install git+https://github.com/devicetree-org/dt-schema.git@master --upgrade

Please check and re-submit.
