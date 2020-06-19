Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3F537201B68
	for <lists+linux-arm-msm@lfdr.de>; Fri, 19 Jun 2020 21:38:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389300AbgFSTij (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 19 Jun 2020 15:38:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42382 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2389188AbgFSTii (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 19 Jun 2020 15:38:38 -0400
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com [IPv6:2a00:1450:4864:20::635])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F2147C0613EE
        for <linux-arm-msm@vger.kernel.org>; Fri, 19 Jun 2020 12:38:37 -0700 (PDT)
Received: by mail-ej1-x635.google.com with SMTP id q19so11361405eja.7
        for <linux-arm-msm@vger.kernel.org>; Fri, 19 Jun 2020 12:38:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=pVgK0x2TwSi7Jov7OngaiAXUTMTPC5zJZpCQ8tk/Ujo=;
        b=mMoeX+/4zRXsK5HTW1tps9vIM6DKPGNQ+eTCms6sFZYO4W6y5ZpMhHrEmdIfEcdhC1
         CwzaeySRSjNyDc3O4kAWC4Wh455BqGCHLuZ8xPn9tTT4TyKKhteL7AvXwDZD3rJgzMka
         ATr+tbKEzI/UksAb48Q8JzsvPiNiTUjptROZkQX4lL9fMTANQtwoFxyFfg8Dr0CW4XDp
         qmzNqeZRZMyX8NNYlnr5QalaYorc3XT5sAV5MuJNtqKQW9A3DNr2Y/0JxbDINvUP9jkP
         oSS92kfmGAIFV2Z3xTQzCCWg6MD0aH5PbP6PdUHLwZ8xrzwU72k2jUmjRo4q/aqs/3SY
         ZaAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=pVgK0x2TwSi7Jov7OngaiAXUTMTPC5zJZpCQ8tk/Ujo=;
        b=kwOD8vCfb/3bo6aNwNsZO+NgeLo2BeSlKgYf4yO+OExkIHTFpzmCulwcX5yZOqqf48
         p0xhFsCfF2Op4Feic44CImGbxkfpiO9V6X3F/GsY5LhEZeRNbAJ+CpEvj9jWupHswq0s
         F+DrrjTtCFTw8iUSHXZsZZIB5dkBRfEqgKCnm+K9S28UqwU7t67AILj4u49QsCAr9hT0
         2py2BbLkRLCyVGzXABdEjEFbDXKTzfNr1RQi+kq6CWli92MS5LbT6La4oSm6YLM6awDD
         KorzHsvyjeXrSzc7rATwfP7YBiYnLQ0E1s0xlMreJkKa7EWauhxaGrf5eWcuyOf5kD3V
         +JXw==
X-Gm-Message-State: AOAM532USCTreC9z1UYYNsME9XWLpJwMTqXtDFju05K1ioSAZUevfVie
        MEv7BbL5+snpMzuk4p/PWB2ClAm/UiXmAw==
X-Google-Smtp-Source: ABdhPJyLt91WVzh/pSC9rtSe4pbMNdfViw+JGnB1/4ANu76TneBeen5qkuxzZC766VHA97DWhQNuWg==
X-Received: by 2002:a17:906:22d0:: with SMTP id q16mr5035996eja.455.1592595516418;
        Fri, 19 Jun 2020 12:38:36 -0700 (PDT)
Received: from localhost.localdomain (ppp089210109128.access.hol.gr. [89.210.109.128])
        by smtp.gmail.com with ESMTPSA id dn17sm5310125edb.26.2020.06.19.12.38.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Jun 2020 12:38:35 -0700 (PDT)
From:   Pantelis Antoniou <pantelis.antoniou@linaro.org>
To:     alsa-devel@alsa-project.org
Cc:     devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        Mark Brown <broonie@kernel.org>,
        Matt Porter <mporter@konsulko.com>,
        Shawn Guo <shawn.guo@linaro.org>
Subject: [PATCH 2/2] ASoC: qcom: add apq8039 sound card support
Date:   Fri, 19 Jun 2020 22:38:31 +0300
Message-Id: <20200619193831.12528-3-pantelis.antoniou@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200619193831.12528-1-pantelis.antoniou@linaro.org>
References: <20200619193831.12528-1-pantelis.antoniou@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

This patch adds apq8039 machine driver support.
It is similar to the apq8016 driver but adds an method of
function configuration via an exposed mixer control, with
everything being configurable via DT.

Signed-off-by: Pantelis Antoniou <pantelis.antoniou@linaro.org>
---
 sound/soc/qcom/Kconfig   |    9 +
 sound/soc/qcom/Makefile  |    2 +
 sound/soc/qcom/apq8039.c | 1126 ++++++++++++++++++++++++++++++++++++++
 3 files changed, 1137 insertions(+)
 create mode 100644 sound/soc/qcom/apq8039.c

diff --git a/sound/soc/qcom/Kconfig b/sound/soc/qcom/Kconfig
index f51b28d1b94d..350100781c04 100644
--- a/sound/soc/qcom/Kconfig
+++ b/sound/soc/qcom/Kconfig
@@ -42,6 +42,15 @@ config SND_SOC_APQ8016_SBC
 	  APQ8016 SOC-based systems.
 	  Say Y if you want to use audio devices on MI2S.
 
+config SND_SOC_APQ8039
+	tristate "SoC Audio support for APQ8039 based platforms"
+	depends on SND_SOC_QCOM
+	select SND_SOC_LPASS_APQ8016
+	help
+          Support for Qualcomm Technologies LPASS audio block in
+          APQ8039 SOC-based systems.
+          Say Y if you want to use audio devices on MI2S.
+
 config SND_SOC_QCOM_COMMON
 	tristate
 
diff --git a/sound/soc/qcom/Makefile b/sound/soc/qcom/Makefile
index 41b2c7a23a4d..cc67e240744f 100644
--- a/sound/soc/qcom/Makefile
+++ b/sound/soc/qcom/Makefile
@@ -13,12 +13,14 @@ obj-$(CONFIG_SND_SOC_LPASS_APQ8016) += snd-soc-lpass-apq8016.o
 # Machine
 snd-soc-storm-objs := storm.o
 snd-soc-apq8016-sbc-objs := apq8016_sbc.o
+snd-soc-apq8039-objs := apq8039.o
 snd-soc-apq8096-objs := apq8096.o
 snd-soc-sdm845-objs := sdm845.o
 snd-soc-qcom-common-objs := common.o
 
 obj-$(CONFIG_SND_SOC_STORM) += snd-soc-storm.o
 obj-$(CONFIG_SND_SOC_APQ8016_SBC) += snd-soc-apq8016-sbc.o
+obj-$(CONFIG_SND_SOC_APQ8039) += snd-soc-apq8039.o
 obj-$(CONFIG_SND_SOC_MSM8996) += snd-soc-apq8096.o
 obj-$(CONFIG_SND_SOC_SDM845) += snd-soc-sdm845.o
 obj-$(CONFIG_SND_SOC_QCOM_COMMON) += snd-soc-qcom-common.o
diff --git a/sound/soc/qcom/apq8039.c b/sound/soc/qcom/apq8039.c
new file mode 100644
index 000000000000..0c413cf215dd
--- /dev/null
+++ b/sound/soc/qcom/apq8039.c
@@ -0,0 +1,1126 @@
+// SPDX-License-Identifier: GPL-2.0
+// Copyright (c) 2020, Linaro Limited
+
+// #define DEBUG
+#include <linux/device.h>
+#include <linux/module.h>
+#include <linux/kernel.h>
+#include <linux/io.h>
+#include <linux/of.h>
+#include <linux/clk.h>
+#include <linux/platform_device.h>
+#include <sound/pcm.h>
+#include <sound/pcm_params.h>
+#include <sound/jack.h>
+#include <sound/soc.h>
+#include <uapi/linux/input-event-codes.h>
+#include <dt-bindings/sound/apq8016-lpass.h>
+
+struct ctl_set_node {
+	struct list_head node;
+	char *name;
+	char *value;
+};
+
+struct state_input_node {
+	struct list_head node;
+	const char *name;
+	int state_input;
+};
+
+struct apq8039_data {
+	void __iomem *mic_iomux;
+	void __iomem *spkr_iomux;
+	struct snd_soc_jack jack;
+	bool jack_setup;
+	int headphone_det;
+	int microphone_det;
+	struct list_head ctl_list;
+	struct list_head state_input_list;
+	int num_functions;
+	struct device_node **function_nodes;
+	const char **function_names;
+	struct soc_enum func_enum[1];
+	struct snd_kcontrol_new func_control[1];
+	struct device_node *function_node;
+	struct device_node *cooked_function_node;
+	struct device_node *init_node;
+	struct device_node *shutdown_node;
+	char *control_name;
+	struct snd_soc_dai_link dai_link[];	/* dynamically allocated */
+};
+
+static struct snd_kcontrol *
+snd_soc_card_ctl_find(struct snd_soc_card *card,
+		      const char *name, const char *suffix)
+{
+	struct snd_ctl_elem_id sid;
+
+	memset(&sid, 0, sizeof(sid));
+	if (suffix)
+		snprintf(sid.name, sizeof(sid.name), "%s %s", name, suffix);
+	else
+		snprintf(sid.name, sizeof(sid.name), "%s", name);
+	sid.iface = SNDRV_CTL_ELEM_IFACE_MIXER;
+	return snd_ctl_find_id(card->snd_card, &sid);
+}
+
+static int
+snd_soc_card_ctl_getset(struct snd_soc_card *card,
+			const char *name,
+			char *orig, size_t origsz, const char *value)
+{
+	struct snd_kcontrol *ctl;
+	struct snd_ctl_elem_info *uinfo = NULL;
+	struct snd_ctl_elem_value *uctl = NULL;
+	unsigned int i, count;
+	int ret;
+
+	/* get the control */
+	ctl = snd_soc_card_ctl_find(card, name, NULL);
+	if (!ctl)
+		return -ENOENT;
+
+	/* allocate info and value */
+	uinfo = kzalloc(sizeof(*uinfo), GFP_KERNEL);
+	uctl = kzalloc(sizeof(*uctl), GFP_KERNEL);
+	if (!uinfo || !uctl) {
+		ret = -ENOMEM;
+		goto out_free;
+	}
+
+	ret = ctl->info(ctl, uinfo);
+	if (ret)
+		goto out_free;
+	if (uinfo->count != 1) {
+		ret = -ENOTSUPP;
+		goto out_free;
+	}
+
+	ret = ctl->get(ctl, uctl);
+	if (ret)
+		goto out_free;
+
+	ret = 0;
+
+	switch (uinfo->type) {
+
+	case SNDRV_CTL_ELEM_TYPE_NONE:
+		break;
+
+	case SNDRV_CTL_ELEM_TYPE_BOOLEAN:
+		if (orig && origsz > 0)
+			snprintf(orig, origsz, "%s",
+					uctl->value.integer.value[0] ?
+						"true" : "false");
+
+		if (value) {
+			bool bval;
+
+			ret = kstrtobool(value, &bval);
+			if (ret)
+				goto out_free;
+			uctl->value.integer.value[0] = !!bval;
+
+		}
+		break;
+
+	case SNDRV_CTL_ELEM_TYPE_INTEGER:
+		if (orig && origsz > 0)
+			snprintf(orig, origsz, "%ld",
+					uctl->value.integer.value[0]);
+
+		if (value) {
+			ret = kstrtol(value, 10,
+					&uctl->value.integer.value[0]);
+			if (ret)
+				goto out_free;
+		}
+		break;
+
+	case SNDRV_CTL_ELEM_TYPE_ENUMERATED:
+		count = uinfo->value.enumerated.items;
+
+		if (value) { /* set */
+			for (i = 0; i < count; i++) {
+				uinfo->value.enumerated.item = i;
+				ret = ctl->info(ctl, uinfo);
+				if (ret)
+					goto out_free;
+
+				if (!strcmp(value,
+						uinfo->value.enumerated.name))
+					break;
+			}
+
+			/* setting without finding the enum */
+			if (i >= count) {
+				ret = -EINVAL;
+				goto out_free;
+			}
+			uctl->value.enumerated.item[0] = i;
+		} else { /* get */
+			uinfo->value.enumerated.item =
+				uctl->value.enumerated.item[0];
+			ret = ctl->info(ctl, uinfo);
+			if (ret)
+				goto out_free;
+
+			if (orig && origsz) {
+				if (origsz <
+					strlen(uinfo->value.enumerated.name)
+					+ 1) {
+					ret = -ENOSPC;
+					goto out_free;
+				}
+				strncpy(orig, uinfo->value.enumerated.name,
+						origsz);
+			}
+		}
+		break;
+
+	case SNDRV_CTL_ELEM_TYPE_INTEGER64:
+		if (orig && origsz > 0)
+			snprintf(orig, origsz, "%lld",
+					uctl->value.integer64.value[0]);
+
+		if (value) {
+			ret = kstrtoll(value, 10,
+					&uctl->value.integer64.value[0]);
+			if (ret)
+				goto out_free;
+		}
+		break;
+
+	case SNDRV_CTL_ELEM_TYPE_BYTES:
+	case SNDRV_CTL_ELEM_TYPE_IEC958:
+		ret = -ENOTSUPP;
+		goto out_free;
+	default:
+		ret = -EINVAL;
+		goto out_free;
+	}
+
+	if (value) {
+		ret = ctl->put(ctl, uctl);
+		if (ret < 0)
+			goto out_free;
+
+		/* if it changed, report change to user space */
+		if (ret > 0)
+			snd_ctl_notify(card->snd_card,
+					SNDRV_CTL_EVENT_MASK_VALUE,
+					&uctl->id);
+	}
+
+out_free:
+	kfree(uctl);
+	kfree(uinfo);
+
+	if (ret < 0)
+		dev_err(card->dev, "%s: %s operation failed for \"%s\"",
+				__func__, value ? "set" : "get", name);
+
+	return ret;
+}
+
+static int apq8039_ctl_set(struct snd_soc_card *card,
+			      const char *name, const char *value)
+{
+	struct apq8039_data *pdata = snd_soc_card_get_drvdata(card);
+	struct ctl_set_node *n;
+	char *nvalue;
+
+	list_for_each_entry(n, &pdata->ctl_list, node) {
+		/* if it exists, just update with new value */
+		if (!strcmp(name, n->name)) {
+			nvalue = devm_kstrdup(card->dev, value, GFP_KERNEL);
+			if (!nvalue)
+				return -ENOMEM;
+			devm_kfree(card->dev, n->value);
+			n->value = nvalue;
+			dev_dbg(card->dev, "REP \"%s\" \"%s\"\r\n",
+					n->name, n->value);
+			return 0;
+		}
+	}
+	n = devm_kzalloc(card->dev, sizeof(*n), GFP_KERNEL);
+	if (!n)
+		return -ENOMEM;
+	n->name = devm_kstrdup(card->dev, name, GFP_KERNEL);
+	n->value = devm_kstrdup(card->dev, value, GFP_KERNEL);
+	if (!n->name || !n->value) {
+		/* n is not NULL and kfree can handle NULLs */
+		devm_kfree(card->dev, n->name);
+		devm_kfree(card->dev, n->value);
+		devm_kfree(card->dev, n);
+		return -ENOMEM;
+	}
+	list_add_tail(&n->node, &pdata->ctl_list);
+
+	dev_dbg(card->dev, "NEW \"%s\" \"%s\"\r\n", n->name, n->value);
+
+	return 0;
+}
+
+static int apq8039_ctl_commit(struct snd_soc_card *card)
+{
+	struct apq8039_data *pdata = snd_soc_card_get_drvdata(card);
+	struct ctl_set_node *n, *nn;
+	int res, failed_res;
+	bool modified;
+
+	modified = false;
+	failed_res = 0;
+	list_for_each_entry_safe(n, nn, &pdata->ctl_list, node) {
+
+		list_del(&n->node);
+
+		dev_dbg(card->dev, "CMT \"%s\" \"%s\"\r\n", n->name, n->value);
+		res = snd_soc_card_ctl_getset(card, n->name, NULL, 0, n->value);
+		if (res < 0 && !failed_res)
+			failed_res = res;
+		if (res > 0 && !modified)
+			modified = true;
+
+		devm_kfree(card->dev, n->name);
+		devm_kfree(card->dev, n->value);
+		devm_kfree(card->dev, n);
+	}
+
+	if (failed_res)
+		return failed_res;
+
+	return modified ? 1 : 0;
+}
+
+static bool apq8039_function_is_cooked(struct snd_soc_card *card,
+					  struct device_node *funcnp)
+{
+	int res;
+
+	res = of_property_count_strings(funcnp, "state-inputs");
+	return res >= 1;
+}
+
+static int apq8039_state_input_get(struct snd_soc_card *card,
+				      const char *name)
+{
+	struct apq8039_data *pdata = snd_soc_card_get_drvdata(card);
+	struct state_input_node *n;
+
+	list_for_each_entry(n, &pdata->state_input_list, node) {
+		if (!strcmp(n->name, name))
+			return n->state_input;
+	}
+
+	/* does not exist */
+	return -ENOENT;
+}
+
+static int apq8039_state_get(struct snd_soc_card *card,
+				struct device_node *funcnp)
+{
+	int res = -EINVAL, i, state, count;
+	u32 bits, def, bitpos;
+	const char *state_input;
+
+	res = of_property_count_strings(funcnp, "state-inputs");
+	if (res <= 0) {
+		/* if there's no events property this is a fixed function */
+		res = 0;
+		goto out;
+	}
+	count = res;
+
+	state = 0;
+	bitpos = 0;
+	for (i = 0; i < count; i++) {
+
+		res = of_property_read_string_index(funcnp, "state-inputs",
+				i, &state_input);
+		if (res < 0) {
+			dev_err(card->dev,
+					"Failed to read \"%s\" #%d of \"%s\"\n",
+					"state-inputs", i, funcnp->name);
+			goto out;
+		}
+
+		res = of_property_read_u32_index(funcnp, "state-input-bits",
+					i, &bits);
+		if (res < 0) {
+			dev_err(card->dev,
+					"Failed to read \"%s\" #%d of \"%s\"\n",
+					"state-input-bits", i, funcnp->name);
+			goto out;
+		}
+
+		res = of_property_read_u32_index(funcnp,
+				"state-input-defaults", i, &def);
+		if (res < 0) {
+			dev_err(card->dev,
+					"Failed to read \"%s\" #%d of \"%s\"\n",
+					"state-input-defaults", i,
+					funcnp->name);
+			goto out;
+		}
+
+		if (bitpos + bits >= 32) {
+			dev_err(card->dev,
+					"Too many events for bitstate \"%s\"\n",
+					funcnp->name);
+			res = -EINVAL;
+			goto out;
+		}
+
+		res = apq8039_state_input_get(card, state_input);
+		if (res < 0)
+			res = (int)def;
+
+		dev_dbg(card->dev, "@%s state_input \"%s\" -> %d\n",
+				__func__, state_input, res);
+
+		state |= (res & ((1 << bits) - 1)) << bitpos;
+
+		bitpos += bits;
+	}
+
+	/* return the state */
+	res = state;
+
+	dev_dbg(card->dev, "@%s state 0x%x\n", __func__, state);
+
+out:
+	return res;
+}
+
+static struct device_node *
+apq8039_get_cooked_function(struct snd_soc_card *card,
+			       struct device_node *funcnp)
+{
+	struct device_node *cooked_funcnp = NULL;
+	int res, i, count, state;
+	struct of_phandle_args ofargs;
+
+	/* if this is not a cooked function, return self (with a ref) */
+	if (!apq8039_function_is_cooked(card, funcnp))
+		return of_node_get(funcnp);
+
+	/* get synthetic state from state inputs */
+	state = apq8039_state_get(card, funcnp);
+
+	/* must exist and be a multiple of 3 */
+	res = of_property_count_elems_of_size(funcnp, "state-map",
+						sizeof(u32));
+	if (res <= 0 || (res % 3)) {
+		dev_err(card->dev, "%s %s property of \"%s\" node\n",
+				res < 0 ? "missing" : "invalid",
+				"state-map", funcnp->name);
+		goto out;
+	}
+	count = res / 3;
+
+	memset(&ofargs, 0, sizeof(ofargs));
+
+	/* look for a match for the state in the map */
+	for (i = 0; i < count; i++) {
+		res = of_parse_phandle_with_fixed_args(funcnp, "state-map",
+							2, i, &ofargs);
+		if (res < 0) {
+			dev_err(card->dev,
+					"failed to parse %s prop \"%s\" #%d\n",
+					"state-map", funcnp->name, i);
+			goto out;
+		}
+		/* match */
+		if (((uint32_t)state & ofargs.args[0]) == ofargs.args[1])
+			break;
+		of_node_put(ofargs.np);
+	}
+	if (i >= count) {
+		dev_err(card->dev,
+				"failed to match state %d %s prop of \"%s\"\n",
+				state, "state-map", funcnp->name);
+		goto out;
+	}
+
+	dev_dbg(card->dev, "@%s function \"%s\" state 0x%x -> \"%s\"\n",
+			__func__, funcnp->name, state, ofargs.np->name);
+	cooked_funcnp = ofargs.np;
+
+out:
+	return cooked_funcnp;
+}
+
+static int apq8039_apply_function_sequence(struct snd_soc_card *card,
+					      struct device_node *funcnp,
+					      const char *kind)
+{
+	int res = -EINVAL, i, count;
+	const char *ctl, *val;
+
+	/* if the property does not exist, it's no problem */
+	if (!of_get_property(funcnp, kind, NULL)) {
+		res = 0;
+		goto out;
+	}
+
+	/* number of strings (must be pairs) */
+	res = of_property_count_strings(funcnp, kind);
+	if (res < 0 || (res % 2) != 0) {
+		dev_err(card->dev, "Illegal string list prop \"%s\"\n",
+				kind);
+		goto out;
+	}
+
+	for (i = 0, count = res; i < count; i += 2) {
+
+		res = of_property_read_string_index(funcnp, kind, i, &ctl);
+		if (res < 0) {
+			dev_err(card->dev,
+					"Bad string list prop ctl \"%s\" @%d\n",
+					kind, i);
+			goto out;
+		}
+
+		res = of_property_read_string_index(funcnp, kind, i + 1, &val);
+		if (res < 0) {
+			dev_err(card->dev,
+					"Bad string list prop val \"%s\" @%d\n",
+					kind, i + 1);
+			goto out;
+		}
+
+		res = apq8039_ctl_set(card, ctl, val);
+		if (res < 0) {
+			dev_err(card->dev,
+					"ctl_set() failed at \"%s\" = \"%s\"\n",
+					ctl, val);
+			goto out;
+		}
+	}
+
+	res = 0;
+
+out:
+	return res;
+}
+
+static void apq8039_select_function(struct snd_soc_card *card,
+				       struct device_node *new_funcnp)
+{
+	struct apq8039_data *pdata = snd_soc_card_get_drvdata(card);
+	struct device_node *old_funcnp, *old_cooked_funcnp, *new_cooked_funcnp;
+
+	if (!new_funcnp)
+		return;
+
+	/* get final old function */
+	old_funcnp = pdata->function_node;
+	old_cooked_funcnp = pdata->cooked_function_node;
+
+	new_cooked_funcnp = apq8039_get_cooked_function(card, new_funcnp);
+
+	dev_dbg(card->dev, "function_node \"%s\" -> \"%s\"\r\n",
+			old_funcnp ? old_funcnp->name : "NULL",
+			new_funcnp->name);
+	dev_dbg(card->dev, "cooked function_node \"%s\" -> \"%s\"\r\n",
+			old_cooked_funcnp ? old_cooked_funcnp->name : "NULL",
+			new_cooked_funcnp->name);
+
+	/* same? don't bother */
+	if (old_cooked_funcnp == new_cooked_funcnp)
+		return;
+
+	if (pdata->cooked_function_node)
+		apq8039_apply_function_sequence(card,
+				pdata->cooked_function_node, "disable");
+
+	of_node_put(pdata->function_node);
+	of_node_put(pdata->cooked_function_node);
+
+	pdata->function_node = of_node_get(new_funcnp);
+	pdata->cooked_function_node = new_cooked_funcnp;
+
+	apq8039_apply_function_sequence(card,
+			pdata->cooked_function_node, "enable");
+
+	apq8039_ctl_commit(card);
+}
+
+static int apq8039_state_input_set(struct snd_soc_card *card,
+				      const char *name, int value)
+{
+	struct apq8039_data *pdata = snd_soc_card_get_drvdata(card);
+	struct state_input_node *n;
+
+	list_for_each_entry(n, &pdata->state_input_list, node) {
+		/* if it exists, just update with new value */
+		if (!strcmp(name, n->name)) {
+			/* same state */
+			if (value == n->state_input)
+				return 0;
+			/* return 1 on update, 0, on no change */
+			n->state_input = value;
+			dev_dbg(card->dev, "update state-input \"%s\" %d\r\n",
+					n->name, n->state_input);
+			return 1;
+		}
+	}
+	n = devm_kzalloc(card->dev, sizeof(*n), GFP_KERNEL);
+	if (!n)
+		return -ENOMEM;
+	n->name = devm_kstrdup(card->dev, name, GFP_KERNEL);
+	if (!n->name) {
+		devm_kfree(card->dev, n);
+		return -ENOMEM;
+	}
+	n->state_input = value;
+	list_add_tail(&n->node, &pdata->state_input_list);
+
+	dev_dbg(card->dev, "new state-input \"%s\" %d\r\n",
+			n->name, n->state_input);
+
+	return 1;
+}
+
+static int apq8039_get_function(struct snd_kcontrol *kcontrol,
+	struct snd_ctl_elem_value *ucontrol);
+static int apq8039_set_function(struct snd_kcontrol *kcontrol,
+	struct snd_ctl_elem_value *ucontrol);
+
+static int apq8039_function_parse_of(struct snd_soc_card *card,
+		struct apq8039_data *pdata)
+{
+	static const char *root_name = "function-definition";
+	struct device_node *rootnp, *np;
+	int res = -EINVAL, i = 0, j, count;
+	const char *str;
+
+	if (!card || !card->dev || !card->dev->of_node)
+		return -EINVAL;
+
+	rootnp = of_get_child_by_name(card->dev->of_node, root_name);
+	if (!rootnp) {
+		dev_err(card->dev, "No \"%s\" child node\n", root_name);
+		return -ENOENT;
+	}
+
+	res = of_property_count_elems_of_size(rootnp, "function-list",
+						sizeof(u32));
+	if (res <= 0) {
+		dev_err(card->dev, "%s %s property of \"%s\" node\n",
+				res < 0 ? "missing" : "invalid",
+				root_name, "function-list");
+		goto err_out;
+	}
+	count = res;
+
+	pdata->num_functions = count;
+	pdata->function_nodes = devm_kzalloc(card->dev,
+					sizeof(*pdata->function_nodes) * count,
+					GFP_KERNEL);
+	if (!pdata->function_nodes) {
+		dev_err(card->dev, "out of memory allocating function_nodes\n");
+		res = -ENOMEM;
+		goto err_out;
+	}
+
+	pdata->function_names = devm_kzalloc(card->dev,
+					sizeof(*pdata->function_names) *
+						pdata->num_functions,
+					GFP_KERNEL);
+	if (!pdata->function_names) {
+		dev_err(card->dev, "out of memory allocating function_names\n");
+		res = -ENOMEM;
+		goto err_out;
+	}
+
+
+	for (i = 0; i < pdata->num_functions; i++) {
+		np = of_parse_phandle(rootnp, "function-list", i);
+		if (!np) {
+			dev_err(card->dev,
+					"failed to parse \"%s\" phandle #%d\n",
+					"function-list", i);
+			res = -ENOENT;
+			goto err_out;
+		}
+		pdata->function_nodes[i] = np;
+	}
+
+	/* get the default, init, shutdown state(s) */
+	for (j = 0; j < 3; j++) {
+		np = of_parse_phandle(rootnp, "system-list", j);
+
+		/* init and shutdown are optional */
+		if (j > 0 && !np)
+			break;
+
+		if (!np) {
+			dev_err(card->dev,
+					"failed to parse \"%s\" phandle #%d\n",
+					"system-list", j);
+			res = -ENOENT;
+			goto err_out;
+		}
+		/* and verify it's one of the ones we declared */
+		for (i = 0; i < pdata->num_functions; i++) {
+			if (np == pdata->function_nodes[i])
+				break;
+		}
+		if (i >= pdata->num_functions) {
+			dev_err(card->dev,
+					"\"%s\" is not part of \"%s\"\n",
+					"system-list", "function-list");
+			res = -EINVAL;
+			of_node_put(np);
+			goto err_out;
+		}
+		switch (j) {
+		case 0:
+			pdata->function_node = np;
+			break;
+		case 1:
+			pdata->init_node = np;
+			break;
+		case 2:
+			pdata->shutdown_node = np;
+			break;
+		}
+	}
+
+	/* collect the function names */
+	for (i = 0; i < pdata->num_functions; i++)
+		pdata->function_names[i] = pdata->function_nodes[i]->name;
+
+	res = of_property_read_string(rootnp, "mixer-control", &str);
+	if (res) {
+		dev_err(card->dev, "failed to read string prop \"%s\"\n",
+			"mixer-control");
+		goto err_out;
+	}
+	pdata->control_name = devm_kstrdup(card->dev, str, GFP_KERNEL);
+	if (!pdata->control_name) {
+		res = -ENOMEM;
+		goto err_out;
+	}
+
+	pdata->func_enum[0] = (const struct soc_enum)
+				SOC_ENUM_SINGLE_EXT(pdata->num_functions,
+						    pdata->function_names);
+	pdata->func_control[0] = (const struct snd_kcontrol_new)
+				SOC_ENUM_EXT(pdata->control_name,
+					     pdata->func_enum[0],
+					     apq8039_get_function,
+					     apq8039_set_function);
+
+	/* note! cooked_function_node must be set */
+
+	of_node_put(rootnp);
+	return 0;
+
+err_out:
+	if (pdata->function_nodes) {
+		for (i = pdata->num_functions - 1; i >= 0; i--)
+			of_node_put(pdata->function_nodes[i]);
+		devm_kfree(card->dev, pdata->function_nodes);
+	}
+	pdata->function_nodes = NULL;
+	if (pdata->function_names)
+		devm_kfree(card->dev, pdata->function_names);
+	pdata->function_names = NULL;
+
+	of_node_put(pdata->function_node);
+	of_node_put(pdata->cooked_function_node);
+	of_node_put(pdata->init_node);
+	of_node_put(pdata->shutdown_node);
+
+	of_node_put(rootnp);
+	return res;
+}
+
+static int apq8039_jack_event(struct notifier_block *nb,
+		unsigned long event, void *data)
+{
+	struct snd_soc_jack *jack = (struct snd_soc_jack *)data;
+	struct snd_soc_card *card = jack->card;
+	struct apq8039_data *pdata = snd_soc_card_get_drvdata(card);
+	int headphone, microphone;
+	bool modified;
+
+	headphone = (event & SND_JACK_HEADPHONE)  == SND_JACK_HEADPHONE;
+	microphone = (event & SND_JACK_MICROPHONE) == SND_JACK_MICROPHONE;
+
+	apq8039_state_input_set(card, "JACK_HEADPHONE", headphone);
+	apq8039_state_input_set(card, "JACK_MICROPHONE", microphone);
+
+	modified = false;
+	if (pdata->headphone_det != headphone) {
+		pdata->headphone_det = headphone;
+		modified = true;
+	}
+	if (pdata->microphone_det != microphone) {
+		pdata->microphone_det = headphone;
+		modified = true;
+	}
+
+	if (!modified)
+		return 0;
+
+	apq8039_select_function(card, pdata->function_node);
+
+	return 0;
+}
+
+static struct notifier_block apq8039_jack_nb = {
+	.notifier_call = apq8039_jack_event,
+};
+
+#define MIC_CTRL_TER_WS_SLAVE_SEL	BIT(21)
+#define MIC_CTRL_QUA_WS_SLAVE_SEL_10	BIT(17)
+#define MIC_CTRL_TLMM_SCLK_EN		BIT(1)
+#define	SPKR_CTL_PRI_WS_SLAVE_SEL_11	(BIT(17) | BIT(16))
+#define DEFAULT_MCLK_RATE		9600000
+
+static int apq8039_dai_init(struct snd_soc_pcm_runtime *rtd)
+{
+	struct snd_soc_dai *cpu_dai = asoc_rtd_to_cpu(rtd, 0);
+	struct snd_soc_dai *codec_dai;
+	struct snd_soc_component *component;
+	struct snd_soc_card *card = rtd->card;
+	struct apq8039_data *pdata = snd_soc_card_get_drvdata(card);
+	int i, rval;
+
+	switch (cpu_dai->id) {
+	case MI2S_PRIMARY:
+		writel(readl(pdata->spkr_iomux) | SPKR_CTL_PRI_WS_SLAVE_SEL_11,
+			pdata->spkr_iomux);
+		break;
+
+	case MI2S_QUATERNARY:
+		writel(readl(pdata->mic_iomux) | MIC_CTRL_QUA_WS_SLAVE_SEL_10 |
+			MIC_CTRL_TLMM_SCLK_EN,
+			pdata->mic_iomux);
+		break;
+	case MI2S_TERTIARY:
+		writel(readl(pdata->mic_iomux) | MIC_CTRL_TER_WS_SLAVE_SEL |
+			MIC_CTRL_TLMM_SCLK_EN,
+			pdata->mic_iomux);
+
+		break;
+
+	default:
+		dev_err(card->dev, "unsupported cpu dai configuration\n");
+		return -EINVAL;
+
+	}
+
+	if (!pdata->jack_setup) {
+		struct snd_jack *jack;
+
+		rval = snd_soc_card_jack_new(card, "Headset Jack",
+					     SND_JACK_HEADSET |
+					     SND_JACK_HEADPHONE |
+					     SND_JACK_BTN_0 | SND_JACK_BTN_1 |
+					     SND_JACK_BTN_2 | SND_JACK_BTN_3 |
+					     SND_JACK_BTN_4,
+					     &pdata->jack, NULL, 0);
+
+		if (rval < 0) {
+			dev_err(card->dev, "Unable to add Headphone Jack\n");
+			return rval;
+		}
+
+		jack = pdata->jack.jack;
+
+		snd_jack_set_key(jack, SND_JACK_BTN_0, KEY_PLAYPAUSE);
+		snd_jack_set_key(jack, SND_JACK_BTN_1, KEY_VOICECOMMAND);
+		snd_jack_set_key(jack, SND_JACK_BTN_2, KEY_VOLUMEUP);
+		snd_jack_set_key(jack, SND_JACK_BTN_3, KEY_VOLUMEDOWN);
+		pdata->jack_setup = true;
+
+		snd_soc_jack_notifier_register(&pdata->jack,
+						&apq8039_jack_nb);
+	}
+
+	for_each_rtd_codec_dais(rtd, i, codec_dai) {
+
+		component = codec_dai->component;
+		/* Set default mclk for internal codec */
+		rval = snd_soc_component_set_sysclk(component, 0, 0,
+					DEFAULT_MCLK_RATE, SND_SOC_CLOCK_IN);
+		if (rval != 0 && rval != -ENOTSUPP) {
+			dev_warn(card->dev, "Failed to set mclk: %d\n", rval);
+			return rval;
+		}
+		rval = snd_soc_component_set_jack(component,
+						&pdata->jack, NULL);
+		if (rval != 0 && rval != -ENOTSUPP) {
+			dev_warn(card->dev, "Failed to set jack: %d\n", rval);
+			return rval;
+		}
+	}
+
+	return 0;
+}
+
+static struct apq8039_data *apq8039_parse_of(struct snd_soc_card *card)
+{
+	struct device *dev = card->dev;
+	struct snd_soc_dai_link *link;
+	struct device_node *np, *codec, *cpu, *node  = dev->of_node;
+	struct apq8039_data *data;
+	struct snd_soc_dai_link_component *dlc;
+	int ret, num_links;
+
+	ret = snd_soc_of_parse_card_name(card, "qcom,model");
+	if (ret) {
+		dev_err(dev, "Error parsing card name: %d\n", ret);
+		return ERR_PTR(ret);
+	}
+
+	/* DAPM routes */
+	if (of_property_read_bool(node, "qcom,audio-routing")) {
+		ret = snd_soc_of_parse_audio_routing(card,
+					"qcom,audio-routing");
+		if (ret)
+			return ERR_PTR(ret);
+	}
+
+	/* count the number of dai links */
+	num_links = 0;
+	for_each_child_of_node(node, np) {
+		cpu = of_get_child_by_name(np, "cpu");
+		codec = of_get_child_by_name(np, "codec");
+
+		/* it's a dai link only if both cpu & codec nodes exist */
+		num_links += cpu && codec;
+
+		/* handles NULLs just fine */
+		of_node_put(cpu);
+		of_node_put(codec);
+	}
+
+	/* Allocate the private data and the DAI link array */
+	data = devm_kzalloc(dev,
+			    struct_size(data, dai_link, num_links),
+			    GFP_KERNEL);
+	if (!data)
+		return ERR_PTR(-ENOMEM);
+
+	card->dai_link	= &data->dai_link[0];
+	card->num_links	= num_links;
+
+	link = data->dai_link;
+
+	for_each_child_of_node(node, np) {
+		cpu = of_get_child_by_name(np, "cpu");
+		codec = of_get_child_by_name(np, "codec");
+
+		if (!cpu || !codec) {
+			/* not an error, just not a dai node */
+			of_node_put(cpu);
+			of_node_put(codec);
+			continue;
+		}
+
+		dlc = devm_kzalloc(dev, 2 * sizeof(*dlc), GFP_KERNEL);
+		if (!dlc)
+			return ERR_PTR(-ENOMEM);
+
+		link->cpus	= &dlc[0];
+		link->platforms	= &dlc[1];
+
+		link->num_cpus		= 1;
+		link->num_platforms	= 1;
+
+		link->cpus->of_node = of_parse_phandle(cpu, "sound-dai", 0);
+		if (!link->cpus->of_node) {
+			dev_err(card->dev,
+					"error getting cpu phandle (%s)\n",
+					of_node_full_name(cpu));
+			ret = -EINVAL;
+			goto error;
+		}
+
+		ret = snd_soc_of_get_dai_name(cpu, &link->cpus->dai_name);
+		if (ret) {
+			dev_err(card->dev,
+					"error getting cpu dai name (%s)\n",
+					of_node_full_name(cpu));
+			goto error;
+		}
+
+		ret = snd_soc_of_get_dai_link_codecs(dev, codec, link);
+		if (ret < 0) {
+			dev_err(card->dev,
+					"error getting codec dai name (%s)\n",
+					of_node_full_name(codec));
+			goto error;
+		}
+
+		link->platforms->of_node = link->cpus->of_node;
+		ret = of_property_read_string(np, "link-name", &link->name);
+		if (ret) {
+			dev_err(card->dev, "error getting dai_link name\n");
+			goto error;
+		}
+
+		link->stream_name = link->name;
+		link->init = apq8039_dai_init;
+		link++;
+
+		of_node_put(cpu);
+		of_node_put(codec);
+	}
+	cpu = codec = NULL;
+
+	ret = apq8039_function_parse_of(card, data);
+	if (ret != 0)
+		goto error;
+
+	return data;
+
+ error:
+	of_node_put(np);
+	of_node_put(cpu);
+	of_node_put(codec);
+	return ERR_PTR(ret);
+}
+
+static int apq8039_get_function(struct snd_kcontrol *kcontrol,
+	struct snd_ctl_elem_value *ucontrol)
+{
+	struct snd_soc_card *card = snd_kcontrol_chip(kcontrol);
+	struct apq8039_data *pdata = snd_soc_card_get_drvdata(card);
+	int i;
+
+	for (i = 0; i < pdata->num_functions; i++) {
+		if (pdata->function_node == pdata->function_nodes[i]) {
+			ucontrol->value.enumerated.item[0] = i;
+			return 0;
+		}
+	}
+	return -EINVAL;
+}
+
+static int apq8039_set_function(struct snd_kcontrol *kcontrol,
+	struct snd_ctl_elem_value *ucontrol)
+{
+	struct snd_soc_card *card = snd_kcontrol_chip(kcontrol);
+	struct apq8039_data *pdata = snd_soc_card_get_drvdata(card);
+	unsigned int target;
+
+	if (ucontrol->value.enumerated.item[0] >= pdata->num_functions)
+		return -EINVAL;
+
+	target = ucontrol->value.enumerated.item[0];
+	apq8039_select_function(card, pdata->function_nodes[target]);
+
+	return 0;
+}
+
+static int apq8039_platform_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct snd_soc_card *card;
+	struct apq8039_data *data;
+	struct resource *res;
+	int ret;
+
+	card = devm_kzalloc(dev, sizeof(*card), GFP_KERNEL);
+	if (!card)
+		return -ENOMEM;
+
+	card->dev = dev;
+
+	data = apq8039_parse_of(card);
+	if (IS_ERR(data)) {
+		dev_err(&pdev->dev, "Error resolving dai links: %ld\n",
+			PTR_ERR(data));
+		return PTR_ERR(data);
+	}
+
+	res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "mic-iomux");
+	data->mic_iomux = devm_ioremap_resource(dev, res);
+	if (IS_ERR(data->mic_iomux))
+		return PTR_ERR(data->mic_iomux);
+
+	res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "spkr-iomux");
+	data->spkr_iomux = devm_ioremap_resource(dev, res);
+	if (IS_ERR(data->spkr_iomux))
+		return PTR_ERR(data->spkr_iomux);
+
+	data->headphone_det = -1;
+	data->microphone_det = -1;
+
+	INIT_LIST_HEAD(&data->ctl_list);
+	INIT_LIST_HEAD(&data->state_input_list);
+
+	card->controls = data->func_control;
+	card->num_controls = ARRAY_SIZE(data->func_control);
+
+	snd_soc_card_set_drvdata(card, data);
+
+	ret = devm_snd_soc_register_card(&pdev->dev, card);
+	if (ret)
+		return ret;
+
+	/* initialize first */
+	if (data->init_node)
+		apq8039_select_function(card, data->init_node);
+
+	/* select now */
+	if (data->function_node != data->init_node)
+		apq8039_select_function(card, data->function_node);
+
+	return 0;
+}
+
+static int apq8039_platform_remove(struct platform_device *pdev)
+{
+	struct snd_soc_card *card = dev_get_drvdata(&pdev->dev);
+	struct apq8039_data *pdata = snd_soc_card_get_drvdata(card);
+	int i;
+
+	/* the lists are using managed memory, no need to free them */
+	if (pdata) {
+
+		if (pdata->shutdown_node)
+			apq8039_select_function(card, pdata->shutdown_node);
+
+		of_node_put(pdata->function_node);
+		of_node_put(pdata->cooked_function_node);
+		of_node_put(pdata->init_node);
+		of_node_put(pdata->shutdown_node);
+		if (pdata->function_nodes) {
+			for (i = 0; i < pdata->num_functions; i++)
+				of_node_put(pdata->function_nodes[i]);
+		}
+	}
+
+	snd_soc_unregister_card(card);
+
+	return 0;
+}
+
+static const struct of_device_id apq8039_device_id[]  = {
+	{ .compatible = "qcom,apq8039-sndcard" },
+	{},
+};
+MODULE_DEVICE_TABLE(of, apq8039_device_id);
+
+static struct platform_driver apq8039_platform_driver = {
+	.driver = {
+		.name = "qcom-apq8039",
+		.of_match_table = of_match_ptr(apq8039_device_id),
+	},
+	.probe = apq8039_platform_probe,
+	.remove = apq8039_platform_remove,
+};
+module_platform_driver(apq8039_platform_driver);
+
+MODULE_AUTHOR("Pantelis Antoniou <pantelis.antoniou@linaro.org");
+MODULE_DESCRIPTION("APQ8039 ASoC Machine Driver");
+MODULE_LICENSE("GPL v2");
-- 
2.20.1

