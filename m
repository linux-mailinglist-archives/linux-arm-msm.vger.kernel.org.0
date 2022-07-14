Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1FE31574933
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 Jul 2022 11:38:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238123AbiGNJie (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 14 Jul 2022 05:38:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45436 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230443AbiGNJid (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 14 Jul 2022 05:38:33 -0400
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com [IPv6:2a00:1450:4864:20::12e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2EF963719F
        for <linux-arm-msm@vger.kernel.org>; Thu, 14 Jul 2022 02:38:32 -0700 (PDT)
Received: by mail-lf1-x12e.google.com with SMTP id z25so1895311lfr.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 14 Jul 2022 02:38:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=TLtLAzqKjh0PR2hCiXTpWedWr6UZ/eh69O/Av6dFIUQ=;
        b=OrBeTbStBItEd8xp+RbyOHCOHfiOQOJrv5ANEz6qxRGixDOxMAJ5IzUuiOQejXwRyZ
         GMkAV6A+Rweq3b6Zxv0mjMm0eoJjr5PRDAQoZco1jCPPb6IAeQSgEB2x3wySZxwH92CG
         v7eIrrSCr/lzKx0racL0bqV858CJVvFs+RCUV9Iz1I0MBxltwBK4evG6S/Rrl/H7V2lq
         Ly6NpupvlRiBmGyepoRqeTavRvkISkRMGu8PAVRfuuZ3Oo+jFfV9oe/nSZlU3EbSClps
         DnYZKmYZJgdiBMW09JWHhs4cqCCLdFQrr5ck858Ixns9msDblNZPtZkKYbuhOiwYqNSY
         /OsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=TLtLAzqKjh0PR2hCiXTpWedWr6UZ/eh69O/Av6dFIUQ=;
        b=0Bo9AuLfu8pIqGIwlQcGzVzNqSc2EI1pyY+Z2BLtWV5uozpRuyL3eiesEcsCEAI5Mb
         m8miqHDW4NqnqsolloXIKvz+Mg4z3CbUHqjl/GDGiCzRl+TOlO3wpzeJHC4NHsxz+Vir
         hEWcoNlqHycEqJvrTHxdx3Uu5O/SHbv5Nv6Nu/JBRh/h0UTrcSx9rho+ZqlINiOIjp+v
         9jasFU6/JwnB16sVmGD91Dc4aWyjzVSQC0avg+wH3uFrB1Ai2acp0pbaVdEICDCKEKdH
         0TM5p9qgyF2mLLc3Svy9phnpVtwgVR+9TWG4XJCXIMt1Ga7mqXEWC1kQ2c0lxqVRfZUU
         UaKg==
X-Gm-Message-State: AJIora9L5wiDQ/T5YhCdwS1TQBI5U51aEFu4/MGMWQLByQVhlpDDvoMU
        AHTV+DUvAXeq4AgKhLri6XfK3Q==
X-Google-Smtp-Source: AGRyM1tc/J/ECeZYTPp1hWc06zGMIdJAwt8bxeNi6BFWllabpCBNba0Lt2QRG5hj0HKnx9MN0GD8zQ==
X-Received: by 2002:a05:6512:2308:b0:48a:f9d:7389 with SMTP id o8-20020a056512230800b0048a0f9d7389mr3812939lfu.235.1657791510561;
        Thu, 14 Jul 2022 02:38:30 -0700 (PDT)
Received: from [10.0.0.8] (fwa5da9-171.bb.online.no. [88.93.169.171])
        by smtp.gmail.com with ESMTPSA id s2-20020a056512214200b0047960b50c26sm262242lfr.78.2022.07.14.02.38.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 14 Jul 2022 02:38:30 -0700 (PDT)
Message-ID: <bd84ef20-e6e1-74e5-5681-7aa273d5255c@linaro.org>
Date:   Thu, 14 Jul 2022 11:38:27 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v2 7/9] dt-bindings: msm/dp: mark vdda supplies as
 deprecated
Content-Language: en-US
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org,
        Kuogee Hsieh <quic_khsieh@quicinc.com>
References: <20220710084133.30976-1-dmitry.baryshkov@linaro.org>
 <20220710084133.30976-8-dmitry.baryshkov@linaro.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220710084133.30976-8-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 10/07/2022 10:41, Dmitry Baryshkov wrote:
> The commit fa384dd8b9b8 ("drm/msm/dp: delete vdda regulator related
> functions from eDP/DP controller") removed support for VDDA supplies

No such commit exists in next. Do not reference unpublished commits. If
this is your tree, be sure that it is in next.

> from the DP controller driver. These supplies are now handled by the eDP
> or QMP PHYs. Mark these properties as deprecated and drop them from the
> example.

Right now I cannot judge whether this is correct or not. I don't know
what's in that commit, but in general driver implementation changes do
not warrant changes in the binding.

Best regards,
Krzysztof
