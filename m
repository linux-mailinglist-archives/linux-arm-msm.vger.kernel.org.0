Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CFCCC54DA25
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 Jun 2022 08:03:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1358858AbiFPGDM (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 16 Jun 2022 02:03:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50906 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1358905AbiFPGDK (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 16 Jun 2022 02:03:10 -0400
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com [IPv6:2a00:1450:4864:20::231])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 945471F604
        for <linux-arm-msm@vger.kernel.org>; Wed, 15 Jun 2022 23:03:08 -0700 (PDT)
Received: by mail-lj1-x231.google.com with SMTP id d19so359845lji.10
        for <linux-arm-msm@vger.kernel.org>; Wed, 15 Jun 2022 23:03:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=Z/6CysC4KQFR6QV0a+LcXqbeuRwoBK9qA3xXzR01nNA=;
        b=jJBZf5sR+X/C0YJwR0nZXdlcP6Mg/UWZcz8pvAkxXWXvjtleJI2UT67Q1pyo/Zg3x3
         GMQOwt66Ow7g0H3TZ3boR173BdYaRDZuZcKwV5mTsMphMY5zkUze9XFajqwbN137oH7p
         9nXdbizZiMoQdjChe0JA+k1Q/nZc4RsC3XyCGmzBPcBamRUXXsertcCrfoIBIzKVpAY7
         T4RpbmlA4Kyer4WlrLJIj5mdeIWW526RKjW7IEdyAGeLqdNoXV4Ko4NGwk6WeUzCm8lD
         qT0W9NNYySWjIcRgJwO9EYetjK/yhYXNUC+NZBLl/XKRoJ7uORUn4ESP+qHJuaYkfF/N
         Qm8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=Z/6CysC4KQFR6QV0a+LcXqbeuRwoBK9qA3xXzR01nNA=;
        b=sGpgZv2+9UzicymHpMyiQ6C2Intbium/HimlyZAr+3OlBeHTknQMPZKjtE9Bf/a5N/
         TqPsggZviTI8Zv4NPv+Yz0TRnHdtPdV1OATxbMVwkMZd+eGFnPOK9jFFaB3Ly+ij2Anb
         QKySJX5C0NKg5otmII0eeyQ8PDV4fy3VVYJ97wEDBvO5gf4rt/xM8eJy0Sz1ycp6negY
         u/0t2yinRg4sgQ5ezXKWaEU7eC1m+4qB3PgykWZhIz3k+bnMcxZZcCOTuG3I9RBM3q33
         CtSherBynZ2BYBSmsTVrIEvWekgcd9C30akuuO/ZRCVFTTQrzzj2eXF5rYoECa0SLJrX
         VKog==
X-Gm-Message-State: AJIora+iN5s+eZWFtDfTzicicBEPgRz5PSn0yHWH/DZzZmBDYyf+YP0v
        j0lC6XrMCj4dWymwL9apiF4YQw==
X-Google-Smtp-Source: AGRyM1v86oTwwWaYY30N6Fge9WAZr/mqmx1kTvvedOKhIeoDmVomiiB8oAcjcTIUh/5Z5daZ7v4RjQ==
X-Received: by 2002:a2e:2e07:0:b0:25a:4bb3:a2c2 with SMTP id u7-20020a2e2e07000000b0025a4bb3a2c2mr75328lju.450.1655359386925;
        Wed, 15 Jun 2022 23:03:06 -0700 (PDT)
Received: from [192.168.1.211] ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id u10-20020a2e9b0a000000b0025a43eb8c64sm119450lji.65.2022.06.15.23.03.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 15 Jun 2022 23:03:06 -0700 (PDT)
Message-ID: <297160e7-3999-e20e-c25b-ee60758a8f5d@linaro.org>
Date:   Thu, 16 Jun 2022 09:03:05 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH v2] drm/msm/dp: check core_initialized before disable
 interrupts at dp_display_unbind()
Content-Language: en-GB
To:     Kuogee Hsieh <quic_khsieh@quicinc.com>, robdclark@gmail.com,
        sean@poorly.run, swboyd@chromium.org, dianders@chromium.org,
        vkoul@kernel.org, daniel@ffwll.ch, airlied@linux.ie,
        agross@kernel.org, bjorn.andersson@linaro.org
Cc:     quic_abhinavk@quicinc.com, quic_aravindh@quicinc.com,
        quic_sbillaka@quicinc.com, freedreno@lists.freedesktop.org,
        dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <1654538139-7450-1-git-send-email-quic_khsieh@quicinc.com>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <1654538139-7450-1-git-send-email-quic_khsieh@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 06/06/2022 20:55, Kuogee Hsieh wrote:
> During msm initialize phase, dp_display_unbind() will be called to undo
> initializations had been done by dp_display_bind() previously if there is
> error happen at msm_drm_bind. In this case, core_initialized flag had to
> be check to make sure clocks is on before update DP controller register
> to disable HPD interrupts. Otherwise system will crash due to below NOC
> fatal error.
> 
> QTISECLIB [01f01a7ad]CNOC2 ERROR: ERRLOG0_LOW = 0x00061007
> QTISECLIB [01f01a7ad]GEM_NOC ERROR: ERRLOG0_LOW = 0x00001007
> QTISECLIB [01f0371a0]CNOC2 ERROR: ERRLOG0_HIGH = 0x00000003
> QTISECLIB [01f055297]GEM_NOC ERROR: ERRLOG0_HIGH = 0x00000003
> QTISECLIB [01f072beb]CNOC2 ERROR: ERRLOG1_LOW = 0x00000024
> QTISECLIB [01f0914b8]GEM_NOC ERROR: ERRLOG1_LOW = 0x00000042
> QTISECLIB [01f0ae639]CNOC2 ERROR: ERRLOG1_HIGH = 0x00004002
> QTISECLIB [01f0cc73f]GEM_NOC ERROR: ERRLOG1_HIGH = 0x00004002
> QTISECLIB [01f0ea092]CNOC2 ERROR: ERRLOG2_LOW = 0x0009020c
> QTISECLIB [01f10895f]GEM_NOC ERROR: ERRLOG2_LOW = 0x0ae9020c
> QTISECLIB [01f125ae1]CNOC2 ERROR: ERRLOG2_HIGH = 0x00000000
> QTISECLIB [01f143be7]GEM_NOC ERROR: ERRLOG2_HIGH = 0x00000000
> QTISECLIB [01f16153a]CNOC2 ERROR: ERRLOG3_LOW = 0x00000000
> QTISECLIB [01f17fe07]GEM_NOC ERROR: ERRLOG3_LOW = 0x00000000
> QTISECLIB [01f19cf89]CNOC2 ERROR: ERRLOG3_HIGH = 0x00000000
> QTISECLIB [01f1bb08e]GEM_NOC ERROR: ERRLOG3_HIGH = 0x00000000
> QTISECLIB [01f1d8a31]CNOC2 ERROR: SBM1 FAULTINSTATUS0_LOW = 0x00000002
> QTISECLIB [01f1f72a4]GEM_NOC ERROR: SBM0 FAULTINSTATUS0_LOW = 0x00000001
> QTISECLIB [01f21a217]CNOC3 ERROR: ERRLOG0_LOW = 0x00000006
> QTISECLIB [01f23dfd3]NOC error fatal
> 
> changes in v2:
> -- drop the first patch (drm/msm: enable msm irq after all initializations are done successfully at msm_drm_init()) since the problem had been fixed by other patch
> 
> Fixes: a65c95ff88f2 ("drm/msm/dp: stop event kernel thread when DP unbind")

Please. Stop using commit IDs from the private git tree.  I thought we 
have stumbled upon this during the last cycle, thus we won't see rogue 
commit IDs anymore. But I was wrong. I've got another complaint from 
Stephen. I'm going to fix this one manually, but please make sure to 
stop sending wrong Fixes tags in the future.

Generally I feel like this is a sign of an incorrect process on your 
side. The patches should be developed and tested against one of upstream 
trees (linux-next, msm-next or msm-next-lumag) and then backported to 
your integration/backports/stable/whatever. Since today the 
msm-next-lumag is included into the linux-next, so you can use 
linux-next as a basis.


> Signed-off-by: Kuogee Hsieh <quic_khsieh@quicinc.com>
> ---
>   drivers/gpu/drm/msm/dp/dp_display.c | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
> index da5c03a..2b72639 100644
> --- a/drivers/gpu/drm/msm/dp/dp_display.c
> +++ b/drivers/gpu/drm/msm/dp/dp_display.c
> @@ -309,7 +309,8 @@ static void dp_display_unbind(struct device *dev, struct device *master,
>   	struct msm_drm_private *priv = dev_get_drvdata(master);
>   
>   	/* disable all HPD interrupts */
> -	dp_catalog_hpd_config_intr(dp->catalog, DP_DP_HPD_INT_MASK, false);
> +	if (dp->core_initialized)
> +		dp_catalog_hpd_config_intr(dp->catalog, DP_DP_HPD_INT_MASK, false);
>   
>   	kthread_stop(dp->ev_tsk);
>   


-- 
With best wishes
Dmitry
