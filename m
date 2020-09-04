Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0C4F025D6F6
	for <lists+linux-arm-msm@lfdr.de>; Fri,  4 Sep 2020 13:03:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729795AbgIDLDe (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 4 Sep 2020 07:03:34 -0400
Received: from a27-187.smtp-out.us-west-2.amazonses.com ([54.240.27.187]:47640
        "EHLO a27-187.smtp-out.us-west-2.amazonses.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1730072AbgIDLCi (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 4 Sep 2020 07:02:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
        s=zsmsymrwgfyinv5wlfyidntwsjeeldzt; d=codeaurora.org; t=1599217356;
        h=Subject:To:Cc:References:From:Message-ID:Date:MIME-Version:In-Reply-To:Content-Type:Content-Transfer-Encoding;
        bh=Q7ONTmdE5O3zyLoRbKjUDWi27jlQPvzVzwB8xEHuo3M=;
        b=J6FS+dv1NpbNINcarhMsi794OnIO2mUwN9SoQvJ7A39UuMwwAojgeVBGm1EK5uTe
        jAoo3zfZ5HppVXofuJeKEKEbHp5PEODY0LyQ0mQVE5Y/jGvGVHk4wo32vTNpkCSXrfT
        0nSF0aKKG3RTqO524NuJiozJT3rdkR4axQ6OTU+o=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
        s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1599217356;
        h=Subject:To:Cc:References:From:Message-ID:Date:MIME-Version:In-Reply-To:Content-Type:Content-Transfer-Encoding:Feedback-ID;
        bh=Q7ONTmdE5O3zyLoRbKjUDWi27jlQPvzVzwB8xEHuo3M=;
        b=OnyXS8r632k1aNkqKxNnhwpx9LeCYmkYDx+29gxeOOn/d5IwZOIY8LtZ27ow0sLY
        QYYkr/tcJta4LiTClQE0lM5FRwz/89VUFVF7JEZSX7eLXEOaexaFpqGnyQ0K36gjPeO
        V84IXwNCvUd6QWVrvegKgQAJsgiy90oqXYv+zQj0=
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=2.0 tests=ALL_TRUSTED,NICE_REPLY_A,
        SPF_FAIL,URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org D1056C43222
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=srivasam@codeaurora.org
Subject: Re: [PATCH v3 2/5] ASoC: dt-bindings: Add dt binding for lpass hdmi
To:     Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        agross@kernel.org, bjorn.andersson@linaro.org, lgirdwood@gmail.com,
        broonie@kernel.org, robh+dt@kernel.org, plai@codeaurora.org,
        bgoswami@codeaurora.org, perex@perex.cz, tiwai@suse.com,
        rohitkr@codeaurora.org, linux-arm-msm@vger.kernel.org,
        alsa-devel@alsa-project.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     V Sujith Kumar Reddy <vsujithk@codeaurora.org>
References: <1598855964-1042-1-git-send-email-srivasam@codeaurora.org>
 <1598855964-1042-3-git-send-email-srivasam@codeaurora.org>
 <0aa914dd-6a6e-208d-d29f-214a84dfd8a2@linaro.org>
From:   Srinivasa Rao Mandadapu <srivasam@codeaurora.org>
Organization: Qualcomm India Private Limited
Message-ID: <0101017458c84d4b-5236b891-5a8c-4edb-8ff3-bd1ceac88928-000000@us-west-2.amazonses.com>
Date:   Fri, 4 Sep 2020 11:02:36 +0000
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.2.1
MIME-Version: 1.0
In-Reply-To: <0aa914dd-6a6e-208d-d29f-214a84dfd8a2@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-SES-Outgoing: 2020.09.04-54.240.27.187
Feedback-ID: 1.us-west-2.CZuq2qbDmUIuT3qdvXlRHZZCpfZqZ4GtG9v3VKgRyF0=:AmazonSES
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Thanks Srinivas For Review!!!

On 9/4/2020 4:11 PM, Srinivas Kandagatla wrote:
>
>
> On 31/08/2020 07:39, Srinivasa Rao Mandadapu wrote:
>> From: V Sujith Kumar Reddy <vsujithk@codeaurora.org>
>>
>> Adds bindings for lpass hdmi interface
>> which can support audio path over dp.
>>
>> Signed-off-by: Srinivasa Rao <srivasam@codeaurora.org>
>> Signed-off-by: V Sujith Kumar Reddy <vsujithk@codeaurora.org>
>> ---
>>   .../devicetree/bindings/sound/qcom,lpass-cpu.yaml  | 51 
>> ++++++++++++++++++++--
>>   1 file changed, 47 insertions(+), 4 deletions(-)
>>
>> diff --git 
>> a/Documentation/devicetree/bindings/sound/qcom,lpass-cpu.yaml 
>> b/Documentation/devicetree/bindings/sound/qcom,lpass-cpu.yaml
>> index 09c9bd2..7c2ac0c 100644
>> --- a/Documentation/devicetree/bindings/sound/qcom,lpass-cpu.yaml
>> +++ b/Documentation/devicetree/bindings/sound/qcom,lpass-cpu.yaml
>> @@ -22,6 +22,7 @@ properties:
>>         - qcom,lpass-cpu
>>         - qcom,apq8016-lpass-cpu
>>         - qcom,sc7180-lpass-cpu
>> +      - qcom,sc7180-lpass-hdmi
>
> Why do we need a new compatible per interface, IMO, you should just 
> use the existing compatible.
> Or please explain the reasons why we need this?
Two compatible strings are used because iommu's are different for I2S 
and HDMI.
>
>>       reg:
>>       maxItems: 1
>> @@ -60,10 +61,12 @@ properties:
>>       const: 0
>>     patternProperties:
>> -  "(^mi2s-[0-9a-f]$|mi2s)":
>> +  "^dai@[0-9a-f]$":
>>       type: object
>> -    description: Required properties for each DAI
>> -
>> +    description: |
>> +      LPASS CPU dai node for each I2S device. Bindings of each node
>> +      depends on the specific driver providing the functionality and
>> +      properties.
>>       properties:
>>         reg:
>>           maxItems: 1
>> @@ -145,6 +148,22 @@ allOf:
>>           - iommus
>>           - power-domains
>>   +  - if:
>> +      properties:
>> +        compatible:
>> +          contains:
>> +            const: qcom,sc7180-lpass-hdmi
>> +    then:
>> +      properties:
>> +        clock-names:
>> +          items:
>> +            - const: pcnoc-sway-clk
>> +            - const: audio-core
>> +            - const: pcnoc-mport-clk
>> +      required:
>> +        - iommus
>> +        - power-domains
>> +
>>   examples:
>>     - |
>>       #include <dt-bindings/sound/sc7180-lpass.h>
>> @@ -178,12 +197,36 @@ examples:
>>               #address-cells = <1>;
>>               #size-cells = <0>;
>>               /* Optional to set different MI2S SD lines */
>> -            mi2s-primary@0 {
>> +            dai@mi2s-primary {
>>                   reg = <MI2S_PRIMARY>;
>>                   qcom,playback-sd-lines = <1>;
>>                   qcom,capture-sd-lines = <0>;
>>               };
>>           };
>> +
>> +        lpassh@62d87000 {
>> +            compatible = "qcom,sc7180-lpass-hdmi";
>> +
>> +            reg = <0 0x62d87000 0 0x68000>;
>> +
>> +            iommus = <&apps_smmu 0x1032 0>;
>> +
>> +            power-domains = <&lpass_hm 0>;
>> +
>> +            clocks = <&gcc 131>,
>> +                 <&lpasscc 6>,
>> +                 <&lpasscc 10>;
>> +
>> +            clock-names = "pcnoc-sway-clk", "audio-core",
>> +                          "pcnoc-mport-clk";
>> +
>> +            #sound-dai-cells = <1>;
>> +
>> +            #address-cells = <1>;
>> +            #size-cells = <0>;
>> +
>> +            interrupts = <0 268 1>;
>> +        };
>>       };
>>     ...
>>
-- 
Qualcomm India Private Limited, on behalf of Qualcomm Innovation Center, Inc.,
is a member of Code Aurora Forum, a Linux Foundation Collaborative Project.

