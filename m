Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9E4F42CE620
	for <lists+linux-arm-msm@lfdr.de>; Fri,  4 Dec 2020 03:58:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727293AbgLDC50 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 3 Dec 2020 21:57:26 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43506 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727289AbgLDC5Z (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 3 Dec 2020 21:57:25 -0500
Received: from mail-lf1-x141.google.com (mail-lf1-x141.google.com [IPv6:2a00:1450:4864:20::141])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DDAF2C094251
        for <linux-arm-msm@vger.kernel.org>; Thu,  3 Dec 2020 18:55:33 -0800 (PST)
Received: by mail-lf1-x141.google.com with SMTP id d20so5688338lfe.11
        for <linux-arm-msm@vger.kernel.org>; Thu, 03 Dec 2020 18:55:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=yZ4iPpipCPmIC98KwnHmu0HBMhLM5DajEgFPBqEDqrw=;
        b=YHHzThAwSrziZyFl3HhqHAwgpxZeVirTbWrxm4vYvgVg5DaCmus2Et1+u6I92pmOly
         a+6UJotJ9hyB7WW+fDlMnOT2FPyABsPfdRAsRtN5BbMY2Vz9lrEzST7AIVkTCVESOnHg
         HAWc/Mgc389NJQJszZ3dnRmOEWmkIW9i62OlQKySp2ejnXorUJB3zqYzy2tB6LjMbWAf
         akBJwgejIi9huB4zk2f89CQmV1Cvp3K6VQjF+4ymssy4Qr6nS0/h0HF8Q12ePof2VNhk
         WyqvJRBc0M5bAkqr3ZlF4cSjO1AnO1cDZPQ8l5g8RyzuNzAK9PF8SjBz3OJBHz/CLkOl
         eZ4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=yZ4iPpipCPmIC98KwnHmu0HBMhLM5DajEgFPBqEDqrw=;
        b=CHHhs/G9Pq2V8IPGzXYJox/0GnHjyZQnovn3BMiuwSIP/HoeF468zRv6tBT3SFUCjv
         Wu0UWDnP/ViPoQiN8xbaZjbZu785wiU5mytudZrooa0zsl04zhZR9mhoOnZwF3b+FX50
         PYcbzrRWBMOJN6OSWRx13BeL9Zep+V3kezK6ZfjGT/pB2GdfsbUj9Y00XwxZMmLldzHu
         /Anm2R26mjQHqfWbHANvGnpdgVGb1/OhQVlpd4kAR+E0n+308kxa28xIbW7Z/4hSvk6/
         yHLgmiHGmB1Yp+mjl3w3QRDE77R2MGvkI6GHFjCsogIo4qy+mGBcbMhbeMlKHwwfeQ9t
         CEIQ==
X-Gm-Message-State: AOAM531bbjs8m7UWHgi9OdLb7faHuxKA1qD8r4u/w4CqGhoJf5K4debR
        iU86Ru5m2jy9xXMSJXfJsXwURg==
X-Google-Smtp-Source: ABdhPJwP3ZKl4y6f9/uf6rrygITl3Oyc93Cw+WvoK7uQhd4vwrCBkjdEXBoAr5wAO3Mu6+mxqjfOSw==
X-Received: by 2002:a05:6512:2ee:: with SMTP id m14mr194038lfq.318.1607050532407;
        Thu, 03 Dec 2020 18:55:32 -0800 (PST)
Received: from eriador.lumag.spb.ru ([188.162.64.117])
        by smtp.gmail.com with ESMTPSA id b8sm1131667ljo.68.2020.12.03.18.55.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Dec 2020 18:55:31 -0800 (PST)
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
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        Jishnu Prakash <jprakash@qti.qualcomm.com>,
        Jonathan Cameron <Jonathan.Cameron@huawei.com>
Subject: [PATCH v10 07/15] iio: provide of_iio_channel_get_by_name() and devm_ version it
Date:   Fri,  4 Dec 2020 05:55:01 +0300
Message-Id: <20201204025509.1075506-8-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201204025509.1075506-1-dmitry.baryshkov@linaro.org>
References: <20201204025509.1075506-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

There might be cases when the IIO channel is attached to the device
subnode instead of being attached to the main device node. Allow drivers
to query IIO channels by using device tree nodes.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
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
2.29.2

