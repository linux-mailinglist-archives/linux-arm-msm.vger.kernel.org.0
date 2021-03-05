Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B25CC32F65C
	for <lists+linux-arm-msm@lfdr.de>; Sat,  6 Mar 2021 00:08:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230084AbhCEXIL (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 5 Mar 2021 18:08:11 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32952 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229792AbhCEXID (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 5 Mar 2021 18:08:03 -0500
Received: from mail-qk1-x72c.google.com (mail-qk1-x72c.google.com [IPv6:2607:f8b0:4864:20::72c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8D8FFC06175F
        for <linux-arm-msm@vger.kernel.org>; Fri,  5 Mar 2021 15:08:03 -0800 (PST)
Received: by mail-qk1-x72c.google.com with SMTP id a9so3687866qkn.13
        for <linux-arm-msm@vger.kernel.org>; Fri, 05 Mar 2021 15:08:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=marek-ca.20150623.gappssmtp.com; s=20150623;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=dNOfy+4JVngKRWmS3lpLOlIxvZssBG0MFQQkKbrKJlg=;
        b=O5GL+LmzFSaO5vYSK6DQ1VSdrnRjKWpzQWa1N/14LIh2qXKbGuJGk05JDwf7u+wLSZ
         yY/UoYFg5qyUg8Zq4MXqL+G11I+V0jQq+2oCXPPfhDMOFYC8ilkxTha6eM+T24xPGdp7
         rmXhMA7d5w1m0xRZdtnWjHhw8na3gTQBWw+Q/QwW/i10b6vbxTM7EhDuEnPFzXUM0rfy
         /VTebUQzz+sM+4Ez6VoeVlH6jeki/JUyPcj3sHzBgUkpgdM/5D+yzAjr/Lt+B3+6k5el
         nDw0UniH5uwGi5KXr7MnNwHIhA/BB377tBompL1e1ayIfffm4RNPrkPEmqrw7YGVYHSd
         rvng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=dNOfy+4JVngKRWmS3lpLOlIxvZssBG0MFQQkKbrKJlg=;
        b=gTajn7XiHwBrBbIllCkiMSJ+hYEtjUyH48weE4+GwVZBiFL2KFh8D/loB098aWc/I+
         ViD9YCHLokGCDBkSk4a0PwPsQxR/tP4x67RfJWWlWigbiL+gOkuTGyEwXfwlv42AjP0H
         BQzMpDXMNBXwhVi08tzDeGnLDuivqxbMelgV21INaprYJJt3hJHc8DIRl8h6iUs3DODV
         0erD48pVfI6u+GpXZQrisPRjS2y7PRQpx2kgq0l/YbM3wf3K1IvZ0bivuDGdCyNkgsNu
         zu/gT4EgFLcHa1WCh8ZBHMiBOFlj1rUjV3hSNCgCLmoy73XICm4W4rU3Qd+SB5XBN52e
         bawg==
X-Gm-Message-State: AOAM533F8dwcdIAF/5ntzfi8M84t3JHPzinB1Oo0TmIUATt5/gUK+FSp
        ydFj8vorWTK5FJV8id0jHG7s9w==
X-Google-Smtp-Source: ABdhPJxw8pg7Vjat2LQVDgSIs8+7LU4dkFVLn4MTIo8uqHTehUq8Npi3JYT07t8hM0E3jHzk4La6QA==
X-Received: by 2002:a37:6244:: with SMTP id w65mr11172754qkb.393.1614985682638;
        Fri, 05 Mar 2021 15:08:02 -0800 (PST)
Received: from [192.168.0.189] (modemcable068.184-131-66.mc.videotron.ca. [66.131.184.68])
        by smtp.gmail.com with ESMTPSA id s133sm2870546qke.1.2021.03.05.15.08.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 05 Mar 2021 15:08:01 -0800 (PST)
Subject: Re: [PATCH] drm/msm/dsi: support CPHY mode for 7nm pll/phy
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        freedreno@lists.freedesktop.org
Cc:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Rob Herring <robh+dt@kernel.org>,
        Douglas Anderson <dianders@chromium.org>,
        Kalyan Thota <kalyan_t@codeaurora.org>,
        Jordan Crouse <jcrouse@codeaurora.org>,
        "Kristian H. Kristensen" <hoegsberg@google.com>,
        Sam Ravnborg <sam@ravnborg.org>,
        Rikard Falkeborn <rikard.falkeborn@gmail.com>,
        Emil Velikov <emil.velikov@collabora.com>,
        Viresh Kumar <viresh.kumar@linaro.org>,
        Rajendra Nayak <rnayak@codeaurora.org>,
        Konrad Dybcio <konradybcio@gmail.com>,
        Dave Airlie <airlied@redhat.com>,
        "open list:DRM DRIVER FOR MSM ADRENO GPU" 
        <linux-arm-msm@vger.kernel.org>,
        "open list:DRM DRIVER FOR MSM ADRENO GPU" 
        <dri-devel@lists.freedesktop.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>
References: <20210215162805.21481-1-jonathan@marek.ca>
 <3e511cd9-2dbc-abf0-23c0-26779eb1777f@linaro.org>
From:   Jonathan Marek <jonathan@marek.ca>
Message-ID: <cafc7dad-68bf-28f0-4134-e494c6f68256@marek.ca>
Date:   Fri, 5 Mar 2021 18:06:43 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <3e511cd9-2dbc-abf0-23c0-26779eb1777f@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 3/5/21 5:45 PM, Dmitry Baryshkov wrote:
> On 15/02/2021 19:27, Jonathan Marek wrote:
>> Add the required changes to support 7nm pll/phy in CPHY mode.
>>
>> This adds a "qcom,dsi-phy-cphy-mode" property for the PHY node to enable
>> the CPHY mode.
>>
>> Signed-off-by: Jonathan Marek <jonathan@marek.ca>
> 
> Other that few comments bellow:
> 
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> 
>> ---
>>   .../devicetree/bindings/display/msm/dsi.txt   |  1 +
>>   drivers/gpu/drm/msm/dsi/dsi.c                 | 12 +--
>>   drivers/gpu/drm/msm/dsi/dsi.h                 |  6 +-
>>   drivers/gpu/drm/msm/dsi/dsi.xml.h             |  2 +
>>   drivers/gpu/drm/msm/dsi/dsi_host.c            | 34 +++++--
>>   drivers/gpu/drm/msm/dsi/phy/dsi_phy.c         | 49 +++++++++-
>>   drivers/gpu/drm/msm/dsi/phy/dsi_phy.h         |  3 +
>>   drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c     | 89 ++++++++++++++-----
>>   drivers/gpu/drm/msm/dsi/pll/dsi_pll.c         |  4 +-
>>   drivers/gpu/drm/msm/dsi/pll/dsi_pll.h         |  5 +-
>>   drivers/gpu/drm/msm/dsi/pll/dsi_pll_7nm.c     | 71 +++++++++------
>>   11 files changed, 210 insertions(+), 66 deletions(-)
>>
>> diff --git a/Documentation/devicetree/bindings/display/msm/dsi.txt 
>> b/Documentation/devicetree/bindings/display/msm/dsi.txt
>> index b9a64d3ff184..7ffc86a9816b 100644
>> --- a/Documentation/devicetree/bindings/display/msm/dsi.txt
>> +++ b/Documentation/devicetree/bindings/display/msm/dsi.txt
>> @@ -124,6 +124,7 @@ Required properties:
>>   Optional properties:
>>   - qcom,dsi-phy-regulator-ldo-mode: Boolean value indicating if the 
>> LDO mode PHY
>>     regulator is wanted.
>> +- qcom,dsi-phy-cphy-mode: Boolean value indicating if CPHY mode is 
>> wanted.
>>   - qcom,mdss-mdp-transfer-time-us:    Specifies the dsi transfer time 
>> for command mode
>>                       panels in microseconds. Driver uses this number 
>> to adjust
>>                       the clock rate according to the expected 
>> transfer time.
> 
> This should go in a separate patch, shan't it?
> 
>> diff --git a/drivers/gpu/drm/msm/dsi/dsi.c 
>> b/drivers/gpu/drm/msm/dsi/dsi.c
>> index 627048851d99..68d8547f7264 100644
>> --- a/drivers/gpu/drm/msm/dsi/dsi.c
>> +++ b/drivers/gpu/drm/msm/dsi/dsi.c
>> @@ -13,7 +13,7 @@ struct drm_encoder *msm_dsi_get_encoder(struct 
>> msm_dsi *msm_dsi)
>>       return msm_dsi->encoder;
>>   }
>> -static int dsi_get_phy(struct msm_dsi *msm_dsi)
>> +static int dsi_get_phy(struct msm_dsi *msm_dsi, bool *cphy_mode)
> 
> I see no need to pass the 'cphy_mode' through the bool pointer and back 
> to msm_dsi_host_init. What about just putting it into struct msm_dsi?
> 

Because it doesn't need to be stored in msm_dsi (need it in msm_dsi_host 
which doesn't have access to msm_dsi). But I suppose it doesn't hurt to 
also have it in msm_dsi and make things a bit cleaner.

>>   {
>>       struct platform_device *pdev = msm_dsi->pdev;
>>       struct platform_device *phy_pdev;
>> @@ -29,6 +29,7 @@ static int dsi_get_phy(struct msm_dsi *msm_dsi)
>>       if (phy_pdev)
>>           msm_dsi->phy = platform_get_drvdata(phy_pdev);
>> +    *cphy_mode = of_property_read_bool(phy_node, 
>> "qcom,dsi-phy-cphy-mode");
>>       of_node_put(phy_node);
>>       if (!phy_pdev || !msm_dsi->phy) {
>> @@ -65,6 +66,7 @@ static void dsi_destroy(struct msm_dsi *msm_dsi)
>>   static struct msm_dsi *dsi_init(struct platform_device *pdev)
>>   {
>>       struct msm_dsi *msm_dsi;
>> +    bool cphy_mode;
>>       int ret;
>>       if (!pdev)
>> @@ -79,13 +81,13 @@ static struct msm_dsi *dsi_init(struct 
>> platform_device *pdev)
>>       msm_dsi->pdev = pdev;
>>       platform_set_drvdata(pdev, msm_dsi);
>> -    /* Init dsi host */
>> -    ret = msm_dsi_host_init(msm_dsi);
>> +    /* GET dsi PHY */
>> +    ret = dsi_get_phy(msm_dsi, &cphy_mode);
>>       if (ret)
>>           goto destroy_dsi;
>> -    /* GET dsi PHY */
>> -    ret = dsi_get_phy(msm_dsi);
>> +    /* Init dsi host */
>> +    ret = msm_dsi_host_init(msm_dsi, cphy_mode);
>>       if (ret)
>>           goto destroy_dsi;
> 
> 
