Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 35B9E32B245
	for <lists+linux-arm-msm@lfdr.de>; Wed,  3 Mar 2021 04:48:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242048AbhCCBPO (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 2 Mar 2021 20:15:14 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35034 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1577804AbhCBJym (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 2 Mar 2021 04:54:42 -0500
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com [IPv6:2a00:1450:4864:20::62a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 50AECC06178A
        for <linux-arm-msm@vger.kernel.org>; Tue,  2 Mar 2021 01:54:01 -0800 (PST)
Received: by mail-ej1-x62a.google.com with SMTP id jt13so34097894ejb.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 02 Mar 2021 01:54:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=7j7OEM/ymaPJfAqZdVgfn2Lno1HYW5rb20Fl48M4KC0=;
        b=w0I0jEwBaURpdTtjfwqPY8SsrsFt+1IbGa5hPfPk1jVQHD7a3HTGX31iApDo+WzAcb
         U2QaNp8FsSNSbBdiK2MgKweKoE9+rmH0tc8AXXlTxIYE24bpEiPdEr+InxUgfoE62KEc
         Kb/mY+A8zsW4GP7lnOH+yRSo0WUDiuF+sfGz07AoiY4cPp5uLV7RylttFiBNqAh6cf/P
         4i8uqf6ARpAAtEYkeS8JqNgyjQ38ASJcXr3YN56PVgC9PiscS3k/KHbdzwZ8Hdv1pn06
         QrG1Csf9vhF+OM6QRvVHXuEzNXT3vgtvR5l15A6KWkES+Y8MzBlh1wbBlP5AQ8/mp3hI
         m7wQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=7j7OEM/ymaPJfAqZdVgfn2Lno1HYW5rb20Fl48M4KC0=;
        b=KtSUUHO8O/M9FBCPkjqjfB1cZH3E0VoRS3DqUfnopZ5IuaPtataLd4O7So8bPwInk0
         QnEbvxInZqvUWa1KNiDO0bc+ewwSazWf0rCK6kbRpbMSqFBlzDeyGbk9etjziONs9zPX
         t+0TOg4+nHsu1/TQ3autaZ4v6tMhIQAEqax9WnYRmo13uqldVtm387eP17uFzp5jXboC
         tDC3d8pzDzXS9VCjJHIGeb7gXyPKLDFHDRGccnG6rYCkd6SYFv8deCZuUvLx+VUyZ10y
         zF5VdQOfCL0sQVvpC2TS4l0EUZ4u3Y1/yATC0+OEBd26a3+ZF38bCH0ox1VODG2wEgyV
         mJdw==
X-Gm-Message-State: AOAM531W1mW45bbq5pBSGbOf/fi7HX4ZiBYvsBdlI6VRtDt+4nnmPdKT
        kGnvokI1QHeQ8gzJwPLVhpcjIA==
X-Google-Smtp-Source: ABdhPJwGnIWYOZ6GGtyYRsVQX+UxoCX2/f1dF03MVr81u2TRpqq9+TEauPF2Vd6h1fUkxC2H/resAQ==
X-Received: by 2002:a17:906:780b:: with SMTP id u11mr20085171ejm.492.1614678839966;
        Tue, 02 Mar 2021 01:53:59 -0800 (PST)
Received: from localhost.localdomain (hst-208-217.medicom.bg. [84.238.208.217])
        by smtp.gmail.com with ESMTPSA id be27sm2530535edb.47.2021.03.02.01.53.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Mar 2021 01:53:59 -0800 (PST)
From:   Stanimir Varbanov <stanimir.varbanov@linaro.org>
To:     linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Cc:     Ezequiel Garcia <ezequiel@collabora.com>,
        nicolas.dufresne@collabora.com,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>
Subject: [PATCH v3 0/2] Intra-refresh period control
Date:   Tue,  2 Mar 2021 11:53:38 +0200
Message-Id: <20210302095340.3584204-1-stanimir.varbanov@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

This series add a new intra-refresh period control for encoders. The
series is a continuation of [1]. Comments addressed:
 * A typo in .rst (Hans)
 * Clarified the relationship with CYCLIC_INTRA_REFRESH_MB (Hans)

Comments are welcome!

regards,
Stan

[1] https://www.spinics.net/lists/linux-media/msg183019.html

Stanimir Varbanov (2):
  media: v4l2-ctrls: Add intra-refresh period control
  venus: venc: Add support for intra-refresh period

 .../media/v4l/ext-ctrls-codec.rst             | 12 ++++++++
 drivers/media/platform/qcom/venus/core.h      |  1 +
 drivers/media/platform/qcom/venus/venc.c      | 28 +++++++++++++++++++
 .../media/platform/qcom/venus/venc_ctrls.c    | 13 ++++-----
 drivers/media/v4l2-core/v4l2-ctrls.c          |  2 ++
 include/uapi/linux/v4l2-controls.h            |  1 +
 6 files changed, 50 insertions(+), 7 deletions(-)

-- 
2.25.1

