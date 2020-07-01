Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B717F210B3B
	for <lists+linux-arm-msm@lfdr.de>; Wed,  1 Jul 2020 14:48:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730685AbgGAMr0 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 1 Jul 2020 08:47:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34854 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730677AbgGAMrX (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 1 Jul 2020 08:47:23 -0400
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com [IPv6:2a00:1450:4864:20::442])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3858CC03E979
        for <linux-arm-msm@vger.kernel.org>; Wed,  1 Jul 2020 05:47:23 -0700 (PDT)
Received: by mail-wr1-x442.google.com with SMTP id o11so23669428wrv.9
        for <linux-arm-msm@vger.kernel.org>; Wed, 01 Jul 2020 05:47:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=RppFHH3LPgV9Fbxkc7EFxUD1a+LbYIuGU1AKsrw/uFk=;
        b=xIDiEYklS6lSZpP6D9pgP0igi/DuLWfHQtgqSxQrazIxDKzatFbofzd5A2lxZECBRp
         xgjtQ9qigjPm2I9PvVxfMtgVOIO3zEMvCEvi853x8QO6KLsAr0R7mmgVIfL4RruJlql+
         xtvfOzVAj5ODP/aWq4ks/9xr7+uRNHZiDwRvvbfKMAlEFVGgBJ4MP7BztMTQk9lB1cy6
         pO6NX2PcayLNiR9Ei7AhrqSWZWqG5xjsk2bCLWAueBI1qbYBzRjjcpWOaGChQi+lfluF
         84QFziwLTyWWS1h3rphJzHL8TLCaYECg1Le1+RLbeX02xJMNoPAV4Pdm4iq52qPR7Z5X
         eakw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=RppFHH3LPgV9Fbxkc7EFxUD1a+LbYIuGU1AKsrw/uFk=;
        b=YZmU6byh3BeJV0NdzqKHBNym3SQPoAlgwvS+0dw7cnJSS4Q7lx/2MwZlT+QhQXGp5I
         cZAsmeJmFJNllUN0OwEROyZPbCU/c7PP0Lxa78ibvZusDs8Oyx7t4ajPGdrSScU7RpIo
         G4asbQZkD/9PZMDNoY+hm89V9sSY+/LeWTDDNZSwYLCGz/8jGK6zhzX2FW08PEGQjHKW
         W0uQHZ/mljU/qjCyGz09F7F/mIlZIZdoZdjd29TpmKXshyZI1rD7hqN8VwYlzQctvCcE
         1yunpX5/v64b1r0FXlu4NIaSZXEMXMUPDzL3wwmXnDO8KGN4Yz98K4vP9/MoGjW7Mn8T
         fLcg==
X-Gm-Message-State: AOAM5318n2tuTDqFeIKixQlJUKo/OksGIG9OJIM606D0giGjJP8N9nK2
        tWbKkuwGGO6TdNuJz/89mEHf5A==
X-Google-Smtp-Source: ABdhPJyC8rXxEDpXbOyCSZxcsN81UfnduDOhMYWpILYzv9Y/zpJP7ApdbBjcGjp+fUgrrteEcjr51Q==
X-Received: by 2002:a5d:6907:: with SMTP id t7mr26577073wru.329.1593607641927;
        Wed, 01 Jul 2020 05:47:21 -0700 (PDT)
Received: from localhost.localdomain ([2.27.35.144])
        by smtp.gmail.com with ESMTPSA id o29sm7817862wra.5.2020.07.01.05.47.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Jul 2020 05:47:21 -0700 (PDT)
From:   Lee Jones <lee.jones@linaro.org>
To:     ulf.hansson@linaro.org
Cc:     linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Lee Jones <lee.jones@linaro.org>,
        Adrian Hunter <adrian.hunter@intel.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-arm-msm@vger.kernel.org
Subject: [PATCH 13/15] mmc: host: sdhci-msm: Demote faux kerneldoc header down to basic comment block
Date:   Wed,  1 Jul 2020 13:47:00 +0100
Message-Id: <20200701124702.908713-14-lee.jones@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200701124702.908713-1-lee.jones@linaro.org>
References: <20200701124702.908713-1-lee.jones@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

__sdhci_msm_set_clock()'s function header is the only one in
kerneldoc format.  Which seems odd as it's not part of an
external API and isn't referenced anywhere else.  Seeing as
there has also been no attempt to describe the expected
function arguments either, we're going to assume that this is
not actually a bona fide kerneldoc use-case.

Fixes the following W=1 kernel build warnings:

 drivers/mmc/host/sdhci-msm.c:1595: warning: Function parameter or member 'host' not described in '__sdhci_msm_set_clock'
 drivers/mmc/host/sdhci-msm.c:1595: warning: Function parameter or member 'clock' not described in '__sdhci_msm_set_clock'

Cc: Adrian Hunter <adrian.hunter@intel.com>
Cc: Andy Gross <agross@kernel.org>
Cc: Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: linux-arm-msm@vger.kernel.org
Signed-off-by: Lee Jones <lee.jones@linaro.org>
---
 drivers/mmc/host/sdhci-msm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mmc/host/sdhci-msm.c b/drivers/mmc/host/sdhci-msm.c
index 0c02f8a2d11ab..7a574fc7635c4 100644
--- a/drivers/mmc/host/sdhci-msm.c
+++ b/drivers/mmc/host/sdhci-msm.c
@@ -1583,7 +1583,7 @@ static unsigned int sdhci_msm_get_min_clock(struct sdhci_host *host)
 	return SDHCI_MSM_MIN_CLOCK;
 }
 
-/**
+/*
  * __sdhci_msm_set_clock - sdhci_msm clock control.
  *
  * Description:
-- 
2.25.1

