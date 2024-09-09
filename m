Return-Path: <linux-arm-msm+bounces-31270-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 422FD9715C8
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Sep 2024 12:57:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 100741C22A73
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Sep 2024 10:57:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4F8211B581A;
	Mon,  9 Sep 2024 10:57:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="Le7RifJl"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 890801B533E;
	Mon,  9 Sep 2024 10:57:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725879424; cv=none; b=ebLOiGJkeYcXVUtyE9Sy9xMuaXV0A67MjSQKeFXdtnKlS2vKbdyIu7YepxvZgdhJd8qniHwaD94Y//hPsbDbKci/K0zApq4auTswLzDkBcHT7ehujIIXgcgQUAdtBfEhvaxqQFJfY25PnrV5c4+a31twd20PLFiYksD0VEiD1A4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725879424; c=relaxed/simple;
	bh=FwGWC34J0BSS9eRkEcPVl6s6DaKQBtK3urjmjwtiixQ=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=GMvmq8J/9z7SMZ+YJRkJKch4jXfUY3iOG7iZ/QbkYGYVjE7oNcBHiKrVcPDAVTAdTWZzXgyMcBUoxWoW6m2LnpaPETXc+FpgXnt0N8oSmIvofx0h2WNxt35sD/AwK04KwL8079/Wq61j2l5HtWSjmLBAZnMhvc6WDFwijtQrjxU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=Le7RifJl; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4899JpMZ026363;
	Mon, 9 Sep 2024 10:56:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ox0BgJVMaAfBw4Bd5/ID1MmEDGKGCNbq2C5Vj0HEJa4=; b=Le7RifJlBrKI0VJf
	pc9wbWZIY++0CeTkTP7m4F5sl/GTKBFE+UEd2N5Sk7XVQPo5KOzeEF7zWNx4lGbO
	WMEv1ZofVGDauPqTUxOoxxcObtfOjOEe/Uq7JkycvAuf1kfrhKEV+BcM9b98NegV
	J8GVlk7VRKWR31m8vyFFiCLlX7SF2pEuRH2yfoYgi9CyHd29dgadBLm957f2nXcJ
	/liYWCGKGkeJDrp42BrgEGnDYGLgiB7Un4yRfVvcyBiGG/f22usu3CavJuP/K0VX
	ik0/s4gQCY4PLBs8Oizzam9vGNUJXGv2kxWLLvt0ii6mu2pxxqzMZbeoBrt4fGa+
	4Xzeow==
Received: from nasanppmta03.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 41he5dsr6y-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 09 Sep 2024 10:56:49 +0000 (GMT)
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com [10.45.79.139])
	by NASANPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 489AumZx003371
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 9 Sep 2024 10:56:48 GMT
Received: from hu-mohs-hyd.qualcomm.com (10.80.80.8) by
 nasanex01c.na.qualcomm.com (10.45.79.139) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Mon, 9 Sep 2024 03:56:40 -0700
From: Mohammad Rafi Shaik <quic_mohs@quicinc.com>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        Liam Girdwood
	<lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring
	<robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
	<conor+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Bard Liao
	<yung-chuan.liao@linux.intel.com>,
        Jaroslav Kysela <perex@perex.cz>, "Takashi
 Iwai" <tiwai@suse.com>
CC: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
        Sanyog Kale
	<sanyog.r.kale@intel.com>,
        <linux-arm-msm@vger.kernel.org>, <alsa-devel@alsa-project.org>,
        <linux-sound@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <quic_rohkumar@quicinc.com>,
        <kernel@quicinc.com>, <quic_pkumpatl@quicinc.com>,
        Mohammad Rafi Shaik <quic_mohs@quicinc.com>
Subject: [PATCH v1 2/4] soundwire: stream: Add set_master_channel_map() to set static channel mapping
Date: Mon, 9 Sep 2024 16:25:45 +0530
Message-ID: <20240909105547.2691015-3-quic_mohs@quicinc.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240909105547.2691015-1-quic_mohs@quicinc.com>
References: <20240909105547.2691015-1-quic_mohs@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01c.na.qualcomm.com (10.45.79.139)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: LepE_-l8i2T62ysaYHDJqI7Qz8TRRY31
X-Proofpoint-GUID: LepE_-l8i2T62ysaYHDJqI7Qz8TRRY31
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 clxscore=1015
 priorityscore=1501 suspectscore=0 lowpriorityscore=0 impostorscore=0
 malwarescore=0 mlxscore=0 phishscore=0 bulkscore=0 adultscore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2408220000 definitions=main-2409090086

Add set_master_channel_map() to set the static channel map between
master and slave. Patch change will resolve the channel mask mismatch
between the master and slave.

The sdw_set_channel_map_stream() will triggered by a slave with active
port number and channel mask.

Signed-off-by: Mohammad Rafi Shaik <quic_mohs@quicinc.com>
---
 drivers/soundwire/stream.c    | 16 ++++++++++++++++
 include/linux/soundwire/sdw.h |  5 +++++
 2 files changed, 21 insertions(+)

diff --git a/drivers/soundwire/stream.c b/drivers/soundwire/stream.c
index f275143d7b18..8cfea2ccb5bd 100644
--- a/drivers/soundwire/stream.c
+++ b/drivers/soundwire/stream.c
@@ -1972,6 +1972,22 @@ int sdw_stream_remove_master(struct sdw_bus *bus,
 }
 EXPORT_SYMBOL(sdw_stream_remove_master);
 
+int sdw_set_channel_map_stream(struct sdw_stream_runtime *stream,
+			       int *ch_mask, unsigned int active_port_num)
+{
+	struct sdw_master_runtime *m_rt;
+	struct sdw_bus *bus;
+
+	list_for_each_entry(m_rt, &stream->master_list, stream_node) {
+		bus = m_rt->bus;
+		if (bus->ops->set_master_channel_map)
+			bus->ops->set_master_channel_map(bus, ch_mask, active_port_num);
+	}
+
+	return 0;
+}
+EXPORT_SYMBOL(sdw_set_channel_map_stream);
+
 /**
  * sdw_stream_add_slave() - Allocate and add master/slave runtime to a stream
  *
diff --git a/include/linux/soundwire/sdw.h b/include/linux/soundwire/sdw.h
index 5e0dd47a0412..264450763bab 100644
--- a/include/linux/soundwire/sdw.h
+++ b/include/linux/soundwire/sdw.h
@@ -857,6 +857,8 @@ struct sdw_master_ops {
 			(struct sdw_bus *bus);
 	int (*set_bus_conf)(struct sdw_bus *bus,
 			struct sdw_bus_params *params);
+	int (*set_master_channel_map)(struct sdw_bus *bus, int *ch_mask,
+				      unsigned int port_num);
 	int (*pre_bank_switch)(struct sdw_bus *bus);
 	int (*post_bank_switch)(struct sdw_bus *bus);
 	u32 (*read_ping_status)(struct sdw_bus *bus);
@@ -1049,6 +1051,9 @@ int sdw_bus_exit_clk_stop(struct sdw_bus *bus);
 int sdw_compare_devid(struct sdw_slave *slave, struct sdw_slave_id id);
 void sdw_extract_slave_id(struct sdw_bus *bus, u64 addr, struct sdw_slave_id *id);
 
+int sdw_set_channel_map_stream(struct sdw_stream_runtime *stream,
+			       int *ch_mask, unsigned int active_port_num);
+
 #if IS_ENABLED(CONFIG_SOUNDWIRE)
 
 int sdw_stream_add_slave(struct sdw_slave *slave,
-- 
2.25.1


