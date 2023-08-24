Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BAE2C7879DE
	for <lists+linux-arm-msm@lfdr.de>; Thu, 24 Aug 2023 23:05:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233033AbjHXVFL (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 24 Aug 2023 17:05:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32778 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243643AbjHXVEu (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 24 Aug 2023 17:04:50 -0400
Received: from mail-vk1-xa34.google.com (mail-vk1-xa34.google.com [IPv6:2607:f8b0:4864:20::a34])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 10E132106
        for <linux-arm-msm@vger.kernel.org>; Thu, 24 Aug 2023 14:04:26 -0700 (PDT)
Received: by mail-vk1-xa34.google.com with SMTP id 71dfb90a1353d-48d0eb04c8cso132641e0c.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 24 Aug 2023 14:04:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1692911065; x=1693515865;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=WkoUCmzk6kpY7dtKJHiHxStqN+h+r9LgpuChyH7uCV8=;
        b=Hm2mieTK64nboBW6aRDOHQOMRRpXIfJjIGW3+Nv9NG8xf5mb8heB4vdn2340LFcpgR
         o1i49N8Tm7UgFcncyiLVWoSz+64AuBzDoMFOJFJNXpItMuCzYTts+L3F+xwNmqRoOaHr
         FBeRTvDfOQoGomZIXHrEwHdqQMowdho66xvGMvF2AdGC+dUnTag6Vr9FzD4clIJFDaIf
         4vr+e8Jhh97YA7U+Qe1mGtbqzd78RWaS1a/ao6aWz0HEZfOLQidTlF3Oxod6AWCmUTrN
         HC32zsfCq9IycW6DFH+P4edvqOCHamN1NYOJDf2QnMZBC1cAFobUuZ3wgvydSTzu99Et
         WDPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692911065; x=1693515865;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WkoUCmzk6kpY7dtKJHiHxStqN+h+r9LgpuChyH7uCV8=;
        b=jXCww0YQSL4hM+ZBzdgSHZhPUVr07UOVmvgoHL58t5JdZ35dQHTQDP+Yr9wiFiI/99
         DNrV6ekiDfi6wJ0LHJPHyO/1P8cpvlvGvmlRstY3hguq1qj6nQ/q3TPn4R0dO3WTo42i
         CLZlGFuqjLNpNcwIkgEtTLPPcP6cJfr5VAAgezkg+9dFvB4421wBzNMwlTqPPp+1S3W+
         PTzTmzkXa5UDGneGHU4rX2RL9EoAMXavhGShh7PLorkd4eMH6a6gYz+OqTTpiBXYG9YF
         Ukyd6vMu4EOzr/6szGsP3J9nrVU/r0ywROW/nM+e9rO9iDRBrOnylkGkwpdPYbQ6vEub
         L8PA==
X-Gm-Message-State: AOJu0Yy3Do6tB6OIU9aWS28kp3WgtGR9p9zj18hcRMyZEqSH/v2wXYT+
        DLQ/dplO4MXg0uNcRXYAvnKK1asc46IE3O8AV+BhJQ==
X-Google-Smtp-Source: AGHT+IGeJ7/r6a9gBrmT0pw+udF19ySh/nVFMaDVPBWMqeCt+B+Sx87zxPTnpBNBUFQEk0Z3KZmLmA0nHnEvVUN9N88=
X-Received: by 2002:a1f:e643:0:b0:48d:1cf0:f3c3 with SMTP id
 d64-20020a1fe643000000b0048d1cf0f3c3mr10466825vkh.14.1692911065190; Thu, 24
 Aug 2023 14:04:25 -0700 (PDT)
MIME-Version: 1.0
References: <20230824173410.550126-1-quic_ajipan@quicinc.com> <20230824173410.550126-5-quic_ajipan@quicinc.com>
In-Reply-To: <20230824173410.550126-5-quic_ajipan@quicinc.com>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date:   Fri, 25 Aug 2023 00:04:13 +0300
Message-ID: <CAA8EJpo=ZDmoMDyfHEZV9Ng6yM=Z2SdTyPSG246AmLKVR0-vwQ@mail.gmail.com>
Subject: Re: [PATCH 4/4] clk: qcom: Add GCC driver support for SM4450
To:     Ajit Pandey <quic_ajipan@quicinc.com>
Cc:     Andy Gross <agross@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Taniya Das <quic_tdas@quicinc.com>,
        Imran Shaik <quic_imrashai@quicinc.com>,
        Jagadeesh Kona <quic_jkona@quicinc.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, 24 Aug 2023 at 20:36, Ajit Pandey <quic_ajipan@quicinc.com> wrote:
>
> Add Global Clock Controller (GCC) support for SM4450 platform.
>
> Signed-off-by: Ajit Pandey <quic_ajipan@quicinc.com>
> ---
>  drivers/clk/qcom/Kconfig      |    9 +
>  drivers/clk/qcom/Makefile     |    1 +
>  drivers/clk/qcom/gcc-sm4450.c | 2898 +++++++++++++++++++++++++++++++++
>  3 files changed, 2908 insertions(+)
>  create mode 100644 drivers/clk/qcom/gcc-sm4450.c

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


--
With best wishes
Dmitry
