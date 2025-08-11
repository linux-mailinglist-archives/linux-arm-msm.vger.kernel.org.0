Return-Path: <linux-arm-msm+bounces-68267-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 22D98B201D9
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 Aug 2025 10:31:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3A789166C0E
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 Aug 2025 08:31:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 010511F4C87;
	Mon, 11 Aug 2025 08:31:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dTQybxVK"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43C1D212B18;
	Mon, 11 Aug 2025 08:31:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754901077; cv=none; b=lZt7hHIGCZH85zoRpj7YWwEOc/6tae8NEBEOpMcbtgJ/3NrRdBKhyepmwmgunq+ZrSRb30QH7s7fOU/c2L9jAKjjdYITSvJ9xuDiNRZKWbUvsGV5D/mwoePaICN6BNGfZI+m9mWJ+y/kNLMm1Hb/hc0706y2Iu54sVoFFP7H2n0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754901077; c=relaxed/simple;
	bh=U1qcYg35m6rNExe+OGQEhXL5x84bq0o3vE4mortfvIs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=t5Y29IvqSp/wpPNoUt5eLFZvlc+CYPoOvEMM2Zi4Td4jewGwX3uu3xc7GP9oTHKahCyzzAROFN1qF5/zJQ8OIy/Dh2cvmtqFZ0HzPwSw5p/SkdCeQGZkmGBW1mLWI8cXiQvivB6528K8/m84mQ0YWEgctY9z+iRf3DxbZ/bUYKE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dTQybxVK; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-455fdfb5d04so20164895e9.2;
        Mon, 11 Aug 2025 01:31:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754901072; x=1755505872; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=wOtd9kWma43H7P5MqRsKQkGoPo3236xREv3Mb1e2gt4=;
        b=dTQybxVK2QhDsDh3wkBgpKVCpM5ytEpzoKiYGbGhhnA3qYyMchKshSbJbMFm1yYV0n
         7t4MyB666fOJ+qtjh+9i4HqsCqWlzALR3Mu75QtA02XQPlYERA/WJC4vFO+PqMgWKFFq
         yakmXRf03IvinMVZ9JF1DMJU1HpCTg8IbOvM31Y/OGNbt8FDpE+NlBljWQGKbL5aStVj
         hIxjxK/1vz6eP5kbz+sUP1ducn0xvw4awo76brRw/zuCyVT2IMlUYxMk9YGIwCrgQ8fp
         RgE8ZFQcsApZyiXbnk9pyT5HNXNaWEFP6fRHSmIWOCFAGj6Nvp76WVew+hrsQh32mNPN
         jRuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754901072; x=1755505872;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wOtd9kWma43H7P5MqRsKQkGoPo3236xREv3Mb1e2gt4=;
        b=aKYz6uksBtf5L/hpi7nP15AXrTCvybsNdUsxa8mteDAKq/1ZcrFK5x6+Uu4/ubuP8D
         1Q28QhbT7MZiU2X0/FCibWCXGEDO+9cU9Ynqho2B56gB1/Y7QNhlHCL9NofARR9q6loW
         I+Fw4siz7bz4wUSEcIBAP5WIT7Wi6aAWRbOzDIC8YzjCbEf2MGHH4wj3c2QeTzrd/YMV
         BPrGz7xZy+dEv8rizNsNmMYPC+LK+WMDzLMOzO+xdVX8r1KW4GSxx+kMX91sfxzay7yC
         BkCC4K/mxvMD/2X7KC0+O6rfRcpiut8NeCCabacGIbcop03BBLMBoBRaSa6IHOSETJXk
         sLbA==
X-Forwarded-Encrypted: i=1; AJvYcCUX6cpWk3osnYRm0yrIr+0fyf/325ctIi6cxWpM69BItfVNta7lTEUMCd2aqMiInlOSXWhIHfn5n5eyqTOx@vger.kernel.org, AJvYcCUezunxeL8wX5efB/MlTcN/glHVo+O4GqbxNZ775fuj/lmjTPGbI2cgWqc7bpBkvNjG/aWywwyJnyJnHsK+@vger.kernel.org
X-Gm-Message-State: AOJu0YwaJUCSKqmgSEr79HYtfNny7AzTcLsjHbSWclmd0R9yM+nlYOh/
	LB9V8zi3/dBE+PzoJ3+g5o9A9gxk7X8hvdw7WpKgeK8+lLPEO+M/tQs3s5penA==
X-Gm-Gg: ASbGncsKKQmbqidRtmepurRDRECWHOsh/SxvDg5/9Ih0cvKgUVw0+qZVO712wetAmYw
	L1HaiwQwyA+vZcOIBk48R3w8rfCN6XJwo9odp1pAciw8XIsWqwb222o4PVpORczXpU9wjU7807l
	dNx8Kje18DRhnz0P2IBge0HlVc8iuMbxTXcNaFwD0xrZPMyPi4Ux7Xc/RWFC+wRco2KCt/cjs7k
	60mLeOtAmiUCIhGzrR5750A48klRTjnDcDoajdEMydV0nqhAfCX3XdzQp6vHBSaTEA3BVenSA2o
	cfvftKkOJiABWv5dfj2VXL/BdGP0FwWj5jPNF5afrRDuCJVan3lsTC9Jcrj8Jy0oOOzWUqs7e+c
	EeccGQgcdR/Hrxq/lTU2KiMeYFD1KFhcNSwCWgjegjtFAC3paa/Q=
X-Google-Smtp-Source: AGHT+IFgLlz/HnaQehSt4Y6L68idWWxRSs7RRcM0JgVnx/De2YA7SJzeSHYNdYXnIOPvP3AWZzaJ6Q==
X-Received: by 2002:a05:600c:19d2:b0:456:29da:bb25 with SMTP id 5b1f17b1804b1-459f4f04f66mr107162695e9.19.1754901072370;
        Mon, 11 Aug 2025 01:31:12 -0700 (PDT)
Received: from [192.168.0.253] (5D59A51C.catv.pool.telekom.hu. [93.89.165.28])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-459e5887b7fsm243580255e9.30.2025.08.11.01.31.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Aug 2025 01:31:11 -0700 (PDT)
From: Gabor Juhos <j4g8y7@gmail.com>
Date: Mon, 11 Aug 2025 10:30:42 +0200
Subject: [PATCH] mtd: nand: qpic_common: use {cmd,data}_sgl_nitems for
 sg_init_table()
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250811-qpic_common-sgl-nitems-v1-1-a71b5ece54ab@gmail.com>
X-B4-Tracking: v=1; b=H4sIADGqmWgC/x3MQQqEMAxA0atI1hOoxYp6FRkGiVEDttVmEEG8u
 8XlW/x/gXISVuiKCxIfohJDRvkpgJYhzIwyZoM11pnGtLhvQj+K3seAOq8Y5M9esSV21VCPhqy
 DHG+JJznfcf+97wevltygaAAAAA==
X-Change-ID: 20250809-qpic_common-sgl-nitems-9ce54a6d0c25
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org, linux-arm-msm@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Gabor Juhos <j4g8y7@gmail.com>
X-Mailer: b4 0.14.2

Since commit ddaad4ad774d ("mtd: nand: qpic_common: prevent out of
bounds access of BAM arrays"), the {cmd,data}_sgl_nitems members in
the 'bam_transaction' structure are containing the number of elements
in the cmd/data scatter-gather lists.

Change the qcom_clear_bam_transaction() function to use these numbers
while reinitializing the sg lists instead of recomputing the number of
elements to make it less error prone.

Signed-off-by: Gabor Juhos <j4g8y7@gmail.com>
---
 drivers/mtd/nand/qpic_common.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/mtd/nand/qpic_common.c b/drivers/mtd/nand/qpic_common.c
index 8e604cc22ca310159edf4d8dbc2f6a82d5119eb4..db6c46a6fe01c71e8bb0379eb1f289c7e56701c9 100644
--- a/drivers/mtd/nand/qpic_common.c
+++ b/drivers/mtd/nand/qpic_common.c
@@ -89,10 +89,8 @@ void qcom_clear_bam_transaction(struct qcom_nand_controller *nandc)
 	memset(&bam_txn->bam_positions, 0, sizeof(bam_txn->bam_positions));
 	bam_txn->last_data_desc = NULL;
 
-	sg_init_table(bam_txn->cmd_sgl, nandc->max_cwperpage *
-		      QPIC_PER_CW_CMD_SGL);
-	sg_init_table(bam_txn->data_sgl, nandc->max_cwperpage *
-		      QPIC_PER_CW_DATA_SGL);
+	sg_init_table(bam_txn->cmd_sgl, bam_txn->cmd_sgl_nitems);
+	sg_init_table(bam_txn->data_sgl, bam_txn->data_sgl_nitems);
 
 	reinit_completion(&bam_txn->txn_done);
 }

---
base-commit: 8f5ae30d69d7543eee0d70083daf4de8fe15d585
change-id: 20250809-qpic_common-sgl-nitems-9ce54a6d0c25

Best regards,
-- 
Gabor Juhos <j4g8y7@gmail.com>


