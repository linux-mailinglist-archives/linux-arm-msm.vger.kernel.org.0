Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 45FB96D6F20
	for <lists+linux-arm-msm@lfdr.de>; Tue,  4 Apr 2023 23:42:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236296AbjDDVmm (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 4 Apr 2023 17:42:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49838 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236274AbjDDVml (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 4 Apr 2023 17:42:41 -0400
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com [IPv6:2a00:1450:4864:20::134])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5E2C33A8C
        for <linux-arm-msm@vger.kernel.org>; Tue,  4 Apr 2023 14:42:40 -0700 (PDT)
Received: by mail-lf1-x134.google.com with SMTP id g17so44136992lfv.4
        for <linux-arm-msm@vger.kernel.org>; Tue, 04 Apr 2023 14:42:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1680644558;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=0VVpMIHPposd8dIJG6VpkrFLF/OZQKsBp3Ngoym3OkM=;
        b=gMtx/fed5N4vMlptZRUYbFlytG5GeD00n7bpBeTf/JZIsz8LzISvv4Soc2+vxcjLl1
         VpO3RWeqxrpYITofTyWODhgUtkWcITXh1Dk1PfNzpT5rOtKywY9aKZq4Z+/YkonL2foV
         Hybk2jKbwXIXvK7i6u0Q6EvYKcPj1hT/Q7nINLcrKpFr19qJqr0h6IXUCvLzp2UDFvg1
         3cD1HGA3rnZIY0o8cb8Unxm26j6ZUXQokHfXIOmNneb/mnW5gV3pR7H4UVy0+JSgvUHH
         DL10gkFNKoqaHG/9IlKyAG2LWIW5F4W0G8lPQxXR/SgvdnTvpcYQZu/jzMncLXcWbeTV
         GEHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680644558;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0VVpMIHPposd8dIJG6VpkrFLF/OZQKsBp3Ngoym3OkM=;
        b=8PeqFAHgNXt8Qzskmeyg0PiuVeTgdTy5Gt60hKS5bq138+H/eASk6YvGQ4nwRWvXCt
         9d453vMRRvb7NQDypHZd24mF4tXVwKxBPDLCRL9zkfwRgOQEmSYkJlYgHXTeFxGxEBa8
         1AmSFllQn0MSBIh3Y9TUxZF9TOiNZ24eIS10eyGstR0KIG1bmGdlU39XxebXDlSgTGw6
         AAQvZLXENjcfFb7j8SOGBS0O+yREp39gSKrDHMsL7rSGPPDza48ET1IZzW4k17T0mp9O
         DiaQDq69DTQRDlY1/oAFE9MDWJPdxhx4l3nsdyVu6hYypBHLJM3ylo3IdT1mKKH6+BkA
         Erwg==
X-Gm-Message-State: AAQBX9dLQyocFeVkawwoGwrhcCKlYOLhWB9hUmVcWXXkTr7MVnPe1jng
        osF2ZiwP0DR5auoP5+BWrea8xg==
X-Google-Smtp-Source: AKy350bzAO2ComF8Aki8azB3/UcsofxEuobFYAUPtjFGZXrBrLsP9eqeIPqHFdL0GmkTsrlWMt1pFw==
X-Received: by 2002:ac2:511c:0:b0:4cb:e53:d54b with SMTP id q28-20020ac2511c000000b004cb0e53d54bmr1145272lfb.25.1680644558636;
        Tue, 04 Apr 2023 14:42:38 -0700 (PDT)
Received: from ?IPV6:2001:14ba:a085:4d00::8a5? (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
        by smtp.gmail.com with ESMTPSA id c26-20020ac2531a000000b004e8497a5604sm2501028lfh.108.2023.04.04.14.42.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 04 Apr 2023 14:42:38 -0700 (PDT)
Message-ID: <db7e4dbc-c55b-c9b2-0cf6-bfacde56624a@linaro.org>
Date:   Wed, 5 Apr 2023 00:42:37 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH v2 1/8] drm/msm: Include <linux/io.h>
Content-Language: en-GB
To:     Thomas Zimmermann <tzimmermann@suse.de>, robdclark@gmail.com,
        quic_abhinavk@quicinc.com, sean@poorly.run, javierm@redhat.com,
        airlied@gmail.com, daniel@ffwll.ch
Cc:     linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, kernel test robot <lkp@intel.com>
References: <20230403124538.8497-1-tzimmermann@suse.de>
 <20230403124538.8497-2-tzimmermann@suse.de>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20230403124538.8497-2-tzimmermann@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 03/04/2023 15:45, Thomas Zimmermann wrote:
> Include <linux/io.h> to get the declaration of devm_ioremap() on
> sparc64. No functional changes.
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> Reported-by: kernel test robot <lkp@intel.com>
> Link: https://lore.kernel.org/oe-kbuild-all/202303301856.zSmpwZjj-lkp@intel.com/
> ---
>   drivers/gpu/drm/msm/msm_io_utils.c | 1 +
>   1 file changed, 1 insertion(+)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

