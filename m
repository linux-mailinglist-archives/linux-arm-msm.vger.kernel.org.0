Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 16A996D9EF3
	for <lists+linux-arm-msm@lfdr.de>; Thu,  6 Apr 2023 19:37:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230015AbjDFRhg (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 6 Apr 2023 13:37:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58888 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239166AbjDFRhc (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 6 Apr 2023 13:37:32 -0400
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com [IPv6:2a00:1450:4864:20::12a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 444D8A5E1
        for <linux-arm-msm@vger.kernel.org>; Thu,  6 Apr 2023 10:37:04 -0700 (PDT)
Received: by mail-lf1-x12a.google.com with SMTP id k18so3053594lfb.12
        for <linux-arm-msm@vger.kernel.org>; Thu, 06 Apr 2023 10:37:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1680802615;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=EL9yquePtYEiERyhjKWEZPtOxoBoLwSKVd0TEyJIKhg=;
        b=Dfdy5+tuV5r8IFrjsJnxR0DflxzONcCDsGCq2RTKEQYhpAaSZDMp4xwCqZwpzN32HA
         iRmBxFKzSgI0jcIMaSYkTQb9MGL66xP6TuR/pVa6V3W3N7TmYfZZpjG6eJG860Vm44XF
         D/uMDp/T8DdH3+9iwgbRlsIL6NDZVRtX06XK6u+Y8wWJ1yIl2MEprxrtxrPDXrBo14r6
         tuhGsMx5alQW8pGaapC6MlXDK59qWmFGwv/sK284BzikqgyrxGYfB6zWseK0lyGDGIIQ
         dk5jbivH1v4FgZOebCpV4sJfMN90MYRkP8wBJT/2aZ2R9eP9SQznxIy1/AI+bPt5gB6x
         HPBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680802615;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=EL9yquePtYEiERyhjKWEZPtOxoBoLwSKVd0TEyJIKhg=;
        b=7J/7c3zV0bEMFbx8tllCUHHuyMzFgyK8SjMYS2dsvVB6tf57R23Yf17nR8qity/IMI
         C+VarnMdhcgB9006k30KAR1aOQffu9MNXnAd1PQmI/25CXrlu+cUVjqvTBAtCvOWX1nM
         E5vHI6rPNVK8lIlU6wshnuR61GxszamimT7xW6tawnZynp/iXxbQw7ZLi0vHkQLXWiPl
         s+mWh4AIySe/042IcYC/20fIhH67U6tVxEH9OhdqhI+KsSAihxP7OvU08+vSjO9njXti
         ctLoFfjjB38FX2pcWMFO1lakgXbWd3IVa2Gf4TsrsbIUojEvGsxXMiSMIjQWpCs1QAHF
         oFrQ==
X-Gm-Message-State: AAQBX9fwHHcQSp98oN4sXeseQQd80Bl7yxSaizPTcpC8lB4jIgCrrbH6
        fMGVVvgoG+oL9Pzrr0z24kL28A==
X-Google-Smtp-Source: AKy350ZPNrYFAh53ZXFv05ITtGKxdTXYvISU7K6VGWUd117vMCVH+yxZq4XuuS2NIDNpOX44o81HNA==
X-Received: by 2002:ac2:5fcb:0:b0:4dd:fd4e:5a20 with SMTP id q11-20020ac25fcb000000b004ddfd4e5a20mr5272lfg.58.1680802615536;
        Thu, 06 Apr 2023 10:36:55 -0700 (PDT)
Received: from ?IPV6:2001:14ba:a085:4d00::8a5? (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
        by smtp.gmail.com with ESMTPSA id f16-20020a056512093000b004a91df49508sm352032lft.177.2023.04.06.10.36.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 06 Apr 2023 10:36:55 -0700 (PDT)
Message-ID: <2f6dc990-cc4a-e5b0-3d4f-bd8064b3333e@linaro.org>
Date:   Thu, 6 Apr 2023 20:36:54 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH 1/3] thermal/drivers/tsens: Add error/debug prints to
 calibration read
To:     Bryan O'Donoghue <bryan.odonoghue@linaro.org>, amitk@kernel.org,
        thara.gopinath@gmail.com, agross@kernel.org, andersson@kernel.org,
        konrad.dybcio@linaro.org, rafael@kernel.org,
        daniel.lezcano@linaro.org, rui.zhang@intel.com
Cc:     linux-pm@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20230406145850.357296-1-bryan.odonoghue@linaro.org>
 <20230406145850.357296-2-bryan.odonoghue@linaro.org>
Content-Language: en-GB
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20230406145850.357296-2-bryan.odonoghue@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.4 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 06/04/2023 17:58, Bryan O'Donoghue wrote:
> Add in some dev_dbg() to aid in viewing of raw calibration data extracted.
> 
> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> ---
>   drivers/thermal/qcom/tsens.c | 12 ++++++++++--
>   1 file changed, 10 insertions(+), 2 deletions(-)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

