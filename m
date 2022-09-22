Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C2E6F5E65AB
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 Sep 2022 16:32:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231574AbiIVOcb (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 22 Sep 2022 10:32:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52940 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231727AbiIVOcI (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 22 Sep 2022 10:32:08 -0400
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com [IPv6:2a00:1450:4864:20::12a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1CDE0F6F56
        for <linux-arm-msm@vger.kernel.org>; Thu, 22 Sep 2022 07:32:04 -0700 (PDT)
Received: by mail-lf1-x12a.google.com with SMTP id a2so15002739lfb.6
        for <linux-arm-msm@vger.kernel.org>; Thu, 22 Sep 2022 07:32:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:to:subject:from:content-language
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date;
        bh=TXgMZTgUVSuafB8VbCgazZM3eaExExRVllyUFdWCsmA=;
        b=idMrzerYAyV0Q5sfdOA3smahm4TImyBM/H+d02ZkVX3v40KH52bJM35iFql9AokDIL
         YlCOZqeoAOtvUtMS/MzoFvxWjXzWsxz/IdsT5gySMs2FXUoiAdLECJWjVsLCmOuf4SsP
         +XRyNm6o0Td416kmNKjZMuSLytVlwZWaZo5E/arCl7PI2AVpX6jEhgzVrsLHHmCBEjKs
         6t3PzGoFIAajVDCETqZJrIUEMdgDIlf11tZiabc2c5dY77NfzOAV2b2d9ma5jodu6Dcg
         4u0YEIxTK2X9JooMfsGX+uBG6nHtLAXTX00M076Oirv2/8dPPnr90XYnxFKzEtylv6yy
         C0lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:to:subject:from:content-language
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date;
        bh=TXgMZTgUVSuafB8VbCgazZM3eaExExRVllyUFdWCsmA=;
        b=75pMsRP0lfH805tRWKMMtdt9+jFBxpBVt0vRDZILlW/EpPpWP/CbAooAMevKXWAUEI
         CC/M/gBpgQ/8VrX8m9gz7tM8r/U5NJKJcmb6uR1ugNZtS5eIALGIOW1nZyw0DCri/Xfy
         CJGy20GPM/BXa4CSSSSQ5ghn8PRyNNBZiSYGklk++yECPpdm7hJAO/Lh4lZGxvf2/0HP
         MrI2hN0+RAttMJkf/zpKaBhzZJXbkKLfQ9iNtJf5dJYbZMMC9l70LMWq6YYDX3dl/P6A
         zrwAyovj6dhCOQNn3+6gwp53NeomTTZ1ZcTAqOOAOU3vPEK8na1X8rM44RXfBW3HA8RA
         iiBA==
X-Gm-Message-State: ACrzQf1UXJpI4qBMji7Jxs4UNi1YB9VCydiwr6CSl3D6yMtzGeebu0RN
        76DT+MeZcgl6ooyyfz7cIUtO0Q==
X-Google-Smtp-Source: AMsMyM4oiWRrdKAZkGCMIH8T+W4nBZRuZlTo4kFawD9xMuVD9qfAwQ9dHspVVFjIRPZ37x0gREiuaQ==
X-Received: by 2002:a05:6512:706:b0:498:b7ea:f2e8 with SMTP id b6-20020a056512070600b00498b7eaf2e8mr1363361lfs.570.1663857122470;
        Thu, 22 Sep 2022 07:32:02 -0700 (PDT)
Received: from [192.168.0.21] (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id u17-20020a2eb811000000b00261ca0f940esm915856ljo.62.2022.09.22.07.32.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 Sep 2022 07:32:01 -0700 (PDT)
Message-ID: <62e95ea6-6b72-a159-56ab-8bb11a5800c8@linaro.org>
Date:   Thu, 22 Sep 2022 16:32:00 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Content-Language: en-US
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Qualcomm DT bindings and DTS cleanups - tracking community wide
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Alex Elder <elder@linaro.org>,
        Nicolas Dechesne <nicolas.dechesne@linaro.org>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        Bhupesh Sharma <bhupesh.sharma@linaro.org>,
        Abel Vesa <abel.vesa@linaro.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Robert Foss <robert.foss@linaro.org>,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        Johan Hovold <johan+linaro@kernel.org>,
        Luca Weiss <luca.weiss@fairphone.com>,
        Vinod Koul <vinod.koul@linaro.org>,
        Stephan Gerhold <stephan@gerhold.net>,
        Caleb Connolly <kc@postmarketos.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi everyone,

Quite a lot of people are working on Qualcomm DT bindings conversion
(TXT->YAML) and fixups to Qualcomm DTS. We track a bit of this effort
internally in Linaro, but that has many shortcomings and we would like
to track it rather community-wide with the support and contributions
from the community.

What to track:
1. Which bindings to convert to YAML,
2. Missing compatibles (either entirely or because of missing conversion),
3. `dt_binding_check` warnings (usually connected with 1-2),
4. `dtbs_check` warnings.

Rob's bot gives us daily output for 1-4, but how can we track current
efforts to avoid duplication of work? Also it would allow people to find
tasks for them to get contributions to Linux kernel :). Is anyone in
community interested in tracking it together, in a public way?

If so, where?
A. elinux.org (needs some formatting when pasting the output from tools)
B. gitlab pages/wiki (maybe scripts could parse tools and create the page?)
C. gitlab dedicated repo - some text file
D. Linux kernel TODO file (might be difficult to keep updated)
E. kernel.org wiki (requires LF accounts, AFAIK, a bit pain to edit; I
have it for Exynos but I don't find it usable -
https://exynos.wiki.kernel.org/todo_tasks)

I am leaning towards Gitlab pages because they could be quite automated
- with CI or with scripts.

The point would be to list all of tasks (1-4 from the first list), keep
it updated with new results, pick/assign tasks and mark as done.

References:
https://gitlab.com/robherring/linux-dt/-/jobs/3066878011
https://gitlab.com/robherring/linux-dt/-/jobs/3066878006
https://gitlab.com/robherring/linux-dt/-/jobs/3066877999

Best regards,
Krzysztof
