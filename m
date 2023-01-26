Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F392367D4E0
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Jan 2023 20:01:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232301AbjAZTB0 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 26 Jan 2023 14:01:26 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45418 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232342AbjAZTBV (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 26 Jan 2023 14:01:21 -0500
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com [IPv6:2a00:1450:4864:20::62d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 74B5C5528C
        for <linux-arm-msm@vger.kernel.org>; Thu, 26 Jan 2023 11:01:18 -0800 (PST)
Received: by mail-ej1-x62d.google.com with SMTP id rl14so7747560ejb.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 26 Jan 2023 11:01:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qBWm6FSmlOHy18aqhTxXmGS8/TFLM/DG4o289iZ6hFw=;
        b=HCJKjiq3GNFduyzH2nOCkRTh4dBUXS1OY264zhC/gkzdTkQWV7uFD3vkchrcHYlATa
         Qt37nLapwe+NljxPwQHFQSXMwzgF5mtYvWtyoICGRQ92zBUqKfR6Sz9wz1tR1JO1qJUj
         s8FZt/KQEWbY9W9kpysUN4uYWx/7mI0LtGI3bIMc8kx7coqnndMtXRXwqKlJjaaROEWL
         /GPqrJap2htFMmHotLdvkyvSliGNVweUwJo/UHYHb+CJfdaTDA/JQ1lAb1ovgC+AMrxY
         b/dCmIdiz8pehIdNgDfwHRACxRNSOKna9JlqUV7gdE18CTAhfAgP7r/tV6Y6D8y66+mx
         yhIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qBWm6FSmlOHy18aqhTxXmGS8/TFLM/DG4o289iZ6hFw=;
        b=UzFiTbbemw2ljWIIA2GssiC33MM/Jj4rgtG/Qcf3K0E260M517iMn0SLz1ekYYMiJM
         nGnDj+oI1loEntMtTrtDFygQ4B4b+qawIwWX8+NXzkhjeL19oW8+Lzt+G34agVKSgPT6
         q9uR7VNvuAfDkxWKY/OTgD3m2NnH9oCMYxhcTS9g3jl1NVZYkQzguEjHvJK+F5Q6tEX6
         F0+1963aK0KbnNSL6gB67bVoJmkAdOt7OUnthn7Zc2VC0nyNQODa4t3PZGQYI2mV49xY
         nvxHyZS+FLW6kmNfybwOInW1rsM87+2oDVHkQJBVhwsSOQAqjapWxirnkLpM0/ek+0EX
         5qqg==
X-Gm-Message-State: AO0yUKXg2yg76mdAKW7CuGLfBRfixDtFia3usRzNs0jxHqGPTa/LETc/
        Xbt+stxn5/BSQnGMz13rWtAnWw==
X-Google-Smtp-Source: AK7set/rsuFfe/cwMZ3ZuTOvMPjnMOP/rgYnI0ksZLx+5S5MuskuUnGWpyCs2aNXPzkZpjFYgDfRJQ==
X-Received: by 2002:a17:907:8809:b0:878:5859:b019 with SMTP id ro9-20020a170907880900b008785859b019mr4044768ejc.48.1674759678131;
        Thu, 26 Jan 2023 11:01:18 -0800 (PST)
Received: from eriador.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id o25-20020a1709061b1900b0084d4e9a13cbsm974982ejg.221.2023.01.26.11.01.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Jan 2023 11:01:17 -0800 (PST)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
Subject: Re: [PATCH v2] drm/msm/dpu: add missing ubwc_swizzle setting to catalog
Date:   Thu, 26 Jan 2023 21:01:01 +0200
Message-Id: <167475959091.3954305.4158185883745972292.b4-ty@linaro.org>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230123062415.3027743-1-dmitry.baryshkov@linaro.org>
References: <20230123062415.3027743-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org


On Mon, 23 Jan 2023 08:24:15 +0200, Dmitry Baryshkov wrote:
> Use the values from the vendor DTs to set ubwc_swizzle in the catalog.
> 
> 

Applied, thanks!

[1/1] drm/msm/dpu: add missing ubwc_swizzle setting to catalog
      https://gitlab.freedesktop.org/lumag/msm/-/commit/31c318051040

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
