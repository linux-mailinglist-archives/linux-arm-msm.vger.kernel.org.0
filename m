Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AB465265337
	for <lists+linux-arm-msm@lfdr.de>; Thu, 10 Sep 2020 23:30:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728165AbgIJVaM (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 10 Sep 2020 17:30:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51280 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730373AbgIJOCp (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 10 Sep 2020 10:02:45 -0400
Received: from mail-lj1-x243.google.com (mail-lj1-x243.google.com [IPv6:2a00:1450:4864:20::243])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9EFB5C061343
        for <linux-arm-msm@vger.kernel.org>; Thu, 10 Sep 2020 07:00:24 -0700 (PDT)
Received: by mail-lj1-x243.google.com with SMTP id b19so8276771lji.11
        for <linux-arm-msm@vger.kernel.org>; Thu, 10 Sep 2020 07:00:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=UYCbcxWK8UZvP4fORWPCdZHxSRcyR7TYHiknFeVjAjU=;
        b=Jh+xxnpKuahJZ8tmJsw7L3PRa3inmR2J7XvJAbRQCOkXjIpQ9WjZ+kFo+vyZgLDn3M
         9EQiTIpmT2u8q4yqtLwzenirl2Cf4GtbL4zRwuuUpH8T/11dUxYsmu5FDoSNBg8ByEYp
         Asy7OSpAiAI31vThzHb//a5rRkcb9sp11w8vWkFOPQ7PROsdItn2bhkww0fX3XD9Bkk+
         mESkwjK38GH/FbRMf0z+UrJiSqh0163hQ3FG5tN6lbU1WdMdinERgoE8aust7hLtoqRW
         domyqMQ4odrzu47vyMQ/WjiEuwq2hzRPjkKgHa3iGuPDkWuaiRSNa/tWnM+MUMLlVixx
         UGUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=UYCbcxWK8UZvP4fORWPCdZHxSRcyR7TYHiknFeVjAjU=;
        b=cAvvvzbZrvKsDSUg3XMFS40GCYilNQ/zRRSsu407G4vAv7/Y4L1SENU4Z34zHYAoGH
         aNB6RKzczSXBdxW30oDaXHpB5dTDL+QoNNp/VsFUy74ZxgR4pPWI70LoSDAk6YAi4fvr
         fMqbIQRIe+39AOMMJiDgLgfSJTbEADe6nYASn8ctqiX6cEsvsZVTbMCFYmIRL4xp2H3z
         IGhd77/8Mwh8RoZeQ/OGMZbx0RWC86yjcwMG3WaFnaFb9F2feXR5RqjgDPGZO99q3Ngb
         eyGER5TRDl9Pz7A9/BVwNof+Ka6HbNszO/T3JdQatLFbyNuekyZlQdNgsym/I4iUYB15
         qAbA==
X-Gm-Message-State: AOAM531Z2xDFgFL3xvo2wkUsS1ssm4EKjuYpO1ve7qYYRIg4+wFBiFss
        R2GSJXqW4CaLQYnvpX9fqk1zTg==
X-Google-Smtp-Source: ABdhPJxw4BJkJfgrTpp5C3M5g3djMcYG2hnwFn51VZBQVWqAE+zHjjRWbCyT8AJMwZcs0U7dQArsJA==
X-Received: by 2002:a2e:141d:: with SMTP id u29mr4542164ljd.243.1599746423060;
        Thu, 10 Sep 2020 07:00:23 -0700 (PDT)
Received: from eriador.lan ([188.162.64.156])
        by smtp.gmail.com with ESMTPSA id t82sm1367646lff.43.2020.09.10.07.00.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2020 07:00:22 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Zhang Rui <rui.zhang@intel.com>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Amit Kucheria <amitk@kernel.org>,
        Jonathan Cameron <jic23@kernel.org>,
        Hartmut Knaack <knaack.h@gmx.de>,
        Lars-Peter Clausen <lars@metafoo.de>,
        Peter Meerwald-Stadler <pmeerw@pmeerw.net>
Cc:     linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-iio@vger.kernel.org,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [PATCH v4 07/10] iio: provide of_iio_channel_get_by_name() and devm_ version it
Date:   Thu, 10 Sep 2020 16:59:57 +0300
Message-Id: <20200910140000.324091-8-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200910140000.324091-1-dmitry.baryshkov@linaro.org>
References: <20200910140000.324091-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

There might be cases when the IIO channel is attached to the device
subnode instead of being attached to the main device node. Allow drivers
to query IIO channels by using device tree nodes.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/iio/inkern.c         | 34 ++++++++++++++++++++++++++--------
 include/linux/iio/consumer.h | 36 ++++++++++++++++++++++++++++++++++++
 2 files changed, 62 insertions(+), 8 deletions(-)

diff --git a/drivers/iio/inkern.c b/drivers/iio/inkern.c
index ede99e0d5371..8ff0ac472de3 100644
--- a/drivers/iio/inkern.c
+++ b/drivers/iio/inkern.c
@@ -180,8 +180,8 @@ static struct iio_channel *of_iio_channel_get(struct device_node *np, int index)
 	return ERR_PTR(err);
 }
 
-static struct iio_channel *of_iio_channel_get_by_name(struct device_node *np,
-						      const char *name)
+struct iio_channel *of_iio_channel_get_by_name(struct device_node *np,
+					       const char *name)
 {
 	struct iio_channel *chan = NULL;
 
@@ -219,6 +219,7 @@ static struct iio_channel *of_iio_channel_get_by_name(struct device_node *np,
 
 	return chan;
 }
+EXPORT_SYMBOL_GPL(of_iio_channel_get_by_name);
 
 static struct iio_channel *of_iio_channel_get_all(struct device *dev)
 {
@@ -261,12 +262,6 @@ static struct iio_channel *of_iio_channel_get_all(struct device *dev)
 
 #else /* CONFIG_OF */
 
-static inline struct iio_channel *
-of_iio_channel_get_by_name(struct device_node *np, const char *name)
-{
-	return NULL;
-}
-
 static inline struct iio_channel *of_iio_channel_get_all(struct device *dev)
 {
 	return NULL;
@@ -382,6 +377,29 @@ struct iio_channel *devm_iio_channel_get(struct device *dev,
 }
 EXPORT_SYMBOL_GPL(devm_iio_channel_get);
 
+struct iio_channel *devm_of_iio_channel_get_by_name(struct device *dev,
+						    struct device_node *np,
+						    const char *channel_name)
+{
+	struct iio_channel **ptr, *channel;
+
+	ptr = devres_alloc(devm_iio_channel_free, sizeof(*ptr), GFP_KERNEL);
+	if (!ptr)
+		return ERR_PTR(-ENOMEM);
+
+	channel = of_iio_channel_get_by_name(np, channel_name);
+	if (IS_ERR(channel)) {
+		devres_free(ptr);
+		return channel;
+	}
+
+	*ptr = channel;
+	devres_add(dev, ptr);
+
+	return channel;
+}
+EXPORT_SYMBOL_GPL(devm_of_iio_channel_get_by_name);
+
 struct iio_channel *iio_channel_get_all(struct device *dev)
 {
 	const char *name;
diff --git a/include/linux/iio/consumer.h b/include/linux/iio/consumer.h
index c4118dcb8e05..0a90ba8fa1bb 100644
--- a/include/linux/iio/consumer.h
+++ b/include/linux/iio/consumer.h
@@ -13,6 +13,7 @@
 struct iio_dev;
 struct iio_chan_spec;
 struct device;
+struct device_node;
 
 /**
  * struct iio_channel - everything needed for a consumer to use a channel
@@ -97,6 +98,41 @@ void iio_channel_release_all(struct iio_channel *chan);
  */
 struct iio_channel *devm_iio_channel_get_all(struct device *dev);
 
+/**
+ * of_iio_channel_get_by_name() - get description of all that is needed to access channel.
+ * @np:			Pointer to consumer device tree node
+ * @consumer_channel:	Unique name to identify the channel on the consumer
+ *			side. This typically describes the channels use within
+ *			the consumer. E.g. 'battery_voltage'
+ */
+#ifdef CONFIG_OF
+struct iio_channel *of_iio_channel_get_by_name(struct device_node *np, const char *name);
+#else
+static inline struct iio_channel *
+of_iio_channel_get_by_name(struct device_node *np, const char *name)
+{
+	return NULL;
+}
+#endif
+
+/**
+ * devm_of_iio_channel_get_by_name() - Resource managed version of of_iio_channel_get_by_name().
+ * @dev:		Pointer to consumer device.
+ * @np:			Pointer to consumer device tree node
+ * @consumer_channel:	Unique name to identify the channel on the consumer
+ *			side. This typically describes the channels use within
+ *			the consumer. E.g. 'battery_voltage'
+ *
+ * Returns a pointer to negative errno if it is not able to get the iio channel
+ * otherwise returns valid pointer for iio channel.
+ *
+ * The allocated iio channel is automatically released when the device is
+ * unbound.
+ */
+struct iio_channel *devm_of_iio_channel_get_by_name(struct device *dev,
+						    struct device_node *np,
+						    const char *consumer_channel);
+
 struct iio_cb_buffer;
 /**
  * iio_channel_get_all_cb() - register callback for triggered capture
-- 
2.28.0

