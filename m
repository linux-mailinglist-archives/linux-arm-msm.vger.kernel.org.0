Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 154453A1ED1
	for <lists+linux-arm-msm@lfdr.de>; Wed,  9 Jun 2021 23:18:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229536AbhFIVU2 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 9 Jun 2021 17:20:28 -0400
Received: from mail-lf1-f52.google.com ([209.85.167.52]:36680 "EHLO
        mail-lf1-f52.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229578AbhFIVU2 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 9 Jun 2021 17:20:28 -0400
Received: by mail-lf1-f52.google.com with SMTP id v22so38933709lfa.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 09 Jun 2021 14:18:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=7I80h9aVhqiz7KKnY4LfQ8riY+ihQMK3yCgtkJKzH/0=;
        b=fv1cLJSI3524YDZiumnkJfXc6sFqc6WWnUb1zi0ZoQ6nZx8UbjsJRkvdH4d0t52wAU
         RkQ/tclAVDbWuPCy+RcYD3+7hvMy9LWZgGEREbMEmL29hRg6J+j5DyOPjr7CUZgfGAZC
         fXiTMeGeEKjOWpvz2dhFDlOEfPDTKXNC1naJ8DBq8/NyhLOeIy2ePURzarCgMa7QpGG6
         KfWRWePz5EN1EV7OTWXV1nxNRjdfCFezqlI72OoRxfj1qNBfV4zKIEgHm9GKMkr2tkPL
         OgbGUun88yDH+/Ml9C5z2iF1J0yn73tKmMPfYZWR4LZCH6aZ9iJD83+WQ6frZ+BHomzV
         7DOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=7I80h9aVhqiz7KKnY4LfQ8riY+ihQMK3yCgtkJKzH/0=;
        b=DSOdnO1BHzR0z6MfCwfMp3nH8axHp2yxszDN5qsGqEqmL4nPpk3T6GyMAzDggJnkBn
         Qs86GKjbCUAcbtzxna/fBLeFxfkmhE2gBf9UWeGYGWnDDneg/7QwOBweqGRoXLaE2Ba3
         HdFrrsRRSwXW+CFfh08udxVQewakW7JqlCfjvfW8ldLUwB+ymNapjFR/nwyE9qmFr+Gm
         hnCN3x034asH6ASmwRgRgFGkc+l3CjkcRaYxU+3kv0xt6Nzb8vJBsyKMw/1axB6zNSSw
         NAxlFdVBPXIG2tmvUAg//suFpB2mGrKjxOX1GDRSZwPkjUGicSB5oj1zqIUSUBTi8ipX
         kGoQ==
X-Gm-Message-State: AOAM531BKhgJpuAdqtuAX+RbYYryIWR2riPgSVJLZt7+jcYqANjG25My
        a2zsB8PSJBwfTXkKg6R5IhEqFg==
X-Google-Smtp-Source: ABdhPJzljl9x2hLLYMZTN0snwVTcfT0Bx/Khf4JdiNZLWRQ15EdGWpJs3mYvySS2N7/VnbAZfH4JXQ==
X-Received: by 2002:a05:6512:20d9:: with SMTP id u25mr866893lfr.452.1623273450612;
        Wed, 09 Jun 2021 14:17:30 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id z20sm95329ljk.50.2021.06.09.14.17.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Jun 2021 14:17:30 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <abhinavk@codeaurora.org>
Cc:     Jonathan Marek <jonathan@marek.ca>,
        Stephen Boyd <sboyd@kernel.org>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
Subject: [RFC 6/6] drm/msm/kms: drop set_encoder_mode callback
Date:   Thu, 10 Jun 2021 00:17:23 +0300
Message-Id: <20210609211723.2565105-7-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210609211723.2565105-1-dmitry.baryshkov@linaro.org>
References: <20210609211723.2565105-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

set_encoder_mode callback is completely unused now. Drop it from
msm_kms_func().

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/msm_kms.h | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_kms.h b/drivers/gpu/drm/msm/msm_kms.h
index 086a2d59b8c8..9484e8b62630 100644
--- a/drivers/gpu/drm/msm/msm_kms.h
+++ b/drivers/gpu/drm/msm/msm_kms.h
@@ -117,9 +117,6 @@ struct msm_kms_funcs {
 			struct drm_encoder *encoder,
 			struct drm_encoder *slave_encoder,
 			bool is_cmd_mode);
-	void (*set_encoder_mode)(struct msm_kms *kms,
-				 struct drm_encoder *encoder,
-				 bool cmd_mode);
 	/* cleanup: */
 	void (*destroy)(struct msm_kms *kms);
 
-- 
2.30.2

