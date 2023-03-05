Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8A6B16AB13F
	for <lists+linux-arm-msm@lfdr.de>; Sun,  5 Mar 2023 16:36:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229469AbjCEPgm (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 5 Mar 2023 10:36:42 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34408 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229451AbjCEPgl (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 5 Mar 2023 10:36:41 -0500
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 98EC41041A;
        Sun,  5 Mar 2023 07:36:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
        s=20170329; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
        References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
        Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
        Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
        List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=YRN1L1SN7LOnXSGsxy6HeScRGD9I0SoxQsJI4DGiZbA=; b=Rpj/WhrE8lWdDXkBrQ1aFsT+7K
        IJzy1Rkh4Biv8TQ4Kk07QSD4q2kH+uoHKpz4YC6TsRFPjnbezdLBNkv3EOQshi6OEnf4ocawQzDvG
        9ls+jPg0LEI/42+S81b1iNMycWLXUfs1UK6hta8U75T1SA7251OsDDGeg4LMAVutb+QI84s31WUZX
        VoJv8Z3wZmdsy2904iNM20pVO7r0OLrsI5FmgExKo8nsn7WBHEeJ3zH0Vvi4VpbDCmCySEYqAlrtM
        4LD3ocGXkNd+zU4/CvcwCZghadwbA6Bd3QNmxfoLeGnAqyBWE4cL9hOE+dprXjOoxp8wcuwfPA/2z
        slYdg4Hw==;
Received: from 201-68-164-191.dsl.telesp.net.br ([201.68.164.191] helo=[192.168.1.60])
        by fanzine2.igalia.com with esmtpsa 
        (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
        id 1pYqPY-005isA-7H; Sun, 05 Mar 2023 16:36:32 +0100
Message-ID: <09879b66-4f72-a205-3e2d-cd8d8113625c@igalia.com>
Date:   Sun, 5 Mar 2023 12:36:23 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH] arm64: dts: qcom: msm8996: Add missing property for
 OnePlus 3T
Content-Language: en-US
To:     Konrad Dybcio <konrad.dybcio@linaro.org>,
        Harry Austen <hpausten@protonmail.com>
Cc:     devicetree@vger.kernel.org, agross@kernel.org,
        linux-arm-msm@vger.kernel.org, andersson@kernel.org,
        konrad.dybcio@somainline.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, kernel-dev@igalia.com,
        kernel@gpiccoli.net, Yassine Oudjana <y.oudjana@protonmail.com>
References: <20230213201651.1902323-1-gpiccoli@igalia.com>
 <d34d8851-fd73-9b87-9340-df25b64e96bb@linaro.org>
From:   "Guilherme G. Piccoli" <gpiccoli@igalia.com>
In-Reply-To: <d34d8851-fd73-9b87-9340-df25b64e96bb@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,SPF_HELO_NONE,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 13/02/2023 18:49, Konrad Dybcio wrote:
> [...] 
>> diff --git a/arch/arm64/boot/dts/qcom/msm8996-oneplus3t.dts b/arch/arm64/boot/dts/qcom/msm8996-oneplus3t.dts
>> index 34f837dd0c12..5dc8f0adab30 100644
>> --- a/arch/arm64/boot/dts/qcom/msm8996-oneplus3t.dts
>> +++ b/arch/arm64/boot/dts/qcom/msm8996-oneplus3t.dts
>> @@ -14,6 +14,7 @@ / {
>>  	qcom,board-id = <8 0 15811 26>,
>>  			<8 0 15811 27>,
>>  			<8 0 15811 28>;
>> +	qcom,msm-id = <246 0x30001>;
> Hm, this doesn't sound right.. Internet says 3T has 8996Pro..
> Could you check:
> 
> /sys/bus/soc/devices/soc0/soc_id  # reg[0]
> /sys/bus/soc/devices/soc0/revision # reg[1] after some shifting
> 
> Also, please include include/dt-bindings/arm/qcom,ids.h and use
> the preprocessor constant from there instead of a magic number in
> the first part of the reg value.
> 
> Konrad

Hi Konrad, thanks for your review!

Unfortunately I don't have this device, I based my patch in the other
Oneplus 3. Maybe Harry Austen (CCed) or anybody in this thread or list
have the device?

Curiosity questions, since I'm far from expert in the device-tree world:
what happens in case the device-tree doesn't export/contain this
property (exactly the case we have right now)? Does the device work
fine? Also, having it "wrong" (based on the other OnePlus 3) is worse
than not having it? In other words, what's the default value picked if
none is provided in the DT?

Cheers,


Guilherme
