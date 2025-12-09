Return-Path: <linux-arm-msm+bounces-84737-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id AC3D8CAF183
	for <lists+linux-arm-msm@lfdr.de>; Tue, 09 Dec 2025 08:10:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6B2293015ECD
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Dec 2025 07:10:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4305D245008;
	Tue,  9 Dec 2025 07:10:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nFWS9MoU"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6623625EFAE
	for <linux-arm-msm@vger.kernel.org>; Tue,  9 Dec 2025 07:10:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765264207; cv=none; b=uiKtk1GMl7NJI8PUHrFUV8AT8Si89PyVDqezTWuF/F1nZZFXW0k/vd0kVQ05xftVCLvocRD1Q2+gB/nRtHpE4xM2Wea/P9YIer66EadJPst3Ura7mZXJZgganFdScqPtP6pyJ1WGIn9Q9eWNaTLwZxzp3h5pwQNxng8o54CGizQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765264207; c=relaxed/simple;
	bh=GWUPZWPx87d+R5G1pL0rdruViGt7Dva8i9gC5jM5GW0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ZumWunR+gbmo9/cVW2XNNFy8KZV51/m+jBRbmZNsSEzddP3FtK5NgO4apr+PHmwmrpDg2vcjJdVB1AxWSV26EeSwcVWOXwa3ZR91MFLD3/0cp/ye4MXvUMK/kYxp3yh9yLVRjMFD/BsLuq2TW4RXLqegcLyhc+T37vDlFeV0POY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nFWS9MoU; arc=none smtp.client-ip=209.85.215.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f176.google.com with SMTP id 41be03b00d2f7-ba2450aba80so3054355a12.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 08 Dec 2025 23:10:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765264205; x=1765869005; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=xg55Tln+6DnfF2kSPt4sxJR4WZV7mWdktIHdBzmSnGA=;
        b=nFWS9MoU9pXA1gTpWehV9xHBECs5mi0WXUevYAb72p4x08+jCsKm4BKTR1EDu1uNYW
         kbcHwqwtUJuOG15IVFlkuVClGCTtdcYifMk9/ya77a0DDxs2KwNgemGjweRd5afWkcqi
         xXstyYMoPJ7/QtxhytwHXPranF2bzyYhO02hS2b8rJbZm6ztV/MosXo5TSOiKxDxwsap
         oIQ+i91T3T5WYx9HIs9fpnZ0LaCG6IMzWtF9wjVy4ERRY59u3V69gTSdmbQ08wF/Apez
         bE9S35xp4lz4rotyGTS/NoYorhgNl7Lv2kIGaZAlPnT8EghSFULTeMt0yT+UCryUUAbV
         K/fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765264205; x=1765869005;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xg55Tln+6DnfF2kSPt4sxJR4WZV7mWdktIHdBzmSnGA=;
        b=HYMHvCjdqOUUCFcVQzhOitcg1UtQRU+zRcH/kKroNWt4ccc6NDLQLd+tzEeNBJgyL2
         uvT16vxi9OiXe486uXxfE83EP7cO475g4oyGw5z3PGyKLwFgxeLXMZNLjMnc42eWxsTx
         e9jG24XCmfsQZYsVq+3H/4FH+9AxuB1ZYyAewmDQRvDfHwUHDh+Eou4gQsG8HgIshWHq
         XRLT8HEIJ6VllqfdHdKSNzoh+RYb+bfehEfDdj3AgBVbFr5KsV4/ooEkiv1dyKXhL5kV
         3P78ijd4Mi9npoNEsd3KOujSYpSo0qZWo3ZUV1GiBjJ4mDGIimPQUUj6V1QSXOGcljFD
         9Sxw==
X-Gm-Message-State: AOJu0Ywf1j73GEo9IFsKuDgLwiWLT/dzc89C5ociwCLv3cD8eUrQ7bRN
	5w3p+1i7s4PGdVDeFt/vM9cz7NiyMAAoLyqmfDzWyDY2RGYu2wNu33rP
X-Gm-Gg: ASbGncv77Kvyk/WeSPrkBXeAd6ZlP8wD1KZW6BXx/V4xhyuv3e4sfPAbcko6nn8IHzl
	jNcoHGN/dUuNc/UaQ8N8XO3H7lELOFvZWmLycECMP40Y5M/fjIT5nomkAQVyG2BrQlLHxZczSa3
	DOqjyV0Vdap4AlHnqH3uVjltPU6AdYEDyI0uEO0vyQziqcpm9+GV8HI+c0nxfaMUPw0CAg3Cstp
	bQZ5MAx0GolYQw7IAU561MTLSbX0AZPZ0PGyZxtKwRzp+iM5Vadk6mXujJNijwg5fNDaidhbTj6
	aUpRjxia/UWdaJxFQgmbcqFJTXZIG1iPTv1qo//X/gSq+SePk95MnkxHWqUVvWV7n3Bh2Ak706w
	4+cCu+InohIVbcZsFdlBujipMypIz9xZOLMBN09TmcLFs3sn+zUxUvpIHvQTUGY46P4OX0ojH3l
	CVMEuY5HYXHC+WgByTxhi4D+rOmL/C1DTWy36ojgUCr62oynDi3S+H3Xd8WITOklzB8Q==
X-Google-Smtp-Source: AGHT+IH4xWkk+8tkFcAvGOYvd9507+UkaXMACCKUvjqSLoxEHfx36eSz/8egBxn9noqBt1eeILK0/Q==
X-Received: by 2002:a05:701a:c952:b0:119:e56b:98b1 with SMTP id a92af1059eb24-11e032aa4a3mr5974342c88.24.1765264204406;
        Mon, 08 Dec 2025 23:10:04 -0800 (PST)
Received: from [192.168.68.65] (104-12-136-65.lightspeed.irvnca.sbcglobal.net. [104.12.136.65])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-11df7552211sm69916005c88.1.2025.12.08.23.10.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 08 Dec 2025 23:10:04 -0800 (PST)
Message-ID: <1e74b956-a45a-4d3e-b7fa-e4d5dc0390db@gmail.com>
Date: Mon, 8 Dec 2025 23:10:03 -0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ARM: dts: qcom: msm8960: expressatt: Add
 coreriver,tc360-touchkey
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, beomho.seo@samsung.com, jcsing.lee@samsung.com
References: <20251205-expressatt-touchkey-v1-1-1444b927c9f3@gmail.com>
 <532531d2-8f26-4ffa-9355-7821a4d64200@oss.qualcomm.com>
Content-Language: en-US
From: Rudraksha Gupta <guptarud@gmail.com>
In-Reply-To: <532531d2-8f26-4ffa-9355-7821a4d64200@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

>> Add the tc360 touchkey. It's unknown if this is the actual model of the
>> touchkey, as downstream doesn't mention a variant, but this works.
>>
>> Link:
>> https://github.com/LineageOS/android_kernel_samsung_d2/blob/stable/cm-12.0-YNG4N/drivers/input/keyboard/cypress_touchkey_236/Makefile#L5
> This driver mentions a register called CYPRESS_MODULE_VER - maybe
> it could help confirm the model?
>
> Konrad


Here are the changes that Claude made to the tm2-touchkey driver, which 
seems to do what you asked and matches downstream (I have never written 
a driver before, so please free to provide corrections if necessary):


diff --git a/drivers/input/keyboard/tm2-touchkey.c 
b/drivers/input/keyboard/tm2-touchkey.c
index 55d699d9037d..d1f435dc6b05 100644
--- a/drivers/input/keyboard/tm2-touchkey.c
+++ b/drivers/input/keyboard/tm2-touchkey.c
@@ -33,6 +33,9 @@
  #define TM2_TOUCHKEY_LED_VOLTAGE_MIN    2500000
  #define TM2_TOUCHKEY_LED_VOLTAGE_MAX    3300000

+#define CYPRESS_FW_VER            0x01
+#define CYPRESS_MODULE_VER        0x02
+
  struct touchkey_variant {
      u8 keycode_reg;
      u8 base_reg;
@@ -180,6 +183,53 @@ static irqreturn_t tm2_touchkey_irq_handler(int 
irq, void *devid)
      return IRQ_HANDLED;
  }

+static ssize_t module_version_show(struct device *dev,
+                    struct device_attribute *attr, char *buf)
+{
+    struct i2c_client *client = to_i2c_client(dev);
+    struct tm2_touchkey_data *touchkey = i2c_get_clientdata(client);
+    int module_ver;
+
+    if (touchkey->variant->no_reg) {
+        /* Aries variant doesn't support register reads */
+        return sysfs_emit(buf, "unknown\n");
+    }
+
+    module_ver = i2c_smbus_read_byte_data(touchkey->client, 
CYPRESS_MODULE_VER);
+    if (module_ver < 0)
+        return module_ver;
+
+    return sysfs_emit(buf, "0x%02x\n", module_ver);
+}
+static DEVICE_ATTR_RO(module_version);
+
+static ssize_t fw_version_show(struct device *dev,
+                   struct device_attribute *attr, char *buf)
+{
+    struct i2c_client *client = to_i2c_client(dev);
+    struct tm2_touchkey_data *touchkey = i2c_get_clientdata(client);
+    int fw_ver;
+
+    if (touchkey->variant->no_reg) {
+        /* Aries variant doesn't support register reads */
+        return sysfs_emit(buf, "unknown\n");
+    }
+
+    fw_ver = i2c_smbus_read_byte_data(touchkey->client, CYPRESS_FW_VER);
+    if (fw_ver < 0)
+        return fw_ver;
+
+    return sysfs_emit(buf, "0x%02x\n", fw_ver);
+}
+static DEVICE_ATTR_RO(fw_version);
+
+static struct attribute *tm2_touchkey_attrs[] = {
+    &dev_attr_module_version.attr,
+    &dev_attr_fw_version.attr,
+    NULL
+};
+ATTRIBUTE_GROUPS(tm2_touchkey);
+
  static int tm2_touchkey_probe(struct i2c_client *client)
  {
      struct device_node *np = client->dev.of_node;
@@ -354,6 +404,7 @@ static struct i2c_driver tm2_touchkey_driver = {
          .name = TM2_TOUCHKEY_DEV_NAME,
          .pm = pm_sleep_ptr(&tm2_touchkey_pm_ops),
          .of_match_table = tm2_touchkey_of_match,
+        .dev_groups = tm2_touchkey_groups,
      },
      .probe = tm2_touchkey_probe,
      .id_table = tm2_touchkey_id_table,

When run on mainline, this is what was outputted:

samsung-expressatt:~$ cat /sys/bus/i2c/devices/0-0020/module_version
0x06
samsung-expressatt:~$ cat /sys/bus/i2c/devices/0-0020/fw_version
0x09


fw_version matches downstream ClockworkMod Recovery dmesg:

~ # dmesg | grep "FW Ver"
<3>[    2.201312] cypress_touchkey 16-0020: Touchkey FW Version: 0x09
<3>[    2.206317] cypress_touchkey 16-0020: Touchkey FW Version: 0x09, 
system_rev: 8


Unfortunately, I'm not to sure what the other variant versions are, so I 
will CC the driver's maintainers:

MODULE_AUTHOR("Beomho Seo <beomho.seo@samsung.com>");
MODULE_AUTHOR("Jaechul Lee <jcsing.lee@samsung.com>");


It also seems like I forgot to mention that this patch was assisted with 
Claude and cleaned up by me. Will update the patch's description if I 
need to send a v2.


