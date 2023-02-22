Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EED0E69F6E8
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Feb 2023 15:44:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230454AbjBVOo4 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 22 Feb 2023 09:44:56 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55358 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232129AbjBVOoq (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 22 Feb 2023 09:44:46 -0500
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com [IPv6:2a00:1450:4864:20::32f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A22733B3C1
        for <linux-arm-msm@vger.kernel.org>; Wed, 22 Feb 2023 06:44:19 -0800 (PST)
Received: by mail-wm1-x32f.google.com with SMTP id iv11-20020a05600c548b00b003dc52fed235so5513311wmb.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 22 Feb 2023 06:44:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9dadzXX6cbudRfVYbEzwbLwspwzii5vVla/610fZmbs=;
        b=hFa4NWrU8gOj2iDh8IhqNZ/4xMtzeGQqR8dqpkeBWFrz/hEsxZCy+6AuAIYpIctTTP
         el3LjzRGeFJgFUmu3gJRQcxvYGQYQTx3J2hobKOfwc2re0fGryrolzPKrr1CrO1JYRGU
         i7Pwac0yeyVnCLqaJ9dE+sWKfEGAYowY69uPjHxsgxji61WFQj1JYGeXv1tPqUj5DU9e
         +65vUzuULmLf53iyjWDJ0n6Ii0bVUKaKzu1rRHxN5+LhsKjcqiKi+hScJAjzhMaqgV8J
         djTit/6lD3amGDUwE/v7Lkr3onwLnLwo1tnhQ0Fz+kEdpyAyf8zRdzO3Q3cG4fYaNfJU
         IxpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9dadzXX6cbudRfVYbEzwbLwspwzii5vVla/610fZmbs=;
        b=CIz1Y1kpQoDxRmdX9nHoK5KlaUPpKM7TpbttaCKrjQX63j+8dQYG//aEpxzjkRg7JE
         3vgNTviWgRnaYM3rHzRjqxgQaOifyEnN908sm9/mwZ6JBqtHx/L7Gl78vyYjrlqtHzYg
         mynNMf4+9l/eui5I3v9H5ucNExX7Flz1RIII4m5adSEZYM/j6T4kZHREqQGTKUEQB9h1
         /Ha/HwGIr/ukRzK9n/Mdex2m1ywajD11gVWPDL+C5RG0OEOQB8D8wfg75TVCMkTmoEu5
         D8cdU/1mhQD5n4f8Fp1M4Ofyuoa9Qa88noQ2rRxOTAOH4DW7O5ju9mm8XXYIDsIyTvgV
         iSuw==
X-Gm-Message-State: AO0yUKWNPHRsocUGOvwc/cwjI6ol+AdL3vf6f3fgdLo8eDtAj5Ap3a1Q
        OHzOXvpSA70/gkpLuOL5Yg3+ew==
X-Google-Smtp-Source: AK7set8DsU6sjRtMpPuWcz637xtbFugsLw0KdwPWGJIsjraqjYs2Eqm7QtVUEpsfQcLT1xvcIGs5tA==
X-Received: by 2002:a05:600c:4495:b0:3df:b5ae:5289 with SMTP id e21-20020a05600c449500b003dfb5ae5289mr6368054wmo.8.1677077057306;
        Wed, 22 Feb 2023 06:44:17 -0800 (PST)
Received: from krzk-bin.. ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id o10-20020a1c750a000000b003e7c89b3514sm5059776wmc.23.2023.02.22.06.44.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Feb 2023 06:44:16 -0800 (PST)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Vinod Koul <vkoul@kernel.org>,
        Bard Liao <yung-chuan.liao@linux.intel.com>,
        Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
        Sanyog Kale <sanyog.r.kale@intel.com>,
        linux-arm-msm@vger.kernel.org, alsa-devel@alsa-project.org,
        linux-kernel@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 2/2] soundwire: qcom: gracefully handle too many ports in DT
Date:   Wed, 22 Feb 2023 15:44:12 +0100
Message-Id: <20230222144412.237832-2-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230222144412.237832-1-krzysztof.kozlowski@linaro.org>
References: <20230222144412.237832-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

There are two issues related to the number of ports coming from
Devicetree when exceeding in total QCOM_SDW_MAX_PORTS.  Both lead to
incorrect memory accesses:
1. With DTS having too big value of input or output ports, the driver,
   when copying port parameters from local/stack arrays into 'pconfig'
   array in 'struct qcom_swrm_ctrl', will iterate over their sizes.

2. If DTS also has too many parameters for these ports (e.g.
   qcom,ports-sinterval-low), the driver will overflow buffers on the
   stack when reading these properties from DTS.

Add a sanity check so incorrect DTS will not cause kernel memory
corruption.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/soundwire/qcom.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/soundwire/qcom.c b/drivers/soundwire/qcom.c
index 79bebcecde6d..c296e0bf897b 100644
--- a/drivers/soundwire/qcom.c
+++ b/drivers/soundwire/qcom.c
@@ -1218,6 +1218,9 @@ static int qcom_swrm_get_port_config(struct qcom_swrm_ctrl *ctrl)
 	ctrl->num_dout_ports = val;
 
 	nports = ctrl->num_dout_ports + ctrl->num_din_ports;
+	if (nports > QCOM_SDW_MAX_PORTS)
+		return -EINVAL;
+
 	/* Valid port numbers are from 1-14, so mask out port 0 explicitly */
 	set_bit(0, &ctrl->dout_port_mask);
 	set_bit(0, &ctrl->din_port_mask);
-- 
2.34.1

