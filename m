Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 47F5A3A1ED0
	for <lists+linux-arm-msm@lfdr.de>; Wed,  9 Jun 2021 23:18:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229557AbhFIVUW (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 9 Jun 2021 17:20:22 -0400
Received: from mail-lj1-f178.google.com ([209.85.208.178]:36447 "EHLO
        mail-lj1-f178.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229536AbhFIVUV (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 9 Jun 2021 17:20:21 -0400
Received: by mail-lj1-f178.google.com with SMTP id 131so1716841ljj.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 09 Jun 2021 14:18:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=1zCciPfjCDK0bUeWvLT8irPH+1vMI76gijTtJqkeCmI=;
        b=GVfDi+nc4MLlj3Sz60tReOfY53esc9R2V2jRhO/qAz9R4k+KYqBdF0XMcGDrPTKtsb
         ivin8lKzTX+uNMXGDffbz47CgFqYNlbIpn2gUhx8R/FsqpLn3R2M9g3MFLpOc8+VO2dP
         bCgoUV/yMGUnQYzMkto71dJUM+Oi6VbUAJyxRMuJWNjSz76TgP7YBj//zLlfrKgKp5B/
         RjO00JfdMP5pKe7x8USSN9JG/LwYLgsp1Ro8Bt/3BWoSAiO25NKb0z9ozmqiCakU44H6
         f6gIBrNq7zh5BA4pdso9AyhuTJw7opCMNA7hAb12D9Bq4H4Mo4T4ocfZ8hBaYa4DTpq+
         20sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=1zCciPfjCDK0bUeWvLT8irPH+1vMI76gijTtJqkeCmI=;
        b=Kd4AFIHsufpCNHeGj86X0rv6e5r8teLbu0bs4AviRDsm3c7iZk4bXv85jB9w+TKotn
         J2+dbnvEAPk81YmI4rK65xNTmy0sbHgZMe9wD08EN1Tbd0cNOKiEUfRZpgpfoFaOzIRR
         jcic+3TclgUhIyH+eUqrQAd168jMm/Y33M1fshA1KRcqTiqihrtxn1if/zk0vR/+7w4Q
         EgV9on2GWgDWLGzIvOX2ics0dSzIN8HNeq5EPSr6VZ+p1QawFGrVpUkEb7NVDZ5YZFau
         eqEmlDwGIcug9eVNvXj/Zm303ez+1D6xnBBbjytfs2ESHmcCxU6eCv6yWrprsDsZNAqO
         mxYQ==
X-Gm-Message-State: AOAM530WppI9oBFE/3e1lCfo4AWVsX3w3SEPmk9tGhhni7k3LWOSd0Gh
        nTt3iFHhc6bvZBbNxQpwreAaCA==
X-Google-Smtp-Source: ABdhPJzaowpFeTB6zyqZ3x0ByY6vJrI3ahi3dPSYOy105iiVYEhyZ52xnFEfzhLY3p70uniq7bbfbw==
X-Received: by 2002:a05:651c:17a1:: with SMTP id bn33mr1268514ljb.275.1623273446021;
        Wed, 09 Jun 2021 14:17:26 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id z20sm95329ljk.50.2021.06.09.14.17.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Jun 2021 14:17:25 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <abhinavk@codeaurora.org>
Cc:     Jonathan Marek <jonathan@marek.ca>,
        Stephen Boyd <sboyd@kernel.org>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
Subject: [RFC 0/6] drm/msm/dpu: add support for idependent DSI config
Date:   Thu, 10 Jun 2021 00:17:17 +0300
Message-Id: <20210609211723.2565105-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

This patchseries adds support for independent DSI config to DPU1 display
subdriver. This results in ability to drop one of msm_kms_funcs
callbacks.

This code was tested on RB5 (dpu, dsi). Neither DP nor MDP5 changes were
tested (thus the RFC tag).


