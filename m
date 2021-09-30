Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3623E41DBB0
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Sep 2021 16:00:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1351624AbhI3OCK (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 30 Sep 2021 10:02:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57348 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1351623AbhI3OCJ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 30 Sep 2021 10:02:09 -0400
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com [IPv6:2a00:1450:4864:20::12c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 91E3CC06176A
        for <linux-arm-msm@vger.kernel.org>; Thu, 30 Sep 2021 07:00:26 -0700 (PDT)
Received: by mail-lf1-x12c.google.com with SMTP id i25so25739997lfg.6
        for <linux-arm-msm@vger.kernel.org>; Thu, 30 Sep 2021 07:00:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=CEEjR1bGgkvoMjAM+j1fmPm8gGFZpeKZvM7Zf9RxxRQ=;
        b=ZgPehbikJwO1ZUB59sLHg5iNekNUb7c5T56/59wkDXEBS9TzPgz3qb6rJ7OHtSukNK
         H39PNaQdLGDMri07VB2/l81zrVtBft37JINSkwrzUXXAFV6F9MzVoxAkMrvAC7MPaf/g
         zFHGjTkNOkJoioA7AmO7G3lTzF0aKflLvqIwN5PQ/z6aOPHegxGUHCRq9cVS6iV3S1b7
         QPmxriudM2DJIQ4hwf+b0q2cTem9zzyERZgMcRR2bq5Oi1dZJVBP655dB6JAtLhC7D/M
         Y5e+8StlfNJQRbHhovArdbMcCvZLYn6bdcaCP/7Kc4roItnncrxFTBHvnWzxzNUK99rX
         Ay2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=CEEjR1bGgkvoMjAM+j1fmPm8gGFZpeKZvM7Zf9RxxRQ=;
        b=hFJubP9+L5SrskhanKKw7Ao9NeSgvVNZNXthd3ufIohEXF6BZwIxVGKOH8WRzNgBE+
         km1RV7OGC8s/JmZg/7oQ4ZknLvJ3prKCoxOQyzmQjgC2jxzSL363A/k7hcp7X5+fANR+
         JML2I6Bdx6HE/a2BoSCW+4YRfWRe16vYnUfH6ROmP9yq+lFykUfcjtGKUknxLqRL1RYn
         pxZd3dnT1WYOgDTzdxQbXDOVzA7HY0IcpXS/MUIysz7y/Vnk/U8m6EgRIFTbXf6YKyEV
         LhrD9m+41yfdt+mcsUYTS7QRZKbxJ+ZYaqB6RvIU9boIsq25ZrdhIyOj+ttQHndoYBlO
         Dk2Q==
X-Gm-Message-State: AOAM532gUfIV/0Z1NlZ3mVa9qlBYOuIn6w1pwep0LTuxQCXXkDv0kOyo
        BJrCAocYFcn8YanCkZDfwVEiTA==
X-Google-Smtp-Source: ABdhPJx0rvQC/RiXJ/67ZLP3GcS4vwesSN2ts19blA5Y7BHQOoTuqKGnyPA9b2cv7fH6+udokM5NPg==
X-Received: by 2002:ac2:5c11:: with SMTP id r17mr5988459lfp.191.1633010419615;
        Thu, 30 Sep 2021 07:00:19 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id o7sm380481lfr.216.2021.09.30.07.00.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Sep 2021 07:00:18 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <abhinavk@codeaurora.org>
Cc:     Jonathan Marek <jonathan@marek.ca>,
        Stephen Boyd <sboyd@kernel.org>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
Subject: [PATCH 00/11] drm/msm/dpu: cleanup plane state
Date:   Thu, 30 Sep 2021 16:59:51 +0300
Message-Id: <20210930140002.308628-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

This is a cleanup part of the DPU multirect patchset [1], split away to
ease review and merging per Abhinav's request.

Currently significant part of atomic plane state is stored in the
drm_plane's subclass rather than drm_plane_state's subclass. Move it
either to the drm_plane_state or even to the on-stack allocation.

[1] https://lore.kernel.org/linux-arm-msm/20210705012115.4179824-1-dmitry.baryshkov@linaro.org/


