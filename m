Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E26096E3CF3
	for <lists+linux-arm-msm@lfdr.de>; Mon, 17 Apr 2023 02:30:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229513AbjDQAaN (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 16 Apr 2023 20:30:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53306 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229473AbjDQAaM (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 16 Apr 2023 20:30:12 -0400
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com [IPv6:2a00:1450:4864:20::331])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B261A2115
        for <linux-arm-msm@vger.kernel.org>; Sun, 16 Apr 2023 17:30:10 -0700 (PDT)
Received: by mail-wm1-x331.google.com with SMTP id v10so6357002wmn.5
        for <linux-arm-msm@vger.kernel.org>; Sun, 16 Apr 2023 17:30:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1681691409; x=1684283409;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Zf5O6CiQ77IPN6AHC/bcYo5YF0Mkqd/lsDjW3zLTbm8=;
        b=kUiRMSScXc+Rl+ydWXkBofgS/vHddktsqIQs004lxqo4aR32qEngTSTBtHFV8eTZpM
         CoUMHbv/+v9y/ssBSH9eP82wYQAgvrvUxLPPBOII/Rm7oXNv9NmKL94YEEW34IVB0PVN
         XrHDriX9ZSVfllBeFj4RQHFnIJZL6EF1AW6IFhJFyKrh9siaAUgIgKK9xcu31S9v55B7
         oc3i4SIG7dxjV7YHUlXNyM/9OvS7qDtHHf8zjkV5yq7y54Uzg/JdJZ+q32/QetwkYxgW
         kmPX62QOKsZsQAz8zdkQWR31zTTz2bZMBF/ROVvIyeCfqug66tcmaHctOPpMAhYWmFaB
         Kbmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681691409; x=1684283409;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Zf5O6CiQ77IPN6AHC/bcYo5YF0Mkqd/lsDjW3zLTbm8=;
        b=E1kMU4eQkBBLDzBKYggwZqTNaL/UvQnwj6o2c05zK6QHH1mGiVH9O3S9k20sreqj6O
         1TZRxPe+Yi545oCnCI9X90j3bwtO9mZJFAGlAtbg3AoilILVogbaLhgz8BarpgzmXggu
         WaL+5PNi+UhOko1ma2Artx+RXD5pOKbrj3tQYdF8yhfzhU6bbmwsHTCmAnxZCYdHLEP6
         b3566e0oEEkVEMIu5iCUpUZV1azj0a0gt2iEGuqs4gbSD0eYpVQOjzyRcdTVCpA2OPCf
         OnrBeqiZ03DkSPgEaYMenJfI/gFkJ6W2bhc8AoR2eYCRShsfxpeUifAaYUkOCXBZ4SYU
         Sp5Q==
X-Gm-Message-State: AAQBX9f5wjC+/TvMGzNNl4UbXnq2yyxqS487U1i2I6XB4f+KTXGqovog
        bYgr+OuW5CtfSI+ZiEV9yOvYGQ==
X-Google-Smtp-Source: AKy350Yo+1ZvR9FHyQaXq0IjpphYPkuuGWmiMqdK7Z9obsxBjZ+ComKde13ZmOB4Jg75sjr5K1p2dg==
X-Received: by 2002:a05:600c:2251:b0:3ed:316d:668d with SMTP id a17-20020a05600c225100b003ed316d668dmr9244105wmm.5.1681691409196;
        Sun, 16 Apr 2023 17:30:09 -0700 (PDT)
Received: from [192.168.0.162] (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id c8-20020a05600c0a4800b003ee5fa61f45sm14234598wmq.3.2023.04.16.17.30.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 16 Apr 2023 17:30:08 -0700 (PDT)
Message-ID: <ccc9fa4c-ca52-d8f3-a8b3-45031bea673f@linaro.org>
Date:   Mon, 17 Apr 2023 01:30:07 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v5 00/14] Add Qualcomm PMIC TPCM support
Content-Language: en-US
To:     Luca Weiss <luca.weiss@fairphone.com>, linux@roeck-us.net,
        heikki.krogerus@linux.intel.com, gregkh@linuxfoundation.org,
        andersson@kernel.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, linux-usb@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
Cc:     caleb.connolly@linaro.org, konrad.dybcio@linaro.org,
        subbaram@quicinc.com, jackp@quicinc.com, robertom@qti.qualcomm.com
References: <20230413113438.1577658-1-bryan.odonoghue@linaro.org>
 <CRVOZOPMKBX4.2T7FOCWF0RKBJ@otso>
 <10551f5e-4516-c0cc-0b04-73aa38f80a2c@linaro.org>
 <CRWA2OP2T6KT.RCWAVWF5Q2T2@otso>
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <CRWA2OP2T6KT.RCWAVWF5Q2T2@otso>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 14/04/2023 07:51, Luca Weiss wrote:
> I see "reverse" and "normal" depending on the direction the USB stick is
> plugged in. When unplugged but also when plugged into my PC it stays at
> "unknown".

Right so, this is down to bad behavior on the PHY patch, which is 
resolved for me on sm8250 with the below.

Basically when you unplug a device you would transition back to 
"TYPEC_ORIENTATION_NONE" but that would turn off the PHY, which is obs 
not very useful if you want to subsequently be a gadget.

Anyway thanks for testing this - I'd missed the 
host->device->host->device ping-pong breakage.

diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-combo.c 
b/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
index b9a30c087423d..edb788a71edeb 100644
--- a/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
+++ b/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
@@ -3372,12 +3372,13 @@ static int qmp_combo_typec_switch_set(struct 
typec_switch_dev *sw,

         qmp->orientation = orientation;

-       if (orientation == TYPEC_ORIENTATION_NONE) {
-               if (qmp->init_count)
-                       ret = qmp_combo_dp_power_off(dp_phy);
-       } else {
-               if (!qmp->init_count)
-                       ret = qmp_combo_dp_power_on(dp_phy);
+       if (orientation != TYPEC_ORIENTATION_NONE) {
+               ret = qmp_combo_dp_power_off(dp_phy);
+               if (ret)
+                       return ret;
+               ret = qmp_combo_dp_power_on(dp_phy);
+               if (ret)
+                       return ret;
         }

---
bod
