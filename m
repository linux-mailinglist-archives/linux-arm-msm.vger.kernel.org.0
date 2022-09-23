Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 43B655E7F28
	for <lists+linux-arm-msm@lfdr.de>; Fri, 23 Sep 2022 17:59:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232797AbiIWP65 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 23 Sep 2022 11:58:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41286 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232915AbiIWP6f (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 23 Sep 2022 11:58:35 -0400
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com [IPv6:2a00:1450:4864:20::12b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 02735147CE7
        for <linux-arm-msm@vger.kernel.org>; Fri, 23 Sep 2022 08:57:53 -0700 (PDT)
Received: by mail-lf1-x12b.google.com with SMTP id a2so970095lfb.6
        for <linux-arm-msm@vger.kernel.org>; Fri, 23 Sep 2022 08:57:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=oMr0u4U4uB857JftbbkRJcLFLiEsse/bULU+XmmO99c=;
        b=DSFhUhEI5jIJ0l79fZ/RpiMJcCABCZt41//uZqQbhGP+SMHboZlWew64YaUL1Zt6N1
         WROtxtQ0pjiBJrz3Wwk+Z4gL6aQmsyhW2wZg/WwUBlp0wdev6ge4JNVSnEcEPt68091w
         cZGTSk4LWL3RB3uOZXbgOKMNCpVqIEBTwkJzSXYfiUAfKN96zhSkqOh2/hbanYKv6qYI
         kM5t9xA10/DXsmypKJulAM6TKIfLSMN67PwQ/1h6RDXckeoIKj4WEA+fnzbArU+kBCh1
         bQu6GcdEMfLxrIVD5Z1e3hxwW1meD2gZDnV8/5c3YFVQeKDDeWpq9kh4UORGoymDNHE3
         mSeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=oMr0u4U4uB857JftbbkRJcLFLiEsse/bULU+XmmO99c=;
        b=4KTTDS1K6/go18TclyQo4CsG6HBIhYVVeV0Rb+wLMzQBmGpfVJZJaWfxo9KO6+1t9P
         kR8faM4UVjiZh2rnlVzwQrz5za5BORiSV8Hmx1BkpWZOrcUvMlGFjpclTqG1YeMkywbL
         4BUzljSlUz44/wTPaAPle9dsPxmuAV8wIcfGasG0S02NcprO5ZsbICNILAPOOP92VRms
         aFyh5tU0rPhXQZT8jIxnTsINUD2XYypDLEx1f2PYUHafdrRFJxC+aX5oBoezNTJHE6fo
         JBAK4p7q5F1LZkLgAlPudhKvfFQ2GQQ8JRnXATa1Vvaj6v0m4fkOEx86HmTKsugBVN9a
         hrNg==
X-Gm-Message-State: ACrzQf2nsOM6Y/FqG9DWG+cLg3K3G0hvj+gvRyBBE9KDA/JKI+YVrfKA
        FWFB8mk+YZPXcmP3FdiohH29AYjvKrUG9g==
X-Google-Smtp-Source: AMsMyM6SHmdPjbUQmqQLrTntDA+yJrodNrgqKTD0Yq6Gwj0hUWQkPwkCKVr0Q4Ko35CpEspD8KIpAw==
X-Received: by 2002:a05:6512:1590:b0:49a:9db4:5a31 with SMTP id bp16-20020a056512159000b0049a9db45a31mr3367232lfb.667.1663948671660;
        Fri, 23 Sep 2022 08:57:51 -0700 (PDT)
Received: from krzk-bin.. (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id be17-20020a056512251100b0049a4862966fsm1502286lfb.146.2022.09.23.08.57.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Sep 2022 08:57:50 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        linux-arm-msm@vger.kernel.org, alsa-devel@alsa-project.org,
        linux-kernel@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 5/5] slimbus: qcom-ngd-ctrl: reinit the reconf completion flag
Date:   Fri, 23 Sep 2022 17:57:40 +0200
Message-Id: <20220923155740.422411-5-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220923155740.422411-1-krzysztof.kozlowski@linaro.org>
References: <20220923155740.422411-1-krzysztof.kozlowski@linaro.org>
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

Reinitialize the reconf completion flag when ngd registers are
not retainied or when enumeration is lost for ngd.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/slimbus/qcom-ngd-ctrl.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/slimbus/qcom-ngd-ctrl.c b/drivers/slimbus/qcom-ngd-ctrl.c
index 548dd7661334..e8ebfcd0655c 100644
--- a/drivers/slimbus/qcom-ngd-ctrl.c
+++ b/drivers/slimbus/qcom-ngd-ctrl.c
@@ -1136,6 +1136,12 @@ static int qcom_slim_ngd_power_up(struct qcom_slim_ngd_ctrl *ctrl)
 		return 0;
 	}
 
+	/*
+	 * Reinitialize only when registers are not retained or when enumeration
+	 * is lost for ngd.
+	 */
+	reinit_completion(&ctrl->reconf);
+
 	writel_relaxed(DEF_NGD_INT_MASK, ngd->base + NGD_INT_EN);
 	rx_msgq = readl_relaxed(ngd->base + NGD_RX_MSGQ_CFG);
 
-- 
2.34.1

