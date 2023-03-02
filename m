Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 430446A86F6
	for <lists+linux-arm-msm@lfdr.de>; Thu,  2 Mar 2023 17:40:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229835AbjCBQkX (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 2 Mar 2023 11:40:23 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46310 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229787AbjCBQkV (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 2 Mar 2023 11:40:21 -0500
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com [IPv6:2a00:1450:4864:20::134])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AA1AD15161
        for <linux-arm-msm@vger.kernel.org>; Thu,  2 Mar 2023 08:40:06 -0800 (PST)
Received: by mail-lf1-x134.google.com with SMTP id s22so12101lfi.9
        for <linux-arm-msm@vger.kernel.org>; Thu, 02 Mar 2023 08:40:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=clemDdlw5AVVfbBMfMMVk1mB/n91ZZIxJxGYFhtaE10=;
        b=ZcWzd2VISv7VbjUNUOKAd/ScIHUIlD+kat046CfvIzTRNnRvWidoivUQJBI3P2pjEZ
         CX+7iV9lc2HS9oMSqLt+RlZy/vON+VOJlP80aYDi62yiZnqnbfZU+sV082TlH2Ke1dGT
         gWITtMMdjJOOHllC5SmBmxo5X6qF8xdJBoyLTyNAjEgb9ABPnWCtZ7CRyNwI1sQOEEOj
         LDAE8Jgl0CkqG7rSUE7WHa2tiPGyLmMyer7I6eu4DqcYHosmuUrkbXuHOj8+8O9st8O6
         qmzZrGuZ3/VKs4dkrfb1X+PZWK8sqxeb8v9+xmFTTQdnevZt4L6a8bcyHWWtoB7MgbmC
         KWnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=clemDdlw5AVVfbBMfMMVk1mB/n91ZZIxJxGYFhtaE10=;
        b=y0nxXtIs5EJZRCEJiO0N0nQ/lCzhI1eYAHOv9ZXmiaT+S8G4leAB1pov+QfZTuS4Ij
         cruEYwDaifmzJrhGy9fkensG/8sILc5ZKCj8CMcxRX4Xz1IAP0Ce+P7xxxI6UU1uGGno
         1U8gTgJ+ld32hHsdnS7Vn0EjtLUscK+7NP2qjGNECr1ch2ogHZp3KgolExM8fURd6H0t
         pVAg4wTzczsLLoBKLpzTGL3WAHQwSeHGod9I3BLJcsxPrzdYO2BPuumzF44rn2+pGqa0
         Gk4fsiIlfOkUJzEU5PXMYSx0IiO6cQk3F8ABvRBzCZtnWMLK3USsfLtO9KgGxdw+vqIu
         TErw==
X-Gm-Message-State: AO0yUKUtnhonnWGP3D0Z3Uv05IWUdUivwivrx5jT80AF9bYWng5yFYAW
        I+8YNpEjZUDyalRs/E2hbys0Xw==
X-Google-Smtp-Source: AK7set8kh2kDzBB4CHJkTz1iDmV3/IKPUx0riwaparu6P77949nYB2XB727Wg3k9aIn+VVypxEti2Q==
X-Received: by 2002:ac2:5d41:0:b0:4de:ca63:b2d2 with SMTP id w1-20020ac25d41000000b004deca63b2d2mr2956571lfd.26.1677775204510;
        Thu, 02 Mar 2023 08:40:04 -0800 (PST)
Received: from ?IPV6:2001:14ba:a085:4d00::8a5? (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
        by smtp.gmail.com with ESMTPSA id e19-20020ac25473000000b0048a9e899693sm2211229lfn.16.2023.03.02.08.40.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 02 Mar 2023 08:40:04 -0800 (PST)
Message-ID: <7de00f26-cc93-b549-f66e-8d1f8867f8b7@linaro.org>
Date:   Thu, 2 Mar 2023 18:40:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v14 14/14] drm/msm/dp: set self refresh aware based on PSR
 support
Content-Language: en-GB
To:     Vinod Polimera <quic_vpolimer@quicinc.com>,
        dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org, robdclark@gmail.com,
        dianders@chromium.org, swboyd@chromium.org,
        quic_kalyant@quicinc.com, quic_khsieh@quicinc.com,
        quic_vproddut@quicinc.com, quic_bjorande@quicinc.com,
        quic_abhinavk@quicinc.com, quic_sbillaka@quicinc.com
References: <1677774797-31063-1-git-send-email-quic_vpolimer@quicinc.com>
 <1677774797-31063-15-git-send-email-quic_vpolimer@quicinc.com>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <1677774797-31063-15-git-send-email-quic_vpolimer@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 02/03/2023 18:33, Vinod Polimera wrote:
> For the PSR to kick in, self_refresh_aware has to be set.
> Initialize it based on the PSR support for the eDP interface.
> 
> Signed-off-by: Vinod Polimera <quic_vpolimer@quicinc.com>

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

