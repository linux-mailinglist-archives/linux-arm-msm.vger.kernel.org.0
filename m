Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BD9AE6DB0AA
	for <lists+linux-arm-msm@lfdr.de>; Fri,  7 Apr 2023 18:34:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229643AbjDGQeN (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 7 Apr 2023 12:34:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44946 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229454AbjDGQeM (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 7 Apr 2023 12:34:12 -0400
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com [IPv6:2a00:1450:4864:20::132])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B121119AF
        for <linux-arm-msm@vger.kernel.org>; Fri,  7 Apr 2023 09:34:05 -0700 (PDT)
Received: by mail-lf1-x132.google.com with SMTP id br6so55073658lfb.11
        for <linux-arm-msm@vger.kernel.org>; Fri, 07 Apr 2023 09:34:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1680885244;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ns5LOSHu/7rt5El0gaG0VOdBa6A5/wehdLEQPfWFNHE=;
        b=mreYxKmu7Qa1bKhb0dlbcqmjd5mvNHJiWaY50cJ10nht3hVDars6QEXLXzT6VTsJe+
         NvVwJDMppTlB2XpvB3ZxqP5pz6ETnaX/4XvIuNlnmI7VIFE9TKZSaXfgvE8Boh/0JiJV
         l62T2IEjQpJY8EQyoJ9qObQzFizN+JABL6NRYPN9YrjyusUlbFxAM1AxidabgyB5SstI
         kffiZ90QekZb5gtEvxxh8fPCzr9aTMafRzNCiXFSosns5x10+pkllVVlliRuvMdyMuu0
         YmCVSUyZEdB7pRWpLR+7IqAJtFlhckngThMwZufS0LjouQti3UMOzbmhIMtbVDha0oTH
         YX4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680885244;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ns5LOSHu/7rt5El0gaG0VOdBa6A5/wehdLEQPfWFNHE=;
        b=Euv80iBtx/m/qW/E2/8t0cge6oNaKupF/KsUt7gpMO8hESBZCUVlQhCvFbsc+RA7mT
         u12W+GIjL7Zz5q68wQo+tP5n13qudgUwgfZPMwztTV9Vogjpa/4/DN7J9ZZF01/gHwjO
         GXafH4cLKqYfcaeh7WW4YwGk9oGvF185LMvrif9QJyj2SVolBRyZ9JfwyeA0HXkCCkw0
         M1Um/rtwtRqVh54Y2//TnLlsY/1YvHxqLY15XvcEPT/8I5ufbzRkeA2a2abZaT3EjQYu
         PBsDdUh28TOYKM22Rkjdac8FOptD0C0l2po94YrfbyHjPMCK6ZVJOHvgWd/dip0FP4It
         U19Q==
X-Gm-Message-State: AAQBX9fyJeWcLYWiReBTIrnOIjNLdDqICqyvgBf/DNuSx2PX7xeXOe6V
        Cdk5EMEBYYPK5VoVo+L1LFdMBQ==
X-Google-Smtp-Source: AKy350YiJHTNXXb7fD+W+VfSVc1OojuyNSt8JSxB25sutoPPaP/XveG/bQwJt4kq/eupW1E01yk3yw==
X-Received: by 2002:ac2:5f0f:0:b0:4eb:13ff:6ca7 with SMTP id 15-20020ac25f0f000000b004eb13ff6ca7mr791005lfq.16.1680885243956;
        Fri, 07 Apr 2023 09:34:03 -0700 (PDT)
Received: from ?IPV6:2001:14ba:a085:4d00::8a5? (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
        by smtp.gmail.com with ESMTPSA id o23-20020a2e90d7000000b002934fe524d2sm894103ljg.83.2023.04.07.09.34.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 07 Apr 2023 09:34:03 -0700 (PDT)
Message-ID: <7745f5c7-9dd0-3010-ae21-b269e059620f@linaro.org>
Date:   Fri, 7 Apr 2023 19:34:03 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH v8 09/10] arm64: dts: qcom: sc7180: Add support for HDCP
 in dp-controller
Content-Language: en-GB
To:     Mark Yacoub <markyacoub@chromium.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     seanpaul@chromium.org, suraj.kandpal@intel.com,
        dianders@chromium.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20230331221213.1691997-1-markyacoub@google.com>
 <20230331221213.1691997-10-markyacoub@google.com>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20230331221213.1691997-10-markyacoub@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 01/04/2023 01:12, Mark Yacoub wrote:
> From: Sean Paul <seanpaul@chromium.org>
> 
> Add the register ranges required for HDCP key injection and
> HDCP TrustZone interaction as described in the dt-bindings for the
> sc7180 dp controller.
> 
> Reviewed-by: Douglas Anderson <dianders@chromium.org>
> Signed-off-by: Sean Paul <seanpaul@chromium.org>
> Signed-off-by: Mark Yacoub <markyacoub@chromium.org>
> 
> ---
> Changes in v3:
> -Split off into a new patch containing just the dts change (Stephen)
> -Add hdcp compatible string (Stephen)
> Changes in v4:
> -Rebase on Bjorn's multi-dp patchset
> Changes in v5:
> -Put the tz register offsets in trogdor dtsi (Rob C)
> Changes in v6:
> -Rebased: Removed modifications in sc7180.dtsi as it's already upstream
> Changes in v7:
> -Change registers offset
> Changes in v8:
> -None
> 
>   arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi | 8 ++++++++
>   1 file changed, 8 insertions(+)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

