Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BE022523F3E
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 May 2022 23:09:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245373AbiEKVJI (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 11 May 2022 17:09:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35796 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1347093AbiEKVJF (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 11 May 2022 17:09:05 -0400
Received: from mail-oa1-x2b.google.com (mail-oa1-x2b.google.com [IPv6:2001:4860:4864:20::2b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 40718994FA
        for <linux-arm-msm@vger.kernel.org>; Wed, 11 May 2022 14:09:04 -0700 (PDT)
Received: by mail-oa1-x2b.google.com with SMTP id 586e51a60fabf-d6e29fb3d7so4352512fac.7
        for <linux-arm-msm@vger.kernel.org>; Wed, 11 May 2022 14:09:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:in-reply-to:references:from:user-agent:date:message-id
         :subject:to:cc;
        bh=lqtfubk7Hrb8lJoDJxWOzLc9PztEt6fZQ5kqLQlhvTc=;
        b=Fc3o3I0BqRikt2fk7xWUgF3TEVAR9OaGDwb4PmdfhORz4xdbDFQJsm3VuypKTYAkAj
         jHOZWlDdAkP7CR3rcvofleydnY5KLXwl0gXJrc9AKXmwhOuTkExrmw7DkKkcu68REeCH
         FHiD5Wleh8agi6wB/KtEChKlavAq9O3dkSI+k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:in-reply-to:references:from
         :user-agent:date:message-id:subject:to:cc;
        bh=lqtfubk7Hrb8lJoDJxWOzLc9PztEt6fZQ5kqLQlhvTc=;
        b=h/rsgoRYxrHC8xPyTHPEKf8ImfhR9W8lb6ZmIjdA4yVj7rRsjMHx3ftimREi5IoxGi
         O37/q8DNbQnatHLpgG8mRJdFpC7DBeyhV5ipJgLWFNIlTfeXovgVvDQc5VrioxRKMoCZ
         7IwpuQADhvwtZgviTgQZsjSy5FxqiCdYZstvnA/AiwKGzpZ5+r1eSy5I6WsiEXKtDyxl
         lUKSTTDDxxbhef7RsR/iHDqaFOEHDIG0IGSwLap5FAU9FIUH6hWcHS4gQClrauJMtnb8
         RJ5+ZJa2Pk8B8Zlt7fef3/T7I73qzxUYjn78YJna1DGytYUHHNq5nowWRwBgWh8zT2LV
         djhw==
X-Gm-Message-State: AOAM533EBNVtvMej3EcgAsGo5Zc4mDvISIu3HwoUH3ERLqOw2kFwuJRj
        wJajtz+3lBSszFOkv+S0pyMYlz4fLm7vDS9AftiKgQWj5VI=
X-Google-Smtp-Source: ABdhPJyzY8NSTk+TBHA5a8x5foiT//cEfAWwheh/EgZpFZ1OOo9rp37wqpfDkPaRzjkj0P2RYr8cHHSXjp64G0nucaE=
X-Received: by 2002:a05:6870:558e:b0:e1:db7c:26aa with SMTP id
 n14-20020a056870558e00b000e1db7c26aamr3845551oao.63.1652303343312; Wed, 11
 May 2022 14:09:03 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 11 May 2022 14:09:02 -0700
MIME-Version: 1.0
In-Reply-To: <1652257162-23874-2-git-send-email-quic_sibis@quicinc.com>
References: <1652257162-23874-1-git-send-email-quic_sibis@quicinc.com> <1652257162-23874-2-git-send-email-quic_sibis@quicinc.com>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date:   Wed, 11 May 2022 14:09:02 -0700
Message-ID: <CAE-0n51gQ=-LH5rAzib8jQbGmNFwdhburbXQ+i+LE7gGWHE_-g@mail.gmail.com>
Subject: Re: [PATCH v3 1/2] arm64: dts: qcom: sc7280: Add proxy interconnect
 requirements for modem
To:     Sibi Sankar <quic_sibis@quicinc.com>, bjorn.andersson@linaro.org,
        robh+dt@kernel.org
Cc:     ohad@wizery.com, agross@kernel.org, mathieu.poirier@linaro.org,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        mka@chromium.org, krzysztof.kozlowski+dt@linaro.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Sibi Sankar (2022-05-11 01:19:21)
> Add interconnects that are required to be proxy voted upon during modem
> bootup on SC7280 SoCs.
>
> Reviewed-by: Matthias Kaehlcke <mka@chromium.org>
> Signed-off-by: Sibi Sankar <quic_sibis@quicinc.com>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
