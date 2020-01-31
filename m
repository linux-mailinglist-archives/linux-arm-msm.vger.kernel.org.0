Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C875514F4CF
	for <lists+linux-arm-msm@lfdr.de>; Fri, 31 Jan 2020 23:36:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726668AbgAaWga (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 31 Jan 2020 17:36:30 -0500
Received: from mail-pl1-f193.google.com ([209.85.214.193]:32935 "EHLO
        mail-pl1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726670AbgAaWga (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 31 Jan 2020 17:36:30 -0500
Received: by mail-pl1-f193.google.com with SMTP id ay11so3332411plb.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 31 Jan 2020 14:36:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=x9bjOIz1ZoWIt3WH97jOSDUlwhKrTSs9Z8cHSgbUrkY=;
        b=hbj+68nhZTVhE7I5O0WiC8/gmPXXA2ajfPWRycFgp38z3tUZtkqjW79aSvtSlD/HLj
         5gJdZSoT1e8wOmxDCdIPQsxE6H12Y3VYCzrTWMoePrF4SzUrYe5fxQY1DgkYSg+wgNp4
         J2RD4T441ME7ha7dC4p7qD/I6bCN4kFDGrTtU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=x9bjOIz1ZoWIt3WH97jOSDUlwhKrTSs9Z8cHSgbUrkY=;
        b=FmJt03nDgJdxISnoxFsP+ytWnTLlRowyQTb0VVzGGctEJK2AzQdkdCtOeF17n2ZJX1
         RNv6DdPIDlpzuUz+/9SBiV/RMDIxlzxCHWl0HcPadUdKLHRmXVDfb+6Jl4qQhSP34ApK
         RSIFhXb2B9vEw19Hl1y/CdcSJgcH3VqlLv8iZm/zsNFtcgCUrHmMDd3oshBFS5weDAOJ
         LkLrxlkW8wqXI3CW6VdMXQJS5ygq2nXnvvC212INW8VzoE+l8kg1JDwRbGVYdVgdBhkv
         y0/+DpJeIQijMPKc5/YxrHd0HsTIIytiQyu9FA92LdXugd8p5qCbA+XV7xTFm24Cnpw9
         0dgg==
X-Gm-Message-State: APjAAAUagZngR+pCgR6LOXPN64eLtoYDLL1KXx+Ynp3Z4oj0cSxqZEbq
        HcWGrEz/Eoj5e3TheanAm5vvog==
X-Google-Smtp-Source: APXvYqwjuzhS3BpKt6xGsva6ZfgbAYrcRNVn+3vmUXd3bKzT1b/K98vAVksO/LvuPRUEO+sF5cmBLA==
X-Received: by 2002:a17:90a:a78b:: with SMTP id f11mr15273352pjq.8.1580510188785;
        Fri, 31 Jan 2020 14:36:28 -0800 (PST)
Received: from localhost ([2620:15c:202:1:4fff:7a6b:a335:8fde])
        by smtp.gmail.com with ESMTPSA id a9sm11359539pfo.35.2020.01.31.14.36.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 31 Jan 2020 14:36:28 -0800 (PST)
Date:   Fri, 31 Jan 2020 14:36:26 -0800
From:   Matthias Kaehlcke <mka@chromium.org>
To:     Venkata Lakshmi Narayana Gubba <gubbaven@codeaurora.org>
Cc:     marcel@holtmann.org, johan.hedberg@gmail.com,
        linux-kernel@vger.kernel.org, linux-bluetooth@vger.kernel.org,
        robh@kernel.org, hemantg@codeaurora.org,
        linux-arm-msm@vger.kernel.org, bgodavar@codeaurora.org,
        tientzu@chromium.org, seanpaul@chromium.org, rjliao@codeaurora.org,
        yshavit@google.com, Rob Herring <robh+dt@kernel.org>,
        Frank Rowand <frowand.list@gmail.com>,
        devicetree@vger.kernel.org
Subject: Re: [PATCH v2 2/2] dt-bindings: net: bluetooth: Add device tree
 bindings for QTI chip WCN3991
Message-ID: <20200131223626.GA237926@google.com>
References: <1580456335-7317-1-git-send-email-gubbaven@codeaurora.org>
 <1580456335-7317-2-git-send-email-gubbaven@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <1580456335-7317-2-git-send-email-gubbaven@codeaurora.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

+ DT folks

On Fri, Jan 31, 2020 at 01:08:55PM +0530, Venkata Lakshmi Narayana Gubba wrote:
> Add compatible string for the Qualcomm WCN3991 Bluetooth controller
> 
> Signed-off-by: Venkata Lakshmi Narayana Gubba <gubbaven@codeaurora.org>
> ---
>  Documentation/devicetree/bindings/net/qualcomm-bluetooth.txt | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/net/qualcomm-bluetooth.txt b/Documentation/devicetree/bindings/net/qualcomm-bluetooth.txt
> index 68b67d9..e72045d 100644
> --- a/Documentation/devicetree/bindings/net/qualcomm-bluetooth.txt
> +++ b/Documentation/devicetree/bindings/net/qualcomm-bluetooth.txt
> @@ -11,6 +11,7 @@ Required properties:
>   - compatible: should contain one of the following:
>     * "qcom,qca6174-bt"
>     * "qcom,wcn3990-bt"
> +   * "qcom,wcn3991-bt"
>     * "qcom,wcn3998-bt"
>  
>  Optional properties for compatible string qcom,qca6174-bt:
> @@ -30,6 +31,7 @@ Optional properties for compatible string qcom,wcn399x-bt:
>  
>   - max-speed: see Documentation/devicetree/bindings/serial/slave-device.txt
>   - firmware-name: specify the name of nvm firmware to load
> + - clocks: clock provided to the controller
>  
>  Examples:
>  
> @@ -56,5 +58,6 @@ serial@898000 {
>  		vddch0-supply = <&vreg_l25a_3p3>;
>  		max-speed = <3200000>;
>  		firmware-name = "crnv21.bin";
> +		clocks = <&rpmhcc>;

That specifies a clock controller, not a clock.

For a device with the SC7180 SoC we use this:

		clocks = <&rpmhcc RPMH_RF_CLK2>;

>  	};
>  };
