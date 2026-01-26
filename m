Return-Path: <linux-arm-msm+bounces-90486-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2CoaOJQed2ntcQEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-90486-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 26 Jan 2026 08:58:12 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 556AD8529B
	for <lists+linux-arm-msm@lfdr.de>; Mon, 26 Jan 2026 08:58:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 964573008610
	for <lists+linux-arm-msm@lfdr.de>; Mon, 26 Jan 2026 07:49:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4C8AD31354F;
	Mon, 26 Jan 2026 07:48:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bhd012yn";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hFOi9W05"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FFDF3128CD
	for <linux-arm-msm@vger.kernel.org>; Mon, 26 Jan 2026 07:48:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769413727; cv=none; b=pjmKQFoeEp9FVElXE+49HZnxGVvSWHgULEibWUU8oZcENAppJWO+fPMNFOUnHTqqUR9rnCQrsE7BxBj16oY3h9ZS6Eq/AFpNTlUOelL4tMqUyskIvRD1hiYMS5dLj4Dcs0g3974QQzC8gg0EDzsBkaLHU1qdLiL3DHnQoLQUOpA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769413727; c=relaxed/simple;
	bh=iOBlKE7wcNNqdQg697EHs/307n7EmzHjJxd5G5rMLIU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=TlIG0S8uvOa2z+qsNYSAoxdvhYXYERA4QMRa6q0y82YS9MejTXuN/JizIFW2x0XRJqyym3b8hEE0amPM4KOtAQ4K56JrFLcuPxoTYYiLEHtts9Fw7K6bD2wsuN0PP/clYqDwsQNysGULG1yd+wen2r8SwZdp5iBH91Ql4IT+IMM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bhd012yn; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hFOi9W05; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60Q40x8e1361798
	for <linux-arm-msm@vger.kernel.org>; Mon, 26 Jan 2026 07:48:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4Jay9EfBX3UpMTwsvQnGvQgNS5FLBeKOwQWuoZ1I2KI=; b=bhd012ynFFUsIiZ7
	hUldVPgyTc9JXLZcVbVAJjrszmwTXRySM/0XxmeDq1hxIEpcQb8zuWjCXul9Gxkp
	8k6m1m1H796IzkBN0VVgCiclhxz5gV4p5fTci9bBDg18haTMJGruyByGC08aSJDj
	YOxB4pxwMn/+9E6/hH3y+RNbJJnaPV7bNcB/fMkHMlQqpg4l9bxJAQTPzl/IIEPJ
	1BoMpUfgL6nzY57mCYL51xK+4FRoY3wsg8uAAaOPW8ZY2pHpU8JaxKBRAFjCi+4h
	tVmTNsGl86F8TQWmKhDSsGlut9Pc0ROCmgZuh5ItiSYS8KjUOl3tvDfpTNRokTKo
	BacvJg==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bx0v30edq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 26 Jan 2026 07:48:44 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-c337375d953so2552066a12.3
        for <linux-arm-msm@vger.kernel.org>; Sun, 25 Jan 2026 23:48:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769413724; x=1770018524; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4Jay9EfBX3UpMTwsvQnGvQgNS5FLBeKOwQWuoZ1I2KI=;
        b=hFOi9W05m1B21wJzUN0raufFmyd5vBxUl+oem8BmDGn2WDGlCxMNECp0SNi7rHCYpX
         P6VcfX6F2zf9l+iB/LkqbOBoUIKmPVchlT1HdL0+wXECyRfv/KxQzJuQbQPQjgRhmRZP
         c2HYCzyjF4FqtL63lMXqtWGtplUyqNtnkUaYLTgsVQ3UPNLQ+fd6Dmchmvf0vyDY6oA0
         9u+4jpFB7F2TZpL+60YmifKkhbChAqiuKK5vxwjzCGIm1lxFBeUuJyqa+eeypPsMHyXe
         PThLpGIRqPhqCDuvQOCsvvdvmL61QyO+WquLgANhB7Yq3w+LXycQch2bSaQksVbYG+sN
         VPLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769413724; x=1770018524;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=4Jay9EfBX3UpMTwsvQnGvQgNS5FLBeKOwQWuoZ1I2KI=;
        b=l8L2qahjpOgEXJHdwcZDXd0Y9xJIKzwVMPvS/+67eXlA7RkrHN7YQd7bxnSDaRwgND
         mRowDjh0kiTnygdhMIEFAYKi5ghzGt7y05KrT/Y4sdWuKUqaFvNEaB46rnlpITa+ZAuQ
         Q379Nh4LmY0VBcTxL4tVBvnFBo53725d+kSENcnZcO8HL9yV26la74J8Sbcc5qscn2yG
         vIpghPc1wx37AF0toUe/fgnAYNxcONdxASX457QfeJyYeUCULzxK3YwCzy03l30GijSv
         vQiCLEnQT3weauetxDjJZwBihuiB0Z7wp34wxhXnppf4Ue7c6Lml+X3nMnoXx8L4hxsS
         UPXw==
X-Forwarded-Encrypted: i=1; AJvYcCVTATDsMgGzoFU7jm1P4PnDzmSV1OY7qudbP9bAF2A1MBeskL6/Y4Zr1P72OS3YA33zsLgSd9fVGR6IsVfd@vger.kernel.org
X-Gm-Message-State: AOJu0YynuMQzy8LG6oOBZF11Afu2kiguOqe6Zu6y7622jLB9wB55dv3W
	/83RQhHF4oyhhocuzvAerH5Zgl05DBuuzU96lGBe/UxtZYoJ7fTTY/YYS43aq5bkRyQjgwnvE6X
	HFsd0j8eGyT2uxXQJ0HC22D9mSlEXnAezjZ5VauXlfsYHa1Ac8fE+mscV7107QIv+G04d
X-Gm-Gg: AZuq6aIK3txJt0RKLUl/oby4ec1Hnx0lOWXXXi/O+SAjQwcRJ7zva4Frh2KQtYmMwhX
	3KYo9BIjEmRJphMyKtvfyuNUULJyoakp4MJ/XG1MOSbr5K2vI3QxS7z3mqd9yGiUNe7FbHKMH1B
	j5pSHViVWjagOfKYSjFe2cyYkJRocEIP4NfVEV5TnNQYtjAbNAFm80UYv6Hr0jqL15syCxdok70
	xBj/SyxqdPdX0jWRBc0VewfVeA/wDo81nn1XivCC1za72iX/vKr7Kbg4PFRTwM0EiqlQNm1g7Rt
	cxovVnxtZs1/hzJi9yx2HadqbnaLz6gLMJLi9xs6jvD46nfteafwd2HeeR169/zFS4WcIKF+HFk
	B7fOP8igL3xJJQq/TZkHXqE+3FS8G1KwOyVvSSrIqbPJc0aCtDRR6ww1vyPoddfNpxHdnKtQyMd
	MN
X-Received: by 2002:a05:6a00:3e02:b0:81f:4999:ae46 with SMTP id d2e1a72fcca58-823412be9afmr3126523b3a.48.1769413724010;
        Sun, 25 Jan 2026 23:48:44 -0800 (PST)
X-Received: by 2002:a05:6a00:3e02:b0:81f:4999:ae46 with SMTP id d2e1a72fcca58-823412be9afmr3126506b3a.48.1769413723357;
        Sun, 25 Jan 2026 23:48:43 -0800 (PST)
Received: from jiegan-gv.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8234fd9a5a7sm1223418b3a.63.2026.01.25.23.48.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Jan 2026 23:48:42 -0800 (PST)
From: Jie Gan <jie.gan@oss.qualcomm.com>
Date: Mon, 26 Jan 2026 15:47:54 +0800
Subject: [PATCH v11 2/8] coresight: tmc: add create/clean functions for
 etr_buf_list
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260126-enable-byte-cntr-for-ctcu-v11-2-c0af66ba15cf@oss.qualcomm.com>
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
        devicetree@vger.kernel.org, Jie Gan <jie.gan@oss.qualcomm.com>,
        Mike Leach <mike.leach@linaro.org>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1769413705; l=6192;
 i=jie.gan@oss.qualcomm.com; s=20250909; h=from:subject:message-id;
 bh=iOBlKE7wcNNqdQg697EHs/307n7EmzHjJxd5G5rMLIU=;
 b=ru4rBEls9TKgFexG6YSC8o9GwR+E4SQnSYPxvf6VcG/iS6eyoEXXLZhgwyRXMkXb125QZPGn9
 aHQY+jERHp8BxfLZ/nFr4OGARDp8ZygOuKu0thZkz2N8lCOlOxxrhqy
X-Developer-Key: i=jie.gan@oss.qualcomm.com; a=ed25519;
 pk=3LxxUZRPCNkvPDlWOvXfJNqNO4SfGdy3eghMb8puHuk=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTI2MDA2NiBTYWx0ZWRfX+qZGbLFpEayu
 0hfBjHI/KY+PXRzrbAybABH89s+BLvi7+aZaL2a1Sc24U24l5RUSsnnpODIInCJ5Sy1ABeYAG53
 DvlmItXELAyEfzac+ezKcTcHqD0fYYIHWwo6YzivQ5PXZaKMYkt7erotAfov3eu2JxnamwJGoeZ
 G5950+ip6OSWVfoDzllOR3luujKXOps1QG2WduMJY1y+3RAmTdLiefrSnMfhuscLkLs7DgBmRxa
 KoH+RRJty9MTDnxuY5CtTjb8lu/JgQOdggtnIuuU3FDfGH38hav4xnLs5EY3O2D5N1o+qDlsNkn
 khDHADcP9P/j8UXQGSB27ArfX6aZq+GNXzLCsp02nzKsdl5eiWAUPkhQ/nob+OLbhAIQ8Jl3BRX
 sENTC/52TTJrCWRkumhd8efA0idw+Zzh6QI2dPcZKIfDBM8qE72BOQnUJY1hFZPlcKxyFByqrku
 WH/9uXy4MAU7tv7v2mg==
X-Proofpoint-GUID: Q-7jRjOXUuYhpdcqPZznJFE-fVjM6uKd
X-Proofpoint-ORIG-GUID: Q-7jRjOXUuYhpdcqPZznJFE-fVjM6uKd
X-Authority-Analysis: v=2.4 cv=JYyxbEKV c=1 sm=1 tr=0 ts=69771c5c cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8
 a=AScg1gZdVb1XvqdcXssA:9 a=QEXdDO2ut3YA:10 a=3WC7DwWrALyhR5TkjVHa:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-26_02,2026-01-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 adultscore=0 bulkscore=0 clxscore=1015
 impostorscore=0 phishscore=0 suspectscore=0 malwarescore=0 priorityscore=1501
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
	RCPT_COUNT_TWELVE(0.00)[18];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-90486-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,linaro.org:email,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim];
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
X-Rspamd-Queue-Id: 556AD8529B
X-Rspamd-Action: no action

Introduce functions for creating and inserting or removing the
etr_buf_node to/from the etr_buf_list.

The byte-cntr functionality requires two etr_buf to receive trace data.
The active etr_buf collects the trace data from source device, while the
byte-cntr reading function accesses the deactivated etr_buf after is
has been filled and synced, transferring data to the userspace.

Reviewed-by: Mike Leach <mike.leach@linaro.org>
Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
---
 drivers/hwtracing/coresight/coresight-tmc-core.c |  1 +
 drivers/hwtracing/coresight/coresight-tmc-etr.c  | 94 ++++++++++++++++++++++++
 drivers/hwtracing/coresight/coresight-tmc.h      | 19 +++++
 3 files changed, 114 insertions(+)

diff --git a/drivers/hwtracing/coresight/coresight-tmc-core.c b/drivers/hwtracing/coresight/coresight-tmc-core.c
index 36599c431be6..1ea255ffa67c 100644
--- a/drivers/hwtracing/coresight/coresight-tmc-core.c
+++ b/drivers/hwtracing/coresight/coresight-tmc-core.c
@@ -840,6 +840,7 @@ static int __tmc_probe(struct device *dev, struct resource *res)
 		idr_init(&drvdata->idr);
 		mutex_init(&drvdata->idr_mutex);
 		dev_list = &etr_devs;
+		INIT_LIST_HEAD(&drvdata->etr_buf_list);
 		break;
 	case TMC_CONFIG_TYPE_ETF:
 		desc.groups = coresight_etf_groups;
diff --git a/drivers/hwtracing/coresight/coresight-tmc-etr.c b/drivers/hwtracing/coresight/coresight-tmc-etr.c
index e0d83ee01b77..cbbb15648fb7 100644
--- a/drivers/hwtracing/coresight/coresight-tmc-etr.c
+++ b/drivers/hwtracing/coresight/coresight-tmc-etr.c
@@ -1919,6 +1919,100 @@ const struct coresight_ops tmc_etr_cs_ops = {
 	.panic_ops	= &tmc_etr_sync_ops,
 };
 
+/**
+ * tmc_clean_etr_buf_list - clean the etr_buf_list.
+ * @drvdata:	driver data of the TMC device.
+ *
+ * Remove the allocated node from the list and free the extra buffer.
+ */
+void tmc_clean_etr_buf_list(struct tmc_drvdata *drvdata)
+{
+	struct etr_buf_node *nd, *next;
+
+	list_for_each_entry_safe(nd, next, &drvdata->etr_buf_list, node) {
+		if (nd->sysfs_buf == drvdata->sysfs_buf) {
+			if (coresight_get_mode(drvdata->csdev) == CS_MODE_DISABLED) {
+				drvdata->sysfs_buf = NULL;
+				tmc_free_etr_buf(nd->sysfs_buf);
+				nd->sysfs_buf = NULL;
+			}
+			list_del(&nd->node);
+			kfree(nd);
+		} else {
+			/* Free allocated buffers which are not utilized by ETR */
+			list_del(&nd->node);
+			tmc_free_etr_buf(nd->sysfs_buf);
+			nd->sysfs_buf = NULL;
+			kfree(nd);
+		}
+	}
+}
+EXPORT_SYMBOL_GPL(tmc_clean_etr_buf_list);
+
+/**
+ * tmc_create_etr_buf_list - create a list to manage the etr_buf_node.
+ * @drvdata:	driver data of the TMC device.
+ * @num_nodes:	number of nodes want to create with the list.
+ *
+ * Return 0 upon success and return the error number if fail.
+ */
+int tmc_create_etr_buf_list(struct tmc_drvdata *drvdata, int num_nodes)
+{
+	struct etr_buf_node *new_node;
+	struct etr_buf *sysfs_buf;
+	int i = 0, ret = 0;
+
+	/* We dont need a list if there is only one node */
+	if (num_nodes < 2)
+		return -EINVAL;
+
+	/* We expect that sysfs_buf in drvdata has already been allocated. */
+	if (drvdata->sysfs_buf) {
+		/* Directly insert the allocated sysfs_buf into the list first */
+		new_node = kzalloc(sizeof(struct etr_buf_node), GFP_KERNEL);
+		if (IS_ERR(new_node))
+			return PTR_ERR(new_node);
+
+		new_node->sysfs_buf = drvdata->sysfs_buf;
+		new_node->is_free = false;
+		list_add(&new_node->node, &drvdata->etr_buf_list);
+		i++;
+	}
+
+	while (i < num_nodes) {
+		new_node = kzalloc(sizeof(struct etr_buf_node), GFP_KERNEL);
+		if (IS_ERR(new_node)) {
+			ret = PTR_ERR(new_node);
+			break;
+		}
+
+		sysfs_buf = tmc_alloc_etr_buf(drvdata, drvdata->size, 0, cpu_to_node(0), NULL);
+		if (IS_ERR(sysfs_buf)) {
+			kfree(new_node);
+			ret = PTR_ERR(sysfs_buf);
+			break;
+		}
+
+		/* We dont have a available sysfs_buf in drvdata, setup one */
+		if (!drvdata->sysfs_buf) {
+			drvdata->sysfs_buf = sysfs_buf;
+			new_node->is_free = false;
+		} else
+			new_node->is_free = true;
+
+		new_node->sysfs_buf = sysfs_buf;
+		list_add(&new_node->node, &drvdata->etr_buf_list);
+		i++;
+	}
+
+	/* Clean the list if there is an error */
+	if (ret)
+		tmc_clean_etr_buf_list(drvdata);
+
+	return ret;
+}
+EXPORT_SYMBOL_GPL(tmc_create_etr_buf_list);
+
 int tmc_read_prepare_etr(struct tmc_drvdata *drvdata)
 {
 	int ret = 0;
diff --git a/drivers/hwtracing/coresight/coresight-tmc.h b/drivers/hwtracing/coresight/coresight-tmc.h
index 95473d131032..9b3c4e6f0a5e 100644
--- a/drivers/hwtracing/coresight/coresight-tmc.h
+++ b/drivers/hwtracing/coresight/coresight-tmc.h
@@ -208,6 +208,19 @@ struct tmc_resrv_buf {
 	s64		len;
 };
 
+/**
+ * @sysfs_buf:	Allocated sysfs_buf.
+ * @is_free:	Indicates whether the buffer is free to choose.
+ * @pos:	Position of the buffer.
+ * @node:	Node in etr_buf_list.
+ */
+struct etr_buf_node {
+	struct etr_buf		*sysfs_buf;
+	bool			is_free;
+	loff_t			pos;
+	struct list_head	node;
+};
+
 /**
  * struct tmc_drvdata - specifics associated to an TMC component
  * @atclk:	optional clock for the core parts of the TMC.
@@ -243,6 +256,8 @@ struct tmc_resrv_buf {
  *		(after crash) by default.
  * @crash_mdata: Reserved memory for storing tmc crash metadata.
  *		 Used by ETR/ETF.
+ * @etr_buf_list: List that is used to manage allocated etr_buf.
+ * @reading_node: Available buffer_node for byte-cntr reading.
  */
 struct tmc_drvdata {
 	struct clk		*atclk;
@@ -273,6 +288,8 @@ struct tmc_drvdata {
 	struct etr_buf		*perf_buf;
 	struct tmc_resrv_buf	resrv_buf;
 	struct tmc_resrv_buf	crash_mdata;
+	struct list_head        etr_buf_list;
+	struct etr_buf_node     *reading_node;
 };
 
 struct etr_buf_operations {
@@ -445,5 +462,7 @@ struct etr_buf *tmc_etr_get_buffer(struct coresight_device *csdev,
 				   enum cs_mode mode,
 				   struct coresight_path *path);
 extern const struct attribute_group coresight_etr_group;
+void tmc_clean_etr_buf_list(struct tmc_drvdata *drvdata);
+int tmc_create_etr_buf_list(struct tmc_drvdata *drvdata, int num_nodes);
 
 #endif

-- 
2.34.1


