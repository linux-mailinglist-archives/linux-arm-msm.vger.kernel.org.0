Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D76724F0C61
	for <lists+linux-arm-msm@lfdr.de>; Sun,  3 Apr 2022 21:42:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1376417AbiDCTnY (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 3 Apr 2022 15:43:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56196 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1376389AbiDCTnW (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 3 Apr 2022 15:43:22 -0400
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com [IPv6:2a00:1450:4864:20::134])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D4912393D9
        for <linux-arm-msm@vger.kernel.org>; Sun,  3 Apr 2022 12:41:24 -0700 (PDT)
Received: by mail-lf1-x134.google.com with SMTP id m3so13597603lfj.11
        for <linux-arm-msm@vger.kernel.org>; Sun, 03 Apr 2022 12:41:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=tf4NDkrFjFtpA/8rtvNg2MUKvuMuXJVPPPy1VqazccE=;
        b=kKYkpOxPM+0g5Brf45xBmthZe9re4AsHez3ayLqL/VANXxs1pTjQygyVH/vmM5VnwU
         fhXvMlF/jehoXe3ss/MZwB+6jiI3wWTQOsgnBvKd3IoOqj5N02I5635VK0YAu+RqdNFX
         1tX6slGMX2seVAGYW795uUtMq5vHC9NRI6QHRIQGXNsrAJHxvDhiozqPdP5glNFdjSws
         dbffPL/q3MRDoUCjViBvVTK7160cu41Ee70eAREnTldNS9mBli6+zVAkbZNV5QWvoyWW
         eZPJ7QCbJx8cCmiHpJYUPnJCPZLs5GzcKzLxhi/817Yu/7B3l8zqI8m0tR+t9hYmDFmt
         LVag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=tf4NDkrFjFtpA/8rtvNg2MUKvuMuXJVPPPy1VqazccE=;
        b=1nhq48E3bQZzZ1O5O8ohOEpByq5t7agq2ZcMbOineCWCgQ+juZMLEMRGt1sMuGtPG4
         1QUTjqBkNYs5OuZb/BBxp9h1teOJJ8TGwVvwFfmVdsQ8haOfaCiEDNA+GN+bn7BGVXZI
         0daLRwlKKQEF6yG0V/99NYYmdUx11UZHJff43xmPBZxF47u1Il//hGQuZ3LNQLU5uduS
         WXOzikSj2VzfjwyugMMl7e4DKU+DHm2veJ2VJ7hqXUQhtB8/+O4p0Ca9+ypYNGHOoC89
         XjPZr7oyojqEkaCJ3i601q78I8nOkP9hy7Sf9LkptWyue9ifzy3plJQQ82BXpp3FEJ55
         cvpA==
X-Gm-Message-State: AOAM533haJIrYp0V4emJc5Qll5fcj0IZItWr0G7PN7sHsns/CPuiKh9J
        /RcXQ54hYEN9RpdJnyKV74n+fw==
X-Google-Smtp-Source: ABdhPJygV2SkVKOu0JaDxquUlDNuQAJnqXBsm+URyjIGM1u2HmD8dlaHEUqxXutWYQ4OV1PDISAK+w==
X-Received: by 2002:a05:6512:118f:b0:44a:2d97:d83b with SMTP id g15-20020a056512118f00b0044a2d97d83bmr20114206lfr.487.1649014883031;
        Sun, 03 Apr 2022 12:41:23 -0700 (PDT)
Received: from [192.168.1.211] ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id g11-20020ac24d8b000000b0044a3454c858sm904669lfe.81.2022.04.03.12.41.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 03 Apr 2022 12:41:22 -0700 (PDT)
Message-ID: <8c047408-34a5-0754-25f8-2e37e2a5be5f@linaro.org>
Date:   Sun, 3 Apr 2022 22:41:21 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH v2 5/5] arm64: dts: qcom: msm8996-xiaomi-*: Enable MSS and
 SLPI
Content-Language: en-GB
To:     Yassine Oudjana <y.oudjana@protonmail.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Ohad Ben-Cohen <ohad@wizery.com>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh+dt@kernel.org>
Cc:     AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@somainline.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Raffaele Tranquillini <raffaele.tranquillini@gmail.com>,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, phone-devel@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20210926190555.278589-1-y.oudjana@protonmail.com>
 <20210926190555.278589-6-y.oudjana@protonmail.com>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20210926190555.278589-6-y.oudjana@protonmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-5.7 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 26/09/2021 22:06, Yassine Oudjana wrote:
> Enable mss_pil and slpi_pil and set their firmware paths.
> 
> Signed-off-by: Yassine Oudjana <y.oudjana@protonmail.com>

Tested-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org> #db820c


-- 
With best wishes
Dmitry
