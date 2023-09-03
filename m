Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7A85F790E59
	for <lists+linux-arm-msm@lfdr.de>; Sun,  3 Sep 2023 23:42:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1349265AbjICVmG (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 3 Sep 2023 17:42:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59918 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1349063AbjICVmE (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 3 Sep 2023 17:42:04 -0400
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com [IPv6:2a00:1450:4864:20::12b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D3442110
        for <linux-arm-msm@vger.kernel.org>; Sun,  3 Sep 2023 14:41:58 -0700 (PDT)
Received: by mail-lf1-x12b.google.com with SMTP id 2adb3069b0e04-500cd6261fdso1521695e87.3
        for <linux-arm-msm@vger.kernel.org>; Sun, 03 Sep 2023 14:41:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1693777317; x=1694382117; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SWHSZWaKhvE1MjysmoYq2syAfT9CG/PqkkscIEqVNT4=;
        b=OFGjRw15uVSbGAp4yu9zzgtzGPg8+T2glIgwMKBNEypXFfvXXOMCnXcBGmXfmdDOzO
         846sonlFk704L2Ont7y+SWa0ldpFMcmfi1KaqGgBo9Ys5Sb0WiaOqIM+x+DpTMldQ47Q
         XX1CO0+/O3bNgKf7pOJv//hNpwgjyxsV0k69x+awp/1KtBj+SBhnl1l7LoUGoab88l4L
         XsOuZkzMTTWzgLk0fgjlPPC66W9V7bQi1pM2e8nwJKYSeFf+tDEveGjtCDi94zRlcFBw
         OfPz+/YXry+rIC48tGl97KlcSfbSrzjxOuszKPovZvpEr1vzMtnNAicxd1dCPj7jTYM7
         y9wA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693777317; x=1694382117;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SWHSZWaKhvE1MjysmoYq2syAfT9CG/PqkkscIEqVNT4=;
        b=Uq3mpyFROjWbGpyeZHm2CIhUn4VjDj0aCWklJvZMsLvrWHcLr2IW6sAjLCavRpqRYc
         Ex2tXRIkjAXOVpg4R8iP3pXkK20eLg7VjcQdawRg/xsVGAjw/GfN8gjZuAYTcoIvLA6o
         rP4zSI+RrSX2ulDH4e8L9gFBkKaNvZ6ppnFQ19sE8/TvjK92ocK9XqR9Tymu2Kxkfuvf
         YzV92jG6mPXYSO5HbYvrD42R2BxAy1JxYE/DrYXxeEtPS35jZrLKFy/F1UszgKs69gZf
         kBOvz5ZOGYdzkx6rN4lxA4Yjl0mom3QwJHHHvWf2BoyW/d7jPX+dbK3gCwfjQIzJyY4a
         LCDQ==
X-Gm-Message-State: AOJu0YzJevl1VmI8JrN7/TBNsY5pCeH+OJIItJEtJi1FVdZn7cBkhd1c
        xUBO7GhGWgiFoFwfW6P4PoZEMg==
X-Google-Smtp-Source: AGHT+IHdP+cCSWTvD+87l9JrZmPVTmSpURuy7YzU/9ihGfD9uR1Aa2DcxlQZlNBD7Tvco0iNQQ5Pmw==
X-Received: by 2002:a05:6512:2247:b0:500:7dcc:621 with SMTP id i7-20020a056512224700b005007dcc0621mr6544464lfu.31.1693777317228;
        Sun, 03 Sep 2023 14:41:57 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id x17-20020ac25dd1000000b004f8555f7aa1sm1422506lfq.52.2023.09.03.14.41.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 03 Sep 2023 14:41:56 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
        Andrzej Hajda <andrzej.hajda@intel.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Robert Foss <rfoss@kernel.org>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Janne Grunau <j@jannau.net>, Simon Ser <contact@emersion.fr>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        freedreno@lists.freedesktop.org
Subject: [RFC PATCH v1 08/12] usb: typec: support generating Type-C port names for userspace
Date:   Mon,  4 Sep 2023 00:41:46 +0300
Message-Id: <20230903214150.2877023-9-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230903214150.2877023-1-dmitry.baryshkov@linaro.org>
References: <20230903214150.2877023-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

We need a way to generate and return the Type-C port device names. For
example, it is going to be used by the DRM to provide PATH property for
DisplayPort connectors.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/usb/typec/class.c | 14 ++++++++++++++
 include/linux/usb/typec.h |  2 ++
 2 files changed, 16 insertions(+)

diff --git a/drivers/usb/typec/class.c b/drivers/usb/typec/class.c
index 9c1dbf3c00e0..7394a2ecef6f 100644
--- a/drivers/usb/typec/class.c
+++ b/drivers/usb/typec/class.c
@@ -2327,6 +2327,20 @@ void typec_unregister_port(struct typec_port *port)
 }
 EXPORT_SYMBOL_GPL(typec_unregister_port);
 
+/**
+ * typec_port_get_name - Get USB Type-C Port name
+ * @port: The port to describe
+ *
+ * Returns a name of the passed USB Type-C port on success or NULL when the
+ * port has not been enumerated yet. The resulting string should be freed by
+ * the caller.
+ */
+char *typec_port_get_name(struct typec_port *port)
+{
+	return kasprintf(GFP_KERNEL, "typec:%s", dev_name(&port->dev));
+}
+EXPORT_SYMBOL_GPL(typec_port_get_name);
+
 static int __init typec_init(void)
 {
 	int ret;
diff --git a/include/linux/usb/typec.h b/include/linux/usb/typec.h
index 8fa781207970..4aa9c9378383 100644
--- a/include/linux/usb/typec.h
+++ b/include/linux/usb/typec.h
@@ -303,6 +303,8 @@ struct typec_plug *typec_register_plug(struct typec_cable *cable,
 				       struct typec_plug_desc *desc);
 void typec_unregister_plug(struct typec_plug *plug);
 
+char *typec_port_get_name(struct typec_port *port);
+
 void typec_set_data_role(struct typec_port *port, enum typec_data_role role);
 void typec_set_pwr_role(struct typec_port *port, enum typec_role role);
 void typec_set_vconn_role(struct typec_port *port, enum typec_role role);
-- 
2.39.2

