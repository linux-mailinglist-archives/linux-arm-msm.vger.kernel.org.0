Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BB55F70831D
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 May 2023 15:47:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230393AbjERNrR (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 18 May 2023 09:47:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33240 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230308AbjERNqq (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 18 May 2023 09:46:46 -0400
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com [IPv6:2a00:1450:4864:20::32f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AA256E4F
        for <linux-arm-msm@vger.kernel.org>; Thu, 18 May 2023 06:46:44 -0700 (PDT)
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-3f41dceb9d1so20205315e9.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 18 May 2023 06:46:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1684417603; x=1687009603;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=n37kZ9OaSB2I1L9nZa5F9grWcO9GO9dx9m8E0RZj7ew=;
        b=rNt5bxcuBOipXy+gj9lj5he9BVeqcZDNLnR6RtNY2GSXk3UtdkW+T7MJJ9wqaAvx3G
         neACjsomII8ntdG81HZnQlevqETbR3yNN9OSYKrWkaLJ8ZPjRJiQI+JGEzXUjZo8W2K6
         elyZxK+hpLpt0FVRlQoNNs8lU9aaqwt1U6bWL1p8NmK2kvR66KFrUzY3pLmvngRQurCV
         1Dj740gakwCCd4d0Yqeb+jB/0cnHQk0aOJl++S66fVN+z2JhWsGeE5irsWNCgD68ALGt
         JdRdVX84KHxqf/QXqZhkW3f+1VW7lIMxuU5k2vaL1RCmEPcNQKh/QSErDySlmcxbsJA/
         SVlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684417603; x=1687009603;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=n37kZ9OaSB2I1L9nZa5F9grWcO9GO9dx9m8E0RZj7ew=;
        b=TBzbEjmaIIdfCtH1hnSuheBwFD1PURhKOgmM4lWRGrUNOZ/szMU6LnONOVkZNuD0R3
         FwnW8L+rcYUPyVsMFkjTr3PKe8EXKYOQ9nSQfFtPAz1UlRwVFk/V4mMaU3Joc76e1lUS
         OlX/gabTMa2C82A6W8UcMF9CAZ05kSN2N+kmzwXVD0cFaZ7iX0oiLkSsSODxt8mgZUq2
         Lp2kac+bwY0HvP6EKZq9f4OaQQiIHKUX/qy+rErO7WTOPY+4A3EHeqsyfX5JBHIXqKoU
         blyO745tkZyU6b2pghZhXB5uzGR/eHPzNMCB4iJd54ywmCR6YTEAzcBe8FPZ0F3axMCX
         azSA==
X-Gm-Message-State: AC+VfDz8tndFoQHFd8dA47qvvJrEG/awPyFlYN9LEhWK4G817KUv0u3J
        UvsQkqaaHuDmxj5tk0hcoLyL9dtCqb4qABFt9gTnyg==
X-Google-Smtp-Source: ACHHUZ4sg6CWtPLHXtpPccBwHuiBIUQk33g30SZ0fhjsgYp0KOauavRqRHfQsI71hiJkt9HYbOC8XxoBaQ7OD+0SV5s=
X-Received: by 2002:a7b:c852:0:b0:3f1:979f:a733 with SMTP id
 c18-20020a7bc852000000b003f1979fa733mr1740091wml.31.1684417603085; Thu, 18
 May 2023 06:46:43 -0700 (PDT)
MIME-Version: 1.0
References: <1684413670-12901-1-git-send-email-quic_rohiagar@quicinc.com> <1684413670-12901-3-git-send-email-quic_rohiagar@quicinc.com>
In-Reply-To: <1684413670-12901-3-git-send-email-quic_rohiagar@quicinc.com>
From:   Bhupesh Sharma <bhupesh.sharma@linaro.org>
Date:   Thu, 18 May 2023 19:16:31 +0530
Message-ID: <CAH=2Ntze2sHoaY-x19u1iw-3QD_SPS0T0J5xw=xtOyRb6ryf5w@mail.gmail.com>
Subject: Re: [PATCH v2 2/3] MAINTAINERS: Update the entry for pinctrl maintainers
To:     Rohit Agarwal <quic_rohiagar@quicinc.com>
Cc:     agross@kernel.org, andersson@kernel.org, konrad.dybcio@linaro.org,
        linus.walleij@linaro.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
        richardcochran@gmail.com, manivannan.sadhasivam@linaro.org,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        netdev@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, 18 May 2023 at 18:11, Rohit Agarwal <quic_rohiagar@quicinc.com> wrote:
>
> Update the entry for pinctrl bindings maintainer as the
> current one checks only in the .txt files.
>
> Signed-off-by: Rohit Agarwal <quic_rohiagar@quicinc.com>
> ---
>  MAINTAINERS | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index e0ad886..c030984 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -16672,7 +16672,7 @@ PIN CONTROLLER - QUALCOMM
>  M:     Bjorn Andersson <andersson@kernel.org>
>  L:     linux-arm-msm@vger.kernel.org
>  S:     Maintained
> -F:     Documentation/devicetree/bindings/pinctrl/qcom,*.txt
> +F:     Documentation/devicetree/bindings/pinctrl/qcom,*
>  F:     drivers/pinctrl/qcom/
>
>  PIN CONTROLLER - RENESAS
> --
> 2.7.4

Looks good now, so:

Reviewed-by: Bhupesh Sharma <bhupesh.sharma@linaro.org>

Thanks.
