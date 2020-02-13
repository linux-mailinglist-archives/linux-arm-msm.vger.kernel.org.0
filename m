Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 81AFE15CC7C
	for <lists+linux-arm-msm@lfdr.de>; Thu, 13 Feb 2020 21:42:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727993AbgBMUmh (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 13 Feb 2020 15:42:37 -0500
Received: from mail-ot1-f65.google.com ([209.85.210.65]:41698 "EHLO
        mail-ot1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727905AbgBMUmh (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 13 Feb 2020 15:42:37 -0500
Received: by mail-ot1-f65.google.com with SMTP id r27so6930304otc.8;
        Thu, 13 Feb 2020 12:42:37 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=XRwMVkuDV4d8ODMtAkipbRUn94WHYzsePIbSyr8V/+I=;
        b=QGPg0SVah25WeinQtb93ZkutmyMCaIfQLmP2vixA6QjC/m4lDMIJw1mCRriiVLdGxa
         G/6dhcfNOlTejzwBhPYczdnnW3IsfvLwQW+c50kUP13+eUp/sc5o+ZEfZWr+ID5dX7Iy
         w+GWLoNP962sogTvK0Qm3VGCxG8um7KmSBVNqhmhJkt3p3OtZCAxEnjo9GTyo6ybk5WX
         0zyhnUEHC65RI2SUgP9i7W55wpF+GdSzFD3iN/3d4WaZCGLyRPeVKuabzkjXf5NcQr/v
         Br22RyId0ijMPcNDEesEQYUOJK0UtmTZwzR1z0c7CrXB/4Zh4PiamNgRLXJv2vC+KC33
         SZug==
X-Gm-Message-State: APjAAAV2CG39iDVHqYPKImkMK6+yee2783AFIqN1hqkpA3pRXKaQlReK
        oPY0VuSzalLIWdCEjvB6pA==
X-Google-Smtp-Source: APXvYqyYSJv0g7m8Rw5CC/hVQ4Ls7EUiseNVD87JN2p/iePrV11KbZ/dIz2eWjob21uyFFF4cv9LVQ==
X-Received: by 2002:a9d:f45:: with SMTP id 63mr15385855ott.0.1581626556735;
        Thu, 13 Feb 2020 12:42:36 -0800 (PST)
Received: from rob-hp-laptop (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id 3sm1176239otd.15.2020.02.13.12.42.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Feb 2020 12:42:35 -0800 (PST)
Received: (nullmailer pid 28841 invoked by uid 1000);
        Thu, 13 Feb 2020 20:42:35 -0000
Date:   Thu, 13 Feb 2020 14:42:35 -0600
From:   Rob Herring <robh@kernel.org>
To:     Sandeep Maheswaram <sanm@codeaurora.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        Mark Rutland <mark.rutland@arm.com>,
        Stephen Boyd <swboyd@chromium.org>,
        Doug Anderson <dianders@chromium.org>,
        Matthias Kaehlcke <mka@chromium.org>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, Manu Gautam <mgautam@codeaurora.org>,
        Sandeep Maheswaram <sanm@codeaurora.org>
Subject: Re: [PATCH v3 1/4] dt-bindings: phy: qcom,qmp: Convert QMP phy
 bindings to yaml
Message-ID: <20200213204234.GA28386@bogus>
References: <1581506488-26881-1-git-send-email-sanm@codeaurora.org>
 <1581506488-26881-2-git-send-email-sanm@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1581506488-26881-2-git-send-email-sanm@codeaurora.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, 12 Feb 2020 16:51:25 +0530, Sandeep Maheswaram wrote:
> Convert QMP phy  bindings to DT schema format using json-schema.
> 
> Signed-off-by: Sandeep Maheswaram <sanm@codeaurora.org>
> ---
>  .../devicetree/bindings/phy/qcom,qmp-phy.yaml      | 283 +++++++++++++++++++++
>  .../devicetree/bindings/phy/qcom-qmp-phy.txt       | 227 -----------------
>  2 files changed, 283 insertions(+), 227 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/phy/qcom,qmp-phy.yaml
>  delete mode 100644 Documentation/devicetree/bindings/phy/qcom-qmp-phy.txt
> 

My bot found errors running 'make dt_binding_check' on your patch:

Documentation/devicetree/bindings/display/simple-framebuffer.example.dts:21.16-37.11: Warning (chosen_node_is_root): /example-0/chosen: chosen node must be at root node
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/phy/qcom,qmp-phy.example.dt.yaml: phy@88e9000: '#phy-cells' is a required property
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/phy/qcom,qmp-phy.example.dt.yaml: lanes@88e9200: '#clock-cells' is a dependency of 'clock-output-names'

See https://patchwork.ozlabs.org/patch/1236789
Please check and re-submit.
