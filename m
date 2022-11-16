Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EE3B362C577
	for <lists+linux-arm-msm@lfdr.de>; Wed, 16 Nov 2022 17:53:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233556AbiKPQxo (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 16 Nov 2022 11:53:44 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36986 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233706AbiKPQxY (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 16 Nov 2022 11:53:24 -0500
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com [IPv6:2a00:1450:4864:20::52b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 886E85E9D1
        for <linux-arm-msm@vger.kernel.org>; Wed, 16 Nov 2022 08:51:45 -0800 (PST)
Received: by mail-ed1-x52b.google.com with SMTP id e13so18501620edj.7
        for <linux-arm-msm@vger.kernel.org>; Wed, 16 Nov 2022 08:51:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=NvbONARSsIDwCwSEYkMMo3k5hneuUpgwVcRn4D9nR5g=;
        b=ciFME/0QGrxCsZv8RfK4lRHAp9GK4NlACjARkh4aKKI1x0jFQaIdqYgQ6/x20tKuul
         3NHLAuroG6YC3hCdeWpMMIcts9K7avaIFFv8x/nCfHkGnnLsCJ2LP/69YQJTqSMPOwLV
         bf13ujJuuX4J2w9Gw7MzG+DziM5T5Jr2z0eEs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NvbONARSsIDwCwSEYkMMo3k5hneuUpgwVcRn4D9nR5g=;
        b=krfKK7iHZ479W4sNSvH5wFfK2hCDEaS50kr0BnHlayV/D1KAURTCXNrO5oe4fcbC/A
         WR0CozTSORGiIoJWKhTv2gPNXUQh/6pId0bCKKpoAjKIFqnHnsZdFibEetTFfqwMuI+R
         ORhoJWHYlZ2SN3/0GHGHsxgMbbGv/JeRJDbPvGveBtDArYsjbKEmKAXDrP5wmqPeKj7n
         LFUdggUkV+BapjKNhxFZS5UU8HB40qJi96Qgt51N8ftrkpQv6ghuB69hIy42J0wuI1Iw
         LdzpJ9SeYzXH5neohUqcVPeBfaYs7yHKkwyl2Em+MvPAX68U35zBsLHrKIDTDDZgtGKm
         n+Ig==
X-Gm-Message-State: ANoB5plnwEtfP2llAhyieAf0+RYnowvqWoavx8aF5LllN40wLmTS9fNg
        7x6SG9bFKD3k2lNeJRZfSb/H3lgkD6fx1w==
X-Google-Smtp-Source: AA0mqf5rLtTbl5/Q4n4pi6yI9HOUhNqoOKd21hY5cNMXCj8YEgalv2NW4LhyHsOF/KTsAt4O34UMpQ==
X-Received: by 2002:aa7:d484:0:b0:461:a4eb:6753 with SMTP id b4-20020aa7d484000000b00461a4eb6753mr20307767edr.309.1668617504191;
        Wed, 16 Nov 2022 08:51:44 -0800 (PST)
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com. [209.85.128.43])
        by smtp.gmail.com with ESMTPSA id lw20-20020a170906bcd400b007ad69e9d34dsm7127091ejb.54.2022.11.16.08.51.41
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 16 Nov 2022 08:51:42 -0800 (PST)
Received: by mail-wm1-f43.google.com with SMTP id i186-20020a1c3bc3000000b003cfe29a5733so2062099wma.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 16 Nov 2022 08:51:41 -0800 (PST)
X-Received: by 2002:a05:600c:4148:b0:3cf:7716:8954 with SMTP id
 h8-20020a05600c414800b003cf77168954mr2774825wmm.57.1668617501480; Wed, 16 Nov
 2022 08:51:41 -0800 (PST)
MIME-Version: 1.0
References: <1668591184-21099-1-git-send-email-quic_srivasam@quicinc.com>
In-Reply-To: <1668591184-21099-1-git-send-email-quic_srivasam@quicinc.com>
From:   Doug Anderson <dianders@chromium.org>
Date:   Wed, 16 Nov 2022 08:51:29 -0800
X-Gmail-Original-Message-ID: <CAD=FV=Uzky4uxs+qwSH9d7MBBWbXe8sMdvB_-Lqkq+6jbTCciQ@mail.gmail.com>
Message-ID: <CAD=FV=Uzky4uxs+qwSH9d7MBBWbXe8sMdvB_-Lqkq+6jbTCciQ@mail.gmail.com>
Subject: Re: [PATCH v2] arm64: dts: qcom: sc7280: Remove unused sleep pin
 control nodes
To:     Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>
Cc:     vkoul@kernel.org, agross@kernel.org, andersson@kernel.org,
        robh+dt@kernel.org, broonie@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        quic_rohkumar@quicinc.com, srinivas.kandagatla@linaro.org,
        swboyd@chromium.org, judyhsiao@chromium.org,
        alsa-devel@alsa-project.org, quic_rjendra@quicinc.com,
        konrad.dybcio@somainline.org, mka@chromium.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On Wed, Nov 16, 2022 at 1:33 AM Srinivasa Rao Mandadapu
<quic_srivasam@quicinc.com> wrote:
>
> Remove unused and redundant sleep pin control entries as they are
> not referenced anywhere in sc7280 based platform's device tree variants.
>
> Signed-off-by: Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>
> ---
> Chnges Since v1:
>     -- Update subject prefixes and commit message.
>
>  .../qcom/sc7280-herobrine-audio-rt5682-3mic.dtsi   |  8 -----
>  .../dts/qcom/sc7280-herobrine-audio-wcd9385.dtsi   | 20 -----------
>  arch/arm64/boot/dts/qcom/sc7280-idp.dtsi           | 20 -----------
>  arch/arm64/boot/dts/qcom/sc7280.dtsi               | 40 ----------------------
>  4 files changed, 88 deletions(-)

Reported-by: Douglas Anderson <dianders@chromium.org>
Reviewed-by: Douglas Anderson <dianders@chromium.org>
