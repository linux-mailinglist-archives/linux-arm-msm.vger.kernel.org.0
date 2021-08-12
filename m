Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 684B53EAAC3
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Aug 2021 21:18:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233841AbhHLTSU (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 12 Aug 2021 15:18:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58976 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233815AbhHLTSU (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 12 Aug 2021 15:18:20 -0400
Received: from mail-ot1-x331.google.com (mail-ot1-x331.google.com [IPv6:2607:f8b0:4864:20::331])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CD0A2C0617A8
        for <linux-arm-msm@vger.kernel.org>; Thu, 12 Aug 2021 12:17:54 -0700 (PDT)
Received: by mail-ot1-x331.google.com with SMTP id v10-20020a9d604a0000b02904fa9613b53dso9043981otj.6
        for <linux-arm-msm@vger.kernel.org>; Thu, 12 Aug 2021 12:17:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:in-reply-to:references:from:user-agent:date:message-id
         :subject:to:cc;
        bh=7DbLdoUAaFnIsQKmKDDdlixglOjRuszy7DKz4bqQLFA=;
        b=iqza9qjjnlSQEH7jwgyG9KwVYbOUbFRCyyDnvUG1yswx+qBGP3/f7KNtptHOxGwhaA
         e1gSQr2fARcgyJsQq3RlV5yrUyzSMIV2CuWqj/uWY4j26BD9ldueVGnjDq/W141Fmw6V
         Y1+wSH6A/+ojV+GBQcO8+xFH8Myequ3xNb6tk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:in-reply-to:references:from
         :user-agent:date:message-id:subject:to:cc;
        bh=7DbLdoUAaFnIsQKmKDDdlixglOjRuszy7DKz4bqQLFA=;
        b=ViPvNxprMkNzYqwEDrKQnU8bAe471s7OASVr/6bMdl+tTQUG+2M3j2+xpyGam/lMX3
         WD4QuaUueXF+irRSokAQUjpv6fY2U/fUuHMWMtpV3kwvoZAMIJvG60Fo5GSI+7iO9oVz
         KGJBgn3dru7R6KR2JL2UeswVgLG8jVQMx4PdxA/7THsGOwDxRMWPwLBTvWRCLxrUR/wi
         emrTuzG5v30YJoT8bav9chrrSJvB1tgj7bINhZEZ10v+lSU5u+3vMvEMPnhWgJ68pEqx
         DqWRmdKZE5ZlLs+FjO0CmThXEk2BX+pmfgsZ28rvpGCZB6748WBZ2O0XR27kYBJQuIgZ
         4khA==
X-Gm-Message-State: AOAM532CLVWlvJ4eMQ6P8FybX/zmENynuEZ8u+0fR6bDQecSbSY9xQfM
        HypYLxWJqpILK4ELfBR5jbPbdvtM/6O51RIRzK1mMw==
X-Google-Smtp-Source: ABdhPJwdbKklK//MeeQtv9Y/FXNV3D6EMel7MMkG4iMkdM5sMbvnJjVElpjx2Wz02v8xW8pchf/gAT2e7X7dlCOGTE0=
X-Received: by 2002:a9d:69cd:: with SMTP id v13mr4666323oto.34.1628795874183;
 Thu, 12 Aug 2021 12:17:54 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 12 Aug 2021 12:17:53 -0700
MIME-Version: 1.0
In-Reply-To: <1628588875-23790-3-git-send-email-dikshita@codeaurora.org>
References: <1628588875-23790-1-git-send-email-dikshita@codeaurora.org> <1628588875-23790-3-git-send-email-dikshita@codeaurora.org>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.9.1
Date:   Thu, 12 Aug 2021 12:17:53 -0700
Message-ID: <CAE-0n51XhZ=hzzbdPY8_baAZ0LCDjk-EMbbWCd75AgG9vfQ99w@mail.gmail.com>
Subject: Re: [PATCH v4 2/7] media: venus: core: Add sc7280 DT compatible and
 resource data
To:     Dikshita Agarwal <dikshita@codeaurora.org>,
        linux-media@vger.kernel.org, stanimir.varbanov@linaro.org
Cc:     linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        vgarodia@codeaurora.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Dikshita Agarwal (2021-08-10 02:47:50)
> Adds a sm7280 compatible binding to the venus core.
>
> Co-developed-by: Mansur Alisha Shaik <mansur@codeaurora.org>

This needs a signed-off-by tag from Mansur as well.

> Signed-off-by: Dikshita Agarwal <dikshita@codeaurora.org>
> ---
>  drivers/media/platform/qcom/venus/core.c | 52 ++++++++++++++++++++++++++++++++
>  1 file changed, 52 insertions(+)
>
> diff --git a/drivers/media/platform/qcom/venus/core.c b/drivers/media/platform/qcom/venus/core.c
> index 91b1584..68acfc0 100644
> --- a/drivers/media/platform/qcom/venus/core.c
> +++ b/drivers/media/platform/qcom/venus/core.c
> @@ -743,6 +794,7 @@ static const struct of_device_id venus_dt_match[] = {
>         { .compatible = "qcom,sdm845-venus-v2", .data = &sdm845_res_v2, },
>         { .compatible = "qcom,sc7180-venus", .data = &sc7180_res, },
>         { .compatible = "qcom,sm8250-venus", .data = &sm8250_res, },
> +       { .compatible = "qcom,sc7280-venus", .data = &sc7280_res, },

Please sort this alphabetically on compatible string, it helps avoid
merge conflicts.

>         { }
>  };
>  MODULE_DEVICE_TABLE(of, venus_dt_match);
