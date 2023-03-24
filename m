Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5515C6C75F4
	for <lists+linux-arm-msm@lfdr.de>; Fri, 24 Mar 2023 03:37:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231707AbjCXChU (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 23 Mar 2023 22:37:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50690 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229508AbjCXChT (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 23 Mar 2023 22:37:19 -0400
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com [IPv6:2a00:1450:4864:20::429])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 92B0F1588B
        for <linux-arm-msm@vger.kernel.org>; Thu, 23 Mar 2023 19:37:18 -0700 (PDT)
Received: by mail-wr1-x429.google.com with SMTP id h17so354990wrt.8
        for <linux-arm-msm@vger.kernel.org>; Thu, 23 Mar 2023 19:37:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1679625437;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=YEOsYDVPXPvT6xBWURPYfitF6YhMVNCwrfmRP/8BTo8=;
        b=MAtlL1yHaHEd2J7Ju49TCqb2krEY5tjSeE4wG3QQMOA4vWvyyf9EXb3YjesqVveMe6
         JMUSvb5qzKyFZwsQ5oEN4zoU/uU/sItgCrtdz64H3TLZtBv32Xs/dMT7OFO1yHIWZUCr
         FfFbv7E5gDY/gOnO/sRZDthqUqh2IQQB1QxyDu+m9XLFn+JAo/nWo5zaoPsbqTWXsQ13
         u5RVmHDR0wc0tphLY3Q6J9O+NaLd9bI2vy5FsnV6kpOkCn6NWEEvX+Xhguc+h/Dfxz+I
         3FpoPJs6FY8+5L+KJ5SCcCdskJATztf9gQnNPC4TUuoCAnr75arNsA1eueaubZiEv8cj
         pVGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679625437;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=YEOsYDVPXPvT6xBWURPYfitF6YhMVNCwrfmRP/8BTo8=;
        b=DZi9CEc1rsOcg7wONDKGlYKP/AA2eR6F8BPBiqijAP1FO//HTXAAH5sNjCVpgXAFJ+
         sDsli3B+5hG37BuI8irQhtEu5hyFRozEZjEf926VVtU82vvKkvEwHw1PM4I/sktPmAO2
         2hgCrMM9FoCU1ry0JEzseQuhzQwN9jc1sxiHEPShIkOxop0v6Qpri+2Tq+GPkLa1VkbH
         1oCHapPOC6hbAsMDcEd1bB3Zn4NdlE4tc/hJCHRasmPZOC98MhTNob5Kbbo6z60rnxZf
         4dgTlU63CASypOAK1edZ9K1sldooae0cVxOvP3DNwGxEWrD4i5rdf+c1CgDs7KICxuJa
         p81g==
X-Gm-Message-State: AAQBX9fOurEaNvgn+3UqCAnWdR6Z984ylGJriPRY5QNDvETtUFBEFJHW
        +8GLYsBkk78bnqbe1NVE4bgmbg==
X-Google-Smtp-Source: AKy350ah1Qvll27YEQjgjx35lE0s6/AmJ9izoxjYHzCELB0/tlrtVCmpxUUMWfldFVnk2xwO+lg8eA==
X-Received: by 2002:a5d:430f:0:b0:2ce:ae57:71dd with SMTP id h15-20020a5d430f000000b002ceae5771ddmr788668wrq.51.1679625437018;
        Thu, 23 Mar 2023 19:37:17 -0700 (PDT)
Received: from [192.168.0.162] (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id j20-20020a5d6e54000000b002cea8664304sm17256981wrz.91.2023.03.23.19.37.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 23 Mar 2023 19:37:16 -0700 (PDT)
Message-ID: <40503ba8-7a38-0d1d-1d59-82101a0ce92e@linaro.org>
Date:   Fri, 24 Mar 2023 02:37:15 +0000
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
 <ZBz5OvauxQ2PWcHu@Gentoo>
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <ZBz5OvauxQ2PWcHu@Gentoo>
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

On 24/03/2023 01:13, Jianhua Lu wrote:
>> Can you show the printout of *(pmic_typec->base + TYPEC_SM_STATUS_REG) ?
> [   53.120005] hub 1-1:1.0: 4 ports detected
> [   58.675134] typec base is 0x1500
> [   58.675148] TYPEC_SM_STATUS_REG is 0xa
> [   58.675153] typec status reg is 0x150a
> It should be correct.

So that is some very very strange value you have in that register.

This is from my WIP tree so the filename has changed but

+#define DEBUG 1
  #include <linux/delay.h>
  #include <linux/err.h>
  #include <linux/interrupt.h>
@@ -181,6 +181,17 @@ int qcom_pmic_typec_port_set_vbus(struct 
pmic_typec_port *pmic_typec_port, bool
         if (ret)
                 dev_err(pmic_typec_port->dev, "vbus vsafe%dv fail\n", 
on ? 5 : 0);

+       dev_info(pmic_typec_port->dev, "%s sm_stat output 0x%08x\n", 
__func__, sm_stat);
+
+       ret = regmap_read(pmic_typec_port->regmap,
+                         pmic_typec_port->base + TYPEC_MISC_STATUS_REG,
+                         &val);
+       dev_info(pmic_typec_port->dev, "%s misc 0x%08x\n", __func__, val);
+       ret = regmap_read(pmic_typec_port->regmap,
+                         pmic_typec_port->base + TYPEC_SM_STATUS_REG,
+                         &val);
+       dev_info(pmic_typec_port->dev, "%s sm_status 0x%08x\n", 
__func__, val);

[   17.098067] qcom,pmic-typec c440000.spmi:pmic@2:typec@1500: 
qcom_pmic_typec_port_set_vbus sm_stat output 0x000000b9

[   17.108819] qcom,pmic-typec c440000.spmi:pmic@2:typec@1500: 
qcom_pmic_typec_port_set_vbus misc 0x000000cb

[   17.118659] qcom,pmic-typec c440000.spmi:pmic@2:typec@1500: 
qcom_pmic_typec_port_set_vbus sm_status 0x000000b9

SM_STAT == 0xb9 => 10111001

1 : TYPEC_SM_USBIN_LT_LV
0 : TYPEC_SM_VBUS_VSAFE0V
1 : TYPEC_SM_VBUS_VSAFE5V
1 : not mapped
1 : not mapped
0 : not mapped
0 : not mapped
1 : not mapped

In other words, my hardware gives a clear indication of the appropriate 
transition.

Would appreciate if you could apply the above "patch"

That said I _am_ included to believe you and to do something about it, I 
will downgrade to a warning instead of returning on error in failure to 
transition to VSafeVX

Yeah though I'd appreciate seeing the output of the above patch to see 
if there's something we are missing.

Thanks for your review/time/input

---
bod
