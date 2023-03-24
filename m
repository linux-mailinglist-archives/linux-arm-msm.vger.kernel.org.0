Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1103F6C7EAE
	for <lists+linux-arm-msm@lfdr.de>; Fri, 24 Mar 2023 14:25:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231717AbjCXNZT (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 24 Mar 2023 09:25:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50116 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231848AbjCXNZS (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 24 Mar 2023 09:25:18 -0400
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com [IPv6:2a00:1450:4864:20::435])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A9FD712BD7
        for <linux-arm-msm@vger.kernel.org>; Fri, 24 Mar 2023 06:25:17 -0700 (PDT)
Received: by mail-wr1-x435.google.com with SMTP id r11so1781756wrr.12
        for <linux-arm-msm@vger.kernel.org>; Fri, 24 Mar 2023 06:25:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1679664316;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Q/vpnoYYXwQldMjtKP/K9nn+5xpo0clbcm7Xi85Za5Q=;
        b=MwV/tT1w/89XxrGbyhJepCUgN+8UHN4wuO0E1mjgs954wzYtgqXwnCmlxTJF7t+DBT
         G8XQq/qfYrjbJ2GdHZ119/GQRELa1ao2S7wbI8kzdiDgk/iy/UmFoHNTPB7ORpNP3dJS
         AwV75+lOdSW7pMnnalw3EgnDGLBuSj1l16Rt7c0abxleP05MX+7Z9L1jO+qLs7FwvrTP
         fXLWmLzP3xBZqFn7RE2qIPVbaPKJ+DLIjbGL89PWC2ZV2RX8Za/rRbSA2L7Nat4h/6Hj
         RheFDGMsS/Zky/6/sZWoc0pMuSKJSgyPupaz4y4eEX7qxHkmCiTplbKg6uHsLZyXu3ez
         BDpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679664316;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Q/vpnoYYXwQldMjtKP/K9nn+5xpo0clbcm7Xi85Za5Q=;
        b=LqxyDldp0T1xlj5hLTYxXe/cTlou852mLtFYZsko9lId1iuRlCvKsQUCmDHAHXuPRo
         3milaTwKDq2Ql1wXtMz0caGBz+9m0cN18119rS+sHoa+eSXeyS+RKrNOunzd2ngJavUT
         m2xMaXFH63AhYk8u6xSWpnCe4iKsmRBz9OpWNspv5bQNqrv49bmWfyCorpKLh27NXpJh
         DDnzGyuf3Rkp0B51Q4RPZtmIXf4uuB54CZH2bg6Uhj/7AwcbaU6wiGZuO+H993vKIANO
         M63XRefXrGTogK1JUZtfSySVypPl4xvwiarcvnwfA685iyLeUj9fk887AsYq1yweed33
         MN6Q==
X-Gm-Message-State: AAQBX9d68fTygcYKDDhBMsbsRfNNt8oM/PUOXL9azYjwwtyPfRRpuuB+
        PvrJ01lgwn5bSutcYlEt6+lQZA==
X-Google-Smtp-Source: AKy350adc+qfpzwd1OS0FFZpxLLnNuQRsBkSQTXYQiBJiqpEzz6wvdacBweqtInNDFl/c/qX8toVMA==
X-Received: by 2002:a5d:4b42:0:b0:2c7:454:cee8 with SMTP id w2-20020a5d4b42000000b002c70454cee8mr2394735wrs.1.1679664315887;
        Fri, 24 Mar 2023 06:25:15 -0700 (PDT)
Received: from [192.168.0.162] (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id p17-20020adfcc91000000b002c71dd1109fsm18517921wrj.47.2023.03.24.06.25.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 24 Mar 2023 06:25:15 -0700 (PDT)
Message-ID: <6bd08120-115e-5429-63da-32f8df52bc7f@linaro.org>
Date:   Fri, 24 Mar 2023 13:25:14 +0000
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
 <ZBzyK0ILtUDr986r@Gentoo> <37d14447-0f10-be88-9cd9-8ebd30f1d006@linaro.org>
 <ZBz5OvauxQ2PWcHu@Gentoo> <40503ba8-7a38-0d1d-1d59-82101a0ce92e@linaro.org>
 <ZB14jJNUhHGBl7Az@Gentoo>
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <ZB14jJNUhHGBl7Az@Gentoo>
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

On 24/03/2023 10:16, Jianhua Lu wrote:

With charger
> [ 1495.824667] qcom,pmic-typec c440000.spmi:pmic@2:typec@1500:
> qcom_pmic_typec_set_vbus misc 0x000000c9

0xC9 == (TYPEC_SM_USBIN_LT_LV | TYPEC_SM_VBUS_VSAFE0V)

> [ 1495.824685] qcom,pmic-typec c440000.spmi:pmic@2:typec@1500:
> qcom_pmic_typec_set_vbus sm_status 0x000000b9

0xC9 == (TYPEC_SM_USBIN_LT_LV | TYPEC_SM_VBUS_VSAFE5V)

so that is correct and expected i.e. VSAFE5V it shouldn't matter to the 
type-c port controller *where* VBUS comes from only that it is within range.

Could you run again with an unpowered device and post the printout?

---
bod
