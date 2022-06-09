Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EA8B25443C8
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Jun 2022 08:27:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238899AbiFIG1H (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 9 Jun 2022 02:27:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45448 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238893AbiFIG1G (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 9 Jun 2022 02:27:06 -0400
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com [IPv6:2a00:1450:4864:20::22f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 22D1460E2
        for <linux-arm-msm@vger.kernel.org>; Wed,  8 Jun 2022 23:27:05 -0700 (PDT)
Received: by mail-lj1-x22f.google.com with SMTP id c30so8450948ljr.9
        for <linux-arm-msm@vger.kernel.org>; Wed, 08 Jun 2022 23:27:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=cycGJJ91H4YHdjGIAutpI1GaX9p7h4brlXbJX4MVN/Q=;
        b=Mpa9s8ZMhN2wGYXSvQKctpW3XIJWSKFkN2WMMwjNevVr4R381DlULaGujGUPT96e+q
         PxBqdKrEmav5wKR4JLDwgQTChoaxM/pbFLs6hfpje0G3cBfmyEyXNR3cxJzc02ougGp6
         deQUeFXF5HkLZrqF7q+HnV+SQXBah/jMfVPuFcGZbmvg6puK7keBrGeVpsdPuP9pV3Dy
         a4E1igC8EOMKif/t8j9j8LX973xuDLKgrBiJ36j+uBJs3JeIs6Rv2ywYgIFmoQ0ahx1r
         rGJYIvAdX4nR4nncPacsckqfBuOtYQnaWzumcK0pPE1e9ZfiEiiC0aNj1o3vJvZVm3LL
         LwPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=cycGJJ91H4YHdjGIAutpI1GaX9p7h4brlXbJX4MVN/Q=;
        b=1FmJAKmy4VcJ1EwZ8QHT/bDHPn+LggLfAWLMh54iGF10a9GGQqpChTCZ1WlB/Hxihr
         pORa7fO0iB2jQDK6zEkx/7oBFKxWIx6fjdHHFb3459UsEh4e6s+sm5cEgz4mNrvbOY4U
         UK/v2eAMu6hjO5IzmOohvLfgQ6pCdtAmW/wuvQkk8bVTr3iCDGmUSQxR47AUEtAIc8j0
         9SNaJrcRVB6EwjhqWhLnFFDrV0JacQXSC120WEJWraxLgvMsWcSrzbeBJAi/LfyxYvfM
         BKb5SUfQK8NJJx/6dfytH8tcxb1lGykm7ijdGmEHTt9PvIlDRvbYI/+i337CfjE4XyNa
         wvoQ==
X-Gm-Message-State: AOAM53166Fw67xH/W/vFfQknBvZF4alpuhZ+AVGanmmBuuTYA5LrMsqt
        dogFc7QQ5Fz+OOgKh7tgxq4Anw==
X-Google-Smtp-Source: ABdhPJwH50v0hPsS84CEB+KQLzlSSoTIQA5T8P964OIyZkPVqZ+avwaWZ78IjDxe1VKTt2yylpUxSA==
X-Received: by 2002:a2e:8e38:0:b0:255:59c2:7192 with SMTP id r24-20020a2e8e38000000b0025559c27192mr25338422ljk.156.1654756023379;
        Wed, 08 Jun 2022 23:27:03 -0700 (PDT)
Received: from [192.168.1.211] ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id bf43-20020a05651225ab00b004790823d354sm3861368lfb.26.2022.06.08.23.27.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Jun 2022 23:27:02 -0700 (PDT)
Message-ID: <89941420-717a-c311-54fe-cd8fcd0b0a06@linaro.org>
Date:   Thu, 9 Jun 2022 09:27:02 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH v2 06/12] drm/msm/hdmi: drop unused GPIO support
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
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
References: <20220608120723.2987843-1-dmitry.baryshkov@linaro.org>
 <20220608120723.2987843-7-dmitry.baryshkov@linaro.org>
 <CAE-0n53z_nWsgVVn-4LbsP1GuzTgCa+DDDDE0y8k3+s-t=eSBA@mail.gmail.com>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <CAE-0n53z_nWsgVVn-4LbsP1GuzTgCa+DDDDE0y8k3+s-t=eSBA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 08/06/2022 23:59, Stephen Boyd wrote:
> Quoting Dmitry Baryshkov (2022-06-08 05:07:17)
>> @@ -543,41 +529,16 @@ static int msm_hdmi_bind(struct device *dev, struct device *master, void *data)
>>          hdmi_cfg->mmio_name     = "core_physical";
>>          hdmi_cfg->qfprom_mmio_name = "qfprom_physical";
>>
>> -       for (i = 0; i < HDMI_MAX_NUM_GPIO; i++) {
> [...]
>> -               if (gpiod)
>> -                       gpiod_set_consumer_name(gpiod, msm_hdmi_gpio_pdata[i].label);
>> -               hdmi_cfg->gpios[i].output = msm_hdmi_gpio_pdata[i].output;
>> -               hdmi_cfg->gpios[i].value = msm_hdmi_gpio_pdata[i].value;
>> -       }
>> +       hdmi->hpd_gpiod = devm_gpiod_get_optional(dev, "hpd", GPIOD_IN);
>> +       /* This will catch e.g. -PROBE_DEFER */
> 
> EPROBE_DEFER?

Ack.

> 
>> +       if (IS_ERR(hdmi->hpd_gpiod))
>> +               return PTR_ERR(hdmi->hpd_gpiod);
>> +
>> +       if (!hdmi->hpd_gpiod)
>> +               DBG("failed to get HPD gpio");
> 
> Does DBG() add newlines?

Yes, it does.

> 
>> +
>> +       if (hdmi->hpd_gpiod)
>> +               gpiod_set_consumer_name(hdmi->hpd_gpiod, "HDMI_HPD");
>>
>>          dev->platform_data = hdmi_cfg;
>>


-- 
With best wishes
Dmitry
