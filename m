Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A1F98752935
	for <lists+linux-arm-msm@lfdr.de>; Thu, 13 Jul 2023 18:56:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232197AbjGMQ41 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 13 Jul 2023 12:56:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35784 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234683AbjGMQ40 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 13 Jul 2023 12:56:26 -0400
Received: from mail-yw1-x112f.google.com (mail-yw1-x112f.google.com [IPv6:2607:f8b0:4864:20::112f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4B1822700
        for <linux-arm-msm@vger.kernel.org>; Thu, 13 Jul 2023 09:56:25 -0700 (PDT)
Received: by mail-yw1-x112f.google.com with SMTP id 00721157ae682-5701e8f2b79so8815157b3.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 13 Jul 2023 09:56:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1689267384; x=1689872184;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Lwu1I3VpHiRFp8zypeMBICpm5L6K6gQ6kqfkIVHdvMc=;
        b=zFWNwpn2GNJcLzXXrGrWS9AKcJ0DImSUU6+KRjzpFMbDaeYobKGiU7x9m8EJalI2tp
         zsjvwBdbBi20McV5zc4GtM4zHzLEEH4x3AQaoj1rXZYA0lNRIT/0vu0EJIrgUZQe6DEM
         umfVTs0yWF3sKmpfy0F949JSI3lHq9olo2SaHYWxzOV6hTLIrlKT9w31wlVqJ93dH4aL
         5dQCsQFdDfcyzUh4oTIir9yZcG9y1wmgeD95vkLqz5WMOgsuF95L7rpnITMIiyTwDbyR
         ibh/4EY5usxLdaH6e5qFF0qnBNl8epNwGqFcI+9hqSrs26OZ4tXumjJnlBql/F3Fb588
         4jrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689267384; x=1689872184;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Lwu1I3VpHiRFp8zypeMBICpm5L6K6gQ6kqfkIVHdvMc=;
        b=FnifkV0uRbUXUa7Oon+UHZZgEVZF6fvCmmQtecqBVgQWaoqvJjrK2HQjAMTO75IyY8
         kaluUTwIp1xpX1leDJQBAeCDqqsarE+ArJ1CV5H2Ngp5+2wf884qTdEgIND47osEaLSP
         OCLvO4AkmDrzz9WuQoJ5joON+H+izNMoGUV16wE/Iu7HN0BbT5ZaW1ragTb4MdXed2Sr
         6smtUiJPoq6vNMQ2vKU/6b7UakQO6CUcsv7Idg50SXoUSlBEqzWNhOh4TGhTZP8I9W3B
         ri8E4TCgfD00Up3rkwHD9xRE3s/I7lqiziIM4AEcxXUxRjJUTGMSVA9qBZbAsD/yDU/B
         B67w==
X-Gm-Message-State: ABy/qLa8C+r2RpSqjITW2M2o/2Q1R8v5Shp6CvL1PmX1JFBhxEfp9jsm
        hVlzcbnLzVngSPR9z051rL3ngsbVAmREwRVWWJLUmA==
X-Google-Smtp-Source: APBJJlHFuWHcG2GjrDr+7bUaz9zLs92AKucVrz6y9P6Pk+I/TSja5Xolg1JP919CvK1l2ynUnRyEqopef1QS+eiVU1I=
X-Received: by 2002:a25:32d8:0:b0:ba7:7664:916b with SMTP id
 y207-20020a2532d8000000b00ba77664916bmr1776961yby.20.1689267384460; Thu, 13
 Jul 2023 09:56:24 -0700 (PDT)
MIME-Version: 1.0
References: <20230713160415.149381-1-minhuadotchen@gmail.com>
In-Reply-To: <20230713160415.149381-1-minhuadotchen@gmail.com>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date:   Thu, 13 Jul 2023 19:56:13 +0300
Message-ID: <CAA8EJporcTpZVvX-Ox2cHCnsZ3JEH_9SF_U2o85z-88jZ+rG-Q@mail.gmail.com>
Subject: Re: [PATCH] thermal/drivers/tsens: make tsens_xxxx_nvmem static
To:     Min-Hua Chen <minhuadotchen@gmail.com>
Cc:     Amit Kucheria <amitk@kernel.org>,
        Thara Gopinath <thara.gopinath@gmail.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Zhang Rui <rui.zhang@intel.com>, linux-pm@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, 13 Jul 2023 at 19:04, Min-Hua Chen <minhuadotchen@gmail.com> wrote:
>
> This patch fixes the following sparse warnings:
>
> drivers/thermal/qcom/tsens-v1.c:24:40: sparse: warning: symbol 'tsens_qcs404_nvmem' was not declared. Should it be static?
> drivers/thermal/qcom/tsens-v0_1.c:26:40: sparse: warning: symbol 'tsens_8916_nvmem' was not declared. Should it be static?
> drivers/thermal/qcom/tsens-v0_1.c:42:40: sparse: warning: symbol 'tsens_8974_nvmem' was not declared. Should it be static?
> drivers/thermal/qcom/tsens-v0_1.c:64:40: sparse: warning: symbol 'tsens_8974_backup_nvmem' was not declared. Should it be static?
>
> No functional change intended.
>
> Signed-off-by: Min-Hua Chen <minhuadotchen@gmail.com>

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

> ---
>  drivers/thermal/qcom/tsens-v0_1.c | 6 +++---
>  drivers/thermal/qcom/tsens-v1.c   | 2 +-
>  2 files changed, 4 insertions(+), 4 deletions(-)



-- 
With best wishes
Dmitry
