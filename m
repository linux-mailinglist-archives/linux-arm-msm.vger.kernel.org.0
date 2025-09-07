Return-Path: <linux-arm-msm+bounces-72423-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 26113B47ADA
	for <lists+linux-arm-msm@lfdr.de>; Sun,  7 Sep 2025 13:22:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id AF47D7ADBC6
	for <lists+linux-arm-msm@lfdr.de>; Sun,  7 Sep 2025 11:20:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 98504260569;
	Sun,  7 Sep 2025 11:22:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WEkNXS1J"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F2512620F5
	for <linux-arm-msm@vger.kernel.org>; Sun,  7 Sep 2025 11:22:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757244134; cv=none; b=R1CEfv8ejTP5fhYkFmbWIxc4tbCXmREVmuaak8v3bGiH91DaDLSSK8cTDtd6Y5yFDoGsrQcwzRZZt5tqO3kO5xiu/cN27k/AJwlFdvvYezL5etPmTFArpTc7+PJjag8LeaNEcWeaojns3MkSEM0CSE82LXB1EBwE/4lKssOwiUw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757244134; c=relaxed/simple;
	bh=ikumlZWRZ31uELt9Gx3EsqoON5ydu7Y5Jeqw2vQ5WF0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=JVss8oBeg7lDw9KQA/nGic3Kw3vbaX+Nu2D+qyQVTG4wuZI0/QHQZ6X0xZxktTuxtncD9OmOg2CddaPYTE18tqqbCSeTF5n+yh5YV/O4/fPgHwxbVP2xbU99bbkzMbY5EqcRepgvZsFPk6G/1wtwCfwbnyt0ydnp6nf6HkkwchU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WEkNXS1J; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5879TY3Q023715
	for <linux-arm-msm@vger.kernel.org>; Sun, 7 Sep 2025 11:22:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=O3dcTOpjTe1
	fHGNnpmdRKX8jenRcrbq/0mDRIoxdxMI=; b=WEkNXS1JyGowpcnX5o1Kz24uUbx
	ocTioMUqEMtjPrHMnR3d1EB+in+GKniTcndTOw5vZhzjn4kE/6dNJn2uSoRfGnyX
	tTdVaGc/nFyxSs6eapnXypsRRuEsb+pxTrATTGE5NwhZvb4UmoB4YU7pFSoVPGA2
	OvN+VBrAfR2ojOzKyDoIQGHQoWlVQ03MkIjrQwWpO/ZoP2vZloEO8WglNijWCJnh
	6G+exLHXPDohvabF2mjnuMZgh64UP2fPoSGfT44YOIR8SF55eAWwcSkpnmgsAfbX
	agyMUcnBNZRp4gBfQvqGjkWZmrUGWqzFPwcTuqaUtSuAuEa4WGlZ2X9KvkA==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 490d1va0vp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 07 Sep 2025 11:22:10 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-72023d1be83so119744126d6.3
        for <linux-arm-msm@vger.kernel.org>; Sun, 07 Sep 2025 04:22:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757244130; x=1757848930;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=O3dcTOpjTe1fHGNnpmdRKX8jenRcrbq/0mDRIoxdxMI=;
        b=Pes8MVDkbcJ4uubz+6xXMtYgY5NUjBBP3VFUZt1J3yZ79oxk9MEv6Ji4p//y/aE1IH
         3soYOYSn/kgv95dQ0NO96qw69BLdGIjCvW+0VYePqVtTrhB5mwTKh4Iji9Y338GOYj/z
         IEhLlGmsCor+hqUGFB38UIpgE23hfBKEoM34kd5dv7B0SfNJfvL7Hr6sZfiImwacv8bo
         L90OxSQret2bR1/DfYEbL6hy5ggS0zFmx0UhuMELJTg18riBV6jAzx9k267r4cilH8mt
         Z5rWJrC4emKit2cKeMdbQQpSuDkly1NEh1tX8w9ShHYBrxSJtJv+pZTpPN7FO+SHpVnY
         IwUg==
X-Forwarded-Encrypted: i=1; AJvYcCU317w6HWf8CKvpZoBpLU5twV6LW0pACrmpsdcwvbPZTSIf9RqQpXSfflC42Kw+TJSd5ePlizgEc13qNV4L@vger.kernel.org
X-Gm-Message-State: AOJu0YwhIZ4rxklJFMy7qQ7fR7Q6hLKexATTMyg1N5pRnlv+S4t3fnqW
	0DOHC/TqeRf3ETa0kb9OzH8dnFJJGKbfTs3gNN8qwPmeaZlhMkbFE7Gcuo6veEgpf++vN9HuCrp
	WWNFzDZcgCmy2/j9k9pMrFykxO6NpCkdo5E+hLRv7muoL6OzSC1MQ4Q+iQTV36wSfQ33p
X-Gm-Gg: ASbGncumDHN32eufw9eJ7eS+ARzwxM37U5+Lvwwv+w1t1Z5mQg4ZVv1XiOCHAxPZCNr
	9YGZTLpNEwJ/lRPCSTAfQL7BRO6d2XRosSucJVaHlNkTSoC7HCEklIP2jTaT/KjtIds03Y517ww
	y4g0BURWhBo1Pri9mceYzPxS1VEUzBBh+QHtsJfYCI6wsLJBtwVUjhkZyD5MnRaqk9LIYjd3Jn3
	bbUoBeOyAkbIlMPJqorIhEHzmfqIl2KT44Yzzp/7VV4CGYZJ1o/AQ2CgC/ZC2tqCBIeBtWDbpdf
	gowvotWcC+Q6+ExDX4kni/hv6wjxtTlYn1PNeYrKKiWBZ6pydIgKXg==
X-Received: by 2002:ad4:5f0f:0:b0:729:aa08:11f5 with SMTP id 6a1803df08f44-7394587e3b9mr46640536d6.64.1757244129797;
        Sun, 07 Sep 2025 04:22:09 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEDHwt5qnEpcgP82XhCscnP8nH4tNjR1T6aV/vYNlsL56jTGuuf4j007iTxpaxfSjb82GbGwA==
X-Received: by 2002:ad4:5f0f:0:b0:729:aa08:11f5 with SMTP id 6a1803df08f44-7394587e3b9mr46640416d6.64.1757244129416;
        Sun, 07 Sep 2025 04:22:09 -0700 (PDT)
Received: from debian ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3cf34494776sm37523289f8f.61.2025.09.07.04.22.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Sep 2025 04:22:09 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: broonie@kernel.org
Cc: lgirdwood@gmail.com, tiwai@suse.com, vkoul@kernel.org,
        yung-chuan.liao@linux.intel.com, pierre-louis.bossart@linux.dev,
        srini@kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-sound@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [PATCH v4 04/13] soundwire: bus: add sdw_slave_get_current_bank helper
Date: Sun,  7 Sep 2025 12:21:51 +0100
Message-ID: <20250907112201.259405-5-srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250907112201.259405-1-srinivas.kandagatla@oss.qualcomm.com>
References: <20250907112201.259405-1-srinivas.kandagatla@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: ejMkquCxiiQ7-QhFAFu1cfrjITx9-Dux
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA2MDAyNyBTYWx0ZWRfX7FKuws+OJKHq
 WztYnqqledcaBUwA5C1oNofNzdFJtEfdL1ydxWcLD9wJIp5//Xks0cpJaQYYpbQQzr6FG4MfqXT
 rj+CXK3YEvuv5wqLxfEhPrgT7EdTNrG1lS/czCN3A9UOnyfFEczD9ymiuFdbDCvxqMt39Myxfrn
 zi/nbW5+8U95rU7WJ3N7I3PRFONOgKJ79oEdqRPtn3Zmh169PuQZG0kAtr8LRebjOex+cam2mCK
 RPEexN83xmpmWthvIOxsO/JHfV6bQwPonGmX0sq8+CCZl6LMiQRf5o1OFhyyaL777oUjbH2/QjX
 NZmHTkrKQZJmDe5HFEhuFSVo80CyJOIjl1RYUBQ4aFVJDv1P4mHzXJ4w1F5hIUy25ac6Ucuhh8n
 UYDEzgjt
X-Authority-Analysis: v=2.4 cv=cYXSrmDM c=1 sm=1 tr=0 ts=68bd6ae2 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=G7Fn18kybrAXfbFeA2QA:9
 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-GUID: ejMkquCxiiQ7-QhFAFu1cfrjITx9-Dux
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-07_04,2025-09-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 impostorscore=0 clxscore=1015 malwarescore=0
 phishscore=0 spamscore=0 suspectscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509060027

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


