Return-Path: <linux-arm-msm+bounces-9298-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C78BA8452E4
	for <lists+linux-arm-msm@lfdr.de>; Thu,  1 Feb 2024 09:39:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3C4C71F23CF6
	for <lists+linux-arm-msm@lfdr.de>; Thu,  1 Feb 2024 08:39:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9662D15A4B1;
	Thu,  1 Feb 2024 08:39:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="gRcwzlAL"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AAB715A495
	for <linux-arm-msm@vger.kernel.org>; Thu,  1 Feb 2024 08:39:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706776784; cv=none; b=ZNwrbN0r1cKTaX9JYPxk2pLHMCzoGzr6vxE8/yzIb6wpJPRqeYqwgjJDARn3mEVfwFn2IxNlZbDLHKaDLXIUBkQc1fd9rvj/ZKgoifqLfYx5BLgi2SRUPZCJgZFVRmQZpZmNNCjB3Z1M85rkKDpW53chXfDNOrdaBSFYCUO5fgU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706776784; c=relaxed/simple;
	bh=xintUEzQ8uM7chXI5krxWTSVIW10j1fGNmwxGlIfins=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=JSIXQrQCG7Kt/0u+/C41ek7QtFfFb14I350bCXF8iHeFPxIKFC0/N9BE9kKNNsDG/EMBhAHg22QmhdoMdXa9TniBolEaN++7Rx0SkAatCNS1EQNpiakTGecpT37CUU1gPhKscCd1cmAf1fJhjeNDyYDCq75gbm8W5xQpwkSCnlI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=gRcwzlAL; arc=none smtp.client-ip=209.85.218.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-a26ed1e05c7so84984866b.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 01 Feb 2024 00:39:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1706776780; x=1707381580; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=/LUOnsZoWQv3AKUXusOG3iHBw6xyGVqBDQ81NDvZ0PQ=;
        b=gRcwzlALQTDKWGRxX7lcMCgtRjl5Gt3jtWpC3McX77NNkcb31cqy4PZql4+kOAcwNX
         B1fpAMZVrw2Q1+TNZXF4dSngW4CS6br7APJXhOISxz8MKbnWo7w2vi23vMswNX0EZeAP
         Ann+LLFN15BTJ3WQ1KvZ19LlM3XQm26iBJ7MHfsUlIOY6usLQeqp3en6ddjNQeJ/i7u1
         f6qsAn424H+GbfnJsz7rzruBcIFCU0+JRvkl8Oh49MUvGXNemd9PDu94rLJ5vSG8ppmj
         zLtCCbCyyOckLIHSmPZVU6v5t3c0FioExiCGthoeECpYtAoY8CuaFNrWcL1rCNTOGfkY
         SP2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706776780; x=1707381580;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/LUOnsZoWQv3AKUXusOG3iHBw6xyGVqBDQ81NDvZ0PQ=;
        b=DLSLNzzf9s0q7bz2i5JEqdPDuCEesm+8nHRJrwc8WiSwl6x/uV85f2/UL0IAIqNUq2
         6Bb8u3xdj0mBTBYukYUPlO/GnXJtY3LJVQavnLmFRXHsdccL6jYv/yFojkQ14qi0nB8H
         nCv6POzUGcVZaVtqjmqikLJ30EfIM9gUmFkbYIe7Guru6zBzdY/ixcmBsocd2zuyu6kg
         F00cM6C7eLCXvfIvV64nrbU3dCNLjxr3l0GFW6U58K5JQnlJhOkIblPxJEiCb4nSZHnk
         8t0LRrIPx0XB5UlED4777Sl3ZqxFI4EJyh9/4W8xbKm/SI7SNNZU3JqGqXIOOuANC+l+
         q7YA==
X-Gm-Message-State: AOJu0YxT/iCYQVwIJYCvrF6c4svWxJPzYiqx88fB/0dbmT9TWJQkQr6y
	bndWdcLkfdzfdgria8KtoL12kHbwMhIc0yx/mT1p0Zgpzn2OCYePeBGeJs52cAI=
X-Google-Smtp-Source: AGHT+IHumu1PNcZ4qBTo97y4VlBNSZUTcGGVqMQ2/51E+ymKFjhoQwTPdGjfzhiOmljtMExeRWOrLA==
X-Received: by 2002:a17:906:cecc:b0:a36:5b1c:fb4b with SMTP id si12-20020a170906cecc00b00a365b1cfb4bmr1133063ejb.13.1706776780568;
        Thu, 01 Feb 2024 00:39:40 -0800 (PST)
X-Forwarded-Encrypted: i=0; AJvYcCUpbreCLyRwzBpbin+TdP1i+rgU+9hVeCHVIQRogtpJALHH6GZadYRsacPcihVu6He4BxHV6Pw4GYH/B0luu88AfQRS/vH0MdgvyCDbSKms0GR1Ep9J1jCk5RunHcAS1eJtHncGRwbfFftIlYlhthH8ZQ+UT49nDf9cjWYuKavShk/+TLbMKt2F2JHbTRpHYXCfRU4wMJdbiIANqZHrXe4f5j1uve7QxCXWiW5HCnVtzdGwXBZH/ElNkpQn9aRJOKFBOfdid/CVAEjvwqwbKRJQzo2XcDdMK/ZAZcgr7u66tsCLVuOSqNF0yDr+g5IILCeUCv4R4wzb1L29rPs=
Received: from [127.0.1.1] ([79.115.23.25])
        by smtp.gmail.com with ESMTPSA id s7-20020a17090699c700b00a36c60180aesm253691ejn.60.2024.02.01.00.39.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Feb 2024 00:39:40 -0800 (PST)
From: Abel Vesa <abel.vesa@linaro.org>
Date: Thu, 01 Feb 2024 10:39:33 +0200
Subject: [PATCH v4] phy: qualcomm: eusb2-repeater: Rework init to drop
 redundant zero-out loop
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240201-phy-qcom-eusb2-repeater-fixes-v4-1-cf18c8cef6d7@linaro.org>
X-B4-Tracking: v=1; b=H4sIAMRYu2UC/43Nyw6CMBCF4VcxXTtmesFaV76HccFlkCZKscVGQ
 nh3CyuMC13+Z5JvRhbIWwrsuBmZp2iDdW0Ktd2wssnbK4GtUjOBQiFHBV0zwKN0d6BnKAR46ij
 vyUNtXxSgNAI55xKlKFkyOk/LIRHnS+rGht75YXkX+bz+K0cOCKh0oYt9cZBSnm62zb3bOX9lM
 x3Fmst+cSJxWmeVOZCuasy+OLnihPnFSeBg8j2nWiqDFX1w0zS9AYI9yoFpAQAA
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, Vinod Koul <vkoul@kernel.org>, 
 Kishon Vijay Abraham I <kishon@kernel.org>
Cc: Elliot Berman <quic_eberman@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Abel Vesa <abel.vesa@linaro.org>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=openpgp-sha256; l=10624; i=abel.vesa@linaro.org;
 h=from:subject:message-id; bh=xintUEzQ8uM7chXI5krxWTSVIW10j1fGNmwxGlIfins=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBlu1jGQEjJF6LQvhZJxo9atbLwNVYbuxO1/OEn+
 itaQqh0CZ6JAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCZbtYxgAKCRAbX0TJAJUV
 VuyFEACHhi61T52YNsLXfVwydXS8A42aXEGj4POrs3OMgRFB1+noMlBMGLZhX+zH7pTub6Y/p2w
 IO+Ok7UAy/bpaW84pRijwq4wWIyEBNf2aFjglqqpnuGeo3LBPzVdks7VH23PiId3yY4eG3NqNKd
 Y/UBO6qdQU0NL/GXB2QG5kGQowztHcYL+j70ciVgXV1Gp+SSc/24PTK88WlJAkFDvcTB5F3IPd9
 FWj5h5cgHjdAXyNLHCdjrIzSS1aBsYdKfHdR5UKVLYjZEDZbR3H5ypUZbkPpADaaDG3omuBWeRv
 HAjNpXynQpNHE23li8Pco4kVDINaPkdnpNI2HShAmtoPUbjnFZMtSSwXdu0oTa8zqPI30tjagAy
 orCj66fKIsV5geWKfWdgp5+YUDKHAOb9k8gTwxtgJgajR5d70UOa79jgdAUrzLs4jovV5tSERx1
 w+k8wQDwf9YW/lxyzDa82Nn8Qj4zUkgi55UHWVJVWX7LrII4U1PMegNLi0dpKRrFz1zODkL18jK
 Y2EoV75bvxbYV6I7Q+c8EoNO1GII4DWf4Y32129XqoQLlc/Abm1KKrMqWs2qUKnLTu8HUFtnayg
 SKuwsMayu4a3x01gBFJ1QQUuM5eeWIDYp8KZ/KlKM3OjlaBQcR4J73Aqpz1xGH3jBQ45zvUP7R4
 QS8rVSwil9r/dDA==
X-Developer-Key: i=abel.vesa@linaro.org; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE

Instead of incrementing the base of the global reg fields, which renders
the second instance of the repeater broken due to wrong offsets, use
regmap with base and offset. As for zeroing out the rest of the tuning
regs, avoid looping though the table and just use the table as is,
as it is already zero initialized.

Fixes: 99a517a582fc ("phy: qualcomm: phy-qcom-eusb2-repeater: Zero out untouched tuning regs")
Tested-by: Elliot Berman <quic_eberman@quicinc.com> # sm8650-qrd
Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
---
Changes in v4:
- Added Elliot's T-b tag
- Re-worded commit message
- Link to v3: https://lore.kernel.org/r/20240129-phy-qcom-eusb2-repeater-fixes-v3-1-9a61ef3490de@linaro.org

Changes in v3:
- Reworked so that it uses base + reg-index.
- Link to v2: https://lore.kernel.org/r/20240105-phy-qcom-eusb2-repeater-fixes-v2-0-775d98e7df05@linaro.org

Changes in v2:
- The regfields is being dropped from the repeater init, but it's done
  in the second patch in order to not break bisectability, as it is
  still needed by the zero-out loop.
- Added Konrad's R-b tag to the first patch. Did not add Elliot's T-b
  tag as the second patch has been reworked massively.
- The zero-out loop is dropped now by holding a copy of the init_tlb in
  the container struct. This led to dropping the cfg from the container
  struct (see second patch commit message for more details).
- Link to v1: https://lore.kernel.org/r/20240104-phy-qcom-eusb2-repeater-fixes-v1-0-047b7b6b8333@linaro.org
---
 drivers/phy/qualcomm/phy-qcom-eusb2-repeater.c | 166 +++++++++----------------
 1 file changed, 62 insertions(+), 104 deletions(-)

diff --git a/drivers/phy/qualcomm/phy-qcom-eusb2-repeater.c b/drivers/phy/qualcomm/phy-qcom-eusb2-repeater.c
index a623f092b11f..a43e20abb10d 100644
--- a/drivers/phy/qualcomm/phy-qcom-eusb2-repeater.c
+++ b/drivers/phy/qualcomm/phy-qcom-eusb2-repeater.c
@@ -37,56 +37,28 @@
 #define EUSB2_TUNE_EUSB_EQU		0x5A
 #define EUSB2_TUNE_EUSB_HS_COMP_CUR	0x5B
 
-#define QCOM_EUSB2_REPEATER_INIT_CFG(r, v)	\
-	{					\
-		.reg = r,			\
-		.val = v,			\
-	}
-
-enum reg_fields {
-	F_TUNE_EUSB_HS_COMP_CUR,
-	F_TUNE_EUSB_EQU,
-	F_TUNE_EUSB_SLEW,
-	F_TUNE_USB2_HS_COMP_CUR,
-	F_TUNE_USB2_PREEM,
-	F_TUNE_USB2_EQU,
-	F_TUNE_USB2_SLEW,
-	F_TUNE_SQUELCH_U,
-	F_TUNE_HSDISC,
-	F_TUNE_RES_FSDIF,
-	F_TUNE_IUSB2,
-	F_TUNE_USB2_CROSSOVER,
-	F_NUM_TUNE_FIELDS,
-
-	F_FORCE_VAL_5 = F_NUM_TUNE_FIELDS,
-	F_FORCE_EN_5,
-
-	F_EN_CTL1,
-
-	F_RPTR_STATUS,
-	F_NUM_FIELDS,
-};
-
-static struct reg_field eusb2_repeater_tune_reg_fields[F_NUM_FIELDS] = {
-	[F_TUNE_EUSB_HS_COMP_CUR] = REG_FIELD(EUSB2_TUNE_EUSB_HS_COMP_CUR, 0, 1),
-	[F_TUNE_EUSB_EQU] = REG_FIELD(EUSB2_TUNE_EUSB_EQU, 0, 1),
-	[F_TUNE_EUSB_SLEW] = REG_FIELD(EUSB2_TUNE_EUSB_SLEW, 0, 1),
-	[F_TUNE_USB2_HS_COMP_CUR] = REG_FIELD(EUSB2_TUNE_USB2_HS_COMP_CUR, 0, 1),
-	[F_TUNE_USB2_PREEM] = REG_FIELD(EUSB2_TUNE_USB2_PREEM, 0, 2),
-	[F_TUNE_USB2_EQU] = REG_FIELD(EUSB2_TUNE_USB2_EQU, 0, 1),
-	[F_TUNE_USB2_SLEW] = REG_FIELD(EUSB2_TUNE_USB2_SLEW, 0, 1),
-	[F_TUNE_SQUELCH_U] = REG_FIELD(EUSB2_TUNE_SQUELCH_U, 0, 2),
-	[F_TUNE_HSDISC] = REG_FIELD(EUSB2_TUNE_HSDISC, 0, 2),
-	[F_TUNE_RES_FSDIF] = REG_FIELD(EUSB2_TUNE_RES_FSDIF, 0, 2),
-	[F_TUNE_IUSB2] = REG_FIELD(EUSB2_TUNE_IUSB2, 0, 3),
-	[F_TUNE_USB2_CROSSOVER] = REG_FIELD(EUSB2_TUNE_USB2_CROSSOVER, 0, 2),
-
-	[F_FORCE_VAL_5] = REG_FIELD(EUSB2_FORCE_VAL_5, 0, 7),
-	[F_FORCE_EN_5] = REG_FIELD(EUSB2_FORCE_EN_5, 0, 7),
-
-	[F_EN_CTL1] = REG_FIELD(EUSB2_EN_CTL1, 0, 7),
-
-	[F_RPTR_STATUS] = REG_FIELD(EUSB2_RPTR_STATUS, 0, 7),
+enum eusb2_reg_layout {
+	TUNE_EUSB_HS_COMP_CUR,
+	TUNE_EUSB_EQU,
+	TUNE_EUSB_SLEW,
+	TUNE_USB2_HS_COMP_CUR,
+	TUNE_USB2_PREEM,
+	TUNE_USB2_EQU,
+	TUNE_USB2_SLEW,
+	TUNE_SQUELCH_U,
+	TUNE_HSDISC,
+	TUNE_RES_FSDIF,
+	TUNE_IUSB2,
+	TUNE_USB2_CROSSOVER,
+	NUM_TUNE_FIELDS,
+
+	FORCE_VAL_5 = NUM_TUNE_FIELDS,
+	FORCE_EN_5,
+
+	EN_CTL1,
+
+	RPTR_STATUS,
+	LAYOUT_SIZE,
 };
 
 struct eusb2_repeater_cfg {
@@ -98,10 +70,11 @@ struct eusb2_repeater_cfg {
 
 struct eusb2_repeater {
 	struct device *dev;
-	struct regmap_field *regs[F_NUM_FIELDS];
+	struct regmap *regmap;
 	struct phy *phy;
 	struct regulator_bulk_data *vregs;
 	const struct eusb2_repeater_cfg *cfg;
+	u32 base;
 	enum phy_mode mode;
 };
 
@@ -109,10 +82,10 @@ static const char * const pm8550b_vreg_l[] = {
 	"vdd18", "vdd3",
 };
 
-static const u32 pm8550b_init_tbl[F_NUM_TUNE_FIELDS] = {
-	[F_TUNE_IUSB2] = 0x8,
-	[F_TUNE_SQUELCH_U] = 0x3,
-	[F_TUNE_USB2_PREEM] = 0x5,
+static const u32 pm8550b_init_tbl[NUM_TUNE_FIELDS] = {
+	[TUNE_IUSB2] = 0x8,
+	[TUNE_SQUELCH_U] = 0x3,
+	[TUNE_USB2_PREEM] = 0x5,
 };
 
 static const struct eusb2_repeater_cfg pm8550b_eusb2_cfg = {
@@ -140,47 +113,42 @@ static int eusb2_repeater_init_vregs(struct eusb2_repeater *rptr)
 
 static int eusb2_repeater_init(struct phy *phy)
 {
-	struct reg_field *regfields = eusb2_repeater_tune_reg_fields;
 	struct eusb2_repeater *rptr = phy_get_drvdata(phy);
 	struct device_node *np = rptr->dev->of_node;
-	u32 init_tbl[F_NUM_TUNE_FIELDS] = { 0 };
-	u8 override;
+	struct regmap *regmap = rptr->regmap;
+	const u32 *init_tbl = rptr->cfg->init_tbl;
+	u8 tune_usb2_preem = init_tbl[TUNE_USB2_PREEM];
+	u8 tune_hsdisc = init_tbl[TUNE_HSDISC];
+	u8 tune_iusb2 = init_tbl[TUNE_IUSB2];
+	u32 base = rptr->base;
 	u32 val;
 	int ret;
-	int i;
+
+	of_property_read_u8(np, "qcom,tune-usb2-amplitude", &tune_iusb2);
+	of_property_read_u8(np, "qcom,tune-usb2-disc-thres", &tune_hsdisc);
+	of_property_read_u8(np, "qcom,tune-usb2-preem", &tune_usb2_preem);
 
 	ret = regulator_bulk_enable(rptr->cfg->num_vregs, rptr->vregs);
 	if (ret)
 		return ret;
 
-	regmap_field_update_bits(rptr->regs[F_EN_CTL1], EUSB2_RPTR_EN, EUSB2_RPTR_EN);
+	regmap_write(regmap, base + EUSB2_EN_CTL1, EUSB2_RPTR_EN);
 
-	for (i = 0; i < F_NUM_TUNE_FIELDS; i++) {
-		if (init_tbl[i]) {
-			regmap_field_update_bits(rptr->regs[i], init_tbl[i], init_tbl[i]);
-		} else {
-			/* Write 0 if there's no value set */
-			u32 mask = GENMASK(regfields[i].msb, regfields[i].lsb);
-
-			regmap_field_update_bits(rptr->regs[i], mask, 0);
-		}
-	}
-	memcpy(init_tbl, rptr->cfg->init_tbl, sizeof(init_tbl));
+	regmap_write(regmap, base + EUSB2_TUNE_EUSB_HS_COMP_CUR, init_tbl[TUNE_EUSB_HS_COMP_CUR]);
+	regmap_write(regmap, base + EUSB2_TUNE_EUSB_EQU, init_tbl[TUNE_EUSB_EQU]);
+	regmap_write(regmap, base + EUSB2_TUNE_EUSB_SLEW, init_tbl[TUNE_EUSB_SLEW]);
+	regmap_write(regmap, base + EUSB2_TUNE_USB2_HS_COMP_CUR, init_tbl[TUNE_USB2_HS_COMP_CUR]);
+	regmap_write(regmap, base + EUSB2_TUNE_USB2_EQU, init_tbl[TUNE_USB2_EQU]);
+	regmap_write(regmap, base + EUSB2_TUNE_USB2_SLEW, init_tbl[TUNE_USB2_SLEW]);
+	regmap_write(regmap, base + EUSB2_TUNE_SQUELCH_U, init_tbl[TUNE_SQUELCH_U]);
+	regmap_write(regmap, base + EUSB2_TUNE_RES_FSDIF, init_tbl[TUNE_RES_FSDIF]);
+	regmap_write(regmap, base + EUSB2_TUNE_USB2_CROSSOVER, init_tbl[TUNE_USB2_CROSSOVER]);
 
-	if (!of_property_read_u8(np, "qcom,tune-usb2-amplitude", &override))
-		init_tbl[F_TUNE_IUSB2] = override;
+	regmap_write(regmap, base + EUSB2_TUNE_USB2_PREEM, tune_usb2_preem);
+	regmap_write(regmap, base + EUSB2_TUNE_HSDISC, tune_hsdisc);
+	regmap_write(regmap, base + EUSB2_TUNE_IUSB2, tune_iusb2);
 
-	if (!of_property_read_u8(np, "qcom,tune-usb2-disc-thres", &override))
-		init_tbl[F_TUNE_HSDISC] = override;
-
-	if (!of_property_read_u8(np, "qcom,tune-usb2-preem", &override))
-		init_tbl[F_TUNE_USB2_PREEM] = override;
-
-	for (i = 0; i < F_NUM_TUNE_FIELDS; i++)
-		regmap_field_update_bits(rptr->regs[i], init_tbl[i], init_tbl[i]);
-
-	ret = regmap_field_read_poll_timeout(rptr->regs[F_RPTR_STATUS],
-					     val, val & RPTR_OK, 10, 5);
+	ret = regmap_read_poll_timeout(regmap, base + EUSB2_RPTR_STATUS, val, val & RPTR_OK, 10, 5);
 	if (ret)
 		dev_err(rptr->dev, "initialization timed-out\n");
 
@@ -191,6 +159,8 @@ static int eusb2_repeater_set_mode(struct phy *phy,
 				   enum phy_mode mode, int submode)
 {
 	struct eusb2_repeater *rptr = phy_get_drvdata(phy);
+	struct regmap *regmap = rptr->regmap;
+	u32 base = rptr->base;
 
 	switch (mode) {
 	case PHY_MODE_USB_HOST:
@@ -199,10 +169,8 @@ static int eusb2_repeater_set_mode(struct phy *phy,
 		 * per eUSB 1.2 Spec. Below implement software workaround until
 		 * PHY and controller is fixing seen observation.
 		 */
-		regmap_field_update_bits(rptr->regs[F_FORCE_EN_5],
-					 F_CLK_19P2M_EN, F_CLK_19P2M_EN);
-		regmap_field_update_bits(rptr->regs[F_FORCE_VAL_5],
-					 V_CLK_19P2M_EN, V_CLK_19P2M_EN);
+		regmap_write(regmap, base + EUSB2_FORCE_EN_5, F_CLK_19P2M_EN);
+		regmap_write(regmap, base + EUSB2_FORCE_VAL_5, V_CLK_19P2M_EN);
 		break;
 	case PHY_MODE_USB_DEVICE:
 		/*
@@ -211,10 +179,8 @@ static int eusb2_repeater_set_mode(struct phy *phy,
 		 * repeater doesn't clear previous value due to shared
 		 * regulators (say host <-> device mode switch).
 		 */
-		regmap_field_update_bits(rptr->regs[F_FORCE_EN_5],
-					 F_CLK_19P2M_EN, 0);
-		regmap_field_update_bits(rptr->regs[F_FORCE_VAL_5],
-					 V_CLK_19P2M_EN, 0);
+		regmap_write(regmap, base + EUSB2_FORCE_EN_5, 0);
+		regmap_write(regmap, base + EUSB2_FORCE_VAL_5, 0);
 		break;
 	default:
 		return -EINVAL;
@@ -243,9 +209,8 @@ static int eusb2_repeater_probe(struct platform_device *pdev)
 	struct device *dev = &pdev->dev;
 	struct phy_provider *phy_provider;
 	struct device_node *np = dev->of_node;
-	struct regmap *regmap;
-	int i, ret;
 	u32 res;
+	int ret;
 
 	rptr = devm_kzalloc(dev, sizeof(*rptr), GFP_KERNEL);
 	if (!rptr)
@@ -258,22 +223,15 @@ static int eusb2_repeater_probe(struct platform_device *pdev)
 	if (!rptr->cfg)
 		return -EINVAL;
 
-	regmap = dev_get_regmap(dev->parent, NULL);
-	if (!regmap)
+	rptr->regmap = dev_get_regmap(dev->parent, NULL);
+	if (!rptr->regmap)
 		return -ENODEV;
 
 	ret = of_property_read_u32(np, "reg", &res);
 	if (ret < 0)
 		return ret;
 
-	for (i = 0; i < F_NUM_FIELDS; i++)
-		eusb2_repeater_tune_reg_fields[i].reg += res;
-
-	ret = devm_regmap_field_bulk_alloc(dev, regmap, rptr->regs,
-					   eusb2_repeater_tune_reg_fields,
-					   F_NUM_FIELDS);
-	if (ret)
-		return ret;
+	rptr->base = res;
 
 	ret = eusb2_repeater_init_vregs(rptr);
 	if (ret < 0) {

---
base-commit: 596764183be8ebb13352b281a442a1f1151c9b06
change-id: 20240104-phy-qcom-eusb2-repeater-fixes-c9201113032c

Best regards,
-- 
Abel Vesa <abel.vesa@linaro.org>


