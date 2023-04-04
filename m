Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 081466D6F2C
	for <lists+linux-arm-msm@lfdr.de>; Tue,  4 Apr 2023 23:43:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236266AbjDDVnt (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 4 Apr 2023 17:43:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50836 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234988AbjDDVns (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 4 Apr 2023 17:43:48 -0400
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com [IPv6:2a00:1450:4864:20::132])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 73E1B173A
        for <linux-arm-msm@vger.kernel.org>; Tue,  4 Apr 2023 14:43:47 -0700 (PDT)
Received: by mail-lf1-x132.google.com with SMTP id h25so44116722lfv.6
        for <linux-arm-msm@vger.kernel.org>; Tue, 04 Apr 2023 14:43:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1680644625;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=xKUgiJ3loiwk0e4aXihhVUgl3OPblBbKPcoqYQAlaG4=;
        b=DBHwp8UvxZF5RelW+ds8zN4JFO23lMT0BxnL78ZuYts4f7FubSjbyxggA9JGa+O3it
         WlMmk9jo0yCA09J2uyijC6X7ExkvsO8YwTggcwpjTVczPwZnoSZDbLJlUqvjX2rYl/I7
         +HKmeIbXz1wyVdP6iDb2NtMY4Ot3NtlhZgNnM246eRsu3EHtoYaQeCQUmp9ERhCS6WxN
         Fjj4K976WevfG1zpbTC+/BdmzK4o6lMY1+F+V92NOWdXLx/aBNhxb3vGKyF6csDDRQCi
         PWgE0CURuvnvY1Vz9a9YxBt9rnMESeqAefaQzvEdLYFGJAvWK+TdApKX4S75R8xyHOMp
         uuqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680644625;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xKUgiJ3loiwk0e4aXihhVUgl3OPblBbKPcoqYQAlaG4=;
        b=GxANrSDnE4P+3Cy8u57lL9q/mDhykIArVLDzIHzK1f8tnnEKl+tOQCcWpgsdxIf1f7
         VxBVcpzKlp3YNVsYwmfO8B4Xu3swcdlqsiLQZF+eReRkm5yjguLAN1RzMeXrgvob+60O
         XiyLBl4/eWinRv0/22ASmbJ1UmfKPlK7yYhK3Sd+JvesXy/f4EEg0Izdz71U3FPd5ZUX
         4rLONkZd2Kl2UBSU+ExxhrJLkHkXVbwxz4KY5IJeiybdoJrPTcat0Qrb2jNV4dO5lAt3
         UxXz/k7bZgyKnZXoMXES2Pg3KOSiFph/EmlCOd5M6tcS6WHaxV53gbgHZ9VMMQu6UuVf
         cwIw==
X-Gm-Message-State: AAQBX9ctadstWJJfe7R7VE9yumhFeGoUFXDL1sm3DE4VP1Vs8kGpktqb
        ey7T7cbeDV5CLfNKXzvpXBA4XA==
X-Google-Smtp-Source: AKy350Ycdl0Cl3uRa1nCTKWiPW/L0+xiN8st0AuHISzk9T3nMsHBMckmQGPp2Ur+xJLIxY991Vb/Bw==
X-Received: by 2002:ac2:519c:0:b0:4eb:c4e:bd87 with SMTP id u28-20020ac2519c000000b004eb0c4ebd87mr912474lfi.58.1680644625716;
        Tue, 04 Apr 2023 14:43:45 -0700 (PDT)
Received: from ?IPV6:2001:14ba:a085:4d00::8a5? (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
        by smtp.gmail.com with ESMTPSA id q17-20020a19a411000000b004d3d43c7569sm2499581lfc.3.2023.04.04.14.43.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 04 Apr 2023 14:43:45 -0700 (PDT)
Message-ID: <4a7bcbec-e9e2-2178-420a-56dcf8fb88dc@linaro.org>
Date:   Wed, 5 Apr 2023 00:43:44 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH v2 4/8] drm/msm: Remove struct msm_fbdev
Content-Language: en-GB
To:     Thomas Zimmermann <tzimmermann@suse.de>, robdclark@gmail.com,
        quic_abhinavk@quicinc.com, sean@poorly.run, javierm@redhat.com,
        airlied@gmail.com, daniel@ffwll.ch
Cc:     linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
References: <20230403124538.8497-1-tzimmermann@suse.de>
 <20230403124538.8497-5-tzimmermann@suse.de>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20230403124538.8497-5-tzimmermann@suse.de>
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
> Remove struct msm_fbdev, which is an empty wrapper around struct
> drm_fb_helper. Use the latter directly. No functional changes.
> 
> v2:
> 	* kfree fbdev helper instance on init errors (Dmitri)
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---
>   drivers/gpu/drm/msm/msm_fbdev.c | 20 ++++----------------
>   1 file changed, 4 insertions(+), 16 deletions(-)
>

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

