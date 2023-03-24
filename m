Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 96D726C8130
	for <lists+linux-arm-msm@lfdr.de>; Fri, 24 Mar 2023 16:28:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231580AbjCXP2k (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 24 Mar 2023 11:28:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57962 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229540AbjCXP2j (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 24 Mar 2023 11:28:39 -0400
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com [IPv6:2a00:1450:4864:20::42f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 14C071DB8E
        for <linux-arm-msm@vger.kernel.org>; Fri, 24 Mar 2023 08:28:35 -0700 (PDT)
Received: by mail-wr1-x42f.google.com with SMTP id m2so2213476wrh.6
        for <linux-arm-msm@vger.kernel.org>; Fri, 24 Mar 2023 08:28:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1679671713;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=z5srmsqlcg8umGs3LaBjmV1e0O8IUDxrHiOdqEkIUYo=;
        b=nMIleCic/HqZvdIypobaa4t1WzWsIZbJLdfTm3ah+ecMDjnVLrBn7Q8cjjN2fS7bJO
         ciYaGkVKQmE0BWacHDM0FoCGCjPUxoLahumNWgIA4marRdfNfykDTsma+m/3pmUBe2YC
         RCBEziGrtnyrBbFSl/e6ZTrKS7MuJpLcWUvbS7q4HG+T8tjWljktWAj1PSKbvZm8f403
         G1Xdal3l2fAkA48WHQxG9JFHW5xgk6EjnvKcRFHL9VrnvoYpG2Ut93xrbKN9kecf8jL3
         7mmg8cT1J67uKWLj3niaZNrkYonLVewzhAnJzHg4koA5ivLk0dXXby+6DiMRi2TbGw4q
         cYPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679671713;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=z5srmsqlcg8umGs3LaBjmV1e0O8IUDxrHiOdqEkIUYo=;
        b=WfSNOKB7M/dg8SvF9Bj20xK67wpdEI93AKVEA76b9Z6l8rBFRBUTYMzWKMa1SL6XdO
         2owqKtR93hSuN6btkP/ryHSP7I9wQtPgGbPYOP79pTQUrk6G7HNdDQxLvABGnn6t9Wbe
         e1sDqSQS1OPDS8lPRT153qPiJ1SacNnMKfOmKh3pIk/i2VHDi5XuHOSFtDOU01Wkx6a1
         h2xEYNEcm0c1iNcqBwtqd0BCN9SMPaSLv955j+eowY+LLpsuiC2wpkeIQFCbWGqLxVrf
         5sfHPvV+4FBNIi7r6J419ka3OYFHoethXbrlH6tO+L2/tu/Sh9/iU4z1SzFuxjWDAvNp
         eHbw==
X-Gm-Message-State: AAQBX9d6F11uidfy9I+ZGScXfsTfTHJUbrGJHBld1vC+/KPqlS7mwdef
        gPMFtcXb/6ZE9kXyvd6yt31ZNA==
X-Google-Smtp-Source: AKy350byfti3VnOwNReDw3ErCqUryyx858RfEMp/sZR16Or3efO3Wii8+6MRE3pOPQQQHgfRJz8aXQ==
X-Received: by 2002:adf:f6c9:0:b0:2c7:161e:702f with SMTP id y9-20020adff6c9000000b002c7161e702fmr2637724wrp.47.1679671713572;
        Fri, 24 Mar 2023 08:28:33 -0700 (PDT)
Received: from [192.168.0.162] (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id f24-20020a7bc8d8000000b003eb596cbc54sm5263343wml.0.2023.03.24.08.28.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 24 Mar 2023 08:28:33 -0700 (PDT)
Message-ID: <9c541f81-8501-a142-1df8-6e71509c0d88@linaro.org>
Date:   Fri, 24 Mar 2023 15:28:32 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v4 00/18] Add Qualcomm PMIC TPCM support
Content-Language: en-US
To:     Luca Weiss <luca.weiss@fairphone.com>, linux@roeck-us.net,
        heikki.krogerus@linux.intel.com, gregkh@linuxfoundation.org,
        andersson@kernel.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, linux-usb@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
Cc:     wcheng@codeaurora.org, caleb.connolly@linaro.org,
        konrad.dybcio@linaro.org, subbaram@quicinc.com, jackp@quicinc.com,
        robertom@qti.qualcomm.com, lujianhua000@gmail.com
References: <20230318121828.739424-1-bryan.odonoghue@linaro.org>
 <CREPJP5KTX2D.VCM8IIZIP1ZT@otso>
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <CREPJP5KTX2D.VCM8IIZIP1ZT@otso>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 24/03/2023 15:10, Luca Weiss wrote:
> When plugging in the device with TCPM on into my PC (peripheral mode)
> then the USB device registers and unregisters every couple of seconds,
> never stays stable on. No messages in dmesg when this happens. This only
> happens with the USB-C plug in one direction, in the other it
> works reliable.

Sounds like we need to do some SoC specific debug on orientation 
switching in the PHY.

I wonder how many lanes dp_opts->lanes says for your part ?

Also potentially not having "orientation-switch" in &usb_1_qmpphy{} but, 
I think we discussed that before.

So either

- PHY orientation turn-around isn't working or
- DTS orientation-switch isn't happening

for you

---
bod
