Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 584876C0537
	for <lists+linux-arm-msm@lfdr.de>; Sun, 19 Mar 2023 22:06:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230075AbjCSVGm (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 19 Mar 2023 17:06:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50098 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229783AbjCSVGk (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 19 Mar 2023 17:06:40 -0400
Received: from mail-yb1-xb2a.google.com (mail-yb1-xb2a.google.com [IPv6:2607:f8b0:4864:20::b2a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 826B1113F5
        for <linux-arm-msm@vger.kernel.org>; Sun, 19 Mar 2023 14:06:36 -0700 (PDT)
Received: by mail-yb1-xb2a.google.com with SMTP id l16so1286155ybe.6
        for <linux-arm-msm@vger.kernel.org>; Sun, 19 Mar 2023 14:06:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1679259996;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=144zZiImRVfFBnZW6GKzVJXTL60Wcv553hHE4rrYsuQ=;
        b=msNj49r7LqypPEI0BLP4RQhp10RJ4kLSXcqS2bdjXVPx1HXklwnvfV4jnjJaUl8sct
         1biFSUgNAwZOznfDoQIvaacztlXEzI4VBZMaOyfTtvPwTd1gknE8anR8qIQxnd/L6A7+
         VyK735auqhYLDQ7KVL3butV+7Fo0uRomComCM0x5K543a8EjFbFee5eT2Vk8IQKjhBRx
         BNb7rVea5dLakaadrMwe4KqALUAA/Al8HTu0SUubSHEM3AJVykigGQDLa7eo81F4aaLx
         wF0mSA4O1BVXur3rEe8DrfYoLz70gwloCtXW1EY8JbEZgGUx7Y+KaN8/NL8tnlaBMyfx
         HnUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679259996;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=144zZiImRVfFBnZW6GKzVJXTL60Wcv553hHE4rrYsuQ=;
        b=YiE0SJvgg5ofAHqf7L76avBlG5Mk9wEv0FSxm2k8cy9iWEBCSbXH/kPVP4kmR24iDt
         YbHTfXeCLI45hcBpPDdDu+yL8AXDDr1U92zEchwlnzvUQSH9h0U00cmrEUXzahl2OeKF
         v50dMBshDlEVju+XMQmoKs2zjR8IairfJEmDTcv+h4ABZLRujz0DN0jd/1tDH/E0gj55
         +aammiVv1dFouGU4kZ8EfBwT18xC39zQA2uTbu4wI3l0Nyi025S3OyllepkFQhoHW4Si
         6Xv3uY4fLWBlsWs2JCFG/7WtkCHy72iBdqXQHuqtznQ+hhRSTPs2fGjJstJnX4/BGyxv
         6ooA==
X-Gm-Message-State: AO0yUKWK5O7ycie2KJjeAjVVBoBzMxsxhHzDeT2Z12xSPrOBCnssNFsL
        hsC3vSff2vEcVBFZ3bxmLORxR1CBeVq6nlfv/5E5Sw==
X-Google-Smtp-Source: AK7set86eBleqoMmdM1qKSjYGk83l57PtBMZSwB9gQjU2KxZzli9OcwUY6W2YU/g+N6Hzqg6WiRJsTE9pIe1Zz8fjV0=
X-Received: by 2002:a25:9786:0:b0:b23:4649:7ef3 with SMTP id
 i6-20020a259786000000b00b2346497ef3mr4009486ybo.4.1679259995778; Sun, 19 Mar
 2023 14:06:35 -0700 (PDT)
MIME-Version: 1.0
References: <20230316105800.18751-1-johan+linaro@kernel.org>
In-Reply-To: <20230316105800.18751-1-johan+linaro@kernel.org>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Sun, 19 Mar 2023 22:06:24 +0100
Message-ID: <CACRpkdZizYOjqJMuW+dQ4-Nm6vMLymJHW4WiWhF4jZkES_zc=Q@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: pinctrl: qcom,sc8280xp-tlmm: allow 'bias-bus-hold'
To:     Johan Hovold <johan+linaro@kernel.org>
Cc:     Bjorn Andersson <andersson@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, Mar 16, 2023 at 11:57=E2=80=AFAM Johan Hovold <johan+linaro@kernel.=
org> wrote:

> The controller supports 'bias-bus-hold' so add it to the binding.
>
> Signed-off-by: Johan Hovold <johan+linaro@kernel.org>

Patch applied!

Yours,
Linus Walleij
