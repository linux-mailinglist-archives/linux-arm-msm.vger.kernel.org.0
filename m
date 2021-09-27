Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E615341A0B1
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Sep 2021 22:54:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237085AbhI0Uzy (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 27 Sep 2021 16:55:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35436 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237120AbhI0Uzq (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 27 Sep 2021 16:55:46 -0400
Received: from mail-ot1-x335.google.com (mail-ot1-x335.google.com [IPv6:2607:f8b0:4864:20::335])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3733BC061771
        for <linux-arm-msm@vger.kernel.org>; Mon, 27 Sep 2021 13:54:06 -0700 (PDT)
Received: by mail-ot1-x335.google.com with SMTP id r43-20020a05683044ab00b0054716b40005so19289438otv.4
        for <linux-arm-msm@vger.kernel.org>; Mon, 27 Sep 2021 13:54:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=MGYW2K0iuLK8RkBAXf2F5PgItucjdLFQiH7EkOY3vGw=;
        b=cBFf9BO83URzKYyMTmgPq43hBPhyJkeo8LtgtCbhO9EVCY6L10n/pMfWRdiVlKBkdd
         6w+VEL9jFqKoUKYNMvHzNF3sxsJ+oVX7LBcD89sr/REhe2heiK4yqHhroxcQNmKgZ6Ff
         spI9/s7iNlN2uXQ3cfkESDZDb1PukerJF/3mM3Zc+wZW+XGU/nUL+X9k0f4wGj3IKF0+
         dkHz5ORUqhubXWJSlKkeCMj9/FSAOs6W5Sy7h9+7hvuGlk2iz6/2+tRFauLMEMIC9Dyr
         PI7GxkCqoCO1mVwlOaIdFrTCMhHbi6eyysFnI6moIUPjHUIG97MOASHwh8aEDYfFpbF+
         ZGlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=MGYW2K0iuLK8RkBAXf2F5PgItucjdLFQiH7EkOY3vGw=;
        b=L30EBfv8VBh766KIgJTGnCZY/4Ab8+H0GGSg+o2wwCv0b8SZ1sacKAdBOqC4GMunkm
         2BYDx/HbLv8g6JfUutExKoGpmLTP+jIbO1lEwHP6xHc9Gq6oW4ICqhdFl0FZ1frlhRWv
         w6E+tC2CyFDW1noaUF3J2weUHkP/czQIJ6r7+45LJIsL8hxqcxRXrUDFXDbHtgu7sAit
         OxCNt67SrlOkqrL6ZCclQE8n+bi9ZMAyo2+gRimUvXF46Q7dU6zLOATqbzQkqSJak8QD
         81oiIu3yG73IsT6eUv8fP8JTa+mmzNQ4pKDDmdF7ZjNVll76AXvvYl9mZQPdC3ykd+Db
         px5w==
X-Gm-Message-State: AOAM533cjELE6P7n2iF3NztQttXjPLoZjKmq/EBvQCuFBduSZj12HWQ/
        5ZPGWf8Qa+CGbvmXteLucJZxCQ==
X-Google-Smtp-Source: ABdhPJx/pQIOSrHgQjJiLg69yRsvaUhSv8d5bYzxxsuy6moK/+MVgcvqHbjUTe8Mk3IlEJQ3gRMlRQ==
X-Received: by 2002:a05:6830:200d:: with SMTP id e13mr1849537otp.341.1632776045599;
        Mon, 27 Sep 2021 13:54:05 -0700 (PDT)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id l2sm455543otl.61.2021.09.27.13.54.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Sep 2021 13:54:05 -0700 (PDT)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     robh+dt@kernel.org, Sibi Sankar <sibis@codeaurora.org>,
        mka@chromium.org, swboyd@chromium.org
Cc:     rjw@rjwysocki.net, mathieu.poirier@linaro.org,
        ulf.hansson@linaro.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, ohad@wizery.com,
        rishabhb@codeaurora.org, sidgup@codeaurora.org,
        devicetree@vger.kernel.org, dianders@chromium.org,
        linux-remoteproc@vger.kernel.org, agross@kernel.org
Subject: Re: (subset) [PATCH v7 02/13] dt-bindings: remoteproc: qcom: pas: Add QMP property
Date:   Mon, 27 Sep 2021 15:54:02 -0500
Message-Id: <163277598156.1471158.10663016354664633920.b4-ty@linaro.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <1631800770-371-3-git-send-email-sibis@codeaurora.org>
References: <1631800770-371-1-git-send-email-sibis@codeaurora.org> <1631800770-371-3-git-send-email-sibis@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, 16 Sep 2021 19:29:19 +0530, Sibi Sankar wrote:
> The load state power-domain, used by the co-processors to notify the
> Always on Subsystem (AOSS) that a particular co-processor is up/down,
> suffers from the side-effect of changing states during suspend/resume.
> However the co-processors enter low-power modes independent to that of
> the application processor and their states are expected to remain
> unaltered across system suspend/resume cycles. To achieve this behavior
> let's drop the load state power-domain and replace them with the qmp
> property for all SoCs supporting low power mode signalling.
> 
> [...]

Applied, thanks!

[02/13] dt-bindings: remoteproc: qcom: pas: Add QMP property
        commit: e73c632b18a936b5489068d2418a58ea95b49469

Best regards,
-- 
Bjorn Andersson <bjorn.andersson@linaro.org>
