Return-Path: <linux-arm-msm+bounces-8953-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BF97B841C26
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Jan 2024 07:47:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3830828C1FC
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Jan 2024 06:47:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1BAF15467B;
	Tue, 30 Jan 2024 06:47:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="GqOIcAA8"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E230537F8
	for <linux-arm-msm@vger.kernel.org>; Tue, 30 Jan 2024 06:47:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706597234; cv=none; b=KAeZpUsdjNC3xIYgViAS92HoaMCNyWzky1VdteB1+NYHVNtvJGWduXnquDkPoc5jMiDZMITyWmcQnWmXL/FFEACu9y2UvmjheYqCPtBywVP0hJGW7DTAkZctkVAUnWOG9emAg5ovr4xKfyqpS3SI7GzNKoKtiv9xw2gGHEcRfVk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706597234; c=relaxed/simple;
	bh=Yr9q5taAxzx5jxxmv1tRyH2+HoyzMTNzkhBu27q+7l0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=lAHmFF7IUMuNYMN33RhGMTchAwkndMW/fkGL4WyQ8me6tD7X8GcJnaAChN+BxnnQ3diEKzgqydFUiTdCnOE5xRMHVQJ6X37K8Wz4PRCvEd1OuFWPk/lbFo4nU8nsTrspGyScbAA1kcn3Sm8wRLuE51pcghYKK7cxbv/21IOsojs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=GqOIcAA8; arc=none smtp.client-ip=209.85.167.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-51030667cedso4243312e87.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jan 2024 22:47:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1706597230; x=1707202030; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TIZlNpio2xRbKCelL+jH7Jv0TEbudBZ5ilP6roQWReA=;
        b=GqOIcAA8Kd1xDgsDSkQ2CwwosZ8/V+9zTblaAHSdMvPUHvyiTnJrPPhm/LLTFiDzED
         QXOVc7H4irr7sbVbNxWev/zYBORrWf57Nd7GSQzSXK3d1+EUBWDIdDW+C3s/BOcElFVi
         DyhMbcUGbpsKxkmiIJ20jGter4DkLp0d6Pu42mMAwQDwc4uvqlIIXSK3Y5zb2cyMKMYw
         lV1Fb2HbfV0UVx4rMsZfH5bdj1kpQm3llo3OejTxnAOevWn6SMAvtdfCifIRfxpOgRw3
         kjEo6CGQ9nMnqQJX5OhylGUGFKmwGqGus8P5ZHgmx+tx5enj7ndcGPVErUAacja9iJoF
         aseQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706597230; x=1707202030;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TIZlNpio2xRbKCelL+jH7Jv0TEbudBZ5ilP6roQWReA=;
        b=cgvHjHjVEmvltze9mwVziSpVTwL7jrZsHwyC5KVx9ZYcHYRWedZYj+8Yxzr7L8tDnB
         hvcY7c3kF0EdvMTdljf812U6OQZKWSO/3oijBQcHGjRFYE7bUOoUF8USvAU2+LE60Kqc
         bso99ZPLUFOJW+i8a4vOeR9Mi/N00zRr93KQQUHF/lci+Q0t8beE/dnKi1VHdTDx8ZVt
         w9T7SO5bHn5i1s+D8dCbfptPh8foTVG48lu+U58l1FTgPOtoBfVtJS34QVpM6oTLgEd1
         5mqDlbXBZwFuzZ/UV8aaZRbvRVw3yu1+R6bd7btYBp3i7QCw/nR2ZE+pcXRGbyI/RADb
         M2Pg==
X-Gm-Message-State: AOJu0Yx4ihOeZvr4HVwKlmZiYGBcgwdfPu5xFNe4U+aVuA8BBfgjuKVP
	MXCTwtNe6zlzoon33ZqwUxX9V+sXxST1Wi3kGh8SgfW30OMjUP/0/1Xm1ECRGcP4oRF6NCgwrPx
	G
X-Google-Smtp-Source: AGHT+IGIJ+oFaSjayPTR7DspAKUxRE/rmpexVTQ5OvG66TcD07PnSzDDWMlJxJOFbC1rISlDii7GYA==
X-Received: by 2002:a05:6512:234e:b0:511:1775:5a1b with SMTP id p14-20020a056512234e00b0051117755a1bmr1802509lfu.38.1706597229926;
        Mon, 29 Jan 2024 22:47:09 -0800 (PST)
Received: from umbar.lan ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id d18-20020a056512369200b005101e1870aasm1367068lfs.162.2024.01.29.22.47.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jan 2024 22:47:09 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 30 Jan 2024 08:47:08 +0200
Subject: [PATCH 3/3] wifi: ath10k: drop fw.eboard file name
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240130-wcn3990-board-fw-v1-3-738f7c19a8c8@linaro.org>
References: <20240130-wcn3990-board-fw-v1-0-738f7c19a8c8@linaro.org>
In-Reply-To: <20240130-wcn3990-board-fw-v1-0-738f7c19a8c8@linaro.org>
To: Kalle Valo <kvalo@kernel.org>, Jeff Johnson <quic_jjohnson@quicinc.com>
Cc: ath10k@lists.infradead.org, linux-wireless@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=openpgp-sha256; l=2741;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=Yr9q5taAxzx5jxxmv1tRyH2+HoyzMTNzkhBu27q+7l0=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBluJtrbsu2CTKAvl9H5XQ/cJRM6VTif6qlSydVi
 EzPhKX+Iu6JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZbibawAKCRCLPIo+Aiko
 1dH9B/0XaL30eMhfCcqfeZI5LYlwAC+ZdjQF02vG8KUQRjqGCvf6K/1fb3mac/phOkoXYpalOT/
 4FOnBv+qHbylchHd8eBnw3S20LnMj59pxRHl7totV1aiIsepBEcLu0L85drAlNNr6bWeK8K7GQD
 R8mzON5WfYOt1SZqpcqxuzksL4TWk2Qow4r6QHvE75uLHkvlK42zmRmrIIDHKjbmadntQ+QL2dZ
 2K2vC+sOiFDjZclIpkLAxI4A0+7300tH3nuaPRtHu/O4Guj4FCvjR9TSaKkz8+oMaubr+ZBlquK
 XYrQVXhA9OkwcViNDMs4TnznjwWh3iy2OW8xrT8sQQknnBqf
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

Follow the example set up by previous commit and drop .fw.eboard
setting. Instead always use "eboard.bin" in this case. QCA9984 already
uses that file name, any (im)possible future users will just have to use
the same file name.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/net/wireless/ath/ath10k/core.c | 8 +-------
 drivers/net/wireless/ath/ath10k/hw.h   | 3 +--
 2 files changed, 2 insertions(+), 9 deletions(-)

diff --git a/drivers/net/wireless/ath/ath10k/core.c b/drivers/net/wireless/ath/ath10k/core.c
index e01a7b196b99..71ca1c1a528f 100644
--- a/drivers/net/wireless/ath/ath10k/core.c
+++ b/drivers/net/wireless/ath/ath10k/core.c
@@ -448,7 +448,6 @@ static const struct ath10k_hw_params ath10k_hw_params_list[] = {
 		.cal_data_len = 12064,
 		.fw = {
 			.dir = QCA9984_HW_1_0_FW_DIR,
-			.eboard = QCA9984_HW_1_0_EBOARD_DATA_FILE,
 			.board_size = QCA99X0_BOARD_DATA_SZ,
 			.board_ext_size = QCA99X0_BOARD_EXT_DATA_SZ,
 			.ext_board_size = QCA99X0_EXT_BOARD_DATA_SZ,
@@ -1294,13 +1293,8 @@ static int ath10k_core_fetch_board_data_api_1(struct ath10k *ar, int bd_ie_type)
 		ar->normal_mode_fw.board_data = ar->normal_mode_fw.board->data;
 		ar->normal_mode_fw.board_len = ar->normal_mode_fw.board->size;
 	} else if (bd_ie_type == ATH10K_BD_IE_BOARD_EXT) {
-		if (!ar->hw_params.fw.eboard) {
-			ath10k_err(ar, "failed to find eboard file fw entry\n");
-			return -EINVAL;
-		}
-
 		fw = ath10k_fetch_fw_file(ar, ar->hw_params.fw.dir,
-					  ar->hw_params.fw.eboard);
+					  ATH10K_EBOARD_DATA_FILE);
 		ar->normal_mode_fw.ext_board = fw;
 		if (IS_ERR(ar->normal_mode_fw.ext_board))
 			return PTR_ERR(ar->normal_mode_fw.ext_board);
diff --git a/drivers/net/wireless/ath/ath10k/hw.h b/drivers/net/wireless/ath/ath10k/hw.h
index 12e8aebab1e9..48897e5eca06 100644
--- a/drivers/net/wireless/ath/ath10k/hw.h
+++ b/drivers/net/wireless/ath/ath10k/hw.h
@@ -102,7 +102,6 @@ enum qca9377_chip_id_rev {
 #define QCA9984_HW_DEV_TYPE		0xa
 #define QCA9984_HW_1_0_CHIP_ID_REV	0x0
 #define QCA9984_HW_1_0_FW_DIR		ATH10K_FW_DIR "/QCA9984/hw1.0"
-#define QCA9984_HW_1_0_EBOARD_DATA_FILE "eboard.bin"
 #define QCA9984_HW_1_0_PATCH_LOAD_ADDR	0x1234
 
 /* QCA9888 2.0 defines */
@@ -152,6 +151,7 @@ enum qca9377_chip_id_rev {
 
 #define ATH10K_BOARD_DATA_FILE         "board.bin"
 #define ATH10K_BOARD_API2_FILE         "board-2.bin"
+#define ATH10K_EBOARD_DATA_FILE        "eboard.bin"
 
 #define REG_DUMP_COUNT_QCA988X 60
 
@@ -546,7 +546,6 @@ struct ath10k_hw_params {
 	struct ath10k_hw_params_fw {
 		const char *dir;
 		size_t board_size;
-		const char *eboard;
 		size_t ext_board_size;
 		size_t board_ext_size;
 	} fw;

-- 
2.39.2


