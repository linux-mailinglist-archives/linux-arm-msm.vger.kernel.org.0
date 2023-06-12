Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 836A072B8BC
	for <lists+linux-arm-msm@lfdr.de>; Mon, 12 Jun 2023 09:38:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232392AbjFLHif (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 12 Jun 2023 03:38:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48392 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233298AbjFLHie (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 12 Jun 2023 03:38:34 -0400
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com [IPv6:2a00:1450:4864:20::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B00FB10FF
        for <linux-arm-msm@vger.kernel.org>; Mon, 12 Jun 2023 00:37:46 -0700 (PDT)
Received: by mail-lf1-x133.google.com with SMTP id 2adb3069b0e04-4f004cc54f4so4617060e87.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 12 Jun 2023 00:37:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1686555249; x=1689147249;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=q1/iA2KTeym2owa+RBl7xQJdLjQ/0GLTI4ghL8o+6f4=;
        b=v9VKGbi+o3opfHDTAWJSzgxszoDEWfnsWpHKIU5vOknGUg+RUX+JBNMNbqXS2iX5/3
         3jyiOTHFnY9Vhe2owKcnnNoGAX6sk2ISuc8BijANkddDhTtfE2AdUI0hH6Uk88pAlpN3
         8AeKauBNiaH2MuQurt1svZP4RhycIkqAfTY/rGl2NZV2ojDeSy6SYLJFzzkv0BlNiwpv
         HxrL1chG0MtiRnmB+UjEwGa38gSKdPdaYykV3PHh8BKtMxDMx+eH4321l/BhfmbbwVbV
         VUspSHBxIxZJMYLuhWvPf3gg2pbs5R/wuZWCbRNWmzll22Yb4v+F0T3+fTdd6YmiC9EL
         WT6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686555249; x=1689147249;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=q1/iA2KTeym2owa+RBl7xQJdLjQ/0GLTI4ghL8o+6f4=;
        b=ExCOnRrDmDYjiDy1YHOEWOlD9Zt/wQpi7j9Qval5BaoJ4gii0Cat+LNdYss3nbd+tb
         8/fSxx557eyH7iX/t3flFgB9Q8JUj3qJQucdSFe+izocyj1uvzAh1VNVpJH4vPSedCQp
         6pmG+zSmrVM4oV/fNmtZ3K3vTNCbUNNrEmSOxXIOTcHAqWJgjLt506n9lbaY4burfTn0
         ErZTuDcmCEt+77jmna4NZghSDcS0KXb9tCEJrtJix+uiw8qme7Uc12PL7DeBkcNtdIVH
         xLEDVoPTURh/u5fJbLdGo+tRoFDtBfGSPlxOI4D7SJtqCUZnz9QiunWP89IK38A3xtIF
         wrWg==
X-Gm-Message-State: AC+VfDxmnNQgGpV3NEgBtGcq3pfINzqJrz0Cdiq40zmfUXnMIHSX8T9H
        cJdNvBwYy29L3utHYuQyXkb488RMUT6UBnuer5c=
X-Google-Smtp-Source: ACHHUZ7DpcJxKlnnA6faPmN7jkMDpIN8+d1Ug1h4AEiqeOaJqh5Aerat92skVsX2xye2L3p+Xe35/Q==
X-Received: by 2002:aa7:d785:0:b0:514:9c77:50b7 with SMTP id s5-20020aa7d785000000b005149c7750b7mr4791408edq.25.1686554747114;
        Mon, 12 Jun 2023 00:25:47 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.219.26])
        by smtp.gmail.com with ESMTPSA id v26-20020aa7dbda000000b0050cc4461fc5sm4649433edt.92.2023.06.12.00.25.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 Jun 2023 00:25:46 -0700 (PDT)
Message-ID: <421ddd6d-3938-027c-2099-57248a111831@linaro.org>
Date:   Mon, 12 Jun 2023 09:25:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.2
Subject: Re: [PATCH v2 2/2] ASoC: codecs: wsa884x: Add WSA884x family of
 speakers
Content-Language: en-US
To:     Mark Brown <broonie@kernel.org>
Cc:     Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        Banajit Goswami <bgoswami@quicinc.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>, alsa-devel@alsa-project.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Patrick Lai <quic_plai@quicinc.com>
References: <20230611102657.74714-1-krzysztof.kozlowski@linaro.org>
 <20230611102657.74714-2-krzysztof.kozlowski@linaro.org>
 <191859d3-42e3-4ef2-87ff-dd56864103f9@sirena.org.uk>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <191859d3-42e3-4ef2-87ff-dd56864103f9@sirena.org.uk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 11/06/2023 13:57, Mark Brown wrote:
> On Sun, Jun 11, 2023 at 12:26:57PM +0200, Krzysztof Kozlowski wrote:
> 
>> +static struct reg_default wsa884x_defaults[] = {
> 
>> +	{ WSA884X_CHIP_ID0,			0x00 },
>> +	{ WSA884X_CHIP_ID1,			0x00 },
>> +	{ WSA884X_CHIP_ID2,			0x04 },
>> +	{ WSA884X_CHIP_ID3,			0x02 },
>> +	{ WSA884X_BUS_ID,			0x00 },
> 
> It is generally bad practice to provide defaults for ID registers since
> it rather defeats the point of having them.
> 
>> +	{ WSA884X_INTR_STATUS0,			0x00 },
>> +	{ WSA884X_INTR_STATUS1,			0x00 },
> 
> Interrupt status registers will be volatile and therefore should not
> have defaults.

Sure, makes sense, I'll drop all of the above.

> 
>> +	{ WSA884X_OTP_REG_0,			0x05 },
>> +	{ WSA884X_OTP_REG_1,			0x49 },
>> +	{ WSA884X_OTP_REG_2,			0x80 },
>> +	{ WSA884X_OTP_REG_3,			0xc9 },
>> +	{ WSA884X_OTP_REG_4,			0x40 },
>> +	{ WSA884X_OTP_REG_5,			0xff },
>> +	{ WSA884X_OTP_REG_6,			0xff },
>> +	{ WSA884X_OTP_REG_7,			0xff },
>> +	{ WSA884X_OTP_REG_8,			0xff },
>> +	{ WSA884X_OTP_REG_9,			0xff },
>> +	{ WSA884X_OTP_REG_10,			0xff },
>> +	{ WSA884X_OTP_REG_11,			0xff },
>> +	{ WSA884X_OTP_REG_12,			0xff },
>> +	{ WSA884X_OTP_REG_13,			0xff },
>> +	{ WSA884X_OTP_REG_14,			0xff },
>> +	{ WSA884X_OTP_REG_15,			0xff },
>> +	{ WSA884X_OTP_REG_16,			0xff },
>> +	{ WSA884X_OTP_REG_17,			0xff },
>> +	{ WSA884X_OTP_REG_18,			0xff },
>> +	{ WSA884X_OTP_REG_19,			0xff },
>> +	{ WSA884X_OTP_REG_20,			0xff },
>> +	{ WSA884X_OTP_REG_21,			0xff },
>> +	{ WSA884X_OTP_REG_22,			0xff },
>> +	{ WSA884X_OTP_REG_23,			0xff },
>> +	{ WSA884X_OTP_REG_24,			0x00 },
>> +	{ WSA884X_OTP_REG_25,			0x22 },
>> +	{ WSA884X_OTP_REG_26,			0x03 },
>> +	{ WSA884X_OTP_REG_27,			0x00 },
>> +	{ WSA884X_OTP_REG_28,			0x00 },
>> +	{ WSA884X_OTP_REG_29,			0x00 },
>> +	{ WSA884X_OTP_REG_30,			0x00 },
>> +	{ WSA884X_OTP_REG_31,			0x8f },
>> +	{ WSA884X_OTP_REG_32,			0x00 },
>> +	{ WSA884X_OTP_REG_33,			0xff },
>> +	{ WSA884X_OTP_REG_34,			0x0f },
>> +	{ WSA884X_OTP_REG_35,			0x12 },
>> +	{ WSA884X_OTP_REG_36,			0x08 },
>> +	{ WSA884X_OTP_REG_37,			0x1f },
>> +	{ WSA884X_OTP_REG_38,			0x0b },
>> +	{ WSA884X_OTP_REG_39,			0x00 },
>> +	{ WSA884X_OTP_REG_40,			0x00 },
>> +	{ WSA884X_OTP_REG_41,			0x00 },
>> +	{ WSA884X_OTP_REG_63,			0x40 },
> 
> These appear to be OTP data which suggests that they shouldn't have
> defaults either since they can be programmed.

Just to be clear - I don't have access to datasheet so I don't know what
are these. The downstream driver actually initializes (writes to) two
OTP registers - 38 and 40.

> 
>> +static bool wsa884x_readonly_register(struct device *dev, unsigned int reg)
>> +{
>> +	switch (reg) {
> 
> In general the read only registers probably shouldn't have defaults...

For the case when regmap is being read before device enumerates (thus
synced)?

> 
>> +static bool wsa884x_volatile_register(struct device *dev, unsigned int reg)
>> +{
>> +	switch (reg) {
>> +	case WSA884X_ANA_WO_CTL_0:
>> +	case WSA884X_ANA_WO_CTL_1:
>> +		return true;
>> +	}
>> +	return wsa884x_readonly_register(dev, reg);
>> +}
> 
> ...and the volatile regiseters definitely not, the default values will
> never be used and just waste space.

Right.

> 
>> +static struct regmap_config wsa884x_regmap_config = {
>> +	.reg_bits = 32,
>> +	.val_bits = 8,
>> +	.cache_type = REGCACHE_RBTREE,
> 
> Please use REGCACHE_MAPLE for new devices.

Ack

> 
>> +	/* Speaker mode by default */
>> +	{ WSA884X_DRE_CTL_0, 0x7 << WSA884X_DRE_CTL_0_PROG_DELAY_SHIFT },
>> +	{ WSA884X_CLSH_CTL_0, (0x37 & ~WSA884X_CLSH_CTL_0_DLY_CODE_MASK) |
>> +			      (0x6 << WSA884X_CLSH_CTL_0_DLY_CODE_SHIFT) },
>> +	{ WSA884X_CLSH_SOFT_MAX, 0xff },
> 
> Why not just leave as the chip default?

Sincerely, I don't know. Without any documentation, I am relying
entirely on downstream driver which has some code like this. I don't
know whether some parts here make sense only for downstream case or
shall be applicable also for upstream.

Best regards,
Krzysztof

