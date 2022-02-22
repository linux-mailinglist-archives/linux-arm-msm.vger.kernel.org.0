Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5108C4BF944
	for <lists+linux-arm-msm@lfdr.de>; Tue, 22 Feb 2022 14:28:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232408AbiBVN3I (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 22 Feb 2022 08:29:08 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55964 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230481AbiBVN3H (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 22 Feb 2022 08:29:07 -0500
Received: from smtp-relay-internal-0.canonical.com (smtp-relay-internal-0.canonical.com [185.125.188.122])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2042195A12
        for <linux-arm-msm@vger.kernel.org>; Tue, 22 Feb 2022 05:28:42 -0800 (PST)
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com [209.85.208.69])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id A70893FCB1
        for <linux-arm-msm@vger.kernel.org>; Tue, 22 Feb 2022 13:28:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1645536520;
        bh=syQJnDJvIk7oDut501097JANOAQimJJ8XX+nOUPJjUo=;
        h=From:To:Cc:Subject:Date:Message-Id:MIME-Version;
        b=YZdE+DolrREevb0zwGrXXvuBiOo+hE83OFfSoWIpUETtURDN5fn9YhtmQYLtx7f0S
         pzxgGlJheFXYc7mtNiKR7XBCBnBcWaTOqh2ju09EUWuS2uz+zpPvmgYbeSXQfs0J/1
         pohdp6JZKR3UTRK72xk7kmaCzJM0bf48HIFq1y/FsVpIh3RSQis5UlvUKMHPlLJXJP
         AmBQ/UKs2gwdRD6iU3kro6n38TouxgMM1jzJwggqeuWhASnYS8/+WY4RNRJozo7Zvv
         +/MdxEDyJNd5hS3oXy3AhvQEPbBeJpduY3MshxO0P6NsmoDf/O3PxosxMaA3WgITgu
         SZUSLEyWTGqgw==
Received: by mail-ed1-f69.google.com with SMTP id n7-20020a05640205c700b0040b7be76147so11945147edx.10
        for <linux-arm-msm@vger.kernel.org>; Tue, 22 Feb 2022 05:28:40 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=syQJnDJvIk7oDut501097JANOAQimJJ8XX+nOUPJjUo=;
        b=a4KjdTNSMb/RTuJdW+ZVv3YylER3ohTXGsaZATrcEA1mQerwMpdBRxtz92mhQ4Qe2b
         FXD4pjH7/izAmJ5sxOlRcUVPGH0eZYjINBIkuE9WgXP7XwxeQw7wf0WXRkgtma3zgLJX
         bgv01OpTzsDrT9yQ+SdnIoO4TDgxQgz5SPI7UTUE5Mme6FH/C06SbSVoJ2Rlinrm2lge
         cCs51XeaY/qZHNkAn7NhUxmiddfBd84fUd5A0Macxt/JDAXIqal6cs0wfDs+Nlol3eWg
         wyDLseNq1lL+hrlkxtXOoLsvSidEmfuXxMrzS9JOgRnHyT+u6YK03SAL02Ya3SciwUsH
         uOXg==
X-Gm-Message-State: AOAM532xF7JKBV0SzGZsYy50LtGp8FxaulSj+bSj81ErpEVR7XgcjXES
        ogmzuXut4mRbWM2mGtMkv3nftrSmb+RhCzAkivTABclN24zC6JP2/Vspgqj1cGguDwOatk1jkbv
        tXQyAtuwvz31Wx5aUi1U89iE/RHaSsSbSyjz22D2eH4U=
X-Received: by 2002:a17:906:d935:b0:6cc:fcfc:c286 with SMTP id rn21-20020a170906d93500b006ccfcfcc286mr19267951ejb.423.1645536520189;
        Tue, 22 Feb 2022 05:28:40 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzyrFfwlMx3wyhaWOiWMYUuCZ2Sd0V6lJlo9wHP9II92B5eFvZo3+bHsg4+GgnT5+leTtK+fA==
X-Received: by 2002:a17:906:d935:b0:6cc:fcfc:c286 with SMTP id rn21-20020a170906d93500b006ccfcfcc286mr19267945ejb.423.1645536520030;
        Tue, 22 Feb 2022 05:28:40 -0800 (PST)
Received: from localhost.localdomain (xdsl-188-155-181-108.adslplus.ch. [188.155.181.108])
        by smtp.gmail.com with ESMTPSA id c5sm10029875edk.43.2022.02.22.05.28.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Feb 2022 05:28:39 -0800 (PST)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To:     Abel Vesa <abel.vesa@nxp.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, alsa-devel@alsa-project.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Subject: [RFT PATCH 0/3] Fix kfree() of const memory on setting driver_override
Date:   Tue, 22 Feb 2022 14:27:04 +0100
Message-Id: <20220222132707.266883-1-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

Drivers still seem to use driver_override incorrectly. Perhaps my old
patch makes sense now?
https://lore.kernel.org/all/1550484960-2392-3-git-send-email-krzk@kernel.org/

Not tested - please review and test (e.g. by writing to dirver_override
sysfs entry with KASAN enabled).

Dependencies
============
Patches are independent.

Best regards,
Krzysztof

Krzysztof Kozlowski (3):
  clk: imx: scu: fix kfree() of const memory on setting driver_override
  slimbus: qcom-ngd: fix kfree() of const memory on setting
    driver_override
  rpmsg: fix kfree() of const memory on setting driver_override

 drivers/clk/imx/clk-scu.c       |  6 +++++-
 drivers/rpmsg/rpmsg_internal.h  | 12 ++++++++++--
 drivers/rpmsg/rpmsg_ns.c        | 13 +++++++++++--
 drivers/slimbus/qcom-ngd-ctrl.c |  9 ++++++++-
 4 files changed, 34 insertions(+), 6 deletions(-)

-- 
2.32.0

