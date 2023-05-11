Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A448B6FF32A
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 May 2023 15:39:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238275AbjEKNi7 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 11 May 2023 09:38:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59648 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237951AbjEKNik (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 11 May 2023 09:38:40 -0400
Received: from mail-yb1-xb33.google.com (mail-yb1-xb33.google.com [IPv6:2607:f8b0:4864:20::b33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BF3F811D93
        for <linux-arm-msm@vger.kernel.org>; Thu, 11 May 2023 06:36:36 -0700 (PDT)
Received: by mail-yb1-xb33.google.com with SMTP id 3f1490d57ef6-b9a6ab9ede3so10792471276.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 11 May 2023 06:36:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1683812191; x=1686404191;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cFAIywGWIpHXBlSdgbcQzT1KF9uNjxkkfEt4tXTB8GY=;
        b=NC0E8vqh5yAN4U7/8Y4/aq1xl0d7frmoThyvYuilmHbwwjROn6dxNX8nVcnyidJB/m
         qatfvm0yPY+Hd+IP/3kpI+kcPi99ppeI5XYfd1P5Ruw8e75i5B1I1jbaaK1EdUI5Ymz3
         N4kZVZJsafykkM3zIzaecbyDFU9a7TqFZ8nTIJW3gaeoNugJowg7LiiQiuGkwZcnfe2q
         lYerGGZj/igiPYsHxKj+I0F9H0UjZcRTIQhb8OmxMG4483Qaftq0NXmGIOa6ecdW7Em0
         8DQri3W1uK6NdjjMQGKcHLW7JsaLdDl4yjoOza8ga5sM1fqbNV8dqJ7nnJ1cciewr7uX
         Ws8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683812191; x=1686404191;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cFAIywGWIpHXBlSdgbcQzT1KF9uNjxkkfEt4tXTB8GY=;
        b=HO5ajbkDyvMd3wD5sB+B3RUJZ7k10Ax4Z3wAGNYE0MDk9KHv+paY5eipLugi/hQ5xH
         LJ4kT4m2ElQDkTAwJY1nKMjV4LSzx1AwJHLvidA4wWCpeu1ksXzZoIHAf40sP7kKBv9v
         k5rDqe4425LOQnGFVheHcr+q7w1bf2aBZaTD5rx5UnKS+wS+A3Jg12GwYCxP1B4W7Ann
         gmsEeeH2HSXWRu7iZS3OCorzdPht3M0ubOBSCe2uP5Ju+bNk6GQF1LN/NshjbqT7CSPW
         6RmzzC8qbV+GX8wWutaYbg69gAMWwG5WyuiSu90foKfaNvD6tWwNVTQv6KUC6nn/70mD
         4XEA==
X-Gm-Message-State: AC+VfDyv98IXZJr5mOKzXwmmNVkbbaUtKtNTERsAYIRc26OGmkkhfUYU
        eSJ0XzVbnndWutrvfwdN2kT8tyJ4SGV3tc81UgAiMQ==
X-Google-Smtp-Source: ACHHUZ7QMtu9AVeo1bHy1+Z0/j5lqVmaGvWbkRPmujYL/1PGBpqhTIe8hp6y79vxcM6RG1l/dmxLaabpyZzUPNvVMDw=
X-Received: by 2002:a25:fc07:0:b0:b9a:6f77:9018 with SMTP id
 v7-20020a25fc07000000b00b9a6f779018mr19959978ybd.41.1683812191411; Thu, 11
 May 2023 06:36:31 -0700 (PDT)
MIME-Version: 1.0
References: <1683730825-15668-1-git-send-email-quic_rohiagar@quicinc.com>
In-Reply-To: <1683730825-15668-1-git-send-email-quic_rohiagar@quicinc.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 11 May 2023 15:36:20 +0200
Message-ID: <CACRpkdZZKsLQbR0zttAWjxYWEPdWo3cHo_OVhuGxBZ89XhDTmw@mail.gmail.com>
Subject: Re: [PATCH v7 0/4] Add pinctrl support for SDX75
To:     Rohit Agarwal <quic_rohiagar@quicinc.com>
Cc:     agross@kernel.org, andersson@kernel.org, konrad.dybcio@linaro.org,
        robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        richardcochran@gmail.com, manivannan.sadhasivam@linaro.org,
        andy.shevchenko@gmail.com, linux-arm-msm@vger.kernel.org,
        linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, netdev@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, May 10, 2023 at 5:00=E2=80=AFPM Rohit Agarwal <quic_rohiagar@quicin=
c.com> wrote:

> Changes in v7:
>  - Collected reviewed by tags from Andy and updated the sdx75
>    driver with the new macro which was missed in v6 patch.

This looks good to me, but I definitely need Bjorn's ACK on the series
before I can merge this.

Yours,
Linus Walleij
