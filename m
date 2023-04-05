Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1B9596D7207
	for <lists+linux-arm-msm@lfdr.de>; Wed,  5 Apr 2023 03:35:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236575AbjDEBf4 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 4 Apr 2023 21:35:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51772 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235365AbjDEBfz (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 4 Apr 2023 21:35:55 -0400
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com [IPv6:2a00:1450:4864:20::12f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 20289E5A
        for <linux-arm-msm@vger.kernel.org>; Tue,  4 Apr 2023 18:35:54 -0700 (PDT)
Received: by mail-lf1-x12f.google.com with SMTP id x17so44716907lfu.5
        for <linux-arm-msm@vger.kernel.org>; Tue, 04 Apr 2023 18:35:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1680658552;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FoyBCXStsqxpfmpVlFcXygr4xYwfXrntl6u3DwEVxas=;
        b=rdBjaUsHhiuWUMKYoRit98wt2EcyiqcOLAn0u1YvUxr2ZxgM4Rdm4qHXFe95dBcN0Z
         wo20Hj9faKL31PTxOTPM79L0PUmRVK39fWSsYjWdBQQSbF9jwxqTBOMjweqdpEBNA4IH
         g0OFbxrZ5dTW7W+9HxloUtL40a2OPpOQoL6C10HxZhYwJ8m83JAcwRG60tLPaQ+UJwN+
         GhhABgoHoQL8g1iERq+Zoklx10HfAI+XQ/DyQ+srcUxV6RhixnzzBQ+1IC1uNxHvdjzN
         3IKYNNEA5bN37+altTVvwCikBAR6FkDsABRR1m/0bmBIkvSivfMejOb9G54x+VnQmHgW
         n83g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680658552;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FoyBCXStsqxpfmpVlFcXygr4xYwfXrntl6u3DwEVxas=;
        b=0LfbJY85xt7O5GolbwmTktHf1HA0NSIXGIJcWn+jsrd/12F9xuX2FBVqHOrN2LRAoy
         9BBKrphcBVyds3vBPemNGZ6W44ZgSXpel23YJqVJEhwyJ6+MTOvBS1Wn/Qj/0O7ONGLq
         YLTnSSABxGKA4ywk8GS9P0kR9eVAKSPdSOE2wUskBYL9y+FFoxdJ+Ow4JYLsdpJpgR1h
         PijggFKXXnVFX0dTZt1cxfIT/wXQOFDz4ya/8z8+0G/ZohzLxYAYVFBHjkadogA7iB0H
         gp8JFj7ho9x29bmNM4vqfZcwtZmL7uUVmk+W1qSOpoDWm0GOYQbi5NtbEhjEFgv5Zqsa
         b+WA==
X-Gm-Message-State: AAQBX9f/P9mwRV24TX20/hPPZrtnoqxgCxxG3+Ons9W3Etpv7QPJh/Gy
        NAOj3p6SLqb38a6L9F8V2acP4A==
X-Google-Smtp-Source: AKy350bpv2i7LVGztpCvL9K+IopcdFKdyv11QsqYGtjWIc1F6UdHNMt0SaBiG8OgKGj3TFFgu8uP0A==
X-Received: by 2002:ac2:5083:0:b0:4de:d16f:3938 with SMTP id f3-20020ac25083000000b004ded16f3938mr979980lfm.53.1680658552391;
        Tue, 04 Apr 2023 18:35:52 -0700 (PDT)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
        by smtp.gmail.com with ESMTPSA id v26-20020ac2561a000000b004cb8de497ffsm2572326lfd.154.2023.04.04.18.35.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Apr 2023 18:35:52 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Rob Clark <robdclark@gmail.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Sean Paul <sean@poorly.run>, David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        Colin Ian King <colin.i.king@gmail.com>
Cc:     kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH][next] drm/msm/mdss: Fix spelling mistake "Unuspported" -> "Unsupported"
Date:   Wed,  5 Apr 2023 04:35:48 +0300
Message-Id: <168065850331.1260361.4926214097299835454.b4-ty@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230329093026.418847-1-colin.i.king@gmail.com>
References: <20230329093026.418847-1-colin.i.king@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org


On Wed, 29 Mar 2023 10:30:26 +0100, Colin Ian King wrote:
> There is a spelling mistake in a dev_error message. Fix it.
> 
> 

Applied, thanks!

[1/1] drm/msm/mdss: Fix spelling mistake "Unuspported" -> "Unsupported"
      https://gitlab.freedesktop.org/lumag/msm/-/commit/44310e2964f2

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
