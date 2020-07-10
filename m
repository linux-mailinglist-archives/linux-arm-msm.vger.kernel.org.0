Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 39A1121AD43
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Jul 2020 05:08:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727078AbgGJDIv (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 9 Jul 2020 23:08:51 -0400
Received: from m43-7.mailgun.net ([69.72.43.7]:25916 "EHLO m43-7.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727065AbgGJDIu (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 9 Jul 2020 23:08:50 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1594350530; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=u61ezaq/mKofrwr3vkAw+UCv+XkcrfufCL8jWoBDK3M=; b=jL7zy/SyJmlwWdk4Su+nnOZovYH34nZ1f0cm2vn2wdO7XwxouroFafXexJMnusurZ8htSbsa
 jtpnEG4Y1rv8NFQMPBziBBPNLWv4jdX7rcEmO5OHZIUH+KphwKnVYXijkXcUSgB5mKLlWnTN
 ds2mLje5HbbEXEUJV9yMi4g2h00=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n06.prod.us-east-1.postgun.com with SMTP id
 5f07dbc119b27ae9cedbee13 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Fri, 10 Jul 2020 03:08:49
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 8E7FEC433CA; Fri, 10 Jul 2020 03:08:47 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from [10.110.59.15] (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: wcheng)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id DD3F5C433C8;
        Fri, 10 Jul 2020 03:08:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org DD3F5C433C8
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=wcheng@codeaurora.org
Subject: Re: [PATCH v5 2/6] dt-bindings: usb: Add Qualcomm PMIC type C
 controller dt-binding
To:     Rob Herring <robh@kernel.org>
Cc:     lgirdwood@gmail.com, mark.rutland@arm.com, agross@kernel.org,
        broonie@kernel.org, heikki.krogerus@linux.intel.com,
        gregkh@linuxfoundation.org, bjorn.andersson@linaro.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        jackp@codeaurora.org, rdunlap@infradead.org,
        bryan.odonoghue@linaro.org
References: <20200703015102.27295-1-wcheng@codeaurora.org>
 <20200703015102.27295-3-wcheng@codeaurora.org>
 <20200709224626.GA1021653@bogus>
From:   Wesley Cheng <wcheng@codeaurora.org>
Message-ID: <bef7638a-3f1d-2c92-a7a0-c7a17d2f63c0@codeaurora.org>
Date:   Thu, 9 Jul 2020 20:08:45 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200709224626.GA1021653@bogus>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org


On 7/9/2020 3:46 PM, Rob Herring wrote:
> 
> Why is all the connector schema duplicated here? You only need things 
> that are further constrained like 'compatible'.
> 

Hi Rob,

Most of the properties in this dt-binding are going to be constrained by
the definitions/values specified by usb-connector.  I can add individual
references to each property, such as compatible, power-role, data-role
and ports, if that is the recommended approach.

> 
> 'remote-endpoint' in not an array.
> 

Agreed, I have removed the maxItems parameter.

> 
> So USB-SS data can come from 'type C mux' or 'role switch node'? That 
> seems odd.
> 

This was one of the interpretations, which might work with the current
usb-connector model.  From the previous block diagram I shared, we can
see that the SS path has two potential "endpoints," one to the mux and
another to the USB controller on the SOC.

Another design consideration is when the device supports the "Audio
Adapter Accessory Mode."  The audio accessory is mentioned in the type C
spec as an adapter which will utilize the USB D+/- lines for audio
output.  So now, you could potentially have something like below:

				   _______		 _______
                            ______|FUSB302|		|SOC	|
			   |	  |Type C |		|	|
			   |      |Cntrl  |__I2C_______	|	|
			   |	  |_______|		|	|
 ___                       |       			|	|
|   |______ CC1/2 _________|				|	|
|   |				   _______		|	|
|   |			     ____*|Charger|		|	|
|   |			    |	  |HW     |		|	|
|   |			    |     |_______|		|	|
|   |			    |	   ________      	|	|
|   |______ HS DP/DM _______|____*|MAX20328|_HS D+/D-__	|	|
|   |				  |________|__Audio Out_|	|
|   |				   ________		|	|
|   |______ SS RX/TX1 __________**|FUSB304 |_SS RX/TX**_|	|
|   |______ SS RX/TX2 ____________|USB Mux |		|_______|
|   |                             |________|
|   |
|___|

With this kind of device, it would make sense to have multiple endpoints
per path, which can be represented like the following:

connector {
        compatible = "usb-c-connector";
	...
        ports {
        	port@0 {
			...
			//Charger endpoint*
			usb_con_hs_chg: endpoint@0 {
				reg = <0>;
				remote-endpoint = <&max77865_usbc_hs>;
			};
			//Audio accessory adapter mux*
			usb_con_hs_audio: endpoint@1 {
				reg = <1>;
				remote-endpoint = <&analog_audio>;
			};
                };
		port@1 {
			...
			//USB3 lane mux**
			usb3_data_ss: endpoint@0 {
				reg = <0>;
				remote-endpoint = <&qmp_ss_mux>;
			};
			//USB3 SOC controller**
			usb3_role: endpoint@1 {
				reg = <1>;
				remote-endpoint = <&dwc3_drd_switch>;
			};
		};
	};
};

Thanks
Wesley Cheng

-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project
