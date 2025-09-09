Return-Path: <linux-arm-msm+bounces-72756-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id B425FB4FA94
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Sep 2025 14:20:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A936F1C26E21
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Sep 2025 12:21:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F02D532C31A;
	Tue,  9 Sep 2025 12:20:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cMBoPEsm"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 430AE255F2C
	for <linux-arm-msm@vger.kernel.org>; Tue,  9 Sep 2025 12:20:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757420425; cv=none; b=XfIb7W5GQqaV5va0CtQdHm8drmmU7/6KWY+169Igmu7NqSoYhRBTknSgwKQ4tfzjTZeF7gKC23Ji+m/IwV2rfZPdZIA1G/b0ZluzoeOHVVldwUQBkujXLm4GU5jW1EjHLxGEgLNgSgBc5N7TyobwR/06BxKIYTgqAzbA0cSdRK0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757420425; c=relaxed/simple;
	bh=ikumlZWRZ31uELt9Gx3EsqoON5ydu7Y5Jeqw2vQ5WF0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=RJZ3gqQe4yrcPhcWCvT/BP01oL73LwSjvdDvByBttwlXqKMtnsSmDeU6Fxo/vTaJTi8QESh1RaC80gdfKXLG2NICQizIjA+C6cgC8ni4rcqZH2LdcMUBsvY4ikRsuOS0thTm3au0xrrri/2/WuSke0XX1FWMbwrhHDv/vX72Fak=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cMBoPEsm; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5899LTXD032460
	for <linux-arm-msm@vger.kernel.org>; Tue, 9 Sep 2025 12:20:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=O3dcTOpjTe1
	fHGNnpmdRKX8jenRcrbq/0mDRIoxdxMI=; b=cMBoPEsmAFFrrm0sbsp0/N3EoPw
	2IvyyE3aYjSUDBhI3GlJB5IgMm/62fZv46xxXSUIC5FWQYwraH5j0HBlAXwl1oNN
	oJdw1SeWElzNxO7PQ3U4mRFhz2e6QTHiP3/qjDdEghLwiMNO6tPIfBCQTpBiRD7P
	jKQF8u2PGh/a3glyvl6E0dgAVYbI5XFSmewIEwlHwmL5b724IdHlueolVsJI1KzQ
	HvViujHBx3ehab5Dmqj653pTdRrKtT5OkrdCFwMiNEgJC81RBnyeJSOrcW6+xJnz
	BQtEOBtfx/Bihg/4GHe4un3jCiRS1K94o+vmkigX6ulSrU5XBxfl/B44n6Q==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 490e4m023c-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 09 Sep 2025 12:20:23 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-81b8e3e2a08so60971585a.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 09 Sep 2025 05:20:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757420422; x=1758025222;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=O3dcTOpjTe1fHGNnpmdRKX8jenRcrbq/0mDRIoxdxMI=;
        b=sEf14aI293Rx6SowjUaTs1oxc+MKcpfQzrIcHPqnnlsM5O+ijJyqbAzECFTcG+NjpK
         SAVUKxkM31bQM1LjE4Be+B1ppGvVcprvfRQyr19UWCDNNxMk8X6rKa0g9HPFhZx8Muj4
         tP4voJNL9eYWTFsdDvENHvw/bkLQCvzT+Mv2r49gxLX8A53dS7RkoCTi+FHnSQuxLRKY
         vdR3IJJRl40I2Y+2dcQc6/tY/t8BP/+hRDyNtrstl453t5Lit742GR02ryz/5eim8ch7
         9Q24iViIQ574EpCWKJioohHLWp6J597ex1gzyvbqSC48VioP+ImiVVhsrChnz+T3PXNE
         UcGg==
X-Forwarded-Encrypted: i=1; AJvYcCUeJ172ErlliwMe3vVm1O2rgbojuy7xIE6nzdnxJY/ZsRsdDpDAbukYeQA636e0y1331FpNGWMGQZ3mFtx5@vger.kernel.org
X-Gm-Message-State: AOJu0Yy7daDFnIo7PwZ3NN5OZQAPtVGNQCouELGTTFuz5iiAbao8yvBs
	ixtAYfm5Oxd6tf/nJtg+4azRAVPus0LsI/sMUON3ncmkBFRT+La8VGkeiBSeI9wXZIYvuMrAxtH
	/L4wiwh/sAkQKb2tfIzMNay+wHoyq7oc2PI522IoyFN7L03OJXXm1ZIHoaGTKo/M+uSYS
X-Gm-Gg: ASbGncut213Je9ybOT4cUYUvLpRGox72G3KXPler7+v5mOeN36uiLC55GsmOonf2I25
	Hu+ahg6LY0Bx6JuYBYp9PazvUh7PWqXVuAVP+aVzgOpP8mRqJsYWRMkYEo0pAVx41gu0h/QLPg6
	I7/pneltDv1rJk7DrkdJNgtrCrRUGcyvB+zceJz+t1yx+4B2newluU/t5e8fSu0N9Dna0gHDht/
	n/9UDstQU+PwF0aHVnUyXrp5ZQ/pFN2EwSa0YtPJ8wIvpppbd6FUZ1cYHSDcivwuSCFdWHBIVOE
	fRbDvArCJRgHVnXIUhIO1WgkRFGk6+Qvp14HmhCH/tMCr+Ft0IUoiQ==
X-Received: by 2002:ad4:5f4e:0:b0:70d:fcaf:e76d with SMTP id 6a1803df08f44-73940035b50mr145175656d6.31.1757420421784;
        Tue, 09 Sep 2025 05:20:21 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGr8d1koaoi/dwZkFJYZO1phqDXAgj+fx4Vh5IgV9S1JEkZsTrG8xXVKjuxZnSjq6DxTm+Z9g==
X-Received: by 2002:ad4:5f4e:0:b0:70d:fcaf:e76d with SMTP id 6a1803df08f44-73940035b50mr145175126d6.31.1757420421222;
        Tue, 09 Sep 2025 05:20:21 -0700 (PDT)
Received: from debian ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3e75224db20sm2414629f8f.60.2025.09.09.05.20.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Sep 2025 05:20:20 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: broonie@kernel.org
Cc: lgirdwood@gmail.com, tiwai@suse.com, vkoul@kernel.org, srini@kernel.org,
        yung-chuan.liao@linux.intel.com, pierre-louis.bossart@linux.dev,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        dmitry.baryshkov@oss.qualcomm.com, linux-sound@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [PATCH v5 04/13] soundwire: bus: add sdw_slave_get_current_bank helper
Date: Tue,  9 Sep 2025 13:19:45 +0100
Message-ID: <20250909121954.225833-5-srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250909121954.225833-1-srinivas.kandagatla@oss.qualcomm.com>
References: <20250909121954.225833-1-srinivas.kandagatla@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA2MDAzOCBTYWx0ZWRfX7bupq0wl10aw
 lwKUKi2SHm/6F96nnQNMIAQ2A4iTDXIjCqib+UpJg+1QcAWEixdXT5HaqDDvp9955OXE0bPQ9m0
 Y2IgVGeg+Kwcj/+cJcwKMnEWLUcWQRJfbIqR6UCY1IzTga1ljh9iQEPfNTBy90RqkzpihgamDPe
 Tq01puaLt2Toy13c0YJDn3E8KusRTKwmaNaI1PkRUDP/9FrJaX6+ysDf6m0cV1MCJ45uoMji0P4
 TBFxX1G+Pdh/ur2I6CVXHfiphFR1U1DOZZY8860Q0sWJO8PhM48L4dHX5tU3HsXtiZCPd5C4oW6
 hG8JPqwltqHFT+SH2yNX3IyHQEvIHt4UZI5I8RYivty59KT96JSBNpbqtG3+WfEdq8lxY1nazUP
 1v5JGBwf
X-Authority-Analysis: v=2.4 cv=J66q7BnS c=1 sm=1 tr=0 ts=68c01b87 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=G7Fn18kybrAXfbFeA2QA:9
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-GUID: IVB86J_JOL_sEb2EBCRjnbopYFy5X_AC
X-Proofpoint-ORIG-GUID: IVB86J_JOL_sEb2EBCRjnbopYFy5X_AC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-09_01,2025-09-08_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 clxscore=1015 spamscore=0 phishscore=0
 adultscore=0 priorityscore=1501 suspectscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509060038

There has been 2 instances of this helper in codec drivers,
it does not make sense to keep duplicating this part of code.

Lets add a helper sdw_get_current_bank() for codec drivers to use it.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Acked-by: Vinod Koul <vkoul@kernel.org>
---
 drivers/soundwire/bus.c       | 12 ++++++++++++
 include/linux/soundwire/sdw.h |  8 ++++++++
 2 files changed, 20 insertions(+)

diff --git a/drivers/soundwire/bus.c b/drivers/soundwire/bus.c
index 4fd5cac799c5..55c1db816534 100644
--- a/drivers/soundwire/bus.c
+++ b/drivers/soundwire/bus.c
@@ -1360,6 +1360,18 @@ int sdw_slave_get_scale_index(struct sdw_slave *slave, u8 *base)
 }
 EXPORT_SYMBOL(sdw_slave_get_scale_index);
 
+int sdw_slave_get_current_bank(struct sdw_slave *slave)
+{
+	int tmp;
+
+	tmp = sdw_read(slave, SDW_SCP_CTRL);
+	if (tmp < 0)
+		return tmp;
+
+	return FIELD_GET(SDW_SCP_STAT_CURR_BANK, tmp);
+}
+EXPORT_SYMBOL_GPL(sdw_slave_get_current_bank);
+
 static int sdw_slave_set_frequency(struct sdw_slave *slave)
 {
 	int scale_index;
diff --git a/include/linux/soundwire/sdw.h b/include/linux/soundwire/sdw.h
index 096213956d31..e6a3476bcef1 100644
--- a/include/linux/soundwire/sdw.h
+++ b/include/linux/soundwire/sdw.h
@@ -1089,6 +1089,8 @@ int sdw_stream_remove_slave(struct sdw_slave *slave,
 
 struct device *of_sdw_find_device_by_node(struct device_node *np);
 
+int sdw_slave_get_current_bank(struct sdw_slave *sdev);
+
 int sdw_slave_get_scale_index(struct sdw_slave *slave, u8 *base);
 
 /* messaging and data APIs */
@@ -1128,6 +1130,12 @@ static inline struct device *of_sdw_find_device_by_node(struct device_node *np)
 	return NULL;
 }
 
+static inline int sdw_slave_get_current_bank(struct sdw_slave *sdev)
+{
+	WARN_ONCE(1, "SoundWire API is disabled");
+	return -EINVAL;
+}
+
 /* messaging and data APIs */
 static inline int sdw_read(struct sdw_slave *slave, u32 addr)
 {
-- 
2.50.0


