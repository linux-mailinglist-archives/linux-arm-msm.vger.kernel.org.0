Return-Path: <linux-arm-msm+bounces-90491-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2BY9EA8fd2ntcQEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-90491-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 26 Jan 2026 09:00:15 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E7F185303
	for <lists+linux-arm-msm@lfdr.de>; Mon, 26 Jan 2026 09:00:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id DCA0A302ED2A
	for <lists+linux-arm-msm@lfdr.de>; Mon, 26 Jan 2026 07:50:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CC5E53161BA;
	Mon, 26 Jan 2026 07:49:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="HM1B5MUY";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="S+Fzrmi/"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90CCD315D3A
	for <linux-arm-msm@vger.kernel.org>; Mon, 26 Jan 2026 07:49:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769413752; cv=none; b=C1AP3X2yRIclIpahBHGQGrK7VNEcQU+F6bIkc0DnRSZ6rYPMW9nkKfX8uAzKS1Ftk+iL7cKb4dauca0tmOlHQ7dhKAR+Rl06/uS853L1eGqt0Wfqt/bURo9dLA3Q0EO2vtuUygbbyhyHQmrj74jet+lVWeg/g9opRkKB1lqQhMU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769413752; c=relaxed/simple;
	bh=Zq2mruMCQX8VD0/KR6WxLvO+aI5t0vieYiFx2QbIddc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=GtN9JoR0xZmqyGPvVgI3tOWDaf9EF0NmKHIh37yb9T6pYLdGBN3V+CHed2JrhrrWVnbDvanf2QYjo4b9TQt0VeQK9ObcUUDmmq7vSHsveVgkIObRzoVRhg/XsT/mY+JgCKqQHVx3dCDoz8w2+kK4vdSwZVAIjEhzo1WPeKJ1/PY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HM1B5MUY; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=S+Fzrmi/; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60PJlDWe2026043
	for <linux-arm-msm@vger.kernel.org>; Mon, 26 Jan 2026 07:49:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	6+SnHnfj2p+IHMVC+5k2qLRm9He+t+szYkvobbU2XVA=; b=HM1B5MUY0Q950VMK
	VIZO47ru5JVvnUXecOaghnBiDR6XdnVMitYQTWCqHWjzCFGhqQ40kUyKOUd2dnxU
	ZRPviZAd3q/gJczRAeNTypbhFEJENvC3wU4xCuBr9xz/y/45LWjn8z10A7ral6QP
	ER0+8j4NEghp6gyXr5JrG6V2gsUPAHnN0aTwj6rssNAsgsmHCFKlx4jk+rmW+LHF
	e+OCOZXWRQT+IZDLuzwzm6YV/sApO4Y1U9ek3wcnNqM88MmHRzYwVebE+EdxH/ta
	o9jZP1V5XQMx3Je76N9bEmBIjc8C12XevQfMKyy4QqPPgVRaimub4yIDdf51XifO
	n9Tkag==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bvq8dktx8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 26 Jan 2026 07:49:09 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-8227fdbc51cso1679576b3a.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 25 Jan 2026 23:49:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769413749; x=1770018549; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6+SnHnfj2p+IHMVC+5k2qLRm9He+t+szYkvobbU2XVA=;
        b=S+Fzrmi/tprmtNk8cPF+473y1979dC4fZ+XNTVHlJ82v4jX6GgN70bBhwIZn0Y2OG+
         gaT5aD52kUzladf5uT3YxcKPxfK/9ff0J+Lbbfi4SL373r0MfkYkXup7pEN/2clkyWp2
         roM3riranSrwQ6fjxZjF+2mLRcAQOevy7hAsoXH3CvAUIeE+2QXS0JBDUkFbFDWFaR7H
         5O8hdBHX/FdYjSAFR8zYX/17ikFAok4JZlblKI9H0dkZwhrv4qda496OrJde12EW4FqD
         ZbMab+9eeQScQvVNu2eaxw/atON7HfwZKGol2Czg5S6wkcBMJuozznC+8mBlW0mwZC6s
         SsxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769413749; x=1770018549;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=6+SnHnfj2p+IHMVC+5k2qLRm9He+t+szYkvobbU2XVA=;
        b=IiNy4XQ0ZLd1jc3iYUu78JwfDPHTmPXeQ8i+57KTTWOJKMBXm7IzdB+ik9uHc7rzkk
         faveq8+sXCfYftRg4bLhja4qGxlWv6jbqYdsFBBGxen9OKm11NPwvnU8Mb7zhTrM5qbj
         aSolJMu4BJl0fNACDLgTTfTRrmA33OBiOxnt6aSJfSDCxA3taN9d06016DeOjM/fOkWR
         2Ir0ETscH+Lfiq/f09ozjqER0Q0rntvMZJ/e8grnvIPcsSPkyXki2WtCGGad6V3sE3iD
         Eu0O81w4aJg5zYKqJuwkT2yb8ejfZFgFiOYdoUcfNhFtuxw6skyC1oQQYfdY7gU3iz+3
         GOvQ==
X-Forwarded-Encrypted: i=1; AJvYcCVNhfRlntd/k/q5iz2Opyn817ZbL7194t6CFuUovifwUQWaZZjWYNel6fGmApxcviOxuZaWc0VfKkl5VhLj@vger.kernel.org
X-Gm-Message-State: AOJu0YytoqcUGe+1rfYhm8MNRcdKiy4EXp7rSxqHRPY+iV3hNrZEuWh6
	+oQmkwmXIN0lBNZEB9sZTN/WanP20omQ0T/X+PhZ22Ucynq64jmpWmqtk7kT/C6w8C7/SRizBee
	4RkFBs2x7gu1/22h46hFwSaC4vW4R44cHNXr9AaMU4FBP7STjBt5olJ/swXM0iUXIjU+u
X-Gm-Gg: AZuq6aJgjRsIhpbuEv+4yePIkYikiTKdG2Madyua2M7EzE09Lb9ZIvB+kZFF7vXGNLV
	PYzWedyxzIZBptlmkyB/hY/dpUyNMDQUfzI1nYqvUsoYCdzvlpjsvKGM7keads1c1gBWeA2Sabf
	Qs/sP9OFeeLNs435OatGb6xCW58sYbuONn7Nw7Y9xdd+seywsdTksapydvJzdaulQTVzbhEYykO
	qRG2KT49hCZWOWE0n1C7/JX2yqd1dVG6ARQ6GYCvu7sJpb2FadCWb6ThhmWi/VMwuUPB2yO5IXF
	/8uUio8okyadzSCYqSR6EbFL2gbbtwKSvLeyOLdCXCoLmHWXlLE17iah5or8RHqjcycVLd7TyBt
	BRB7WHAdMA050R2SpGMCzdiGT2uEPdSrtzUZroYgizUta0el46GOttCsldRe4OXL58vWC/PvvpV
	US
X-Received: by 2002:a05:6a00:140d:b0:7e8:4587:e8ca with SMTP id d2e1a72fcca58-823412d8c6bmr3477813b3a.61.1769413749258;
        Sun, 25 Jan 2026 23:49:09 -0800 (PST)
X-Received: by 2002:a05:6a00:140d:b0:7e8:4587:e8ca with SMTP id d2e1a72fcca58-823412d8c6bmr3477792b3a.61.1769413748784;
        Sun, 25 Jan 2026 23:49:08 -0800 (PST)
Received: from jiegan-gv.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8234fd9a5a7sm1223418b3a.63.2026.01.25.23.49.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Jan 2026 23:49:08 -0800 (PST)
From: Jie Gan <jie.gan@oss.qualcomm.com>
Date: Mon, 26 Jan 2026 15:47:59 +0800
Subject: [PATCH v11 7/8] coresight: tmc: integrate byte-cntr's sysfs_ops
 with tmc sysfs file_ops
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260126-enable-byte-cntr-for-ctcu-v11-7-c0af66ba15cf@oss.qualcomm.com>
References: <20260126-enable-byte-cntr-for-ctcu-v11-0-c0af66ba15cf@oss.qualcomm.com>
In-Reply-To: <20260126-enable-byte-cntr-for-ctcu-v11-0-c0af66ba15cf@oss.qualcomm.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>, Mike Leach <mike.leach@arm.org>,
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1769413706; l=3512;
 i=jie.gan@oss.qualcomm.com; s=20250909; h=from:subject:message-id;
 bh=Zq2mruMCQX8VD0/KR6WxLvO+aI5t0vieYiFx2QbIddc=;
 b=hBgYC9yibRbm3RvEmsxoddJOyjOdnOOeiOlaGWemCh4SAiGZ7YN1/RnoRQ627k51zzyRArlxy
 xpymxY6V/8lCsLL8zWgBSfDqjMbqHE912Z9W6U5eiRBxx1vlbMvqxTl
X-Developer-Key: i=jie.gan@oss.qualcomm.com; a=ed25519;
 pk=3LxxUZRPCNkvPDlWOvXfJNqNO4SfGdy3eghMb8puHuk=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTI2MDA2NiBTYWx0ZWRfX1sPTfBCExaHu
 hkdxsFsZluDwMuDS/0StCh1pE3iHi1ghjV1f55D/rn4a80kxNhEStf8Zf4oIpzq8+Rxg+bci/fF
 MElU0MPxzGWnhhBRzFGYwpHzko+eE2p4W8bawNsjTMgMmyMjWS6fMrm5HjP20URpngpw8v9a5QO
 2W+LpI+7M4VY4NrY/0lJCg34rW4vxNxsA0NBTrIVXa0TNfWIUx085YI46OGJ5TkojLMNMWZLIlk
 Ivu3R/QiPz6x+kipK36Tv7rp2wRnIE3s6R9m/+L02YaqEksdvxqzDDALOA+WsiZAw40C62aGMEn
 RzV+yn3I+XaxBKYoHxh/W6gDMJSn5rcRPSCr3EHzBHT49c+tc90BnfiNXGh8UiM5RZYuqkev7hM
 xK2uw1ylCp+47cph09zg6iHyl5+Ckiy3ZacYUXNVuBwChEK3XoK25OzlTY4i9NLEK+3LZf0USz4
 b9dxeqNwJ6OnnZRs+sw==
X-Authority-Analysis: v=2.4 cv=RIq+3oi+ c=1 sm=1 tr=0 ts=69771c75 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=i2GxayCjj04of9N-vEoA:9
 a=+jEqtf1s3R9VXZ0wqowq2kgwd+I=:19 a=QEXdDO2ut3YA:10 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-ORIG-GUID: Hrgiamg5JPf0RRonUXEpcNJ-zar7dXiO
X-Proofpoint-GUID: Hrgiamg5JPf0RRonUXEpcNJ-zar7dXiO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-26_02,2026-01-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 adultscore=0 clxscore=1015 phishscore=0
 impostorscore=0 lowpriorityscore=0 spamscore=0 suspectscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601260066
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[17];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-90491-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jie.gan@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 5E7F185303
X-Rspamd-Action: no action

Add code logic to invoke byte-cntr's tmc_sysfs_ops if the byte-cntr
is enabled.

Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
---
 drivers/hwtracing/coresight/coresight-tmc-core.c | 53 +++++++++++++++++++++++-
 1 file changed, 52 insertions(+), 1 deletion(-)

diff --git a/drivers/hwtracing/coresight/coresight-tmc-core.c b/drivers/hwtracing/coresight/coresight-tmc-core.c
index 32ca2ec994de..95c74405ce05 100644
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
+	struct coresight_device *helper;
+	int port;
+
+	helper = tmc_etr_get_helper_device(drvdata, CORESIGHT_DEV_SUBTYPE_HELPER_CTCU);
+	if (!helper)
+		return NULL;
+
+	port = coresight_get_in_port(drvdata->csdev, helper);
+	if (port < 0)
+		return NULL;
+
+	ctcu_drvdata = dev_get_drvdata(helper->dev.parent);
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


