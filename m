Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D38D46DDA81
	for <lists+linux-arm-msm@lfdr.de>; Tue, 11 Apr 2023 14:14:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229566AbjDKMOH (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 11 Apr 2023 08:14:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33412 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229805AbjDKMOG (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 11 Apr 2023 08:14:06 -0400
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com [IPv6:2a00:1450:4864:20::431])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3C0543581
        for <linux-arm-msm@vger.kernel.org>; Tue, 11 Apr 2023 05:14:04 -0700 (PDT)
Received: by mail-wr1-x431.google.com with SMTP id o18so7335565wro.12
        for <linux-arm-msm@vger.kernel.org>; Tue, 11 Apr 2023 05:14:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1681215243;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=hDe+eb+N5aBaVFbkdNkw9NWxh4mc4+HNanKKfElqBq8=;
        b=tAitHUirqTyd5v+Rab3tuHuLDcYaJ+SPtz0IShVP2Mecm4fWamzwo+pCajJR6gedVF
         pOwvGSMpkW66mT91DoCUmhKhwamkGneoiI+L8UUNhUfezOU0hZP0mbeuTlNOwT6hE3fR
         7wVn8qm5bnmZcsvJGIiLlNqgo0P3VaBYxx4OfF3yuFOUfMsz2uktMVHKFbDvmaoKkZu3
         15xMbqgMskKE4D0dB9BNSB2ZTWay3GImCl+0+efMgvudvBKz8/G92xdP1MfEamJbtDR0
         bWlP7GUIFogsXfc+jn6F7UezSbNPOZbv9OSM+nRno80CBAJDuP7AjvZgx7Ezd7vhaibH
         uwww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1681215243;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hDe+eb+N5aBaVFbkdNkw9NWxh4mc4+HNanKKfElqBq8=;
        b=ncD8c6lK0DyCg+UB3wQzJOu8Trg/vUts8c1pj497kzGoUz2TVBIgm/GbcZMHn07zgd
         u2DSsHziibUvBAbJlkkum9rGXlnRJP200tP2r4dDKGBOzInRse8x7Ua39ADWO/c1GKiK
         v1RpFXCA5oE7fKZRUv6A6EFSSEWYeO2AGEU3dwpDbRGOfibW+NgkOw0BYh2xhTlJieej
         M/m30phXaXNscr8OB2LMkwfOyg2vvOGIOjTTpcUR/SDpGGA01/6xCOeRApkEQe8UXb1R
         XvvXzdEfkRKOWApFJPRc43nEKtgvSbuueFaeg9SGQXMwREHPcQDf0CumP/EezUqKGeIh
         jJUQ==
X-Gm-Message-State: AAQBX9ez2Nkdfqn07D4uQBaG35a6mwrM9ZUUsn3NChtcnd6a+tQwzJI7
        1kd782F9X3ghNHr6VAVFpxT/zFKDBDd7sQ5F4CHGHPGb1Tq8xpPY
X-Google-Smtp-Source: AKy350aoFqvQaw/fPa9eUfklfZbl45HNWUhXjVdKPcKXHY6k5z/tDP93YK99N2m4Qr0jy9kI2wFhGlCcJPWlKkXEUqM=
X-Received: by 2002:adf:fe41:0:b0:2f0:2dbd:eb1c with SMTP id
 m1-20020adffe41000000b002f02dbdeb1cmr1233748wrs.4.1681215242599; Tue, 11 Apr
 2023 05:14:02 -0700 (PDT)
MIME-Version: 1.0
References: <20230411072840.2751813-1-bhupesh.sharma@linaro.org>
 <20230411072840.2751813-4-bhupesh.sharma@linaro.org> <ff5691b4-df1a-57a8-6e96-f997bbe340f4@linaro.org>
In-Reply-To: <ff5691b4-df1a-57a8-6e96-f997bbe340f4@linaro.org>
From:   Bhupesh Sharma <bhupesh.sharma@linaro.org>
Date:   Tue, 11 Apr 2023 17:43:51 +0530
Message-ID: <CAH=2Ntytn2GnBJkiZ4+xBf1X-fUUTD4iHWv-Sv66Jp1ePUDV3A@mail.gmail.com>
Subject: Re: [PATCH v3 3/3] arm64: dts: qcom: qrb4210-rb2: Increase load on
 l22 and l24 for uSD and eMMC
To:     Konrad Dybcio <konrad.dybcio@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        agross@kernel.org, andersson@kernel.org,
        linux-kernel@vger.kernel.org, bhupesh.linux@gmail.com,
        robh+dt@kernel.org, krzysztof.kozlowski@linaro.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, 11 Apr 2023 at 17:28, Konrad Dybcio <konrad.dybcio@linaro.org> wrote:
>
>
>
> On 11.04.2023 09:28, Bhupesh Sharma wrote:
> > Increase the l22 and l24 load used for uSD and eMMC VMMC.
> > These need to be increased in order to prevent any voltage drop
> > issues due to limited current happening during specific operations
> > (e.g. write).
> >
> > Signed-off-by: Bhupesh Sharma <bhupesh.sharma@linaro.org>
> > ---
> You could have simply squashed this into the patch where
> you enabled the controllers, so that that commit works
> reliably for e.g. bisect

Yes, but Bjorn asked me to send this separately (via irc).
I am fine with squashing this with the previous patch [PATCH 2/3] as
well, if Bjorn is OK with it.

Thanks,
Bhupesh
