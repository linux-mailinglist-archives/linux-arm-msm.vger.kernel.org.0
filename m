Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 60B7D7AC5E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Jul 2019 17:28:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732411AbfG3P1y (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 30 Jul 2019 11:27:54 -0400
Received: from mail-qk1-f193.google.com ([209.85.222.193]:46537 "EHLO
        mail-qk1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731767AbfG3P1y (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 30 Jul 2019 11:27:54 -0400
Received: by mail-qk1-f193.google.com with SMTP id r4so46834485qkm.13
        for <linux-arm-msm@vger.kernel.org>; Tue, 30 Jul 2019 08:27:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:references:cc:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding;
        bh=+VNQ8FLb/kDoIRuz5Av6FN9Y6M5lAGo0G661RNFXEqY=;
        b=eHBv+iJOCR2RHML9EhJp9rY+Gs7I8rv7xdV4JHZvMCf6Y+kP8e07VHoalCZL2h6uxz
         4Dlx/XZTg1rtLmMnPeZDfePelUf7t4D3/E6xkXq17/zJJM0OarfFqmI3W+B7C9FXR5lp
         s8vi3VMfl50j2OqAFnm8B81FONhe46E3NlBM0zYSPDIttuu529lz7PVpBBfcnljIGnzc
         UA2HV3XI4rMgMWd79KD3Bc/7j5BR+cN5IFlQMX9W5jfgYTC4VsBhaLGM7XFCgyLyjnSw
         tDexpV6HurPcz5M2Oac9C56/iX7evjiAZe+QvX6B30DhUHMYd0VFFpkixswpA8xiZw0C
         aDZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:cc:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding;
        bh=+VNQ8FLb/kDoIRuz5Av6FN9Y6M5lAGo0G661RNFXEqY=;
        b=Yk4uHS2XI9OeiL+RG3eyU3d5c5jZxcDDdJdCYykpjHKOosfG+upS+CX3E/eakCZ8Qv
         IbsrRLHImUzvCfYBHCB55H4OYd1RhMUw3QcgAgc5RhIuyGGk5EafLi5XKw3SUqx1xKZj
         Xb1fZU2NJepMQhg5ZqrgcSLuOESHR6ahuP1/gzHjwTaSXv60TVB/A6eP7qi2YwoenAw7
         By6UxerJZECQ+UixaUeNqnOfHanG286NzYL4Sp52CqHQoNGtuu8APJyn1Ww7GIJosWRe
         ahYjdockkZPD4B/xNWzsT1b+DkN2vLYf/jAs18WaF4K2UTAVq+2qXW+7RFKmByxC6NV1
         mMkw==
X-Gm-Message-State: APjAAAXv1cK11rlN/s40B0rsG0u8tz3dGNXCXYMMK3Z83+A02831QhBv
        bjaSp4JMH40dnoaz+VqfmqvNMQ==
X-Google-Smtp-Source: APXvYqzfn4rP38codjv+CMhApK3VGEYDEdmhm4+MLmmThFBN3VM059tuN43Zt0S3LoWbMN43Aomzxg==
X-Received: by 2002:a05:620a:13bc:: with SMTP id m28mr73893478qki.334.1564500473093;
        Tue, 30 Jul 2019 08:27:53 -0700 (PDT)
Received: from [192.168.1.169] (pool-71-255-245-97.washdc.fios.verizon.net. [71.255.245.97])
        by smtp.gmail.com with ESMTPSA id k123sm26690206qkf.13.2019.07.30.08.27.51
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 30 Jul 2019 08:27:52 -0700 (PDT)
Subject: Re: [PATCH 1/2] soc: qcom: Extend AOSS QMP driver to support
 resources that are used to wake up the SoC.
To:     Amit Kucheria <amit.kucheria@linaro.org>
References: <1564418001-24940-1-git-send-email-thara.gopinath@linaro.org>
 <1564418001-24940-2-git-send-email-thara.gopinath@linaro.org>
 <CAHLCerO_5CUmdfdyogc0GwKPtPU4xYLU-FqzB8a8y07mnipTuw@mail.gmail.com>
Cc:     linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Andy Gross <agross@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>
From:   Thara Gopinath <thara.gopinath@linaro.org>
Message-ID: <5D4061F7.8020209@linaro.org>
Date:   Tue, 30 Jul 2019 11:27:51 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
 Thunderbird/38.5.1
MIME-Version: 1.0
In-Reply-To: <CAHLCerO_5CUmdfdyogc0GwKPtPU4xYLU-FqzB8a8y07mnipTuw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Amit,
Thanks for the review.

On 07/30/2019 08:43 AM, Amit Kucheria wrote:
> On Mon, Jul 29, 2019 at 10:03 PM Thara Gopinath
> <thara.gopinath@linaro.org> wrote:
>>
>> The AOSS QMP driver is extended to communicate with the additional
>> resources. These resources are then registered as cooling devices
>> with the thermal framework.
>>
>> Signed-off-by: Thara Gopinath <thara.gopinath@linaro.org>
>> ---
>>  drivers/soc/qcom/qcom_aoss.c | 129 +++++++++++++++++++++++++++++++++++++++++++
>>  1 file changed, 129 insertions(+)
>>
>> diff --git a/drivers/soc/qcom/qcom_aoss.c b/drivers/soc/qcom/qcom_aoss.c
>> index 5f88519..010877e 100644
>> --- a/drivers/soc/qcom/qcom_aoss.c
>> +++ b/drivers/soc/qcom/qcom_aoss.c
>> @@ -10,6 +10,8 @@
>>  #include <linux/module.h>
>>  #include <linux/platform_device.h>
>>  #include <linux/pm_domain.h>
>> +#include <linux/thermal.h>
>> +#include <linux/slab.h>
>>
>>  #define QMP_DESC_MAGIC                 0x0
>>  #define QMP_DESC_VERSION               0x4
>> @@ -40,6 +42,16 @@
>>  /* 64 bytes is enough to store the requests and provides padding to 4 bytes */
>>  #define QMP_MSG_LEN                    64
>>
>> +#define QMP_NUM_COOLING_RESOURCES      2
>> +
>> +static bool qmp_cdev_init_state = 1;
>> +
>> +struct qmp_cooling_device {
>> +       struct thermal_cooling_device *cdev;
>> +       struct qmp *qmp;
>> +       bool state;
>> +};
>> +
>>  /**
>>   * struct qmp - driver state for QMP implementation
>>   * @msgram: iomem referencing the message RAM used for communication
>> @@ -69,6 +81,7 @@ struct qmp {
>>
>>         struct clk_hw qdss_clk;
>>         struct genpd_onecell_data pd_data;
>> +       struct qmp_cooling_device *cooling_devs;
>>  };
>>
>>  struct qmp_pd {
>> @@ -385,6 +398,117 @@ static void qmp_pd_remove(struct qmp *qmp)
>>                 pm_genpd_remove(data->domains[i]);
>>  }
>>
>> +static int qmp_cdev_get_max_state(struct thermal_cooling_device *cdev,
>> +                                 unsigned long *state)
>> +{
>> +       *state = qmp_cdev_init_state;
>> +       return 0;
>> +}
>> +
>> +static int qmp_cdev_get_cur_state(struct thermal_cooling_device *cdev,
>> +                                 unsigned long *state)
>> +{
>> +       struct qmp_cooling_device *qmp_cdev = cdev->devdata;
>> +
>> +       *state = qmp_cdev->state;
>> +       return 0;
>> +}
>> +
>> +static int qmp_cdev_set_cur_state(struct thermal_cooling_device *cdev,
>> +                                 unsigned long state)
>> +{
>> +       struct qmp_cooling_device *qmp_cdev = cdev->devdata;
>> +       char buf[QMP_MSG_LEN] = {};
>> +       bool cdev_state;
>> +       int ret;
>> +
>> +       /* Normalize state */
>> +       cdev_state = !!state;
>> +
>> +       if (qmp_cdev->state == state)
>> +               return 0;
>> +
>> +       snprintf(buf, sizeof(buf),
>> +                "{class: volt_flr, event:zero_temp, res:%s, value:%s}",
>> +                       qmp_cdev->name,
> 
> This won't compile, there is no member "name" in qmp_cooling_device.

Yes! Sorry about that. I must have send  this from the wrong folder. I
have fixed this and send out another version. Also taken care of the
other comment below.

Regards
Thara
> 
>> +                       cdev_state ? "off" : "on");
>> +
>> +       ret = qmp_send(qmp_cdev->qmp, buf, sizeof(buf));
>> +
>> +       if (!ret)
>> +               qmp_cdev->state = cdev_state;
>> +
>> +       return ret;
>> +}
>> +
>> +static struct thermal_cooling_device_ops qmp_cooling_device_ops = {
>> +       .get_max_state = qmp_cdev_get_max_state,
>> +       .get_cur_state = qmp_cdev_get_cur_state,
>> +       .set_cur_state = qmp_cdev_set_cur_state,
>> +};
>> +
>> +static int qmp_cooling_device_add(struct qmp *qmp,
>> +                                 struct qmp_cooling_device *qmp_cdev,
>> +                                 struct device_node *node)
>> +{
>> +       char *cdev_name = (char *)node->name;
>> +
>> +       qmp_cdev->qmp = qmp;
>> +       qmp_cdev->state = qmp_cdev_init_state;
>> +       qmp_cdev->cdev = devm_thermal_of_cooling_device_register
>> +                               (qmp->dev, node,
>> +                               cdev_name,
>> +                               qmp_cdev, &qmp_cooling_device_ops);
>> +
>> +       if (IS_ERR(qmp_cdev->cdev))
>> +               dev_err(qmp->dev, "unable to register %s cooling device\n",
>> +                       cdev_name);
>> +
>> +       return PTR_ERR_OR_ZERO(qmp_cdev->cdev);
>> +}
>> +
>> +static int qmp_cooling_devices_register(struct qmp *qmp)
>> +{
>> +       struct device_node *np, *child;
>> +       int count = QMP_NUM_COOLING_RESOURCES;
>> +       int ret;
>> +
>> +       np = qmp->dev->of_node;
>> +
>> +       qmp->cooling_devs = devm_kcalloc(qmp->dev, count,
>> +                                        sizeof(*qmp->cooling_devs),
>> +                                        GFP_KERNEL);
>> +
>> +       if (!qmp->cooling_devs)
>> +               return -ENOMEM;
>> +
>> +       for_each_available_child_of_node(np, child) {
>> +               if (!of_find_property(child, "#cooling-cells", NULL))
>> +                       continue;
>> +               ret = qmp_cooling_device_add(qmp, &qmp->cooling_devs[count++],
>> +                                            child);
>> +               if (ret)
>> +                       goto uroll_cooling_devices;
> 
> unroll?
> 
>> +       }
>> +
>> +       return 0;
>> +
>> +uroll_cooling_devices:
>> +       while (--count >= 0)
>> +               thermal_cooling_device_unregister
>> +                       (qmp->cooling_devs[count].cdev);
>> +
>> +       return ret;
>> +}
>> +
>> +static void qmp_cooling_devices_remove(struct qmp *qmp)
>> +{
>> +       int i;
>> +
>> +       for (i = 0; i < QMP_NUM_COOLING_RESOURCES; i++)
>> +               thermal_cooling_device_unregister(qmp->cooling_devs[i].cdev);
>> +}
>> +
>>  static int qmp_probe(struct platform_device *pdev)
>>  {
>>         struct resource *res;
>> @@ -433,6 +557,10 @@ static int qmp_probe(struct platform_device *pdev)
>>         if (ret)
>>                 goto err_remove_qdss_clk;
>>
>> +       ret = qmp_cooling_devices_register(qmp);
>> +       if (ret)
>> +               dev_err(&pdev->dev, "failed to register aoss cooling devices\n");
>> +
>>         platform_set_drvdata(pdev, qmp);
>>
>>         return 0;
>> @@ -453,6 +581,7 @@ static int qmp_remove(struct platform_device *pdev)
>>
>>         qmp_qdss_clk_remove(qmp);
>>         qmp_pd_remove(qmp);
>> +       qmp_cooling_devices_remove(qmp);
>>
>>         qmp_close(qmp);
>>         mbox_free_channel(qmp->mbox_chan);
>> --
>> 2.1.4
>>

