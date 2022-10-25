Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 08DF960D64F
	for <lists+linux-arm-msm@lfdr.de>; Tue, 25 Oct 2022 23:48:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230415AbiJYVs3 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 25 Oct 2022 17:48:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32824 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229937AbiJYVs3 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 25 Oct 2022 17:48:29 -0400
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com [IPv6:2a00:1450:4864:20::12e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EB4DECBFC3
        for <linux-arm-msm@vger.kernel.org>; Tue, 25 Oct 2022 14:48:27 -0700 (PDT)
Received: by mail-lf1-x12e.google.com with SMTP id bp15so24757881lfb.13
        for <linux-arm-msm@vger.kernel.org>; Tue, 25 Oct 2022 14:48:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=7OYBGIfhY0JmbWcmbED3TnO1qassILcOzGujc3fEHgg=;
        b=GGIkZNrDc/rxeOI+AIfons2BmFhrL0cWKvB+hhOzdPmc1bEJoJ31CBp+cv7+vOAvcX
         zQCQ+RfB2YqRaBlmquee8HyHA3fXzDgV1Bznts7xWqyat9ONOqdFnTTZ+pKKlNkvfEBY
         fBPCYtgL0vDTHHGvMxqYE1Edc9djVrJGhs82ah83Q3qQMxHT0EiGB+8EY5b1LUS5OM6c
         Zw656Q1FiMfZYKsRBZPfH+jgNezpGrQbR7h4y8mVr23Pw/EtQVjX8EHAx21g/0pt8f/q
         gf7onFXVvtPGcXMjATw+uLip+u8OvzzmmlJHtntzTfxJxcFSC/qJVsHh7Uk5fFXr/OOc
         rh0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7OYBGIfhY0JmbWcmbED3TnO1qassILcOzGujc3fEHgg=;
        b=0AYBmkvcuArl5g8GPmhHFVHV7LXAi+AwOiIekmkn9nstb1tDz8oSX2SE23Zr4Kk2sP
         c0UuQssEkgQ64kEVv1Ac76bWsLc2MMn3Sjgs9ZIh4KLmRpjBjZ/nKgzgw9ZyXboeapee
         HgSylXFgt4HRUOeCj9dQngkVmMvE13nJZe97hfUUH4GdMfzzVusRrGSWWhlgaPQNcOVh
         GgOtJ+Eto1GIqrcrNZo8xKZSCOvYhgKqI8CwhIX59LXftdLEoiWrJpzT6AREIRSoH9U6
         edMOXScg/bfrL6wY3ST4d35VrGokcTdWlsJUzhlyoxtl8P4cVxBQVJP4/Ov9GyRQ5opE
         5sGQ==
X-Gm-Message-State: ACrzQf08yQaXUXBWHx42Ed/t+fXbioO2/23rNZCAzPLLj+jbaQma/VgP
        xQgOGtuQOpPsNh+jbHZkCrLUGg==
X-Google-Smtp-Source: AMsMyM4o9Ii30ktWU6QmKzIwavCyvoqeBWo3MELoOz6Zgsz+K3s3Fu4aOqcsTRcT/S6R+qekCqnoxQ==
X-Received: by 2002:a05:6512:228b:b0:4a2:3e53:4af2 with SMTP id f11-20020a056512228b00b004a23e534af2mr14283540lfu.280.1666734506321;
        Tue, 25 Oct 2022 14:48:26 -0700 (PDT)
Received: from [10.27.10.248] ([195.165.23.90])
        by smtp.gmail.com with ESMTPSA id t16-20020a2e7810000000b0027709875c3esm680386ljc.32.2022.10.25.14.48.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 25 Oct 2022 14:48:25 -0700 (PDT)
Message-ID: <d31e3aa3-fdec-f0b1-f400-0ea6055a0f6c@linaro.org>
Date:   Wed, 26 Oct 2022 00:48:24 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.3
Subject: Re: [PULL V4]: qcom: SC7180 and SC7280 venus firmware updates
Content-Language: en-GB
To:     Nathan Hebert <nhebert@chromium.org>, linux-firmware@kernel.org
Cc:     linux-arm-msm@vger.kernel.org,
        Bjorn Andersson <andersson@kernel.org>,
        Fritz Koenig <frkoenig@chromium.org>,
        Vikash Garodia <vgarodia@qti.qualcomm.com>
References: <CANHAJhH41JnZA_fPNczMpBwnTy5P-5xhgPY5_eHkOsBzx0Qy=A@mail.gmail.com>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <CANHAJhH41JnZA_fPNczMpBwnTy5P-5xhgPY5_eHkOsBzx0Qy=A@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 26/10/2022 00:32, Nathan Hebert wrote:
> The following changes since commit 48407ffd7adb9511701547068b1e6f0956bd1c94:
> 
>    cnm: update chips&media wave521c firmware. (2022-10-17 10:20:43 -0400)
> 
> are available in the Git repository at:
> 
>    https://github.com/nathan-google/linux-firmware.git
> update_sc7180_and_sc7280_firmware_v4
> 
> for you to fetch changes up to 05df8e65182f7ee945f826e41b5eaa17c188a8df:
> 
>    qcom: update venus firmware files for VPU-2.0 (2022-10-25 14:16:59 -0700)
> 
> ----------------------------------------------------------------
> Nathan Hebert (4):
>        qcom: replace split SC7180 venus firmware images with symlink
>        qcom: update venus firmware file for v5.4
>        qcom: remove split SC7280 venus firmware images
>        qcom: update venus firmware files for VPU-2.0

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

Please excuse me for being too picky.

-- 
With best wishes
Dmitry

