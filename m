Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 92466789709
	for <lists+linux-arm-msm@lfdr.de>; Sat, 26 Aug 2023 15:57:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229765AbjHZN5X (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 26 Aug 2023 09:57:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41020 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232101AbjHZN45 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 26 Aug 2023 09:56:57 -0400
Received: from mail-yb1-xb2e.google.com (mail-yb1-xb2e.google.com [IPv6:2607:f8b0:4864:20::b2e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 733A82114
        for <linux-arm-msm@vger.kernel.org>; Sat, 26 Aug 2023 06:56:55 -0700 (PDT)
Received: by mail-yb1-xb2e.google.com with SMTP id 3f1490d57ef6-d71c3a32e1aso1747686276.3
        for <linux-arm-msm@vger.kernel.org>; Sat, 26 Aug 2023 06:56:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1693058214; x=1693663014;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=UIk3Ss+Jl+QQzMUaKkMUyViIyvPKScuq86cEEqHGusE=;
        b=pF6IfdIC2LkR3KDGmGGrGxTW1+eUnx4ikbUOn77tIRl0qFZABWvzSIAIqLJjGMIwxN
         BUTpJublL9H0IFm9wgfzF4U52AfgcNtUxJmoZlXOJWiUmPafyUK2tbo67hWCV5hooi0w
         jwBRETfr0m41OiX4/BXQm48GxIiBl/HbnnSXWA8BgfNk5YIm80jQbJRGu7uFwo/RZ8MM
         e4m7Rua64LJUjX5M6y21ENxPbi0P60T99PYACJYcIf9ouKTY/9O+jtEOz5ZAsZGNGK2d
         ebU+Dz5MQU9R2k8RVvFYknOyXL1tI/XRo8IqLrm7DHp79gRwD/u3GuvPD/pZZCfWAUrq
         0P8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693058214; x=1693663014;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UIk3Ss+Jl+QQzMUaKkMUyViIyvPKScuq86cEEqHGusE=;
        b=i8xHMxBxc73NAUidj7+Ah/K0W5EFgKOJhWNRO9InhfTqyo2LFb5mrl0SDhU88qEe0f
         UTmId3R0fA4NUuLhfEs3Sms+WZXoXpuJQwAOFbiGmw47zkn9qA1MbNeqfyJMDdaUsgRO
         Tl3tjlK4FpIkdl6vd87RJKJ23bzvGetixOXFovE1v5bDv+DTJxQSu6lTetOeLaoDGHeR
         RaaUFnx/x8vOQ5qra//CyPIB9LZIbQVSXTXRhwG8S5GoQbQIHHDQvlm2w22LOPb5goh7
         JATItKk9SGj7mGe2SHyhWXQwrdL2BG3xfh3v8tIbj97c6YMItdfT97t0zVdQMEFBNl3O
         sM+g==
X-Gm-Message-State: AOJu0YwG/lTeIaZspQwNNGDy8lkw1w+dMqUXOn12wWKS5FlO86849LoK
        VxJgR5nXFtcIAzO7IPT8QO8LzA71srv18TSEBWLFhw==
X-Google-Smtp-Source: AGHT+IG47fSKGFN3TIP1Ic8FLulbn7bmOtvFuvS8F3UvcPCC212ktImUAKfUM5AqVL2axxJ7JyvAM+CJK5JQB7eErVc=
X-Received: by 2002:a25:c5c6:0:b0:d7a:def7:b96a with SMTP id
 v189-20020a25c5c6000000b00d7adef7b96amr493222ybe.53.1693058214578; Sat, 26
 Aug 2023 06:56:54 -0700 (PDT)
MIME-Version: 1.0
References: <20230825202610.1580132-1-dmitry.baryshkov@linaro.org> <87pm3afjda.fsf@kernel.org>
In-Reply-To: <87pm3afjda.fsf@kernel.org>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date:   Sat, 26 Aug 2023 16:56:43 +0300
Message-ID: <CAA8EJprZvCtCKoV4J=21=2+fDM1gTfJBOThj13J3sE0w5AqpPw@mail.gmail.com>
Subject: Re: [PATCH] wifi: ath10k: Default to board.bin for legacy board data file
To:     Kalle Valo <kvalo@kernel.org>
Cc:     Jeff Johnson <quic_jjohnson@quicinc.com>,
        ath10k@lists.infradead.org, linux-wireless@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Sat, 26 Aug 2023 at 08:44, Kalle Valo <kvalo@kernel.org> wrote:
>
> Dmitry Baryshkov <dmitry.baryshkov@linaro.org> writes:
>
> > Default to 'board.bin' for the legacy board data file, in case the
> > hw_params array doesn't list hw-specific board data file name (e.g. for
> > WCN3990).
> >
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>
> Could you provide more background _why_ this is needed. What are you
> trying to fix?

Sure. For wcn3990 we do not have the
`ath10k_hw_params_list[].fw.board' set. So if the board data is not
present in `board-2.bin', the driver will skip looking into
`board.bin' and will error out.

I had two options: either to set the `.fw.board' in
`ath10k_hw_params_list', or to provide this default. Granted that the
check for `fw.board' also prevents the `board-%s-%s.bin' lookup, I
opted for the second option.

Maybe I should just set the .fw.board to "board.bin" and
.fw.board_size to 26328 (?)

-- 
With best wishes
Dmitry
