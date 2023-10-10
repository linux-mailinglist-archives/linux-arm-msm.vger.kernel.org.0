Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 844A37C447B
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Oct 2023 00:45:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231926AbjJJWpm (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 10 Oct 2023 18:45:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50962 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229887AbjJJWpl (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 10 Oct 2023 18:45:41 -0400
Received: from mail-yb1-xb32.google.com (mail-yb1-xb32.google.com [IPv6:2607:f8b0:4864:20::b32])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C38C098
        for <linux-arm-msm@vger.kernel.org>; Tue, 10 Oct 2023 15:45:36 -0700 (PDT)
Received: by mail-yb1-xb32.google.com with SMTP id 3f1490d57ef6-d9a3d737d66so2162653276.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 10 Oct 2023 15:45:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1696977936; x=1697582736; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=4BcNjIN5yyvXH7jNvnKhk6MkOtMW2fYf7l89Mz36KW0=;
        b=zH9lOrziZ8l5ovPyjy2lQKhNTGfGBJDParcbeqoiDREihMfNAdKKLtfoUMb4bSVDpp
         6AHH1jahGa8Oy1KsHssAR2Fh5lNiWjrd8qXCssSdfTct0oHxPmCS0cAaIOst5FHGA1LK
         4KUFn/whwrsi89vEewQccohsQ7UneoE3mFi5pO5TfURVRx4qga0F5Fr88bf8tS98qy1k
         65C1lSO1MFU0/t6jLiM6h8GDpv0zt1vVSKqks+Y1ZMZIioCjYEK+YDj/9TpBVpw0TZCv
         426MExNewwFfxOyVmFQcvCKXLFB07gQRBf3hqu65CswzVVk2QGx/fzTghAAy/vI/YHEW
         qLAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696977936; x=1697582736;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4BcNjIN5yyvXH7jNvnKhk6MkOtMW2fYf7l89Mz36KW0=;
        b=N315e5q62VX4iJ0jZQvTSb829YxrkBjCgyr+5kMlIHjPKGkP7hfTo7IfeoYjF4ZRRh
         odMTC1/Uxvr5ayOMum3zvyMA5ImmuEoXepTGEa7hb53ynMu+aUpgFbM4X0v+NQOyjULQ
         eJ0Mww8ia4WaQPriEoxCIlB9hBY8+A+cME2tj8+0H2Q8d4roz4MiwYRHkUYDwe167w1G
         LAx+Y/8pySh8/XQc22JLY5ItLyHxENLhTYuDm++bWcCXGEYnWflaMM2pbcnAyL7H/GS6
         hhNdD7AZq31wRwV7MQKx3ZHnTmby7CXY3s7KQ+vxSBlYe2gTVD+AeCHEIs0IbwbbO15s
         j2aQ==
X-Gm-Message-State: AOJu0YzoDzomTkEZXLx67FY0Zsm5vrtZwhKXvSzwT+z4umG7gLLvFG6n
        LT8mXhR1pKzCI1NLfHH1S8ClEpFNXkeds8K5xP3D4A==
X-Google-Smtp-Source: AGHT+IE5kL5P5u+6fKchLXqkW+KwVtqyl81vixb70xS3IzE/CbXHiUtyr2tWiR9tiCfCkSW7qWH2PtCXGy2w4zoVe5s=
X-Received: by 2002:a25:6086:0:b0:d81:41b1:448c with SMTP id
 u128-20020a256086000000b00d8141b1448cmr17195067ybb.43.1696977935928; Tue, 10
 Oct 2023 15:45:35 -0700 (PDT)
MIME-Version: 1.0
References: <20230908-topic-sm8550-upstream-pdcharge-ulog-v1-1-d1b16b02ced2@linaro.org>
In-Reply-To: <20230908-topic-sm8550-upstream-pdcharge-ulog-v1-1-d1b16b02ced2@linaro.org>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date:   Wed, 11 Oct 2023 01:45:24 +0300
Message-ID: <CAA8EJppLD56DCfij=BdeqEiYqaw+9hzN9r5qCKRU8utCdaiRiw@mail.gmail.com>
Subject: Re: [PATCH] soc: qcom: add ADSP PDCharger ULOG driver
To:     Neil Armstrong <neil.armstrong@linaro.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, 8 Sept 2023 at 13:53, Neil Armstrong <neil.armstrong@linaro.org> wrote:
>
> The Qualcomm PMIC PDCharger ULOG driver provides access to logs of
> the ADSP firmware PDCharger module in charge of Battery and Power
> Delivery on modern systems.
>
> Implement trace events as a simple rpmsg driver with an 1s interval
> to retrieve the messages.
>
> The interface allows filtering the messages by subsystem and priority
> level, this could be implemented later on.
>
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Tested-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

> ---
>  drivers/soc/qcom/Kconfig               |  12 +++
>  drivers/soc/qcom/Makefile              |   1 +
>  drivers/soc/qcom/pmic_pdcharger_ulog.c | 166 +++++++++++++++++++++++++++++++++
>  drivers/soc/qcom/pmic_pdcharger_ulog.h |  36 +++++++
>  4 files changed, 215 insertions(+)

-- 
With best wishes
Dmitry
