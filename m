Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CA7D1672858
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Jan 2023 20:31:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229644AbjARTbH (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 18 Jan 2023 14:31:07 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57816 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230214AbjARTav (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 18 Jan 2023 14:30:51 -0500
Received: from mail-qt1-x82e.google.com (mail-qt1-x82e.google.com [IPv6:2607:f8b0:4864:20::82e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B2A9454B0C
        for <linux-arm-msm@vger.kernel.org>; Wed, 18 Jan 2023 11:30:39 -0800 (PST)
Received: by mail-qt1-x82e.google.com with SMTP id jr10so23385711qtb.7
        for <linux-arm-msm@vger.kernel.org>; Wed, 18 Jan 2023 11:30:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lTyBfUnvKALTk2yMjWP6R/bloXF9BiO9T87V2wgDNkI=;
        b=KCcukIcN7rEzVpwjM7Bx9mSocbm495qdBtWhRw9cIAWd+aZ4mv1qEIexn28s38TUok
         yAx1rxbT/Os43QGOIqVAOpbU0lGMjxQfnzG620YfREJfuD9WIKqhRXHugjhIKXlfehno
         JKsssqpZ0SAC87f1Q6ZgJIXWMjdxbqQMvkD1I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lTyBfUnvKALTk2yMjWP6R/bloXF9BiO9T87V2wgDNkI=;
        b=MPyJLa801nVzl4PclBRazi8RE3KGb80kNs3G1EnrW7kBFwPYEjsT4vDYaH5J2OlF7Y
         NEfv/Fz5D1MKbJ8axYRiNAGkuK7oBRBTJw+Wa2sf3Wh0U4/ZAk5pfFqJKQIqKA+zLZBq
         CVIXYwcGjpE00r+nYtKQkZ2JIJZu4yc6CFnJQX4QpaVyWfK+sc6j00+s22hUvAWambL5
         zeS7Ev2+whPZ0yOkTethPTJWQvYIcsTKFsO/TqZ5fT4+MrpDkykGPypi24UA8slCzii7
         V+3DGH5Ggil7Q0+wqFqGePpZ33JSyp/MZud5RA4KnUZHozyyU+ngSX7czpa+HZhvt3MC
         Odqw==
X-Gm-Message-State: AFqh2kphsQOWzjEN1C0hk03SLHO/cGuElM/IMZiMAI8isKYNKQ0R+jx6
        5Y4wCLpuGeXZ8Ti32v2ra75iMQ==
X-Google-Smtp-Source: AMrXdXv9DHTUyvOTMsBF6nGFIh7OHwWduaV9v9xKZz7N22mZvX8VSENnCuiZ3AnUj/Dmca2tCVBqFg==
X-Received: by 2002:a05:622a:4897:b0:3b5:87db:f97c with SMTP id fc23-20020a05622a489700b003b587dbf97cmr13234378qtb.0.1674070238975;
        Wed, 18 Jan 2023 11:30:38 -0800 (PST)
Received: from localhost (29.46.245.35.bc.googleusercontent.com. [35.245.46.29])
        by smtp.gmail.com with UTF8SMTPSA id j19-20020ac85513000000b003b642c7c772sm2389710qtq.71.2023.01.18.11.30.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Jan 2023 11:30:38 -0800 (PST)
From:   Mark Yacoub <markyacoub@chromium.org>
X-Google-Original-From: Mark Yacoub <markyacoub@google.com>
To:     quic_khsieh@quicinc.com, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        intel-gfx@lists.freedesktop.org
Cc:     robdclark@gmail.com, quic_abhinavk@quicinc.com,
        dmitry.baryshkov@linaro.org, sean@poorly.run, airlied@gmail.com,
        daniel@ffwll.ch, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, agross@kernel.org,
        andersson@kernel.org, konrad.dybcio@somainline.org,
        jani.nikula@linux.intel.com, joonas.lahtinen@linux.intel.com,
        rodrigo.vivi@intel.com, tvrtko.ursulin@linux.intel.com,
        markyacoub@chromium.org, tzimmermann@suse.de,
        ville.syrjala@linux.intel.com, stanislav.lisovskiy@intel.com,
        matthew.d.roper@intel.com, imre.deak@intel.com,
        lucas.demarchi@intel.com, manasi.d.navare@intel.com,
        swati2.sharma@intel.com, bhanuprakash.modem@intel.com,
        javierm@redhat.com, jose.souza@intel.com, lyude@redhat.com,
        hbh25y@gmail.com, arun.r.murthy@intel.com,
        ashutosh.dixit@intel.com, ankit.k.nautiyal@intel.com,
        maxime@cerno.tech, swboyd@chromium.org,
        christophe.jaillet@wanadoo.fr, quic_sbillaka@quicinc.com,
        johan+linaro@kernel.org, dianders@chromium.org, marex@denx.de,
        quic_jesszhan@quicinc.com, bjorn.andersson@linaro.org,
        abhinavk@codeaurora.org, seanpaul@chromium.org,
        Jani Nikula <jani.nikula@intel.com>
Subject: [PATCH v6 04/10] drm/hdcp: Expand HDCP helper library for enable/disable/check
Date:   Wed, 18 Jan 2023 19:30:09 +0000
Message-Id: <20230118193015.911074-5-markyacoub@google.com>
X-Mailer: git-send-email 2.39.0.246.g2a6d74b583-goog
In-Reply-To: <20230118193015.911074-1-markyacoub@google.com>
References: <20230118193015.911074-1-markyacoub@google.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Sean Paul <seanpaul@chromium.org>

This patch expands upon the HDCP helper library to manage HDCP
enable, disable, and check.

Previous to this patch, the majority of the state management and sink
interaction is tucked inside the Intel driver with the understanding
that once a new platform supported HDCP we could make good decisions
about what should be centralized. With the addition of HDCP support
for Qualcomm, it's time to migrate the protocol-specific bits of HDCP
authentication, key exchange, and link checks to the HDCP helper.

In terms of functionality, this migration is 1:1 with the Intel driver,
however things are laid out a bit differently than with intel_hdcp.c,
which is why this is a separate patch from the i915 transition to the
helper. On i915, the shim vtable is used to account for HDMI vs. DP
vs. DP-MST differences whereas the helper library uses a LUT to
account for the register offsets and a remote read function to route
the messages. On i915, storing the sink information in the source is
done inline whereas now we use the new drm_hdcp_helper_funcs vtable
to store and fetch information to/from source hw. Finally, instead of
calling enable/disable directly from the driver, we'll leave that
decision to the helper and by calling drm_hdcp_helper_atomic_commit()
from the driver. All told, this will centralize the protocol and state
handling in the helper, ensuring we collect all of our bugs^Wlogic
in one place.

Cc: Abhinav Kumar <abhinavk@codeaurora.org>
Acked-by: Jani Nikula <jani.nikula@intel.com>
Reviewed-by: Abhinav Kumar <abhinavk@codeaurora.org>
Signed-off-by: Sean Paul <seanpaul@chromium.org>
Signed-off-by: Mark Yacoub <markyacoub@chromium.org>
Link: https://patchwork.freedesktop.org/patch/msgid/20210913175747.47456-5-sean@poorly.run #v1
Link: https://patchwork.freedesktop.org/patch/msgid/20210915203834.1439-5-sean@poorly.run #v2
Link: https://patchwork.freedesktop.org/patch/msgid/20211001151145.55916-5-sean@poorly.run #v3
Link: https://patchwork.freedesktop.org/patch/msgid/20211105030434.2828845-5-sean@poorly.run #v4
Link: https://patchwork.freedesktop.org/patch/msgid/20220411204741.1074308-5-sean@poorly.run #v5

Changes in v2:
-Fixed set-but-unused variable identified by 0-day
Changes in v3:
-Fixed uninitialized variable warning identified by 0-day
Changes in v4:
-None
Changes in v5:
-None
Changes in v6:
-Fixed typo in function descriptions
-Rebased: Moved the new code between drm_hdcp.h and drm_hdcp_helper.c/h
-Add missing headers. Reported-by: kernel test robot <lkp@intel.com>

---
 drivers/gpu/drm/display/drm_hdcp_helper.c | 1109 +++++++++++++++++++++
 include/drm/display/drm_hdcp.h            |  168 +++-
 include/drm/display/drm_hdcp_helper.h     |   30 +-
 3 files changed, 1305 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/display/drm_hdcp_helper.c b/drivers/gpu/drm/display/drm_hdcp_helper.c
index ce92f1cac251..de8c006b9cda 100644
--- a/drivers/gpu/drm/display/drm_hdcp_helper.c
+++ b/drivers/gpu/drm/display/drm_hdcp_helper.c
@@ -6,13 +6,18 @@
  * Ramalingam C <ramalingam.c@intel.com>
  */
 
+#include <linux/delay.h>
 #include <linux/device.h>
 #include <linux/err.h>
 #include <linux/gfp.h>
+#include <linux/i2c.h>
+#include <linux/iopoll.h>
 #include <linux/export.h>
 #include <linux/slab.h>
 #include <linux/firmware.h>
+#include <linux/workqueue.h>
 
+#include <drm/display/drm_dp_helper.h>
 #include <drm/display/drm_hdcp_helper.h>
 #include <drm/drm_sysfs.h>
 #include <drm/drm_print.h>
@@ -512,3 +517,1107 @@ bool drm_hdcp_atomic_check(struct drm_connector *connector,
 	return old_hdcp != new_hdcp;
 }
 EXPORT_SYMBOL(drm_hdcp_atomic_check);
+
+struct drm_hdcp_helper_data {
+	struct mutex mutex;
+	struct mutex *driver_mutex;
+
+	struct drm_connector *connector;
+	const struct drm_hdcp_helper_funcs *funcs;
+
+	u64 value;
+	unsigned int enabled_type;
+
+	struct delayed_work check_work;
+	struct work_struct prop_work;
+
+	struct drm_dp_aux *aux;
+	const struct drm_hdcp_hdcp1_receiver_reg_lut *hdcp1_lut;
+};
+
+struct drm_hdcp_hdcp1_receiver_reg_lut {
+	unsigned int bksv;
+	unsigned int ri;
+	unsigned int aksv;
+	unsigned int an;
+	unsigned int ainfo;
+	unsigned int v[5];
+	unsigned int bcaps;
+	unsigned int bcaps_mask_repeater_present;
+	unsigned int bstatus;
+};
+
+static const struct drm_hdcp_hdcp1_receiver_reg_lut drm_hdcp_hdcp1_ddc_lut = {
+	.bksv = DRM_HDCP_DDC_BKSV,
+	.ri = DRM_HDCP_DDC_RI_PRIME,
+	.aksv = DRM_HDCP_DDC_AKSV,
+	.an = DRM_HDCP_DDC_AN,
+	.ainfo = DRM_HDCP_DDC_AINFO,
+	.v = { DRM_HDCP_DDC_V_PRIME(0), DRM_HDCP_DDC_V_PRIME(1),
+	       DRM_HDCP_DDC_V_PRIME(2), DRM_HDCP_DDC_V_PRIME(3),
+	       DRM_HDCP_DDC_V_PRIME(4) },
+	.bcaps = DRM_HDCP_DDC_BCAPS,
+	.bcaps_mask_repeater_present = DRM_HDCP_DDC_BCAPS_REPEATER_PRESENT,
+	.bstatus = DRM_HDCP_DDC_BSTATUS,
+};
+
+static const struct drm_hdcp_hdcp1_receiver_reg_lut drm_hdcp_hdcp1_dpcd_lut = {
+	.bksv = DP_AUX_HDCP_BKSV,
+	.ri = DP_AUX_HDCP_RI_PRIME,
+	.aksv = DP_AUX_HDCP_AKSV,
+	.an = DP_AUX_HDCP_AN,
+	.ainfo = DP_AUX_HDCP_AINFO,
+	.v = { DP_AUX_HDCP_V_PRIME(0), DP_AUX_HDCP_V_PRIME(1),
+	       DP_AUX_HDCP_V_PRIME(2), DP_AUX_HDCP_V_PRIME(3),
+	       DP_AUX_HDCP_V_PRIME(4) },
+	.bcaps = DP_AUX_HDCP_BCAPS,
+	.bcaps_mask_repeater_present = DP_BCAPS_REPEATER_PRESENT,
+
+	/*
+	 * For some reason the HDMI and DP HDCP specs call this register
+	 * definition by different names. In the HDMI spec, it's called BSTATUS,
+	 * but in DP it's called BINFO.
+	 */
+	.bstatus = DP_AUX_HDCP_BINFO,
+};
+
+static int drm_hdcp_remote_ddc_read(struct i2c_adapter *i2c,
+				    unsigned int offset, u8 *value, size_t len)
+{
+	int ret;
+	u8 start = offset & 0xff;
+	struct i2c_msg msgs[] = { {
+					  .addr = DRM_HDCP_DDC_ADDR,
+					  .flags = 0,
+					  .len = 1,
+					  .buf = &start,
+				  },
+				  { .addr = DRM_HDCP_DDC_ADDR,
+				    .flags = I2C_M_RD,
+				    .len = len,
+				    .buf = value } };
+	ret = i2c_transfer(i2c, msgs, ARRAY_SIZE(msgs));
+	if (ret == ARRAY_SIZE(msgs))
+		return 0;
+	return ret >= 0 ? -EIO : ret;
+}
+
+static int drm_hdcp_remote_dpcd_read(struct drm_dp_aux *aux,
+				     unsigned int offset, u8 *value, size_t len)
+{
+	ssize_t ret;
+
+	ret = drm_dp_dpcd_read(aux, offset, value, len);
+	if (ret != len) {
+		if (ret >= 0)
+			return -EIO;
+		return ret;
+	}
+
+	return 0;
+}
+
+static int drm_hdcp_remote_read(struct drm_hdcp_helper_data *data,
+				unsigned int offset, u8 *value, u8 len)
+{
+	if (data->aux)
+		return drm_hdcp_remote_dpcd_read(data->aux, offset, value, len);
+	else
+		return drm_hdcp_remote_ddc_read(data->connector->ddc, offset,
+						value, len);
+}
+
+static int drm_hdcp_remote_ddc_write(struct i2c_adapter *i2c,
+				     unsigned int offset, u8 *buffer,
+				     size_t size)
+{
+	int ret;
+	u8 *write_buf;
+	struct i2c_msg msg;
+
+	write_buf = kzalloc(size + 1, GFP_KERNEL);
+	if (!write_buf)
+		return -ENOMEM;
+
+	write_buf[0] = offset & 0xff;
+	memcpy(&write_buf[1], buffer, size);
+
+	msg.addr = DRM_HDCP_DDC_ADDR;
+	msg.flags = 0, msg.len = size + 1, msg.buf = write_buf;
+
+	ret = i2c_transfer(i2c, &msg, 1);
+	if (ret == 1)
+		ret = 0;
+	else if (ret >= 0)
+		ret = -EIO;
+
+	kfree(write_buf);
+	return ret;
+}
+
+static int drm_hdcp_remote_dpcd_write(struct drm_dp_aux *aux,
+				      unsigned int offset, u8 *value,
+				      size_t len)
+{
+	ssize_t ret;
+
+	ret = drm_dp_dpcd_write(aux, offset, value, len);
+	if (ret != len) {
+		if (ret >= 0)
+			return -EIO;
+		return ret;
+	}
+
+	return 0;
+}
+
+static int drm_hdcp_remote_write(struct drm_hdcp_helper_data *data,
+				 unsigned int offset, u8 *value, u8 len)
+{
+	if (data->aux)
+		return drm_hdcp_remote_dpcd_write(data->aux, offset, value,
+						  len);
+	else
+		return drm_hdcp_remote_ddc_write(data->connector->ddc, offset,
+						 value, len);
+}
+
+static bool drm_hdcp_is_ksv_valid(struct drm_hdcp_ksv *ksv)
+{
+	/* Valid Ksv has 20 0's and 20 1's */
+	return hweight32(ksv->words[0]) + hweight32(ksv->words[1]) == 20;
+}
+
+static int drm_hdcp_read_valid_bksv(struct drm_hdcp_helper_data *data,
+				    struct drm_hdcp_ksv *bksv)
+{
+	int ret, i, tries = 2;
+
+	/* HDCP spec states that we must retry the bksv if it is invalid */
+	for (i = 0; i < tries; i++) {
+		ret = drm_hdcp_remote_read(data, data->hdcp1_lut->bksv,
+					   bksv->bytes, DRM_HDCP_KSV_LEN);
+		if (ret)
+			return ret;
+
+		if (drm_hdcp_is_ksv_valid(bksv))
+			break;
+	}
+	if (i == tries) {
+		drm_dbg_kms(data->connector->dev, "Bksv is invalid %*ph\n",
+			    DRM_HDCP_KSV_LEN, bksv->bytes);
+		return -ENODEV;
+	}
+
+	return 0;
+}
+
+/**
+ * drm_hdcp_helper_hdcp1_capable - Checks if the sink is capable of HDCP 1.x.
+ *
+ * @data: pointer to the HDCP helper data.
+ * @capable: pointer to a bool which will contain true if the sink is capable.
+ *
+ * Returns:
+ * -errno if the transacation between source and sink fails.
+ */
+int drm_hdcp_helper_hdcp1_capable(struct drm_hdcp_helper_data *data,
+				  bool *capable)
+{
+	/*
+	 * DisplayPort has a dedicated bit for this in DPCD whereas HDMI spec
+	 * states that transmitters should use bksv to determine capability.
+	 */
+	if (data->aux) {
+		int ret;
+		u8 bcaps;
+
+		ret = drm_hdcp_remote_read(data, data->hdcp1_lut->bcaps, &bcaps,
+					   1);
+		*capable = !ret && (bcaps & DP_BCAPS_HDCP_CAPABLE);
+	} else {
+		struct drm_hdcp_ksv bksv;
+
+		*capable = drm_hdcp_read_valid_bksv(data, &bksv) == 0;
+	}
+
+	return 0;
+}
+EXPORT_SYMBOL(drm_hdcp_helper_hdcp1_capable);
+
+static void drm_hdcp_update_value(struct drm_hdcp_helper_data *data, u64 value,
+				  bool update_property)
+{
+	WARN_ON(!mutex_is_locked(&data->mutex));
+
+	data->value = value;
+	if (update_property) {
+		drm_connector_get(data->connector);
+		schedule_work(&data->prop_work);
+	}
+}
+
+static int
+drm_hdcp_helper_hdcp1_ksv_fifo_ready(struct drm_hdcp_helper_data *data)
+{
+	int ret;
+	u8 val, mask;
+
+	/* KSV FIFO ready bit is stored in different locations on DP v. HDMI */
+	if (data->aux) {
+		ret = drm_hdcp_remote_dpcd_read(data->aux, DP_AUX_HDCP_BSTATUS,
+						&val, 1);
+		mask = DP_BSTATUS_READY;
+	} else {
+		ret = drm_hdcp_remote_ddc_read(data->connector->ddc,
+					       DRM_HDCP_DDC_BCAPS, &val, 1);
+		mask = DRM_HDCP_DDC_BCAPS_KSV_FIFO_READY;
+	}
+	if (ret)
+		return ret;
+	if (val & mask)
+		return 0;
+
+	return -EAGAIN;
+}
+
+static int
+drm_hdcp_helper_hdcp1_read_ksv_fifo(struct drm_hdcp_helper_data *data, u8 *fifo,
+				    u8 num_downstream)
+{
+	struct drm_device *dev = data->connector->dev;
+	int ret, i;
+
+	/* Over HDMI, read the whole thing at once */
+	if (data->connector->ddc) {
+		ret = drm_hdcp_remote_ddc_read(
+			data->connector->ddc, DRM_HDCP_DDC_KSV_FIFO, fifo,
+			num_downstream * DRM_HDCP_KSV_LEN);
+		if (ret)
+			drm_err(dev, "DDC ksv fifo read failed (%d)\n", ret);
+		return ret;
+	}
+
+	/* Over DP, read via 15 byte window (3 entries @ 5 bytes each) */
+	for (i = 0; i < num_downstream; i += 3) {
+		size_t len = min(num_downstream - i, 3) * DRM_HDCP_KSV_LEN;
+		ret = drm_hdcp_remote_dpcd_read(data->aux, DP_AUX_HDCP_KSV_FIFO,
+						fifo + i * DRM_HDCP_KSV_LEN,
+						len);
+		if (ret) {
+			drm_err(dev, "Read ksv[%d] from DP/AUX failed (%d)\n",
+				i, ret);
+			return ret;
+		}
+	}
+
+	return 0;
+}
+
+static int drm_hdcp_helper_hdcp1_read_v_prime(struct drm_hdcp_helper_data *data,
+					      u32 *v_prime)
+{
+	struct drm_device *dev = data->connector->dev;
+	int ret, i;
+
+	for (i = 0; i < DRM_HDCP_V_PRIME_NUM_PARTS; i++) {
+		ret = drm_hdcp_remote_read(data, data->hdcp1_lut->v[i],
+					   (u8 *)&v_prime[i],
+					   DRM_HDCP_V_PRIME_PART_LEN);
+		if (ret) {
+			drm_dbg_kms(dev, "Read v'[%d] from failed (%d)\n", i,
+				    ret);
+			return ret >= 0 ? -EIO : ret;
+		}
+	}
+	return 0;
+}
+
+static int
+drm_hdcp_helper_hdcp1_authenticate_downstream(struct drm_hdcp_helper_data *data)
+{
+	struct drm_connector *connector = data->connector;
+	struct drm_device *dev = connector->dev;
+	u32 v_prime[DRM_HDCP_V_PRIME_NUM_PARTS];
+	u8 bstatus[DRM_HDCP_BSTATUS_LEN];
+	u8 num_downstream, *ksv_fifo;
+	int ret, i, tries = 3;
+
+	ret = read_poll_timeout(drm_hdcp_helper_hdcp1_ksv_fifo_ready, ret, !ret,
+				10 * 1000, 5 * 1000 * 1000, false, data);
+	if (ret) {
+		drm_err(dev, "Failed to poll ksv ready, %d\n", ret);
+		return ret;
+	}
+
+	ret = drm_hdcp_remote_read(data, data->hdcp1_lut->bstatus, bstatus,
+				   DRM_HDCP_BSTATUS_LEN);
+	if (ret)
+		return ret;
+
+	/*
+	 * When repeater reports 0 device count, HDCP1.4 spec allows disabling
+	 * the HDCP encryption. That implies that repeater can't have its own
+	 * display. As there is no consumption of encrypted content in the
+	 * repeater with 0 downstream devices, we are failing the
+	 * authentication.
+	 */
+	num_downstream = DRM_HDCP_NUM_DOWNSTREAM(bstatus[0]);
+	if (num_downstream == 0) {
+		drm_err(dev, "Repeater with zero downstream devices, %*ph\n",
+			DRM_HDCP_BSTATUS_LEN, bstatus);
+		return -EINVAL;
+	}
+
+	ksv_fifo = kcalloc(DRM_HDCP_KSV_LEN, num_downstream, GFP_KERNEL);
+	if (!ksv_fifo)
+		return -ENOMEM;
+
+	ret = drm_hdcp_helper_hdcp1_read_ksv_fifo(data, ksv_fifo,
+						  num_downstream);
+	if (ret) {
+		drm_err(dev, "Failed to read ksv fifo, %d/%d\n", num_downstream,
+			ret);
+		goto out;
+	}
+
+	if (drm_hdcp_check_ksvs_revoked(dev, ksv_fifo, num_downstream)) {
+		drm_err(dev, "Revoked Ksv(s) in ksv_fifo\n");
+		ret = -EPERM;
+		goto out;
+	}
+
+	/*
+	 * When V prime mismatches, DP Spec mandates re-read of
+	 * V prime at least twice.
+	 */
+	for (i = 0; i < tries; i++) {
+		ret = drm_hdcp_helper_hdcp1_read_v_prime(data, v_prime);
+		if (ret)
+			continue;
+
+		ret = data->funcs->hdcp1_store_ksv_fifo(
+			connector, ksv_fifo, num_downstream, bstatus, v_prime);
+		if (!ret)
+			break;
+	}
+	if (ret)
+		drm_err(dev, "Could not validate KSV FIFO with V' %d\n", ret);
+
+out:
+	if (!ret)
+		drm_dbg_kms(dev, "HDCP is enabled (%d downstream devices)\n",
+			    num_downstream);
+
+	kfree(ksv_fifo);
+	return ret;
+}
+
+static int drm_hdcp_helper_hdcp1_validate_ri(struct drm_hdcp_helper_data *data)
+{
+	union {
+		u32 word;
+		u8 bytes[DRM_HDCP_RI_LEN];
+	} ri_prime = { .word = 0 };
+	struct drm_connector *connector = data->connector;
+	struct drm_device *dev = connector->dev;
+	int ret;
+
+	ret = drm_hdcp_remote_read(data, data->hdcp1_lut->ri, ri_prime.bytes,
+				   DRM_HDCP_RI_LEN);
+	if (ret) {
+		drm_err(dev, "Failed to read R0' %d\n", ret);
+		return ret;
+	}
+
+	return data->funcs->hdcp1_match_ri(connector, ri_prime.word);
+}
+
+static int drm_hdcp_helper_hdcp1_authenticate(struct drm_hdcp_helper_data *data)
+{
+	union {
+		u32 word;
+		u8 bytes[DRM_HDCP_BSTATUS_LEN];
+	} bstatus;
+	const struct drm_hdcp_helper_funcs *funcs = data->funcs;
+	struct drm_connector *connector = data->connector;
+	struct drm_device *dev = connector->dev;
+	unsigned long r0_prime_timeout, r0_prime_remaining_us = 0, tmp_jiffies;
+	struct drm_hdcp_ksv aksv;
+	struct drm_hdcp_ksv bksv;
+	struct drm_hdcp_an an;
+	bool repeater_present;
+	int ret, i, tries = 3;
+	u8 bcaps;
+
+	if (funcs->hdcp1_read_an_aksv) {
+		ret = funcs->hdcp1_read_an_aksv(connector, an.words,
+						aksv.words);
+		if (ret) {
+			drm_err(dev, "Failed to read An/Aksv values, %d\n",
+				ret);
+			return ret;
+		}
+
+		ret = drm_hdcp_remote_write(data, data->hdcp1_lut->an, an.bytes,
+					    DRM_HDCP_AN_LEN);
+		if (ret) {
+			drm_err(dev, "Failed to write An to receiver, %d\n",
+				ret);
+			return ret;
+		}
+
+		ret = drm_hdcp_remote_write(data, data->hdcp1_lut->aksv,
+					    aksv.bytes, DRM_HDCP_KSV_LEN);
+		if (ret) {
+			drm_err(dev, "Failed to write Aksv to receiver, %d\n",
+				ret);
+			return ret;
+		}
+	} else {
+		ret = funcs->hdcp1_send_an_aksv(connector);
+		if (ret) {
+			drm_err(dev, "Failed to read An/Aksv values, %d\n",
+				ret);
+			return ret;
+		}
+	}
+
+	/*
+	 * Timeout for R0' to become available. The spec says 100ms from Aksv,
+	 * but some monitors can take longer than this. We'll set the timeout at
+	 * 300ms just to be sure.
+	 */
+	r0_prime_timeout = jiffies + msecs_to_jiffies(300);
+
+	memset(&bksv, 0, sizeof(bksv));
+
+	ret = drm_hdcp_read_valid_bksv(data, &bksv);
+	if (ret < 0)
+		return ret;
+
+	if (drm_hdcp_check_ksvs_revoked(dev, bksv.bytes, 1)) {
+		drm_err(dev, "BKSV is revoked\n");
+		return -EPERM;
+	}
+
+	ret = drm_hdcp_remote_read(data, data->hdcp1_lut->bcaps, &bcaps, 1);
+	if (ret)
+		return ret;
+
+	memset(&bstatus, 0, sizeof(bstatus));
+
+	ret = drm_hdcp_remote_read(data, data->hdcp1_lut->bstatus,
+				   bstatus.bytes, DRM_HDCP_BSTATUS_LEN);
+	if (ret)
+		return ret;
+
+	if (DRM_HDCP_MAX_DEVICE_EXCEEDED(bstatus.bytes[0]) ||
+	    DRM_HDCP_MAX_CASCADE_EXCEEDED(bstatus.bytes[1])) {
+		drm_err(dev, "Max Topology Limit Exceeded, bstatus=%*ph\n",
+			DRM_HDCP_BSTATUS_LEN, bstatus.bytes);
+		return -EPERM;
+	}
+
+	repeater_present = bcaps & data->hdcp1_lut->bcaps_mask_repeater_present;
+
+	ret = funcs->hdcp1_store_receiver_info(
+		connector, bksv.words, bstatus.word, bcaps, repeater_present);
+	if (ret) {
+		drm_err(dev, "Failed to store bksv, %d\n", ret);
+		return ret;
+	}
+
+	ret = funcs->hdcp1_enable_encryption(connector);
+	if (ret)
+		return ret;
+
+	ret = funcs->hdcp1_wait_for_r0(connector);
+	if (ret)
+		return ret;
+
+	tmp_jiffies = jiffies;
+	if (time_before(tmp_jiffies, r0_prime_timeout))
+		r0_prime_remaining_us =
+			jiffies_to_usecs(r0_prime_timeout - tmp_jiffies);
+
+	/*
+	 * Wait for R0' to become available.
+	 *
+	 * On DP, there's an R0_READY bit available but no such bit
+	 * exists on HDMI. So poll the ready bit for DP and just wait the
+	 * remainder of the 300 ms timeout for HDMI.
+	 */
+	if (data->aux) {
+		u8 val;
+		ret = read_poll_timeout(
+			drm_hdcp_remote_dpcd_read, ret,
+			!ret && (val & DP_BSTATUS_R0_PRIME_READY), 1000,
+			r0_prime_remaining_us, false, data->aux,
+			DP_AUX_HDCP_BSTATUS, &val, 1);
+		if (ret) {
+			drm_err(dev, "R0' did not become ready %d\n", ret);
+			return ret;
+		}
+	} else {
+		usleep_range(r0_prime_remaining_us,
+			     r0_prime_remaining_us + 1000);
+	}
+
+	/*
+	 * DP HDCP Spec mandates the two more reattempt to read R0, in case
+	 * of R0 mismatch.
+	 */
+	for (i = 0; i < tries; i++) {
+		ret = drm_hdcp_helper_hdcp1_validate_ri(data);
+		if (!ret)
+			break;
+	}
+	if (ret) {
+		drm_err(dev, "Failed to match R0/R0', aborting HDCP %d\n", ret);
+		return ret;
+	}
+
+	if (repeater_present)
+		return drm_hdcp_helper_hdcp1_authenticate_downstream(data);
+
+	drm_dbg_kms(dev, "HDCP is enabled (no repeater present)\n");
+	return 0;
+}
+
+static int drm_hdcp_helper_hdcp1_enable(struct drm_hdcp_helper_data *data)
+{
+	struct drm_connector *connector = data->connector;
+	struct drm_device *dev = connector->dev;
+	int i, ret, tries = 3;
+
+	drm_dbg_kms(dev, "[%s:%d] HDCP is being enabled...\n", connector->name,
+		    connector->base.id);
+
+	/* In case of authentication failures, HDCP spec expects reauth. */
+	for (i = 0; i < tries; i++) {
+		ret = drm_hdcp_helper_hdcp1_authenticate(data);
+		if (!ret)
+			return 0;
+
+		drm_dbg_kms(dev, "HDCP Auth failure (%d)\n", ret);
+
+		/* Ensuring HDCP encryption and signalling are stopped. */
+		data->funcs->hdcp1_disable(data->connector);
+	}
+
+	drm_err(dev, "HDCP authentication failed (%d tries/%d)\n", tries, ret);
+	return ret;
+}
+
+static inline void
+drm_hdcp_helper_driver_lock(struct drm_hdcp_helper_data *data)
+{
+	if (data->driver_mutex)
+		mutex_lock(data->driver_mutex);
+}
+
+static inline void
+drm_hdcp_helper_driver_unlock(struct drm_hdcp_helper_data *data)
+{
+	if (data->driver_mutex)
+		mutex_unlock(data->driver_mutex);
+}
+
+static int drm_hdcp_helper_enable_hdcp(struct drm_hdcp_helper_data *data,
+				       struct drm_atomic_state *state,
+				       struct mutex *driver_mutex)
+{
+	struct drm_connector *connector = data->connector;
+	struct drm_connector_state *conn_state;
+	struct drm_device *dev = connector->dev;
+	unsigned long check_link_interval = DRM_HDCP2_CHECK_PERIOD_MS;
+	bool capable;
+	int ret = 0;
+
+	conn_state = drm_atomic_get_new_connector_state(state, connector);
+
+	mutex_lock(&data->mutex);
+
+	if (data->value == DRM_MODE_CONTENT_PROTECTION_ENABLED) {
+		drm_hdcp_update_value(data, DRM_MODE_CONTENT_PROTECTION_ENABLED,
+				      true);
+		goto out_data_mutex;
+	}
+
+	drm_WARN_ON(dev, data->driver_mutex != NULL);
+	data->driver_mutex = driver_mutex;
+
+	drm_hdcp_helper_driver_lock(data);
+
+	if (data->funcs->setup) {
+		ret = data->funcs->setup(connector, state);
+		if (ret) {
+			drm_err(dev, "Failed to setup HDCP %d\n", ret);
+			goto out;
+		}
+	}
+
+	if (!data->funcs->are_keys_valid ||
+	    !data->funcs->are_keys_valid(connector)) {
+		if (data->funcs->load_keys) {
+			ret = data->funcs->load_keys(connector);
+			if (ret) {
+				drm_err(dev, "Failed to load HDCP keys %d\n",
+					ret);
+				goto out;
+			}
+		}
+	}
+
+	/*
+	 * Considering that HDCP2.2 is more secure than HDCP1.4, If the setup
+	 * is capable of HDCP2.2, it is preferred to use HDCP2.2.
+	 */
+	ret = data->funcs->hdcp2_capable(connector, &capable);
+	if (ret) {
+		drm_err(dev, "HDCP 2.x capability check failed %d\n", ret);
+		goto out;
+	}
+	if (capable) {
+		data->enabled_type = DRM_MODE_HDCP_CONTENT_TYPE1;
+		ret = data->funcs->hdcp2_enable(connector);
+		if (!ret) {
+			check_link_interval = DRM_HDCP2_CHECK_PERIOD_MS;
+			goto out;
+		}
+	}
+
+	/*
+	 * When HDCP2.2 fails and Content Type is not Type1, HDCP1.4 will
+	 * be attempted.
+	 */
+	ret = drm_hdcp_helper_hdcp1_capable(data, &capable);
+	if (ret) {
+		drm_err(dev, "HDCP 1.x capability check failed %d\n", ret);
+		goto out;
+	}
+	if (capable &&
+	    conn_state->content_type != DRM_MODE_HDCP_CONTENT_TYPE1) {
+		data->enabled_type = DRM_MODE_HDCP_CONTENT_TYPE0;
+		ret = drm_hdcp_helper_hdcp1_enable(data);
+		if (!ret)
+			check_link_interval = DRM_HDCP_CHECK_PERIOD_MS;
+	}
+
+out:
+	if (!ret) {
+		schedule_delayed_work(&data->check_work, check_link_interval);
+		drm_hdcp_update_value(data, DRM_MODE_CONTENT_PROTECTION_ENABLED,
+				      true);
+	}
+
+	drm_hdcp_helper_driver_unlock(data);
+	if (ret)
+		data->driver_mutex = NULL;
+
+out_data_mutex:
+	mutex_unlock(&data->mutex);
+	return ret;
+}
+
+static int drm_hdcp_helper_disable_hdcp(struct drm_hdcp_helper_data *data)
+{
+	int ret = 0;
+
+	mutex_lock(&data->mutex);
+	drm_hdcp_helper_driver_lock(data);
+
+	if (data->value == DRM_MODE_CONTENT_PROTECTION_UNDESIRED)
+		goto out;
+
+	drm_dbg_kms(data->connector->dev, "[%s:%d] HDCP is being disabled...\n",
+		    data->connector->name, data->connector->base.id);
+
+	drm_hdcp_update_value(data, DRM_MODE_CONTENT_PROTECTION_UNDESIRED,
+			      true);
+
+	if (data->enabled_type == DRM_MODE_HDCP_CONTENT_TYPE1)
+		ret = data->funcs->hdcp2_disable(data->connector);
+	else
+		ret = data->funcs->hdcp1_disable(data->connector);
+
+	drm_dbg_kms(data->connector->dev, "HDCP is disabled\n");
+
+out:
+	drm_hdcp_helper_driver_unlock(data);
+	data->driver_mutex = NULL;
+	mutex_unlock(&data->mutex);
+	cancel_delayed_work_sync(&data->check_work);
+	return ret;
+}
+
+/**
+ * drm_hdcp_helper_atomic_commit - Helper for drivers to call during commit to
+ * enable/disable HDCP
+ *
+ * @data: pointer to the @drm_hdcp_helper_data for the connector
+ * @state: pointer to the atomic state being committed
+ * @driver_mutex: driver-provided lock to be used while interacting with the driver
+ *
+ * This function can be used by display drivers to determine when HDCP should be
+ * enabled or disabled based on the connector state. It should be called during
+ * steady-state commits as well as connector enable/disable. The function will
+ * handle the HDCP authentication/encryption logic, calling back into the driver
+ * when source operations are necessary.
+ *
+ * @driver_mutex will be retained and used for the duration of the HDCP session
+ * since it will be needed for link checks and retries. This mutex is useful if
+ * the driver has shared resources across connectors which must be serialized.
+ * For example, driver_mutex can be used for MST connectors sharing a common
+ * encoder which should not be accessed/changed concurrently. When the
+ * connector's session is torn down, the mutex will be forgotten by the helper
+ * for this connector until the next session.
+ */
+void drm_hdcp_helper_atomic_commit(struct drm_hdcp_helper_data *data,
+				   struct drm_atomic_state *state,
+				   struct mutex *driver_mutex)
+{
+	struct drm_connector *connector = data->connector;
+	struct drm_connector_state *conn_state;
+	bool type_changed;
+
+	conn_state = drm_atomic_get_new_connector_state(state, connector);
+
+	type_changed = conn_state->hdcp_content_type != data->enabled_type;
+
+	if (conn_state->content_protection ==
+	    DRM_MODE_CONTENT_PROTECTION_UNDESIRED) {
+		drm_hdcp_helper_disable_hdcp(data);
+		return;
+	}
+
+	if (!conn_state->crtc) {
+		drm_hdcp_helper_disable_hdcp(data);
+
+		/* Restore property to DESIRED so it's retried later */
+		if (conn_state->content_protection ==
+		    DRM_MODE_CONTENT_PROTECTION_ENABLED) {
+			mutex_lock(&data->mutex);
+			drm_hdcp_update_value(
+				data, DRM_MODE_CONTENT_PROTECTION_DESIRED,
+				true);
+			mutex_unlock(&data->mutex);
+		}
+		return;
+	}
+
+	/* Already enabled */
+	if (conn_state->content_protection ==
+	    DRM_MODE_CONTENT_PROTECTION_ENABLED)
+		return;
+
+	/* Disable and re-enable HDCP on content type change */
+	if (type_changed)
+		drm_hdcp_helper_disable_hdcp(data);
+
+	drm_hdcp_helper_enable_hdcp(data, state, driver_mutex);
+}
+EXPORT_SYMBOL(drm_hdcp_helper_atomic_commit);
+
+static void drm_hdcp_helper_prop_work(struct work_struct *work)
+{
+	struct drm_hdcp_helper_data *data =
+		container_of(work, struct drm_hdcp_helper_data, prop_work);
+	struct drm_connector *connector = data->connector;
+	struct drm_device *dev = connector->dev;
+
+	drm_modeset_lock(&dev->mode_config.connection_mutex, NULL);
+	mutex_lock(&data->mutex);
+
+	/*
+	 * This worker is only used to flip between ENABLED/DESIRED. Either of
+	 * those to UNDESIRED is handled by core. If value == UNDESIRED,
+	 * we're running just after hdcp has been disabled, so just exit
+	 */
+	if (data->value != DRM_MODE_CONTENT_PROTECTION_UNDESIRED)
+		drm_hdcp_update_content_protection(connector, data->value);
+
+	mutex_unlock(&data->mutex);
+	drm_modeset_unlock(&dev->mode_config.connection_mutex);
+}
+
+static int drm_hdcp_hdcp1_check_link(struct drm_hdcp_helper_data *data)
+{
+	struct drm_connector *connector = data->connector;
+	struct drm_device *dev = connector->dev;
+	int ret;
+
+	if (data->funcs->hdcp1_check_link) {
+		ret = data->funcs->hdcp1_check_link(connector);
+		if (ret)
+			goto retry;
+	}
+
+	/* The link is checked differently for DP and HDMI */
+	if (data->aux) {
+		u8 bstatus;
+		ret = drm_hdcp_remote_dpcd_read(data->aux, DP_AUX_HDCP_BSTATUS,
+						&bstatus, 1);
+		if (ret) {
+			drm_err(dev, "Failed to read dpcd bstatus, %d\n", ret);
+			return ret;
+		}
+		if (bstatus & (DP_BSTATUS_LINK_FAILURE | DP_BSTATUS_REAUTH_REQ))
+			ret = -EINVAL;
+	} else {
+		ret = drm_hdcp_helper_hdcp1_validate_ri(data);
+		if (ret)
+			drm_err(dev, "Ri' mismatch, check failed (%d)\n", ret);
+	}
+	if (!ret)
+		return 0;
+
+retry:
+	drm_err(dev, "[%s:%d] HDCP link failed, retrying authentication\n",
+		connector->name, connector->base.id);
+
+	ret = data->funcs->hdcp1_disable(connector);
+	if (ret) {
+		drm_err(dev, "Failed to disable hdcp (%d)\n", ret);
+		drm_hdcp_update_value(data, DRM_MODE_CONTENT_PROTECTION_DESIRED,
+				      true);
+		return ret;
+	}
+
+	ret = drm_hdcp_helper_hdcp1_enable(data);
+	if (ret) {
+		drm_err(dev, "Failed to enable hdcp (%d)\n", ret);
+		drm_hdcp_update_value(data, DRM_MODE_CONTENT_PROTECTION_DESIRED,
+				      true);
+		return ret;
+	}
+
+	return 0;
+}
+
+static int drm_hdcp_hdcp2_check_link(struct drm_hdcp_helper_data *data)
+{
+	struct drm_connector *connector = data->connector;
+	struct drm_device *dev = connector->dev;
+	int ret;
+
+	ret = data->funcs->hdcp2_check_link(connector);
+	if (!ret)
+		return 0;
+
+	drm_err(dev, "[%s:%d] HDCP2 link failed, retrying authentication\n",
+		connector->name, connector->base.id);
+
+	ret = data->funcs->hdcp2_disable(connector);
+	if (ret) {
+		drm_err(dev, "Failed to disable hdcp2 (%d)\n", ret);
+		drm_hdcp_update_value(data, DRM_MODE_CONTENT_PROTECTION_DESIRED,
+				      true);
+		return ret;
+	}
+
+	ret = data->funcs->hdcp2_enable(connector);
+	if (ret) {
+		drm_err(dev, "Failed to enable hdcp2 (%d)\n", ret);
+		drm_hdcp_update_value(data, DRM_MODE_CONTENT_PROTECTION_DESIRED,
+				      true);
+		return ret;
+	}
+
+	return 0;
+}
+
+static void drm_hdcp_helper_check_work(struct work_struct *work)
+{
+	struct drm_hdcp_helper_data *data = container_of(
+		to_delayed_work(work), struct drm_hdcp_helper_data, check_work);
+	unsigned long check_link_interval;
+
+	mutex_lock(&data->mutex);
+	if (data->value != DRM_MODE_CONTENT_PROTECTION_ENABLED)
+		goto out_data_mutex;
+
+	drm_hdcp_helper_driver_lock(data);
+
+	if (data->enabled_type == DRM_MODE_HDCP_CONTENT_TYPE1) {
+		if (drm_hdcp_hdcp2_check_link(data))
+			goto out;
+		check_link_interval = DRM_HDCP2_CHECK_PERIOD_MS;
+	} else {
+		if (drm_hdcp_hdcp1_check_link(data))
+			goto out;
+		check_link_interval = DRM_HDCP_CHECK_PERIOD_MS;
+	}
+	schedule_delayed_work(&data->check_work, check_link_interval);
+
+out:
+	drm_hdcp_helper_driver_unlock(data);
+out_data_mutex:
+	mutex_unlock(&data->mutex);
+}
+
+/**
+ * drm_hdcp_helper_schedule_hdcp_check - Schedule a check link cycle.
+ *
+ * @data: Pointer to the HDCP helper data.
+ *
+ * This function will kick off a check link cycle on behalf of the caller. This
+ * can be used by DP short hpd interrupt handlers, where the driver must poke
+ * the helper to check the link is still valid.
+ */
+void drm_hdcp_helper_schedule_hdcp_check(struct drm_hdcp_helper_data *data)
+{
+	schedule_delayed_work(&data->check_work, 0);
+}
+EXPORT_SYMBOL(drm_hdcp_helper_schedule_hdcp_check);
+
+static struct drm_hdcp_helper_data *
+drm_hdcp_helper_initialize(struct drm_connector *connector,
+			   const struct drm_hdcp_helper_funcs *funcs,
+			   bool attach_content_type_property)
+{
+	struct drm_hdcp_helper_data *out;
+	int ret;
+
+	out = kzalloc(sizeof(*out), GFP_KERNEL);
+	if (!out)
+		return ERR_PTR(-ENOMEM);
+
+	out->connector = connector;
+	out->funcs = funcs;
+
+	mutex_init(&out->mutex);
+	out->value = DRM_MODE_CONTENT_PROTECTION_UNDESIRED;
+
+	INIT_DELAYED_WORK(&out->check_work, drm_hdcp_helper_check_work);
+	INIT_WORK(&out->prop_work, drm_hdcp_helper_prop_work);
+
+	ret = drm_connector_attach_content_protection_property(
+		connector, attach_content_type_property);
+	if (ret) {
+		drm_hdcp_helper_destroy(out);
+		return ERR_PTR(ret);
+	}
+
+	return out;
+}
+
+/**
+ * drm_hdcp_helper_initialize_dp - Initializes the HDCP helpers for a
+ * DisplayPort connector
+ *
+ * @connector: pointer to the DisplayPort connector.
+ * @funcs: pointer to the vtable of HDCP helper funcs for this connector.
+ * @attach_content_type_property: True if the content_type property should be
+ * attached.
+ *
+ * This function initializes the HDCP helper for the given DisplayPort connector.
+ * This involves creating the Content Protection property as well as the Content
+ * Type property (if desired). Upon success, it will return a pointer to the
+ * HDCP helper data. Ownership of the underlying memory is ttransferredto the
+ * caller and should be freed using drm_hdcp_helper_destroy().
+ *
+ * Returns:
+ * Pointer to newly created HDCP helper data. PTR_ERR on failure.
+ */
+struct drm_hdcp_helper_data *
+drm_hdcp_helper_initialize_dp(struct drm_connector *connector,
+			      struct drm_dp_aux *aux,
+			      const struct drm_hdcp_helper_funcs *funcs,
+			      bool attach_content_type_property)
+{
+	struct drm_hdcp_helper_data *out;
+
+	out = drm_hdcp_helper_initialize(connector, funcs,
+					 attach_content_type_property);
+	if (IS_ERR(out))
+		return out;
+
+	out->aux = aux;
+	out->hdcp1_lut = &drm_hdcp_hdcp1_dpcd_lut;
+
+	return out;
+}
+EXPORT_SYMBOL(drm_hdcp_helper_initialize_dp);
+
+/**
+ * drm_hdcp_helper_initialize_hdmi - Initializes the HDCP helpers for an HDMI
+ * connector
+ *
+ * @connector: pointer to the HDMI connector.
+ * @funcs: pointer to the vtable of HDCP helper funcs for this connector.
+ * @attach_content_type_property: True if the content_type property should be
+ * attached.
+ *
+ * This function initializes the HDCP helper for the given HDMI connector. This
+ * involves creating the Content Protection property as well as the Content Type
+ * property (if desired). Upon success, it will return a pointer to the HDCP
+ * helper data. Ownership of the underlying memory is transferred to the caller
+ * and should be freed using drm_hdcp_helper_destroy().
+ *
+ * Returns:
+ * Pointer to newly created HDCP helper data. PTR_ERR on failure.
+ */
+struct drm_hdcp_helper_data *
+drm_hdcp_helper_initialize_hdmi(struct drm_connector *connector,
+				const struct drm_hdcp_helper_funcs *funcs,
+				bool attach_content_type_property)
+{
+	struct drm_hdcp_helper_data *out;
+
+	out = drm_hdcp_helper_initialize(connector, funcs,
+					 attach_content_type_property);
+	if (IS_ERR(out))
+		return out;
+
+	out->hdcp1_lut = &drm_hdcp_hdcp1_ddc_lut;
+
+	return out;
+}
+EXPORT_SYMBOL(drm_hdcp_helper_initialize_hdmi);
+
+/**
+ * drm_hdcp_helper_destroy - Destroys the given HDCP helper data.
+ *
+ * @data: Pointer to the HDCP helper data.
+ *
+ * This function cleans up and destroys the HDCP helper data created by
+ * drm_hdcp_helper_initialize_dp() or drm_hdcp_helper_initialize_hdmi().
+ */
+void drm_hdcp_helper_destroy(struct drm_hdcp_helper_data *data)
+{
+	struct drm_connector *connector;
+
+	if (!data)
+		return;
+
+	connector = data->connector;
+
+	/*
+	 * If the connector is registered, it's possible userspace could kick
+	 * off another HDCP enable, which would re-spawn the workers.
+	 */
+	drm_WARN_ON(connector->dev,
+		    connector->registration_state == DRM_CONNECTOR_REGISTERED);
+
+	/*
+	 * Now that the connector is not registered, check_work won't be run,
+	 * but cancel any outstanding instances of it
+	 */
+	cancel_delayed_work_sync(&data->check_work);
+
+	/*
+	 * We don't cancel prop_work in the same way as check_work since it
+	 * requires connection_mutex which could be held while calling this
+	 * function. Instead, we rely on the connector references grabbed before
+	 * scheduling prop_work to ensure the connector is alive when prop_work
+	 * is run. So if we're in the destroy path (which is where this
+	 * function should be called), we're "guaranteed" that prop_work is not
+	 * active (tl;dr This Should Never Happen).
+	 */
+	drm_WARN_ON(connector->dev, work_pending(&data->prop_work));
+
+	kfree(data);
+}
+EXPORT_SYMBOL(drm_hdcp_helper_destroy);
diff --git a/include/drm/display/drm_hdcp.h b/include/drm/display/drm_hdcp.h
index 96a99b1377c0..75694baf72d4 100644
--- a/include/drm/display/drm_hdcp.h
+++ b/include/drm/display/drm_hdcp.h
@@ -36,6 +36,7 @@
 #define DRM_HDCP_DDC_BKSV			0x00
 #define DRM_HDCP_DDC_RI_PRIME			0x08
 #define DRM_HDCP_DDC_AKSV			0x10
+#define DRM_HDCP_DDC_AINFO			0x15
 #define DRM_HDCP_DDC_AN				0x18
 #define DRM_HDCP_DDC_V_PRIME(h)			(0x20 + h * 4)
 #define DRM_HDCP_DDC_BCAPS			0x40
@@ -123,6 +124,19 @@
 #define HDCP_2_2_DEV_COUNT_HI(x)		((x) & BIT(0))
 #define HDCP_2_2_DEPTH(x)			(((x) & (0x7 << 1)) >> 1)
 
+struct drm_hdcp_ksv {
+	union {
+		u32 words[2];
+		u8 bytes[DRM_HDCP_KSV_LEN];
+	};
+};
+struct drm_hdcp_an {
+	union {
+		u32 words[2];
+		u8 bytes[DRM_HDCP_AN_LEN];
+	};
+};
+
 struct hdcp2_cert_rx {
 	u8	receiver_id[HDCP_2_2_RECEIVER_ID_LEN];
 	u8	kpub_rx[HDCP_2_2_K_PUB_RX_LEN];
@@ -295,4 +309,156 @@ struct hdcp_srm_header {
 #define DRM_MODE_HDCP_CONTENT_TYPE0		0
 #define DRM_MODE_HDCP_CONTENT_TYPE1		1
 
-#endif
+struct drm_connector;
+struct drm_atomic_state;
+
+/**
+ * struct drm_hdcp_helper_funcs - A vtable of function hooks for the hdcp helper
+ *
+ * These hooks are used by the hdcp helper to call into the driver/connector
+ * code to read/write to hw.
+ */
+struct drm_hdcp_helper_funcs {
+	/**
+	 * @setup - Performs driver-specific setup before hdcp is enabled
+	 *
+	 * Returns: 0 on success, -errno on failure
+	 */
+	int (*setup)(struct drm_connector *connector,
+		     struct drm_atomic_state *state);
+
+	/**
+	 * @are_keys_valid - Checks if the HDCP transmitter keys are valid
+	 *
+	 * Returns: true if the display controller has valid keys loaded
+	 */
+	bool (*are_keys_valid)(struct drm_connector *connector);
+
+	/**
+	 * @load_keys - Instructs the driver to load its HDCP transmitter keys
+	 *
+	 * Returns: 0 on success, -errno on failure
+	 */
+	int (*load_keys)(struct drm_connector *connector);
+
+	/**
+	 * @hdcp2_capable - Checks if both source and sink support HDCP 2.x
+	 *
+	 * Returns: 0 on success, -errno on failure
+	 */
+	int (*hdcp2_capable)(struct drm_connector *connector, bool *capable);
+
+	/**
+	 * @hdcp2_enable - Enables HDCP 2.x on the specified connector
+	 *
+	 * Since we don't have multiple examples of HDCP 2.x enablement, we
+	 * provide the bare minimum support for HDCP 2.x help. Once we have
+	 * more examples, perhaps we can be more helpful.
+	 *
+	 * Returns: 0 on success, -errno on failure
+	 */
+	int (*hdcp2_enable)(struct drm_connector *connector);
+
+	/**
+	 * @hdcp2_check_link - Checks the HDCP 2.x link on a specified connector
+	 *
+	 * Returns: 0 on success, -errno on failure
+	 */
+	int (*hdcp2_check_link)(struct drm_connector *connector);
+
+	/**
+	 * @hdcp2_disable - Disables HDCP 2.x on the specified connector
+	 *
+	 * Returns: 0 on success, -errno on failure
+	 */
+	int (*hdcp2_disable)(struct drm_connector *connector);
+
+	/**
+	 * @hdcp1_read_an_aksv - Reads transmitter's An & Aksv from hardware
+	 *
+	 * Use this function if hardware allows reading the transmitter's An and
+	 * Aksv values from the kernel. If your hardware will not allow this,
+	 * use hdcp1_send_an_aksv() and implement the transmission in the
+	 * driver.
+	 *
+	 * Returns: 0 on success, -errno on failure
+	 */
+	int (*hdcp1_read_an_aksv)(struct drm_connector *connector, u32 *an,
+				  u32 *aksv);
+
+	/**
+	 * @hdcp1_send_an_aksv - Sends transmitter's An & Aksv to the receiver
+	 *
+	 * Only implement this on hardware where An or Aksv are not accessible
+	 * from the kernel. If these values can be read, use
+	 * hdcp1_read_an_aksv() instead.
+	 *
+	 * Returns: 0 on success, -errno on failure
+	 */
+	int (*hdcp1_send_an_aksv)(struct drm_connector *connector);
+
+	/**
+	 * @hdcp1_store_receiver_info - Stores the receiver's info in the transmitter
+	 *
+	 * Returns: 0 on success, -errno on failure
+	 */
+	int (*hdcp1_store_receiver_info)(struct drm_connector *connector,
+					 u32 *ksv, u32 status, u8 caps,
+					 bool repeater_present);
+
+	/**
+	 * @hdcp1_enable_encryption - Enables encryption of the outgoing signal
+	 *
+	 * Returns: 0 on success, -errno on failure
+	 */
+	int (*hdcp1_enable_encryption)(struct drm_connector *connector);
+
+	/**
+	 * @hdcp1_wait_for_r0 - Wait for transmitter to calculate R0
+	 *
+	 * Returns: 0 on success, -errno on failure
+	 */
+	int (*hdcp1_wait_for_r0)(struct drm_connector *connector);
+
+	/**
+	 * @hdcp1_match_ri - Matches the given Ri from the receiver with Ri in
+	 * the transmitter
+	 *
+	 * Returns: 0 on success, -errno on failure
+	 */
+	int (*hdcp1_match_ri)(struct drm_connector *connector, u32 ri_prime);
+
+	/**
+	 * @hdcp1_post_encryption - Allows the driver to confirm encryption and
+	 * perform any post-processing
+	 *
+	 * Returns: 0 on success, -errno on failure
+	 */
+	int (*hdcp1_post_encryption)(struct drm_connector *connector);
+
+	/**
+	 * @hdcp1_store_ksv_fifo - Write the receiver's KSV list to transmitter
+	 *
+	 * Returns: 0 on success, -errno on failure
+	 */
+	int (*hdcp1_store_ksv_fifo)(struct drm_connector *connector,
+				    u8 *ksv_fifo, u8 num_downstream,
+				    u8 *bstatus, u32 *vprime);
+
+	/**
+	 * @hdcp1_check_link - Allows the driver to check the HDCP 1.x status
+	 * on a specified connector
+	 *
+	 * Returns: 0 on success, -errno on failure
+	 */
+	int (*hdcp1_check_link)(struct drm_connector *connector);
+
+	/**
+	 * @hdcp1_disable - Disables HDCP 1.x on the specified connector
+	 *
+	 * Returns: 0 on success, -errno on failure
+	 */
+	int (*hdcp1_disable)(struct drm_connector *connector);
+};
+
+#endif  // INCLUDE_DRM_DISPLAY_DRM_HDCP_H_
diff --git a/include/drm/display/drm_hdcp_helper.h b/include/drm/display/drm_hdcp_helper.h
index cb2cc5002f65..dbbaced148f2 100644
--- a/include/drm/display/drm_hdcp_helper.h
+++ b/include/drm/display/drm_hdcp_helper.h
@@ -15,11 +15,39 @@ struct drm_atomic_state;
 struct drm_device;
 struct drm_connector;
 
+struct drm_hdcp_helper_data;
+struct drm_dp_aux;
+struct i2c_adapter;
+struct mutex;
+
 int drm_hdcp_check_ksvs_revoked(struct drm_device *dev, u8 *ksvs, u32 ksv_count);
 int drm_connector_attach_content_protection_property(struct drm_connector *connector,
 						     bool hdcp_content_type);
 void drm_hdcp_update_content_protection(struct drm_connector *connector, u64 val);
 bool drm_hdcp_atomic_check(struct drm_connector *connector,
 			   struct drm_atomic_state *state);
+void drm_hdcp_atomic_commit(struct drm_atomic_state *state,
+			    struct drm_connector *connector);
+
+struct drm_hdcp_helper_data *
+drm_hdcp_helper_initialize_dp(struct drm_connector *connector,
+			      struct drm_dp_aux *aux,
+			      const struct drm_hdcp_helper_funcs *funcs,
+			      bool attach_content_type_property);
+
+struct drm_hdcp_helper_data *
+drm_hdcp_helper_initialize_hdmi(struct drm_connector *connector,
+				const struct drm_hdcp_helper_funcs *funcs,
+				bool attach_content_type_property);
+
+void drm_hdcp_helper_destroy(struct drm_hdcp_helper_data *data);
+
+int drm_hdcp_helper_hdcp1_capable(struct drm_hdcp_helper_data *data,
+				  bool *capable);
+void drm_hdcp_helper_atomic_commit(struct drm_hdcp_helper_data *data,
+				   struct drm_atomic_state *state,
+				   struct mutex *driver_mutex);
+
+void drm_hdcp_helper_schedule_hdcp_check(struct drm_hdcp_helper_data *data);
 
-#endif
+#endif  // INCLUDE_DRM_DISPLAY_DRM_HDCP_HELPER_H_"
-- 
2.39.0.246.g2a6d74b583-goog

