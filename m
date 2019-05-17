Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5E60321F5B
	for <lists+linux-arm-msm@lfdr.de>; Fri, 17 May 2019 23:09:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727183AbfEQVJZ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 17 May 2019 17:09:25 -0400
Received: from mail-pl1-f169.google.com ([209.85.214.169]:41024 "EHLO
        mail-pl1-f169.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727001AbfEQVJZ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 17 May 2019 17:09:25 -0400
Received: by mail-pl1-f169.google.com with SMTP id f12so3873048plt.8
        for <linux-arm-msm@vger.kernel.org>; Fri, 17 May 2019 14:09:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=5Osr4IBLKvqeoGIhILlOabAONYWC6fq+a0u3OcWitsE=;
        b=JD5n94i4mKalDB7/QIq6hwmxfHuc3LPfFo3nTv1rqK5hcqf3iPDGRh1EFIOki0v4Wa
         5eB4nDxybuOB6dUKwutNbxeO8PCEk7HcsT+DbzAoAr2P5dE8pFYxEVgZyzl4G6ZaPCbe
         hHCRMa8UyiV0LV6JwjoUeakRGvd8LWKz2nEZg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=5Osr4IBLKvqeoGIhILlOabAONYWC6fq+a0u3OcWitsE=;
        b=JKqzO3BZhJLKSjAcJREqwJpUEi/0c2C2AadfPss5ZG/AwZbjPXd7N1zbzkH+bxtPrz
         dC8G9RnKpfQuXr5IQcrqk9hWG/W35fdp6yqZgjD9eFNT4bXPQTjeSGuKBXgYyHuvGF7b
         TpbpM/Gy6bsm1d6G+cKSZbRO/Fm+bjsO7FrYmPsX/PVj7C7g9F8CopNmnfuE06iUauA7
         COVBgVuTM3AEGfJ4kiO7k5beakCa5Puy6uxSRUWz2WznaftCgoqvAMN1E00q+ZLiUWf4
         baroWU8Uif7O+8ZLEVBMC1LMDCr8UNAfGCjtu4bW0DwAzc4PWSjRW3BZq/qmMG9eliJH
         8mJw==
X-Gm-Message-State: APjAAAWflbJghXQnsWU/aqGRSwAPMddAgrU0m4B7/RDK9NxF6odsFysQ
        UE8t+GtClcuWZEHZUZahJ+UdrQ==
X-Google-Smtp-Source: APXvYqxEO2VhzyiHpSv9o0CI0H1knnTnrlTCtf/zuChtA/femWc3y8FZABEnlw2/tjPIL9gPSU6oDQ==
X-Received: by 2002:a17:902:aa95:: with SMTP id d21mr4553546plr.32.1558127364718;
        Fri, 17 May 2019 14:09:24 -0700 (PDT)
Received: from smtp.gmail.com ([2620:15c:202:1:fa53:7765:582b:82b9])
        by smtp.gmail.com with ESMTPSA id q142sm7890448pfc.27.2019.05.17.14.09.23
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 17 May 2019 14:09:24 -0700 (PDT)
From:   Stephen Boyd <swboyd@chromium.org>
To:     Andy Gross <agross@kernel.org>
Cc:     linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
Subject: [PATCH 0/3] qcom_scm: Fix some dma mapping things
Date:   Fri, 17 May 2019 14:09:20 -0700
Message-Id: <20190517210923.202131-1-swboyd@chromium.org>
X-Mailer: git-send-email 2.21.0.1020.gf2820cf01a-goog
In-Reply-To: <23774.56553.445601.436491@mariner.uk.xensource.com>
References: <23774.56553.445601.436491@mariner.uk.xensource.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

This patch series fixes some DMA mapping problems reported
in the qcom SCM driver. I haven't tested these patches at all
so it could be totally broken. If someone can test them for
me I'd appreciate it. Otherwise, I'll spend some time dusting
off modem loading code to see if it works.

Stephen Boyd (3):
  firmware: qcom_scm: Use proper types for dma mappings
  firmware: qcom_scm: Cleanup code in qcom_scm_assign_mem()
  firmware: qcom_scm: Fix some typos in docs and printks

 drivers/firmware/qcom_scm.c | 47 +++++++++++++++++++------------------
 include/linux/qcom_scm.h    |  9 +++----
 2 files changed, 29 insertions(+), 27 deletions(-)


base-commit: e93c9c99a629c61837d5a7fc2120cd2b6c70dbdd
-- 
Sent by a computer through tubes

