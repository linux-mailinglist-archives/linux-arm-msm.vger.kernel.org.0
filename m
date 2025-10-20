Return-Path: <linux-arm-msm+bounces-77949-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F45BBEF9F7
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Oct 2025 09:14:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D5B48189CB70
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Oct 2025 07:14:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 35FC02D6E67;
	Mon, 20 Oct 2025 07:12:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="A79It8q0"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39D872DC78F
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Oct 2025 07:12:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760944361; cv=none; b=UZI45HqYJWZ2iyFVAh1LoobRw8WPxB7HOrd2PtXOrhtuXYdTzDGUytidssY8pvLcU2lkQfAMkMzksjQGwAd4pgLnq+dS1qMM/md9g0xRMICZSvA6Ukzw1dsaRR6fSwIjaAdza5r1OI14LLhveDvLeDzTNuJhWNd2fSj/K2KchdQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760944361; c=relaxed/simple;
	bh=I7qG9i4AzCKwppd/fhlD4h5td/0pETSBGvoJB8csxL4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=kusorfwocEhvVoqWR5mt2/8o1C0JZMoegbNwANG7d9A7UrzOlw3U/6O0W8pxtiByG9PEhKS2SbYtnrbtDqZjny2v8M9z9mte/jay2A9WJRmLm56BfIcraIoU8vqqppfXMSnPmSaeIP3QCJ64Z98gvitcTRYKJxIfzc2dybH7H54=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=A79It8q0; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59JMp78Z002445
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Oct 2025 07:12:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	vEm41Xz0gVis+PH4IPx/1+Fp7gBtPmDXW7O21LImwIA=; b=A79It8q0M6Ywtp6B
	jEgP/MmIictW/1oWUHJ8m/EPKg50aAhTx1g36W+g9YHGJOlSgNN/njwb9mII/Qka
	Bpi2psODUm3fs+OCvPDNPuwVDXGO8Md04sSstL6NKMrOZZ6cN47qA1RuaeTLhL4b
	phveQJpt9DUo72Q7vSwv5JbXowgnDqs4m4AZvLy5oNy4skXEM6PIkCeo7wWz6rVJ
	IjhqeiazAAmStIbqPBGAjjUH95yecLV3rViPMnAb31i9wY9BcVEBT4N9wUOpC7ZB
	h50AejNRiV9LJQ+hNGdZA8PGa9aed2xVpZjTfQ0qQQ735/pPqN0Ncc1xyeY/vru8
	mD//XA==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49v469btyt-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Oct 2025 07:12:38 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-b632471eda1so3425695a12.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 20 Oct 2025 00:12:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760944357; x=1761549157;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vEm41Xz0gVis+PH4IPx/1+Fp7gBtPmDXW7O21LImwIA=;
        b=pSy06wcnkxk3kdCxEojjyD1rOU0/kmy0k7knswBJ552VV7QyuoP92GCLePlUJTV0Iq
         glNpKPICg65wdS80L7BZp61CtW+7mdAV0oLrSTTk8JUWX6yruoK2EP92Y9l9o1JBt50G
         9g2BWIrW2qw0ii4q+q3yDpxB51dVsPA0JWD6d5LaAJK95kPgTvk4qGTJe72qWhvmgXTz
         DD67YMTytfFE1QzAYIfCzvMPUeB6JKKafvOR4TV3wnyUJ4uS3SqoRfR3LuLO71xNkf3M
         bkJ08NTP7F5jDgSSuyXf//V+rlTOqTVjriE8Zk3WI3QQkxS/PGM8Dm+l7Op35ITgelTX
         HGwg==
X-Forwarded-Encrypted: i=1; AJvYcCXuQ20V0QoVuc/HeGz13aeKKhcSZMaEEJvnFIzc3n+/v7NLrNuDHIp+Nps4Oo0PdArOXZBKusJ0ipwljTxL@vger.kernel.org
X-Gm-Message-State: AOJu0YyONLJlFxGe+DundJMrH/QaOFT6+fpF1lFY7L1Ws47BfEVZMnse
	dFvY/OmdpxZzTEw7eLOAyi6nkuEi4981HuB5jTWArvC4Xda4FOVj6iIJnGBnGyeEdNbe8Z3HEl6
	Ti+oqbyybllIbOgIKVjBpx/SlAq6+MxetfSfrp3EsGnTl4GxCxdkzeNptJWV2hqkoJZpY
X-Gm-Gg: ASbGncsmh1jqALRF+LdfJISuHXRcLECT/fK7iFJv+srcwRBGlFOT6NsjqNWuVq9mxGk
	LX7cWoiET+/Nlg9P1cLzwG5d6t0qCGTOyAX6HOXfqeE/NtBayFybzBeKfnx+LSSzXG/NGgIUByf
	2e04MODtQqZxr/dV2gPnhLVRqYEkA+yhwunK/vV0XizGQzzPHLJLlpsJACg6ao9Z1HlCcvNDEL4
	Ip16vcwh60CPW4YjcWg83XHJPmZbgJ3eQkcVXCAupbxoIoXXNG0G4eaIIypu0qGYEb7oMO2EPQB
	n9OamVylvV3sdisew1Xf13flDkmifsLIC4e422lcgpN3xp7gvMgm5XawwHTaB2Ijjc6ZbhHdAZm
	R2V/eGm/Z3MBxiOkSbEIZqk8gYgSMpS257SZvkYrqTApLjcsIcQFXXkZam2/9AV7+uco=
X-Received: by 2002:a05:6a21:998f:b0:2bc:ac1b:60ab with SMTP id adf61e73a8af0-334a8643079mr17795933637.52.1760944357156;
        Mon, 20 Oct 2025 00:12:37 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEzXERBDXpas64nTzCEGBV36k9Wkjq2WsYHHpcVuMAyde0ePpuv2nsUUhnluytZvVxCeWgeng==
X-Received: by 2002:a05:6a21:998f:b0:2bc:ac1b:60ab with SMTP id adf61e73a8af0-334a8643079mr17795897637.52.1760944356657;
        Mon, 20 Oct 2025 00:12:36 -0700 (PDT)
Received: from jinlmao-gv.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7a22ff34b8bsm7421705b3a.22.2025.10.20.00.12.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Oct 2025 00:12:36 -0700 (PDT)
From: Yingchao Deng <yingchao.deng@oss.qualcomm.com>
Date: Mon, 20 Oct 2025 15:12:00 +0800
Subject: [PATCH v5 1/2] coresight: cti: Convert trigger usage fields to
 dynamic bitmaps and arrays
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251020-extended_cti-v5-1-6f193da2d467@oss.qualcomm.com>
References: <20251020-extended_cti-v5-0-6f193da2d467@oss.qualcomm.com>
In-Reply-To: <20251020-extended_cti-v5-0-6f193da2d467@oss.qualcomm.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach <mike.leach@linaro.org>,
        James Clark <james.clark@linaro.org>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>,
        quic_yingdeng@quicinc.com, Jinlong Mao <jinlong.mao@oss.qualcomm.com>,
        Yingchao Deng <yingchao.deng@oss.qualcomm.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1760944348; l=11022;
 i=yingchao.deng@oss.qualcomm.com; s=20250721; h=from:subject:message-id;
 bh=I7qG9i4AzCKwppd/fhlD4h5td/0pETSBGvoJB8csxL4=;
 b=kYrfn+Tnqrcel/UQ/i+k5uW13SCgJBPw0RvrkzP/KKCiV8MaHlCbUPvp7SXWBycEof6dh7CSL
 YUvcXpeg3oMCIuIJZnwUIKMRkBZlYtF6QztP5qqyP9QZLSrGpDN6Itt
X-Developer-Key: i=yingchao.deng@oss.qualcomm.com; a=ed25519;
 pk=1zkrZnKgKCu3VxiiiGfzpW3KL9RNP/qun1frl0ozUIc=
X-Proofpoint-ORIG-GUID: HxUIdNDrMjCRYutvxawe03ZSydykKasv
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDE4MDAzMiBTYWx0ZWRfX/OVes4iwauKo
 xstUqQ7Id/DY2H7evrtTN4UUFyjV5r3mvjjBPwkWhLgYGIaClKnznTrSST1kHtCTCDbVhn5MWFN
 P/hQ0kuZI4IGsl9kou7mNpYyNUkeKIeYCgjItS8vLZl3ZAgnXwq1dpQqeuge6zxRRpmN4leNNV9
 M12aknJtHUJUJYCrJr4eyvptbuijf3XP1aXWqGuHhRUo0p4zAzJMRy3TiYzIfb/bKogt8lAgdSl
 8dVXKTYmf0F70bY2orbzxy2Wrzz9Fnw7A192F6Z9lj6I/nUcfwXiOWVewDfrq+bnywW4OxGv8qR
 3guQ4W5c33RZ/S2DMcZqfyP03fkxHujYEfiMnLE9UleeRc1YbhibsFkr8ADT5vjYBEP3snWaC57
 HqkLWg4pJiBKZZ8Xufjphrhy1vPcCQ==
X-Authority-Analysis: v=2.4 cv=U8qfzOru c=1 sm=1 tr=0 ts=68f5e0e6 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=qBB9sKLMsZVO1SgW7bQA:9 a=QEXdDO2ut3YA:10
 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-GUID: HxUIdNDrMjCRYutvxawe03ZSydykKasv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-20_02,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 bulkscore=0 malwarescore=0 priorityscore=1501
 spamscore=0 clxscore=1015 lowpriorityscore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510180032

Replace the fixed-size u32 fields in the cti_config and cti_trig_grp
structure with dynamically allocated bitmaps and arrays. This allows
memory to be allocated based on the actual number of triggers during probe
time, reducing memory footprint and improving scalability for platforms
with varying trigger counts.
Additionally, repack struct cti_config to reduce its size from 80 bytes to
72 bytes.

Signed-off-by: Yingchao Deng <yingchao.deng@oss.qualcomm.com>
---
 drivers/hwtracing/coresight/coresight-cti-core.c   | 58 ++++++++++++++++------
 .../hwtracing/coresight/coresight-cti-platform.c   | 16 +++---
 drivers/hwtracing/coresight/coresight-cti-sysfs.c  | 10 ++--
 drivers/hwtracing/coresight/coresight-cti.h        | 17 ++++---
 4 files changed, 65 insertions(+), 36 deletions(-)

diff --git a/drivers/hwtracing/coresight/coresight-cti-core.c b/drivers/hwtracing/coresight/coresight-cti-core.c
index 8fb30dd73fd2..8c9cec832898 100644
--- a/drivers/hwtracing/coresight/coresight-cti-core.c
+++ b/drivers/hwtracing/coresight/coresight-cti-core.c
@@ -214,8 +214,8 @@ void cti_write_intack(struct device *dev, u32 ackval)
 /* DEVID[19:16] - number of CTM channels */
 #define CTI_DEVID_CTMCHANNELS(devid_val) ((int) BMVAL(devid_val, 16, 19))
 
-static void cti_set_default_config(struct device *dev,
-				   struct cti_drvdata *drvdata)
+static int cti_set_default_config(struct device *dev,
+				  struct cti_drvdata *drvdata)
 {
 	struct cti_config *config = &drvdata->config;
 	u32 devid;
@@ -234,12 +234,33 @@ static void cti_set_default_config(struct device *dev,
 		config->nr_trig_max = CTIINOUTEN_MAX;
 	}
 
+	config->trig_in_use = devm_bitmap_zalloc(dev, config->nr_trig_max, GFP_KERNEL);
+	if (!config->trig_in_use)
+		return -ENOMEM;
+
+	config->trig_out_use = devm_bitmap_zalloc(dev, config->nr_trig_max, GFP_KERNEL);
+	if (!config->trig_out_use)
+		return -ENOMEM;
+
+	config->trig_out_filter = devm_bitmap_zalloc(dev, config->nr_trig_max, GFP_KERNEL);
+	if (!config->trig_out_filter)
+		return -ENOMEM;
+
+	config->ctiinen = devm_kcalloc(dev, config->nr_trig_max, sizeof(u32), GFP_KERNEL);
+	if (!config->ctiinen)
+		return -ENOMEM;
+
+	config->ctiouten = devm_kcalloc(dev, config->nr_trig_max, sizeof(u32), GFP_KERNEL);
+	if (!config->ctiouten)
+		return -ENOMEM;
+
 	config->nr_ctm_channels = CTI_DEVID_CTMCHANNELS(devid);
 
 	/* Most regs default to 0 as zalloc'ed except...*/
 	config->trig_filter_enable = true;
 	config->ctigate = GENMASK(config->nr_ctm_channels - 1, 0);
 	config->enable_req_count = 0;
+	return 0;
 }
 
 /*
@@ -270,8 +291,10 @@ int cti_add_connection_entry(struct device *dev, struct cti_drvdata *drvdata,
 	cti_dev->nr_trig_con++;
 
 	/* add connection usage bit info to overall info */
-	drvdata->config.trig_in_use |= tc->con_in->used_mask;
-	drvdata->config.trig_out_use |= tc->con_out->used_mask;
+	bitmap_or(drvdata->config.trig_in_use, drvdata->config.trig_in_use,
+		  tc->con_in->used_mask, drvdata->config.nr_trig_max);
+	bitmap_or(drvdata->config.trig_out_use, drvdata->config.trig_out_use,
+		  tc->con_out->used_mask, drvdata->config.nr_trig_max);
 
 	return 0;
 }
@@ -293,12 +316,20 @@ struct cti_trig_con *cti_allocate_trig_con(struct device *dev, int in_sigs,
 	if (!in)
 		return NULL;
 
+	in->used_mask = devm_bitmap_alloc(dev, in_sigs, GFP_KERNEL);
+	if (!in->used_mask)
+		return NULL;
+
 	out = devm_kzalloc(dev,
 			   offsetof(struct cti_trig_grp, sig_types[out_sigs]),
 			   GFP_KERNEL);
 	if (!out)
 		return NULL;
 
+	out->used_mask = devm_bitmap_alloc(dev, out_sigs, GFP_KERNEL);
+	if (!out->used_mask)
+		return NULL;
+
 	tc->con_in = in;
 	tc->con_out = out;
 	tc->con_in->nr_sigs = in_sigs;
@@ -314,7 +345,6 @@ int cti_add_default_connection(struct device *dev, struct cti_drvdata *drvdata)
 {
 	int ret = 0;
 	int n_trigs = drvdata->config.nr_trig_max;
-	u32 n_trig_mask = GENMASK(n_trigs - 1, 0);
 	struct cti_trig_con *tc = NULL;
 
 	/*
@@ -325,8 +355,9 @@ int cti_add_default_connection(struct device *dev, struct cti_drvdata *drvdata)
 	if (!tc)
 		return -ENOMEM;
 
-	tc->con_in->used_mask = n_trig_mask;
-	tc->con_out->used_mask = n_trig_mask;
+	bitmap_fill(tc->con_in->used_mask, n_trigs);
+	bitmap_fill(tc->con_out->used_mask, n_trigs);
+
 	ret = cti_add_connection_entry(dev, drvdata, tc, NULL, "default");
 	return ret;
 }
@@ -339,7 +370,6 @@ int cti_channel_trig_op(struct device *dev, enum cti_chan_op op,
 {
 	struct cti_drvdata *drvdata = dev_get_drvdata(dev->parent);
 	struct cti_config *config = &drvdata->config;
-	u32 trig_bitmask;
 	u32 chan_bitmask;
 	u32 reg_value;
 	int reg_offset;
@@ -349,18 +379,16 @@ int cti_channel_trig_op(struct device *dev, enum cti_chan_op op,
 	   (trigger_idx >= config->nr_trig_max))
 		return -EINVAL;
 
-	trig_bitmask = BIT(trigger_idx);
-
 	/* ensure registered triggers and not out filtered */
 	if (direction == CTI_TRIG_IN)	{
-		if (!(trig_bitmask & config->trig_in_use))
+		if (!(test_bit(trigger_idx, config->trig_in_use)))
 			return -EINVAL;
 	} else {
-		if (!(trig_bitmask & config->trig_out_use))
+		if (!(test_bit(trigger_idx, config->trig_out_use)))
 			return -EINVAL;
 
 		if ((config->trig_filter_enable) &&
-		    (config->trig_out_filter & trig_bitmask))
+		    test_bit(trigger_idx, config->trig_out_filter))
 			return -EINVAL;
 	}
 
@@ -891,7 +919,9 @@ static int cti_probe(struct amba_device *adev, const struct amba_id *id)
 	raw_spin_lock_init(&drvdata->spinlock);
 
 	/* initialise CTI driver config values */
-	cti_set_default_config(dev, drvdata);
+	ret = cti_set_default_config(dev, drvdata);
+	if (ret)
+		return ret;
 
 	pdata = coresight_cti_get_platform_data(dev);
 	if (IS_ERR(pdata)) {
diff --git a/drivers/hwtracing/coresight/coresight-cti-platform.c b/drivers/hwtracing/coresight/coresight-cti-platform.c
index d0ae10bf6128..4bef860a0484 100644
--- a/drivers/hwtracing/coresight/coresight-cti-platform.c
+++ b/drivers/hwtracing/coresight/coresight-cti-platform.c
@@ -136,8 +136,8 @@ static int cti_plat_create_v8_etm_connection(struct device *dev,
 		goto create_v8_etm_out;
 
 	/* build connection data */
-	tc->con_in->used_mask = 0xF0; /* sigs <4,5,6,7> */
-	tc->con_out->used_mask = 0xF0; /* sigs <4,5,6,7> */
+	bitmap_set(tc->con_in->used_mask, 4, 4); /* sigs <4,5,6,7> */
+	bitmap_set(tc->con_out->used_mask, 4, 4); /* sigs <4,5,6,7> */
 
 	/*
 	 * The EXTOUT type signals from the ETM are connected to a set of input
@@ -194,10 +194,10 @@ static int cti_plat_create_v8_connections(struct device *dev,
 		goto of_create_v8_out;
 
 	/* Set the v8 PE CTI connection data */
-	tc->con_in->used_mask = 0x3; /* sigs <0 1> */
+	bitmap_set(tc->con_in->used_mask, 0, 2); /* sigs <0 1> */
 	tc->con_in->sig_types[0] = PE_DBGTRIGGER;
 	tc->con_in->sig_types[1] = PE_PMUIRQ;
-	tc->con_out->used_mask = 0x7; /* sigs <0 1 2 > */
+	bitmap_set(tc->con_out->used_mask, 0, 3); /* sigs <0 1 2 > */
 	tc->con_out->sig_types[0] = PE_EDBGREQ;
 	tc->con_out->sig_types[1] = PE_DBGRESTART;
 	tc->con_out->sig_types[2] = PE_CTIIRQ;
@@ -213,7 +213,7 @@ static int cti_plat_create_v8_connections(struct device *dev,
 		goto of_create_v8_out;
 
 	/* filter pe_edbgreq - PE trigout sig <0> */
-	drvdata->config.trig_out_filter |= 0x1;
+	set_bit(0, drvdata->config.trig_out_filter);
 
 of_create_v8_out:
 	return ret;
@@ -257,7 +257,7 @@ static int cti_plat_read_trig_group(struct cti_trig_grp *tgrp,
 	if (!err) {
 		/* set the signal usage mask */
 		for (idx = 0; idx < tgrp->nr_sigs; idx++)
-			tgrp->used_mask |= BIT(values[idx]);
+			set_bit(values[idx], tgrp->used_mask);
 	}
 
 	kfree(values);
@@ -331,7 +331,9 @@ static int cti_plat_process_filter_sigs(struct cti_drvdata *drvdata,
 
 	err = cti_plat_read_trig_group(tg, fwnode, CTI_DT_FILTER_OUT_SIGS);
 	if (!err)
-		drvdata->config.trig_out_filter |= tg->used_mask;
+		bitmap_or(drvdata->config.trig_out_filter,
+			  drvdata->config.trig_out_filter,
+			  tg->used_mask, drvdata->config.nr_trig_max);
 
 	kfree(tg);
 	return err;
diff --git a/drivers/hwtracing/coresight/coresight-cti-sysfs.c b/drivers/hwtracing/coresight/coresight-cti-sysfs.c
index 572b80ee96fb..a9df77215141 100644
--- a/drivers/hwtracing/coresight/coresight-cti-sysfs.c
+++ b/drivers/hwtracing/coresight/coresight-cti-sysfs.c
@@ -711,10 +711,8 @@ static ssize_t trigout_filtered_show(struct device *dev,
 	struct cti_drvdata *drvdata = dev_get_drvdata(dev->parent);
 	struct cti_config *cfg = &drvdata->config;
 	int size = 0, nr_trig_max = cfg->nr_trig_max;
-	unsigned long mask = cfg->trig_out_filter;
 
-	if (mask)
-		size = bitmap_print_to_pagebuf(true, buf, &mask, nr_trig_max);
+	size = bitmap_print_to_pagebuf(true, buf, cfg->trig_out_filter, nr_trig_max);
 	return size;
 }
 static DEVICE_ATTR_RO(trigout_filtered);
@@ -926,9 +924,8 @@ static ssize_t trigin_sig_show(struct device *dev,
 	struct cti_trig_con *con = (struct cti_trig_con *)ext_attr->var;
 	struct cti_drvdata *drvdata = dev_get_drvdata(dev->parent);
 	struct cti_config *cfg = &drvdata->config;
-	unsigned long mask = con->con_in->used_mask;
 
-	return bitmap_print_to_pagebuf(true, buf, &mask, cfg->nr_trig_max);
+	return bitmap_print_to_pagebuf(true, buf, con->con_in->used_mask, cfg->nr_trig_max);
 }
 
 static ssize_t trigout_sig_show(struct device *dev,
@@ -940,9 +937,8 @@ static ssize_t trigout_sig_show(struct device *dev,
 	struct cti_trig_con *con = (struct cti_trig_con *)ext_attr->var;
 	struct cti_drvdata *drvdata = dev_get_drvdata(dev->parent);
 	struct cti_config *cfg = &drvdata->config;
-	unsigned long mask = con->con_out->used_mask;
 
-	return bitmap_print_to_pagebuf(true, buf, &mask, cfg->nr_trig_max);
+	return bitmap_print_to_pagebuf(true, buf, con->con_out->used_mask, cfg->nr_trig_max);
 }
 
 /* convert a sig type id to a name */
diff --git a/drivers/hwtracing/coresight/coresight-cti.h b/drivers/hwtracing/coresight/coresight-cti.h
index 8362a47c939c..0bd71407ef34 100644
--- a/drivers/hwtracing/coresight/coresight-cti.h
+++ b/drivers/hwtracing/coresight/coresight-cti.h
@@ -68,7 +68,7 @@ struct fwnode_handle;
  */
 struct cti_trig_grp {
 	int nr_sigs;
-	u32 used_mask;
+	unsigned long *used_mask;
 	int sig_types[];
 };
 
@@ -146,20 +146,21 @@ struct cti_config {
 	bool hw_enabled;
 	bool hw_powered;
 
-	/* registered triggers and filtering */
-	u32 trig_in_use;
-	u32 trig_out_use;
-	u32 trig_out_filter;
 	bool trig_filter_enable;
 	u8 xtrig_rchan_sel;
 
 	/* cti cross trig programmable regs */
-	u32 ctiappset;
 	u8 ctiinout_sel;
-	u32 ctiinen[CTIINOUTEN_MAX];
-	u32 ctiouten[CTIINOUTEN_MAX];
+	u32 ctiappset;
 	u32 ctigate;
 	u32 asicctl;
+	u32 *ctiinen;
+	u32 *ctiouten;
+
+	/* registered triggers and filtering */
+	unsigned long *trig_in_use;
+	unsigned long *trig_out_use;
+	unsigned long *trig_out_filter;
 };
 
 /**

-- 
2.43.0


