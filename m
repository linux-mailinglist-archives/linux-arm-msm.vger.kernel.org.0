Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B3E9B65CE08
	for <lists+linux-arm-msm@lfdr.de>; Wed,  4 Jan 2023 09:08:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233067AbjADIIT (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 4 Jan 2023 03:08:19 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51206 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229490AbjADIIS (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 4 Jan 2023 03:08:18 -0500
Received: from mail-pj1-x1033.google.com (mail-pj1-x1033.google.com [IPv6:2607:f8b0:4864:20::1033])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8EC8311817
        for <linux-arm-msm@vger.kernel.org>; Wed,  4 Jan 2023 00:08:17 -0800 (PST)
Received: by mail-pj1-x1033.google.com with SMTP id cp9-20020a17090afb8900b00226a934e0e5so565537pjb.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 04 Jan 2023 00:08:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=BHSYb64FJ80mwIoAZyU1q1qJuQxSAJaJ02PPlkNgjuQ=;
        b=ffhf4eXWBt2PERbYvUEK1x5SCDboX5qm4ZnFS1MUIznIfh0hi6HFS1cGhMPpcqn46q
         gJTAOtVLEHIMycS1ovZo4M3lAwvmes3LqeR6X8sENg8I8jwXUbOcoPF9s/0fERfRcbgF
         +YgCX4VXifOyXB3f5b7hJ7H9d9mpdAtCwl0N2D1IagUHtdBuH+VIaKLkRB4shfRVY0Or
         +0K5CcCC9Kubeqdbo0nu0XhtSfy2t94TejRhzdLa6tpjL+7fP+xI9wudSfF2wOyntFjk
         SX9eet8KnAvD0d2U4vyEW0jUdDFfW2j0J6QKz5S6NvqNpRtxXjtvoxbU0WB5nK+gd1L6
         rAZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BHSYb64FJ80mwIoAZyU1q1qJuQxSAJaJ02PPlkNgjuQ=;
        b=tUTuTWhfZr8YLKts3MMDQmguCuxgLoHAJkeFmuev3mQI3LUmyu9dTIS5Fl4Gy0i+u3
         zq4b3DSnaRvCt8F/5qfGFR73+HCU3hyqIeLsYPsX/VtRpwnIUi1bPCFA1TQXsqgv0/9l
         6r5wMh93rhpzh2TYLdY7vNWlhKijNQtuUTOge5gqgtngxsDcKE9SuGWywd1sWDGIicwV
         Gcqlaez/BudQ8ue2rcjJLgCPe01yt9jJcVHgBuvXiPJFEnAtMQJP8plu9yWlZnkAT5Br
         PBV1KpHf5vU+U2vcMS7E5rNcx1KDJS1s4gG2hOZl6gMYU7b3+6ot9HU9QhE4hZfZMzWj
         weUQ==
X-Gm-Message-State: AFqh2kqlpmxSIZBDV+NnQN/4uHcfoRidcPaOC3B9X7Srfj1byNhx8DTD
        jTCp/wO9aIRuXaPyB/w7MhEbZ8ayLD4YNnJKcl8wxA==
X-Google-Smtp-Source: AMrXdXtnyMkEG9oI5Jwky77UHJWthj46fueW+qNo4Iva5YapgZ32fX41SgNYVa8pNq/7qlJ4XMhQpCLhznczijLFISc=
X-Received: by 2002:a17:902:db07:b0:192:ab97:633c with SMTP id
 m7-20020a170902db0700b00192ab97633cmr824235plx.69.1672819697110; Wed, 04 Jan
 2023 00:08:17 -0800 (PST)
MIME-Version: 1.0
References: <20230103142120.15605-1-konrad.dybcio@linaro.org>
In-Reply-To: <20230103142120.15605-1-konrad.dybcio@linaro.org>
From:   Shawn Guo <shawn.guo@linaro.org>
Date:   Wed, 4 Jan 2023 16:08:05 +0800
Message-ID: <CAAQ0ZWRRW7S6iFz0vJWPC1jRQ8iSvcXeWbNHE=mpHbZBe0hEDA@mail.gmail.com>
Subject: Re: [PATCH] interconnect: qcom: qcm2290: Fix MASTER_SNOC_BIMC_NRT
To:     Konrad Dybcio <konrad.dybcio@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, andersson@kernel.org,
        agross@kernel.org, krzysztof.kozlowski@linaro.org,
        marijn.suijten@somainline.org, Georgi Djakov <djakov@kernel.org>,
        linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, Jan 3, 2023 at 10:21 PM Konrad Dybcio <konrad.dybcio@linaro.org> wrote:
>
> Due to what seems to be a copy-paste error, the _NRT master was
> identical to the _RT master, which should not be the case.. Fix it
> using the values available from the downstream kernel [1].
>
> [1] https://android.googlesource.com/kernel/msm-extra/devicetree/+/refs/heads/android-msm-bramble-4.19-android11-qpr1/qcom/scuba-bus.dtsi#127
> Fixes: 1a14b1ac3935 ("interconnect: qcom: Add QCM2290 driver support")
> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Acked-by: Shawn Guo <shawn.guo@linaro.org>
