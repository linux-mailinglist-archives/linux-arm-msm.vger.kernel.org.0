Return-Path: <linux-arm-msm+bounces-93594-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +JZjK1/6m2l5+gMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-93594-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Feb 2026 07:57:35 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 594DC17272F
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Feb 2026 07:57:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 566B93024092
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Feb 2026 06:57:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6565E34B1AB;
	Mon, 23 Feb 2026 06:56:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BDT5EaAb";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="B46YonlH"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9FA934AB06
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Feb 2026 06:56:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771829813; cv=none; b=AAmddAgSudilakJeWgk+gAcisDhJjWMW3VHw9YOXta77SpoRv5EuPP/D3lunNZGPp7gmcpfquISytlsGmNxiyfkiHJIrjzNrlHLbW3SevhvXb1Xo2eaoX8v5tqFNytzPIdvzX0iocBl/PfG+Gc+vd+Myurf6ERI/0y7xNiqLcbk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771829813; c=relaxed/simple;
	bh=+caVanCR1MkRvTlDCUseywuTVg2NMA0xm0dQkI5ZlEc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=rl1vwEVAlir52D+OIb+Tr73oChm8d61eZXJIArvxP5R/3fAe+7OfNGjx9Jfv/Ll4WW1o9oIzJFWJBLNhfA3d+y4DQXMFD6YdnGBQEavdqK976dnwS1I7E/fRTjg7nLQdaeu815xd+sZ0OX0iWCe1OiUngOwdkaHwsrVNQKeVS3k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BDT5EaAb; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=B46YonlH; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61MMlA0P1184063
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Feb 2026 06:56:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	jI9VMtFL2iZSHiAcQIxgD0sR6qS7voT+SLIQjeTVTZ4=; b=BDT5EaAbCe7Bvh0I
	WWYnjc1uSoulUZxE+onxGOqA335/aJM5z+FGOTYteviVKlvzDIapY02jZwMKxQCG
	IXpDJeDzJhH215agaF5yeaUqTpESivkfm2bsuexJ7wpEyosi/0G7WhTRf8M1RaSP
	dSlE7nNW448KtkasKNhHTuEsN8fz1noUXRDXlinZ9PfYtTtuv4hQkz49SJ7g++9+
	StBY/R67KZgglU/RxhAaraHDuldYk0gPpcLna8PpZdQ32VOBAeUayZtBwEREUW05
	KZl/zSk/0lmJTeFPKhlpMwcbp6XeRpn7T23VbMiljWXJpRgDpMzyJ6sV31Vv398/
	56becQ==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cf603kpys-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Feb 2026 06:56:50 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2aad6045810so41855615ad.3
        for <linux-arm-msm@vger.kernel.org>; Sun, 22 Feb 2026 22:56:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771829810; x=1772434610; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jI9VMtFL2iZSHiAcQIxgD0sR6qS7voT+SLIQjeTVTZ4=;
        b=B46YonlH1b2mvLs3lgJPagPQZDzmfpZyEJ41sLdvNqFWN9UAKR3XYK6eOOWjWLodcH
         d2JKuMLGHTCVOPz1quI9mcRuBz5LGBePcTzbnlxlW3sxuyWJPG30yTUbcgHipny2WPJh
         OUdfVv0i0HRqlW/28FkCsZmLAvhJUx9prABPbG6zfdrgL2Eye5Ur2sILKhOHC52x5wih
         Snw3gyf1c51PtEb5wtpBxktLgL9Ax99uLIOyoRyaNRHieYE3w8hF6blijNBP7OdycXaW
         lC5NLRdexdNJ/uqsA4VQkVhAcvdQQZS1bL627VOLqf3mYBRC6QzHmErOyKw8R86kfzbE
         KBGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771829810; x=1772434610;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=jI9VMtFL2iZSHiAcQIxgD0sR6qS7voT+SLIQjeTVTZ4=;
        b=OsEXd0kGm3nCoO/1O/4LnNhdow5l2X3vYInk0QQqHZoSwZGN4m8bVNsI6zH4C2MSXm
         cKN5n23OhHWcsWn1fsDv8zm1mfYqMpczfUpjNTpClcID+FohSMoj9BZeq3UM02YmN4iH
         cxCW0gler7ZPrzFVuDqBmRfZ1i1NYqAnoxAp0LmUyTGiyCdAc+gREf/dCj3kdPqpeBZl
         3u/W+a8M8KESpqq7AkYJt0Lgye6cuRb4rHoW4AJDMVQ0MrkUTjrxGUgJpKWxPwiYhzpP
         bl3C9lF0SOw9tGXkVSvGQyFqzey1vXbhgswwvEcq1o3ROV9M5V9qLbfSCW8zaeozf1uR
         eV2w==
X-Forwarded-Encrypted: i=1; AJvYcCXrxiDI4HRvjO9Kzvs1aA9ZxY99I0F62fe1IC2HhgtXfOpi043ztdrRxGaCNMIxbD1FJ+2Ss4RodU+QMHd4@vger.kernel.org
X-Gm-Message-State: AOJu0Yz5SM90uy98HDnw5+8g81hiHAWLuegLoBnjOmRH9+H4yuXvNiQY
	8VDdam3uk7CkUJIY+1K/Fkk7Yk9r8jzofePlqRQ2/AMLMibVkQ4KQ4VitITXZTtUYV0kW1no6EC
	qTvaF5mZkKybZJHYN8dIpezE11tuBmfhM41syTnG0V8iyuBoQuzp8INDz5I3+ZO2CCQT3
X-Gm-Gg: ATEYQzyBUvhvquhizEOTSnlwKr8+br2TEJ+wXCsqqjZOxaHegboKBCnws2OcH07BgY2
	fhcHe6YBE/rAdzPdHdkv0OO/oYoQ+oniaaUpCBid2eCZHUdxFHittK2caL5JLRIyWq3z+J2wIBd
	rpCMRnD9vjKGSNaf2ASH6J4MfxEqSocsgdaKdpmTHFiWuCByDBtUENz4iKHP/GkVgoYuEUO4Q1z
	sfq54ESSsGD2/5ZwvEfdxeFZN7duhr3fH4N4Dejqkq13EpI7NSXogij2O4Ym8Fd1xbAk7G/L6LS
	tVnNqAAS7u6zq32MZckIoxdr05Pc7+5sGpiuU47qvNjaO96acHd6I3KT2jNnjWv10IRILlyxWqI
	lmmCZjtt2/XgR1RV68fpRTnGZkLsyFmJVzYAO3HKDGmS/WTYThcXPHzQo0GI969LpS9RssE9f/m
	RqfuAEVPMQwpVF
X-Received: by 2002:a17:902:f689:b0:2aa:dbf7:7441 with SMTP id d9443c01a7336-2ad743ff248mr73353005ad.6.1771829809574;
        Sun, 22 Feb 2026 22:56:49 -0800 (PST)
X-Received: by 2002:a17:902:f689:b0:2aa:dbf7:7441 with SMTP id d9443c01a7336-2ad743ff248mr73352695ad.6.1771829809098;
        Sun, 22 Feb 2026 22:56:49 -0800 (PST)
Received: from jiegan-gv.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ad74f619f8sm62249225ad.36.2026.02.22.22.56.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Feb 2026 22:56:48 -0800 (PST)
From: Jie Gan <jie.gan@oss.qualcomm.com>
Date: Mon, 23 Feb 2026 14:55:47 +0800
Subject: [PATCH v13 7/8] coresight: tmc: integrate byte-cntr's sysfs_ops
 with tmc sysfs file_ops
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260223-enable-byte-cntr-for-ctcu-v13-7-9cb44178b250@oss.qualcomm.com>
References: <20260223-enable-byte-cntr-for-ctcu-v13-0-9cb44178b250@oss.qualcomm.com>
In-Reply-To: <20260223-enable-byte-cntr-for-ctcu-v13-0-9cb44178b250@oss.qualcomm.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>, Mike Leach <Mike.Leach@arm.com>,
        James Clark <james.clark@linaro.org>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>,
        Mao Jinlong <jinlong.mao@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, Jie Gan <jie.gan@oss.qualcomm.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1771829766; l=3465;
 i=jie.gan@oss.qualcomm.com; s=20250909; h=from:subject:message-id;
 bh=+caVanCR1MkRvTlDCUseywuTVg2NMA0xm0dQkI5ZlEc=;
 b=8vsvryV3p2tlaIsnZJ203CuZuyviTZHwaN5/VtguGF/hW91zHbcV3jaD9RDG2KEfmTEvONd3V
 5XpDOIs4WHvDzDUtP80ER6gRoG/p72gCkbi45WTlPUhyAkx3etFoqta
X-Developer-Key: i=jie.gan@oss.qualcomm.com; a=ed25519;
 pk=3LxxUZRPCNkvPDlWOvXfJNqNO4SfGdy3eghMb8puHuk=
X-Authority-Analysis: v=2.4 cv=XbWEDY55 c=1 sm=1 tr=0 ts=699bfa32 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=i2GxayCjj04of9N-vEoA:9 a=+jEqtf1s3R9VXZ0wqowq2kgwd+I=:19
 a=QEXdDO2ut3YA:10 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjIzMDA1OSBTYWx0ZWRfX6/GDwRgM3AhO
 9epDmHdeFaJiSv8Lhcnc2/mLK5OGi2mEo4zolRJz3NYiq886qROhx70GqXgenc22TrCeSgbPmve
 Fhu4Qix95vXC5/jBjqNFk9mMHfyF7e2o8Ty1Gn1RJtjRr6S9WEOuwv3bigN8whiJheo298Czhak
 7AqtLO9Mf9KdroN0D4fxuBYBkX4+nNDE3T5KiGXH8D9NfACJ8Z1PglbFrWtuS9jANibZeRkS8V/
 8AFePTzMU7HHXUHdg+0dwtQ9TmjNPVkgVvZGyNfQJy58sMPSsk5KMD3r9rhQIJyNMkzB9bhMsvJ
 rQ8Bl4TwfhcBJodXlHd+voHuCuU4bIl+tFNTuL/yWKXv1lXH8qluVLRqsoRv4N+0Y4Pey5ZbehL
 RcSNB9ImBqA87LNhQrFtra8rXSuzD3Q9U1UytjumaICxD/cHiY5O13eP1Ddw/3SUTQIl06BZGqK
 GJOeK+SwQTekBnYgQqw==
X-Proofpoint-ORIG-GUID: MwizRpkes_UdF53Kp4k6AXf39Eavu4bC
X-Proofpoint-GUID: MwizRpkes_UdF53Kp4k6AXf39Eavu4bC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-23_01,2026-02-20_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 impostorscore=0 suspectscore=0
 malwarescore=0 phishscore=0 priorityscore=1501 adultscore=0 spamscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2602130000
 definitions=main-2602230059
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[17];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-93594-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jie.gan@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 594DC17272F
X-Rspamd-Action: no action

Add code logic to invoke byte-cntr's tmc_sysfs_ops if the byte-cntr
is enabled.

Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
---
 drivers/hwtracing/coresight/coresight-tmc-core.c | 53 +++++++++++++++++++++++-
 1 file changed, 52 insertions(+), 1 deletion(-)

diff --git a/drivers/hwtracing/coresight/coresight-tmc-core.c b/drivers/hwtracing/coresight/coresight-tmc-core.c
index 32ca2ec994de..6486bdafdddc 100644
--- a/drivers/hwtracing/coresight/coresight-tmc-core.c
+++ b/drivers/hwtracing/coresight/coresight-tmc-core.c
@@ -31,6 +31,7 @@
 
 #include "coresight-priv.h"
 #include "coresight-tmc.h"
+#include "coresight-ctcu.h"
 
 DEFINE_CORESIGHT_DEVLIST(etb_devs, "tmc_etb");
 DEFINE_CORESIGHT_DEVLIST(etf_devs, "tmc_etf");
@@ -228,15 +229,47 @@ static int tmc_prepare_crashdata(struct tmc_drvdata *drvdata)
 	return 0;
 }
 
+/* Return the byte-cntr's tmc_sysfs_ops if in using */
+static const struct tmc_sysfs_ops *tmc_get_byte_cntr_sysfs_ops(struct tmc_drvdata *drvdata)
+{
+	struct ctcu_byte_cntr *byte_cntr_data;
+	struct ctcu_drvdata *ctcu_drvdata;
+	struct coresight_device *ctcu;
+	int port;
+
+	ctcu = tmc_etr_get_ctcu_device(drvdata);
+	if (!ctcu)
+		return NULL;
+
+	port = coresight_get_in_port(drvdata->csdev, ctcu);
+	if (port < 0)
+		return NULL;
+
+	ctcu_drvdata = dev_get_drvdata(ctcu->dev.parent);
+	byte_cntr_data = &ctcu_drvdata->byte_cntr_data[port];
+	if (byte_cntr_data && byte_cntr_data->thresh_val)
+		return ctcu_drvdata->byte_cntr_sysfs_ops;
+
+	return NULL;
+}
+
 static int tmc_read_prepare(struct tmc_drvdata *drvdata)
 {
+	const struct tmc_sysfs_ops *byte_cntr_sysfs_ops;
 	int ret = 0;
 
+	byte_cntr_sysfs_ops = tmc_get_byte_cntr_sysfs_ops(drvdata);
+	if (byte_cntr_sysfs_ops) {
+		ret = byte_cntr_sysfs_ops->read_prepare(drvdata);
+		goto out;
+	}
+
 	if (drvdata->sysfs_ops)
 		ret = drvdata->sysfs_ops->read_prepare(drvdata);
 	else
 		ret = -EINVAL;
 
+out:
 	if (!ret)
 		dev_dbg(&drvdata->csdev->dev, "TMC read start\n");
 
@@ -245,13 +278,21 @@ static int tmc_read_prepare(struct tmc_drvdata *drvdata)
 
 static int tmc_read_unprepare(struct tmc_drvdata *drvdata)
 {
+	const struct tmc_sysfs_ops *byte_cntr_sysfs_ops;
 	int ret = 0;
 
+	byte_cntr_sysfs_ops = tmc_get_byte_cntr_sysfs_ops(drvdata);
+	if (byte_cntr_sysfs_ops) {
+		ret = byte_cntr_sysfs_ops->read_unprepare(drvdata);
+		goto out;
+	}
+
 	if (drvdata->sysfs_ops)
 		ret = drvdata->sysfs_ops->read_unprepare(drvdata);
 	else
 		ret = -EINVAL;
 
+out:
 	if (!ret)
 		dev_dbg(&drvdata->csdev->dev, "TMC read end\n");
 
@@ -277,6 +318,12 @@ static int tmc_open(struct inode *inode, struct file *file)
 static ssize_t tmc_get_sysfs_trace(struct tmc_drvdata *drvdata, loff_t pos, size_t len,
 				   char **bufpp)
 {
+	const struct tmc_sysfs_ops *byte_cntr_sysfs_ops;
+
+	byte_cntr_sysfs_ops = tmc_get_byte_cntr_sysfs_ops(drvdata);
+	if (byte_cntr_sysfs_ops)
+		return byte_cntr_sysfs_ops->get_trace_data(drvdata, pos, len, bufpp);
+
 	return drvdata->sysfs_ops->get_trace_data(drvdata, pos, len, bufpp);
 }
 
@@ -297,7 +344,11 @@ static ssize_t tmc_read(struct file *file, char __user *data, size_t len,
 		return -EFAULT;
 	}
 
-	*ppos += actual;
+	if (drvdata->reading_node)
+		drvdata->reading_node->pos += actual;
+	else
+		*ppos += actual;
+
 	dev_dbg(&drvdata->csdev->dev, "%zu bytes copied\n", actual);
 
 	return actual;

-- 
2.34.1


