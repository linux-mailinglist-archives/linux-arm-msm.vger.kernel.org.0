Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4656B7D4E41
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Oct 2023 12:52:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233805AbjJXKwK (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 24 Oct 2023 06:52:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34368 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232042AbjJXKwJ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 24 Oct 2023 06:52:09 -0400
Received: from mail-yw1-x1134.google.com (mail-yw1-x1134.google.com [IPv6:2607:f8b0:4864:20::1134])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BFD3EE5
        for <linux-arm-msm@vger.kernel.org>; Tue, 24 Oct 2023 03:52:07 -0700 (PDT)
Received: by mail-yw1-x1134.google.com with SMTP id 00721157ae682-5a7fb84f6ceso41634487b3.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 24 Oct 2023 03:52:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1698144727; x=1698749527; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ByymKernzbt7l2A1qflNQoCJCAiaYl24vxzOmzj3yAc=;
        b=Zd5lP/sXC75EiIvr2ffUWi6wB0HRiVU/GYXEbrKB15tS3Mp5En2zqZhFNayCkmcNPW
         uAHNGNKsG5wdYc3yoxSJROLEqeYB4yQK9tzFU0QjUpddTexI7+ajKFZgHJbQTHjjV/ZI
         2llVWBpqUHfgD/8fZeUD1+2RJLDEqb1N4IWYeIoL4fGF/kKdiyqp1vbMPMjw6fK/ebvv
         i2ClR15E2AQObTTnfFU3leIhaTYFBQ6rHUPFRR1SRjy5Z8O4f+rYH8JYpZLrlGlfkjpy
         OzY0mV315C3sMtOnm9D0OJ4Q0kNIjMubXIziLj82Tg43wFZbzn4l8V/8Mp0pjTcwYO0L
         UZdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698144727; x=1698749527;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ByymKernzbt7l2A1qflNQoCJCAiaYl24vxzOmzj3yAc=;
        b=YaRGLxqCgZBVd3sO91O+02J4eAF0xm3m64AFcq3TfaGOZ+hHNRuHrVzymFSAa7G9Ss
         pgB9FcWem1PIY6F+wYYHJr+sns8qJOir+sIsrhVmSttfglIN49sk/zc+iozyUMzYWMQ9
         rmsFgLH1mZoLtLal30f9lPmrOutwRk8XGqIYZCyI2dJW0NP70082Ao3oq0p831w9KUse
         /1ghjUihIIMsWMFBDnH3hbq4UaMHfDYuFVhXzzECZX4wbikkbvFQeAwWkVdzd3pu2uYV
         1NNdgCzwH+mTgGwOyRfh26CiDgMDLmRZPfLm8jCLr5hI8W1sjEkofdkSA5gzOBEQCqhk
         CWTA==
X-Gm-Message-State: AOJu0YzVZNYLq3FQKUaxi6ohrCHmE7K18vPTKRNQ4X1b3j7y1c1qQ5Za
        kpy1GuQqEJREPpQEXKyUSintaWS+2etJfXg4ov7I/A==
X-Google-Smtp-Source: AGHT+IFo/3QgV0KZOi/gmvirPkbINOiDhalcXKuhYUP+qSnmfjX/7XWUmuor40d93j1eqXJDHRoLEpe+HKTeMqXFZ7E=
X-Received: by 2002:a05:690c:dcd:b0:59f:69ab:22f2 with SMTP id
 db13-20020a05690c0dcd00b0059f69ab22f2mr13575017ywb.40.1698144727007; Tue, 24
 Oct 2023 03:52:07 -0700 (PDT)
MIME-Version: 1.0
References: <20231014133823.14088-1-otto.pflueger@abscue.de>
In-Reply-To: <20231014133823.14088-1-otto.pflueger@abscue.de>
From:   Ulf Hansson <ulf.hansson@linaro.org>
Date:   Tue, 24 Oct 2023 12:51:31 +0200
Message-ID: <CAPDyKFpuQmyG9_Hr2XeMx2axYmNMKfr8WsXtvvq-GJPDTQ0vaw@mail.gmail.com>
Subject: Re: [PATCH v4 0/3] pmdomain: qcom: rpmpd: Add MSM8917 and similar SoCs
To:     =?UTF-8?Q?Otto_Pfl=C3=BCger?= <otto.pflueger@abscue.de>
Cc:     linux-arm-msm@vger.kernel.org, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-pm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Sat, 14 Oct 2023 at 15:38, Otto Pfl=C3=BCger <otto.pflueger@abscue.de> w=
rote:
>
> Add RPM power domain definitions for the Qualcomm MSM8917, MSM8937 and
> QM215 SoCs. These SoCs all have the same power domains (VDDCX and VDDMX
> in voltage level mode), but different regulators are needed for QM215
> because it is used with a PM8916 PMIC instead of a PM8937 PMIC.
>
> ---
> Changes in v4:
> - Rebase on latest next as of 2023-10-14 with new SM7150 compatible
> - Add missing Reviewed-by (if there were no changes to rebase on, I
>   would have simply resent the patch)
> Changes in v3:
> - Sort compatibles in device tree binding documentation (suggested by
>   Krzysztof)
> - Rebase on latest next with genpd subsystem renamed to pmdomain
> Changes in v2:
> - Fix typo in patch description: VDDMD -> VDDMX
> - Split MSM8917 and QM215 changes (suggested by Konrad)
> - Remove redundant qcom,msm8937-rpmpd entry from rpmpd_match_table
>   and use a fallback compatible instead (suggested by Konrad)
>
> Otto Pfl=C3=BCger (3):
>   dt-bindings: power: rpmpd: Add MSM8917, MSM8937 and QM215
>   pmdomain: qcom: rpmpd: Add MSM8917 power domains
>   pmdomain: qcom: rpmpd: Add QM215 power domains
>
>  .../devicetree/bindings/power/qcom,rpmpd.yaml | 81 +++++++++--------
>  drivers/pmdomain/qcom/rpmpd.c                 | 91 +++++++++++++++++++
>  include/dt-bindings/power/qcom-rpmpd.h        | 21 +++++
>  3 files changed, 156 insertions(+), 37 deletions(-)
>
>

Applied for next, thanks!

Kind regards
Uffe
