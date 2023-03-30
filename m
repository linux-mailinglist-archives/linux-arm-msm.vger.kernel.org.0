Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D6C336CF85C
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Mar 2023 02:49:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229675AbjC3AtU (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 29 Mar 2023 20:49:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56744 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229449AbjC3AtT (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 29 Mar 2023 20:49:19 -0400
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com [IPv6:2a00:1450:4864:20::12b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9B6F940FE
        for <linux-arm-msm@vger.kernel.org>; Wed, 29 Mar 2023 17:49:18 -0700 (PDT)
Received: by mail-lf1-x12b.google.com with SMTP id c29so22511279lfv.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 29 Mar 2023 17:49:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1680137357;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=V8vjA8lbodRgcB4Q/hUrG14t5OddrbjhZVGGzITsMb4=;
        b=IC9zj+TOQPPmMngvTh4eZy7PYExWZjwodsiYNOX7Mn7zr6eneR9puI7guYjpz39RGM
         bqbmbJXvIzwiwMSfTLFpD2vesAcJSZm2Iz7WONBaKMRHrKi4jjqeRKUDjBjWVZ3GTbUK
         6i41GOpRQKHgCus7xYmEx12GOufydh9Cc66D46+M0NB63iJljy0a503BeIYBNEed6jzP
         L9pj7BahNU8nsv6bOwcCz08piLoMEjaRU6b1t8ew9uXomyUh2VMCZ32YyrnP3Lw2BmY/
         MYdcwI8x/UmrzK3DGf1BI29mdlG0jrdMpzpUncx747qfB3CAC+ji5yz6SYWT7+D/HGtd
         UrUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680137357;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=V8vjA8lbodRgcB4Q/hUrG14t5OddrbjhZVGGzITsMb4=;
        b=Cv0OvXETzzSRO8EMc3b/mndfTIjfnwXbVuOYhWMOr5UaT+yiWvrllHOVZqP0BPYDPv
         oOdoU1mx8s8WNorphs1gvEca9hy2T1g5VAxdiOIK8qBKdn9MHF8/n20jvff8gLQQDuaM
         v6G8jxeHe0ASwkrIbruiR0Go8l6E0O1E8G0NEXZFWTXcsi9liPQU+/qttIR5UmCe4c5+
         O7QsPcn8QCCn2jWV5wcVkqWWqeZfUX39yjW1zqRY9yE0vyQrRTrxbpyJqRCT2JyrB3is
         T9PtWmk989Z10PLs4rmDuyfKOmxZWZScZZAV51FXtfeOZgPdIStSM6X4V27yOyoKmQju
         Uq3g==
X-Gm-Message-State: AAQBX9cQvFCdW7vMeAJRZjj6vccTS91At5uOXJRUJgJhgAMLf+w2gEAe
        RZG2gwR5aSlbRgkFaNpUqHt7ag==
X-Google-Smtp-Source: AKy350bVhhnR5UQqwdGHQ+qnkmSkADQU6XN82L8kOZOZr/06EYKeF6QjbVXOpru2aUC2UJGYmPvnfA==
X-Received: by 2002:a19:c202:0:b0:4db:2cdf:4c11 with SMTP id l2-20020a19c202000000b004db2cdf4c11mr5706512lfc.62.1680137356877;
        Wed, 29 Mar 2023 17:49:16 -0700 (PDT)
Received: from ?IPV6:2001:14ba:a085:4d00::8a5? (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
        by smtp.gmail.com with ESMTPSA id w19-20020ac24433000000b004eb00c0d417sm2846884lfl.130.2023.03.29.17.49.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Mar 2023 17:49:16 -0700 (PDT)
Message-ID: <c15a7b64-50a0-1093-1d35-0a308ffbcea0@linaro.org>
Date:   Thu, 30 Mar 2023 03:49:15 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH RFC 2/5] drm/msm: Add MSM-specific DSC helper methods
Content-Language: en-GB
To:     Jessica Zhang <quic_jesszhan@quicinc.com>,
        freedreno@lists.freedesktop.org
Cc:     Marijn Suijten <marijn.suijten@somainline.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Daniel Vetter <daniel@ffwll.ch>,
        Rob Clark <robdclark@gmail.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Sean Paul <sean@poorly.run>, dri-devel@lists.freedesktop.org,
        linux-arm-msm@vger.kernel.org
References: <20230329-rfc-msm-dsc-helper-v1-0-f3e479f59b6d@quicinc.com>
 <20230329-rfc-msm-dsc-helper-v1-2-f3e479f59b6d@quicinc.com>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20230329-rfc-msm-dsc-helper-v1-2-f3e479f59b6d@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 30/03/2023 02:18, Jessica Zhang wrote:
> Introduce MSM-specific DSC helper methods, as some calculations are
> common between DP and DSC.
> 
> Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
> ---
>   drivers/gpu/drm/msm/Makefile              |  1 +
>   drivers/gpu/drm/msm/disp/msm_dsc_helper.c | 74 +++++++++++++++++++++++++++++++
>   drivers/gpu/drm/msm/disp/msm_dsc_helper.h | 28 ++++++++++++

Also: outside of disp, please.

>   3 files changed, 103 insertions(+)
> 

-- 
With best wishes
Dmitry

