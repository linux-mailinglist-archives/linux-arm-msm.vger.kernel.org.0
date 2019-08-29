Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C3FBAA1241
	for <lists+linux-arm-msm@lfdr.de>; Thu, 29 Aug 2019 09:03:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725881AbfH2HDy (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 29 Aug 2019 03:03:54 -0400
Received: from mail-wm1-f67.google.com ([209.85.128.67]:39044 "EHLO
        mail-wm1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726330AbfH2HDy (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 29 Aug 2019 03:03:54 -0400
Received: by mail-wm1-f67.google.com with SMTP id n2so1183192wmk.4
        for <linux-arm-msm@vger.kernel.org>; Thu, 29 Aug 2019 00:03:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=syJN1AElda7xhPvOw/vcy1dd6HyoWfY83SuIugcFyfE=;
        b=ApuYI+m8YDXZXFm3JiiYl7767qTRfvwsIUrqU1BtJ2d3ovZVEMt+HLDjKOOIG8qu1y
         H1FIhI5XqpMsPJWwcN+FJL3SMafk+HnnOisnkhs5CTX06OlcP+lctgbMQMQQYPjf1kx/
         m70NRulYPkKyxLP8brmSIv3W7/6N6Npa5ffSDDSuHslYCMPxVrwrHpAj+hoRisd4261N
         sB/bzFTQm+B4HQkAOUQUfWZFcJkFLStqshAbLDIVaNiR32aBlPSG0x9Rl2K87crpsTpj
         bexhAjHtp/q0EQLl/PHc8wg2+Zpw+bIXy3QmloUGO50Kzh0ZWLkQ6PsZw8NWcPyTf/yE
         3L+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=syJN1AElda7xhPvOw/vcy1dd6HyoWfY83SuIugcFyfE=;
        b=X/Tuhs4dzjM7S2UCMVdP5fjyacc4UgIrzGkTKFs8YpERn4azY0cDjoMfNVWSjQBaq1
         mQ4cVsYSEDwqNUTvPJ3C7xPwvpvItUrzi6EIxHHdM0S10HXTu74ZUhwouRJwvy/sOzpy
         QCVKYLbZPIhv54ia2HEfccaTOjrEcCT4j/1k6Ku0IvmfzZW2NsiyAkkZD8/VPKNTFPJv
         R8hZprHvBazmTVulpbqKn+dtPbkUVAPHX3dsC6oiJBoktl67Dwe7y9EljOnCzkPwCgA2
         x7koOZxzUNtBir+g7ymavdCIyOPVi6cvb3QCO//P/DnfJkw6k7beAvCrSEwZMzWDZaOQ
         X0EQ==
X-Gm-Message-State: APjAAAW3dg5SUZRVA3pDwjVLGo6kxXnQVjIyq0QS0aqNTuZQVyiMnTsB
        HMkBm2UHrhjCyOfKu7W+FQlDbw==
X-Google-Smtp-Source: APXvYqya0CiL9G1moyvmqQVNqGgkib/s77qe7jypGG/sh++aoSP0FKfRPFNRmI03bw4m+Sn596Ij4g==
X-Received: by 2002:a7b:ce8f:: with SMTP id q15mr2906912wmj.154.1567062231241;
        Thu, 29 Aug 2019 00:03:51 -0700 (PDT)
Received: from [192.168.1.6] (124.red-83-36-179.dynamicip.rima-tde.net. [83.36.179.124])
        by smtp.gmail.com with ESMTPSA id n14sm4299285wra.75.2019.08.29.00.03.49
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 29 Aug 2019 00:03:50 -0700 (PDT)
Subject: Re: [PATCH v4 3/4] dt-bindings: Add Qualcomm USB SuperSpeed PHY
 bindings
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     robh@kernel.org, swboyd@chromium.org, andy.gross@linaro.org,
        shawn.guo@linaro.org, gregkh@linuxfoundation.org,
        mark.rutland@arm.com, kishon@ti.com, jackp@codeaurora.org,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, khasim.mohammed@linaro.org
References: <20190207111734.24171-1-jorge.ramirez-ortiz@linaro.org>
 <20190207111734.24171-4-jorge.ramirez-ortiz@linaro.org>
 <20190223165218.GB572@tuxbook-pro>
From:   Jorge Ramirez <jorge.ramirez-ortiz@linaro.org>
Message-ID: <6dc0957d-5806-7643-4454-966015865d38@linaro.org>
Date:   Thu, 29 Aug 2019 09:03:48 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.2.1
MIME-Version: 1.0
In-Reply-To: <20190223165218.GB572@tuxbook-pro>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2/23/19 17:52, Bjorn Andersson wrote:
> On Thu 07 Feb 03:17 PST 2019, Jorge Ramirez-Ortiz wrote:
> 
>> Binding description for Qualcomm's Synopsys 1.0.0 SuperSpeed phy
>> controller embedded in QCS404.
>>
>> Based on Sriharsha Allenki's <sallenki@codeaurora.org> original
>> definitions.
>>
>> Signed-off-by: Jorge Ramirez-Ortiz <jorge.ramirez-ortiz@linaro.org>
>> ---
>>  .../bindings/phy/qcom,snps-usb-ssphy.txt      | 79 +++++++++++++++++++
>>  1 file changed, 79 insertions(+)
>>  create mode 100644 Documentation/devicetree/bindings/phy/qcom,snps-usb-ssphy.txt
>>
>> diff --git a/Documentation/devicetree/bindings/phy/qcom,snps-usb-ssphy.txt b/Documentation/devicetree/bindings/phy/qcom,snps-usb-ssphy.txt
>> new file mode 100644
>> index 000000000000..354e6f9cef62
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/phy/qcom,snps-usb-ssphy.txt
>> @@ -0,0 +1,79 @@
>> +Qualcomm Synopsys 1.0.0 SS phy controller
>> +===========================================
>> +
>> +Qualcomm 1.0.0 SS phy controller supports SuperSpeed USB connectivity on
>> +some Qualcomm platforms.
>> +
>> +Required properties:
>> +
>> +- compatible:
>> +    Value type: <string>
>> +    Definition: Should contain "qcom,snps-usb-ssphy".
> 
> Per Rob's request make this:
> 
> Should contain "qcom,qcs404-snps-usb-ssphy" and "qcom,snps-usb-ssphy"

ok

> 
> You can then leave the driver matching on qcom,snps-usb-ssphy for now
> and if we ever find this to be incompatible with other platforms we can
> make the driver match on the platform-specific compatible.

ok

> 
>> +
>> +- reg:
>> +    Value type: <prop-encoded-array>
>> +    Definition: USB PHY base address and length of the register map.
>> +
>> +- #phy-cells:
>> +    Value type: <u32>
>> +    Definition: Should be 0. See phy/phy-bindings.txt for details.
>> +
>> +- clocks:
>> +    Value type: <prop-encoded-array>
>> +    Definition: See clock-bindings.txt section "consumers". List of
>> +		 three clock specifiers for reference, phy core and
>> +		 pipe clocks.
>> +
>> +- clock-names:
>> +    Value type: <string>
>> +    Definition: Names of the clocks in 1-1 correspondence with the "clocks"
>> +		 property. Must contain "ref", "phy" and "pipe".
>> +
>> +- vdd-supply:
>> +    Value type: <phandle>
>> +    Definition: phandle to the regulator VDD supply node.
>> +
>> +- vdda1p8-supply:
>> +    Value type: <phandle>
>> +    Definition: phandle to the regulator 1.8V supply node.
>> +
>> +Optional properties:
>> +
>> +- resets:
>> +    Value type: <prop-encoded-array>
>> +    Definition: See reset.txt section "consumers". Specifiers for COM and
>> +		 PHY resets.
>> +
>> +- reset-names:
>> +    Value type: <string>
>> +    Definition: Names of the resets in 1-1 correspondence with the "resets"
>> +		 property. Must contain "com" and "phy" if the property is
>> +		 specified.
>> +
>> +Required child nodes:
>> +
>> +- usb connector node as defined in bindings/connector/usb-connector.txt
>> +  containing the property vbus-supply.
>> +
>> +Example:
>> +
>> +usb3_phy: usb3-phy@78000 {
>> +	compatible = "qcom,snps-usb-ssphy";
>> +	reg = <0x78000 0x400>;
>> +	#phy-cells = <0>;
>> +	clocks = <&rpmcc RPM_SMD_LN_BB_CLK>,
>> +		 <&gcc GCC_USB_HS_PHY_CFG_AHB_CLK>,
>> +		 <&gcc GCC_USB3_PHY_PIPE_CLK>;
>> +	clock-names = "ref", "phy", "pipe";
>> +	resets = <&gcc GCC_USB3_PHY_BCR>,
>> +		 <&gcc GCC_USB3PHY_PHY_BCR>;
>> +	reset-names = "com", "phy";
>> +	vdd-supply = <&vreg_l3_1p05>;
>> +	vdda1p8-supply = <&vreg_l5_1p8>;
>> +	usb3_c_connector: usb3-c-connector {
> 
> The USB-C connector is attached both to the HS and SS PHYs, so I think
> you should represent this external to this node and use of_graph to
> query it.

but AFAICS we wont be able to retrieve the vbux-supply from an external
node (that interface does not exist).

rob, do you have a suggestion?

> 
> So the connector should look similar to example 2 in
> connector/usb-connector.txt.
> 
> Regards,
> Bjorn
> 
>> +		compatible = "usb-c-connector";
>> +		label = "USB-C";
>> +		type = "micro";
>> +		vbus-supply = <&usb3_vbus_reg>;
>> +	};
>> +};
>> -- 
>> 2.20.1
>>
> 

