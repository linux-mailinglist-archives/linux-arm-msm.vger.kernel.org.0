Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4B338499FB
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Jun 2019 09:12:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725934AbfFRHMO (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 18 Jun 2019 03:12:14 -0400
Received: from smtp.codeaurora.org ([198.145.29.96]:38480 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725919AbfFRHMO (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 18 Jun 2019 03:12:14 -0400
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
        id F2B3160867; Tue, 18 Jun 2019 05:52:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1560837174;
        bh=PQiidX3rlEJZDQPRPGrV2WaiptWcCY0MMTVz1XTm+Vw=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=PVJPsoCsmC9KX5WBAGB9i4Nto6OzQsYk7G4k7nMDJ2UVULDUwqWg0r9ZlZZp2dWjb
         u4biZnH3LJamg+gw6LxFuQBPz4ZpdI9dWmEZmUbh3R6VLsn8oBe1khQ94vav0UPaTA
         wOK3Zxa9nn6Up0cYEQK7IdrF0BQcau276c1mzvUQ=
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        pdx-caf-mail.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        DKIM_INVALID,DKIM_SIGNED,SPF_NONE autolearn=no autolearn_force=no
        version=3.4.0
Received: from [192.168.43.187] (unknown [223.227.13.236])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: nishakumari@smtp.codeaurora.org)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 1B41E60850;
        Tue, 18 Jun 2019 05:52:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1560837173;
        bh=PQiidX3rlEJZDQPRPGrV2WaiptWcCY0MMTVz1XTm+Vw=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=PVRx87wJ6CrV7mjmO4a8/JvzMLLpAm9s/pFBTc0ujgud0QmtFZX6XxJu4ubhD8x4M
         a3tcSL8Xmh9Uo8WneLLGFNazwOELBQOBJ4i1z/nTAKlhh0i/hwYBPUwVhKYJtykJW/
         ReOET0L3XV7kYgs/2ai4pIpqfgA3u//1jy34yi/o=
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 1B41E60850
Authentication-Results: pdx-caf-mail.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: pdx-caf-mail.web.codeaurora.org; spf=none smtp.mailfrom=nishakumari@codeaurora.org
Subject: Re: [PATCH 1/4] dt-bindings: regulator: Add labibb regulator
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     broonie@kernel.org, robh+dt@kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        agross@kernel.org, lgirdwood@gmail.com, mark.rutland@arm.com,
        david.brown@linaro.org, linux-kernel@vger.kernel.org,
        kgunda@codeaurora.org, rnayak@codeaurora.org
References: <1560337252-27193-1-git-send-email-nishakumari@codeaurora.org>
 <1560337252-27193-2-git-send-email-nishakumari@codeaurora.org>
 <20190613162808.GG22737@tuxbook-pro>
From:   Nisha Kumari <nishakumari@codeaurora.org>
Message-ID: <ed756c36-2b0d-b48e-b4fd-32e2d60aa38a@codeaurora.org>
Date:   Tue, 18 Jun 2019 11:22:45 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.1
MIME-Version: 1.0
In-Reply-To: <20190613162808.GG22737@tuxbook-pro>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org


On 6/13/2019 9:58 PM, Bjorn Andersson wrote:
> On Wed 12 Jun 04:00 PDT 2019, Nisha Kumari wrote:
>
>> Adding the devicetree binding for labibb regulator.
>>
>> Signed-off-by: Nisha Kumari <nishakumari@codeaurora.org>
>> ---
>>   .../bindings/regulator/qcom-labibb-regulator.txt   | 57 ++++++++++++++++++++++
>>   1 file changed, 57 insertions(+)
>>   create mode 100644 Documentation/devicetree/bindings/regulator/qcom-labibb-regulator.txt
>>
>> diff --git a/Documentation/devicetree/bindings/regulator/qcom-labibb-regulator.txt b/Documentation/devicetree/bindings/regulator/qcom-labibb-regulator.txt
>> new file mode 100644
>> index 0000000..79aad6f4
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/regulator/qcom-labibb-regulator.txt
>> @@ -0,0 +1,57 @@
>> +Qualcomm's LAB(LCD AMOLED Boost)/IBB(Inverting Buck Boost) Regulator
>> +
>> +LAB can be used as a positive boost power supply and IBB can be used as a negative
>> +boost power supply for display panels.
>> +
>> +Main node required properties:
>> +
>> +- compatible:			Must be:
>> +				"qcom,lab-ibb-regulator"
> In order to handle variations in future LABIBB implementations, make
> this "qcom,pmi8998-lab-ibb";
Sure, i will do that.
>
>> +- #address-cells:		Must be 1
>> +- #size-cells:			Must be 0
>> +
>> +LAB subnode required properties:
>> +
>> +- reg:				Specifies the SPMI address and size for this peripheral.
>> +- regulator-name:		A string used to describe the regulator.
>> +- interrupts:			Specify the interrupts as per the interrupt
>> +				encoding.
>> +- interrupt-names:		Interrupt names to match up 1-to-1 with
>> +				the interrupts specified in 'interrupts'
>> +				property.
>> +
>> +IBB subnode required properties:
>> +
>> +- reg:				Specifies the SPMI address and size for this peripheral.
>> +- regulator-name:		A string used to describe the regulator.
>> +- interrupts:			Specify the interrupts as per the interrupt
>> +				encoding.
>> +- interrupt-names:		Interrupt names to match up 1-to-1 with
>> +				the interrupts specified in 'interrupts'
>> +				property.
>> +
>> +Example:
>> +	pmi8998_lsid1: pmic@3 {
>> +		qcom-labibb-regulator {
> We typically want to use generic names here, but as the spmi regulator
> binding suggest the use of "regulators" without a unit address that
> wouldn't work.
>
> But you can shorten this to either "labibb" or at least
> "labibb-regulator".
Sure, i will do that.
>> +			compatible = "qcom,lab-ibb-regulator";
>> +			#address-cells = <1>;
>> +			#size-cells = <0>;
>> +
>> +			lab_regulator: qcom,lab@de00 {
> Don't use "qcom," in the node names.
ok
>
>> +				reg = <0xde00>;
> Please follow the spmi-regulator and hide these in the driver.
ok
>> +				regulator-name = "lab_reg";
> We know it's a regulator, so no need for _reg, which means that if you
> drop "qcom," from the node name and use the node name as the default
> regulator name you don't need this.
Sure, i will do that.
>
>> +
>> +				interrupts = <0x3 0xde 0x0 IRQ_TYPE_EDGE_RISING>;
>> +				interrupt-names = "lab-sc-err";
>> +			};
>> +
>> +			ibb_regulator: qcom,ibb@dc00 {
>> +				reg = <0xdc00>;
>> +				regulator-name = "ibb_reg";
>> +
>> +				interrupts = <0x3 0xdc 0x2 IRQ_TYPE_EDGE_RISING>;
>> +				interrupt-names = "ibb-sc-err";
>> +			};
>> +
>> +		};
>> +	};
> Regards,
> Bjorn
