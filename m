Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 66C6132F73E
	for <lists+linux-arm-msm@lfdr.de>; Sat,  6 Mar 2021 01:27:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229669AbhCFA0u (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 5 Mar 2021 19:26:50 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49800 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229493AbhCFA0m (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 5 Mar 2021 19:26:42 -0500
Received: from mail-pg1-x534.google.com (mail-pg1-x534.google.com [IPv6:2607:f8b0:4864:20::534])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 120D5C06175F
        for <linux-arm-msm@vger.kernel.org>; Fri,  5 Mar 2021 16:26:42 -0800 (PST)
Received: by mail-pg1-x534.google.com with SMTP id p21so2449537pgl.12
        for <linux-arm-msm@vger.kernel.org>; Fri, 05 Mar 2021 16:26:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=8ioBMuO2igmW4BL3UDTs4zCq3jWXemfM9CQDn/Vb8qk=;
        b=UyTGutIQgvDw9NddvZT0M7jm5lw13e0rBcAmuLOdh3y4WLpcn4DrE6HTXb05d4kvR2
         3XeS6Bcm7gGno8lDvUbVR5XVvi094lQUPwpTS090oK7/Zg4dxdjyENdH3TzXZz86Yle9
         1oTDF7ZSjLvj3n26VdEQRPL31+foAmo7vLHaM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=8ioBMuO2igmW4BL3UDTs4zCq3jWXemfM9CQDn/Vb8qk=;
        b=oLLV/xiEDKHAWbWNA8ZkaZqEcq+g+8ES3P4O/ovz0nNoZrt/amMcjZ4IFzbDj0mcbd
         VSCFOUqVN8xdMRu62mSS0ZDSwqpppsQvUdG3tP9vw0C5eDtyDfV/Gq/rUocraaigD/7R
         ABxCOqCf19YZQP8RGbfjr4UNLxD9Xy+rH3Ak4WXDrp12NO2t+JKJen2A6VfS7Egh232O
         nCq+U/oOw/GCPqD9wvNCTNMHto+Md590Sg9G998WGscQSsIHbl0XtTWobxwYVfZXBuBp
         NB2PmKZEJ66D7+H+Jbt//aNbB5HfoHq1zPoW06pC9qY7z/HmPHNy2IiWDYicroPXKIuu
         ehSw==
X-Gm-Message-State: AOAM530SStaNUHvxo4KI8AldAGPWiFAHGV59xRM3D3XgHnbzLkO2+lzP
        gXH5cW7gz5dle03i34SAxQaBAg==
X-Google-Smtp-Source: ABdhPJxIuI1xVSWldNRPbKE21vi/oPh7r05GVS2zHYb//NYvqS5YxTPZ0GeqWuTUjzMikt0VX32vgg==
X-Received: by 2002:a62:87c3:0:b029:1ee:761:bb33 with SMTP id i186-20020a6287c30000b02901ee0761bb33mr11367606pfe.52.1614990401431;
        Fri, 05 Mar 2021 16:26:41 -0800 (PST)
Received: from tictac2.mtv.corp.google.com ([2620:15c:202:1:48f0:8f48:7388:d921])
        by smtp.gmail.com with ESMTPSA id 192sm3608905pfa.122.2021.03.05.16.26.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Mar 2021 16:26:40 -0800 (PST)
From:   Douglas Anderson <dianders@chromium.org>
To:     "Rafael J . Wysocki" <rafael.j.wysocki@intel.com>,
        Rob Clark <robdclark@gmail.com>,
        Jordan Crouse <jcrouse@codeaurora.org>
Cc:     Ulf Hansson <ulf.hansson@linaro.org>,
        Niklas Cassel <niklas.cassel@linaro.org>,
        Jorge Ramirez-Ortiz <jorge.ramirez-ortiz@linaro.org>,
        swboyd@chromium.org, linux-arm-msm@vger.kernel.org,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Akhil P Oommen <akhilpo@codeaurora.org>,
        Douglas Anderson <dianders@chromium.org>,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        linux-kernel@vger.kernel.org
Subject: [PATCH 1/3] nvmem: core: Add functions to make number reading easy
Date:   Fri,  5 Mar 2021 16:26:20 -0800
Message-Id: <20210305162546.1.I323dad4343256b48af2be160b84b1e87985cc9be@changeid>
X-Mailer: git-send-email 2.30.1.766.gb4fecdf3b7-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Sometimes the clients of nvmem just want to get a number out of
nvmem. They don't want to think about exactly how many bytes the nvmem
cell took up. They just want the number. Let's make it easy.

In general this concept is useful because nvmem space is precious and
usually the fewest bits are allocated that will hold a given value on
a given system. However, even though small numbers might be fine on
one system that doesn't mean that logically the number couldn't be
bigger. Imagine nvmem containing a max frequency for a component. On
one system perhaps that fits in 16 bits. On another system it might
fit in 32 bits. The code reading this number doesn't care--it just
wants the number.

We'll provide two functions: nvmem_cell_read_variable_le_u32() and
nvmem_cell_read_variable_le_u64().

Comparing these to the existing functions like nvmem_cell_read_u32():
* These new functions have no problems if the value was stored in
  nvmem in fewer bytes. It's OK to use these function as long as the
  value stored will fit in 32-bits (or 64-bits).
* These functions avoid problems that the earlier APIs had with bit
  offsets. For instance, you can't use nvmem_cell_read_u32() to read a
  value has nbits=32 and bit_offset=4 because the nvmem cell must be
  at least 5 bytes big to hold this value. The new API accounts for
  this and works fine.
* These functions make it very explicit that they assume that the
  number was stored in little endian format. The old functions made
  this assumption whenever bit_offset was non-zero (see
  nvmem_shift_read_buffer_in_place()) but didn't whenever the
  bit_offset was zero.

NOTE: it's assumed that we don't need an 8-bit or 16-bit version of
this function. The 32-bit version of the function can be used to read
8-bit or 16-bit data.

At the moment, I'm only adding the "unsigned" versions of these
functions, but if it ends up being useful someone could add a "signed"
version that did 2's complement sign extension.

At the moment, I'm only adding the "little endian" versions of these
functions. Adding the "big endian" version would require adding "big
endian" support to nvmem_shift_read_buffer_in_place().

Signed-off-by: Douglas Anderson <dianders@chromium.org>
---
This is a logical follow-up to:
  https://lore.kernel.org/r/20210227002603.3260599-1-dianders@chromium.org/
...but since it doesn't really share any of the same patches I'm not
marking it as a v2.

 drivers/nvmem/core.c           | 95 ++++++++++++++++++++++++++++++++++
 include/linux/nvmem-consumer.h |  4 ++
 2 files changed, 99 insertions(+)

diff --git a/drivers/nvmem/core.c b/drivers/nvmem/core.c
index a5ab1e0c74cf..635e3131eb5f 100644
--- a/drivers/nvmem/core.c
+++ b/drivers/nvmem/core.c
@@ -1606,6 +1606,101 @@ int nvmem_cell_read_u64(struct device *dev, const char *cell_id, u64 *val)
 }
 EXPORT_SYMBOL_GPL(nvmem_cell_read_u64);
 
+static void *nvmem_cell_read_variable_common(struct device *dev,
+					     const char *cell_id,
+					     size_t max_len, size_t *len)
+{
+	struct nvmem_cell *cell;
+	int nbits;
+	void *buf;
+
+	cell = nvmem_cell_get(dev, cell_id);
+	if (IS_ERR(cell))
+		return cell;
+
+	nbits = cell->nbits;
+	buf = nvmem_cell_read(cell, len);
+	nvmem_cell_put(cell);
+	if (IS_ERR(buf))
+		return buf;
+
+	/*
+	 * If nbits is set then nvmem_cell_read() can significantly exaggerate
+	 * the length of the real data. Throw away the extra junk.
+	 */
+	if (nbits)
+		*len = DIV_ROUND_UP(nbits, 8);
+
+	if (*len > max_len) {
+		kfree(buf);
+		return ERR_PTR(-ERANGE);
+	}
+
+	return buf;
+}
+
+/**
+ * nvmem_cell_read_variable_le_u32() - Read up to 32-bits of data as a little endian number.
+ *
+ * @dev: Device that requests the nvmem cell.
+ * @cell_id: Name of nvmem cell to read.
+ * @val: pointer to output value.
+ *
+ * Return: 0 on success or negative errno.
+ */
+int nvmem_cell_read_variable_le_u32(struct device *dev, const char *cell_id,
+				    u32 *val)
+{
+	size_t len;
+	u8 *buf;
+	int i;
+
+	buf = nvmem_cell_read_variable_common(dev, cell_id, sizeof(*val), &len);
+	if (IS_ERR(buf))
+		return PTR_ERR(buf);
+
+	/* Copy w/ implicit endian conversion */
+	*val = 0;
+	for (i = 0; i < len; i++)
+		*val |= buf[i] << (8 * i);
+
+	kfree(buf);
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(nvmem_cell_read_variable_le_u32);
+
+/**
+ * nvmem_cell_read_variable_le_u64() - Read up to 64-bits of data as a little endian number.
+ *
+ * @dev: Device that requests the nvmem cell.
+ * @cell_id: Name of nvmem cell to read.
+ * @val: pointer to output value.
+ *
+ * Return: 0 on success or negative errno.
+ */
+int nvmem_cell_read_variable_le_u64(struct device *dev, const char *cell_id,
+				    u64 *val)
+{
+	size_t len;
+	u8 *buf;
+	int i;
+
+	buf = nvmem_cell_read_variable_common(dev, cell_id, sizeof(*val), &len);
+	if (IS_ERR(buf))
+		return PTR_ERR(buf);
+
+	/* Copy w/ implicit endian conversion */
+	*val = 0;
+	for (i = 0; i < len; i++)
+		*val |= buf[i] << (8 * i);
+
+	kfree(buf);
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(nvmem_cell_read_variable_le_u64);
+
 /**
  * nvmem_device_cell_read() - Read a given nvmem device and cell
  *
diff --git a/include/linux/nvmem-consumer.h b/include/linux/nvmem-consumer.h
index 052293f4cbdb..923dada24eb4 100644
--- a/include/linux/nvmem-consumer.h
+++ b/include/linux/nvmem-consumer.h
@@ -65,6 +65,10 @@ int nvmem_cell_read_u8(struct device *dev, const char *cell_id, u8 *val);
 int nvmem_cell_read_u16(struct device *dev, const char *cell_id, u16 *val);
 int nvmem_cell_read_u32(struct device *dev, const char *cell_id, u32 *val);
 int nvmem_cell_read_u64(struct device *dev, const char *cell_id, u64 *val);
+int nvmem_cell_read_variable_le_u32(struct device *dev, const char *cell_id,
+				    u32 *val);
+int nvmem_cell_read_variable_le_u64(struct device *dev, const char *cell_id,
+				    u64 *val);
 
 /* direct nvmem device read/write interface */
 struct nvmem_device *nvmem_device_get(struct device *dev, const char *name);
-- 
2.30.1.766.gb4fecdf3b7-goog

