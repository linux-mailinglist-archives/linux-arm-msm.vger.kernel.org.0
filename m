Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 694106F305E
	for <lists+linux-arm-msm@lfdr.de>; Mon,  1 May 2023 13:10:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232218AbjEALKF (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 1 May 2023 07:10:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34954 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232196AbjEALKE (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 1 May 2023 07:10:04 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8FB261BC
        for <linux-arm-msm@vger.kernel.org>; Mon,  1 May 2023 04:09:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1682939356;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=bqu+Hhsr0VFy2nrIKRh1qzsr1Sd9dzBG2TlzQQmlt/4=;
        b=Oug8j1712AA7o45Ew8IiUdn4bOPuAi0DTIxyzfoRTENrxFlFMQF+KQzDB38zkWMO2z1w2+
        a4MyRYw2nz34p4X/iMHatwFSMR+8HwmRFNrhau1HxcH8KPEzIkQzacw5iVF0LWcmYk6JCv
        CzkIx0KT3pLAQOSB/GTen8Ss3vX4yx8=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-546-zeK854h3O0GpFFdeYCZbjw-1; Mon, 01 May 2023 07:09:15 -0400
X-MC-Unique: zeK854h3O0GpFFdeYCZbjw-1
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-3f16fa91923so13241095e9.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 01 May 2023 04:09:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682939354; x=1685531354;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=bqu+Hhsr0VFy2nrIKRh1qzsr1Sd9dzBG2TlzQQmlt/4=;
        b=Lk+7UnEvqJADHQ++HKICnVDK4DUwRQKJ6dl+5B9OX6IAu8V7E7z6VYP73a3E/Q4w0y
         4CWiMVzuH/mX60YeSDvrgEpJfbl+2BHx1SexXh+YjqNjOJVvdHDDFNKwLPgly7XJSDyX
         9yFhNCaie/5Rz8/rSnliKkmaIQp3J4tX1qb33AYldkzmahAtiMqKeg6YvTMaPBYeQt4+
         blzVLqbw+GhNmyRNvV4gBySI2rOWrMTP3etks0pUuj0B6vUFjSmVukHxjhwfjIaQWS3s
         A5johdwYobbZrWhUlI3LnOp+aDF070qPJ6f5Y3l+uvq6F8ikxTbZHQy3rYVHfFf8W3cp
         Oe/w==
X-Gm-Message-State: AC+VfDxJgxCrz9qLpi4NlChOFVDbvEjOnxbsMZ/DXL8xqVXTq6NpQ0th
        nlTqjwHffRdCvuZj9QmA9jUwNVsh7inIpfxHJu6q/gf1JZWBOrhWGVh8mHgyhVWKSshxN/pjdOt
        hcteMvvAu3ZCcJ1UexYEHSPbdig==
X-Received: by 2002:a7b:c8c4:0:b0:3f1:78d0:fc4e with SMTP id f4-20020a7bc8c4000000b003f178d0fc4emr10055337wml.32.1682939354358;
        Mon, 01 May 2023 04:09:14 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ61DBsHZKShBHhSdEJqNninSNHqBCJtFy04xS9KIxu1cPbe+S5dJqDogEUzz903RUiD76wPtQ==
X-Received: by 2002:a7b:c8c4:0:b0:3f1:78d0:fc4e with SMTP id f4-20020a7bc8c4000000b003f178d0fc4emr10055326wml.32.1682939354037;
        Mon, 01 May 2023 04:09:14 -0700 (PDT)
Received: from localhost (205.pool92-176-231.dynamic.orange.es. [92.176.231.205])
        by smtp.gmail.com with ESMTPSA id jb12-20020a05600c54ec00b003f17003e26esm35424621wmb.15.2023.05.01.04.09.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 May 2023 04:09:13 -0700 (PDT)
From:   Javier Martinez Canillas <javierm@redhat.com>
To:     Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        stanimir.k.varbanov@gmail.com, quic_vgarodia@quicinc.com,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org
Cc:     laurent.pinchart+renesas@ideasonboard.com, broonie@kernel.org,
        dorum@noisolation.com, quic_bjorande@quicinc.com,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Subject: Re: [PATCH] media: MAINTAINERS: Add myself as Venus reviewer
In-Reply-To: <20230501103914.962874-1-bryan.odonoghue@linaro.org>
References: <20230501103914.962874-1-bryan.odonoghue@linaro.org>
Date:   Mon, 01 May 2023 13:09:12 +0200
Message-ID: <87o7n4xq93.fsf@minerva.mail-host-address-is-not-set>
MIME-Version: 1.0
Content-Type: text/plain
X-Spam-Status: No, score=-2.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Bryan O'Donoghue <bryan.odonoghue@linaro.org> writes:

Hello Bryan,

> I'd like to be looped in on changes to venus so that I can help ensure no
> obvious regressions creep in. I'm happy to run some simple tests for venus
> on the hardware I have access to
>
> - db410c
> - db820
> - rb3
> - rb5
>
> and one of rb1 / rb2 in the future when they are delivered.
>
> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> ---
>  MAINTAINERS | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 713422f465365..e63b1725b5ada 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -17546,6 +17546,7 @@ F:	include/dt-bindings/usb/typec/qcom,pmic-typec.h
>  QUALCOMM VENUS VIDEO ACCELERATOR DRIVER
>  M:	Stanimir Varbanov <stanimir.k.varbanov@gmail.com>
>  M:	Vikash Garodia <quic_vgarodia@quicinc.com>
> +R:	Bryan O'Donoghue <bryan.odonoghue@linaro.org>
>  L:	linux-media@vger.kernel.org
>  L:	linux-arm-msm@vger.kernel.org
>  S:	Maintained
> -- 
> 2.39.2
>

Great, it would be good to have more people keeping an eye to this driver.

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

