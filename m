Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7D95C67D4DC
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Jan 2023 20:01:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232344AbjAZTBV (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 26 Jan 2023 14:01:21 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45216 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232301AbjAZTBR (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 26 Jan 2023 14:01:17 -0500
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com [IPv6:2a00:1450:4864:20::62d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 85D5120680
        for <linux-arm-msm@vger.kernel.org>; Thu, 26 Jan 2023 11:01:16 -0800 (PST)
Received: by mail-ej1-x62d.google.com with SMTP id rl14so7747145ejb.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 26 Jan 2023 11:01:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=A5OO1vXNMuogp5FzRqCMwDv1MFLEw13Hj5NTMjVEboo=;
        b=Pyqcgbo++qOcEMsc2AqRFKZRy8mbM4wk+UJh84lwLvV0BOXx3hmDDJQbI7heDfJWlN
         ZDgx3cSv0s22d/aAmjoYGF0ZNkWWAIljso1fpU2kAHj3bfEWfA7hH67kyEag3j7KDltr
         LAGW/0FTrS4trMXGfRUk2o+vTZpgw8LiPS3yI4z7DKLnC+yKptCczDRSjh3+oGzlG0Pe
         lvjWeWKpkx+GB+xMbGTswnKRTM1wujz6Y08lJqb2rQQ/Ipwo/3sD3CQ7evLtMJBcvbB/
         tc3DBtY35vosiHT/FoZ+U0f1Zm/nB/7shnmBycwEYuFnlsdpqaW31BIx0M4k3gKML0Z9
         7Gfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=A5OO1vXNMuogp5FzRqCMwDv1MFLEw13Hj5NTMjVEboo=;
        b=USqTpMOc1wSjpBJG+Q6HhNUKMRE4KayVK/5R118wTNE+FZqhGncovKlU35rTbv4Bg4
         uTN6a8qhyWWVozcJnzLj8JxlTvGQ7js5UpTwxYc6CbdjjmQJfbZBPpu8kBHeC1jRvdOn
         abN0/c6bMHSNh33U5HfZC1v9k67j7hHnTi565cof+Xj/V9A49bneFu7kyJ1NBxrsr1gv
         3m2nymv7Fh1HXK6Ajv/LjbmEavkMHxFHOgRUfPoX1oObeAY7fxss7ATYYs90pDxyteeF
         KVzBSi7WCC3vFfL0pkiI0RQdbdIl90fjedceWi7abflhVCjGcxvwWuCP0Mwa7O+7DUdI
         wruw==
X-Gm-Message-State: AFqh2koBfaKa2EWLnXfpr5X9Hj54DfdvwiO6COo6C02aNoy62ohALL8t
        90uYNPFM33Gd5gEeJ5mSozvxrQ==
X-Google-Smtp-Source: AMrXdXs45m9oAj8817Rp0dU4ASHvwKG2QDpOUBnK9orIJUBMDotXFa/sVcaJfjsWE5S/LLwMAqtDiw==
X-Received: by 2002:a17:906:ecb9:b0:874:9ac1:40e with SMTP id qh25-20020a170906ecb900b008749ac1040emr36694894ejb.19.1674759674894;
        Thu, 26 Jan 2023 11:01:14 -0800 (PST)
Received: from eriador.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id o25-20020a1709061b1900b0084d4e9a13cbsm974982ejg.221.2023.01.26.11.01.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Jan 2023 11:01:14 -0800 (PST)
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
Subject: Re: [PATCH] drm/msm/dpu: sc7180: add missing WB2 clock control
Date:   Thu, 26 Jan 2023 21:00:58 +0200
Message-Id: <167475959092.3954305.17650572108076539649.b4-ty@linaro.org>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230116103055.780767-1-dmitry.baryshkov@linaro.org>
References: <20230116103055.780767-1-dmitry.baryshkov@linaro.org>
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


On Mon, 16 Jan 2023 12:30:55 +0200, Dmitry Baryshkov wrote:
> Add missing DPU_CLK_CTRL_WB2 to sc7180_mdp clocks array.
> 
> 

Applied, thanks!

[1/1] drm/msm/dpu: sc7180: add missing WB2 clock control
      https://gitlab.freedesktop.org/lumag/msm/-/commit/255f056181ac

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
