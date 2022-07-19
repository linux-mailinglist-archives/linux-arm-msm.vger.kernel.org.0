Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8DB295792E5
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 Jul 2022 07:59:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236399AbiGSF7Q (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 19 Jul 2022 01:59:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60016 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237014AbiGSF7O (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 19 Jul 2022 01:59:14 -0400
Received: from mail-pf1-x429.google.com (mail-pf1-x429.google.com [IPv6:2607:f8b0:4864:20::429])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8D2F2371BA
        for <linux-arm-msm@vger.kernel.org>; Mon, 18 Jul 2022 22:59:13 -0700 (PDT)
Received: by mail-pf1-x429.google.com with SMTP id y141so12602274pfb.7
        for <linux-arm-msm@vger.kernel.org>; Mon, 18 Jul 2022 22:59:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=Y5xsazlwiDanwzpi7e9zcpAo6cKZI1L0nd0OC391jZI=;
        b=oj1/sJ2N9hTgvV/WphEJSveaf+lBxe7SLEx3XkG+WSeNDpL12+cpRD1L+ojxJqPgda
         17rbdkJ5jqg3XIYABWO9zoTvC/wN1qQYKI+HIbsmlsrqnZKuvD/wkrBFej4FxHb5IOyg
         sCxH0o1YuETTZbL4EImZS6NWmqxJJsF/2N35I2vmFCz3mhu3DM8auCJEvEsD8gDJuMgP
         VWYLWN9etIjLZuWNtMFU1KoHUO2gnh436CyMZM4IdX0yBciJ/ZryPYMvxrPsATTSCn8x
         xMdKBRRqFieggHCaSX8a2hQ9duRaf4tS7HDUgh/odNk478aGgUXT65MJe4+6Yy9tiGiN
         tSJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=Y5xsazlwiDanwzpi7e9zcpAo6cKZI1L0nd0OC391jZI=;
        b=qt3DH2ZBHN6Zy36VNsYbSipoqe34zsv8XiaRhnaQbiopFTRh1E4NrngZpPZs1urEc2
         igVQy1LlKw0Z3/MbVNWTpzamZXbuGy463xQ+Dy1byon6+gz8mntP/nHtWUc40yTl9UhG
         y1XvbF0JdLtxlzi2DP1GLRLpsA95kT9zDMCR8oTymGOTsfz2dkLhpC0JAzvd4kqyH0eX
         axN0PhrA+0G9FoM6A7iXAGKMTAzvuTa7FobzygLVZiNIImE+ASyUW+EgWHgM1+syMYkx
         fhcVM2jOTDXov880fXN9Rj/kh35Lhg2CjiuCKt+M1CsZ5M8IN6zvhqSbu4pXOzv1Xbfv
         +6mg==
X-Gm-Message-State: AJIora9sSTxqQfgOt3GW/YUTsDP8i826BEURmPGVvZY2ENahcwyzqLaS
        HgqaWKuMzW8o5unjS5+jmQ5Auw==
X-Google-Smtp-Source: AGRyM1sAzJLefPtL0/O4yugNgkgmhjeoJBx1oe4usVivN6b7zC1SbAnBqsn4QJ1l2zztW607ndZ1vQ==
X-Received: by 2002:a63:4f52:0:b0:41a:3744:d952 with SMTP id p18-20020a634f52000000b0041a3744d952mr4722028pgl.186.1658210352783;
        Mon, 18 Jul 2022 22:59:12 -0700 (PDT)
Received: from ?IPV6:2401:4900:1f3b:709e:6fec:df37:6562:5a80? ([2401:4900:1f3b:709e:6fec:df37:6562:5a80])
        by smtp.gmail.com with ESMTPSA id y3-20020a17090a134300b001ef82d23125sm12540108pjf.25.2022.07.18.22.59.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 18 Jul 2022 22:59:12 -0700 (PDT)
Message-ID: <d0dbf098-9c93-ed39-0599-fd70b451c19f@linaro.org>
Date:   Tue, 19 Jul 2022 11:29:02 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 1/2] thermal/drivers/qcom/temp-alarm: register thermal
 zones as hwmon sensors
Content-Language: en-US
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Amit Kucheria <amitk@kernel.org>,
        Thara Gopinath <thara.gopinath@gmail.com>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Zhang Rui <rui.zhang@intel.com>
Cc:     linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org
References: <20220719054940.755907-1-dmitry.baryshkov@linaro.org>
From:   Bhupesh Sharma <bhupesh.sharma@linaro.org>
In-Reply-To: <20220719054940.755907-1-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org


On 7/19/22 11:19 AM, Dmitry Baryshkov wrote:
> Register thermal zones as hwmon sensors to let userspace read
> temperatures using standard hwmon interface.
>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>   drivers/thermal/qcom/qcom-spmi-temp-alarm.c | 5 +++++
>   1 file changed, 5 insertions(+)
>
> diff --git a/drivers/thermal/qcom/qcom-spmi-temp-alarm.c b/drivers/thermal/qcom/qcom-spmi-temp-alarm.c
> index 7419e196dbb0..770f82cc9bca 100644
> --- a/drivers/thermal/qcom/qcom-spmi-temp-alarm.c
> +++ b/drivers/thermal/qcom/qcom-spmi-temp-alarm.c
> @@ -16,6 +16,7 @@
>   #include <linux/thermal.h>
>   
>   #include "../thermal_core.h"
> +#include "../thermal_hwmon.h"
>   
>   #define QPNP_TM_REG_DIG_MAJOR		0x01
>   #define QPNP_TM_REG_TYPE		0x04
> @@ -458,6 +459,10 @@ static int qpnp_tm_probe(struct platform_device *pdev)
>   		return ret;
>   	}
>   
> +	if (devm_thermal_add_hwmon_sysfs(chip->tz_dev))
> +		dev_warn(&pdev->dev,
> +			 "Failed to add hwmon sysfs attributes\n");
> +
>   	ret = devm_request_threaded_irq(&pdev->dev, irq, NULL, qpnp_tm_isr,
>   					IRQF_ONESHOT, node->name, chip);
>   	if (ret < 0)

LGTM, so:

Reviewed-by: Bhupesh Sharma <bhupesh.sharma@linaro.org>


