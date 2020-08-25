Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 65ECE251DBF
	for <lists+linux-arm-msm@lfdr.de>; Tue, 25 Aug 2020 19:02:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726257AbgHYRB7 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 25 Aug 2020 13:01:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57286 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726294AbgHYRB5 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 25 Aug 2020 13:01:57 -0400
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com [IPv6:2a00:1450:4864:20::441])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 82990C061757
        for <linux-arm-msm@vger.kernel.org>; Tue, 25 Aug 2020 10:01:56 -0700 (PDT)
Received: by mail-wr1-x441.google.com with SMTP id c15so13465886wrs.11
        for <linux-arm-msm@vger.kernel.org>; Tue, 25 Aug 2020 10:01:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=QNXnwR9p0uhARPXD5IdPdhRimuwkBpCRHZXkkYzIxeQ=;
        b=meuU0Zkwwy7TRrTbdm6LUcRa5e3YU5RgQBubXJ47ZT+Lsi5779G+F1X6eYeme2O5ZK
         p2YXUVA6EPBOQJ8xCp+iAq2xzLrx7ZKTIVrya5CPfG16nKyhpqBoYZgvIxvm/5K6Z2r+
         78/DCncRswMvj1HScNrlpYXIKlojHDrvV4lbdROLjNgQmsOqTzU7CCGF1OeJzpJauMJw
         dyqSZ/VXsQS0r5Nd4I+aB01EtTbUVdKSOe9ikHjB4+c1fu583F6SwzIn8WMgR0rZ95Hl
         QJdygPc1CUeEDPE9zxO72ecB2l+o4UkJTKXeXJT1vAMzMMn/x/zn5KC51P70XrXvFdPP
         r45Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=QNXnwR9p0uhARPXD5IdPdhRimuwkBpCRHZXkkYzIxeQ=;
        b=Hm24nFNP2z+HEIGKG75mFWazvjYZYVW9lyvKRIoRhA8Z8K4k3qMaIfu0ZNictdomBO
         jBGOsT4n1PqWDgh/uU5ak3WqKqvcS4R4EZ5CPJOF22whLuyVc0SHFMEph/GC4YFc3C47
         UchOQ3BZCbRzguctFEG7rS/WIwyQFgOF1eg9G9WhSxM26NDFCCRFJBYcherrYKHW2rrT
         DHMisjITvbUl+fTUsFgXnqmXONB+Z42ow1nRlipU/zuk01LM+WTPSi3xVCC2yhJS5DS5
         HrZog5Ll6dDq6vQSXvswad9OhpCMrQfswfZq/TNV3tfM6jkiZE590FF6OpqWJj6ou8Lo
         zwzA==
X-Gm-Message-State: AOAM533AO07D+SJRMqv2EPPz0chG7tBy8czzwU06v6KN/0CUzaS3aZda
        srYGhfyPDD6ZIPsZ3pArnWuRog==
X-Google-Smtp-Source: ABdhPJygtIjUoGytXl0pS2x7kihR5qpo/+T9Ab3cspeev/uMhVEEZfjD6nvOU54rZeDnoPpVpNhnRA==
X-Received: by 2002:adf:e78e:: with SMTP id n14mr10900629wrm.357.1598374915151;
        Tue, 25 Aug 2020 10:01:55 -0700 (PDT)
Received: from localhost.localdomain ([212.45.67.2])
        by smtp.googlemail.com with ESMTPSA id y17sm6669008wma.17.2020.08.25.10.01.53
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 25 Aug 2020 10:01:54 -0700 (PDT)
From:   Georgi Djakov <georgi.djakov@linaro.org>
To:     linux-pm@vger.kernel.org
Cc:     saravanak@google.com, mdtipton@codeaurora.org,
        okukatla@codeaurora.org, bjorn.andersson@linaro.org,
        vincent.guittot@linaro.org, akashast@codeaurora.org,
        georgi.djakov@linaro.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v3 1/3] interconnect: Add get_bw() callback
Date:   Tue, 25 Aug 2020 20:01:50 +0300
Message-Id: <20200825170152.6434-2-georgi.djakov@linaro.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200825170152.6434-1-georgi.djakov@linaro.org>
References: <20200825170152.6434-1-georgi.djakov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The interconnect controller hardware may support querying the current
bandwidth settings, so add a callback for providers to implement this
functionality if supported.

Signed-off-by: Georgi Djakov <georgi.djakov@linaro.org>
---
 include/linux/interconnect-provider.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/include/linux/interconnect-provider.h b/include/linux/interconnect-provider.h
index 4735518de515..520f70fe5a31 100644
--- a/include/linux/interconnect-provider.h
+++ b/include/linux/interconnect-provider.h
@@ -38,6 +38,7 @@ struct icc_node *of_icc_xlate_onecell(struct of_phandle_args *spec,
  * @aggregate: pointer to device specific aggregate operation function
  * @pre_aggregate: pointer to device specific function that is called
  *		   before the aggregation begins (optional)
+ * @get_bw: pointer to device specific function to get current bandwidth
  * @xlate: provider-specific callback for mapping nodes from phandle arguments
  * @dev: the device this interconnect provider belongs to
  * @users: count of active users
@@ -51,6 +52,7 @@ struct icc_provider {
 	int (*aggregate)(struct icc_node *node, u32 tag, u32 avg_bw,
 			 u32 peak_bw, u32 *agg_avg, u32 *agg_peak);
 	void (*pre_aggregate)(struct icc_node *node);
+	int (*get_bw)(struct icc_node *node, u32 *avg, u32 *peak);
 	struct icc_node* (*xlate)(struct of_phandle_args *spec, void *data);
 	struct device		*dev;
 	int			users;
