Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7E94451B127
	for <lists+linux-arm-msm@lfdr.de>; Wed,  4 May 2022 23:38:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237026AbiEDVl6 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 4 May 2022 17:41:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58200 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234680AbiEDVl5 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 4 May 2022 17:41:57 -0400
Received: from mail-pl1-x635.google.com (mail-pl1-x635.google.com [IPv6:2607:f8b0:4864:20::635])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 12FD81FCC7
        for <linux-arm-msm@vger.kernel.org>; Wed,  4 May 2022 14:38:21 -0700 (PDT)
Received: by mail-pl1-x635.google.com with SMTP id d22so2615927plr.9
        for <linux-arm-msm@vger.kernel.org>; Wed, 04 May 2022 14:38:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=mdl+GxAonGFBDF3U2llopaVHtHA1rpzl+Lz6pPUtmxc=;
        b=k7fPNd4qvYwnCVuuO+NxqbuONaxe40wSbufQtEf27g8rrF1yQ3IMGP2tuZgGvHjOfE
         niyKWs2TyaUG7lKJGm4t4CFjMB5G4Cm0fzjRNJgjCfcImIujygnZjTYP97Fnd/4ZPQ7K
         x7L9DfL2WO3uvVPEn/LHlro/1MMfWze4iWEYI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=mdl+GxAonGFBDF3U2llopaVHtHA1rpzl+Lz6pPUtmxc=;
        b=Ok5ypoNchXVt+1MFZ7XOpggOo9dU8suybZNAwPDCjM5ZHJDnbbsKhdGWMv0WAp6InC
         /MfuyD3VkiqrtVpaIcgG1e6LEclklT1e4Q3jn7G9C7Ek9mML0lml2uGF1aeg7/kfETKE
         yte4oZc2xf8W6HuMFFwQw0mEK8TTQDy34Fdw7HVa5cpJvLemWg3WgAjur9mJXT7hx2XF
         Q9E2Qv9QQFNVPLU2ySiH3cWxBTZGMa2trEREz/v8T1YpIgk1HFH+f3rC0xBtSjVW9qZa
         sShOLoipvPGhAok505TI5Qqe4BhecE2SIED24+VaVPoy1L7bYELqA02o8wXIh+Y63SAS
         FOIQ==
X-Gm-Message-State: AOAM533BeawZBH3a5BblBOV1AFFvfswkE4Se2zz1V2qZEEnKurkM3lT2
        UT0dgpbJRbBwK5u0bnaM86zaAg==
X-Google-Smtp-Source: ABdhPJys2IvRcQmRGZzmkSLut+kvaoO5/bSCZPMtaA9l8ZwCvuoq7aszjmTwTiPIibHssbH1YKJECg==
X-Received: by 2002:a17:902:b107:b0:15d:391c:5a72 with SMTP id q7-20020a170902b10700b0015d391c5a72mr24188487plr.46.1651700300635;
        Wed, 04 May 2022 14:38:20 -0700 (PDT)
Received: from localhost ([2620:15c:202:201:35b6:c77b:be04:3bd5])
        by smtp.gmail.com with UTF8SMTPSA id s22-20020aa78296000000b0050dc76281b5sm9025499pfm.143.2022.05.04.14.38.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 May 2022 14:38:20 -0700 (PDT)
Date:   Wed, 4 May 2022 14:38:19 -0700
From:   Matthias Kaehlcke <mka@chromium.org>
To:     Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>
Cc:     agross@kernel.org, bjorn.andersson@linaro.org, robh+dt@kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, quic_rohkumar@quicinc.com,
        srinivas.kandagatla@linaro.org, dianders@chromium.org,
        swboyd@chromium.org, judyhsiao@chromium.org,
        Venkata Prasad Potturu <quic_potturu@quicinc.com>
Subject: Re: [PATCH v11 07/12] arm64: dts: qcom: sc7280: herobrine: Add
 max98360a codec node
Message-ID: <YnLyS3NgsUEii0RL@google.com>
References: <1651664649-25290-1-git-send-email-quic_srivasam@quicinc.com>
 <1651664649-25290-8-git-send-email-quic_srivasam@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <1651664649-25290-8-git-send-email-quic_srivasam@quicinc.com>
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, May 04, 2022 at 05:14:04PM +0530, Srinivasa Rao Mandadapu wrote:
> Add max98360a codec node for audio use case on all herobrine boards.
> 
> Signed-off-by: Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>
> Co-developed-by: Venkata Prasad Potturu <quic_potturu@quicinc.com>
> Signed-off-by: Venkata Prasad Potturu <quic_potturu@quicinc.com>

Carrying over from v10:

Reviewed-by: Matthias Kaehlcke <mka@chromium.org>
