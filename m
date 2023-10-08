Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A12C57BCEAE
	for <lists+linux-arm-msm@lfdr.de>; Sun,  8 Oct 2023 16:01:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230332AbjJHOB2 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 8 Oct 2023 10:01:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55450 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234336AbjJHOB1 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 8 Oct 2023 10:01:27 -0400
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com [IPv6:2a00:1450:4864:20::12f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3769FC5
        for <linux-arm-msm@vger.kernel.org>; Sun,  8 Oct 2023 07:01:26 -0700 (PDT)
Received: by mail-lf1-x12f.google.com with SMTP id 2adb3069b0e04-50308217223so4611883e87.3
        for <linux-arm-msm@vger.kernel.org>; Sun, 08 Oct 2023 07:01:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1696773684; x=1697378484; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zrbe2OEAhJijEGyQK+85gEV7qQdJqrY99QKDYQ+rxHc=;
        b=Up2jrWKjPOqC92NI3lGibxGVRTjBckMgxtJiMYmlkgjKbuwGojczECZXAkNTurtnn8
         cLOh2M373or1/r71b7u3QAfONZKyhYaPnF1tWr2TxMGNqmaTexZQ8j6srY0OTqSVAi0H
         WlWA5LN5AQPWqXUJP98ghGN/SNJDw2FPdAgt59GL+nsVahv4CfaKLT0X5GOH5It5aWuJ
         Xh+YNUOf4E8/wEzY14gD20dVsg0Zp8E7LIY4agC3w2L7wZI1BnEZWSTqQ8XgbuQ1HCUS
         fM8WU2ZxZhEHEtpxxZiIHBCYXHiKyFNziCS7ZMFwXQkNDeIkk5waeyIgqJd5GWd12lcS
         pwhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696773684; x=1697378484;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zrbe2OEAhJijEGyQK+85gEV7qQdJqrY99QKDYQ+rxHc=;
        b=RcTKRpVkITLb+MsnEbzgZNZNSnm9+RQteE06+q3GpK1nrLRWmyXSSmmDJzXgAo60No
         bG1NOkfVWwQJhKla7arqc4c91ue/Yk1soIDYnA2v21+WxtDyJ5wr0M/IlIcz1/L5ixCh
         n0u0V1QfL9nrTqjvDm66yPxFB2fblWufju1ysNp89oDXI2SLPfOl3iHF79KPpu0BOhf0
         M80l2DQRuewh9P+3hife7zvjgaVvZyZveNiNwq/wQR95v4/DjD9snhq7gRtWJ7xqr9Av
         GZH38AuznetdBQReh3ayWvzAVK6c3qNVPoRDXwI1XkgNdftSjPfgTae/B7J2sOJyHGQp
         Z1aQ==
X-Gm-Message-State: AOJu0YzyVOdS7nogBTeEnrxTK+HtZjbGORrIoZZCHwLEx6I81ibUQoZl
        fgUwBGASptX7udsV2STL/CBuDw==
X-Google-Smtp-Source: AGHT+IGhX63ME4hP/QjxMFDzFKLGVSIH9lhaSoXMWQNHOUIpoqTqxSJVWPkVFp9aDX3v7yMASthgLQ==
X-Received: by 2002:a05:6512:2082:b0:503:2561:adbc with SMTP id t2-20020a056512208200b005032561adbcmr9582392lfr.64.1696773684439;
        Sun, 08 Oct 2023 07:01:24 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id q14-20020ac24a6e000000b00504211d2a73sm1080455lfp.230.2023.10.08.07.01.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Oct 2023 07:01:23 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     dri-devel@lists.freedesktop.org,
        Jani Nikula <jani.nikula@intel.com>
Cc:     Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Stephen Boyd <swboyd@chromium.org>,
        linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        Kuogee Hsieh <quic_khsieh@quicinc.com>
Subject: Re: [PATCH] drm/msm/dp: skip validity check for DP CTS EDID checksum
Date:   Sun,  8 Oct 2023 17:01:15 +0300
Message-Id: <169677306905.2570646.10307218692711830426.b4-ty@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230901142034.580802-1-jani.nikula@intel.com>
References: <20230901142034.580802-1-jani.nikula@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org


On Fri, 01 Sep 2023 17:20:34 +0300, Jani Nikula wrote:
> The DP CTS test for EDID last block checksum expects the checksum for
> the last block, invalid or not. Skip the validity check.
> 
> For the most part (*), the EDIDs returned by drm_get_edid() will be
> valid anyway, and there's the CTS workaround to get the checksum for
> completely invalid EDIDs. See commit 7948fe12d47a ("drm/msm/dp: return
> correct edid checksum after corrupted edid checksum read").
> 
> [...]

Applied, thanks!

[1/1] drm/msm/dp: skip validity check for DP CTS EDID checksum
      https://gitlab.freedesktop.org/lumag/msm/-/commit/22e96e73182c

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
