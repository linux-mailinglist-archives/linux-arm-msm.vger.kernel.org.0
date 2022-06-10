Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7162B546EA4
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Jun 2022 22:48:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1347241AbiFJUr7 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 10 Jun 2022 16:47:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36006 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1347212AbiFJUr6 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 10 Jun 2022 16:47:58 -0400
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com [IPv6:2a00:1450:4864:20::12c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 37EF117E15
        for <linux-arm-msm@vger.kernel.org>; Fri, 10 Jun 2022 13:47:55 -0700 (PDT)
Received: by mail-lf1-x12c.google.com with SMTP id a15so262749lfb.9
        for <linux-arm-msm@vger.kernel.org>; Fri, 10 Jun 2022 13:47:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=8KwPXLp0XOa90G9moFXqn+YK8bv+iSnrOMIWn8R44VQ=;
        b=xPKDjHkdR6DyCfEtwgkAI9p1egmcpidgHgRAETIYUaYNWDTftQ10fVeR9XpKUOyx0W
         hmv+ZDivua7J/iHC9pJjch+MuKkPKwRtNZikeb2xyA2cwmtYhQwmfXL50wsBtHU7Nmq3
         vpLe3SrZeYxCwIn/p9X377ItMLHC4sWZwOEmEkaHxw3qmMZRB9p3ajbXgnkV4FqjKGqj
         bl5cG5lWfe/+gMMVJmd5JkFOkeWtWi4ntC/q3+jwv1L3PdYRzs7n7118Z3K2ukzRed9h
         U2j5qhnN33hu3uTXYF0BFfMDWetDcTeTSbB2ZuVV2wflkOmQ/CL5w6+wAIvX6MJ8kKvJ
         bJMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=8KwPXLp0XOa90G9moFXqn+YK8bv+iSnrOMIWn8R44VQ=;
        b=O1JfmxFLfeBJW5irhSkh1bQvij8iTqnnECFvMa/6VB4fYDV4Y4+UeJ03N2rhUpD/Da
         jVRLAphQo7fpveO4t407CgmSSiWeabPFrfWrSF6IJY8QC8tRb5sFf0Vha/ROBXRHhh4w
         9Au/miDzcWCCH+61veUf2Pp2S+ovwPlIUgUubw8C4zLkIcR/CvUMFXS5vB802bTug0yU
         hO6JDNS3RLdiGxIFpYDY3jMiMRrUJYfLckY+NPVYlxsf26zIu/GEgEg+axSOY43xlz8O
         YHa/OGrr6iqvPoVYqG2FgDyej5abjbCkgLx68ACq2wOqyFlWU5wwGrNzT8faBdxd7sPe
         elaQ==
X-Gm-Message-State: AOAM531On/pNk16IHeFAvdlB5GZXFV8mLk8PPhPZdOgZ68AzhKwRtewV
        yk7HQxDDlGwksqFEx+jlu1S69Q==
X-Google-Smtp-Source: ABdhPJyOLAZ0DtqDYs7mIgFCiYwqsPd9FGnhF38NRQy2k3tH+rhfLOxamV0FdLf2aYVUy+utRDdMxg==
X-Received: by 2002:a05:6512:32b2:b0:479:b04:c0af with SMTP id q18-20020a05651232b200b004790b04c0afmr28576044lfe.384.1654894073576;
        Fri, 10 Jun 2022 13:47:53 -0700 (PDT)
Received: from [192.168.1.211] ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id p26-20020a2ea41a000000b002557c48cc4csm62393ljn.95.2022.06.10.13.47.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 10 Jun 2022 13:47:52 -0700 (PDT)
Message-ID: <492bbe98-e395-3adb-34e3-eadccd59d849@linaro.org>
Date:   Fri, 10 Jun 2022 23:47:51 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH v3 06/14] drm/msm/hdmi: drop unused GPIO support
Content-Language: en-GB
To:     Stephen Boyd <swboyd@chromium.org>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Rob Clark <robdclark@gmail.com>,
        Rob Herring <robh+dt@kernel.org>, Sean Paul <sean@poorly.run>
Cc:     David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        kernel test robot <lkp@intel.com>
References: <20220609122350.3157529-1-dmitry.baryshkov@linaro.org>
 <20220609122350.3157529-7-dmitry.baryshkov@linaro.org>
 <CAE-0n51vKmQ683TTnYm8VxSquqYqL2_3=Ku750r--0GV4JcW8Q@mail.gmail.com>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <CAE-0n51vKmQ683TTnYm8VxSquqYqL2_3=Ku750r--0GV4JcW8Q@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 10/06/2022 23:46, Stephen Boyd wrote:
> Quoting Dmitry Baryshkov (2022-06-09 05:23:42)
>> The HDMI driver has code to configure extra GPIOs, which predates
>> pinctrl support. Nowadays all platforms should use pinctrl instead.
>> Neither of upstreamed Qualcomm platforms uses these properties, so it's
>> safe to drop them.
>>
>> Reported-by: kernel test robot <lkp@intel.com>
>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>> ---
> 
> One question
> 
> Reviewed-by: Stephen Boyd <swboyd@chromium.org>
> 
>> diff --git a/drivers/gpu/drm/msm/hdmi/hdmi.c b/drivers/gpu/drm/msm/hdmi/hdmi.c
>> index 7267167d5ef1..6d79f1b910a5 100644
>> --- a/drivers/gpu/drm/msm/hdmi/hdmi.c
>> +++ b/drivers/gpu/drm/msm/hdmi/hdmi.c
>> @@ -233,6 +233,20 @@ static struct hdmi *msm_hdmi_init(struct platform_device *pdev)
>>                  hdmi->pwr_clks[i] = clk;
>>          }
>>
>> +       hdmi->hpd_gpiod = devm_gpiod_get_optional(&pdev->dev, "hpd", GPIOD_IN);
>> +       /* This will catch e.g. -EPROBE_DEFER */
>> +       if (IS_ERR(hdmi->hpd_gpiod)) {
>> +               ret = PTR_ERR(hdmi->hpd_gpiod);
>> +               DRM_DEV_ERROR(&pdev->dev, "failed to get hpd gpio: (%d)\n", ret);
> 
> Did you want to print an error with eprobe defer in it?

True. We should use dev_err_probe here. I'll fix it in the next revision.

> 
>> +               goto fail;
>> +       }
>> +
>> +       if (!hdmi->hpd_gpiod)
>> +               DBG("failed to get HPD gpio");
>> +
>> +       if (hdmi->hpd_gpiod)
>> +               gpiod_set_consumer_name(hdmi->hpd_gpiod, "HDMI_HPD");
>> +
>>          pm_runtime_enable(&pdev->dev);
>>
>>          hdmi->workq = alloc_ordered_workqueue("msm_hdmi", 0);


-- 
With best wishes
Dmitry
