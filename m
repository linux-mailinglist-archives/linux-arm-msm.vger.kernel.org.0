Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A21A06C74C7
	for <lists+linux-arm-msm@lfdr.de>; Fri, 24 Mar 2023 01:54:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230196AbjCXAx7 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 23 Mar 2023 20:53:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41708 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231173AbjCXAx4 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 23 Mar 2023 20:53:56 -0400
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com [IPv6:2a00:1450:4864:20::431])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F4039527F
        for <linux-arm-msm@vger.kernel.org>; Thu, 23 Mar 2023 17:53:25 -0700 (PDT)
Received: by mail-wr1-x431.google.com with SMTP id d17so212574wrb.11
        for <linux-arm-msm@vger.kernel.org>; Thu, 23 Mar 2023 17:53:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1679619191;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=jnLp0VndimycoXGpOfcSpUE952KxS1sMHfhM4iDhErk=;
        b=qboJr1PW7Tk89Ok0yBbowSN/Xnx3wSo1YDYbdD9i5YxI4fHdk9mpAIWm905wXzhPuX
         yjymCmbzHHDhQ2NEs7WV+a6zqhI8RNQgfsJEAlil9MWSDVwIDHz9iMPMi1bkKRJRAZ2i
         OoBbtHzJl19nglrzYcvEEoAjDEdbJaq992620m5nbO+NgcHbojpprF1S4POg8DRTZduL
         mL5xUb1oJqSGBv9khxGwocYr4fWm+eKZDofH4h52PBeDR7GV+chcFZ2DXPEcPif2o90L
         j9KuzRrHkgWXksGZW7rYgisFeDl9Gx2uTgFalkxcD53n5E65Ls38aUmNZi83161lAiXm
         +jXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679619191;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=jnLp0VndimycoXGpOfcSpUE952KxS1sMHfhM4iDhErk=;
        b=d4WsArr5c8n28patUtf9Wl7VUP140rmjHLftdM+/P1pnyLOxD/in+TA5QVbzg+xkNc
         Ur6kyGH9et2fZzFOrb+xVGKgnUB5kBD+chxlpBSse8MLE2k+XItnM7zdtj57QaTzcXCL
         WtwGYaYqxlx2MJoixeU6PA08qHHxvhaGXxX4LPeM/IogKZrnvFsRV+aGTcBuaDeXZd+k
         Ggx4uPC1eQv5qGPdcaR66cGwzIpzfcaAMpRO13BbJ/94o+5KyDxQV5PbOsEMSktLMNnY
         4ql06YXQCFVl/2EEU1uN5WoZ45hK2YGe2Qj/xcSIdRZgQ5uFRxBRCZco62Xh0hgeAy0M
         UIaw==
X-Gm-Message-State: AAQBX9c/Ze2Gbu6pDXM6rUe3Gx7Kdnga21+pJ+E7m07jmjvDUOFuPaiF
        X7467Y8bEGl3h34ANsnggN9yeg==
X-Google-Smtp-Source: AKy350aXlMJSWEqrRzO/Rk0HuqgdAsHOQyZ6edRGK7mhVILoJN/Mo71+44QVracwRGUsB/SqMer2qg==
X-Received: by 2002:a5d:58c9:0:b0:2cf:e3a9:c189 with SMTP id o9-20020a5d58c9000000b002cfe3a9c189mr775025wrf.3.1679619191293;
        Thu, 23 Mar 2023 17:53:11 -0700 (PDT)
Received: from [192.168.0.162] (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id l12-20020adfe9cc000000b002cea8e3bd54sm17202175wrn.53.2023.03.23.17.53.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 23 Mar 2023 17:53:10 -0700 (PDT)
Message-ID: <37d14447-0f10-be88-9cd9-8ebd30f1d006@linaro.org>
Date:   Fri, 24 Mar 2023 00:53:09 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v4 12/18] usb: typec: qcom: Add Qualcomm PMIC TCPM support
Content-Language: en-US
To:     Jianhua Lu <lujianhua000@gmail.com>
Cc:     linux@roeck-us.net, heikki.krogerus@linux.intel.com,
        gregkh@linuxfoundation.org, andersson@kernel.org,
        robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        linux-usb@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, wcheng@codeaurora.org,
        caleb.connolly@linaro.org, konrad.dybcio@linaro.org,
        subbaram@quicinc.com, jackp@quicinc.com, robertom@qti.qualcomm.com
References: <20230318121828.739424-1-bryan.odonoghue@linaro.org>
 <20230318121828.739424-13-bryan.odonoghue@linaro.org>
 <ZBxkB04KqY8WbeA1@Gentoo> <89bca327-a860-672c-b4ae-766698d38639@linaro.org>
 <ZBzyK0ILtUDr986r@Gentoo>
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <ZBzyK0ILtUDr986r@Gentoo>
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

On 24/03/2023 00:43, Jianhua Lu wrote:
>> Can you show the printout of *(pmic_typec->base + TYPEC_SM_STATUS_REG) ?
> [   53.120005] hub 1-1:1.0: 4 ports detected
> [   58.675134] typec base is 0x1500
> [   58.675148] TYPEC_SM_STATUS_REG is 0xa
> [   58.675153] typec status reg is 0x150a
> It should be correct.
>> And can you check your schematics and verify VBUS is supplied by
>> pm8150b_vbus and not say by an external IC ?
> I haven't schematics, so I can only use hacking code to test it.

Could you show the state of TYPEC_MISC_STATUS_REG @ 0x0b ?

I wonder if BIT(5) TYPEC_VBUS_DETECT is set ?

BTW what sort of device have you connected here and is it self-powered ?

---
bod
