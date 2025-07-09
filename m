Return-Path: <linux-arm-msm+bounces-64264-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 9ACD7AFEC4A
	for <lists+linux-arm-msm@lfdr.de>; Wed,  9 Jul 2025 16:41:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8911D3AED46
	for <lists+linux-arm-msm@lfdr.de>; Wed,  9 Jul 2025 14:40:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B182B2E8E1F;
	Wed,  9 Jul 2025 14:39:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="FmUE08FE"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F2402E7BA8
	for <linux-arm-msm@vger.kernel.org>; Wed,  9 Jul 2025 14:39:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752071958; cv=none; b=lQh4ftd0jVQHWb+jaw60CqUBSUzkDdpna4VnVAZdq/++F0xaz6w+JXBqNk7DEpe0zveuLvv+83f56KKgc8LdieezoKBkfD1/u/reLuviPfvkTWQ0ivU5ZROa0QWNhPl8qU1SGYLjQy/uuEjoO/Ajdnvo9o6Z1mvlmD0LQ7siFWA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752071958; c=relaxed/simple;
	bh=kg5bh0+aXL4BssBE1Kd1z23SlWxVPqr66lxOK+U2Mag=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=DCLY2QBcckBIm02MbZoJyLA7nkLyMD/NQcWAt1acR6d1t77747K5SyQ8/UY4Q8zeNCE5oLhj/dU2+JBJ0YSI/5swwMJoPSNHMCpyBhcWq86vij8cJE+gcFZVHhsW3iErI0hX3gnl3uEx0cPDjdFDvEoj7jCjGZ6V1tc2hD8y0Ks=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=FmUE08FE; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-454aaade1fbso63186905e9.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 09 Jul 2025 07:39:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1752071955; x=1752676755; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EEhkAhQ7XWV9vA1JBF0jvg0JcitdmGVoPDzkyvBxyAk=;
        b=FmUE08FEbOGB4c0uFQIqfYauQVWbZXeUQoTrMKeW11ik1BWAgvOdDSmXrIfohBEzQv
         gDVokxOu7ht6qOrOC5YlGJLXcP9U24njHPhLFnX8tll+tFNAvLVeyGx4TFaYaM0yaD8w
         K7mtuHiYpCsp9o5ZK2xR/2qL0icYmku2jyi6RwdlMdytGEVLqYu06bHTAvD4rYsRDPKk
         VzY5CCTNBQbhTBNRg5RgKQOQea/YC4Dp3/kCDMunjZuWvd3hEEPpcVwMwUuu6+BnH2em
         H9kQvu+JP2j7x5DvFCThST3EWhM9rNhj10OISpedW8WsL5MxdBoiraWev8K8QHi+U9kR
         swAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752071955; x=1752676755;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EEhkAhQ7XWV9vA1JBF0jvg0JcitdmGVoPDzkyvBxyAk=;
        b=jXZkpuZjn1NtEJnvLFMMoMaTNtW7psJ5s4B7cuRmppRlF7gG5BSwV7EbRSyFVbxNo6
         GPXSmjrENDHXcsFssGRpC/UqNcDqemq1gp7NyVBqw1lpjVNO8WRA65r6i6Krj3TNDXkc
         VDNXeRKDG1fdg5y449VThi+XfK2PhgQnMaO023i0182NqWXS8Pt2k6S1JCCS85SKAqtz
         3Uf/o3cWTGA+Z/CC278UqKHhVChErvqsvgeO5fjlSW3r+FgN2Nkw7R+9uz76KoDQiVdN
         DL6WSAHPgsh82phVKtHPPHMs6qrWOjvtqDauL4Bbdg4SxYzBIuF/Ow4Z3NlKQeVeYQy9
         AyWw==
X-Forwarded-Encrypted: i=1; AJvYcCXEY/mEYmOkZ6VWDsAOCU9KuaoJWIsC1s8yhL/sln2Llo1rQXd3efWqaH2VrWNkA9iq0PDa4M5rZIs+Znfz@vger.kernel.org
X-Gm-Message-State: AOJu0YxLEYd+fdLxRVZEreLauaFH2Q7YlfO8m2WDUVwdAB+4Tf4b1zei
	c35Fl3CYzGhZQQ1kksHbolqrypKPVl0vJrOFdIkoGbS9oR7d78ZBdMD1XGDGjxehOqo=
X-Gm-Gg: ASbGncv7cUiOb4r3ZldA6YmLMRa8T8o5SVZxLF0mzo6QoD4+LN252CUmzls8BbnDjbN
	QOfJVHjrrmVAT8dzToLL+osAXewwKqWZme6xItsV0lOmclQdfkG69iTar1eIhjm3md0UeO8PpeA
	IbbTF30W15LGiKRLbsRfunVmjfUa9nxVizB/RLNrUiaXVg/zCj55jaJBq58V52VhygfozkFktyF
	hzAspnPSU7151JgQX1xSsULGKFvx36UFjKsMGe8LVuYYzKLqq+ZpqovQsMgJkFGx+isqN+oIOR6
	wa2ZK7JTT/EyEK0NguoKI8SM8t8R7f/VoyKp0K6U95psHvANF+PEfzg=
X-Google-Smtp-Source: AGHT+IFZIszVirXuuB2kJyAOaIINTeVqcmXfUV5ejP9vG/aDdFHKzvJ6Yo2IT1W3q8TqT3uTQ5XECg==
X-Received: by 2002:a05:6000:5c9:b0:3a4:ef70:e0e1 with SMTP id ffacd0b85a97d-3b5e45783b2mr2334481f8f.55.1752071954787;
        Wed, 09 Jul 2025 07:39:14 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:b04e:cfc4:3bd9:6180])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b5dfbf56c9sm4480687f8f.79.2025.07.09.07.39.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Jul 2025 07:39:14 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 09 Jul 2025 16:39:05 +0200
Subject: [PATCH v2 09/12] pinctrl: allow to mark pin functions as
 requestable GPIOs
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250709-pinctrl-gpio-pinfuncs-v2-9-b6135149c0d9@linaro.org>
References: <20250709-pinctrl-gpio-pinfuncs-v2-0-b6135149c0d9@linaro.org>
In-Reply-To: <20250709-pinctrl-gpio-pinfuncs-v2-0-b6135149c0d9@linaro.org>
To: Linus Walleij <linus.walleij@linaro.org>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Alexey Klimov <alexey.klimov@linaro.org>, 
 Lorenzo Bianconi <lorenzo@kernel.org>, Sean Wang <sean.wang@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Paul Cercueil <paul@crapouillou.net>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-mediatek@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=6781;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=zVlgZL/U2Xhv/ZLn0+R4Dl6vFZXIXPFUIiWP8hDpuFg=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBobn8HhG06VHv5d2HzKTBekOvO7J+15a8E6GR/S
 Xfai8QRifqJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaG5/BwAKCRARpy6gFHHX
 cqYXD/9SF97i4ulotjIEdNquN9gbyknM9vnQi/2h3j6FxcQjfDllE7DjiBomr727XidoviMRbvI
 J1/27diYsmHc8PcQSDFx4IpFNcxO6goG1QuQDIEurDaVh93dXHQvj+i3UNMwajcabcgTUccwiKR
 FG0i82torREvNdlZRYdcL9l49dsCzDbC4crKr3PY4iJ7DvnWrKbR/FjbgLqdTgqP2wu6bnclCUG
 eA8x8JeKC4KTbSSG6f/HeEH4L5KEi8TJTixW7vsjjh0MxL9n1Mbb/orCp5WaajIM9yrYzs4Hr2B
 RZzmdd13RJKJwIbN4p32znqSvazbWMoaq6POi98TLKkae5qfrVN1jgk3MBEqdv7SbaQjnzQ2RrG
 8EpiOafrvtKdBQzNNHi8S96iBwaOwPGVjos1VeoBobQHdyf0jXNgtDWFuDH8Xr/fx5UglSWWv31
 byWxp3PtURq2xIiE/mfM1dzianWVtzBD8gZUMW4VTT4nWI/5ZQ6LVHLcN8QnaCQlSHAgWTixjXh
 FJkF3+laxvl0I78uq2n8kJiaAASKee/mJb/5uRy0ogHC4jrDpPsSlqM2jq5aISf750FdfiLsYMP
 5FRJTXE9I5SYztymqUoTvuvJ7tMywODdqe6eiivNfYIBJMJrNUqxsiSjhCrjTdR9fBMdgMuNvYA
 yAgicnx5AxzWlcg==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

The name of the pin function has no real meaning to pinctrl core and is
there only for human readability of device properties. Some pins are
muxed as GPIOs but for "strict" pinmuxers it's impossible to request
them as GPIOs if they're bound to a devide - even if their function name
explicitly says "gpio". Add a new field to struct pinfunction that
allows to pass additional flags to pinctrl core. While we could go with
a boolean "is_gpio" field, a flags field is more future-proof.

If the PINFUNCTION_FLAG_GPIO is set for a given function, the pin muxed
to it can be requested as GPIO even on strict pin controllers. Add a new
callback to struct pinmux_ops - function_is_gpio() - that allows pinmux
core to inspect a function and see if it's a GPIO one. Provide a generic
implementation of this callback.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/pinctrl/pinmux.c        | 37 +++++++++++++++++++++++++++++++++++--
 drivers/pinctrl/pinmux.h        |  3 +++
 include/linux/pinctrl/pinctrl.h | 14 ++++++++++++++
 include/linux/pinctrl/pinmux.h  |  2 ++
 4 files changed, 54 insertions(+), 2 deletions(-)

diff --git a/drivers/pinctrl/pinmux.c b/drivers/pinctrl/pinmux.c
index 8f2fe7ffc4f682cd966728f3c77c504489f7f8a0..c0d15817275c6c4638c789b7e91e510b35e6117b 100644
--- a/drivers/pinctrl/pinmux.c
+++ b/drivers/pinctrl/pinmux.c
@@ -89,13 +89,19 @@ bool pinmux_can_be_used_for_gpio(struct pinctrl_dev *pctldev, unsigned int pin)
 {
 	struct pin_desc *desc = pin_desc_get(pctldev, pin);
 	const struct pinmux_ops *ops = pctldev->desc->pmxops;
+	const struct pinctrl_setting_mux *mux_setting = desc->mux_setting;
+	bool func_is_gpio = false;
 
 	/* Can't inspect pin, assume it can be used */
 	if (!desc || !ops)
 		return true;
 
 	guard(mutex)(&desc->mux_lock);
-	if (ops->strict && desc->mux_usecount)
+	if (ops->function_is_gpio && mux_setting)
+		func_is_gpio = ops->function_is_gpio(pctldev,
+						     mux_setting->func);
+
+	if (ops->strict && desc->mux_usecount && !func_is_gpio)
 		return false;
 
 	return !(ops->strict && !!desc->gpio_owner);
@@ -116,7 +122,9 @@ static int pin_request(struct pinctrl_dev *pctldev,
 {
 	struct pin_desc *desc;
 	const struct pinmux_ops *ops = pctldev->desc->pmxops;
+	const struct pinctrl_setting_mux *mux_setting;
 	int status = -EINVAL;
+	bool func_is_gpio = false;
 
 	desc = pin_desc_get(pctldev, pin);
 	if (desc == NULL) {
@@ -126,11 +134,16 @@ static int pin_request(struct pinctrl_dev *pctldev,
 		goto out;
 	}
 
+	mux_setting = desc->mux_setting;
+
 	dev_dbg(pctldev->dev, "request pin %d (%s) for %s\n",
 		pin, desc->name, owner);
 
 	scoped_guard(mutex, &desc->mux_lock) {
-		if ((!gpio_range || ops->strict) &&
+		if (ops->function_is_gpio && mux_setting)
+			func_is_gpio = ops->function_is_gpio(pctldev,
+							     mux_setting->func);
+		if ((!gpio_range || ops->strict) && !func_is_gpio &&
 		    desc->mux_usecount && strcmp(desc->mux_owner, owner)) {
 			dev_err(pctldev->dev,
 				"pin %s already requested by %s; cannot claim for %s\n",
@@ -863,6 +876,26 @@ struct function_desc *pinmux_generic_get_function(struct pinctrl_dev *pctldev,
 }
 EXPORT_SYMBOL_GPL(pinmux_generic_get_function);
 
+/**
+ * pinmux_generic_function_is_gpio() - returns true if given function is a GPIO
+ * @pctldev: pin controller device
+ * @selector: function number
+ */
+bool pinmux_generic_function_is_gpio(struct pinctrl_dev *pctldev,
+				     unsigned int selector)
+{
+	struct function_desc *function;
+
+	function = radix_tree_lookup(&pctldev->pin_function_tree,
+				     selector);
+	if (!function)
+		return false;
+
+	return function->func.flags & PINFUNCTION_FLAG_GPIO;
+
+}
+EXPORT_SYMBOL_GPL(pinmux_generic_function_is_gpio);
+
 /**
  * pinmux_generic_add_function() - adds a function group
  * @pctldev: pin controller device
diff --git a/drivers/pinctrl/pinmux.h b/drivers/pinctrl/pinmux.h
index bdb5be1a636ead9695410824b5557937c5baa89a..ae6da930de1b6bf2afab24599b32114584e11198 100644
--- a/drivers/pinctrl/pinmux.h
+++ b/drivers/pinctrl/pinmux.h
@@ -169,6 +169,9 @@ int pinmux_generic_remove_function(struct pinctrl_dev *pctldev,
 
 void pinmux_generic_free_functions(struct pinctrl_dev *pctldev);
 
+bool pinmux_generic_function_is_gpio(struct pinctrl_dev *pctldev,
+				     unsigned int selector);
+
 #else
 
 static inline void pinmux_generic_free_functions(struct pinctrl_dev *pctldev)
diff --git a/include/linux/pinctrl/pinctrl.h b/include/linux/pinctrl/pinctrl.h
index d138e18156452e008f24ca06358fcab45135632f..1a8084e2940537f8f0862761d3e47c56c8783193 100644
--- a/include/linux/pinctrl/pinctrl.h
+++ b/include/linux/pinctrl/pinctrl.h
@@ -11,6 +11,7 @@
 #ifndef __LINUX_PINCTRL_PINCTRL_H
 #define __LINUX_PINCTRL_PINCTRL_H
 
+#include <linux/bits.h>
 #include <linux/types.h>
 
 struct device;
@@ -206,16 +207,20 @@ extern int pinctrl_get_group_pins(struct pinctrl_dev *pctldev,
 				  const char *pin_group, const unsigned int **pins,
 				  unsigned int *num_pins);
 
+#define PINFUNCTION_FLAG_GPIO	BIT(0)
+
 /**
  * struct pinfunction - Description about a function
  * @name: Name of the function
  * @groups: An array of groups for this function
  * @ngroups: Number of groups in @groups
+ * @flags: Additional pin function flags
  */
 struct pinfunction {
 	const char *name;
 	const char * const *groups;
 	size_t ngroups;
+	unsigned long flags;
 };
 
 /* Convenience macro to define a single named pinfunction */
@@ -226,6 +231,15 @@ struct pinfunction {
 		.ngroups = (_ngroups),			\
 	}
 
+/* Same as PINCTRL_PINFUNCTION() but for the GPIO category of functions */
+#define PINCTRL_GPIO_PINFUNCTION(_name, _groups, _ngroups)	\
+(struct pinfunction) {						\
+		.name = (_name),				\
+		.groups = (_groups),				\
+		.ngroups = (_ngroups),				\
+		.flags = PINFUNCTION_FLAG_GPIO,			\
+	}
+
 #if IS_ENABLED(CONFIG_OF) && IS_ENABLED(CONFIG_PINCTRL)
 extern struct pinctrl_dev *of_pinctrl_get(struct device_node *np);
 #else
diff --git a/include/linux/pinctrl/pinmux.h b/include/linux/pinctrl/pinmux.h
index d6f7b58d6ad0cce421aad80463529c9ccc65d68e..6db6c3e1ccc2249d4b4204e6fc19bf7b4397cc81 100644
--- a/include/linux/pinctrl/pinmux.h
+++ b/include/linux/pinctrl/pinmux.h
@@ -66,6 +66,8 @@ struct pinmux_ops {
 				    unsigned int selector,
 				    const char * const **groups,
 				    unsigned int *num_groups);
+	bool (*function_is_gpio) (struct pinctrl_dev *pctldev,
+				  unsigned int selector);
 	int (*set_mux) (struct pinctrl_dev *pctldev, unsigned int func_selector,
 			unsigned int group_selector);
 	int (*gpio_request_enable) (struct pinctrl_dev *pctldev,

-- 
2.48.1


