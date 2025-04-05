Return-Path: <linux-arm-msm+bounces-53285-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C89BA7CB19
	for <lists+linux-arm-msm@lfdr.de>; Sat,  5 Apr 2025 19:45:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D1FD83B960F
	for <lists+linux-arm-msm@lfdr.de>; Sat,  5 Apr 2025 17:45:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B89C7144304;
	Sat,  5 Apr 2025 17:45:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TmRji+Lq"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1054F70838;
	Sat,  5 Apr 2025 17:45:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743875130; cv=none; b=YALZjCh4w1vERhvtbGaeZoheNPTE59EJYPDMEvooIgjOCDCpfa2lV0CDhzNhvjUcIO9TCfipiqW8SRISVYB2DvHnhsEHY8Lp42vL1QP+KGl9wUMzDyYz1zZQ3iksiSy0ChxTrCKBnJaaO57EvpCVT2ebpOA6Hdpy5yilW/QPnq8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743875130; c=relaxed/simple;
	bh=Ml9G9ULATq3giFLsg/UVYtT11OMEdGKcJeqrvzQu3eI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Xr9f2TQe8xNUvPXTZsioQYtMAWmKISUBLB0zfDvpovA21o6KmhoNOwCjpXqWbCI16brJdFfx/ZW5Y7Z4hDDZRd34810x9Bp1QDo9rjkprZSVbXO40QZGfd842lThCW+3UMmb/gSFngsmTcmkdxPfa/JR/z6KxSsLG4JyQVghwXw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TmRji+Lq; arc=none smtp.client-ip=209.85.210.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-736c1138ae5so2981998b3a.3;
        Sat, 05 Apr 2025 10:45:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743875128; x=1744479928; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=k8JylLaT6hrTHNf9AdJnwsccmzcqkaZsXAyvhlHxaK0=;
        b=TmRji+LqVua4MGN+HtNuzWADrYAWcDQJZCx4pT5t3fZlt6b0rcytRmgJoM91blIHEO
         z09NENUdWDFlOB+ay1hKSLsEUx005dhIhRPfJ5aum+C+AcvDBVChr5Ybq2jLrD7Tkcca
         aZdLH1P2aLNKaCMeZ8iaQJ3T/71j6Q+SFVKovd5Q9CUhBGXmqTDVjZq3+WHwm41Lcria
         eSz/qAfKEW8NJVcBNxJ7asQGUfuvjYn31T2I0C+54aLzWxvOoe+IZuzjJji5mVuaQuba
         zsIBM478wQST4HdRt8oXqO9ZlxqVWIwA+5adnm7Qod4sUAnc0BnY4C/kLyPkcnp/mMpg
         ARgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743875128; x=1744479928;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=k8JylLaT6hrTHNf9AdJnwsccmzcqkaZsXAyvhlHxaK0=;
        b=PYTaDgj6wddYNzAIhI/W/pYawrXeNot7Nug35j2GDzRCdZqKFxWBt+JscIHBW9RsBO
         auHuCm/T8vMnwPR0yz1qWvQmeAAoMGabCAUHGTGhl/zjIlto0AjpH1kYvtAd3xcSr1dK
         yauSFqPtavTihEoIQXE9KkdehiXAmSzJqEcyBhGt8boXZUgJwNELcUpvftlN2JfOzafT
         MXjaHKWmTNrazWi/NGxGk0frWKBOVmqIl0A+eLKaM55x5SRmWRjPmXNLrCTxPR5yJgn/
         cJCz2fd/5jt0p+AnU8Xeil8FBRqmL7t6xuswSj69ZKy/8B3YybUShfQi2w8WuwkvYRPl
         LChg==
X-Forwarded-Encrypted: i=1; AJvYcCVhk2+YeHgEHgV5O3BTHf1zcD8ZvkjVXXf78qWmKRsaMGqGb+2hDVvtjsk16lc6MqTAn7TFhQF7FZtEBWid6w==@vger.kernel.org, AJvYcCVwmmy71D9heCfUGxidyDEYj+p3dE6l9E/quhVu5IPn1qNLb8aL+2OboFtO1p9ree/E4835b9GSe5RK92BZ@vger.kernel.org, AJvYcCWoB1CwdhhxHuYccgRxrT2HCHruWug46BFjzpHeBP7LQ6fkWgdvjhHfKvT5j8iyzGy7t5gaE40sICrL@vger.kernel.org
X-Gm-Message-State: AOJu0Yytv2z+/Rev7tITlTFMxoKUpGmNgwCVwI4tTcNfqjdcneel1PO0
	LgREgpfJgtiWo3uVr/emP1R+Dw8cpU5qCDaaT8XxQwAssNCbRqUm
X-Gm-Gg: ASbGncvLdZghbK5evjYcuHY/1R8cwmSSG8GNtC1O0xsEB0N9RRdCeYuQmFrCpNeAhUn
	RTJobzV73MT/k1sx9MgmrJ+Bdm5gheErKib8oAym3Kp3/BE9Ive0qIrmEw/6M8yzrOAr43vkzNG
	qtP6xY9/+qzhsAUyukOEYaH/FdHI31yFtees4A7h+6CQjRuuLTX3Tnn/E7LpSsFrOvxK58s3B1o
	eDkssy896eDRwt71Uh3ZjG0AQ1XEZlNfw7oaQ3kWLX4AbymaGAfX6ZoN6SyJWs51kQAZPBB53F7
	Tge/8QZlYhz1fGC2BxiMkYqfKqDOFpvWkZJHPx5Y/Hs=
X-Google-Smtp-Source: AGHT+IE8/SKNOkh3OWD691lYQAnb2nSVSyMVuxAUKB46j38xJ+sPYkhr14o+4KJZ0ykyZ+9mo6MOwg==
X-Received: by 2002:a05:6a00:a89:b0:737:e73:f64b with SMTP id d2e1a72fcca58-739e48c6f91mr9436320b3a.1.1743875128199;
        Sat, 05 Apr 2025 10:45:28 -0700 (PDT)
Received: from nuvole.. ([144.202.86.13])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-739d97f2fd3sm5680631b3a.69.2025.04.05.10.45.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Apr 2025 10:45:27 -0700 (PDT)
From: Pengyu Luo <mitltlatltl@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>
Cc: Pengyu Luo <mitltlatltl@gmail.com>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-phy@lists.infradead.org
Subject: [PATCH] phy: qualcomm: phy-qcom-eusb2-repeater: rework reg override handler
Date: Sun,  6 Apr 2025 01:43:18 +0800
Message-ID: <20250405174319.405975-1-mitltlatltl@gmail.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In downstream tree, many registers need to be overrided, it varies
from devices and platforms, not only HS trasmit amplitude(0x51),
HS disconnect threshold(0x53), Tx pre-emphasis tuning(0x57).

The device I plan to upstream also uses it, so I write the patch for
it (Oneplus Pad Pro / Oneplus Pad 2, sm8650-mtp based).

In upstream, only Sony Xperia 1 V is using this, so fixing it for sony,
in downstream, some crd, mtp, htk devices also use it, I have no
such device, don't set it for them.

Signed-off-by: Pengyu Luo <mitltlatltl@gmail.com>
---
 .../qcom/sm8550-sony-xperia-yodo-pdx234.dts   |  5 +-
 .../phy/qualcomm/phy-qcom-eusb2-repeater.c    | 86 +++++++++++++++----
 2 files changed, 72 insertions(+), 19 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8550-sony-xperia-yodo-pdx234.dts b/arch/arm64/boot/dts/qcom/sm8550-sony-xperia-yodo-pdx234.dts
index d90dc7b37..99f5fd32c 100644
--- a/arch/arm64/boot/dts/qcom/sm8550-sony-xperia-yodo-pdx234.dts
+++ b/arch/arm64/boot/dts/qcom/sm8550-sony-xperia-yodo-pdx234.dts
@@ -673,9 +673,8 @@ cam_pwr_a_cs: cam-pwr-a-cs-state {
 };
 
 &pm8550b_eusb2_repeater {
-	qcom,tune-usb2-disc-thres = /bits/ 8 <0x6>;
-	qcom,tune-usb2-amplitude = /bits/ 8 <0xf>;
-	qcom,tune-usb2-preem = /bits/ 8 <0x7>;
+	qcom,param-override-seq = <0x51 0x08 0x53 0x06 0x57 0x07>;
+	qcom,host-param-override-seq = <0x51 0x08 0x53 0x06 0x57 0x07>;
 	vdd18-supply = <&pm8550_l15>;
 	vdd3-supply = <&pm8550_l5>;
 };
diff --git a/drivers/phy/qualcomm/phy-qcom-eusb2-repeater.c b/drivers/phy/qualcomm/phy-qcom-eusb2-repeater.c
index 6bd1b3c75..151e93cd0 100644
--- a/drivers/phy/qualcomm/phy-qcom-eusb2-repeater.c
+++ b/drivers/phy/qualcomm/phy-qcom-eusb2-repeater.c
@@ -76,6 +76,11 @@ struct eusb2_repeater {
 	const struct eusb2_repeater_cfg *cfg;
 	u32 base;
 	enum phy_mode mode;
+
+	u32 *param_override_seq;
+	u32 *host_param_override_seq;
+	u8 param_override_seq_cnt;
+	u8 host_param_override_seq_cnt;
 };
 
 static const char * const pm8550b_vreg_l[] = {
@@ -108,6 +113,63 @@ static const struct eusb2_repeater_cfg smb2360_eusb2_cfg = {
 	.num_vregs	= ARRAY_SIZE(pm8550b_vreg_l),
 };
 
+static void eusb2_repeater_write_overrides(struct eusb2_repeater *rptr,
+					   u32 *seq, u8 cnt)
+{
+	int i;
+
+	for (i = 0; i < cnt; i += 2)
+		regmap_write(rptr->regmap, rptr->base + seq[i], seq[i + 1]);
+}
+
+static int eusb2_repeater_read_overrides(struct device *dev, const char *prop,
+					 u32 **seq, u8 *seq_cnt)
+{
+	int num_elem, ret;
+
+	num_elem = of_property_count_elems_of_size(dev->of_node, prop, sizeof(**seq));
+	if (num_elem > 0) {
+		if (num_elem % 2) {
+			dev_err(dev, "invalid len for %s\n", prop);
+			return -EINVAL;
+		}
+
+		*seq_cnt = num_elem;
+		*seq = devm_kcalloc(dev, num_elem, sizeof(**seq), GFP_KERNEL);
+		if (!*seq)
+			return -ENOMEM;
+
+		ret = of_property_read_u32_array(dev->of_node, prop, *seq, num_elem);
+		if (ret) {
+			dev_err(dev, "%s read failed %d\n", prop, ret);
+			return ret;
+		}
+	}
+
+	return 0;
+}
+
+static int eusb2_repeater_parse_dt(struct eusb2_repeater *rptr)
+{
+	int ret;
+
+	ret = of_property_read_u32(rptr->dev->of_node, "reg", &rptr->base);
+	if (ret < 0)
+		return ret;
+
+	ret = eusb2_repeater_read_overrides(rptr->dev, "qcom,param-override-seq",
+					    &rptr->param_override_seq,
+					    &rptr->param_override_seq_cnt);
+	if (ret < 0)
+		return ret;
+
+	ret = eusb2_repeater_read_overrides(rptr->dev, "qcom,host-param-override-seq",
+					    &rptr->host_param_override_seq,
+					    &rptr->host_param_override_seq_cnt);
+
+	return ret;
+}
+
 static int eusb2_repeater_init_vregs(struct eusb2_repeater *rptr)
 {
 	int num = rptr->cfg->num_vregs;
@@ -127,20 +189,12 @@ static int eusb2_repeater_init_vregs(struct eusb2_repeater *rptr)
 static int eusb2_repeater_init(struct phy *phy)
 {
 	struct eusb2_repeater *rptr = phy_get_drvdata(phy);
-	struct device_node *np = rptr->dev->of_node;
 	struct regmap *regmap = rptr->regmap;
 	const u32 *init_tbl = rptr->cfg->init_tbl;
-	u8 tune_usb2_preem = init_tbl[TUNE_USB2_PREEM];
-	u8 tune_hsdisc = init_tbl[TUNE_HSDISC];
-	u8 tune_iusb2 = init_tbl[TUNE_IUSB2];
 	u32 base = rptr->base;
 	u32 val;
 	int ret;
 
-	of_property_read_u8(np, "qcom,tune-usb2-amplitude", &tune_iusb2);
-	of_property_read_u8(np, "qcom,tune-usb2-disc-thres", &tune_hsdisc);
-	of_property_read_u8(np, "qcom,tune-usb2-preem", &tune_usb2_preem);
-
 	ret = regulator_bulk_enable(rptr->cfg->num_vregs, rptr->vregs);
 	if (ret)
 		return ret;
@@ -156,10 +210,9 @@ static int eusb2_repeater_init(struct phy *phy)
 	regmap_write(regmap, base + EUSB2_TUNE_SQUELCH_U, init_tbl[TUNE_SQUELCH_U]);
 	regmap_write(regmap, base + EUSB2_TUNE_RES_FSDIF, init_tbl[TUNE_RES_FSDIF]);
 	regmap_write(regmap, base + EUSB2_TUNE_USB2_CROSSOVER, init_tbl[TUNE_USB2_CROSSOVER]);
-
-	regmap_write(regmap, base + EUSB2_TUNE_USB2_PREEM, tune_usb2_preem);
-	regmap_write(regmap, base + EUSB2_TUNE_HSDISC, tune_hsdisc);
-	regmap_write(regmap, base + EUSB2_TUNE_IUSB2, tune_iusb2);
+	regmap_write(regmap, base + EUSB2_TUNE_USB2_PREEM, init_tbl[TUNE_USB2_PREEM]);
+	regmap_write(regmap, base + EUSB2_TUNE_HSDISC, init_tbl[TUNE_HSDISC]);
+	regmap_write(regmap, base + EUSB2_TUNE_IUSB2, init_tbl[TUNE_IUSB2]);
 
 	ret = regmap_read_poll_timeout(regmap, base + EUSB2_RPTR_STATUS, val, val & RPTR_OK, 10, 5);
 	if (ret)
@@ -177,6 +230,8 @@ static int eusb2_repeater_set_mode(struct phy *phy,
 
 	switch (mode) {
 	case PHY_MODE_USB_HOST:
+		eusb2_repeater_write_overrides(rptr, rptr->host_param_override_seq,
+					       rptr->host_param_override_seq_cnt);
 		/*
 		 * CM.Lx is prohibited when repeater is already into Lx state as
 		 * per eUSB 1.2 Spec. Below implement software workaround until
@@ -186,6 +241,8 @@ static int eusb2_repeater_set_mode(struct phy *phy,
 		regmap_write(regmap, base + EUSB2_FORCE_VAL_5, V_CLK_19P2M_EN);
 		break;
 	case PHY_MODE_USB_DEVICE:
+		eusb2_repeater_write_overrides(rptr, rptr->param_override_seq,
+					       rptr->param_override_seq_cnt);
 		/*
 		 * In device mode clear host mode related workaround as there
 		 * is no repeater reset available, and enable/disable of
@@ -222,7 +279,6 @@ static int eusb2_repeater_probe(struct platform_device *pdev)
 	struct device *dev = &pdev->dev;
 	struct phy_provider *phy_provider;
 	struct device_node *np = dev->of_node;
-	u32 res;
 	int ret;
 
 	rptr = devm_kzalloc(dev, sizeof(*rptr), GFP_KERNEL);
@@ -240,12 +296,10 @@ static int eusb2_repeater_probe(struct platform_device *pdev)
 	if (!rptr->regmap)
 		return -ENODEV;
 
-	ret = of_property_read_u32(np, "reg", &res);
+	ret = eusb2_repeater_parse_dt(rptr);
 	if (ret < 0)
 		return ret;
 
-	rptr->base = res;
-
 	ret = eusb2_repeater_init_vregs(rptr);
 	if (ret < 0) {
 		dev_err(dev, "unable to get supplies\n");
-- 
2.49.0


