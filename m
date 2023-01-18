Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 39CD8671096
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Jan 2023 03:06:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229692AbjARCGa (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 17 Jan 2023 21:06:30 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42732 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229569AbjARCG3 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 17 Jan 2023 21:06:29 -0500
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com [IPv6:2a00:1450:4864:20::631])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4666340BCC
        for <linux-arm-msm@vger.kernel.org>; Tue, 17 Jan 2023 18:06:28 -0800 (PST)
Received: by mail-ej1-x631.google.com with SMTP id hw16so67975105ejc.10
        for <linux-arm-msm@vger.kernel.org>; Tue, 17 Jan 2023 18:06:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mLOiM6AzwpgYa1Gps0o2b4LGU2cihDfkk8wIckZ2dtw=;
        b=KADHcLXS1rTHYf1hPvKS/I4cvnDIE//3GCae//1L3Dv1aAKc92WBlmE65fxo3qf/R3
         suvOD9B39tKF3oi9kp1MzbnEbXupp/m7Rn0Q5GVg5SRpV07HA9tYECpwLDPoSsc9zfUb
         DAdYFlO+HWNeFtbpb+8YT3geFRg5CQyGip9uXiQWblDm8GK3wJHYnKvqffHWwxRb9lxE
         oCE17UFBF6aEkxfK74c+D6IyXOi65a2oNhTdyB6G0lPrBHhRYbdut1m0g/5OmxkCoizW
         qQbga8MaiaBKEFlG/7MMKC0OsNErEtAnN9lkIJahY4qOuhelDXYJYrOdW7pmc9w/SyKd
         PNLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mLOiM6AzwpgYa1Gps0o2b4LGU2cihDfkk8wIckZ2dtw=;
        b=lUph4a5mMbFcBK72JTPIQ4sCEDzJI+JXb0zjp3hZ7G1wpUKSKFinFEcipRUh/nDZ48
         mbuX9eg7PE0kk16lPRG1XOB0f5WfO5ZgJvE9yyZXA8W8BPbQrNU9k7CzWBeiLlxBwww1
         lWQeKP9KOZBJBsU9bkovhxXaMbgK0Kj6/ICK4lM1lsMt/mEy4HJ7OAueRI6zcY4jA1lk
         dV7XZIb3530fCwpdibswEFLoIXbD1m8yRpvivOCZjaPhJAWVTIbhiqBgVY7ubfTbBxcV
         S73WISmH5eJQ9aCEZI2xd45lDGMgLfvtx/n6hW748U33oivRRQckl7AqGtLH8h5Xhzg4
         OgOg==
X-Gm-Message-State: AFqh2kr3LwJNYz2ziHZuzZh8JT2ZK3Xf+6oRNrqAbQChTFzMpAXm+4lS
        qM33Gv+X+UsUJLy9w1ONQ/BB7Q==
X-Google-Smtp-Source: AMrXdXsB+KcYxTvDBzvXoXaGBtw21/snKAs7oxT55WhZm+hCVlsUhTl0IsRn3cg06+yrXXbXrBXjEw==
X-Received: by 2002:a17:906:1c81:b0:86f:d1c4:ed08 with SMTP id g1-20020a1709061c8100b0086fd1c4ed08mr5038984ejh.69.1674007586915;
        Tue, 17 Jan 2023 18:06:26 -0800 (PST)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
        by smtp.gmail.com with ESMTPSA id kx1-20020a170907774100b0084d368b1628sm12702694ejc.40.2023.01.17.18.06.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Jan 2023 18:06:26 -0800 (PST)
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
Subject: Re: [PATCH] drm/msm/dpu: enable sourcesplit for sc7180/sc7280
Date:   Wed, 18 Jan 2023 04:06:09 +0200
Message-Id: <167400670535.1683873.1092572126944377205.b4-ty@linaro.org>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230116034435.569512-1-dmitry.baryshkov@linaro.org>
References: <20230116034435.569512-1-dmitry.baryshkov@linaro.org>
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


On Mon, 16 Jan 2023 05:44:35 +0200, Dmitry Baryshkov wrote:
> According to the vendor dts files, both sc7180 and sc7280 support the
> source split mode (using two LMs for a single output). Change these two
> platforms to use MIXER_SDM845_MASK, which includes
> DPU_MIXER_SOURCESPLIT. Rename MIXER_SC7180_MASK to MIXER_QCM2290_MASK,
> since this platform doesn't seem to support source split mode.
> 
> 
> [...]

Applied, thanks!

[1/1] drm/msm/dpu: enable sourcesplit for sc7180/sc7280
      https://gitlab.freedesktop.org/lumag/msm/-/commit/00feff8f1274

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
