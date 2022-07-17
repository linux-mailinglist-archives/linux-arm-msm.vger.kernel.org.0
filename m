Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EF30D5773DE
	for <lists+linux-arm-msm@lfdr.de>; Sun, 17 Jul 2022 05:48:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232873AbiGQDsP (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 16 Jul 2022 23:48:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58880 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230003AbiGQDsI (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 16 Jul 2022 23:48:08 -0400
Received: from mail-oa1-x33.google.com (mail-oa1-x33.google.com [IPv6:2001:4860:4864:20::33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1F10E17A8C
        for <linux-arm-msm@vger.kernel.org>; Sat, 16 Jul 2022 20:48:07 -0700 (PDT)
Received: by mail-oa1-x33.google.com with SMTP id 586e51a60fabf-10bd4812c29so15714323fac.11
        for <linux-arm-msm@vger.kernel.org>; Sat, 16 Jul 2022 20:48:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=21HY6wtQkPpfHZFWbTa1qvE3zEmY6IOji3PebPAf2LQ=;
        b=bXo2IQlDVKcOFaIH1yTcLSmJgZp7Kecvs+uL31en3QWnmh+vQxvOYgRdAN9+BD2cb6
         zrA2sBxbony9HyHcTYLVAuMn6njcPP1kb7ynSX9faXXxqVjbqyN8ZlSM1Jm0kmHd9IPp
         wcmfWaiIb3BdZfENiEo5UGOVXLXaKE8fyTJNK+DxDGDo2L+qZn7UdvVyjKaxIKLGjioz
         0EVcjFa7/DM4gr+LWir8I842j3evv/7KHOD0vxcuc37FkzFPQ/L0z7qXm++r4DKMY2Is
         fTXJztpomi7COkPo1P9vbvQZVcjbJ+tepYIQ2w1Hnwe6/A0oPK1/tZhOfec2iAhSpEvX
         mVpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=21HY6wtQkPpfHZFWbTa1qvE3zEmY6IOji3PebPAf2LQ=;
        b=dtUi1fzkZZdtVuMbh7NyvqxGi7lTho3A16CZujUwjXoxp92vRdKyQTJY68D5HFfyYT
         3hfvw3TPwV3Je3dkX0xmFc6q6bBhl7r5BUsncv1S077m1Ngvlb3jA6ACkgdsdHrVgOBX
         K5V7yl7HX0u7LqWJrhJ65HNO6insgj25wHpJVnuzeZTlyXxuw7/Y9H2ZvsKtpdLlTT4g
         CUtVMTCIU5qSHmLs9Dkqf57AnIfldCi45BEnLMArSd1YBYxprPbZ0jIRL92dxqp2KMtK
         iWJIZ3XcBQ8aon7KgyOPrFQ0EtPNgmx3j6uCdCUKEdzPNuTjXqA+Kob93fB5n5HAIoQL
         lKdA==
X-Gm-Message-State: AJIora/8TVnHRfRSVk63ScGD19o+5pKJaX8hgvkuL4kiqVfIujji7bjM
        C1Ol8xxwqCsjzG9HsSlES2PmzQ==
X-Google-Smtp-Source: AGRyM1vUXPqKpA3j1kJ9W3eCSQbkpxW5XsuAg+p2hZ2dj/OQ74TkuMJpU/O6VVmho4mMOW7a14HciA==
X-Received: by 2002:a05:6808:23d4:b0:33a:1441:bf0 with SMTP id bq20-20020a05680823d400b0033a14410bf0mr13921813oib.26.1658029686511;
        Sat, 16 Jul 2022 20:48:06 -0700 (PDT)
Received: from ripper.. (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id e65-20020aca3744000000b0033a169f9282sm3004515oia.52.2022.07.16.20.48.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 16 Jul 2022 20:48:05 -0700 (PDT)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Vinod Koul <vkoul@kernel.org>, Wolfram Sang <wsa@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 0/3] i2c: qcom-geni: Make it possible to run i2cdetect
Date:   Sat, 16 Jul 2022 20:50:24 -0700
Message-Id: <20220717035027.2135106-1-bjorn.andersson@linaro.org>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Attempting to run i2cdetect shows that error handling in the GENI I2C driver
could be better.

The first issue is that errors aren't returned from the driver. Following this
is an issue that if a timeout occurs the current operation is aborted, but the
abort code races with the isr so the abort times out as well. Lastly when this
happens, the driver is quite noisy, making it impossible to run i2cdetect on
the serial console.

With this series in place, I was able to run i2cdetect on the db845c and two
sc8180x devices - and get useful output.

Bjorn Andersson (3):
  i2c: qcom-geni: Use the correct return value
  i2c: qcom-geni: Propagate GENI_ABORT_DONE to geni_i2c_abort_xfer()
  i2c: qcom-geni: Silence NACK and GENI_TIMEOUT

 drivers/i2c/busses/i2c-qcom-geni.c | 22 ++++++++++++++++------
 1 file changed, 16 insertions(+), 6 deletions(-)

-- 
2.35.1

