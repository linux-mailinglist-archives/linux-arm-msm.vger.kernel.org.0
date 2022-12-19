Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 94786650AB6
	for <lists+linux-arm-msm@lfdr.de>; Mon, 19 Dec 2022 12:28:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231297AbiLSL2S (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 19 Dec 2022 06:28:18 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37542 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231841AbiLSL2Q (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 19 Dec 2022 06:28:16 -0500
Received: from mail-yb1-xb35.google.com (mail-yb1-xb35.google.com [IPv6:2607:f8b0:4864:20::b35])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 98786B4A5
        for <linux-arm-msm@vger.kernel.org>; Mon, 19 Dec 2022 03:28:15 -0800 (PST)
Received: by mail-yb1-xb35.google.com with SMTP id e141so9097237ybh.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 19 Dec 2022 03:28:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=VMzRLzpincvsgDVrWJjWjP9c4+ebaH5xlefFAGcNSZA=;
        b=DMVPFm0Qra9ZvdI6GKXI+xlvwdbT5lwLM8UR0YOC5fSQbwHKk7RntvaxLgWFASZUJe
         oT3TvPOVWUVCYvbvqmplYlrGXZfBUDnlyOQ/sD7QXyaYJ2SaDr+a9Ea7GVxpceseaHdF
         t78QI68S8jMNZqs8bs2zDXosG6U4O8hV/YvQFqnBdgesha7r4NqWJ69ZbDDbicDWC0eO
         flxfn+AA6g8koS4YKFWoq3x3PL5+mG+/+Mek1UdKpzt0LlXKBmDzQK+8Zw0hiISX1Wi/
         mVGMxFrBL812p0tNTD/JHf8iUFfWFztY5Bjuo2JOyW1GAowqmvez/cwZMxjE1graAlxZ
         HHwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VMzRLzpincvsgDVrWJjWjP9c4+ebaH5xlefFAGcNSZA=;
        b=BLKdRmH8sbp2Ad12icK66SRV+bCAKzq4UCHhTvvZRNPwe5vG9KGxXVz8JCHQ/Y4arM
         X3gmMpevRqRNCXjs0zQ+iR7YulZxrNhctAETRaeU4/w0COJJol1eDHe7ufEsD9dmeqzK
         OSUzKrG2OPlBFAVid/6UYyZHYfZdAB7jzk/H4MX+FoDn9TIXBfujRH6u7buqx+754Viy
         xk7U+7lYin2Q22UVYrX/xu12iXOWF+6jOi/8xsgTxh/tvzNLFgm/bf9N5IqopxKXt/Jo
         GjY8Ie+Z+/VjXdT2yxMMrIQcrunuLXwMT8rFfYU5ngwbDnOqxWoZycXhFm0GFMu5dIJz
         gFUg==
X-Gm-Message-State: ANoB5pmXWvW9BVY/LVKPwbZMCgWHroudgU9q8LggXqoSZHna6HnvLs+m
        hXcETOxK272lKkR/wgKWnN4VkftupOhOYqJfpMMCmw==
X-Google-Smtp-Source: AA0mqf5rJm4+V2jdIAc5ils+CtzrRHnCeWU83mLN5tiYq2OCzVIN03D3XQasvpS35GJdyTd4AGBBoPofWN2Kt+wpZTk=
X-Received: by 2002:a25:8544:0:b0:723:5b57:cde9 with SMTP id
 f4-20020a258544000000b007235b57cde9mr4351163ybn.194.1671449294770; Mon, 19
 Dec 2022 03:28:14 -0800 (PST)
MIME-Version: 1.0
References: <20221030094258.486428-1-iskren.chernev@gmail.com>
 <20221030094258.486428-6-iskren.chernev@gmail.com> <9e94c0b9-f901-5ac9-2abb-40e958cbe5a2@linaro.org>
 <3134ba66-27bb-7015-8988-6c8dec046b0f@linaro.org> <CAL7jhid=inAk85h9tHOD6rjFc-aNufvZPQw3ALfsrqTm6oHCag@mail.gmail.com>
In-Reply-To: <CAL7jhid=inAk85h9tHOD6rjFc-aNufvZPQw3ALfsrqTm6oHCag@mail.gmail.com>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date:   Mon, 19 Dec 2022 13:28:03 +0200
Message-ID: <CAA8EJpop-xO3TJgxHQ7PRCEi55tQNEM58vbOsKwjC_vQRCHtqA@mail.gmail.com>
Subject: Re: [PATCH v5 5/8] iommu/arm-smmu-qcom: Add SM6115 support
To:     Iskren Chernev <iskren.chernev@gmail.com>
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Rob Herring <robh+dt@kernel.org>, phone-devel@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        Adam Skladowski <a39.skl@gmail.com>,
        Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        Joerg Roedel <joro@8bytes.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Sai Prakash Ranjan <quic_saipraka@quicinc.com>,
        Emma Anholt <emma@anholt.net>,
        Rob Clark <robdclark@chromium.org>,
        linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On Mon, 19 Dec 2022 at 12:01, Iskren Chernev <iskren.chernev@gmail.com> wrote:
>
> > So, hopefully you can skip this patch completely by depending on the
> > generic "qcom,smmu-500" compatible.
>
> To be clear -- I still need the qcom,SOC-smmu-500 compatible in DT and
> bindings, but not in the driver (i.e driver will pick generic)?
>
> Then this can indeed be dropped (but it is merged in linux-next ATM,
> 6.2-rc1 based next won't have it, I guess?).

The thread got bumped in my email client, so I replied with my review
as if these patches were brand new. However I failed to notice that
the patches were already accepted by Will Deacon. And that my rework
happened already on top of your patches. So, you don't have to do
anything, the IOMMU part will be a part of 6.3. Please excuse me for
the noise.

-- 
With best wishes
Dmitry
