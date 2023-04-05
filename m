Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3AE006D720F
	for <lists+linux-arm-msm@lfdr.de>; Wed,  5 Apr 2023 03:36:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236647AbjDEBf7 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 4 Apr 2023 21:35:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51812 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235365AbjDEBf5 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 4 Apr 2023 21:35:57 -0400
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com [IPv6:2a00:1450:4864:20::12a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 417D4199
        for <linux-arm-msm@vger.kernel.org>; Tue,  4 Apr 2023 18:35:56 -0700 (PDT)
Received: by mail-lf1-x12a.google.com with SMTP id c9so34240163lfb.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 04 Apr 2023 18:35:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1680658554;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UwyKfYot14ilHFAuMsDSrEnz1jRBc3hhgB3iT23xYhE=;
        b=ONIpd1vjARZP+35nzzjgfUh4PEVlWWC35WPRmcVal4ZdGeEvj9PqWXFJH5xXCyExCI
         qMf0C7IU9UAHRUV0I9sN3QPuebaOsuftGBUzKouXsZQQB/HgkdTB2LmwdGSFZAFk18TC
         7Z0X2Maidg3ZYhOWLfRXsScJyJ+J9KZqpkE9iqiIUEIex5NxKxBls0UOuIv9kAmJLRD9
         H2xybN1ynIak8Ec8VS5zDV3TmXdcyaO56zSaYS3XNTGaBCPluAvYufSRxmyIKCJFeQYl
         nSzAUmZrQdRmpELm4iwubEZC1cKmlu41B7hoJnriKdLcsghZT0dCNgqeYWjBZCNbGI/q
         YUyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680658554;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UwyKfYot14ilHFAuMsDSrEnz1jRBc3hhgB3iT23xYhE=;
        b=zkKMgdsseQOP5Rze+gxqx3ARRQ5Y3m9pYKGB/1cYZnt4hcJcTk0eYssjiiVQzZc/8r
         TFENRiEnjisY1SQCDmxiRP9oF86BYHrHe8SVW9XnCQ1/zX9qpp+S9G5peyHYpNRwwlN1
         BLtWFepqN3bLHCslo/tYcuAup0zN5uC5OpGgPmPqv1FlbiDQb7WBDZzpL74wKm6lwqo+
         T6DqIMZtp5CU3d59JhEV3QoAUUNoNpe96co6qASStmApe9kszFpS4Y16cVoP/htbeY7M
         D0V6vTrThASiTAAKdG+c0tivV5w2NTGiPeC9zD2mQ7cuUTbrUJbPVYwqXz4UNHy5kUTQ
         BVPA==
X-Gm-Message-State: AAQBX9f+x8idvnfRFSzb0nkUXgUae7UUo0KihZpK/vImKyfW4FX0yewU
        Bz6oIwqDyInd5s8GxcJJFWyEug==
X-Google-Smtp-Source: AKy350boE/H6gPEad6PwVsvSiLw29ItUe8nLR83QFFV6AmP5ydeMXJNTR7nzAlkA1vPgqFHsALYpgg==
X-Received: by 2002:ac2:5a0c:0:b0:4e8:43a4:2baf with SMTP id q12-20020ac25a0c000000b004e843a42bafmr1009075lfn.33.1680658554618;
        Tue, 04 Apr 2023 18:35:54 -0700 (PDT)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
        by smtp.gmail.com with ESMTPSA id v26-20020ac2561a000000b004cb8de497ffsm2572326lfd.154.2023.04.04.18.35.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Apr 2023 18:35:54 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     robdclark@gmail.com, quic_abhinavk@quicinc.com, sean@poorly.run,
        javierm@redhat.com, airlied@gmail.com, daniel@ffwll.ch,
        Thomas Zimmermann <tzimmermann@suse.de>
Cc:     linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
Subject: Re: [PATCH v2 0/8] drm/msm: Convert fbdev to DRM client
Date:   Wed,  5 Apr 2023 04:35:51 +0300
Message-Id: <168065850333.1260361.14774983089161239922.b4-ty@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230403124538.8497-1-tzimmermann@suse.de>
References: <20230403124538.8497-1-tzimmermann@suse.de>
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


On Mon, 03 Apr 2023 14:45:30 +0200, Thomas Zimmermann wrote:
> Convert msm' fbdev code to struct drm_client. Replaces the current
> ad-hoc integration. The conversion includes a number of cleanups. As
> with most other drivers' fbdev emulation, fbdev in msm is now just
> another DRM client that runs after the DRM device has been registered.
> 
> Once all drivers' fbdev emulation has been converted to struct drm_client,
> we can attempt to add additional in-kernel clients. A DRM-based dmesg
> log or a bootsplash are commonly mentioned. DRM can then switch easily
> among the existing clients if/when required.
> 
> [...]

Applied, thanks!

[1/8] drm/msm: Include <linux/io.h>
      https://gitlab.freedesktop.org/lumag/msm/-/commit/62c58ffe011d
[2/8] drm/msm: Clear aperture ownership outside of fbdev code
      https://gitlab.freedesktop.org/lumag/msm/-/commit/f4de16da5b40
[3/8] drm/msm: Remove fb from struct msm_fbdev
      https://gitlab.freedesktop.org/lumag/msm/-/commit/a5ddc0f1a7bc
[4/8] drm/msm: Remove struct msm_fbdev
      https://gitlab.freedesktop.org/lumag/msm/-/commit/09cbdbafbe9f
[5/8] drm/msm: Remove fbdev from struct msm_drm_private
      https://gitlab.freedesktop.org/lumag/msm/-/commit/37e8bad3ae5d
[6/8] drm/msm: Move module parameter 'fbdev' to fbdev code
      https://gitlab.freedesktop.org/lumag/msm/-/commit/2fa4748b5ad8
[7/8] drm/msm: Initialize fbdev DRM client
      https://gitlab.freedesktop.org/lumag/msm/-/commit/7e563538d210
[8/8] drm/msm: Implement fbdev emulation as in-kernel client
      https://gitlab.freedesktop.org/lumag/msm/-/commit/5ba5b96d3327

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
