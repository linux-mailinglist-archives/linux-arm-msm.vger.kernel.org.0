Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9DE73199B94
	for <lists+linux-arm-msm@lfdr.de>; Tue, 31 Mar 2020 18:31:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730149AbgCaQbG (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 31 Mar 2020 12:31:06 -0400
Received: from mail-io1-f66.google.com ([209.85.166.66]:36183 "EHLO
        mail-io1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726194AbgCaQbG (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 31 Mar 2020 12:31:06 -0400
Received: by mail-io1-f66.google.com with SMTP id n10so8306829iom.3;
        Tue, 31 Mar 2020 09:31:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=zoQEkQjM/RIJRTp0VhUEAtYWdj5x7fe+RhUwfghxupI=;
        b=WzS20qYhqf0IWsyYBSSqkdEemNosrZtX9J1l05rPS40rZzXkppIUOwkYz6+pqpW1fZ
         qKne/UOM7gq4qm0ggxGBjysbA8HQDetFlDoiPXIA0tj7dRqzAo0/hVI6hTuZI2bxuXu9
         x9B41iysI1FfMcu7YKzlvuDpiHPplEzsh9Dv2M+gZwxb/7aNgTVmznVyLxH/CWFai+e6
         dNn+rMqdAsWrUsFLG37A7jFWq82gf0EpVwGdPYoBtnalooFWdpnZ/i9Xly3r+u2VrFQZ
         s1g2Zw02Ejl5k7+EqZ3bcQnUvkfYD3/Li2mHwaEzJwGwpkpFZdMOCFHFYZ4sgTeOjvVW
         oiTA==
X-Gm-Message-State: ANhLgQ2sKYOob+VWUo2Ykl9rfgaUR6iqZHGMppWfOVFTILOT4rr3ZvAH
        dByW60z0+qEkuETvecJKO6AyNuZKew==
X-Google-Smtp-Source: ADFU+vu4PluKLuSQcRazSevqQJ+tYdJcBbLKoGll5Pt711ZFa614nH8fCOc5wkXi2o9PWi7OduTjZQ==
X-Received: by 2002:a6b:c9d2:: with SMTP id z201mr16386409iof.169.1585672265396;
        Tue, 31 Mar 2020 09:31:05 -0700 (PDT)
Received: from rob-hp-laptop ([64.188.179.250])
        by smtp.gmail.com with ESMTPSA id f2sm6047237ill.51.2020.03.31.09.31.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 Mar 2020 09:31:04 -0700 (PDT)
Received: (nullmailer pid 23196 invoked by uid 1000);
        Tue, 31 Mar 2020 16:31:03 -0000
Date:   Tue, 31 Mar 2020 10:31:03 -0600
From:   Rob Herring <robh@kernel.org>
To:     Robert Marko <robert.marko@sartura.hr>
Cc:     agross@kernel.org, bjorn.andersson@linaro.org, kishon@ti.com,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        robh+dt@kernel.org, mark.rutland@arm.com,
        devicetree@vger.kernel.org, Robert Marko <robert.marko@sartura.hr>,
        John Crispin <john@phrozen.org>,
        Luka Perkov <luka.perkov@sartura.hr>
Subject: Re: [PATCH v5 2/3] dt-bindings: phy-qcom-ipq4019-usb: add binding
 document
Message-ID: <20200331163103.GA27585@bogus>
References: <20200330164328.2944505-1-robert.marko@sartura.hr>
 <20200330164328.2944505-2-robert.marko@sartura.hr>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200330164328.2944505-2-robert.marko@sartura.hr>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, 30 Mar 2020 18:43:29 +0200, Robert Marko wrote:
> This patch adds the binding documentation for the HS/SS USB PHY found
> inside Qualcom Dakota SoCs.
> 
> Signed-off-by: John Crispin <john@phrozen.org>
> Signed-off-by: Robert Marko <robert.marko@sartura.hr>
> Cc: Luka Perkov <luka.perkov@sartura.hr>
> ---
> Changes from v4 to v5:
> * Replace tabs with whitespaces
> * Add maintainer property
> 
>  .../bindings/phy/qcom-usb-ipq4019-phy.yaml    | 48 +++++++++++++++++++
>  1 file changed, 48 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/phy/qcom-usb-ipq4019-phy.yaml
> 

My bot found errors running 'make dt_binding_check' on your patch:

Error: Documentation/devicetree/bindings/phy/qcom-usb-ipq4019-phy.example.dts:21.25-26 syntax error
FATAL ERROR: Unable to parse input tree
scripts/Makefile.lib:311: recipe for target 'Documentation/devicetree/bindings/phy/qcom-usb-ipq4019-phy.example.dt.yaml' failed
make[1]: *** [Documentation/devicetree/bindings/phy/qcom-usb-ipq4019-phy.example.dt.yaml] Error 1
make[1]: *** Waiting for unfinished jobs....
Makefile:1262: recipe for target 'dt_binding_check' failed
make: *** [dt_binding_check] Error 2

See https://patchwork.ozlabs.org/patch/1264091

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure dt-schema is up to date:

pip3 install git+https://github.com/devicetree-org/dt-schema.git@master --upgrade

Please check and re-submit.
