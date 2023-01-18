Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 376806710B1
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Jan 2023 03:06:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229749AbjARCGq (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 17 Jan 2023 21:06:46 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42960 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229754AbjARCGi (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 17 Jan 2023 21:06:38 -0500
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com [IPv6:2a00:1450:4864:20::635])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 810F346D7B
        for <linux-arm-msm@vger.kernel.org>; Tue, 17 Jan 2023 18:06:35 -0800 (PST)
Received: by mail-ej1-x635.google.com with SMTP id tz11so15428887ejc.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 17 Jan 2023 18:06:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ccs2uNmfL4XWxTk6Uww2FXDm1/IOKWoamNzZVTFZBqg=;
        b=q0tgw2Z3ChWeUnJns+bg5UgV2wpIPe+4eymySGOiHe2x8bWtkliFGdMYtXQaWkZswx
         S3EMetxLLkpwji26+bXSC2li2MMmLZhSH9wmSbHRXNqEok04ZvgGq+CvARGESzELQUXx
         U3oU4cYAXc3PUHbIMsQJIdkyb2+EkKaBW20XfCBmjJSJUcCqXq3GJl27GlKFBfe7Nte2
         njxKegVK7aDJrdvorZauNZ2IZfj1Om09bcscX3FtlzAoQhsrv7Qm1PR/CEifaH5ytcee
         It51XGWjj2V689CLcxbjyPHfvozsVm0TqPha4rthQO0rrmbiEmxnmt0KR+U/z5DdaryE
         +2UQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ccs2uNmfL4XWxTk6Uww2FXDm1/IOKWoamNzZVTFZBqg=;
        b=pXzFnFMvQXViw1659AAL683JwrqnboeM/0uluu6GVq4HVWEZkaozUrunQ5aUxbfmAE
         bO+PMMHEanYSsW4c9bPIeGRmQYaULbL+xHZVEKwL+Vl6chNlZoEFmPpOkojsddrJrN/O
         RVryrPHizoMmyWsUpMv1JTRx5Dw7vlT6WaiWmQ/huJGRL7d1BFv8O6NYqSQjSG22UqPw
         Y6N/J130/vbFdh3SGsG/DIq97iB75DytZwBH//Ss4+HEHRev7kUeDH70T53TWvfUcuxd
         1dQCKFlG6crF7wvfnGQkXK8HljoQCEx8FWcmtBhg0NT87xocijcv9eT1xClroYjkPlRB
         VBuA==
X-Gm-Message-State: AFqh2kpY17oIVzm/aBB/UhO9MQPRBxtVkLSNBv7DC7DorjmlzgJZQ1tT
        VyzCeBuPUgxzR2K3I0n+XF2Nieiw2ulR++/S
X-Google-Smtp-Source: AMrXdXsS/dgY9e1GCBLOxP9hWlAxvr+wHa+R2wVZqHJzPgT5Z0EN6+R2fGy0/ziBt9AZuquxi3TPDA==
X-Received: by 2002:a17:907:86a5:b0:870:d4f3:61b3 with SMTP id qa37-20020a17090786a500b00870d4f361b3mr6574435ejc.12.1674007594143;
        Tue, 17 Jan 2023 18:06:34 -0800 (PST)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
        by smtp.gmail.com with ESMTPSA id kx1-20020a170907774100b0084d368b1628sm12702694ejc.40.2023.01.17.18.06.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Jan 2023 18:06:33 -0800 (PST)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     d-gole@ti.com, Jiasheng Jiang <jiasheng@iscas.ac.cn>
Cc:     robdclark@gmail.com, quic_abhinavk@quicinc.com, sean@poorly.run,
        airlied@gmail.com, daniel@ffwll.ch, marijn.suijten@somainline.org,
        vkoul@kernel.org, dianders@chromium.org, marex@denx.de,
        vladimir.lypak@gmail.com, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] drm/msm/dsi: Add missing check for alloc_ordered_workqueue
Date:   Wed, 18 Jan 2023 04:06:15 +0200
Message-Id: <167400670539.1683873.10074210279726951946.b4-ty@linaro.org>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230110021651.12770-1-jiasheng@iscas.ac.cn>
References: <20230110021651.12770-1-jiasheng@iscas.ac.cn>
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


On Tue, 10 Jan 2023 10:16:51 +0800, Jiasheng Jiang wrote:
> Add check for the return value of alloc_ordered_workqueue as it may return
> NULL pointer and cause NULL pointer dereference.
> 
> 

Applied, thanks!

[1/1] drm/msm/dsi: Add missing check for alloc_ordered_workqueue
      https://gitlab.freedesktop.org/lumag/msm/-/commit/e5237cd6ad68

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
